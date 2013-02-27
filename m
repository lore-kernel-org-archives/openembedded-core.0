Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAi7T-0003e5-UC
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 15:36:57 +0100
Received: by mail-wi0-f174.google.com with SMTP id hi8so6319921wib.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=xHctBP2y+9MyiyUw4nA3m1rUDyXkxKin5/FLj3E85VQ=;
	b=K2+aIWUpuyZoLgg56DR5RLXPFydiQGHU0mb//S0TuWI3c9VI/d5OZs6JenM+T+Rczd
	rrtKJPLwtq5CsDUs5PpmwXn6DGU3m3/STS4V4cCskpnCanLDejtmMgviOKJgAYyD6nwI
	47T7+fb4x7l3B0pTayyceMsNmuE1YRaTCgBQNhy3pejWpA9u7MEvCeeqW+XKa1m4udUU
	Hlq9XRioC9O/udZlyz5FbsYdwrl3EURKS8+IA2v0ZEOiy0DP0gDVr36Nbaiu3tUfQ1ii
	eN3l4Gyx3Hwnganx49ePLp0xU+3C4Hp4n4/mRcCac4Sh02dxEe+GsMIEBz3E/aDc2V5+
	Q/Ig==
X-Received: by 10.180.84.165 with SMTP id a5mr26660498wiz.6.1361974811442;
	Wed, 27 Feb 2013 06:20:11 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bs6sm9053829wib.4.2013.02.27.06.20.09
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 06:20:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 14:17:40 +0000
Message-Id: <823ba4445519bc1180f65b543b0276b4dbb6e961.1361974597.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
In-Reply-To: <cover.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlnOrkWGihPN7iX6b9BFW3mVZKuiF0Zhm82BiP3114pbRh7y9mn9S3Md7v+Z3RLlchhgTh8
Subject: [PATCH 1/7] systemd: systemd uses libkmod instead of modprobe, remove dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 14:37:10 -0000
X-List-Received-Date: Wed, 27 Feb 2013 14:37:10 -0000
X-List-Received-Date: Wed, 27 Feb 2013 14:37:10 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 0c3ebc4..880fbcd 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -174,8 +174,6 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 RDEPENDS_${PN} += "dbus udev-systemd"
 
 # kbd -> loadkeys,setfont
-# systemd calls 'modprobe -sab --', which busybox doesn't support due to lack
-# of blacklist support, so use proper modprobe from module-init-tools
 # And pull in the kernel modules mentioned in INSTALL
 # swapon -p is also not supported by busybox
 # busybox mount is broken
@@ -183,7 +181,6 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
                       util-linux-agetty \
                       util-linux-swaponoff \
                       util-linux-fsck e2fsprogs-e2fsck \
-                      module-init-tools \
                       util-linux-mount util-linux-umount \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
 "
-- 
1.7.10.4



