Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D67C531DC
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 12:17:12 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.70868.1723551429182650496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 05:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u9G9RG87;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2cd34c8c588so3605979a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 05:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723551428; x=1724156228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hqt2u1tR0JQl9UfAN0hlrAlxYxk+OkIpB6yGQ9hBVcw=;
        b=u9G9RG87uth0iB1Pt23pqZtokcD9iwiRngkIdJ+V9CVVowo3OeHDqggw12UGtL6SZ7
         toJPyvghdKZ4LFb6CUc7Avo+Rmp2VOYoPcTFwhZWB1YBDa8ONfdxRZTObJAPNEBmNWNm
         5OfuZFYZuXrSeFqnPTIJNpCA9I5MHnacYqU7OkcowTgEW0RlOX9JUZiTxvI4SZ5zGbqn
         FLqgDU+08131VxveBk6NXq5z7WoHNrg42tBrESDG0Vs5UWISy36soAzWww0++AZBYfSY
         MHJFrppOqda6h6JS5mzG2Y5wPcpFS6tRCral2MdJx+N3weVOyIHQWVdgET7xULV7xuHt
         xgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551428; x=1724156228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hqt2u1tR0JQl9UfAN0hlrAlxYxk+OkIpB6yGQ9hBVcw=;
        b=j9yHfyJYy6QgcjJwfEkORWvdeHU7Pi7V7RICPML3iz5fpxI9FVO46oqa1/jTbIhvgP
         0UKrjqARVKV9bqmuZT5Z7gIEWufN3HT2aExg41oiIZ44hU0/wT+z0GExWYh06Y4jrCYb
         +WWzNBlq77xRMLP3qFnQQKW15gMoSmjYBKrNrS3Ic2hhD8EQHLLIaZAPipwca4irc8G9
         9PynqHQfsQP7Gldgnj2NUwvSzt8UQkgSxpOcc2/fqctV1Wg7yzPKjGRQndfb6e7LYoR0
         VT8rOVMPeDm3XpMkESt4l2G2enrwSI8dU46XQ1ag3+zl67CRjXW8avyPyuUKzRAMtbBh
         umWA==
X-Gm-Message-State: AOJu0YzctCsarYpHhV2L840Qkns0NqgMPT0gr59aFRs0HOpJT4fiRaPM
	sdYymO+kuD5k9rfvvRnJCTNufL4f6EqpteTfF0brnJ1xr+0E4YMmiQLOC8dSfB2FNIDDlXxlUOr
	TzlA=
X-Google-Smtp-Source: AGHT+IGa2VZlXlWbrAPYZRY2AVqdMKLz/cBeegegWLlPmNrtpnQHj3I+wYjWCXxfpqHLi1Q4otlRpA==
X-Received: by 2002:a17:90b:3504:b0:2c9:57a4:a8c4 with SMTP id 98e67ed59e1d1-2d3926ac0c1mr3383782a91.42.1723551428282;
        Tue, 13 Aug 2024 05:17:08 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fced1838sm7148998a91.23.2024.08.13.05.17.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:17:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/11] python3-certifi: Fix CVE-2024-39689
Date: Tue, 13 Aug 2024 05:16:46 -0700
Message-Id: <d16143fc8481b68b1253eddbd7c565c490e55a9c.1723551231.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723551231.git.steve@sakoman.com>
References: <cover.1723551231.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203273

From: Soumya Sambu <soumya.sambu@windriver.com>

Certifi is a curated collection of Root Certificates for validating the
trustworthiness of SSL certificates while verifying the identity of TLS
hosts. Certifi starting in 2021.05.30 and prior to 2024.07.4 recognized
root certificates from `GLOBALTRUST`. Certifi 2024.07.04 removes root
certificates from `GLOBALTRUST` from the root store. These are in the
process of being removed from Mozilla's trust store. `GLOBALTRUST`'s root
certificates are being removed pursuant to an investigation which
identified "long-running and unresolved compliance issues."Certifi is a
curated collection of Root Certificates for validating the trustworthiness
of SSL certificates while verifying the identity of TLS hosts. Certifi
starting in 2021.05.30 and prior to 2024.07.4 recognized root certificates
from `GLOBALTRUST`. Certifi 2024.07.04 removes root certificates from
`GLOBALTRUST` from the root store. These are in the process of being removed
from Mozilla's trust store. `GLOBALTRUST`'s root certificates are being
removed pursuant to an investigation which identified "long-running and
unresolved compliance issues."

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-39689

