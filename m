Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F5D4EB64DB
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:31:58 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.14555.1687447917361104864
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=yAG0ceRY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-666edfc50deso594143b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687447916; x=1690039916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X44c0lU8WD31WBBk6iQraOqnpQpWrEi8/YBVaslMFP0=;
        b=yAG0ceRYWuRV0rmgO2MOyClPIfZ4yw5agzce1p/CyOeB2vZDAM1kZfgBRsXKc+0PRH
         y1L9CPwLDxKgDprqkTFITD8bBjFvLGCAx6KmujeZ/zQRNMUCm2mk6CjKoWKVzjf/QVd2
         69Vs1R4e2iiZ1qQgsKIHIqT93skJmHVXaedbAK+u9bu2L+nXEX0MlhN0XJgEhFtzTaty
         wyeMag8T4bX145M7nHP9+PSuwrW7Zm/6LGAkQ59H3CyAQXhFsDoZBhPZd348N/Aav1jV
         /rx1K7DpgiO83ErWdx0BOniotVV+8cCA3YktZfg76wcGI0qbIR8aTJbJkhkHBGjyslsd
         KdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447916; x=1690039916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X44c0lU8WD31WBBk6iQraOqnpQpWrEi8/YBVaslMFP0=;
        b=J1N8s42qo7rQxE42Tmh1nlYytvtEEffV/ZRhhW6Hxl3vKUXURY1aYNU5fUsI03sU1+
         u0eAjYdEq43pORYqykVN8jiVko4cJXaX0xg+9HYPZ5zQnsAgy1duaVwJDJ1ztEkd9foj
         8nHTiTsdl2lOtUs21GfaNaP3cG4IObYAX+8PIxUMYnda645Hw38MFQi7vn/yxxoUcPaJ
         K6a+BmqwBLwTtwo24+XchqTURqr2MAehcHqyFHmiPRObwVjk0EO6FDA8pNAZPBmj8lTI
         uCxJ5avMTqt6LQJiSlQqB0m+uG/o5Blfr8FUGRrBRffW1FVrp8H6B8SnGH9A0QWmBvkJ
         wO3w==
X-Gm-Message-State: AC+VfDyXODCe2puX4DqAMsHyi1jGXTRQx9LQrkcD4odh4NdsqdVhSV01
	g9umfGkk2y0psnV8y+G1o9ctxDTQhh/y+cViWmI=
X-Google-Smtp-Source: ACHHUZ77l30iUl66gTTNdN4K2f1Y+noczXBQQ6nqy4kIZH/j9URZ4Xq0S8VqpY9GYLBBUpfv37WU+g==
X-Received: by 2002:a05:6a00:301c:b0:655:89f1:2db3 with SMTP id ay28-20020a056a00301c00b0065589f12db3mr36385621pfb.3.1687447915659;
        Thu, 22 Jun 2023 08:31:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm4713240pfb.46.2023.06.22.08.31.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:31:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/14] cups: Fix CVE-2023-32324
Date: Thu, 22 Jun 2023 05:31:30 -1000
Message-Id: <cb46ae57abe3069d6a4dc2ab0b8dfce5a4a5bd15.1687446532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687446532.git.steve@sakoman.com>
References: <cover.1687446532.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 15:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183248

From: Sanjay Chitroda <schitrod@cisco.com>

OpenPrinting CUPS is an open source printing system. In versions 2.4.2
and prior, a heap buffer overflow vulnerability would allow a remote
attacker to launch a denial of service (DoS) attack. A buffer overflow
vulnerability in the function `format_log_line` could allow remote
attackers to cause a DoS on the affected system. Exploitation of the
vulnerability can be triggered when the configuration file `cupsd.conf`
sets the value of `loglevel `to `DEBUG`. No known patches or
workarounds exist at time of publication.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-32324
https://security-tracker.debian.org/tracker/CVE-2023-32324

Upstream Patch:
https://github.com/OpenPrinting/cups/commit/fd8bc2d32589

Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-32324.patch            | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 21c56e1430..d6e7d95800 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -14,6 +14,7 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
            file://0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch \
            file://0004-cups-fix-multilib-install-file-conflicts.patch\
            file://CVE-2022-26691.patch \
+           file://CVE-2023-32324.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32324.patch b/meta/recipes-extended/cups/cups/CVE-2023-32324.patch
new file mode 100644
index 0000000000..40b89c9899
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-32324.patch
@@ -0,0 +1,36 @@
+From 07cbffd11107eed3aaf1c64e35552aec20f792da Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 1 Jun 2023 12:04:00 +0200
+Subject: [PATCH] cups/string.c: Return if `size` is 0 (fixes CVE-2023-32324)
+
+CVE: CVE-2023-32324
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/fd8bc2d32589]
+
+(cherry picked from commit fd8bc2d32589d1fd91fe1c0521be2a7c0462109e)
+Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
+---
+ cups/string.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/cups/string.c b/cups/string.c
+index 93cdad19..6ef58515 100644
+--- a/cups/string.c
++++ b/cups/string.c
+@@ -1,6 +1,7 @@
+ /*
+  * String functions for CUPS.
+  *
++ * Copyright © 2023 by OpenPrinting.
+  * Copyright © 2007-2019 by Apple Inc.
+  * Copyright © 1997-2007 by Easy Software Products.
+  *
+@@ -730,6 +731,9 @@ _cups_strlcpy(char       *dst,		/* O - Destination string */
+   size_t	srclen;			/* Length of source string */
+ 
+ 
++  if (size == 0)
++    return (0);
++
+  /*
+   * Figure out how much room is needed...
+   */
-- 
2.34.1


