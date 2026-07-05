Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4AEC44508
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:08 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140027.1783291381220901258
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d3OcqYS0;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46ed4f66256so2139427f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291379; x=1783896179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xqi6PkueZki8e1Ynz3l6Wg8blP+sg+KFUDTl5BGi818=;
        b=d3OcqYS074VWJAQ/iEsKubIpTn/C3Bx3j7uFiNuGNfCqfvAv71aCQFfKu7rhw+BfFd
         LZr7iiZCjl8HPxX7H3tS67SoR+gOrmPvZnHJyQLpts1SwSZvlRrH7v0PFBDueDfZFyBP
         gPRonGBezSEUeW0Xyb1xOsgnEhd9EqsOFa2ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291379; x=1783896179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xqi6PkueZki8e1Ynz3l6Wg8blP+sg+KFUDTl5BGi818=;
        b=gnalWoGzmVykwoADra27wrXBVBgv/WItS6y+BKWor7FkYfWH17HqpL/t8fMtebsD8x
         nknQg0W5gFJ0IIjwE4lhUXo8Dz2TufHvaO3WPfblDr5vxMEYj76BBrQSFvdlbzbnMOMx
         6mDekIvA+VmfuTA7XJ+oh0mYJNKptYgLZq4BwGPuWlWKUrHyIc2TTKyfD8ctMDGKEfUd
         Kqkg/Ra4OJ47iy+n1lrtGAUdBslJ+lpobnoxbQ0nqeWbDzCYoFaovrXJjXpCXwWEOQWh
         70H75F/uxTnHAp53vx9BXBObID2y1bRD/NVLL9latFrHeD3r10t40MGXpquMjhjZVVs2
         0eGA==
X-Gm-Message-State: AOJu0YzsFE9TWMnKekJkGsb7BS9zLFsSm5owII2iqf2H0Pn0MF/FpOVj
	ufuysduiZ+7+21gnV5ra7bPe6HfKRQfIRUV1dk64DkyltfUbTnPc2ut7/RZVjRr1vxvuolA9oSD
	LxTgVlf8=
X-Gm-Gg: AfdE7ckcGH5ro/9Wj+OaVMEmOrn0IlEWKLWKIwWfp8x8vPwDHl3MIO8XMdBxD2QOHoJ
	IxAyX1eERDt25G6qIPCDZ2BHX1jsF/QMzw8quIaGvfxqIAsY8cOe+el5MC7QBtbEfGOm30zFrJE
	/FtCYCfQG9bh74oG2gPw+CqRIcbNiSwh1BpYIZDDF9/6a4lQvftrP+sSFwtBW6yGVNB/l9ZI96x
	Ws0tEuD+gjTDXYls0iBFOyVpAtFDQSedyHBzC8Zh0JFwvtpXcGhpZDDklzNSSB1ylxhXj7VNTzi
	LzJ9xQM/L6qvIAKlXVKIoRNMzXdybZEfJdp6U6CgAT+tNXb+c9CeHsRPTvWlcHF09BKqDkJHWKb
	2Fw5guZZ7gHutSrPu/mVnrvnb/m0cNeuOxaNld18OII2mLTexqG9K3+WvfElTp0gvQkTlL/6OBj
	1Xms+Pzq2UcqYhSf92pypHD2ks8Q==
X-Received: by 2002:adf:f389:0:b0:46f:5d62:d914 with SMTP id ffacd0b85a97d-47aabb4cf45mr6714116f8f.12.1783291379387;
        Sun, 05 Jul 2026 15:42:59 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 28/55] gnupg: fix CVE-2026-57062
Date: Mon,  6 Jul 2026 00:41:18 +0200
Message-ID: <9a21841bcc01c123e1d270b9d4675311e4027a8c.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240182

From: Roland Kovacs <roland.kovacs@est.tech>

CMS (Cryptographic Message Syntax) parsing in gpgsm in GnuPG through 2.5.20
mishandles the CMS format for AES-GCM because aes-ICVlen is supposed to be
12 bytes but 4 bytes is accepted.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnupg/gnupg/CVE-2026-57062.patch          | 43 +++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.5.17.bb    |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
new file mode 100644
index 00000000000..d18b9e9cb3d
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
@@ -0,0 +1,43 @@
+From 09d686f5ca09f1161f1e433473968d15b563687f Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Thu, 18 Jun 2026 10:51:34 +0200
+Subject: [PATCH] gpgsm: Require a minimum tag length for GCM decryption.
+
+* sm/decrypt.c (gpgsm_decrypt): Require a minimum authtaglen.
+--
+
+Reported-by: Thai Duong <thai@calif.io>
+This is similar to OpenSSL's
+CVE-id: CVE-2026-34182
+
+CVE: CVE-2026-57062
+Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/4c7e68cf3d335328821bdbb70db309a60d0e4fd4]
+
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ sm/decrypt.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/sm/decrypt.c b/sm/decrypt.c
+index c4bc57657..09ed7f8a7 100644
+--- a/sm/decrypt.c
++++ b/sm/decrypt.c
+@@ -1399,7 +1399,14 @@ gpgsm_decrypt (ctrl_t ctrl, estream_t in_fp, estream_t out_fp)
+                 }
+               if (DBG_CRYPTO)
+                 log_printhex (authtag, authtaglen, "Authtag ...:");
+-              rc = gcry_cipher_checktag (dfparm.hd, authtag, authtaglen);
++              if (authtaglen < 12)
++                {
++                  log_info ("authentication tag is too short (%zu octets)\n",
++                            authtaglen);
++                  rc = gpg_error (GPG_ERR_CHECKSUM);
++                }
++              else
++                rc = gcry_cipher_checktag (dfparm.hd, authtag, authtaglen);
+               xfree (authtag);
+               if (rc)
+                 log_error ("data is not authentic: %s\n", gpg_strerror (rc));
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.17.bb b/meta/recipes-support/gnupg/gnupg_2.5.17.bb
index fd6588769ca..6b2af1c96c9 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.17.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.17.bb
@@ -19,6 +19,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/ftp/gcrypt/gnupg/"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
+           file://CVE-2026-57062.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"

