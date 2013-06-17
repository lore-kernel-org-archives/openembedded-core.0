Return-Path: <Sen.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 553E660667
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 08:47:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5H8l0YI018174
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 01:47:00 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 17 Jun 2013 01:47:00 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 16:49:13 +0800
Message-ID: <1371458953-11658-1-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH] rt-tests: fix error check in hackbench
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
X-List-Received-Date: Mon, 17 Jun 2013 08:47:00 -0000
Content-Type: text/plain

Add a patch to fix when an unsigned number is taken as a negative error
code.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 .../rt-tests/files/hackbench-fix-error-check.patch | 41 ++++++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests.inc              |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-rt/rt-tests/files/hackbench-fix-error-check.patch

diff --git a/meta/recipes-rt/rt-tests/files/hackbench-fix-error-check.patch b/meta/recipes-rt/rt-tests/files/hackbench-fix-error-check.patch
new file mode 100644
index 0000000..d17fdff
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/hackbench-fix-error-check.patch
@@ -0,0 +1,41 @@
+childinfo_t is a union that contains both signed (error) and unsigned
+(threadid) members. Thus a large threadid could appear as a negative error
+value, which will cause unexpected failures.
+
+childinfo_t should be changed to a struct, but it could potentially affect the
+performance. So we keep it as a union but only check error against -1. There is
+still a chance of false alarm but it's small.
+
+Upstream-Status: Pending
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
+---
+ src/hackbench/hackbench.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/hackbench/hackbench.c b/src/hackbench/hackbench.c
+index 8baeb23..dc0de8f 100644
+--- a/src/hackbench/hackbench.c
++++ b/src/hackbench/hackbench.c
+@@ -317,7 +317,7 @@ static unsigned int group(childinfo_t *child,
+ 		ctx->wakefd = wakefd;
+ 
+ 		child[tab_offset+i] = create_worker(ctx, (void *)(void *)receiver);
+-		if( child[tab_offset+i].error < 0 ) {
++		if( child[tab_offset+i].error == -1 ) {
+ 			return (i > 0 ? i-1 : 0);
+ 		}
+ 		snd_ctx->out_fds[i] = fds[1];
+@@ -332,7 +332,7 @@ static unsigned int group(childinfo_t *child,
+ 		snd_ctx->num_fds = num_fds;
+ 
+ 		child[tab_offset+num_fds+i] = create_worker(snd_ctx, (void *)(void *)sender);
+-		if( child[tab_offset+num_fds+i].error < 0 ) {
++		if( child[tab_offset+num_fds+i].error == -1 ) {
+ 			return (num_fds+i)-1;
+ 		}
+ 	}
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 3ae7602..91e5028 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -8,6 +8,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git
            file://0002-rt-tests-Break-out-install_hwlatdetect.patch \
            file://added-missing-dependencies.patch \
            file://cyclictest-finish-removal-of-1-second-first-loops.patch \
+           file://hackbench-fix-error-check.patch \
 "
 
 INC_PR = "r2"
-- 
1.7.11.7


