Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FCBC433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:58:48 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.52861.1638136727537056771
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=brjoCNkE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so13815233pju.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZHpP5jiBxSPjqJvUK6DwPtawTE/DWo7PDT6DGr/IlyI=;
        b=brjoCNkEfZpwr0spPrkrLRnHyPOb4mjIFFQJuohTG9B+9uM37c/u2dWy37NkpCWtIz
         u4U/FrFzFLNkQx1ilB8B/9gunNgdFAqNwfQoIaMRN9TCOiw1L9kOSzybfqaSu1mq5+Zc
         //GgNKx+/m/7AkMccAr+5FmYjOyMy0Yi+SuMQgr/D9Ukqwdvljgav4yq/3ZDUarx2qW7
         sPyCH+Mr6ZC2kCoULusDnCQ5ypi0+hZVnlA5/vURiqAqeWS9J8dVdzMLIsQ01U2yyyny
         oy4oCJslBEJYVn+HncsBcElAnGewR1GQvIlNMfeXkeSE4AZz6luZuS4EFuVpTEwPSQGS
         gR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZHpP5jiBxSPjqJvUK6DwPtawTE/DWo7PDT6DGr/IlyI=;
        b=LTm0daTOT9td7DIgmHWdaTc6PpuQ3nxTJh72wwDLFo00qiEthdO/wNThI0rtukRc0i
         fPkSXl8CopLIQnzROm52HTy1XUJalFiQyQOPn9LI0UpjkS5H7B6WMr7fzOkZaESDrABf
         P5Q6y56VzAyR6Aak+RDqJOAUIw2+EI2DNch0fMazoStogiLw36WiKdRxMMVXGx7yYiwH
         OEhR46OxUGvuAYkOIFTxAheps5ypj4IrgFNELNq3HsI1kWwPZ+hgvpiafc2sIWQLWP/B
         CQ6r3tmqoO74chBFqy+55L5dfyKhvknCnWAMFbUZ/+CSWuFwliYJBPz+4EdZ5bliYInM
         jwWg==
X-Gm-Message-State: AOAM533jgsNAbFmnNsKCMApsioxV1pGQuGX7FMdECj5pradh3Q+Aaci+
	7KZOMSnmW2ANj5nL303Xt20lK7ycajV72pXiLuI=
X-Google-Smtp-Source: 
 ABdhPJxYBJZ+roT8jAB5ccqYrSh8lY6XWqKI1BX218Gyh2qZRT/ppsC1/RZtzwL0fEqUrS/NPBG13Q==
X-Received: by 2002:a17:902:cb8a:b0:141:f601:d5f1 with SMTP id
 d10-20020a170902cb8a00b00141f601d5f1mr55786490ply.77.1638136726516;
        Sun, 28 Nov 2021 13:58:46 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.58.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:58:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/42] gmp: fix CVE-2021-43618
Date: Sun, 28 Nov 2021 11:57:23 -1000
Message-Id: 
 <abf73599c5706a8553a4b1f3553313059c4d9c69.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:58:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158893

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fb3b9a7f668a6ffd56a99e1e8b83cdbad2a4bc66)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gmp/gmp/cve-2021-43618.patch              | 27 +++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.2.0.bb         |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp/cve-2021-43618.patch

diff --git a/meta/recipes-support/gmp/gmp/cve-2021-43618.patch b/meta/recipes-support/gmp/gmp/cve-2021-43618.patch
new file mode 100644
index 0000000000..095fb21eaa
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/cve-2021-43618.patch
@@ -0,0 +1,27 @@
+CVE: CVE-2021-43618
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+# HG changeset patch
+# User Marco Bodrato <bodrato@mail.dm.unipi.it>
+# Date 1634836009 -7200
+# Node ID 561a9c25298e17bb01896801ff353546c6923dbd
+# Parent  e1fd9db13b475209a864577237ea4b9105b3e96e
+mpz/inp_raw.c: Avoid bit size overflows
+
+diff -r e1fd9db13b47 -r 561a9c25298e mpz/inp_raw.c
+--- a/mpz/inp_raw.c	Tue Dec 22 23:49:51 2020 +0100
++++ b/mpz/inp_raw.c	Thu Oct 21 19:06:49 2021 +0200
+@@ -88,8 +88,11 @@
+ 
+   abs_csize = ABS (csize);
+ 
++  if (UNLIKELY (abs_csize > ~(mp_bitcnt_t) 0 / 8))
++    return 0; /* Bit size overflows */
++
+   /* round up to a multiple of limbs */
+-  abs_xsize = BITS_TO_LIMBS (abs_csize*8);
++  abs_xsize = BITS_TO_LIMBS ((mp_bitcnt_t) abs_csize * 8);
+ 
+   if (abs_xsize != 0)
+     {
diff --git a/meta/recipes-support/gmp/gmp_6.2.0.bb b/meta/recipes-support/gmp/gmp_6.2.0.bb
index a19c74fca8..d29b74f829 100644
--- a/meta/recipes-support/gmp/gmp_6.2.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.2.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://use-includedir.patch \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
+           file://cve-2021-43618.patch \
            "
 SRC_URI[md5sum] = "c24161e0dd44cae78cd5f67193492a21"
 SRC_URI[sha256sum] = "f51c99cb114deb21a60075ffb494c1a210eb9d7cb729ed042ddb7de9534451ea"
-- 
2.25.1


