Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B81CD98D2
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 10:52:12 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89052.1781347925466150705
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 03:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qrVIDm5p;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so1137923a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 03:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781347925; x=1781952725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TDJRN40gousf+Jk3E6B5Ipy/6Wq/hZkEPeqjLcptYE=;
        b=qrVIDm5pS8DHf5o5S+EGsG306q+a9GOgFlOF5O0lVAA+G74V2IGXYmPl3wmiaFpshA
         5n92oIj1rnX/rwpFxEvdKjpbfBeYTAZmte/4woxnH09gGK16vrls9tSiJazJ1gsMSfLO
         d5dn9fATYUrQ+8CDXT5ndMQ8PWWPQMeW3XhksLYhNblRJ0b9j4qGTZzlGwwpB6iGEkTI
         pCljUZ8wBshfgM7OTQiwKs1dJWXda/UkANdD+76fB3bOXMlix8PviyfRXZtRpZNdGyIP
         yPXNmGlCXW8lbLD+CPI8UQn3OusOaFHrdgAqXk4gOdR9oW4x2qZ66P8q1HjluqaEyJ8J
         8l+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781347925; x=1781952725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4TDJRN40gousf+Jk3E6B5Ipy/6Wq/hZkEPeqjLcptYE=;
        b=mvZg7+VoIe29tflHtZqkF711Z/JP4dVcw2wxMbm5rlhcTlE4SEpELi1A02tIViuK+H
         e3e/IhO9pakbGJ+xOxVu27jWvMaDd1f1AIQlP0ceGBaqW3KrE5L76xDF/8NYEMcbxrZt
         2B7rPJJeJrjvL1iAVmnWIM2nBaY7XRk8e7XxuaDrChkGC9QlYaH+w9eLCLHp4hY2EW7r
         /RlD5+1F2vZRZafd65ed0b35pQGUHZF68EjEMJIYKrL4FhWWIX5IOJ6yWtc3OV7ijAu3
         nTfDy3ev8R6NocERW/fZWVQ/ncbXrMdlN4jbmnv8o15tT035o9lpPMdZFe62l9RdPnO0
         3rcA==
X-Gm-Message-State: AOJu0YzcotrnHOTZaJ36eIz1wGoqSs9vLc7wX37oew3Q5rboV25fntdo
	z5Mf7skewVyidkQHqw1zalRXuBm1um242LXlczv4Gi8px5K7iUb1/Q1DiKzoQESL
X-Gm-Gg: Acq92OEtRBZO1hFgivMhGQlbymIEeRlXsmAqyxTToLdY+UyDlcUp0FioUc7ppD+9UyZ
	LnZVOM656gVz8QaEown9SmBZXQ3XbqpQOz8swh6nMa2Xhbvl5XsunSksWs+dQ5VZqFF2wHD9Q/w
	TmUwbyU7j814om+wEvAn8Rgg8uD9gukiHz995/4V6PHYgZP1kFMGFFDFwfrzOr+pzZkJs9HJdNG
	+V+42vhfV9kDtyUx3BsubBew7CxKsWnTyabkIe63E9lXqKLK4tgKdqNqg0MerPI/efTCNIgPlg2
	4E5F9UTcjMDUDfbY8ilmRBhLO6eTDVRaIsbAeE0CT4idsxO76lElT6ISVxwRwdQ2kN5XmP4k9j2
	Ckk2pD67CHHvgn8HnICmG3RaaT+t+whnOp12LNPtSSiNvzzVkDVdrpqFEinvB+zdsdKAAlTw/7k
	ZTha/ONgNhOjmTp+HRgHD7Mc7glXXoQndppqQyfG7FRPt5Rqk=
X-Received: by 2002:a17:90b:4d07:b0:369:e4d4:79c6 with SMTP id 98e67ed59e1d1-37a03ad61d9mr7214617a91.20.1781347924892;
        Sat, 13 Jun 2026 03:52:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm3222322a91.2.2026.06.13.03.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 03:52:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta][PATCH 2/3] ca-certificates: upgrade 20260223 -> 20260601
Date: Sat, 13 Jun 2026 22:51:52 +1200
Message-ID: <20260613105153.3895524-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613105153.3895524-1-ankur.tyagi85@gmail.com>
References: <20260613105153.3895524-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238674

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: ca-certificates-local example removed[1]

[1] https://salsa.debian.org/debian/ca-certificates/-/commit/0ba2e089daf128206b0a13423ceede612bb60270

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...a-certificates_20260223.bb => ca-certificates_20260601.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260223.bb => ca-certificates_20260601.bb} (94%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
similarity index 94%
rename from meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
index 41690d1d08..1bc64fe34a 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
@@ -5,7 +5,7 @@ This derived from Debian's CA Certificates."
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
 LICENSE = "GPL-2.0-or-later & MPL-2.0"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=ae5b36b514e3f12ce1aa8e2ee67f3d7e"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=dab7c7cea776d1a1648deb0052c72647"
 
 # This is needed to ensure we can run the postinst at image creation time
 DEPENDS = ""
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56"
+SRC_URI[sha256sum] = "7ab6301f7f34eef90a4d278647c260bc0762e0e14561f4649854cf4b0d4bea21"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \

