Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 219D26D45B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 16:45:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 28 Oct 2013 09:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,587,1378882800"; d="scan'208";a="418598716"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.120.252])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2013 09:44:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 16:44:39 +0000
Message-Id: <7cd327909d1bec769781cf40fcb5fc94980154ab.1382978401.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1382978401.git.paul.eggleton@linux.intel.com>
References: <cover.1382978401.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1382978401.git.paul.eggleton@linux.intel.com>
References: <cover.1382978401.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] openssh: upgrade to 6.3p1
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
X-List-Received-Date: Mon, 28 Oct 2013 16:45:18 -0000

Removed the following backported patch(es):
 * mac.patch

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssh/openssh-6.2p2/mac.patch                | 76 ----------------------
 .../openssh/{openssh-6.2p2 => openssh-6.3p1}/init  |  0
 .../{openssh-6.2p2 => openssh-6.3p1}/nostrip.patch |  0
 .../openssh-CVE-2011-4327.patch                    |  0
 .../{openssh-6.2p2 => openssh-6.3p1}/ssh_config    |  0
 .../openssh/{openssh-6.2p2 => openssh-6.3p1}/sshd  |  0
 .../{openssh-6.2p2 => openssh-6.3p1}/sshd.socket   |  0
 .../{openssh-6.2p2 => openssh-6.3p1}/sshd@.service |  0
 .../{openssh-6.2p2 => openssh-6.3p1}/sshd_config   |  0
 .../sshdgenkeys.service                            |  0
 .../volatiles.99_sshd                              |  0
 .../openssh/{openssh_6.2p2.bb => openssh_6.3p1.bb} |  6 +-
 12 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh-6.2p2/mac.patch
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/openssh-CVE-2011-4327.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/sshd.socket (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/sshd@.service (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/sshdgenkeys.service (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/volatiles.99_sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh_6.2p2.bb => openssh_6.3p1.bb} (96%)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/mac.patch b/meta/recipes-connectivity/openssh/openssh-6.2p2/mac.patch
deleted file mode 100644
index 69fb69d..0000000
--- a/meta/recipes-connectivity/openssh/openssh-6.2p2/mac.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-[PATCH] force the MAC output to be 64-bit aligned
-
-Upstream-Status: Backport[anoncvs.mindrot.org/index.cgi/openssh/mac.c?r1=1.27&r2=1.28]
-
-Backport patch to fix segment fault due to unaligned memory access
-
-Wed Jun 5 22:12:37 2013 UTC (7 days, 3 hours ago) by dtucker
-Branch: MAIN
-CVS Tags: HEAD
-Changes since 1.27: +11 -8 lines
-Diff to previous 1.27
-
-   - dtucker@cvs.openbsd.org 2013/06/03 00:03:18
-     [mac.c]
-     force the MAC output to be 64-bit aligned so umac won't see
-unaligned
-     accesses on strict-alignment architectures.  bz#2101, patch from
-     tomas.kuthan at oracle.com, ok djm@
----
- mac.c |   18 +++++++++++-------
- 1 file changed, 11 insertions(+), 7 deletions(-)
-
-diff --git a/mac.c b/mac.c
-index 3f2dc6f..a5a80d3 100644
---- a/mac.c
-+++ b/mac.c
-@@ -152,12 +152,16 @@ mac_init(Mac *mac)
- u_char *
- mac_compute(Mac *mac, u_int32_t seqno, u_char *data, int datalen)
- {
--	static u_char m[EVP_MAX_MD_SIZE];
-+	static union {
-+		u_char m[EVP_MAX_MD_SIZE];
-+		u_int64_t for_align;
-+	} u;
-+
- 	u_char b[4], nonce[8];
- 
--	if (mac->mac_len > sizeof(m))
-+	if (mac->mac_len > sizeof(u))
- 		fatal("mac_compute: mac too long %u %lu",
--		    mac->mac_len, (u_long)sizeof(m));
-+		    mac->mac_len, (u_long)sizeof(u));
- 
- 	switch (mac->type) {
- 	case SSH_EVP:
-@@ -166,22 +170,22 @@ mac_compute(Mac *mac, u_int32_t seqno, u_char *data, int datalen)
- 		HMAC_Init(&mac->evp_ctx, NULL, 0, NULL);
- 		HMAC_Update(&mac->evp_ctx, b, sizeof(b));
- 		HMAC_Update(&mac->evp_ctx, data, datalen);
--		HMAC_Final(&mac->evp_ctx, m, NULL);
-+		HMAC_Final(&mac->evp_ctx, u.m, NULL);
- 		break;
- 	case SSH_UMAC:
- 		put_u64(nonce, seqno);
- 		umac_update(mac->umac_ctx, data, datalen);
--		umac_final(mac->umac_ctx, m, nonce);
-+		umac_final(mac->umac_ctx, u.m, nonce);
- 		break;
- 	case SSH_UMAC128:
- 		put_u64(nonce, seqno);
- 		umac128_update(mac->umac_ctx, data, datalen);
--		umac128_final(mac->umac_ctx, m, nonce);
-+		umac128_final(mac->umac_ctx, u.m, nonce);
- 		break;
- 	default:
- 		fatal("mac_compute: unknown MAC type");
- 	}
--	return (m);
-+	return (u.m);
- }
- 
- void
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/init b/meta/recipes-connectivity/openssh/openssh-6.3p1/init
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p2/init
rename to meta/recipes-connectivity/openssh/openssh-6.3p1/init
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/nostrip.patch b/meta/recipes-connectivity/openssh/openssh-6.3p1/nostrip.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p2/nostrip.patch
rename to meta/recipes-connectivity/openssh/openssh-6.3p1/nostrip.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/openssh-CVE-2011-4327.patch b/meta/recipes-connectivity/openssh/openssh-6.3p1/openssh-CVE-2011-4327.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p2/openssh-CVE-2011-4327.patch
rename to meta/recipes-connectivity/openssh/openssh-6.3p1/openssh-CVE-2011-4327.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/ssh_config b/meta/recipes-connectivity/openssh/openssh-6.3p1/ssh_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p2/ssh_config
rename to meta/recipes-connectivity/openssh/openssh-6.3p1/ssh_config
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd b/meta/recipes-connectivity/openssh/openssh-6.3p1/sshd
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p2/sshd
rename to meta/recipes-connectivity/openssh/openssh-6.3p1/sshd
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket b/meta/recipes-connectivity/openssh/openssh-6.3p1/sshd.socket
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket
rename to meta/recipes-connectivity/openssh/openssh-6.3p1/sshd.socket
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service b/meta/recipes-connectivity/openssh/openssh-6.3p1/sshd@.service
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service
rename to meta/recipes-connectivity/openssh/openssh-6.3p1/sshd@.service
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config b/meta/recipes-connectivity/openssh/openssh-6.3p1/sshd_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
rename to meta/recipes-connectivity/openssh/openssh-6.3p1/sshd_config
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh-6.3p1/sshdgenkeys.service
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service
rename to meta/recipes-connectivity/openssh/openssh-6.3p1/sshdgenkeys.service
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/volatiles.99_sshd b/meta/recipes-connectivity/openssh/openssh-6.3p1/volatiles.99_sshd
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.2p2/volatiles.99_sshd
rename to meta/recipes-connectivity/openssh/openssh-6.3p1/volatiles.99_sshd
diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/meta/recipes-connectivity/openssh/openssh_6.3p1.bb
similarity index 96%
rename from meta/recipes-connectivity/openssh/openssh_6.2p2.bb
rename to meta/recipes-connectivity/openssh/openssh_6.3p1.bb
index bb5c79e..7dba676 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.3p1.bb
@@ -7,7 +7,6 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
 
-PR = "r0"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -25,7 +24,6 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://ssh_config \
            file://init \
            file://openssh-CVE-2011-4327.patch \
-           file://mac.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://sshd.socket \
            file://sshd@.service \
@@ -34,8 +32,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "be46174dcbb77ebb4ea88ef140685de1"
-SRC_URI[sha256sum] = "7f29b9d2ad672ae0f9e1dcbff871fc5c2e60a194e90c766432e32161b842313b"
+SRC_URI[md5sum] = "225e75c9856f76011966013163784038"
+SRC_URI[sha256sum] = "aea575ededd3ebd45c05d42d0a87af22c79131a847ea440c54e3fdd223f5a420"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
1.8.1.2


