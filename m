Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 586A86A4A9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 07:02:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5E72t9c009974
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 00:02:55 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 14 Jun 2013 00:02:55 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Jun 2013 15:02:51 +0800
Message-ID: <d0ff2357f86ead0883b65dfbeba95a97f5a9a4d1.1371186230.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371186230.git.rongqing.li@windriver.com>
References: <cover.1371186230.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] openssh: fix a unaligned memory access issue
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
X-List-Received-Date: Fri, 14 Jun 2013 07:02:54 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Backport patch to fix segment fault due to unaligned memory access

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../openssh/openssh-6.2p2/mac.patch                |   76 ++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.2p2.bb |    1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.2p2/mac.patch

diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/mac.patch b/meta/recipes-connectivity/openssh/openssh-6.2p2/mac.patch
new file mode 100644
index 0000000..69fb69d
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/mac.patch
@@ -0,0 +1,76 @@
+[PATCH] force the MAC output to be 64-bit aligned
+
+Upstream-Status: Backport[anoncvs.mindrot.org/index.cgi/openssh/mac.c?r1=1.27&r2=1.28]
+
+Backport patch to fix segment fault due to unaligned memory access
+
+Wed Jun 5 22:12:37 2013 UTC (7 days, 3 hours ago) by dtucker
+Branch: MAIN
+CVS Tags: HEAD
+Changes since 1.27: +11 -8 lines
+Diff to previous 1.27
+
+   - dtucker@cvs.openbsd.org 2013/06/03 00:03:18
+     [mac.c]
+     force the MAC output to be 64-bit aligned so umac won't see
+unaligned
+     accesses on strict-alignment architectures.  bz#2101, patch from
+     tomas.kuthan at oracle.com, ok djm@
+---
+ mac.c |   18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/mac.c b/mac.c
+index 3f2dc6f..a5a80d3 100644
+--- a/mac.c
++++ b/mac.c
+@@ -152,12 +152,16 @@ mac_init(Mac *mac)
+ u_char *
+ mac_compute(Mac *mac, u_int32_t seqno, u_char *data, int datalen)
+ {
+-	static u_char m[EVP_MAX_MD_SIZE];
++	static union {
++		u_char m[EVP_MAX_MD_SIZE];
++		u_int64_t for_align;
++	} u;
++
+ 	u_char b[4], nonce[8];
+ 
+-	if (mac->mac_len > sizeof(m))
++	if (mac->mac_len > sizeof(u))
+ 		fatal("mac_compute: mac too long %u %lu",
+-		    mac->mac_len, (u_long)sizeof(m));
++		    mac->mac_len, (u_long)sizeof(u));
+ 
+ 	switch (mac->type) {
+ 	case SSH_EVP:
+@@ -166,22 +170,22 @@ mac_compute(Mac *mac, u_int32_t seqno, u_char *data, int datalen)
+ 		HMAC_Init(&mac->evp_ctx, NULL, 0, NULL);
+ 		HMAC_Update(&mac->evp_ctx, b, sizeof(b));
+ 		HMAC_Update(&mac->evp_ctx, data, datalen);
+-		HMAC_Final(&mac->evp_ctx, m, NULL);
++		HMAC_Final(&mac->evp_ctx, u.m, NULL);
+ 		break;
+ 	case SSH_UMAC:
+ 		put_u64(nonce, seqno);
+ 		umac_update(mac->umac_ctx, data, datalen);
+-		umac_final(mac->umac_ctx, m, nonce);
++		umac_final(mac->umac_ctx, u.m, nonce);
+ 		break;
+ 	case SSH_UMAC128:
+ 		put_u64(nonce, seqno);
+ 		umac128_update(mac->umac_ctx, data, datalen);
+-		umac128_final(mac->umac_ctx, m, nonce);
++		umac128_final(mac->umac_ctx, u.m, nonce);
+ 		break;
+ 	default:
+ 		fatal("mac_compute: unknown MAC type");
+ 	}
+-	return (m);
++	return (u.m);
+ }
+ 
+ void
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
index 06297da..0459032 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
@@ -25,6 +25,7 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://ssh_config \
            file://init \
            file://openssh-CVE-2011-4327.patch \
+           file://mac.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://sshd"
-- 
1.7.10.4


