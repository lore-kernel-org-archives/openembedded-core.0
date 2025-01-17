Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E740FC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 13:08:58 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.10190.1737119335748198615
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 05:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=So5PTtxn;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=UXKmCXGNVF4YiOuO8NdpjZm/JNRIxFnFnqAg9JRbjQ4=; b=So5PTtxnNOeHhMOa2CrSWPPaYb
	pKlOGWRDNc/R3g29riWi1i3rjlmwJJz5j7SJKAw3p7bsLCCzMDVEB6c1jtuihmFmXD3msGociX6S9
	5PN42oRq+Kcxudt7UZriYi04U4VQT57vNyTtY55td0hB30h3WOvXmc2KsxHU3LJLB29x3/CkzwtQV
	Lw6qHjYkxvNCb3F/aAQJJrnVegOeSryeowF9z8MI3OrSTix8MTgK+TbiLZL903MEhimqa7K7pYEVv
	Hd0R8D1QSmLXiuiI+uV3mp01SDK/aFB7xBOgEnX5ArD4Dy3uUYNGtplk4FwhGjGlIgVXZKHKV59mL
	f6kil8uw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <sean@geanix.com>)
	id 1tYm5l-000KI7-2z;
	Fri, 17 Jan 2025 14:08:53 +0100
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sean@geanix.com>)
	id 1tYm5l-000B5x-2L;
	Fri, 17 Jan 2025 14:08:53 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH] image/populate_sdk: Support usrmerge for nativesdk in SDK builds
Date: Fri, 17 Jan 2025 14:08:50 +0100
Message-ID: <20250117130851.4055166-1-sean@geanix.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27521/Fri Jan 17 10:36:43 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 13:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209989

Some recipes(systemd) requires usrmerge. Create the required
symlinks for `/bin`, `/lib` and `/sbin`, when installing nativesdk
packages.
Enable the symlink creation by setting the `usrmerge` flag in
DISTRO_FEATURES_NATIVESDK.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 98ac723552c..edd9da91712 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -200,7 +200,14 @@ create_merged_usr_symlinks_sdk() {
     create_merged_usr_symlinks ${SDK_OUTPUT}${SDKTARGETSYSROOT}
 }
 
-POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk', '',d)}"
+create_merged_usr_symlinks_nativesdk() {
+    create_merged_usr_symlinks ${SDK_OUTPUT}${SDKPATHNATIVE}
+}
+
+POPULATE_SDK_PRE_TARGET_COMMAND += " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES_NATIVESDK', 'usrmerge', 'create_merged_usr_symlinks_nativesdk', '',d)} \
+"
 
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC}' if '${SDK_PACKAGING_FUNC}' else ''}"
 SDK_POSTPROCESS_COMMAND = "create_sdk_files check_sdk_sysroots archive_sdk ${SDK_PACKAGING_COMMAND}"
-- 
2.47.1


