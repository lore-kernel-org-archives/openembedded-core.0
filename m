Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 85A9B79274
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 15:02:25 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [40.117.60.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 899252086B;
	Mon, 24 Sep 2018 15:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1537801346;
	bh=1Di3LdEblXIjpacDQDetyJNR+GY7AngBxZUf8D5pj0c=;
	h=From:To:Cc:Subject:Date:From;
	b=YimqwpmmdLr4Bkj1bJSKonW3c4D4O6snIwhP/Da65llbQbo1LK3rPgMepBUzNN/7M
	mfD17GpLfFqmdTEKAU8CNGT25aHXbZrimTXB7eW8VQUe1Xkb9AMjntF8aqIoh22gj/
	VLIJsFtF2eb6pfKg8v6dh/T15sq+LnsDaWtm4QWU=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 15:02:23 +0000
Message-Id: <20180924150224.6456-1-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [sumo] [PATCH v1] gnupg: CVE-2018-9234
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
X-List-Received-Date: Mon, 24 Sep 2018 15:02:25 -0000
Content-Transfer-Encoding: 8bit

* CVE-2018-9234
GnuPG 2.2.4 and 2.2.5 does not enforce a configuration in which key
certification requires an offline master Certify key, which results
in apparently valid certifications that occurred only with access to
a signing subkey.

Affects gnupg <= 2.2.5

CVE: CVE-2018-9234
Ref: https://access.redhat.com/security/cve/cve-2018-9234
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../gnupg/gnupg/CVE-2018-9234.patch           | 27 +++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.2.4.bb     |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2018-9234.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2018-9234.patch b/meta/recipes-support/gnupg/gnupg/CVE-2018-9234.patch
new file mode 100644
index 0000000000..458616ee1d
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2018-9234.patch
@@ -0,0 +1,27 @@
+From ce055269c80f6e7c1393c0deec7bc5f0d37895ea Mon Sep 17 00:00:00 2001
+From: Sinan Kaya <okaya@kernel.org>
+Date: Sun, 23 Sep 2018 04:05:47 +0000
+Subject: [PATCH] g10: Fix filtering by PK->REQ_USAGE
+
+Upstream-Status: backport [https://dev.gnupg.org/rGa17d2d1f690ebe5d005b4589a5fe378b6487c657]
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ g10/getkey.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/g10/getkey.c b/g10/getkey.c
+index e31e023..ca2500c 100644
+--- a/g10/getkey.c
++++ b/g10/getkey.c
+@@ -1810,6 +1810,8 @@ get_pubkey_byfprint (ctrl_t ctrl, PKT_public_key *pk, kbnode_t *r_keyblock,
+       ctx.items[0].mode = fprint_len == 16 ? KEYDB_SEARCH_MODE_FPR16
+ 	: KEYDB_SEARCH_MODE_FPR20;
+       memcpy (ctx.items[0].u.fpr, fprint, fprint_len);
++      if (pk)
++        ctx.req_usage = pk->req_usage;
+       rc = lookup (ctrl, &ctx, 0, &kb, &found_key);
+       if (!rc && pk)
+ 	pk_from_block (pk, kb, found_key);
+-- 
+2.19.0
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.4.bb b/meta/recipes-support/gnupg/gnupg_2.2.4.bb
index d6bfaff377..d777fcb122 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0003-dirmngr-uses-libgpg-error.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://CVE-2018-12020.patch \
+           file://CVE-2018-9234.patch \
           "
 SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch"
 
-- 
2.19.0


