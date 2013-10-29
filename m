Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 58C726D123
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 03:41:15 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id w10so6178732pde.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 20:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DeJWQjZgbjIBbe4rKzcP/geWyScI/G+qVbcZzrABmwM=;
	b=UeXSO0O7mAqNSVFLsP8MjQOliN0x0BXp5UnlNH4rAN94HJ96uCsoFxWrsgiKz+ntnX
	tsUPWqlE7DLGtoogDmMxVPX99RGklklIPomfkrD6WWRJg6Np4eeWM4JRjZYFoxvpqoi7
	Lu3CpGa3t8CmZykUWVhTLqDkGJ5WNp+4N1eNRYWuAuxYQuKuYzUGVS0i7siZdmfwXRS0
	CeU8dRipxje+E3pibV398bgG7oZ7/6M4behjdOT4Z0J1lYTzQmR3MSZ/mPLr5La9LV0Z
	fe9jOG3c17OFATrZvgJ2dv6REwF5aI6JIKQ3w2HHxWb+SeLhuxggB8GPfMNE94K5UJyP
	/ERw==
X-Received: by 10.68.216.132 with SMTP id oq4mr24841947pbc.50.1383018076233;
	Mon, 28 Oct 2013 20:41:16 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id ed3sm32000843pbc.6.2013.10.28.20.41.14
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Oct 2013 20:41:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 20:40:47 -0700
Message-Id: <1383018047-2219-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] pulseaudio: Fix build break on armeb
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
X-List-Received-Date: Tue, 29 Oct 2013 03:41:16 -0000

There is no need for += when using append hence removed and added a
leading space appropriately

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 4c10aa9..bb13f4b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -43,7 +43,8 @@ PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst libice l
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 
-EXTRA_OECONF_append_arm += "${@bb.utils.contains("TUNE_FEATURES", "neon", "", "--enable-neon-opt=no", d)}"
+EXTRA_OECONF_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
+EXTRA_OECONF_append_armeb = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
 
 
 export TARGET_PFPU = "${TARGET_FPU}"
-- 
1.8.3.2


