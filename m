Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 121C97C341
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 11:00:08 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y185so15178715wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 03:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8eo787h00lmNawve0KLMZmco67H3a2i+YKufnz9TILk=;
	b=ZPqTDihgHWg1megAvaLsGKiGJ5WLuYyCKGUEw/iyViESkAWlM/eBxxCeNLti1YHpDv
	bvy3SSImBqIuEZ2IYim3qasJJspxHS2pY+AubUU7U82TLRO10bk3kiBcCdtZkHTcZ/dZ
	CgFqLbF9cC09mzogxa9NgADik6Q0cXSAXZL1I2a3ZNk6y+TdIuX2Cq3pUNym8hP4OC64
	ZumPbliw1JyzuDNDctBDXgWh8VrtfrZCxz/RQvK4fgtue41MFbyQJxZZDdQjqDwKrPgI
	6fgX9Yir8tvlic6HzmCd2P/tezztAPjM1QAnN7BnYJxKZ+p67D9VoCqW6FbofU5r2lJ/
	a6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8eo787h00lmNawve0KLMZmco67H3a2i+YKufnz9TILk=;
	b=araDa23tjYwnngLwMC7TOvjrOdYs7kXktWm9As7YCEuCNP8e/nvCKBWZvQPVYDYzAY
	FnreOIoV3cUh5WkqDja/WxS4PbsxvhKn9VXu7BkuHM/hBYVKfkFiEeUKcG1a1LNdYggv
	S7xQx1OU7xKvnfDavlDcjNzDJobYR+FdpZHNSlS4h78iiS5O3vzfJkaJYRSG5aC478bH
	RtUOQkyX11tyW0UVpS31U6pADnAHxMkVuTxT0F2s5zgMOXXRQfKch25QXrKbVOWU/7cD
	1QCv958WMD9yFwjVQa257i0ipfwtMPU5rbldEkGtcaeqZl6dFpEjMbO4QWNJpwW4LgYK
	yC4A==
X-Gm-Message-State: AJcUukdPCRVT77N5/UwTvSGBujxgh/teY89bGOJ6IWf6tbENj3ZoSEJt
	y4clyaB5XiFnXKHBDLsZndwDGL0b
X-Google-Smtp-Source: ALg8bN6AIczvWyYN1uE01W4uqzp/esSbw+TS9crloK5tZ+QJ89p9EP0BXYagvaqun9wuo6sy52rxZQ==
X-Received: by 2002:a1c:b456:: with SMTP id d83mr25887590wmf.115.1548846009477;
	Wed, 30 Jan 2019 03:00:09 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.03.00.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 03:00:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:40 +0100
Message-Id: <cd339358a96a6607acfaa5eed115a659ef9a296f.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 17/20] runqemu: add options for enabling virgl GL acceleration
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
X-List-Received-Date: Wed, 30 Jan 2019 11:00:09 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index c4a0ca811d9..50888a532e8 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -74,6 +74,9 @@ of the following environment variables (in any order):
   MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
   Simplified QEMU command-line options can be passed with:
     nographic - disable video console
+    gl - enable virgl-based GL acceleration
+    gl-es - enable virgl-based GL acceleration, using OpenGL ES
+    egl-headless - enable headless EGL output; use vnc or spice to see it
     serial - enable a serial console on /dev/ttyS0
     serialstdio - enable a serial console on the console (regardless of graphics mode)
     slirp - enable user networking, no root privileges is required
@@ -433,6 +436,26 @@ class BaseConfig(object):
             elif arg == 'nographic':
                 self.qemu_opt_script += ' -nographic'
                 self.kernel_cmdline_script += ' console=ttyS0'
+            elif arg == 'gl':
+                self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
+            elif arg == 'gl-es':
+                self.qemu_opt_script += ' -vga virtio -display gtk,gl=es'
+            elif arg == 'egl-headless':
+                self.qemu_opt_script += ' -vga virtio -display egl-headless'
+                # As runqemu can be run within bitbake (when using testimage, for example),
+                # we need to ensure that we run host pkg-config, and that it does not
+                # get mis-directed to native build paths set by bitbake.
+                try:
+                    del os.environ['PKG_CONFIG_PATH']
+                    del os.environ['PKG_CONFIG_DIR']
+                    del os.environ['PKG_CONFIG_LIBDIR']
+                except KeyError:
+                    pass
+                try:
+                    dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
+                except subprocess.CalledProcessError as e:
+                    raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
+                os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
             elif arg == 'serial':
                 self.kernel_cmdline_script += ' console=ttyS0'
                 self.serialconsole = True
-- 
2.17.1


