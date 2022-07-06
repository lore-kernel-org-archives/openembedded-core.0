Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA3AC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 13:16:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.6010.1657113406057769871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 06:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ekBw3wxq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id l68so8812540wml.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xJ3aPtd3qbP2QOrN7Vn2Yu6maRajwt8zdxTapqHq9RM=;
        b=ekBw3wxq38vXpOSVLCdlhNo83wjE3N/8iflRcGEuNJS21fvNowvuDiOakGicYDx2tV
         wtjHhKtAp/j7G+1YIN+HkHmCiFTc9UfblrvrwPgk7v8VoC5ADB6emrrNodnjDYFDDzrD
         lAcv7lrhwt4ty5k5WdfyQMrp8X1vz+StidlAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xJ3aPtd3qbP2QOrN7Vn2Yu6maRajwt8zdxTapqHq9RM=;
        b=uW0uiKlGk1EkzGCWCNMbnd0kae5TwhnBBwVJH99G0FXm8bVKO/8ddDJ3vGOiGdWgFK
         fK0OHysJ4WHvxLt6uiih0nxEN0xrzXrNW+bhhJkz2wrwP89m/XUHZ5Skg9VGVIP3VT1Y
         HgyDgnM+LSIiJba9xi2PxfvyLfIYdg1EDzJcxdDaBw3PlWrNZsvYIfB5/8Wjivbmkuoa
         eNzfc0BBUji+gRxMnQ6tvWjDLPC+b/gM6ypRDcULbRuoVLWWJYRnZp2NpYheUsQQWvn2
         69qa+ULgcTJiA51by5bsnVXxX4EojIekJh68m3d8gKGxhayy90QQhdMDxtt5BBwpVEoc
         eOyQ==
X-Gm-Message-State: AJIora8XYCUNIc6RQHRzpbeiRW5qtiIOMvglw1AxIJoihfdlRhPBZy9P
	GKkgcIwRKYn7BrHIricbKn49Kw3jUthCcA==
X-Google-Smtp-Source: 
 AGRyM1sWjmooJDjy24QXDqvoVDGAw9wVmU6p121HtUJsccS5roF12df1KjY++QdTDU1fMhKBEoRxaA==
X-Received: by 2002:a1c:f709:0:b0:3a0:3b29:5eb2 with SMTP id
 v9-20020a1cf709000000b003a03b295eb2mr44915899wmh.133.1657113403893;
        Wed, 06 Jul 2022 06:16:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8])
        by smtp.gmail.com with ESMTPSA id
 c7-20020adffb47000000b0021b9504cc83sm35893317wrs.31.2022.07.06.06.16.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 06:16:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] icon-naming-utils: Resurrect for sato-icon-theme
Date: Wed,  6 Jul 2022 14:16:41 +0100
Message-Id: <20220706131642.1011068-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 13:16:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167721

To add back sato-icon-theme we need this small util.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../icon-naming-utils_0.8.90.bb               | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 18b0624af72..c55b2a09cf9 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -261,6 +261,7 @@ RECIPE_MAINTAINER:pn-hicolor-icon-theme = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-hwlatdetect = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-i2c-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-icecc-create-env = "Joshua Watt <JPEWhacker@gmail.com>"
+RECIPE_MAINTAINER:pn-icon-naming-utils = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-icu = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-ifupdown = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-igt-gpu-tools = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
new file mode 100644
index 00000000000..bde265f64fe
--- /dev/null
+++ b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Enables backwards compatibility with current desktop icon themes"
+DESCRIPTION = "A Perl script used for maintaining backwards \
+compatibility with current desktop icon themes, while migrating to the \
+names specified in the Icon Naming Specification. The Icon Naming \
+Utilities map the icon names used by the GNOME and KDE desktops to the \
+icon names proposed in the Icon Naming Specification, and generate the \
+icon files appropriate to the desktop environment you use. The Icon \
+Naming Specification provides a standard list of common icon contexts \
+and names that can be used to make icon themes work in a desktop \
+environment or application that implements the naming specification. "
+LICENSE = "GPLv2"
+DEPENDS = "libxml-simple-perl-native"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-${PV}.tar.gz"
+SRC_URI[sha256sum] = "044ab2199ed8c6a55ce36fd4fcd8b8021a5e21f5bab028c0a7cdcf52a5902e1c"
+
+inherit autotools allarch perlnative
+
+do_configure:append() {
+	# Make sure we use our nativeperl wrapper.
+	sed -i -e "1s:#!.*:#!/usr/bin/env nativeperl:" ${S}/icon-name-mapping.pl.in
+}
+
+FILES:${PN} += "${datadir}/dtds"
+
+BBCLASSEXTEND = "native"
\ No newline at end of file
-- 
2.34.1


