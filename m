Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD8B76312
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 15:03:08 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id vy10so5061532pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TfOeB7965jSu8YhO7pJEIel48cJD8qDJ2MXCmMNc1fo=;
	b=eZHRWterISSNYAmYFJ5REWmSnWhb1Z9eh0rFw/qu4Mj0EKQVUsAzDOh+t1AvNtDtzz
	wmTslTVqQP8z6VsR1dWEE0I/RwE4UxdWfdwf9gARF4+oGnFfGtYSu0LwPCZP262Ch26t
	HLYGq++XO2LnvDVVzjVHDeTkmFVIPFJdbFhwa6Yhez+F2iZ/r7k+/FTikRVWkurqSvyh
	ILnF7NT5+o4VZlQFgeLSJH6j+8ALuak6j1KNV5as8AkPfdXNv/mIeP65FUfgrl0+UWV8
	XD8VUPsU1ncsW1J3X4uuFF4eaa65maFNP30DM+OcezeP3rgWLhvz2JSMrIvRpG8Z6bEw
	nr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TfOeB7965jSu8YhO7pJEIel48cJD8qDJ2MXCmMNc1fo=;
	b=gNdfIAttjaexwdZOIBeIAh1djJIY0eY5nv+14vJBOBQcfkraJaEOPV724PcYOLk/yl
	Wjp9KGEZi0AtDhSsZOck2Ggk2cPPvR89fNNPNhyP49yKPoCCGXnYeina9SBGwVQI9pzo
	GJrzZowzHuRVzZcwoZT6p20U1/cP2qmMqZJJtJLBLEWxVEkP2V6GvX2j/5Cf42GJvliD
	TljgUS6CuKcSGxuwRhie9fLlM8ivNnTkI5KPmTpCNwNo4I1vuhTiz8eyxX7XmkT+LGfi
	EABYF/zzoGXRGaaWm6jeneB6UhG8iWwFDl8MF9yFrpt1x03C6Nr928bnQ/WiknY+eBcN
	yEBg==
X-Gm-Message-State: AEkoous+uM1xSxraIh4DOXRnLRARcgDHDkFD0PoBsF4cXD46kxGwMCT58kVOyYVuC+2dIQ==
X-Received: by 10.66.148.7 with SMTP id to7mr24833162pab.128.1471705389720;
	Sat, 20 Aug 2016 08:03:09 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	n80sm14754199pfi.19.2016.08.20.08.03.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Aug 2016 08:03:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Aug 2016 08:03:00 -0700
Message-Id: <20160820150300.15345-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160820150300.15345-1-raj.khem@gmail.com>
References: <20160820150300.15345-1-raj.khem@gmail.com>
Subject: [PATCH] xserver-xf86-config: pre-load int10 and exa modules
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
X-List-Received-Date: Sat, 20 Aug 2016 15:03:10 -0000

musl doesn't like lazy loading that xorg uses, therefore
load the needed modules explicitly

[YOCTO #10169]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-xserver/xserver-xf86-config/10-preload-modules.conf           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
index 7ceb6fd..132459c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
@@ -3,7 +3,8 @@ Section "Module"
     Load "fb"
     Load "shadow"
     Load "shadowfb"
+    Load "int10"
     Load "vbe"
     Load "vgahw"
+    Load "exa"
 EndSection
-
-- 
2.9.3


