Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1F8C97D012
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 09:44:06 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id d4so26226138edr.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Yarvz1Jzj6DUmv4vUksGvBFvrq3fvo3bjDuU/bo5vhU=;
	b=Cjhj3/5fzEJ159IQScOHZLXTlQCoc8KlYVTHzB7q/gACux2KufiTdoYFOvutIDXJxD
	W63kFX/znEtjKMiG5Vm4ZNqruTc/KbmCJCeW6oDG7wMMUzfe7OA1ksCKHfSu/R2NJHq4
	zKAhdfx3jL1n9nhRYPQBfJ0sqvv8dTDJCEX+WZyT8bBFFn4+zPhZVA0Y2KQVQcu5FV3Q
	W7M2gHa8TGpdDv4IwPoM0ApRR/GETMJa+mHvmHGc6A6LVwrCLFkL00qHjkwRCXgSvzgc
	sgG8pWcr61DqNah6Eke1q96dziAeDaW5No70vlYcJkLK7WZV42obIc/TwNEGI666V1oY
	MHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=Yarvz1Jzj6DUmv4vUksGvBFvrq3fvo3bjDuU/bo5vhU=;
	b=cGf8EN9hozA8bive2snGk0R0jtagcO7V94lY665dcN2VJWdjnFNO/Q5neRGtP29nyd
	Qd5qf2R7VWdkUKqZk7mQy+csi8ks22BXGDtiXSGaeRzRuZLTZHKg+9Fs4GSG5cXNsJDy
	YSIi2Tx39P50OBFcp97hFIxGJqmZJshLX8iSPGg50WyGPb+WlVjAasWLWwzNK73I1mD5
	tJQocB7Tbykw8cFHNrq/XufNWKywBt1UN85csCOvX+1Nw5B04GJQqn5JdxElACzYepIL
	s9l0FeVHu2EPG2T0FOMgQXp5aa6YCIDZUIoM2QdNpO3YE19ilHMTJtK0jvja0LteRHbG
	DD4g==
X-Gm-Message-State: APjAAAWKhkWw7S9NdiioOLh/QfpKvVKwr1uL/u7aBPrqSdGEjBDw7HK2
	Gko/+8zUPkYxLG3OlheUEyYKBSC+p3U=
X-Google-Smtp-Source: APXvYqzwVSb1/h+VhEJFKlHGCQVXxn2wumoT/JRz1oicucKfU95Vora44WKHHL97RrcBdoK+bXtTsg==
X-Received: by 2002:a50:9168:: with SMTP id f37mr23365350eda.242.1560937446637;
	Wed, 19 Jun 2019 02:44:06 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id f7sm4772782edb.12.2019.06.19.02.44.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 02:44:06 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 11:44:00 +0200
Message-Id: <20190619094400.30358-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH] rootfs: Fix dependency for every dpkg run
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
X-List-Received-Date: Wed, 19 Jun 2019 09:44:06 -0000
Content-Transfer-Encoding: 8bit

Avoid getting a warning on do_rootfs.

Fixes:

NOTE: Installing the following packages: libgdk-pixbuf-2.0-locale-en-gb glibc-locale-en-gb libatspi-locale-en-gb gstreamer1.0-locale-en-gb gtk+3-locale-en libatk-1.0-locale-en-gb gtk+3-locale-en-gb gstreamer1.0-plugins-good-locale-en-gb gstreamer1.0-plugins-base-locale-en-gb gstreamer1.0-plugins-bad-locale-en-gb libglib-2.0-locale-en-gb avahi-locale-en-gb vte-locale-en-gb xkeyboard-config-locale-en-gb
WARNING: Unable to install packages. Command '/workdir/build/tmp/work/qt5122-poky-linux/bottlecam-image/1.0-r0/recipe-sysroot-native/usr/bin/apt-get  install --force-yes --allow-unauthenticated libgdk-pixbuf-2.0-locale-en-gb glibc-locale-en-gb libatspi-locale-en-gb gstreamer1.0-locale-en-gb gtk+3-locale-en libatk-1.0-locale-en-gb gtk+3-locale-en-gb gstreamer1.0-plugins-good-locale-en-gb gstreamer1.0-plugins-base-locale-en-gb gstreamer1.0-plugins-bad-locale-en-gb libglib-2.0-locale-en-gb avahi-locale-en-gb vte-locale-en-gb xkeyboard-config-locale-en-gb' returned 100:
Reading package lists...
Building dependency tree...
Reading state information...

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/lib/oe/rootfs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 9358f562c8..c62fa5f54a 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -647,6 +647,7 @@ class DpkgRootfs(DpkgOpkgRootfs):
             if pkg_type in pkgs_to_install:
                 self.pm.install(pkgs_to_install[pkg_type],
                                 [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+                self.pm.fix_broken_dependencies()
 
         if self.progress_reporter:
             # Don't support attemptonly, so skip that
-- 
2.20.1


