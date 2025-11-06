Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2FCCCFA13
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 20:46:01 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7982.1762461948343297200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 12:45:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WnIDjbkM;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ba599137cf8so42902a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 12:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762461947; x=1763066747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r94U2Q5mbydabcrQVPu0QcKm7DB4okFg1Sf6MOSfe/c=;
        b=WnIDjbkMQ9ExgSY0u13bCHGBNjw+7fHGMhulZRmCKdN1AjK5aP8QkSfoKtTLeA+U+R
         wQWdW9xvPNUX2q8JufpzfB+6f/J8H4St6ifYQkCt7catDp0Apv57O6Ws2zQY2LtcI137
         +sHy1mFFX+UZAeEHitybxt6wOw9Rvk+snyyjNcDhw75xtaa/2Ye1JVljWHd6i2hikEzJ
         mnwtMIgQv4F6w7bTJg4vxyGQHS/tPgFM6wCU1YSUt+MflPwTNL2a79sdb5WrY6IVItQy
         4dKgWAodl0Rz72mhgOW9WEjS95Vzy9lzydK2qGS7ieOeCrY5frwrPBmwm0Aqa/IsZiTN
         xndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762461947; x=1763066747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r94U2Q5mbydabcrQVPu0QcKm7DB4okFg1Sf6MOSfe/c=;
        b=BXb53y7a38WlGMCPISi/RbXEmz3PNQmgetLSwRMmH6Ay4RtqM75VRN2R+KdRSuBa7a
         7Ilpc1073EFc5CpW/i1nfGWCV8zRYQqjlXZui0M9o3lcnMz/mS+Gcru3gIXgD29hkG9T
         lAvQBOBILxj1DC9+Y0//ROtZ9UbkZLqmrNxp/npKQYNh3ANnI2B8sxF6FYkuO4Twy1jR
         GZlnIRFHenWcXnhfFf46Yrf/P1JOplu/bavutMzc+HVLG9pyI9lJsz+Jt4tuqfVEhtvm
         utZ3jzfWg8pHiMO+Ud1qQ0tilpExc8bp4jX9tWV3hR7yH6Xu75BS1F/DWySO9uztLf15
         Izgw==
X-Gm-Message-State: AOJu0YwKkGfs3/JwQA8Q16YWh8MM/xWVCKOlmj185F4gsfWdSJi7TrYD
	qq+mcNO2ZXdciL14O3oF7zRG34GhRM06J6mH9ZmQMjh5ITK9N2JMACcJvCS5/g==
X-Gm-Gg: ASbGncvefgdC6z4lk+54xUpdK9hpljfUiQJIIlahqXifdYGUeDwCsHRVILGwodGE0Lt
	t03HhZzeCFWO+GVrjojoaJJ2e1ux+t4YZhmzetPy83ihOiIdhmnRpe6UK/WWwDcpZSCb+uLPPKe
	J6LTEbltkTyFkQGBWt9rhnHkd8YISCgNFOiR4ac4nYhAKGYRE6DJzeXsSmISs6cJD+uGZSbBAX3
	uqeM2QA9vciYtK5+lUqBuuB6U31mjYXPMgNKhe3CTQpcJLJuNnuknoLxiTICB8vn46MZ9t9reWE
	WHW7hyexpJ9L1CfwRMDSKtZA/IeToN95/1uQtiE1eU6SWVQW87c8+mKwJ+2lU8o6t/97uubUnnh
	wITa/6bo+ZPqLmAV+sJ19DiCkeQrACEaP/6a4r+hLku6hbqu0x6zpfU1gL7a076KOrDWavlD6qX
	RRnJ35S7PzY5b/AXmF1d7VmbLj
X-Google-Smtp-Source: AGHT+IHEuZm6FIskKTEXI7olg9p5iDKYlb8jF/sJwGiXKdS4Uo0VqXdmIODSojHElB6M4B8ijYYtjg==
X-Received: by 2002:a17:902:ea03:b0:295:5898:ff5c with SMTP id d9443c01a7336-297c00b8e1amr12015925ad.16.1762461947263;
        Thu, 06 Nov 2025 12:45:47 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cb47dbsm37527085ad.96.2025.11.06.12.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 12:45:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 2/4] libunistring: upgrade 1.3 -> 1.4.1
Date: Fri,  7 Nov 2025 09:45:34 +1300
Message-ID: <20251106204536.2079412-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106204536.2079412-1-ankur.tyagi85@gmail.com>
References: <20251106204536.2079412-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 20:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225997

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: copyright years updated[1].

Changes in 1.4:
* The data tables and algorithms have been updated to Unicode version 17.0.0.
* Fixed a bug: The functions u*_grapheme_next and u*_grapheme_prev did not work right for strings with Indic characters, Emojis, or regional indicators.
Changes in 1.4.1:
* Fixed a compilation error in C++ mode.

[1] https://gitweb.git.savannah.gnu.org/gitweb/?p=libunistring.git;a=commitdiff;h=8839cd8ecfe0d6c32337419e4abdc856da23826e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{libunistring_1.3.bb => libunistring_1.4.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libunistring/{libunistring_1.3.bb => libunistring_1.4.1.bb} (87%)

diff --git a/meta/recipes-support/libunistring/libunistring_1.3.bb b/meta/recipes-support/libunistring/libunistring_1.4.1.bb
similarity index 87%
rename from meta/recipes-support/libunistring/libunistring_1.3.bb
rename to meta/recipes-support/libunistring/libunistring_1.4.1.bb
index 08531acec1..791f4983ed 100644
--- a/meta/recipes-support/libunistring/libunistring_1.3.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.4.1.bb
@@ -16,12 +16,12 @@ SECTION = "devel"
 LICENSE = "LGPL-3.0-or-later | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
                     file://README;beginline=45;endline=65;md5=3a896a943b4da2c551e6be1af27eff8d \
-                    file://doc/libunistring.texi;md5=36b7d20daef7fbcc032333ae2429aa94 \
+                    file://doc/libunistring.texi;md5=55cc91e1fe09c7aec78b6dc932202300 \
                     "
 DEPENDS = "gperf-native"
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8ea8ccf86c09dd801c8cac19878e804e54f707cf69884371130d20bde68386b7"
+SRC_URI[sha256sum] = "12542ad7619470efd95a623174dcd4b364f2483caf708c6bee837cb53a54cb9d"
 
 inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"

