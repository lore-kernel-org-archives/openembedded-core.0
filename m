Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E03827C434
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 03:40:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5S3ehmN014800
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 20:40:43 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 27 Jun 2019 20:40:42 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2019 11:22:56 +0800
Message-ID: <1561692176-19265-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] bc: dc: fix exit code of q command
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
X-List-Received-Date: Fri, 28 Jun 2019 03:40:42 -0000
Content-Type: text/plain

The exit code for "echo q | dc" is 1 for dc-1.4.1;
while the exit code for "echo q | dc" is 0 for dc-1.4.

Here is the answer from ken@gnu.org:
dc-1.4 was right.  There was a rewrite of a chunk of code for 1.4.1 to
fix a corner case in the Q command, and somehow the placement of the
clean-up label for the 'q' command got misplaced on the error-handling
branch instead of the clean-exit branch.  The patch below fixes this
(it is committed for whenever the next bc/dc release gets made).

Thanks for the report,
        --Ken Pizzini

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../bc/bc/0001-dc-fix-exit-code-of-q-command.patch | 44 ++++++++++++++++++++++
 meta/recipes-extended/bc/bc_1.07.1.bb              |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bc/bc/0001-dc-fix-exit-code-of-q-command.patch

diff --git a/meta/recipes-extended/bc/bc/0001-dc-fix-exit-code-of-q-command.patch b/meta/recipes-extended/bc/bc/0001-dc-fix-exit-code-of-q-command.patch
new file mode 100644
index 0000000..2acd218
--- /dev/null
+++ b/meta/recipes-extended/bc/bc/0001-dc-fix-exit-code-of-q-command.patch
@@ -0,0 +1,44 @@
+From e174b6e7d195d5a7465575641b7f68581f162574 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Thu, 27 Jun 2019 13:10:47 +0800
+Subject: [PATCH] dc: fix exit code of q command
+
+The exit code for "echo q | dc" is 1 for dc-1.4.1;
+while the exit code for "echo q | dc" is 0 for dc-1.4.
+
+Here is the answer from ken@gnu.org:
+dc-1.4 was right.  There was a rewrite of a chunk of code for 1.4.1 to
+fix a corner case in the Q command, and somehow the placement of the
+clean-up label for the 'q' command got misplaced on the error-handling
+branch instead of the clean-exit branch.  The patch below fixes this
+(it is committed for whenever the next bc/dc release gets made).
+
+Thanks for the report,
+        --Ken Pizzini
+
+Upstream-Status: Pending [Got the solution from maintainer]
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ dc/eval.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dc/eval.c b/dc/eval.c
+index 05a3d9e..bcab8db 100644
+--- a/dc/eval.c
++++ b/dc/eval.c
+@@ -814,10 +814,10 @@ error_fail:
+ 	fprintf(stderr, "%s: ", progname);
+ 	perror("error reading input");
+ 	return DC_FAIL;
+-reset_and_exit_quit:
+ reset_and_exit_fail:
+ 	signal(SIGINT, sigint_default);
+ 	return DC_FAIL;
++reset_and_exit_quit:
+ reset_and_exit_success:
+ 	signal(SIGINT, sigint_default);
+ 	return DC_SUCCESS;
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index 809b864..4a51302 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -13,7 +13,8 @@ DEPENDS = "flex-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://no-gen-libmath.patch \
-           file://libmath.h"
+           file://libmath.h \
+           file://0001-dc-fix-exit-code-of-q-command.patch"
 SRC_URI[md5sum] = "cda93857418655ea43590736fc3ca9fc"
 SRC_URI[sha256sum] = "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
 
-- 
1.9.1


