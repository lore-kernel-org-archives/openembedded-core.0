Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF05C54EBC
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 14:34:50 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.25211.1673447685533330440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 06:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=h+kkOchj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id 20so6128363pfu.13
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 06:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYgpyuQ979Vyy8Nte+IYi36iaB9R52oIpUZYxwPGxRM=;
        b=h+kkOchjcXs7s3/D8T2HM2khmCjoGX0WIZd6a/EbilQz97zfJC+oGbA2kTVbjxOWbC
         aR6OV/zQ9wtfTDAXCksL4uk6748d3StwERFHXTIkQDSnY+PamsxR9iLIf4vyGUrRja4Y
         14g71hEIRTSzbNuCfdGo/0RaB4fEJPCF1bWhFOvgAaqk83mSZBz7kcH9J2TcTt48Vcpp
         Mp9PlaNvm1PsHHbRPVcwgTSeoF5ncy13CvQQWw4tnbHCBnmd0LdoEflg0gBO2uFKKFOy
         Kx33lqA2zQyOeYRrI1INFFo+pGCEAShy5W3JHV+qSh+pLxIj2KtaHOppzo8fdfrs3iSI
         r1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYgpyuQ979Vyy8Nte+IYi36iaB9R52oIpUZYxwPGxRM=;
        b=7CJgQdjZ39/abJdf41/wiCudUf0x/DtmhAYFmQeOnerkfR1IJxXndcsgSSzk6sewiw
         YbzwaQnwRow/vgbXIax0XRuAuSm58WWLmooIx4vW/q1tC+xCOOAB2ByVSWQzanxOukFk
         Mm95lUhaDGC8tQ/fkxPK8+CmkTlOe1Vf4dF6B4KcCuENt6uF2qGmFUtd75rfqbBrtGF9
         XjAHEnWfBkMek01yC2y2VuiQikMCRXsALVHLE0RyDsX7oNQTs4E8UdhIPmN+t+YgRCcX
         wbjImE2HSAXe4NEbFUXnOxOvmxmPdILgSrQ93GGGsi7ifocUwJSSl9DCMeT2iq5bYsQe
         Ss6Q==
X-Gm-Message-State: AFqh2kp4NS3McRqS/k2AhtwVV8Y2Y1Oe3mMO3eXguIA9OTETg/67WbWa
	LYuf9l2JJdUet2IWHCioe0jtvX0o0kAuzSxcwOI=
X-Google-Smtp-Source: AMrXdXsavTddxtEcajb9Flmk65cUvNm6U6EbJssdLs9D3ZWPR4bC78CCcTX1ac4f6p/oIVZ4QURzfQ==
X-Received: by 2002:a62:b617:0:b0:577:b52:4ec2 with SMTP id j23-20020a62b617000000b005770b524ec2mr66276598pff.29.1673447684564;
        Wed, 11 Jan 2023 06:34:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y29-20020aa793dd000000b0056c2e497b02sm10381288pff.173.2023.01.11.06.34.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 06:34:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/8] libksba: fix CVE-2022-47629
Date: Wed, 11 Jan 2023 04:34:24 -1000
Message-Id: <e9f2d3e18db0c7b3e6e4ea385f54fbb8a02ad324.1673447528.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673447528.git.steve@sakoman.com>
References: <cover.1673447528.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 14:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175743

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libksba/libksba/CVE-2022-47629.patch      | 69 +++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.3.5.bb |  4 +-
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libksba/libksba/CVE-2022-47629.patch

diff --git a/meta/recipes-support/libksba/libksba/CVE-2022-47629.patch b/meta/recipes-support/libksba/libksba/CVE-2022-47629.patch
new file mode 100644
index 0000000000..b09d0eb557
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba/CVE-2022-47629.patch
@@ -0,0 +1,69 @@
+From b17444b3c47e32c77a3ba5335ae30ccbadcba3cf Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Tue, 22 Nov 2022 16:36:46 +0100
+Subject: [PATCH] Fix an integer overflow in the CRL signature parser.
+
+* src/crl.c (parse_signature): N+N2 now checked for overflow.
+
+* src/ocsp.c (parse_response_extensions): Do not accept too large
+values.
+(parse_single_extensions): Ditto.
+--
+
+The second patch is an extra safegourd not related to the reported
+bug.
+
+GnuPG-bug-id: 6284
+Reported-by: Joseph Surin, elttam
+CVE: CVE-2022-47629
+https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commit;h=f61a5ea4e0f6a80fd4b28ef0174bee77793cf070
+Upstream-Status: Backport
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/crl.c  |  2 +-
+ src/ocsp.c | 12 ++++++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/src/crl.c b/src/crl.c
+index 87a3fa3..9d3028e 100644
+--- a/src/crl.c
++++ b/src/crl.c
+@@ -1434,7 +1434,7 @@ parse_signature (ksba_crl_t crl)
+          && !ti.is_constructed) )
+     return gpg_error (GPG_ERR_INV_CRL_OBJ);
+   n2 = ti.nhdr + ti.length;
+-  if (n + n2 >= DIM(tmpbuf))
++  if (n + n2 >= DIM(tmpbuf) || (n + n2) < n)
+     return gpg_error (GPG_ERR_TOO_LARGE);
+   memcpy (tmpbuf+n, ti.buf, ti.nhdr);
+   err = read_buffer (crl->reader, tmpbuf+n+ti.nhdr, ti.length);
+diff --git a/src/ocsp.c b/src/ocsp.c
+index 4b26f8d..c41234e 100644
+--- a/src/ocsp.c
++++ b/src/ocsp.c
+@@ -912,6 +912,12 @@ parse_response_extensions (ksba_ocsp_t ocsp,
+           else
+             ocsp->good_nonce = 1;
+         }
++      if (ti.length > (1<<24))
++        {
++          /* Bail out on much too large objects.  */
++          err = gpg_error (GPG_ERR_BAD_BER);
++          goto leave;
++        }
+       ex = xtrymalloc (sizeof *ex + strlen (oid) + ti.length);
+       if (!ex)
+         {
+@@ -979,6 +985,12 @@ parse_single_extensions (struct ocsp_reqitem_s *ri,
+       err = parse_octet_string (&data, &datalen, &ti);
+       if (err)
+         goto leave;
++      if (ti.length > (1<<24))
++        {
++          /* Bail out on much too large objects.  */
++          err = gpg_error (GPG_ERR_BAD_BER);
++          goto leave;
++        }
+       ex = xtrymalloc (sizeof *ex + strlen (oid) + ti.length);
+       if (!ex)
+         {
diff --git a/meta/recipes-support/libksba/libksba_1.3.5.bb b/meta/recipes-support/libksba/libksba_1.3.5.bb
index 7f9ab4f5fc..841830efa8 100644
--- a/meta/recipes-support/libksba/libksba_1.3.5.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.5.bb
@@ -22,7 +22,9 @@ inherit autotools binconfig-disabled pkgconfig texinfo
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://ksba-add-pkgconfig-support.patch"
+           file://ksba-add-pkgconfig-support.patch \
+           file://CVE-2022-47629.patch \
+"
 
 SRC_URI[md5sum] = "8302a3e263a7c630aa7dea7d341f07a2"
 SRC_URI[sha256sum] = "41444fd7a6ff73a79ad9728f985e71c9ba8cd3e5e53358e70d5f066d35c1a340"
-- 
2.25.1


