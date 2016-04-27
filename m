Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2D88E731D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 08:28:37 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id e201so27734188wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 01:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=xAX1sYGworp8RWo+3NttyIwpIaZ+gUxAcNyNbGwCNTE=;
	b=VsVVt9cgha6amHJIb+w8z5kUWLpPeBYHcRnR+kC/hw3ZIn2rmqBXbtf1oQRGNVBnDb
	P91opp2bTtsAy//nQQP3u1/xKrxjiJXI0PIv5JBuAX5w81TG0/RRjkyniE3643+a3GJf
	e1CsGbp6c1Z8S6DIcxupDpzWxR7m6IRMuLFXtr0e0EYBXgPKiYpYTqspTQCKDYuXn2qZ
	6YgAqopdd+WkhalQ4WJXVyo5a5KYpfeuPegHKmKt3MxDJF64i98ptPKGixrr0sIs1DAc
	Bh0rMmt9z5q4RTbJWgmNyZZ/LLFnfqHno+rUPjVLRbLOsVMkrfikkauIwssPq3tGODuV
	MnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xAX1sYGworp8RWo+3NttyIwpIaZ+gUxAcNyNbGwCNTE=;
	b=cyJTCI+iRQ0rT1sSjUxbGChCY+dfcQIBLqOJOCvBmbM3QKFBNlvWpgs4qvVPyjRz4Q
	VJp61XtpevKLF+giLGcDa8Xvg8YWgqlR4nSHYf4CIBhq0SBJvczDBxKVhpxVyc8Bb/5a
	RhkHl7npDkD/o40+m5lIvh2jwO/ZwpbXaxlEaDwR+I/r0hD6yIYLml+Y5eCqHQj6xlKx
	SgfvHSo5z5d1s1KWJ8NAj6p3CzNgTq93zRAQ6LmIYfzjlCoLOZiseBtfLVQhQVb7PVTO
	xy9esD1Injei4WgyAP5nMsadpspoWr/d1UJsCzGMIAQTSRu3DWAxBGePJltqhaWOfhZb
	FOYw==
X-Gm-Message-State: AOPr4FWZuGP/fpc5Ds3ueJtwohXNVwU8BwYb7zY6JQOSeXbghhSOBTe45LLHqf+x6vc0o552
X-Received: by 10.194.107.6 with SMTP id gy6mr7807834wjb.20.1461745717878;
	Wed, 27 Apr 2016 01:28:37 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	u12sm7178081wmu.12.2016.04.27.01.28.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 01:28:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 09:28:35 +0100
Message-Id: <1461745715-7370-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] qemu: remove explicit but redundant native build dependencies
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
X-List-Received-Date: Wed, 27 Apr 2016 08:28:38 -0000

qemu-native was optionally depending on libxext-native if the DISTRO_FEATURES
included x11.  This dependency was required back when we didn't build
libsdl-native and causes an undesirable relationship between DISTRO_FEATURES and
qemu-native.

As the dependency isn't required anymore, remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 95fe66f..36d600f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -97,9 +97,8 @@ PACKAGECONFIG ??= " \
 	"
 PACKAGECONFIG_class-native ??= "fdt alsa uuid"
 PACKAGECONFIG_class-nativesdk ??= "fdt sdl"
-NATIVEDEPS = ""
-NATIVEDEPS_class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxext-native', '',d)}"
-PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl ${NATIVEDEPS},"
+
+PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
 PACKAGECONFIG[xfs] = "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
-- 
2.8.0.rc3


