Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9F3CA0EFA
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 23:04:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.2914.1755817465872746364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 16:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BNq1Yvz5;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b4d892175so6137485e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755817464; x=1756422264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sYNZRj2bQThxIS/92tEZPTKV8mzt4xOYyi35E/+KoU0=;
        b=BNq1Yvz5FzfumDnBJA05UumVXoFH7W2MPY10mJs9EkA3f9VbrytyiLSabk/lTyA8v4
         yyEmWmn52ErxGONQWYPehtrQNQw20z6CCc9GkzVdoD+nCHbeLP+Be0F24G9HlVebQsIt
         rS+rYyFpElpUiExa9SMT2XdQyHkWJ2JJluwBHlwaXfrMsztXEMv653udxaqNCZ3hzml5
         PRaa9n2HsYvhDcDf5qC9e/rabpbRl/yJeNRkSlM5sqqrKktA/GZKIqWW1qHhqczCRUfn
         UVoaaKlWiOEAvyeA8vSj3vrY7CVUZMRaGG23mgEia4LHDk3bdYcnlVqGaTOwn7xZggmM
         o2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755817464; x=1756422264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYNZRj2bQThxIS/92tEZPTKV8mzt4xOYyi35E/+KoU0=;
        b=GcVhp7X7ghTqUrTYk3SXpoDrGxndhfHNS1VfPBWwhGu6jwhj0eD+bdL/6+eBKy1LWX
         QGWVEVFkbbUPswf8FlUQGzxRdCrDDCOupcDsR90Q2L5N4oQPEgPw7NopvniczctkNnt6
         HJxp1au5TI8prXn4hQKnNBtoR+TERfawS22OnFZGCrZHdikzAuPuNOMc43mk2JsrhyFv
         5h8vbRVbzUAYsHmTQm/YM44qfvCaH07tbgRwn4wcb+edmsraiN4Yk2ErQLBD9fjRx5iX
         PPT8u9eusHet4fsW4vszUJRBZ4/8OTTSHnxZFM+ZAfA4Dnw66Rfx+iIkPfEHwc1eGCcV
         fFKQ==
X-Gm-Message-State: AOJu0YzPhTj9YcHAZY1PGx4tUKqiLBSupmB67pDd3wr4y8SSX74n1CAM
	lDFVNw73D6/3GBWkhZ7MmtsdnVVJN2rNZtrxOauJB2LprijS/BENNDrI+Ab8JQ==
X-Gm-Gg: ASbGncvNCHA3/qELpLNp0Bk4gEBzUFgP70FUbaX9BCHEujZRRO4ZIITeHbvJ0pKlBEd
	gOcusXYDf4xYSA4du9JqwGu/i1ShmcCMZfLpRbCpRa8qask+rBU9I9U55O0/oKkdPnpvz47f++A
	ylgUjRzQoebxmWB/P9/V1i+lwDAlSn/Tp6ItEZI2DO9aXP6hTyUH9+6cbeJ3JUPjijKgcPPNqKw
	XY0ad0pVHQzzNmtSO3dfikHY1n5I+4XLNQ2cE3ssLSEHSfnyVEdQQ1i3jeMPlV+M3zGCRytI2Lt
	DhxoK+7RjSA4e/Ppha3dVhFszkw7Yry6IMg55RZJ+74+0hM+nWGsQj1DARjUUbf77/+Y6VxvfyT
	tHFqEZADwPX1N7sgOztaVt4Sd+B4p8bPQ8w2E3nbemQRdYEkLoW+TlxY6
X-Google-Smtp-Source: AGHT+IGFAzA32W6B9mYw/dBONlhuiOsqAXpbTdY94mBpenXHtgdp4gmZsmu1XNhA9XwDEoBXnbbGlg==
X-Received: by 2002:a05:600c:4509:b0:456:29ae:3dbe with SMTP id 5b1f17b1804b1-45b517d06d4mr5523075e9.24.1755817464054;
        Thu, 21 Aug 2025 16:04:24 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c07778939bsm12614523f8f.46.2025.08.21.16.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 16:04:23 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCHv2 01/15] unzip: Fix build with GCC-15
Date: Fri, 22 Aug 2025 01:04:14 +0200
Message-ID: <20250821230414.2607657-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 23:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222302

From: Khem Raj <raj.khem@gmail.com>

Add a patch to remove redundant declarations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: fix Signed-off-by tag from Khem inside the .patch file and add mine.

 meta/recipes-extended/unzip/unzip/gcc15.patch | 18 ++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/gcc15.patch

diff --git a/meta/recipes-extended/unzip/unzip/gcc15.patch b/meta/recipes-extended/unzip/unzip/gcc15.patch
new file mode 100644
index 0000000000..ab06a4713f
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/gcc15.patch
@@ -0,0 +1,18 @@
+Do not redefine gmtime(), localtime()
+
+They are already provided by system time.h header
+
+Upstream-Status: Inactive-Upstream [need a new release]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+--- a/unix/unxcfg.h
++++ b/unix/unxcfg.h
+@@ -117,7 +117,6 @@ typedef struct stat z_stat;
+ #  endif
+ #else
+ #  include <time.h>
+-   struct tm *gmtime(), *localtime();
+ #endif
+ 
+ #if (defined(BSD4_4) || (defined(SYSV) && defined(MODERN)))
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index c13e7a008e..0a88b4c092 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
         file://CVE-2022-0530.patch \
         file://0001-configure-Add-correct-system-headers-and-prototypes-.patch \
         file://0001-unix-configure-fix-detection-for-cross-compilation.patch \
+        file://gcc15.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 

