Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF23C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 14:09:14 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.196995.1673964548885573142
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 06:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=y9I9Vgnh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id o7-20020a17090a0a0700b00226c9b82c3aso34185767pjo.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 06:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KR4V4An7RzDLdGtN+9jelZn0FOyPjzFi+ejVUJfO3Yg=;
        b=y9I9Vgnh4IQHnhvQZQmAJDvfdSu0NMCxWFVmWkH+rE35mAKpz9dTm+N+QndgfmA+Ek
         XuNK+H4KMLaAs1Tdqi99fnr9i5+oUIMxHlb3P3ZXlLW/OROHdZxbIMkwvnoSe15Onn1/
         rI88BFqqtCvV8USc9xvGq+BwHZIQyYJ0zhsQGUhopmfwYsBWr1nKHOzzB9cIJlyxgdpI
         eguf0SwqTUm1ZEV089UxMy7Q+gW9Q+OixOKjvc9iAqzxaLCMWb3M8x+wKa7bf6VUNGKJ
         TTHaub8scMQW4IHlEgjXvpEV6p7oicITDStHrVQP/8KxzD34w8TVJsAT483qJHxeshho
         vLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KR4V4An7RzDLdGtN+9jelZn0FOyPjzFi+ejVUJfO3Yg=;
        b=30f5lJJC+dEGGSgn/KgOwVeF5uhvyPG62PX/PZEveDrb+yC8Vb+CLJrDL2zaNx3phY
         xkj8+4YHf+PaMp2L2bl+WaHcm+KU6o0nQuxO3oY2dAzgJBLIQMnLIfEYJxWgMELLEY4K
         mNY8rexHcFhjme7emI1YAz1y3NpN962b5UVFmHEOWi+jBUdN+aHz1MTznFPHJXp9ntH5
         ehZtsrDzyAcR9jIPki6PDVA7/L0hKHxhIvSfrofFVBcDDBBWdP0U3BO6QEpSQwLJA9/E
         wS3p7+WAaZDCY+bJX84/3o4uZM9ZQy+odj6PemM3UrQN710YufCT1PiCMIYQSRPsv8+R
         w6KQ==
X-Gm-Message-State: AFqh2kpr4tDSwVQXN7LL+lnD6GPHuWZ+EWwnLe938VUaO2Mk4W+Ti9iz
	MjR4/FAyQmi5wqRxOWolWSsCX4yNak0g/ty4kjg=
X-Google-Smtp-Source: AMrXdXv3iPBRVV2NVfXfrS8Pv8WH3jIk3WGfZXl7YoRTarih3aAglmJebuSv4mJNcursLJhO7Shk2Q==
X-Received: by 2002:a17:902:7597:b0:194:afe4:3011 with SMTP id j23-20020a170902759700b00194afe43011mr1096058pll.52.1673964546599;
        Tue, 17 Jan 2023 06:09:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b001930b7e2c04sm18197788pli.287.2023.01.17.06.09.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:09:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/9] libksba: fix CVE-2022-47629
Date: Tue, 17 Jan 2023 04:08:42 -1000
Message-Id: <e4cb0bf273ea556db91699594046a47514c8583c.1673964419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673964419.git.steve@sakoman.com>
References: <cover.1673964419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 14:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176044

From: Yogita Urade <yogita.urade@windriver.com>

Libksba before 1.6.3 is prone to an integer overflow vulnerability in the CRL signature parser.

CVE: CVE-2022-47926

References: https://nvd.nist.gov/vuln/detail/CVE-2022-47629

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...overflow-in-the-CRL-signature-parser.patch | 72 +++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.6.2.bb |  3 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch

diff --git a/meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch b/meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch
new file mode 100644
index 0000000000..8c0080d56b
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch
@@ -0,0 +1,72 @@
+From f61a5ea4e0f6a80fd4b28ef0174bee77793cf070 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2022-47629
+
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commit;h=f61a5ea4e0f6a80fd4b28ef0174bee77793cf070]
+
+GnuPG-bug-id: 6284
+Reported-by: Joseph Surin, elttam
+---
+ src/crl.c  |  2 +-
+ src/ocsp.c | 12 ++++++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/src/crl.c b/src/crl.c
+index 9f71c85..2e6ca29 100644
+--- a/src/crl.c
++++ b/src/crl.c
+@@ -1349,7 +1349,7 @@ parse_signature (ksba_crl_t crl)
+          && !ti.is_constructed) )
+     return gpg_error (GPG_ERR_INV_CRL_OBJ);
+   n2 = ti.nhdr + ti.length;
+-  if (n + n2 >= DIM(tmpbuf))
++  if (n + n2 >= DIM(tmpbuf) || (n + n2) < n)
+     return gpg_error (GPG_ERR_TOO_LARGE);
+   memcpy (tmpbuf+n, ti.buf, ti.nhdr);
+   err = read_buffer (crl->reader, tmpbuf+n+ti.nhdr, ti.length);
+diff --git a/src/ocsp.c b/src/ocsp.c
+index d4cba04..657d15f 100644
+--- a/src/ocsp.c
++++ b/src/ocsp.c
+@@ -721,6 +721,12 @@ parse_response_extensions (ksba_ocsp_t ocsp,
+               || memcmp (ocsp->nonce, data, ti.length))
+             ocsp->bad_nonce = 1;
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
+@@ -788,6 +794,12 @@ parse_single_extensions (struct ocsp_reqitem_s *ri,
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
+-- 
+2.32.0
+
diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb b/meta/recipes-support/libksba/libksba_1.6.2.bb
index f6ecb9aec4..d0ee8475f8 100644
--- a/meta/recipes-support/libksba/libksba_1.6.2.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.2.bb
@@ -22,7 +22,8 @@ inherit autotools binconfig-disabled pkgconfig texinfo
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://ksba-add-pkgconfig-support.patch"
+           file://ksba-add-pkgconfig-support.patch \
+           file://0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch"
 
 SRC_URI[sha256sum] = "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971"
 
-- 
2.25.1


