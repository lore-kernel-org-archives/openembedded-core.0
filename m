Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9DBC25B6E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 02:29:44 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.35675.1698200982501990570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 19:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yJ19g366;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-27d5fe999caso3583881a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 19:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698200981; x=1698805781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHIeZBmggbq509dJ3ca0T4YzDE8vj/KQM3n7y+vRfAk=;
        b=yJ19g366aOrn8Q77jdAmawon6IlE0+oDf5PEDuDGSnABK203SNLcOriv9k+jt3oPaX
         A4vdqnLrXBmE7Zp18w0RMSarl+C5iNUp3ai7Q14vPLX/sacLoUSWFKrlY0deo4RKlrq1
         NdLVee6MSA/9s4zJfw3xq+AqU6NFDCoouyCvGHXpiV9YqzjqYlW4wVepQB32x9hh04/f
         hoS2ecI+cNu0rcmJXEdg9u86Tyub73a/1CXTYQnPJb0tW/wEBbuctnrpZvJSUg16shj6
         iyRSQgGw6V6zDgJ3bx+hI/jGNQTz1sxweGcyU54Ikxd4FpQeKwnSJ9BFyec6e3aqCauA
         jkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698200981; x=1698805781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHIeZBmggbq509dJ3ca0T4YzDE8vj/KQM3n7y+vRfAk=;
        b=tmqBL1DCqtWO8S/v/2P7uhwzjed4GUsbss2+P2gewCNTzcNa2WK7tLvNBxWwMTN5P9
         538iULvl0I5lEadYaiuluvTHUKdv9anW/6y8pJWQJRQJSnoHn1ldbrQ9kEhThWP/fT5x
         VVG4FFPCLd4aqkGZ8+rQN7WrbDB8n6TkGdvojrIx+4cve9Xo1sNn3tarqt0tW9xc5US0
         2WePbLWMC6TmU5lAyF9OUiJmYACD8jq4EsjTnNRawogVfUAU4ohiO9/5/dARj0iFU6yu
         jUDMfkFy5H9O5sCgIjTNUtTInhAYOJbP7XZ2s1W1GlpqjdskxiY9cFZ3hxZ9O2kIjTUJ
         ePTw==
X-Gm-Message-State: AOJu0YyISYfA6qSVMODKu7ObHvfrAx5vvBat0lsmW9+jzi8X3vFgE0b0
	x9fZBd2XCIOfc/JxqqD90INSCxELdQhAhuGTYBg=
X-Google-Smtp-Source: AGHT+IE5TsUGX43AUSA2vOHRN5ZeVMMBlnbCitKes5QPVzzRpGA+Gl6YKurlC60DbIooyWmZBrPdvg==
X-Received: by 2002:a17:90a:4ca6:b0:27d:661f:59ac with SMTP id k35-20020a17090a4ca600b0027d661f59acmr11869862pjh.38.1698200981524;
        Tue, 24 Oct 2023 19:29:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x2-20020a17090a388200b0027d0d4d4128sm8538615pjb.25.2023.10.24.19.29.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 19:29:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/6] linux-firmware: upgrade 20230625 -> 20230804
Date: Tue, 24 Oct 2023 16:29:26 -1000
Message-Id: <42d08fdcd3c95dbef795bb74f0ff5db8ff1b0a19.1698200772.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698200772.git.steve@sakoman.com>
References: <cover.1698200772.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 02:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189663

From: Meenali Gupta <meenali.gupta@windriver.com>

License-Update: additional firmwares

upgrade include fix for CVE-2023-20569 CVE-2022-40982 CVE-2023-20593

Changelog:
      https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/

References:
      https://nvd.nist.gov/vuln/detail/CVE-2023-20569
      https://nvd.nist.gov/vuln/detail/CVE-2022-40982
      https://nvd.nist.gov/vuln/detail/CVE-2023-20593

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit d3f1448246c9711f4f23f2e12c664e0ba3ae3f02)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230625.bb => linux-firmware_20230804.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230625.bb => linux-firmware_20230804.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 7fe7e51240..507a003224 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "57bf874056926f12aec2405d3fc390d9"
+WHENCE_CHKSUM  = "41f9a48bf27971b126a36f9344594dcd"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d"
+SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
 
 inherit allarch
 
-- 
2.34.1


