Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E5C8C7CC76
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:15:21 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d17so21858573wre.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yc39066Z59kogedpWcaQBpd11/jl6jgu4mbFiHRcIX8=;
	b=Enjr4oKLR8893GFVbt7QXNASRqBDoPRO+ChKQbTq8PalYBkf0Ok4DBd3fnp4VNeN1L
	E20SXtP3Sj3bjZT93QZs1GQIuouOZQ2rSJJbL8nVsvWX7slre7X0599eib5hyYB1gRFv
	GbMiKXdNxZg4gncR65Xia/tP+lsnpZMsBjYydNaZOfhmTc7f0Uis0pzv9ay+j/2iMPDH
	OD9BMSwpB19t2TqKoeKuk8RL+Q161sgMgWN/co2GaMqi9LNC2ZCcImWQ0yWwpKESAya9
	D0KiA0yhr9M18FggdzW6q68DQvQ7lj+H7Bvs5I08rZon6h8HYy4AFDlEHZT4UviA6Usw
	5KeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yc39066Z59kogedpWcaQBpd11/jl6jgu4mbFiHRcIX8=;
	b=eCOA3W9cNr/eY35HbUPa30F/TU27w5Oslrpw+Ixp19SkzGhoiagBRoK4hlkpYaslYS
	ZQtSBGPja1IxoMV5JnskfJNMC0LymP8PWeFV41xZs/Ei6GzLDca04qmWnuRgb78YUjDK
	LLIlVEj9lv5egq0P3R7B3aR569uYimjToDaQHkbM9o1bkYcjivfjWJyRq0E6bNOXznLh
	4WjNZfkCq1RwzS2Cvqo56sBasJ48AsMuuucS3zUXQHFzxFx5SWCP0MAHpMjrU8sXi0Uu
	UPF++cEh5EFlCehT1T8jfMTKpgiimmnFg4yRPjxM3ZHidkF1xFNFGIBSi9eOjpKUEy+g
	lspw==
X-Gm-Message-State: APjAAAXO0accnjEGXUH6azjVIE3znw31EZOo3YsSUVzwmV/C4kFJkAdK
	6uGFkzmzDXnc4Y9wgOg2WlFy//rx
X-Google-Smtp-Source: APXvYqwCDFie32ox3JTNIToVfBF5haqJcsCUDSiaGddw1H0TFtcbQvEkNV+P1eCAccOGCFKEmbcvvA==
X-Received: by 2002:adf:b648:: with SMTP id i8mr6204554wre.319.1551359722468; 
	Thu, 28 Feb 2019 05:15:22 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c17sm13644910wrs.17.2019.02.28.05.15.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 05:15:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 14:15:09 +0100
Message-Id: <20190228131510.43557-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190228131510.43557-1-alex.kanavin@gmail.com>
References: <20190228131510.43557-1-alex.kanavin@gmail.com>
Subject: [PATCH 7/8] runqemu: add an option to choose the SDL frontend instead of Gtk+ default
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
X-List-Received-Date: Thu, 28 Feb 2019 13:15:22 -0000

When Gtk+ and SDL are both enabled, qemu defaults to Gtk+.
This option allows to revert to the 'classic' frontend.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index ec6188ba4a2..bbf539a8e67 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -74,6 +74,7 @@ of the following environment variables (in any order):
   MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
   Simplified QEMU command-line options can be passed with:
     nographic - disable video console
+    sdl - choose the SDL frontend instead of the Gtk+ default
     gl - enable virgl-based GL acceleration
     gl-es - enable virgl-based GL acceleration, using OpenGL ES
     egl-headless - enable headless EGL output; use vnc or spice to see it
@@ -404,6 +405,8 @@ class BaseConfig(object):
             elif arg == 'nographic':
                 self.qemu_opt_script += ' -nographic'
                 self.kernel_cmdline_script += ' console=ttyS0'
+            elif arg == 'sdl':
+                self.qemu_opt_script += ' -display sdl'
             elif arg == 'gl':
                 self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
             elif arg == 'gl-es':
-- 
2.17.1


