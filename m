Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5D68173199
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 23:52:34 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id n135so5577648qka.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Rk0LM9r3DiRgDxLcv2qSBu5eIDhBlXUJaDcapKhqLXs=;
	b=wm1+EYS1k58uzphulssw/tt6qqiOMCB7gGj4WPoLoUuF10UilVeDkWuLf6i6GIq7eJ
	TcBK6G/Qp1GP/0lDiMFru442SCv53ceIHC/F6z1kjgJLGvYld5lgZ9eG80E25VwEfx7R
	KVoCmyq0I3GJk59dDCqHYpeLPpL+9GxRTTEVUrWCdVSRL/SV7EkYMCfiwjzF8kuYDrrv
	jKK+6atuJuyD2OuqHL1DFKQ6aRICwNfsCEP/xqxTq66uLmMCmjP/faLL4svItH95Z/EA
	baaBfEEL3d2jCQXePBujYvu5qW3a6Ah/BgfV1nVTY1wLPH58scx18aUncTN7trETznRP
	FRMw==
X-Received: by 10.55.221.210 with SMTP id u79mr15025824qku.59.1450569155236;
	Sat, 19 Dec 2015 15:52:35 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id c2sm9785372qkb.41.2015.12.19.15.52.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 15:52:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 23:52:15 +0000
Message-Id: <23c86af5557f6795c4827d5b2db683190bc80975.1450568936.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
References: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
Subject: [PATCH 06/17] tcmode-default: Use glibc for nativesdk version even on uclibc and musl
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
X-List-Received-Date: Sat, 19 Dec 2015 23:52:34 -0000

We do not have musl or uclibc based systems for building OE itself. Most
of build servers run glibc, there will be other issues to build OE on a
uclibc based build system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 51be202..16507c4 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -17,9 +17,9 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
 
 # Default libc config
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "${TCLIBC}"
-PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-for-gcc ?= "nativesdk-${TCLIBC}"
+PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-for-gcc ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
-PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial = "nativesdk-${TCLIBC}-initial"
+PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial = "nativesdk-glibc-initial"
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "5.%"
-- 
2.6.4


