Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 91EDD75E2D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 07:10:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9I7A3v9027572
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Oct 2019 00:10:03 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 18 Oct 2019 00:10:03 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 18 Oct 2019 15:10:01 +0800
Message-ID: <1571382601-18374-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssh: fix CVE-2019-16905
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
X-List-Received-Date: Fri, 18 Oct 2019 07:10:03 -0000
Content-Type: text/plain

Backport a patch from upstream to fix CVE-2019-16905
https://github.com/openssh/openssh-portable/commit/a546b17bbaeb12beac4c9aeed56f74a42b18a93a

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...x-integer-overflow-in-XMSS-private-key-pa.patch | 40 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_8.0p1.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch b/meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch
new file mode 100644
index 0000000..3265be3
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch
@@ -0,0 +1,40 @@
+From 2014fad3d28090b59d2f8a0971166c06e5fa6da6 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 18 Oct 2019 14:56:58 +0800
+Subject: [PATCH] upstream: fix integer overflow in XMSS private key parsing.
+
+Reported by Adam Zabrocki via SecuriTeam's SSH program.
+
+Note that this code is experimental and not compiled by default.
+
+ok markus@
+
+OpenBSD-Commit-ID: cd0361896d15e8a1bac495ac583ff065ffca2be1
+
+Signed-off-by: "djm@openbsd.org" <djm@openbsd.org>
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/a546b17bbaeb12beac4c9aeed56f74a42b18a93a]
+CVE: CVE-2019-16905
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ sshkey-xmss.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/sshkey-xmss.c b/sshkey-xmss.c
+index aaae702..c57681a 100644
+--- a/sshkey-xmss.c
++++ b/sshkey-xmss.c
+@@ -977,7 +977,8 @@ sshkey_xmss_decrypt_state(const struct sshkey *k, struct sshbuf *encoded,
+ 		goto out;
+ 	}
+ 	/* check that an appropriate amount of auth data is present */
+-	if (sshbuf_len(encoded) < encrypted_len + authlen) {
++	if (sshbuf_len(encoded) < authlen ||
++	    sshbuf_len(encoded) - authlen < encrypted_len) {
+ 		r = SSH_ERR_INVALID_FORMAT;
+ 		goto out;
+ 	}
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
index 01eaecd..2ffbc9a 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch \
            "
 SRC_URI[md5sum] = "bf050f002fe510e1daecd39044e1122d"
 SRC_URI[sha256sum] = "bd943879e69498e8031eb6b7f44d08cdc37d59a7ab689aa0b437320c3481fd68"
-- 
2.7.4


