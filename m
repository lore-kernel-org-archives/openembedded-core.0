Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C489C61D97
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:06 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.33727.1674440518597661715
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=pcQi/0o/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id s3so7731378pfd.12
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1pPLCzP4/aoKykFzXa3vXQnMZcoUEuowHc7l5vPfVA=;
        b=pcQi/0o/IPtnZ1IMfWy/0KMa3lGMtVGS32Dr8i1cEqmMnStOu0kuZfKfEbtiXlz+SY
         TD5G8z2XaxqhpOYSpLomzppLnP7os0lgd5QdfOH0j0Y4jSpvF4Lnss4hOKavK0KqzTAT
         NzG33aH9X/kG9tb5ALGz2LI4ADGeU4s6kuzRzbYScyTzJaUPGK6iJKbU/JKh63b3M0tB
         3n8Ul+pFW/HP4quNucq/YBwBWxEMQymtp9b0aJfhhgqw1U9VMlmwAnowKL3D/3sQl86U
         juuulHNH8khtg3AsYuWQqm4coxWuHws3i8+wyqRQ5unPvhUuAXZRgwgcmcDN0i/SuiJr
         G9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1pPLCzP4/aoKykFzXa3vXQnMZcoUEuowHc7l5vPfVA=;
        b=dr8M+VFTTWSzlWc8EQSSP5UDByTJB490HH601dDjB98eVf5WXSEo8i1cNtYvkONzJe
         l7ezGfI3qhLZzLTKslz76wv0VVXwdgk3yyLT7pX6Deq37PSG1c8SZp2clWlz5b2q9e3p
         NFV3t1ibWZJHigCTOzxBwSLaLyHXREQElrzNxrNx5kd38t7v2ZoHciXaUCX6FWF1LHJn
         Ev1tPMMPFf9a33NqYo8qJJ92gE6PZ4SMXqEQYSWCJJvb+Onyh/sWUOqeWaJxcRDXHYGB
         gvIOB47VtLxJR/E4i1GunhK5LYSiTgmNBGWh9DbNHPjF+h8Z6f/xthHlAghHXEdGawKt
         z8KA==
X-Gm-Message-State: AFqh2kpWfOztXVy1sKFIYZhB6ir905T2Ohj064H21LuTFTcnkFThn38A
	bLY/KYdwdgfNLqKXcYosKMDdfzb5ecGAhdPO9h8=
X-Google-Smtp-Source: AMrXdXvDZuBQYiyr0aiCk8iFJw13l3rwSpvbRnVEYu/fK5YBXXLVbu0G4bv1xqQfR9yAHKCWqt1rzg==
X-Received: by 2002:a05:6a00:1c8f:b0:58b:c63e:6bc6 with SMTP id y15-20020a056a001c8f00b0058bc63e6bc6mr22002720pfw.29.1674440517628;
        Sun, 22 Jan 2023 18:21:57 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.21.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:21:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/32] Revert "libksba: fix CVE-2022-47629"
Date: Sun, 22 Jan 2023 16:21:02 -1000
Message-Id: <3573a3bf16fdcdbda7097bf12f2052a5b29fe0f7.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176272

Prepare for stable version bump which includes this fix

This reverts commit e4cb0bf273ea556db91699594046a47514c8583c.
---
 ...overflow-in-the-CRL-signature-parser.patch | 72 -------------------
 meta/recipes-support/libksba/libksba_1.6.2.bb |  3 +-
 2 files changed, 1 insertion(+), 74 deletions(-)
 delete mode 100644 meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch

diff --git a/meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch b/meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch
deleted file mode 100644
index 8c0080d56b..0000000000
--- a/meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From f61a5ea4e0f6a80fd4b28ef0174bee77793cf070 Mon Sep 17 00:00:00 2001
-From: Werner Koch <wk@gnupg.org>
-Date: Tue, 22 Nov 2022 16:36:46 +0100
-Subject: [PATCH] Fix an integer overflow in the CRL signature parser.
-
-* src/crl.c (parse_signature): N+N2 now checked for overflow.
-
-* src/ocsp.c (parse_response_extensions): Do not accept too large
-values.
-(parse_single_extensions): Ditto.
---
-
-The second patch is an extra safegourd not related to the reported
-bug.
-
-CVE: CVE-2022-47629
-
-Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commit;h=f61a5ea4e0f6a80fd4b28ef0174bee77793cf070]
-
-GnuPG-bug-id: 6284
-Reported-by: Joseph Surin, elttam
----
- src/crl.c  |  2 +-
- src/ocsp.c | 12 ++++++++++++
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/src/crl.c b/src/crl.c
-index 9f71c85..2e6ca29 100644
---- a/src/crl.c
-+++ b/src/crl.c
-@@ -1349,7 +1349,7 @@ parse_signature (ksba_crl_t crl)
-          && !ti.is_constructed) )
-     return gpg_error (GPG_ERR_INV_CRL_OBJ);
-   n2 = ti.nhdr + ti.length;
--  if (n + n2 >= DIM(tmpbuf))
-+  if (n + n2 >= DIM(tmpbuf) || (n + n2) < n)
-     return gpg_error (GPG_ERR_TOO_LARGE);
-   memcpy (tmpbuf+n, ti.buf, ti.nhdr);
-   err = read_buffer (crl->reader, tmpbuf+n+ti.nhdr, ti.length);
-diff --git a/src/ocsp.c b/src/ocsp.c
-index d4cba04..657d15f 100644
---- a/src/ocsp.c
-+++ b/src/ocsp.c
-@@ -721,6 +721,12 @@ parse_response_extensions (ksba_ocsp_t ocsp,
-               || memcmp (ocsp->nonce, data, ti.length))
-             ocsp->bad_nonce = 1;
-         }
-+      if (ti.length > (1<<24))
-+        {
-+          /* Bail out on much too large objects.  */
-+          err = gpg_error (GPG_ERR_BAD_BER);
-+          goto leave;
-+        }
-       ex = xtrymalloc (sizeof *ex + strlen (oid) + ti.length);
-       if (!ex)
-         {
-@@ -788,6 +794,12 @@ parse_single_extensions (struct ocsp_reqitem_s *ri,
-       err = parse_octet_string (&data, &datalen, &ti);
-       if (err)
-         goto leave;
-+      if (ti.length > (1<<24))
-+        {
-+          /* Bail out on much too large objects.  */
-+          err = gpg_error (GPG_ERR_BAD_BER);
-+          goto leave;
-+        }
-       ex = xtrymalloc (sizeof *ex + strlen (oid) + ti.length);
-       if (!ex)
-         {
--- 
-2.32.0
-
diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb b/meta/recipes-support/libksba/libksba_1.6.2.bb
index d0ee8475f8..f6ecb9aec4 100644
--- a/meta/recipes-support/libksba/libksba_1.6.2.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.2.bb
@@ -22,8 +22,7 @@ inherit autotools binconfig-disabled pkgconfig texinfo
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://ksba-add-pkgconfig-support.patch \
-           file://0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch"
+           file://ksba-add-pkgconfig-support.patch"
 
 SRC_URI[sha256sum] = "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971"
 
-- 
2.25.1


