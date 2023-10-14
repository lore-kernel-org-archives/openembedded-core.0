Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C564CDB484
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 21:45:31 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.75717.1697319927257284652
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 14:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iQEQtn7k;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6b20a48522fso1526065b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697319926; x=1697924726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0bFyTgoryzp87kjDHpQzYhAEK7Q8uZkqfcK5kMo5uo=;
        b=iQEQtn7kCBv+6EYIajy8OKqb1GtZkdpym6E0StA1QYr+CByImacJi3NHzlbGyqK0Yx
         sos5ynBAvfWSMvtu7UbRAiWVXanuTQVbS7Wd8QHEsebqYi++4Wd3eXhxFyMIzLZFniDr
         wyq4nnO4XpgWt5BYZvmuckyhGY3xtpxftZw+jtRF1DihnvDIH4Y4aGChlUdrMwldTnzl
         AoPDesoFwcDKcPeVojdQ1Djh3HuF8JESue6WMjYeU+co8H1aHDihd5oq0u9SWcYF9v+w
         FqVdBp+cH020ZDMai6+sNKOvfAtaoCr2b++WuK52ArZEqfOl0JgE6/0PmIsG7ytvLM2K
         urwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697319926; x=1697924726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0bFyTgoryzp87kjDHpQzYhAEK7Q8uZkqfcK5kMo5uo=;
        b=Xc+lXiv4U6s9oESgpRP9LiehrWuLFPM16/GK9g0VnDzkCRF92NeDdAB77Ta3qcCH6Y
         C7aon0U4WaHoIS7hqq730/CsNT5kcIZM226eGi2zl7haWZR03PteXEEytIrBGq825Obr
         zTqRfl4TJRB5QTV/AmVDk9UFQgHXc0QvP0+8gd+nW1CfoOQu8l2JoVKeF8tz53pjptGP
         B8YWN2r7wvnojHcdEgJq2BWnU/dKHEd1lkD48YfKeDs4dAM9EvvgHVz16HyFhJaZPhQ/
         43ygvu3UovzeDVkX5hB/erC10u6QLZ+NiTNAt5SRDFuqPRhxqbqoAgk85L/Qo8KNAHls
         dbgg==
X-Gm-Message-State: AOJu0Yxa9cYTMEhPWowNhWgnfrmiN3UUyTEkYV2BFPR4fSpb+8nKsKq1
	YBmqe7n7VtOrYbxCRRnWvRFLXw0EffmOuqLx9Lk=
X-Google-Smtp-Source: AGHT+IFb+Gqeoiu6fTruUXmKG3mPf8Kwlodgtw8wABMKwSVHyV6xptWH5D2dffbUCEU5DimcV62orA==
X-Received: by 2002:a05:6a20:9187:b0:135:8a04:9045 with SMTP id v7-20020a056a20918700b001358a049045mr29215522pzd.1.1697319926417;
        Sat, 14 Oct 2023 14:45:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b001c898328289sm5943411plb.158.2023.10.14.14.45.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 14:45:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/13] python3-urllib3: upgrade 1.26.9 -> 1.26.10
Date: Sat, 14 Oct 2023 11:44:51 -1000
Message-Id: <d9f200b931e48d957b721005f0140ef3fff55af3.1697319777.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697319777.git.steve@sakoman.com>
References: <cover.1697319777.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 21:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189130

From: wangmy <wangmy@fujitsu.com>

Add dependence python3-logging.

Changelog:
=========
* Removed support for Python 3.5
* Fixed an issue where a "ProxyError" recommending configuring the proxy as HTTP
  instead of HTTPS could appear even when an HTTPS proxy wasn't configured.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8a26a92dfe367472daf086a33a1b30ff6d17540)
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-urllib3_1.26.9.bb => python3-urllib3_1.26.10.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.9.bb => python3-urllib3_1.26.10.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.9.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.10.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.9.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.10.bb
index 95ae4a54a4..a8e2073d71 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.9.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "aabaf16477806a5e1dd19aa41f8c2b7950dd3c746362d7e3223dbe6de6ac448e"
+SRC_URI[sha256sum] = "879ba4d1e89654d9769ce13121e0f94310ea32e8d2f8cf587b77c08bbcdb30d6"
 
 inherit pypi setuptools3
 
@@ -15,6 +15,7 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-pyopenssl \
     ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-logging \
 "
 
 CVE_PRODUCT = "urllib3"
-- 
2.34.1


