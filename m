Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 32CFA7FD6C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 18:37:58 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id s64so3610372pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 10:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=d47G6svrho47FXPnD124QyybBxGnlfFuSG/uiqmGQTw=;
	b=NgRHw4q2zsuSieY8y8KgHFUxpwuzDBVi+Y/B7D9UP284UI8Vxu78JCGwGfIUZjrj6z
	CN5fch/sWh2uvefz1EiMhN2eSgPTt7cdM372RLasCBAOjSum7xEnrTkCckHmeDRU0n/0
	a2PNVNFcw/I68+5Ncn7HTb/2kIBDIgKyXSIuXVEUTUGucABEOjgDHoKSOodVdlw8hHth
	3UF5VByPXQoUvPTUOVuwmH5+sBrkiN1MvNv09Av+IwBtayRkDtYB2nUmRaDw+UMx5w7Q
	PydlRbYkGq4bnPV/S8kqKnBjk7j7C+Mkr5RjwvvUFuQpnEbzqJCrOWcFaDozFtwjup/n
	pf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=d47G6svrho47FXPnD124QyybBxGnlfFuSG/uiqmGQTw=;
	b=YycqGFKPDcZyLSRXL5xJAvAVCMMaFcl2EzzoIW1+XQoOUwupM6rNK+kjvIB8b3FQYV
	0n5lXRf2ol5dwgCnjlpi25D4tMD9/Petcy0ey5zdOP/iRCpC1S3Lq8Fr+zxWliKiTMdU
	iBC1pLSjQwRYNCrPuty3J3n8anWJCVFFBeEog1B7RtL4IzvnIHm9fZOykJrFi7XUkkG/
	ofx1Kwu78nqw3w5iZqU5SB4N26MA+wkxHoLRr2U/MqKSp59xnQA5UgnfrxHsOB3AUy3T
	d3dR8KqEc65rHHKVz0RCGvZn5l95P6jTEPImie0diSdTrgAuTsC8jV9PjNxxL+pgyhhA
	F/Tw==
X-Gm-Message-State: APjAAAXRUNZEc6Phv4MhN16mrb2XzVjiQSP6mw24dosPORuRH237pCqd
	04SjXzWk7kgSXnoFBtLqHM+4Jxls44c=
X-Google-Smtp-Source: APXvYqyBv6h+cD6DHx32CJ0d8dXuz42g2eIxKk11I5CB8l8JT0Rsc+BBxJVmJCMkQw1uIfrGZ4pVFA==
X-Received: by 2002:a65:48cb:: with SMTP id o11mr12905920pgs.313.1578595078783;
	Thu, 09 Jan 2020 10:37:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6f71])
	by smtp.gmail.com with ESMTPSA id
	x4sm8742249pff.143.2020.01.09.10.37.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 10:37:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 10:37:53 -0800
Message-Id: <20200109183753.2696071-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] weston-init: Let weston run without pam on distros without pam
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
X-List-Received-Date: Thu, 09 Jan 2020 18:37:58 -0000
Content-Transfer-Encoding: 8bit

When pam is not part of distro, user specific XDG_* environment
variables are not available since PAMName=login is in-effective and as a
result weston can not start because it direly needs XDG_RUNTIME_DIR
defined, therefore launching weston directly in systemd service will not
work, therefore call the helper script weston-start, which is also used
with sysvinit

extend enabling fbdev backend fallback to all qemu machines

Reported-by: Marek Vasut <marex@denx.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{qemux86-64 => qemuall}/weston.ini        |  0
 .../wayland/weston-init/qemux86/weston.ini    |  2 --
 .../wayland/weston-init/weston@.service       | 34 ++++---------------
 3 files changed, 6 insertions(+), 30 deletions(-)
 rename meta/recipes-graphics/wayland/weston-init/{qemux86-64 => qemuall}/weston.ini (100%)
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini

diff --git a/meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
similarity index 100%
rename from meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini
rename to meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
diff --git a/meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini
deleted file mode 100644
index 17ebd7fdab..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini
+++ /dev/null
@@ -1,2 +0,0 @@
-[core]
-backend=fbdev-backend.so
diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.service b/meta/recipes-graphics/wayland/weston-init/weston@.service
index 9ecf2ab069..39e193014a 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston@.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
@@ -1,37 +1,15 @@
 [Unit]
-Description=Weston Wayland Compositor (on tty7)
+Description=Weston Wayland Compositor
 RequiresMountsFor=/run
-Conflicts=getty@tty7.service plymouth-quit.service
-After=systemd-user-sessions.service getty@tty7.service plymouth-quit-wait.service
+Conflicts=plymouth-quit.service
+After=systemd-user-sessions.service plymouth-quit-wait.service
 
 [Service]
 User=%i
-PermissionsStartOnly=true
-
-# Log us in via PAM so we get our XDG & co. environment and
-# are treated as logged in so we can use the tty:
 PAMName=login
-
-# Grab tty7
-UtmpIdentifier=tty7
-TTYPath=/dev/tty7
-TTYReset=yes
-TTYVHangup=yes
-TTYVTDisallocate=yes
-
-# stderr to journal so our logging doesn't get thrown into /dev/null
-StandardOutput=tty
-StandardInput=tty
-StandardError=journal
-
 EnvironmentFile=-/etc/default/weston
-
-# Weston does not successfully change VT, nor does systemd place us on
-# the VT it just activated for us. Switch manually:
-ExecStartPre=/usr/bin/chvt 7
-ExecStart=/usr/bin/weston --log=${XDG_RUNTIME_DIR}/weston.log $OPTARGS
-
+StandardError=journal
+PermissionsStartOnly=true
 IgnoreSIGPIPE=no
 
-#[Install]
-#Alias=multi-user.target.wants/weston.service
+ExecStart=/usr/bin/weston-start -v -e -- $OPTARGS
-- 
2.24.1


