Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A1BC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:15 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.5682.1678402693659253834
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FZG2dQR7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id x34so3612483pjj.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=825HOlHamC+GclyXSBVZAJEnj4aD33c1sqbOM0am60E=;
        b=FZG2dQR7ESLNqFNf5cSK+28z4ek+BEHNKJMw6bD/07m/kqS8XuIHjYja2SokWLqxM7
         OVc+bMuIE/eNCQdd7/2I04ayaoxR8tzsu2Jg/9AQpIHSLPWn32hskyk4B8JybinO5YVX
         VE3ozTG5ylncgxbUreErJfUn0Yyz/UuS0BgOZn+X8SevCFviMPUsH83Izmh6jgwknlDd
         JGiOE6uBQlsUhZYz9HUmS2VEDcFnZIhI7a5lAMrjjtVb9q/7uaNmFwrW0SLh+5vm1SEF
         S/sAAzkoVpW8b3NmUaezXDnTu/4pt/qvQ6mrDamErOR/NGfgZkn2hMLIqadAP0+X9TPF
         gVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=825HOlHamC+GclyXSBVZAJEnj4aD33c1sqbOM0am60E=;
        b=mp7dGSHt4G4XDPbZCcEfqbiXPo5piE/CeGS+8t35WtXlmefPkmRkaLKcrwm2i0GBss
         XVp95QxCS6E5EC1XqljqoPK4mrMP2DXdCdxNjHHEh1RfEoV12g6orTAbRMfHif0zN/rC
         F4b7hM7gnAdUuU0toaRPLuSATJskMcL/kL9HYE2M6p+YNG93fTeWY0Imzp1yutPYzPq0
         wKQKmuBcFQYaNVvcW1b5h48pi4dg2f8Oy75CdynJwbSD2j/Le4V00KLhFkYmB7Y47jRK
         AXoXzHGdkWHR+azpiLwOc45mqSW7gb12ln3FD07vkkbSyCUmJF5BaBafSLsm8UHl08/p
         eIkg==
X-Gm-Message-State: AO0yUKUpTsuZEHoH79+x+JsTmp9Ap2nvFmPkSKd01ZlYuTwYJnhPyjph
	1HpjHynkMr6uHP8ZFzkbTeriBdKoPomgB8XFoEM=
X-Google-Smtp-Source: AK7set/jSlcZ1WIKmD+91ak+DFATCVulDlXXsSUbGHU3ZEvDr0ObGMOr1pyLJeBywp3/EbZsPYgJGg==
X-Received: by 2002:a05:6a20:6a03:b0:c7:1bac:6ef9 with SMTP id p3-20020a056a206a0300b000c71bac6ef9mr25183924pzk.46.1678402692642;
        Thu, 09 Mar 2023 14:58:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/27] tiff: fix multiple CVEs
Date: Thu,  9 Mar 2023 12:57:36 -1000
Message-Id: <d9ce9b37236f5c16ffba4572ad720aeb50edeee9.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178274

From: Chee Yang Lee <chee.yang.lee@intel.com>

import patch from debian to fix
CVE-2022-48281
http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.2.0-1+deb11u4.debian.tar.xz

import patch from fedora to fix
CVE-2023-0800
CVE-2023-0801
CVE-2023-0802
CVE-2023-0803
CVE-2023-0804
https://src.fedoraproject.org/rpms/libtiff/c/91856895aadf3cce6353f40c2feef9bf0b486440

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2022-48281.patch        |  26 ++++
 .../CVE-2023-0800_0801_0802_0803_0804.patch   | 128 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |   2 +
 3 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-0800_0801_0802_0803_0804.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
