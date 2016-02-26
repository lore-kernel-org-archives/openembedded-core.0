Return-Path: <net147@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1AFDF6FFEA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 10:52:59 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id e127so50579094pfe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 02:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FzHT8YPHCERt3eZnGb5QfXaWhWcsQMVmqKai/2NbNhk=;
	b=AJz7WgMSLIAgjYpwJ1G7eZpqpIbzXNGTk7yJ+8jSqgTADIpCI5xKeTM2eBqE2e/lqv
	ktXFtrxYsnaM5xdZPU7OJBVChKP6gygGzhc7ttKTzaoYH7tsn2XqnK5fCJSD+oBGEwnL
	hAje75vznAjBikdtLMcN0n/daaiw5l+v2KfuZJ1eza7IdWlXG70EVOmPOnmpLNURwjkK
	RAHPlUjwy9XpIHjm9MTfL61vcfUGa9cKQqINrvmbamhyLqMbHjG3ctZ850qj0ilLfnnO
	cwfgA9T/lcc4gB6lRZyx+AOY2gYoedPd7naFG30nTSCg+esjyoVHfz0c9Eurf9VfXQff
	/eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FzHT8YPHCERt3eZnGb5QfXaWhWcsQMVmqKai/2NbNhk=;
	b=Kl/KjuUl9RPQZPj2Vl08ESz1FtcoUHAOdjuzkZNUqu+sr8d3DQ4Ce50lIPk4SxMjvU
	6DyS71RTlxXngmV2blsJBjMJC3z8P2RoylA2EYK0i7jqJqkoO8I4iwmN5Qot/IW2wjF/
	giVdFpS364CvDk5PfpVg4oueyAWlNk1jtC2b9BY/1JtT3uxTcNfwQH/i3B7A2CnFf7qb
	XklLBcT8AngDHNmQwjOVpR1/qvx7zKBLUBxPGdsYglKqlmYP4p3j0TRZZ0ib/ETOrfVt
	VizWW9QouCwjezPXZmJbbO0VVRvudU1NQw2+amxG/ftNyN52wwUP0r2OZsYlZf+LZMDU
	Eq7w==
X-Gm-Message-State: AD7BkJJjhi9u24YyFBy6ipiLoMb+sJKRz4OjziKeeHfXUOlIns+5c9Z0Ys1cltgNAU/UnA==
X-Received: by 10.98.7.219 with SMTP id 88mr1082315pfh.49.1456483980626;
	Fri, 26 Feb 2016 02:53:00 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	x13sm18494852pfa.72.2016.02.26.02.52.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 02:52:59 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 21:52:25 +1100
Message-Id: <1456483945-16340-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH] ffmpeg: fix build when DISTRO_FEATURES doesn't contain x11
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
X-List-Received-Date: Fri, 26 Feb 2016 10:53:00 -0000

If avdevice is enabled, libxv is used if it is detected by configure
for the XV outdev. However, we can't depend on libxv for avdevice when
DISTRO_FEATURES doesn't contain x11 as this will result in an error.

Fix this by adding a libxv dependency only when the avdevice
PACKAGECONFIG is enabled and DISTRO_FEATURES contains x11. XV outdev
is only one of many that are supported by avdevice so it is still
useful to enable avdevice even if libxv is not available.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
index 72393b3..f29c05e 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
@@ -23,11 +23,12 @@ SRC_URI[sha256sum] = "25bcedbdafadac3d09c325c1d46a51f53d858b26a260d5aed6b4f17fea
 PROVIDES = "libav libpostproc"
 
 DEPENDS = "alsa-lib zlib libogg yasm-native"
+DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'avdevice', bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxv', '', d), '', d)}"
 
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "avdevice avfilter gpl theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice, libxv"
+PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice"
 PACKAGECONFIG[avfilter] = "--enable-avfilter,--disable-avfilter"
 PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
 PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
-- 
2.7.1


