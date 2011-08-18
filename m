Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1QtssK-0002bX-O1
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 05:02:32 +0200
Received: by gwb11 with SMTP id 11so645859gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 19:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=u982c5V7a6JRpZhCbUv6D+/wsamflspbw6xs2GGBp2Q=;
	b=Mz9IDgdtPXyLbrsTF3KKAIVb4FiVYsqCw9mqI0ctoxlwJ6M+F9pyfPmL1yrcj01vpg
	3iKAEkLGzy/92ksEVSSIeh+B7+Mf5Sp0tgWVFpfu0OLKiT3C//s2uSpq9RE1K9E5DdS3
	eFsSMFcx4zeAM9H28+qAzxvxvAgANSsyCWHas=
Received: by 10.150.238.2 with SMTP id l2mr223854ybh.44.1313636273156;
	Wed, 17 Aug 2011 19:57:53 -0700 (PDT)
Received: from localhost.localdomain ([189.169.224.175])
	by mx.google.com with ESMTPS id o2sm491821yhl.15.2011.08.17.19.57.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Aug 2011 19:57:52 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2011 21:57:41 -0500
Message-Id: <1313636261-5074-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH][v2] file: new file version 5.07
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
X-List-Received-Date: Thu, 18 Aug 2011 03:02:33 -0000

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
 meta/recipes-devtools/file/file_5.04.bb            |   39 -----------
 meta/recipes-devtools/file/file_5.07.bb            |   36 ++++++++++
 4 files changed, 36 insertions(+), 142 deletions(-)
 delete mode 100644 meta/recipes-devtools/file/file/ge-le.patch
 delete mode 100644 meta/recipes-devtools/file/file/stringb-compat.patch
 delete mode 100644 meta/recipes-devtools/file/file_5.04.bb
 create mode 100644 meta/recipes-devtools/file/file_5.07.bb

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
diff --git a/meta/recipes-devtools/file/file_5.04.bb b/meta/recipes-devtools/file/file_5.04.bb
deleted file mode 100644
index 1f9c78e..0000000
--- a/meta/recipes-devtools/file/file_5.04.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "File classification tool"
-DESCRIPTION = "File attempts to classify files depending \
-on their contents and prints a description if a match is found."
-HOMEPAGE = "http://www.darwinsys.com/file/"
-SECTION = "console/utils"
-
-# two clause BSD
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03188"
-
-DEPENDS = "zlib file-native"
-DEPENDS_virtclass-native = "zlib-native"
-PR = "r2"
-
-SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
-           file://stringb-compat.patch \
-           file://ge-le.patch \
-           file://dump \
-           file://filesystems"
-
-SRC_URI[md5sum] = "accade81ff1cc774904b47c72c8aeea0"
-SRC_URI[sha256sum] = "4c9e6e7994e74cb3386374ae91b055d26ac96b9d3e82fd157ae2d62e87a4260c"
-
-inherit autotools
-
-do_configure_prepend() {
-	cp ${WORKDIR}/dump ${S}/magic/Magdir/
-	cp ${WORKDIR}/filesystems ${S}/magic/Magdir/
-}
-
-FILES_${PN} += "${datadir}/misc/*.mgc"
-
-do_install_append_virtclass-native() {
-	create_cmdline_wrapper ${D}/${bindir}/file \
-		--magic-file ${datadir}/misc/magic.mgc
-}
-
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/file/file_5.07.bb b/meta/recipes-devtools/file/file_5.07.bb
new file mode 100644
index 0000000..9b5b51f
--- /dev/null
+++ b/meta/recipes-devtools/file/file_5.07.bb
@@ -0,0 +1,36 @@
+SUMMARY = "File classification tool"
+DESCRIPTION = "File attempts to classify files depending \
+on their contents and prints a description if a match is found."
+HOMEPAGE = "http://www.darwinsys.com/file/"
+SECTION = "console/utils"
+
+# two clause BSD
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03188"
+
+DEPENDS = "zlib file-native"
+DEPENDS_virtclass-native = "zlib-native"
+PR = "r0"
+
+SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
+           file://dump \
+           file://filesystems"
+
+SRC_URI[md5sum] = "b8d1f9a8a644067bd0a703cebf3f4858"
+SRC_URI[sha256sum] = "c968bfe97d87f9f564728a894d57be2c6bba9a2006763fffff85c5f72a9a3c2f"
+
+inherit autotools
+
+do_configure_prepend() {
+	cp ${WORKDIR}/dump ${S}/magic/Magdir/
+	cp ${WORKDIR}/filesystems ${S}/magic/Magdir/
+}
+
+FILES_${PN} += "${datadir}/misc/*.mgc"
+
+do_install_append_virtclass-native() {
+	create_cmdline_wrapper ${D}/${bindir}/file \
+		--magic-file ${datadir}/misc/magic.mgc
+}
+
+BBCLASSEXTEND = "native"
-- 
1.7.6



