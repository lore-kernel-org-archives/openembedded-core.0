Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A965C63704
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:46 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.8072.1648869748676835222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 20:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2323MMmK014496
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 1 Apr 2022 20:22:28 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 1 Apr 2022 20:22:22 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Apr 2022 20:22:22 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 1 Apr 2022 20:22:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] waffle: The surfaceless-egl and gbm requires opengl
Date: Fri, 1 Apr 2022 20:22:22 -0700
Message-ID: 
 <a35f4129a90441926a4433c4a8d8732b92388647.1648869635.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1648869635.git.liezhi.yang@windriver.com>
References: <cover.1648869635.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163951

Fixed when opengl is not in DISTRO_FEATURES:
ERROR: Nothing PROVIDES 'virtual/libgbm' (but /path/to/waffle/waffle_1.7.0.bb DEPENDS on or otherwise requires it)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/waffle/waffle_1.7.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/waffle/waffle_1.7.0.bb b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
index b9315157007..f1fd9e7630d 100644
--- a/meta/recipes-graphics/waffle/waffle_1.7.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
@@ -23,7 +23,8 @@ DEPENDS:append = " python3 cmake-native"
 # stack.
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx x11-egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
-                   surfaceless-egl gbm"
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gbm surfaceless-egl', '', d)} \
+"
 
 # virtual/libgl requires opengl in DISTRO_FEATURES.
 REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('DEPENDS', 'virtual/${MLPREFIX}libgl', 'opengl', '', d)}"
-- 
2.31.1


