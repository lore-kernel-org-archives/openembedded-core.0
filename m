Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B6AC77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 14:27:58 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.14578.1685716071460779560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 07:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=QIg77vJT;
 spf=pass (domain: baylibre.com, ip: 209.85.160.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-3f83971680eso18947021cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 07:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685716070; x=1688308070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kO6MWK4vtMr2ox655ffp1xyanRxqi6sIqqJ8oAIO/fw=;
        b=QIg77vJTfVJyCjM/7Z2t01kGw1CSFTKxoszRLNqKcidvofBruWqY1wK/UdFrytj8YQ
         Qk7SlTFWwd2R+d+tlPFA52P1qVGuDqdilN0NGA+SZkE2C2qmwTtdWM59+1/Caz0MKSlJ
         o/lZ0eeS6gvuqrR92IylRzPW5JxGwKyJXF33T5DVcc//hJ9nfjEWktO/06mJpJEFz3RA
         mQE635xgDAC6yuFvjlhc5MlD6liP9b7FPm+T4nSJRefjVY041FW0YF4sxYh7QjRah0oF
         oNvvt6fhAa3Tz9Lj10praNLYgalpNVQf65YHV2uM3ptFjVHtUcP8CtTN+aGyha+XcW6g
         nLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685716070; x=1688308070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kO6MWK4vtMr2ox655ffp1xyanRxqi6sIqqJ8oAIO/fw=;
        b=X0J5iztmvZT8aP8d8IaZD1ZZ/96rTDnldHDq+atMKB93itNPVZ4bHu2yf+MBo/iFxc
         wJJ/R3a4oeNI8L4dpoobHFJ3cpOkYp7W4IgL9/9S8Ro0Sy21Qs/g/c6EB6a2DW/4KlgI
         lnxAXeuE49jfZBkYG+J5evBqHx30pKuvYpaNR/xpKjaSxEQKRwgQDKBsbdKNq7u92l0C
         /Pbg7Ja9XJuSl47YXepfXJH40Kh4vy8CTy0ZALL/irorWQTI/2Qnl312HievWKxgvKTp
         SJzxOrkzt2axq4qSlFi1684Z3tiTuHEJHfvDT1YP9y1/bt969/Qo8Fpf2dKuvXNg8xjg
         QCGQ==
X-Gm-Message-State: AC+VfDxudVVQ5V0YMaoLWljiOYMbtdXSzKTD7BmN7XTPDR2qhLewZPX8
	bVp55hUPUp1ptS+GLW+UZpicOr/PipEmABUBwX0=
X-Google-Smtp-Source: ACHHUZ7927l7YNzff7ccObplpS9i67ZutQ6EKwlsi7OR2FHATyW/wNgF9pDWwwQwacgo1aO8ivJ+wQ==
X-Received: by 2002:a05:6214:d6d:b0:5ef:8b6e:583c with SMTP id 13-20020a0562140d6d00b005ef8b6e583cmr7388326qvs.5.1685716070020;
        Fri, 02 Jun 2023 07:27:50 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id d10-20020a0cea8a000000b00626256884edsm870961qvp.64.2023.06.02.07.27.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 07:27:49 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] util-linux: upgrade 2.38.1 -> 2.39
Date: Fri,  2 Jun 2023 10:27:48 -0400
Message-Id: <20230602142748.921949-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 14:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182332

util-linux's ChangeLog file simply points to the git log, and there are
numerous changes between 2.38.1 and 2.39:

https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/log

There is a notable license change - README.licensing adds the
BSD-2-Clause variant between these versions, but there is no
corresponding file in Documentation/licenses; it's been added it under
LICENSE in the recipe along with a reference to the common-licenses
version. The README.licensing file also lists GPL-3.0-or-later for
some of the code, so add it as well and include a checksum.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ux-libuuid_2.38.1.bb => util-linux-libuuid_2.39.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc            | 10 +++++-----
 .../{util-linux_2.38.1.bb => util-linux_2.39.bb}       |  0
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.38.1.bb => util-linux-libuuid_2.39.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.38.1.bb => util-linux_2.39.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3868b1c41d..f9e6fb7d21 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,16 +6,18 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause & BSD-4-Clause"
+LICENSE = "GPL-3.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause"
 LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
 LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
 LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
 LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=12ae7768a65ec8f2e44d930df9cb43fa \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.GPL-3.0-or-later;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
+                    file://${COREBASE}/meta/files/common-licenses/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
                     file://Documentation/licenses/COPYING.BSD-3-Clause;md5=58dcd8452651fc8b07d1f65ce07ca8af \
                     file://Documentation/licenses/COPYING.BSD-4-Clause-UC;md5=263860f8968d8bafa5392cab74285262 \
                     file://libuuid/COPYING;md5=6d2cafc999feb2c2de84d4d24b23290c \
@@ -35,8 +37,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://0001-check-for-sys-pidfd.h.patch \
-           file://0001-configure.ac-Improve-check-for-magic.patch \
            "
 
-SRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"
+SRC_URI[sha256sum] = "32b30a336cda903182ed61feb3e9b908b762a5e66fe14e43efb88d37162075cb"
diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/recipes-core/util-linux/util-linux_2.39.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.38.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.39.bb
-- 
2.40.1


