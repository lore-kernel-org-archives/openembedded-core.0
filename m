Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A024D116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:19:07 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10193.1764310738439096833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:18:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RsWHZ/+f;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29568d93e87so14957625ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764310737; x=1764915537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J8emJM8RR+dtaX6w4cxWWXTeGEebG4/Lg+VhnvdKdc8=;
        b=RsWHZ/+fGn8hvuhsJGbN3Lh9sB/2Irzenpv1gstMn/HlX4xT+To+CeMGtWmuUyE7Hw
         ql2wKRge0AmY4SpJOP+O9+EkuFN6sw43o3tcpgoJ7lpFdZmMzKI4zyFB64vdPH/oJsmQ
         v0YkU8uF6mToTIDwttn92kmWLhQrXiQhi3NyghjlZUcSW4B/GMLk+pxTgwQIK4CqTbb1
         z21OkiFOrpr9c4ZquethNvQ9RUAlfPYkMPDKSc8cBEKlZcz842XcjUej76xbVI5/rtFS
         yCx8Y6+0Vnty3HDpFmwG3yxce0epIvYYk1jSDZ973LG6Aj1j7DiaqXUbJ3b4ekVi2t7M
         9QMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310737; x=1764915537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8emJM8RR+dtaX6w4cxWWXTeGEebG4/Lg+VhnvdKdc8=;
        b=t6CseNMLsYDDuiV2lOkTE6z2+J7484/72P7qQXvPy6aNPjbuXML338bpvkeIQ1u6iy
         s9pkoGfEuApQoZn2Ujz2Dw2njww7kUrnlWPlxQ2mNUSQH6urapmKr+DXvJ2X91WzOznp
         LdVMv1e56SMv/AXCS5IehigKLCIdOXOrdPwMILEwenOymLmpJ793KqNg4Dw3ld5yZnuC
         J2eMw3vcIMK+60nh3O/TqGBP723Zncs6XiO2hYCT2JmS6jBWqfE3vq0MGTN+ymHtN8B0
         kw4/0FnadB1gjAvTn9NVoecnqA5WSHxEFLdPR4yUbKB+KYzksb4JKEaR0WWQiO4k2m12
         2Uhw==
X-Gm-Message-State: AOJu0YyPEHQFtd/7ExXbk/hleJuVSA56I9E1iK9sa+NuYz8fd8OMN71j
	yavdLYwS9GHne2xA/67lW7WBn0lkexQClBQKQHMJtV4/TFDRnMmwfpK5jna3FA==
X-Gm-Gg: ASbGncvrfzKL9ORB7T+UxjfiqNn8NZs6mZdsq3C20parxKElr6lxZN6fXcSTOFuOPcO
	MxbN1a1g8ZjWM633lv1eIVRbWjgz5GQFgis9V1QOujNPvqSvIyRccvWaxO5LdCeLmOIEg9BRrOY
	gSmK3UpRIE5XGJbjbxlGiyaPJu5c90o+5VaqZylXvw2FqmIwmtzSHsrEbQs+PNpjEq9SHSkC0vp
	BjQiUs699m1gA1MZglW3/EB7ey60vEL3Lgcxyz52guWTm2H7cnVtmXRlHFWCeoKhLQgSKMlYscj
	XfKlQmgkdP8OXqsl7evRR0P2hg/veL0/FclY6gEJaLdazl/55tYDb9HoFGkIMcLHG7I8ttdQ3iU
	D1Q+aKyifbKQ7uSwqPYtCIW6hK5bqeAt+SsQ+St7E7zz3eS/ZSiX60bquZfAHFiAbjOQpL+Sp0I
	cJOTSN8VMOky71a2mhhMKD/mqE
X-Google-Smtp-Source: AGHT+IFDzWZj6ngRnfaGoNWjsoJPksVmZUyQfLO3GQmHXO2OUM47Gc4Wb+UHdoV43KhnmCDBzNFvYQ==
X-Received: by 2002:a17:902:f612:b0:295:557e:746d with SMTP id d9443c01a7336-29bab2f5310mr164761455ad.57.1764310737517;
        Thu, 27 Nov 2025 22:18:57 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm35427335ad.19.2025.11.27.22.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:18:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 01/14] dhcpcd: upgrade 10.2.4 -> 10.3.0
Date: Fri, 28 Nov 2025 19:18:38 +1300
Message-ID: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226884

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.3.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../dhcpcd/{dhcpcd_10.2.4.bb => dhcpcd_10.3.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.2.4.bb => dhcpcd_10.3.0.bb} (96%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.4.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
similarity index 96%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.4.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
index bfb24aa58c..fca7d8b11d 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.4.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4dda5beb433a809f2e0aeffbf9da3d91"
 
-SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master \
+SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master;tag=v${PV} \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
            file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch \
            file://dhcpcd.service \
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "93df2b254caf9639f9ffb66e0fe2b584eeba6220"
+SRCREV = "385ff246cbdbd1627582999f7705bf9ef2ad0d7d"
 
 # Doesn't use automake so we can't do out-of-tree builds
 inherit pkgconfig autotools-brokensep systemd useradd

