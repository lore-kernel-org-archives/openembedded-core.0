Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D5EC7EE26
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:24 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.30313.1683300019473593479
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=yJboQp/v;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-643995a47f7so1662121b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300018; x=1685892018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaRih3ZDAIuv4Mg3b6yUYLecNiERyWevcL7IeVK/SMg=;
        b=yJboQp/vfIeTIMQBSq5230udRSLunKEV51aasyMV50KYelIn3CsEh+xC/es6BThJ2I
         o7KR0OA+RRJmw1GClESa/LFIpJWlV4kAirWG7DlEGQKy7z1MJarm2e4s5Hc2fJRY2Y6A
         1ZQKHh8/xj0kEAGvzPPsu4Q1cRxmJgtzpV8skfW0iD3/3fsXBZAx5NbiFDobMb6GDWI2
         0JLB91PWO/Xr47XyzyULgWpGiIvRFhPhOXbzZ557TqNhO+PitReaPeVK62mh7zpsm81k
         tLiUYagWluSp0VPpxzbOW0MoBcONLcQJFO9zjI/q6j+bfM3oQJN7EoXH2szxmvN8G+B+
         SovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300018; x=1685892018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaRih3ZDAIuv4Mg3b6yUYLecNiERyWevcL7IeVK/SMg=;
        b=Z7eG7+VB6AyZGN+sLqp4aryGyGFJay3gfKGu3wvYnanPZuLfFiFlW/OFnE7yWhcFta
         3b2z+9gqqDVqEGepVxx6p2na0Uw847b+rId5UvBHToaxIK6xV0bl5eEx5k3h2yKOjNry
         ziwFxlWPKtWy2ipoSMSlSywgqaF2NXuCAY+n6DX6AMONxg2V212NJzc++QrE4mSisfmL
         brviSx0oqfynDUebNvOqvLdACK8E7CVF4n34LA/3tOpsIlGJ4a8UVS7w1R2kIG7GiRXA
         S+ddLS2LwSXeJ2p37OW89n2ztqpnOHb/3tBYBdIq+gv4H/a9dt2KCW2h7l4NhOH9auz7
         LN0g==
X-Gm-Message-State: AC+VfDzsTBWjwQhAMVrpkJi0nxvDkStGQsCUeT6WjkvUZ8P98UbJD2rS
	W4nfYxRPUB1nmfCbeEJ7u7cRK4ENAKJ+zbP7KZ4=
X-Google-Smtp-Source: ACHHUZ7U0wZ50aXfR0BNlnvYhsGT3WPCOGeKDLGBI7cKsWYQpLkGfiKlF0RtjwpO7eNJ31mAvSl+FA==
X-Received: by 2002:a05:6a00:1a45:b0:643:9e7c:3829 with SMTP id h5-20020a056a001a4500b006439e7c3829mr2692713pfv.12.1683300018430;
        Fri, 05 May 2023 08:20:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/35] libhandy: upgrade 1.8.1 -> 1.8.2
Date: Fri,  5 May 2023 05:19:20 -1000
Message-Id: <e7303ff65b4db9dea40b08ed85717b9aef91ff98.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180929

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Demo
  - Correctly use GtkSwitch
  - Fix a GLib deprecation
- Docs
  - Fix dependency names
- HdyTabView
  - Fix set_menu_model() input check
  - Fix a typo in docs
- HdySwipeable
  - Fix get_swipe_area() fallback
- Memory leak fixes
- Translation updates
  - Slovenian

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b1ebdff55fd8ca77eaff6066370c628a9425bec7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libhandy/{libhandy_1.8.1.bb => libhandy_1.8.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.8.1.bb => libhandy_1.8.2.bb} (95%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb b/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb
similarity index 95%
rename from meta/recipes-gnome/libhandy/libhandy_1.8.1.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.8.2.bb
index 41c8e9bfb8..e863e8d13b 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-8"
-SRCREV = "f06c1bfa95a3160575b36315c6d9437376d8af77"
+SRCREV = "48ae7ec0f7f9ee5f666da38b0e39e66874957166"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
-- 
2.34.1


