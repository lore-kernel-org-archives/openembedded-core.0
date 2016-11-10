Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB48B60103
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 07:08:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAA78RH1028510
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2016 23:08:27 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 9 Nov 2016 23:08:26 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2016 15:01:23 +0800
Message-ID: <4706e664d86c244110e0e08a08e673cbce2c2139.1478760924.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478760924.git.kai.kang@windriver.com>
References: <cover.1478760924.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] openssh: fix CVE-2016-8858
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
X-List-Received-Date: Thu, 10 Nov 2016 07:08:26 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2016-8858 of openssh.

Ref:
https://bugzilla.redhat.com/show_bug.cgi?id=1384860

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../openssh/openssh/fix-CVE-2016-8858.patch        | 39 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.3p1.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-8858.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-8858.patch b/meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-8858.patch
new file mode 100644
index 0000000..b26ee81
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-8858.patch
@@ -0,0 +1,39 @@
+Fix CVE-2016-8858 of openssh
+
+Backport patch from upstream and drop the change of comment which can NOT be applied.
+
+Upstream-Status: Backport [ https://anongit.mindrot.org/openssh.git/commit/?id=ec165c3 ]
+CVE: CVE-2016-8858
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From ec165c392ca54317dbe3064a8c200de6531e89ad Mon Sep 17 00:00:00 2001
+From: "markus@openbsd.org" <markus@openbsd.org>
+Date: Mon, 10 Oct 2016 19:28:48 +0000
+Subject: [PATCH] upstream commit
+
+Unregister the KEXINIT handler after message has been
+received. Otherwise an unauthenticated peer can repeat the KEXINIT and cause
+allocation of up to 128MB -- until the connection is closed. Reported by
+shilei-c at 360.cn
+
+Upstream-ID: 43649ae12a27ef94290db16d1a98294588b75c05
+---
+ kex.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/kex.c b/kex.c
+index 3f97f8c..6a94bc5 100644
+--- a/kex.c
++++ b/kex.c
+@@ -481,6 +481,7 @@ kex_input_kexinit(int type, u_int32_t seq, void *ctxt)
+ 	if (kex == NULL)
+ 		return SSH_ERR_INVALID_ARGUMENT;
+ 
++	ssh_dispatch_set(ssh, SSH2_MSG_KEXINIT, NULL);
+ 	ptr = sshpkt_ptr(ssh, &dlen);
+ 	if ((r = sshbuf_put(kex->peer, ptr, dlen)) != 0)
+ 		return r;
+-- 
+2.10.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_7.3p1.bb b/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
index 039b0ff..94eb0ed 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
            file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
+           file://fix-CVE-2016-8858.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
-- 
2.10.1


