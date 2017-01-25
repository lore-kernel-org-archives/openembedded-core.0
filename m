Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96E71605FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 05:41:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0P5fDUh015570
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 21:41:14 -0800
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 24 Jan 2017 21:41:13 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jan 2017 13:40:37 +0800
Message-ID: <1485322837-260448-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH v2] openssh: Security Advisory - openssh - CVE-2016-10010
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
X-List-Received-Date: Wed, 25 Jan 2017 05:41:14 -0000
Content-Type: text/plain

sshd in OpenSSH before 7.4, when privilege separation is not used,
creates forwarded Unix-domain sockets as root, which might allow
local users to gain privileges via unspecified vectors, related to
serverloop.c.

Porting patch from <https://github.com/openbsd/src/commit/
c76fac666ea038753294f2ac94d310f8adece9ce> to solve CVE-2016-10010.
Adapted the patch to solve context issues.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../openssh/openssh/openssh-CVE-2016-10010.patch   | 38 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.3p1.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-CVE-2016-10010.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2016-10010.patch b/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2016-10010.patch
new file mode 100644
index 0000000..cbfcf87
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2016-10010.patch
@@ -0,0 +1,38 @@
+From e86492668e4005eb3b20ba827a7e8474f2888e7e Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Wed, 25 Jan 2017 11:01:10 +0800
+Subject: [PATCH] openssh: disable Unix-domain socket forwarding when privsep
+ is disabled
+
+Upstream-Status: Backport
+CVE: CVE-2016-10010
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ serverloop.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/serverloop.c b/serverloop.c
+index 3563e5d..233de42 100644
+--- a/serverloop.c
++++ b/serverloop.c
+@@ -999,7 +999,7 @@ server_request_direct_streamlocal(void)
+ 
+ 	/* XXX fine grained permissions */
+ 	if ((options.allow_streamlocal_forwarding & FORWARD_LOCAL) != 0 &&
+-	    !no_port_forwarding_flag) {
++	    !no_port_forwarding_flag && use_privsep) {
+ 		c = channel_connect_to_path(target,
+ 		    "direct-streamlocal@openssh.com", "direct-streamlocal");
+ 	} else {
+@@ -1280,7 +1280,7 @@ server_input_global_request(int type, u_int32_t seq, void *ctxt)
+ 
+ 		/* check permissions */
+ 		if ((options.allow_streamlocal_forwarding & FORWARD_REMOTE) == 0
+-		    || no_port_forwarding_flag) {
++		    || no_port_forwarding_flag || !use_privsep) {
+ 			success = 0;
+ 			packet_send_debug("Server has disabled port forwarding.");
+ 		} else {
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_7.3p1.bb b/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
index 94eb0ed..522bda6 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://fix-CVE-2016-8858.patch \
+           file://openssh-CVE-2016-10010.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
-- 
1.9.1


