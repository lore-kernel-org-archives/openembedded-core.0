Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56829C87FD5
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:44:57 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.26646.1753469093744063946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OiIg+hF/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23f8d27eeeaso23915275ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469093; x=1754073893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Hvo5vsVjKoOjscMm2OibQrM1vdRdkv7ItWY8D/ctRU=;
        b=OiIg+hF/nRwxS7HDGNbYEATIBezZJB45e7gZsOsTFzmoPL+ubzm4iUhASmw+UAzeRt
         P3OS/jiFw+29GVPGxYtmISztKm64JVub4h78LXE6Sq7dVBDpbc04EmMvY9u4OJg7J4MN
         0oKYrCLlAnCCY7V2pKI4OeEPH7jIEDarJJ4xG4j26Dvf9Qpmy5Wml7oSdzNIZhODH5yq
         mhWtXBzYONNZU9zaLzRjddLjok2aLGjuvmDyHwx1hAalOBUdpxnzT3GEg2DLshPL6cH2
         S0YkDdko/EJXJ0EMMF/09pOMq32T/gr1dFiS35MaSlvP1DWjJbFIPJv52fe2USUmvPh1
         kw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469093; x=1754073893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Hvo5vsVjKoOjscMm2OibQrM1vdRdkv7ItWY8D/ctRU=;
        b=hGsGEHgWMiESJd21gfh5Ke1A711LzZTFsEvTYr1mztZUC7W9Wy/g+OnwgFfnEoR5fx
         wQ8RAEtw6IZGGwz47CxIMDU572b/N8MYIiZTlhtFYuXAXqTChl0NGSDpA8tMp2deMa3o
         OA3+cu3c9P5LPqZ/kBJ59J48gRV6Cb0sBo2Y6Xim3T8a7Lxox8Hnj+Hw2D/faF4epvCJ
         CquW2pla/rTbQSwNQ1nlpBONJPwpqksNMkYowsJpB/KJCL8I4R5ZXjpJULWx0IHLunUK
         rJDZM81KKsBSvPM4v/N2qiuFgYeqP/6+FZov7k3NRADuARFWKWLVdz0bRfOnyCiWE/zS
         5a6Q==
X-Gm-Message-State: AOJu0Yx0fJm6M2dENSbNMTUBdS8ZbNSW+CbJ98t9f4jNfHq8TqPtyOCK
	lfRSnN0jmCIgBGFbXE2SosLd/y4NT1957sWOemC836+16L0cz5ND33KUKfBGPWBH5HKKverKfy+
	zYgnI
X-Gm-Gg: ASbGnct+Xbx0QBVsTZa3mMx3aIi/yzkQfAt4pnkD3MFNsdABs9aebe2tQHSNGlB0QHV
	sk9mhoWWRg07Nv0UsjqKUcnFG2HpsRl6xOus48AndVjLbcob5GiymcOUlCQq/qtJ9i9Y5f8QqrU
	kcMNDBn8gHiBKFAQ4rDHXkpVGCebQDMaIgpZfeIe9dQo49ecE0RbDfcHexHmH0jrD3690ll4mLL
	9Law7KEPu9xkcG9EO8H7EX4KNl8VmFnrExanA5Q2WjJRReRgLztsw30i2BzAN/lgq2XCafEBWoy
	f4zahm1TOAGPBtdQHRUW/m2QYsQczUKmIV9xE2nLsy9FX4YnKOpCUp+j0BtU4ENdvtO3DnsXRIJ
	GzJ8SQhYqOrxF1w==
X-Google-Smtp-Source: AGHT+IE+28v5Xwe1eYpaJcCG6vYekUbnOrKLgW/sy4GzEEf3jQG0PsOjD7Ct/cmgAeN63CrZB6Ws7Q==
X-Received: by 2002:a17:902:f68e:b0:235:ea0d:ae10 with SMTP id d9443c01a7336-23fb30b8503mr54233655ad.12.1753469092895;
        Fri, 25 Jul 2025 11:44:52 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 10/16] xserver-xorg: upgrade 21.1.6 -> 21.1.18
Date: Fri, 25 Jul 2025 11:44:24 -0700
Message-ID: <2ab7c45631f78ac8f6d19889fa8526d062329992.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753468892.git.steve@sakoman.com>
References: <cover.1753468892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220926

From: Vijay Anusuri <vanusuri@mvista.com>

xorg-server 21.1.17
This release contains the fixes for the issues reported in today's security
advisory: https://lists.x.org/archives/xorg/2025-June/062055.html

   * CVE-2025-49175
   * CVE-2025-49176
   * CVE-2025-49177
   * CVE-2025-49178
   * CVE-2025-49179
   * CVE-2025-49180

Additionally, this release includes a fix for CVE-2022-49737 which was
issued after the fix was merged back in 2022 and several other various fixes.

Ref: https://lists.x.org/archives/xorg-announce/2025-June/003609.html

xorg-server 21.1.18
This release contains an additional fix for CVE-2025-49176 from June 17
security advisory: https://lists.x.org/archives/xorg/2025-June/062055.html

Ref: https://lists.x.org/archives/xorg-announce/2025-June/003612.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a59b385184fb3a548dc27310fd04d64351d8dfba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index 38c81f2372..14c45be432 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
+SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.43.0


