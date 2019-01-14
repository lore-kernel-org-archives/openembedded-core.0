Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD0727C03C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:31 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t6so23169305wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=p31JseOadzxFTMQbIPnl/qbzMBLpnkwhLA58Ed5Sj/I=;
	b=s1u8ntjLwLs5llJYIky+lL0TeTbHjQIQ3dGoi9ImOEg3c2MM5V/c8voFnL7W/FOk+H
	KDJoVvzt7krUDeSMp+H1jPyRfwX1jljFRK0GjpE1iy8+7tjY5CRGzfARCHSLK1al4K28
	L7aUgWs/8SjSWm4awk2x6GAULHhyr24xAzu6MFxs9W3oGbbcBO5M0D4cYywob9Hkwmq3
	mwRCyYSESJvWUxV8To3+kC0KuY5JySuEqIKzbRZ/QmSvjht5lUAQizUdfv2rtowgaXtv
	7L628m5InrEePCcgQwuJrRWs3EhEu23f3MGEysPmYI8j3H6qwfshynZ9Gyhnsxd8QOJD
	SA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=p31JseOadzxFTMQbIPnl/qbzMBLpnkwhLA58Ed5Sj/I=;
	b=ZtDCyxYD3tc+ANGZj1ZLzNL0xvh03urcCMOjUanMgXHFcjTe52VfTkLhSkyhepK9Dg
	cTa41HB1/Mlw//xG7Xr8TTVhmrogNuhsp5kEVcc7k6tcJhG7EwbQw7eaokoTrK6WJsAK
	+4CmtzUO0WyehUlnG2B39q/VO8AafOOtYWINOTPLXu3QnKKT8NBYVqpiWKPnLDZQqjwg
	vOm8o9h+yrT6AjVg03eqNiPUgWNcdQ1MAwFxsqj6caZnlQDCxtgwyG/Bb8+cwrhUF4LE
	ArpJJTlRelSPXnf42+z9EmViyjnPlyCCGUCjhx7Hf1U5QUDS/j+B3EuMvuySbVQ3Ox4c
	xX8A==
X-Gm-Message-State: AJcUukdTfu3OpZFWWzglOY9lRnwk7/6z9v5Gwj1hQZVupX2NSjPcMFdN
	nL0pu87WOYZWe+CqZ+3zPH2iyz5v
X-Google-Smtp-Source: ALg8bN5nK8jctivQAbRZxYaE+0CMeDuzbd0covvo6M/5OnX+b4XnQ4voJgi8LHS5KwIK2vjBFn7clg==
X-Received: by 2002:a5d:6105:: with SMTP id v5mr23950521wrt.63.1547478211960; 
	Mon, 14 Jan 2019 07:03:31 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:03 +0100
Message-Id: <3a7a4903e87c0cd564e7652c463cbc6baead9cc6.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 07/23] libepoxy: enable native/nativesdk variants
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2019 15:03:31 -0000

libepoxy is a requirement of virglrenderer. Note that we strip
RPATH from the library, as this allows fall-through to the host
GL implementation, instead of attempting (and failing) to use
mesa-native.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
index 92f644c039d..45995325d2c 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
@@ -14,9 +14,21 @@ UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 inherit meson pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
+REQUIRED_DISTRO_FEATURES_class-native = ""
+REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
 
 PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
 PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no, virtual/libx11 virtual/libgl"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
 
 EXTRA_OEMESON += "-Dtests=false"
+
+PACKAGECONFIG_class-native = "egl"
+PACKAGECONFIG_class-nativesdk = "egl"
+
+BBCLASSEXTEND = "native nativesdk"
+
+# This will ensure that dlopen will attempt only GL libraries provided by host
+do_install_append () {
+    chrpath --delete ${D}${libdir}/*.so
+}
-- 
2.17.1


