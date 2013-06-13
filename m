Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C927D6A88D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 03:11:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5D3BBAl022694
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 20:11:11 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 12 Jun 2013 20:11:10 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jun 2013 11:11:07 +0800
Message-ID: <1371093070-29547-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371092329.git.rongqing.li@windriver.com>
References: <cover.1371092329.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] openssh: two fixes
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
X-List-Received-Date: Thu, 13 Jun 2013 03:11:09 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Backport patch to fix segment fault due to unaligned memory access
Enable tcp-wrappers by default

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../openssh/openssh-6.2p2/mac.patch                |   76 ++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.2p2.bb |    4 ++
 2 files changed, 80 insertions(+)
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
index 06297da..3ae4c27 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
@@ -25,6 +25,7 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://ssh_config \
            file://init \
            file://openssh-CVE-2011-4327.patch \
+           file://mac.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://sshd"
@@ -46,6 +47,9 @@ inherit autotools
 CFLAGS += "-D__FILE_OFFSET_BITS=64"
 export LD = "${CC}"
 
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,,tcp-wrappers"
+
 EXTRA_OECONF = "--with-rand-helper=no \
                 ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
                 --without-zlib-version-check \
-- 
1.7.10.4


