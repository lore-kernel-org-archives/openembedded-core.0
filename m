Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 164477D6B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 05:24:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,299,1569254400"; d="scan'208";a="78394836"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Nov 2019 13:24:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 282B84CE1A0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 13:16:31 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 13 Nov 2019 13:24:39 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2019 13:25:13 +0800
Message-ID: <20191113052513.4943-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 282B84CE1A0C.A8D4A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libedit:upgrade 20190324 -> 20191025
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
X-List-Received-Date: Wed, 13 Nov 2019 05:24:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-libedit/0001-readline.c-fix-cannot-get-history.patch
Removed since this is included in 20191025-3.1.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...01-readline.c-fix-cannot-get-history.patch | 34 -------------------
 ...0190324-3.1.bb => libedit_20191025-3.1.bb} |  5 ++-
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/libedit/libedit/0001-readline.c-fix-cannot-get-history.patch
 rename meta/recipes-devtools/libedit/{libedit_20190324-3.1.bb => libedit_20191025-3.1.bb} (70%)

diff --git a/meta/recipes-devtools/libedit/libedit/0001-readline.c-fix-cannot-get-history.patch b/meta/recipes-devtools/libedit/libedit/0001-readline.c-fix-cannot-get-history.patch
deleted file mode 100644
index 7e54ac97ea..0000000000
--- a/meta/recipes-devtools/libedit/libedit/0001-readline.c-fix-cannot-get-history.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ef1fa9bef497d9491a51017f3cad0135a23bb0b4 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 20 Aug 2019 17:33:15 +0800
-Subject: [PATCH] readline.c: fix cannot get history
-
-if history_offset not increate when add history,
-it will make current history event not align with offset,
-and cannot get history correctly.
-
-Upstream-Status: Submitted [tech-userlevel@NetBSD.org] 
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/readline.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/readline.c b/src/readline.c
-index 43ac5bd..54b0548 100644
---- a/src/readline.c
-+++ b/src/readline.c
-@@ -1476,7 +1476,10 @@ add_history(const char *line)
- 	if (ev.num == history_length)
- 		history_base++;
- 	else
-+        {
-+                history_offset++;
- 		history_length = ev.num;
-+        }
- 	return 0;
- }
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb b/meta/recipes-devtools/libedit/libedit_20191025-3.1.bb
similarity index 70%
rename from meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20191025-3.1.bb
index 25667ccce7..f810013a68 100644
--- a/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20191025-3.1.bb
@@ -12,9 +12,8 @@ inherit autotools
 
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
-           file://0001-readline.c-fix-cannot-get-history.patch \
           "
-SRC_URI[md5sum] = "bec755c8044ad84b752dfe49a0b371d8"
-SRC_URI[sha256sum] = "ac8f0f51c1cf65492e4d1e3ed2be360bda41e54633444666422fbf393bba1bae"
+SRC_URI[md5sum] = "2d6568467080cfd75e715d045102b544"
+SRC_URI[sha256sum] = "6dff036660d478bfaa14e407fc5de26d22da1087118c897b1a3ad2e90cb7bf39"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1




