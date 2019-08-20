Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 149607EB92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 15:32:27 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id o4so3018749wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 08:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=awMJZbI7eMrHcD6d6alLzcm3tsW9qRDpzqfx4mrLLH8=;
	b=ZwBm8Jc7pO/qbcZU7UYCj/tShU9xNRcNb+6cYdeE3ku2YK/J62Uwi0vv4bD66KbzWE
	26tYuiLWKxHGdBFTs6YZ1OmacKivJ1tPEPPT0cKKEEz4XsGjndWF6/N2OXDvzbmsppRP
	zHXrUf1FYjNw98zsAVcZ7rWxMHjQeBbCoAWYyrPvuDDtrnOFzdbxfoG6JoubhxV6bwj9
	oJhJrarIKgEsAgVzvkO1AD66bsOwW0dHQAlrzMgy1oK6CPhVvTI9FgGNC7Yn4eS2g+ty
	sMXRpzAkB/PJJNe5gYecjAbR6QcvggD+gKNR7ieutF+YVE/BLogt6u/fkntUIsFHImNI
	kUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=awMJZbI7eMrHcD6d6alLzcm3tsW9qRDpzqfx4mrLLH8=;
	b=Amlx9acCHRSJmwi5Fy1T/hTLSyYE8R1CbS0D7+ab1+xzkO5AMV1ePIDZ0JvcICq1qo
	PiUnI+xpEYyMdXweRq3Y3jTNeRxhh1W+Q/mERIa/WrlxDk1BefxGY9tlSfyFr4aLLAi/
	JGhshsrZL/RHu3YQIT4JceiJq7mliYETxATZKSGgS4I7r+5XqWmP7bU3RO7Pa5/zwfK3
	mPE1bVZlq2uKwn5SurlvyvFEFOAGSYQaIPGBBnt9Dbc2vqmDTRLimu6p+T1BzK+WwY2/
	IBnspGB1yZGpYs5hegWjej/cuGLQc8hCSNjIpnbeNSBoWMDwJFgmsD3u5r7ntHLzHw7p
	r1aw==
X-Gm-Message-State: APjAAAW/l/ZK+oyg7L/M82C7cVfMARGmNonChHfT/oyvwi3U3X2FkTan
	HJSBWz4sTEwmJJDRUi1KXpSOQS8pMOY=
X-Google-Smtp-Source: APXvYqwxo0+2v4Q90SaAf0SLyE3H81Gj64Ba+mdJoY5oF4nnvDjucquU783K6N/3nNv1QqBBRw1BzA==
X-Received: by 2002:a1c:9a4b:: with SMTP id c72mr629693wme.102.1566315148598; 
	Tue, 20 Aug 2019 08:32:28 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 6sm466700wmf.23.2019.08.20.08.32.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 20 Aug 2019 08:32:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 17:32:10 +0200
Message-Id: <20190820153219.62435-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820153219.62435-1-alex.kanavin@gmail.com>
References: <20190820153219.62435-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/12] images: use 512M of RAM in qemu if 'opengl" is in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 20 Aug 2019 15:32:28 -0000

256M was found to be no longer sufficient, as the X server fails to
start with the modesetting driver and 3D enabled.

Only images that actually include X11 are adjusted.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 ++
 meta/recipes-graphics/images/core-image-clutter.bb       | 2 ++
 meta/recipes-graphics/images/core-image-x11.bb           | 2 ++
 meta/recipes-sato/images/core-image-sato.bb              | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index e9cac98c572..3f1b1c7a5ee 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -11,6 +11,8 @@ IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegro
 
 IMAGE_FEATURES += "x11-base package-management splash"
 
+QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
+
 # Ensure there's enough space to do a core-image-sato build, with rm_work enabled
 IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 
diff --git a/meta/recipes-graphics/images/core-image-clutter.bb b/meta/recipes-graphics/images/core-image-clutter.bb
index b0f25cf1b14..a594461022f 100644
--- a/meta/recipes-graphics/images/core-image-clutter.bb
+++ b/meta/recipes-graphics/images/core-image-clutter.bb
@@ -11,3 +11,5 @@ IMAGE_INSTALL = "\
     "
 
 inherit core-image
+
+QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
diff --git a/meta/recipes-graphics/images/core-image-x11.bb b/meta/recipes-graphics/images/core-image-x11.bb
index 8455bb8caec..cd5374949d5 100644
--- a/meta/recipes-graphics/images/core-image-x11.bb
+++ b/meta/recipes-graphics/images/core-image-x11.bb
@@ -7,3 +7,5 @@ LICENSE = "MIT"
 inherit core-image distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
+
+QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index b8979502856..878e0eaa8d2 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -10,3 +10,5 @@ inherit core-image
 
 TOOLCHAIN_HOST_TASK_append = " nativesdk-intltool nativesdk-glib-2.0"
 TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool nativesdk-glib-2.0"
+
+QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
-- 
2.17.1