new file mode 100644
index 0000000000..4f8dc35251
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
@@ -0,0 +1,26 @@
+From 97d65859bc29ee334012e9c73022d8a8e55ed586 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Sat, 21 Jan 2023 15:58:10 +0000
+Subject: [PATCH] tiffcrop: Correct simple copy paste error. Fix #488.
+
+
+Upstream-Status: Backport [import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.2.0-1+deb11u4.debian.tar.xz]
+CVE: CVE-2022-48281
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ tools/tiffcrop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: tiff-4.2.0/tools/tiffcrop.c
+===================================================================
+--- tiff-4.2.0.orig/tools/tiffcrop.c
++++ tiff-4.2.0/tools/tiffcrop.c
+@@ -7516,7 +7516,7 @@ processCropSelections(struct image_data
+       crop_buff = (unsigned char *)limitMalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+     else
+       {
+-      prev_cropsize = seg_buffs[0].size;
++      prev_cropsize = seg_buffs[1].size;
+       if (prev_cropsize < cropsize)
+         {
+         next_buff = _TIFFrealloc(crop_buff, cropsize + NUM_BUFF_OVERSIZE_BYTES);
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-0800_0801_0802_0803_0804.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-0800_0801_0802_0803_0804.patch
new file mode 100644
index 0000000000..8372bc35f2
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-0800_0801_0802_0803_0804.patch
@@ -0,0 +1,128 @@
+From 82a7fbb1fa7228499ffeb3a57a1d106a9626d57c Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Sun, 5 Feb 2023 15:53:15 +0000
+Subject: [PATCH] tiffcrop: added check for assumption on composite images
+ (fixes #496)
+
+tiffcrop: For composite images with more than one region, the combined_length or combined_width always needs to be equal, respectively. Otherwise, even the first section/region copy action might cause buffer overrun. This is now checked before the first copy action.
+
+Closes #496, #497, #498, #500, #501.
+
+Upstream-Status: Backport [import from fedora https://src.fedoraproject.org/rpms/libtiff/c/91856895aadf3cce6353f40c2feef9bf0b486440 ]
+CVE: CVE-2023-0800 CVE-2023-0801 CVE-2023-0802 CVE-2023-0803 CVE-2023-0804 
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ tools/tiffcrop.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 66 insertions(+), 2 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 84e26ac6..480b927c 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5329,18 +5329,39 @@
+ 
+       crop->regionlist[i].buffsize = buffsize;
+       crop->bufftotal += buffsize;
++            /* For composite images with more than one region, the
++             * combined_length or combined_width always needs to be equal,
++             * respectively.
++             * Otherwise, even the first section/region copy
++             * action might cause buffer overrun. */
+       if (crop->img_mode == COMPOSITE_IMAGES)
+         {
+         switch (crop->edge_ref)
+           {
+           case EDGE_LEFT:
+           case EDGE_RIGHT:
++                        if (i > 0 && zlength != crop->combined_length)
++                        {
++                            TIFFError(
++                                "computeInputPixelOffsets",
++                                "Only equal length regions can be combined for "
++                                "-E left or right");
++                            return (-1);
++                        }
+                crop->combined_length = zlength;
+                crop->combined_width += zwidth;
+                break;
+           case EDGE_BOTTOM:
+           case EDGE_TOP:  /* width from left, length from top */
+           default:
++                        if (i > 0 && zwidth != crop->combined_width)
++                        {
++                            TIFFError("computeInputPixelOffsets",
++                                      "Only equal width regions can be "
++                                      "combined for -E "
++                                      "top or bottom");
++                            return (-1);
++                        }
+                crop->combined_width = zwidth;
+                crop->combined_length += zlength;
+ 	       break;
+@@ -6546,6 +6567,46 @@
+   crop->combined_width = 0;
+   crop->combined_length = 0;
+ 
++    /* If there is more than one region, check beforehand whether all the width
++     * and length values of the regions are the same, respectively. */
++    switch (crop->edge_ref)
++    {
++        default:
++        case EDGE_TOP:
++        case EDGE_BOTTOM:
++            for (i = 1; i < crop->selections; i++)
++            {
++                uint32_t crop_width0 =
++                    crop->regionlist[i - 1].x2 - crop->regionlist[i - 1].x1 + 1;
++                uint32_t crop_width1 =
++                    crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1;
++                if (crop_width0 != crop_width1)
++                {
++                    TIFFError("extractCompositeRegions",
++                              "Only equal width regions can be combined for -E "
++                              "top or bottom");
++                    return (1);
++                }
++            }
++            break;
++        case EDGE_LEFT:
++        case EDGE_RIGHT:
++            for (i = 1; i < crop->selections; i++)
++            {
++                uint32_t crop_length0 =
++                    crop->regionlist[i - 1].y2 - crop->regionlist[i - 1].y1 + 1;
++                uint32_t crop_length1 =
++                    crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
++                if (crop_length0 != crop_length1)
++                {
++                    TIFFError("extractCompositeRegions",
++                              "Only equal length regions can be combined for "
++                              "-E left or right");
++                    return (1);
++                }
++            }
++    }
++
+   for (i = 0; i < crop->selections; i++)
+     {
+     /* rows, columns, width, length are expressed in pixels */
+@@ -6570,7 +6631,8 @@
+       default:
+       case EDGE_TOP:
+       case EDGE_BOTTOM:
+-	   if ((i > 0) && (crop_width != crop->regionlist[i - 1].width))
++                if ((crop->selections > i + 1) &&
++                    (crop_width != crop->regionlist[i + 1].width))
+              {
+ 	     TIFFError ("extractCompositeRegions", 
+                           "Only equal width regions can be combined for -E top or bottom");
+@@ -6651,7 +6713,8 @@
+ 	   break;
+       case EDGE_LEFT:  /* splice the pieces of each row together, side by side */
+       case EDGE_RIGHT:
+-	   if ((i > 0) && (crop_length != crop->regionlist[i - 1].length))
++                if ((crop->selections > i + 1) &&
++                    (crop_length != crop->regionlist[i + 1].length))
+              {
+ 	     TIFFError ("extractCompositeRegions", 
+                           "Only equal length regions can be combined for -E left or right");
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
index 831014bff1..3b42dbe4a5 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -17,6 +17,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-tiffcrop-S-option-Make-decision-simpler.patch \
            file://0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch \
            file://0001-tiffcrop-subroutines-require-a-larger-buffer-fixes-2.patch \
+           file://CVE-2022-48281.patch \
+           file://CVE-2023-0800_0801_0802_0803_0804.patch \
            "
 
 SRC_URI[sha256sum] = "917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed"
-- 
2.34.1


