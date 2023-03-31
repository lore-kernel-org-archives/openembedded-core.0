Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AECC76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 11:49:38 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.52613.1680263366705705710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 04:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH v4 07/10] harfbuzz: depend on glib-2.0-native
Date: Fri, 31 Mar 2023 13:46:31 +0200
Message-ID: <20230331114634.3578244-7-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230331114634.3578244-1-kubiznak@2n.com>
References: <20230331114634.3578244-1-kubiznak@2n.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 11:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179438

When gobject-introspection feature is disabled, glib-2.0-native package
dependency is not pulled in but harfbuzz has a hard dependency on it
(do_configure fails due to missing glib-mkenums).

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb
index 4406e15df4..71c92c64ef 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "f135a61cd464c9ed6bc9823764c188f276c3850a8dc904628de2a87966b7077b"
 
+DEPENDS += "glib-2.0-native"
+
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.30.2


