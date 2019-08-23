Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 891397F26C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 01:56:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7N1tJRA021109
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 18:56:06 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 22 Aug 2019 18:55:46 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Aug 2019 09:55:45 +0800
Message-ID: <1566525345-269093-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libedit: fix failed to get history
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
X-List-Received-Date: Fri, 23 Aug 2019 01:56:15 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Reproduce steps:
run fileman under examples, history command not work,
nothing is output.

Fix by increase history_offset when add history, if not,
it will make current history event not align with offset,
and cannot get history correctly.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-readline.c-fix-cannot-get-history.patch   | 34 ++++++++++++++++++++++
 .../libedit/libedit_20190324-3.1.bb                |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/libedit/libedit/0001-readline.c-fix-cannot-get-history.patch

diff --git a/meta/recipes-devtools/libedit/libedit/0001-readline.c-fix-cannot-get-history.patch b/meta/recipes-devtools/libedit/libedit/0001-readline.c-fix-cannot-get-history.patch
new file mode 100644
index 0000000..7e54ac9
--- /dev/null
+++ b/meta/recipes-devtools/libedit/libedit/0001-readline.c-fix-cannot-get-history.patch
@@ -0,0 +1,34 @@
+From ef1fa9bef497d9491a51017f3cad0135a23bb0b4 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 20 Aug 2019 17:33:15 +0800
+Subject: [PATCH] readline.c: fix cannot get history
+
+if history_offset not increate when add history,
+it will make current history event not align with offset,
+and cannot get history correctly.
+
+Upstream-Status: Submitted [tech-userlevel@NetBSD.org] 
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/readline.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/readline.c b/src/readline.c
+index 43ac5bd..54b0548 100644
+--- a/src/readline.c
++++ b/src/readline.c
+@@ -1476,7 +1476,10 @@ add_history(const char *line)
+ 	if (ev.num == history_length)
+ 		history_base++;
+ 	else
++        {
++                history_offset++;
+ 		history_length = ev.num;
++        }
+ 	return 0;
+ }
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb b/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
index 6a599eb..8585541 100644
--- a/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
@@ -14,6 +14,7 @@ inherit autotools
 FETCHCMD_wget += "-U bitbake"
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
+           file://0001-readline.c-fix-cannot-get-history.patch \
           "
 SRC_URI[md5sum] = "bec755c8044ad84b752dfe49a0b371d8"
 SRC_URI[sha256sum] = "ac8f0f51c1cf65492e4d1e3ed2be360bda41e54633444666422fbf393bba1bae"
-- 
2.7.4


