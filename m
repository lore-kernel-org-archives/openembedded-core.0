Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6CED36098F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 21:10:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4TLAGx0013761
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 14:10:16 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 29 May 2013 14:10:16 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 16:16:26 -0500
Message-ID: <1369862187-29613-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1369862187-29613-1-git-send-email-mark.hatle@windriver.com>
References: <1369862187-29613-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 15/21 v2] libnl: fix two parentheses bugs in lib/cache_mngr.c file
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
X-List-Received-Date: Wed, 29 May 2013 21:10:15 -0000
Content-Type: text/plain

From: "Song.Li" <Song.Li@windriver.com>

there are two parentheses bugs in libnl /lib/cache_mngr.c file.
The parentheses doesn't make any sense,
This will cause the variable err get a bool value,
the correct value of variable err should be the return value
of the function which can be any integer value.

Signed-off-by: Song Li <Song.Li@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 ...fix-lib-cache_mngr.c-two-parentheses-bugs.patch | 37 ++++++++++++++++++++++
 meta/recipes-support/libnl/libnl_3.2.22.bb         |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libnl/libnl/fix-lib-cache_mngr.c-two-parentheses-bugs.patch

diff --git a/meta/recipes-support/libnl/libnl/fix-lib-cache_mngr.c-two-parentheses-bugs.patch b/meta/recipes-support/libnl/libnl/fix-lib-cache_mngr.c-two-parentheses-bugs.patch
new file mode 100644
index 0000000..6b8fa10
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/fix-lib-cache_mngr.c-two-parentheses-bugs.patch
@@ -0,0 +1,37 @@
+From 82fdf49c185fd5f3810781af9ef52aa6a52bf2df Mon Sep 17 00:00:00 2001
+From: "Song.Li" <Song.Li@windriver.com>
+Date: Thu, 28 Jun 2012 20:03:17 +0800
+Subject: [PATCH] fix lib/cache_mngr.c two parentheses bugs
+
+there are two parentheses bugs in libnl /lib/cache_mngr.c file.
+The parentheses doesn't make any sense,
+This will cause the variable err get a bool value,
+the correct value of variable err should be the return value
+of the function which can be any integer value.
+
+---
+ lib/cache_mngr.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Upstream-status: Pending
+
+diff --git a/lib/cache_mngr.c b/lib/cache_mngr.c
+index dae8768..57cc1f9 100644
+--- a/lib/cache_mngr.c
++++ b/lib/cache_mngr.c
+@@ -150,10 +150,10 @@ int nl_cache_mngr_alloc(struct nl_sock *sk, int protocol, int flags,
+ 	/* Required to receive async event notifications */
+ 	nl_socket_disable_seq_check(mngr->cm_sock);
+ 
+-	if ((err = nl_connect(mngr->cm_sock, protocol) < 0))
++	if ((err = nl_connect(mngr->cm_sock, protocol)) < 0)
+ 		goto errout;
+ 
+-	if ((err = nl_socket_set_nonblocking(mngr->cm_sock) < 0))
++	if ((err = nl_socket_set_nonblocking(mngr->cm_sock)) < 0)
+ 		goto errout;
+ 
+ 	NL_DBG(1, "Allocated cache manager %p, protocol %d, %d caches\n",
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/libnl/libnl_3.2.22.bb b/meta/recipes-support/libnl/libnl_3.2.22.bb
index 36e98e1..30f85b2 100644
--- a/meta/recipes-support/libnl/libnl_3.2.22.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.22.bb
@@ -11,7 +11,8 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
-           file://fix-pc-file.patch "
+           file://fix-pc-file.patch \
+           file://fix-lib-cache_mngr.c-two-parentheses-bugs.patch"
 
 SRC_URI[md5sum] = "2e1c889494d274aca24ce5f6a748e66e"
 SRC_URI[sha256sum] = "c7c5f267dfeae0c1a530bf96b71fb7c8dbbb07d54beef49b6712d8d6166f629b"
-- 
1.8.1.2.545.g2f19ada


