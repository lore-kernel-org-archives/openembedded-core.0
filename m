Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9iD-0006xt-FA
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:01:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980412"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:51 -0700
Message-Id: <e5c3aefad325a47211d9130d163258526377aa02.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 32/32] file: new file version 5.07
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Aug 2011 21:01:13 -0000

From: Adrian Alonso <aalonso00@gmail.com>

* file version 5.07 also prevents magic file mistmatch
  in Fedora 15
* related to bug 1358.
  http://bugzilla.pokylinux.org/show_bug.cgi?id=1358
* v2 remove previous file version 5.04
  remove unused patchs

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 meta/recipes-devtools/file/file/ge-le.patch        |   72 --------------------
 .../file/file/stringb-compat.patch                 |   31 ---------
 .../file/{file_5.04.bb => file_5.07.bb}            |    9 +--
 3 files changed, 3 insertions(+), 109 deletions(-)
 delete mode 100644 meta/recipes-devtools/file/file/ge-le.patch
 delete mode 100644 meta/recipes-devtools/file/file/stringb-compat.patch
 rename meta/recipes-devtools/file/{file_5.04.bb => file_5.07.bb} (79%)

diff --git a/meta/recipes-devtools/file/file/ge-le.patch b/meta/recipes-devtools/file/file/ge-le.patch
deleted file mode 100644
index fb7d671..0000000
--- a/meta/recipes-devtools/file/file/ge-le.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Upstream-Status: Pending
-
-`>=' and `<=' was silently ignored in previous version,
-but causes an warning in file 5.04. Add support for these
-two operators as a feature extension, however, users should
-not rely on them.
-
-8/17/2010 - created by Qing He <qing.he@intel.com>
-
-diff --git a/src/apprentice.c b/src/apprentice.c
-index 3d4c3cf..a2b86ed 100644
---- a/src/apprentice.c
-+++ b/src/apprentice.c
-@@ -1396,11 +1396,10 @@ parse(struct magic_set *ms, struct magic_entry **mentryp, uint32_t *nmentryp,
-   		m->reln = *l;
-   		++l;
- 		if (*l == '=') {
--			if (ms->flags & MAGIC_CHECK) {
--				file_magwarn(ms, "%c= not supported",
--				    m->reln);
--				return -1;
--			}
-+		    if (m->reln == '>')
-+			m->reln = 'g';
-+		    else if (m->reln == '<')
-+			m->reln = 'l';
- 		   ++l;
- 		}
- 		break;
-diff --git a/src/softmagic.c b/src/softmagic.c
-index d8a5675..1648e43 100644
---- a/src/softmagic.c
-+++ b/src/softmagic.c
-@@ -1955,6 +1955,38 @@ magiccheck(struct magic_set *ms, struct magic *m)
- 		}
- 		break;
- 
-+	case 'g':
-+		if (m->flag & UNSIGNED) {
-+			matched = v >= l;
-+			if ((ms->flags & MAGIC_DEBUG) != 0)
-+				(void) fprintf(stderr, "%llu >= %llu = %d\n",
-+				    (unsigned long long)v,
-+				    (unsigned long long)l, matched);
-+		}
-+		else {
-+			matched = (int64_t) v >= (int64_t) l;
-+			if ((ms->flags & MAGIC_DEBUG) != 0)
-+				(void) fprintf(stderr, "%lld >= %lld = %d\n",
-+				    (long long)v, (long long)l, matched);
-+		}
-+		break;
-+
-+	case 'l':
-+		if (m->flag & UNSIGNED) {
-+			matched = v <= l;
-+			if ((ms->flags & MAGIC_DEBUG) != 0)
-+				(void) fprintf(stderr, "%llu <= %llu = %d\n",
-+				    (unsigned long long)v,
-+				    (unsigned long long)l, matched);
-+		}
-+		else {
-+			matched = (int64_t) v <= (int64_t) l;
-+			if ((ms->flags & MAGIC_DEBUG) != 0)
-+				(void) fprintf(stderr, "%lld <= %lld = %d\n",
-+				       (long long)v, (long long)l, matched);
-+		}
-+		break;
-+
- 	case '&':
- 		matched = (v & l) == l;
- 		if ((ms->flags & MAGIC_DEBUG) != 0)
diff --git a/meta/recipes-devtools/file/file/stringb-compat.patch b/meta/recipes-devtools/file/file/stringb-compat.patch
deleted file mode 100644
index 8aba31e..0000000
--- a/meta/recipes-devtools/file/file/stringb-compat.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Pending
-
-`B' in file 4.x has the same meaning with `W' in file 5,
-let `B' be an alias of `W'.
-
-8/17/2010 - created by Qing He <qing.he@intel.com>
-
-diff --git a/src/apprentice.c b/src/apprentice.c
-index 58826c3..3d4c3cf 100644
---- a/src/apprentice.c
-+++ b/src/apprentice.c
-@@ -1340,6 +1340,7 @@ parse(struct magic_set *ms, struct magic_entry **mentryp, uint32_t *nmentryp,
- 						    "zero range");
- 					l = t - 1;
- 					break;
-+				case CHAR_COMPACT_BLANK:
- 				case CHAR_COMPACT_WHITESPACE:
- 					m->str_flags |= STRING_COMPACT_WHITESPACE;
- 					break;
-diff --git a/src/file.h b/src/file.h
-index c07f2d4..42cf416 100644
---- a/src/file.h
-+++ b/src/file.h
-@@ -282,6 +282,7 @@ struct magic {
- #define STRING_TEXTTEST				BIT(5)
- #define STRING_BINTEST				BIT(6)
- #define CHAR_COMPACT_WHITESPACE			'W'
-+#define CHAR_COMPACT_BLANK			'B'
- #define CHAR_COMPACT_OPTIONAL_WHITESPACE	'w'
- #define CHAR_IGNORE_LOWERCASE			'c'
- #define CHAR_IGNORE_UPPERCASE			'C'
diff --git a/meta/recipes-devtools/file/file_5.04.bb b/meta/recipes-devtools/file/file_5.07.bb
similarity index 79%
rename from meta/recipes-devtools/file/file_5.04.bb
rename to meta/recipes-devtools/file/file_5.07.bb
index 1f9c78e..9b5b51f 100644
--- a/meta/recipes-devtools/file/file_5.04.bb
+++ b/meta/recipes-devtools/file/file_5.07.bb
@@ -10,16 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03
 
 DEPENDS = "zlib file-native"
 DEPENDS_virtclass-native = "zlib-native"
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
-           file://stringb-compat.patch \
-           file://ge-le.patch \
            file://dump \
            file://filesystems"
 
-SRC_URI[md5sum] = "accade81ff1cc774904b47c72c8aeea0"
-SRC_URI[sha256sum] = "4c9e6e7994e74cb3386374ae91b055d26ac96b9d3e82fd157ae2d62e87a4260c"
+SRC_URI[md5sum] = "b8d1f9a8a644067bd0a703cebf3f4858"
+SRC_URI[sha256sum] = "c968bfe97d87f9f564728a894d57be2c6bba9a2006763fffff85c5f72a9a3c2f"
 
 inherit autotools
 
@@ -35,5 +33,4 @@ do_install_append_virtclass-native() {
 		--magic-file ${datadir}/misc/magic.mgc
 }
 
-
 BBCLASSEXTEND = "native"
-- 
1.7.6