Upstream-patch:
https://github.com/certifi/python-certifi/commit/bd8153872e9c6fc98f4023df9c2deaffea2fa463

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python3-certifi/CVE-2024-39689.patch      | 69 +++++++++++++++++++
 .../python/python3-certifi_2021.10.8.bb       |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-certifi/CVE-2024-39689.patch

diff --git a/meta/recipes-devtools/python/python3-certifi/CVE-2024-39689.patch b/meta/recipes-devtools/python/python3-certifi/CVE-2024-39689.patch
new file mode 100644
index 0000000000..a2ecc15d2c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-certifi/CVE-2024-39689.patch
@@ -0,0 +1,69 @@
+From bd8153872e9c6fc98f4023df9c2deaffea2fa463 Mon Sep 17 00:00:00 2001
+From: github-actions[bot] <41898282+github-actions[bot]@users.noreply.github.com>
+Date: Wed, 3 Jul 2024 21:34:29 -0400
+Subject: [PATCH] 2024.07.04 (#295)
+
+Co-authored-by: alex <772+alex@users.noreply.github.com>
+
+CVE: CVE-2024-39689
+
+Upstream-Status: Backport [https://github.com/certifi/python-certifi/commit/bd8153872e9c6fc98f4023df9c2deaffea2fa463]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ certifi/cacert.pem | 40 ----------------------------------------
+ 1 file changed, 40 deletions(-)
+
+diff --git a/certifi/cacert.pem b/certifi/cacert.pem
+index 1bec256..6bb8cf8 100644
+--- a/certifi/cacert.pem
++++ b/certifi/cacert.pem
+@@ -3857,46 +3857,6 @@ DgQWBBQxCpCPtsad0kRLgLWi5h+xEk8blTAKBggqhkjOPQQDAwNoADBlAjEA31SQ
+ +RHUjE7AwWHCFUyqqx0LMV87HOIAl0Qx5v5zli/altP+CAezNIm8BZ/3Hobui3A=
+ -----END CERTIFICATE-----
+
+-# Issuer: CN=GLOBALTRUST 2020 O=e-commerce monitoring GmbH
+-# Subject: CN=GLOBALTRUST 2020 O=e-commerce monitoring GmbH
+-# Label: "GLOBALTRUST 2020"
+-# Serial: 109160994242082918454945253
+-# MD5 Fingerprint: 8a:c7:6f:cb:6d:e3:cc:a2:f1:7c:83:fa:0e:78:d7:e8
+-# SHA1 Fingerprint: d0:67:c1:13:51:01:0c:aa:d0:c7:6a:65:37:31:16:26:4f:53:71:a2
+-# SHA256 Fingerprint: 9a:29:6a:51:82:d1:d4:51:a2:e3:7f:43:9b:74:da:af:a2:67:52:33:29:f9:0f:9a:0d:20:07:c3:34:e2:3c:9a
+------BEGIN CERTIFICATE-----
+-MIIFgjCCA2qgAwIBAgILWku9WvtPilv6ZeUwDQYJKoZIhvcNAQELBQAwTTELMAkG
+-A1UEBhMCQVQxIzAhBgNVBAoTGmUtY29tbWVyY2UgbW9uaXRvcmluZyBHbWJIMRkw
+-FwYDVQQDExBHTE9CQUxUUlVTVCAyMDIwMB4XDTIwMDIxMDAwMDAwMFoXDTQwMDYx
+-MDAwMDAwMFowTTELMAkGA1UEBhMCQVQxIzAhBgNVBAoTGmUtY29tbWVyY2UgbW9u
+-aXRvcmluZyBHbWJIMRkwFwYDVQQDExBHTE9CQUxUUlVTVCAyMDIwMIICIjANBgkq
+-hkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAri5WrRsc7/aVj6B3GyvTY4+ETUWiD59b
+-RatZe1E0+eyLinjF3WuvvcTfk0Uev5E4C64OFudBc/jbu9G4UeDLgztzOG53ig9Z
+-YybNpyrOVPu44sB8R85gfD+yc/LAGbaKkoc1DZAoouQVBGM+uq/ufF7MpotQsjj3
+-QWPKzv9pj2gOlTblzLmMCcpL3TGQlsjMH/1WljTbjhzqLL6FLmPdqqmV0/0plRPw
+-yJiT2S0WR5ARg6I6IqIoV6Lr/sCMKKCmfecqQjuCgGOlYx8ZzHyyZqjC0203b+J+
+-BlHZRYQfEs4kUmSFC0iAToexIiIwquuuvuAC4EDosEKAA1GqtH6qRNdDYfOiaxaJ
+-SaSjpCuKAsR49GiKweR6NrFvG5Ybd0mN1MkGco/PU+PcF4UgStyYJ9ORJitHHmkH
+-r96i5OTUawuzXnzUJIBHKWk7buis/UDr2O1xcSvy6Fgd60GXIsUf1DnQJ4+H4xj0
+-4KlGDfV0OoIu0G4skaMxXDtG6nsEEFZegB31pWXogvziB4xiRfUg3kZwhqG8k9Me
+-dKZssCz3AwyIDMvUclOGvGBG85hqwvG/Q/lwIHfKN0F5VVJjjVsSn8VoxIidrPIw
+-q7ejMZdnrY8XD2zHc+0klGvIg5rQmjdJBKuxFshsSUktq6HQjJLyQUp5ISXbY9e2
+-nKd+Qmn7OmMCAwEAAaNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC
+-AQYwHQYDVR0OBBYEFNwuH9FhN3nkq9XVsxJxaD1qaJwiMB8GA1UdIwQYMBaAFNwu
+-H9FhN3nkq9XVsxJxaD1qaJwiMA0GCSqGSIb3DQEBCwUAA4ICAQCR8EICaEDuw2jA
+-VC/f7GLDw56KoDEoqoOOpFaWEhCGVrqXctJUMHytGdUdaG/7FELYjQ7ztdGl4wJC
+-XtzoRlgHNQIw4Lx0SsFDKv/bGtCwr2zD/cuz9X9tAy5ZVp0tLTWMstZDFyySCstd
+-6IwPS3BD0IL/qMy/pJTAvoe9iuOTe8aPmxadJ2W8esVCgmxcB9CpwYhgROmYhRZf
+-+I/KARDOJcP5YBugxZfD0yyIMaK9MOzQ0MAS8cE54+X1+NZK3TTN+2/BT+MAi1bi
+-kvcoskJ3ciNnxz8RFbLEAwW+uxF7Cr+obuf/WEPPm2eggAe2HcqtbepBEX4tdJP7
+-wry+UUTF72glJ4DjyKDUEuzZpTcdN3y0kcra1LGWge9oXHYQSa9+pTeAsRxSvTOB
+-TI/53WXZFM2KJVj04sWDpQmQ1GwUY7VA3+vA/MRYfg0UFodUJ25W5HCEuGwyEn6C
+-MUO+1918oa2u1qsgEu8KwxCMSZY13At1XrFP1U80DhEgB3VDRemjEdqso5nCtnkn
+-4rnvyOL2NSl6dPrFf4IFYqYK6miyeUcGbvJXqBUzxvd4Sj1Ce2t+/vdG6tHrju+I
+-aFvowdlxfv1k7/9nR4hYJS8+hge9+6jlgqispdNpQ80xiEmEU5LAsTkbOYMBMMTy
+-qfrQA71yN2BWHzZ8vTmR9W0Nv3vXkg==
+------END CERTIFICATE-----
+-
+ # Issuer: CN=ANF Secure Server Root CA O=ANF Autoridad de Certificacion OU=ANF CA Raiz
+ # Subject: CN=ANF Secure Server Root CA O=ANF Autoridad de Certificacion OU=ANF CA Raiz
+ # Label: "ANF Secure Server Root CA"
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb b/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb
index eb1574adf6..0d45041184 100644
--- a/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=67da0714c3f9471067b729eca6c9fbe8"
 
 SRC_URI += "file://CVE-2022-23491.patch \
             file://CVE-2023-37920.patch \
+            file://CVE-2024-39689.patch \
            "
 
 SRC_URI[sha256sum] = "78884e7c1d4b00ce3cea67b44566851c4343c120abd683433ce934a68ea58872"
-- 
2.34.1


