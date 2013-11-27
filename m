Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE6B36D86B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 09:24:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAR9Ojp6009580
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 01:24:45 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 27 Nov 2013 01:24:44 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Nov 2013 17:24:43 +0800
Message-ID: <1385544283-22207-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] file: remove useless patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Nov 2013 09:24:47 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

no user uses these two patches

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/file/file/ge-le.patch        |   72 --------------------
 .../file/file/stringb-compat.patch                 |   31 ---------
 2 files changed, 103 deletions(-)
 delete mode 100644 meta/recipes-devtools/file/file/ge-le.patch
 delete mode 100644 meta/recipes-devtools/file/file/stringb-compat.patch

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
-- 
1.7.10.4


