Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D299FC5320E
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 12:02:30 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.96290.1723636944243803789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 05:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PY7btL3N;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70d1cbbeeaeso4895747b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 05:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723636943; x=1724241743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRIkrDX2wrtMwu8nWwPVs6FS2h+bIa2Qv6SHacO8WTU=;
        b=PY7btL3N+fr3BbINC1vKNvJERl141BWS/j89XlCh/oOaqiWU+quzor6Qc5S82tX5VC
         UDzSOKhiyRV5r6bka8nJQ4nzbpUzqKI1i2shxXVWeYgMRAEK5fmqHfTdXOta1yEc+uc8
         VzdPxvQug3/Z3QDdEb5H/m1vgKh6wPfhuhauaUQ2cMvO7RaKCgLrl1Thacy/PF3DzaCw
         NJL6Q5jHyrt4YdrV6rJrES6SqIb1Q1Y23BuDem46iJKQyfDtpzr/g8N2j9XfJ9AQda8t
         4BW41RVtZs6lzNMcrGO6z42Jdc1wR+yDLAE6jQs/504WacIMpxFBiT1UKvpXqLHODalv
         q8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723636943; x=1724241743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRIkrDX2wrtMwu8nWwPVs6FS2h+bIa2Qv6SHacO8WTU=;
        b=XBv4mNswOxGJPXuacvFjy3dG11aLoWz5tiNlUrPhj6zS4MKiCoTD7kXUqCCVH5mjIy
         qMXt0/jqhaj/8sdkv67/Z5g/H882gKg00gwpXi59iHcSUwiBBxkJUkpqk+sIa2sEfVBu
         IQdfQUx0l6EMa8d431Yc5ZyxyC3GDff9ft3gp+ax40BAntkoVeeZ8Q19x58qbpNCq26b
         OYQLMntMwJCWlstIuayEebRdn28S8gXBYyZUeGj6YRhUhrnUh89Qbef17wvR0SQqlfwT
         XrpvfYXJgengy5WEP84qaTG8YEqdpjGF63/r1murEyqbLzBeTCh8ZwSUC/4rN9nvLque
         Dwfw==
X-Gm-Message-State: AOJu0YyyZV2orLL8nAKjtXTHsfqdM3J2fvtcxDdpNP8Z4mpB06qD2SD3
	lSHDbj2TY1B03IYVuQwvxeZ/w0ZYoKJkL8z7CaZJ21Srtm5zFXCXIoYAlp2hY31Vrv5kJGkyIpW
	Yf38=
X-Google-Smtp-Source: AGHT+IFmoIsF6qadyVjSbvle2B4+VDuQPZZ+RIOBeoaaksWsgSV93egvDTl6Mn4dv9svLlhXZce+Aw==
X-Received: by 2002:a05:6a21:918a:b0:1c0:f529:bad6 with SMTP id adf61e73a8af0-1c8eaf8c373mr3126774637.45.1723636943175;
        Wed, 14 Aug 2024 05:02:23 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac80e0d1sm1512214a91.43.2024.08.14.05.02.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 05:02:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/9] python3-certifi: Fix CVE-2024-39689
Date: Wed, 14 Aug 2024 05:02:03 -0700
Message-Id: <03772ffaccf53266d98204a70fe82eb1dbea70b5.1723636705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723636705.git.steve@sakoman.com>
References: <cover.1723636705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 12:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203314

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
 .../python/python3-certifi_2024.2.2.bb        |  3 +
 2 files changed, 72 insertions(+)
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
diff --git a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
index 4e61b8d9d4..116add2079 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
@@ -7,6 +7,9 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
+SRC_URI += "file://CVE-2024-39689.patch \
+           "
+
 SRC_URI[sha256sum] = "0569859f95fc761b18b45ef421b1290a0f65f147e92a1e5eb3e635f9a5e4e66f"
 
 inherit pypi setuptools3
-- 
2.34.1


