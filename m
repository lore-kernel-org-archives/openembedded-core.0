Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E5CD271A36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 16:17:55 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y139so2557291wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 08:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CBFO2u572W16NAcGLrcKvBc3ok/gaTdgXWsVJN0kAZU=;
	b=GtzUF4kQHo57q7l03KCLK1e1TSrd6eV7i4ilXWGeHwrUkau2k5otIKHoDzLX9MdU/w
	fQYFCN505+8Pf36u3suyxb4UO0kJoWWXi3nXbt61OfvIREUYZ2LJ1rAMaIrz6o4v+9IG
	GdHoZCbKcxzQccjVS3JOnXf2036jwh8cClzxt4Mn9aSheAjvgj+IRSFFvoJ6wgOoQRRl
	fiuNqpgAkuRbaZ2xRBkWYuwtpW4czgl+o182aQloU516PkIpTdyzJ7yP7uiKPlC5F+uB
	l9BMxUHepgDWp5e78cJ1zzj0OseUrAcyDgyCPCuM8pknPW3cmbT/vCEixXoFe1H7sLXe
	1Swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CBFO2u572W16NAcGLrcKvBc3ok/gaTdgXWsVJN0kAZU=;
	b=FQrPHSwINjeIabw+RhsEqLXFTWP/zuNw/JND+fhn/XpNm/AwhmG9oFpDL6jx1PRU3V
	gw/jsAEIlYL6aIJkpQk8maciYecTatz/XBUXB4jCi4s2/fSUVw/rOAPqBH8Gz9KFiT3S
	pICu7KFrD7NpG8K0rNtPGBhq59EXnycE6ghQR0pOG9y0It4LoGnCNCV9LHe3rTSlnj81
	KpZuf3pCfETDdrI7eemRvlyXqaJFtT+NJnrPLpYMcdJBW1V+BjLavDsOBFhlIXSeZfxf
	K96hct4uXAgX1GRHNvB16RvgqpxWI5G/Bxbp3tWKEohJ6gC1D1Y09/Hx6LDpT4qy4X82
	oE7A==
X-Gm-Message-State: AJcUukd85X8Rk18bd9Lhew9aO3/59e0pD7JVhaUZSlL1YXuuoa9G9vJP
	BZUUkavH9+MsNFVg3ckmmVGO9sp0
X-Google-Smtp-Source: ALg8bN5VppZ6Ul5lekdB/JLld571674GFpHlSPPgfN6Ttzt/T0PB5oQAlg+chbANrkOs8psXw06eHw==
X-Received: by 2002:a7b:c1d7:: with SMTP id a23mr3170380wmj.48.1548260276476; 
	Wed, 23 Jan 2019 08:17:56 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm161192189wre.91.2019.01.23.08.17.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 08:17:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2019 17:17:39 +0100
Message-Id: <20190123161744.45763-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190123161744.45763-1-alex.kanavin@gmail.com>
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/10] cmake: do not look into native sysroot in the nativesdk environment
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
X-List-Received-Date: Wed, 23 Jan 2019 16:17:56 -0000

I am not sure why we do this in the first place, but it is causing
cmake to erroneously pick up items from the native sysroot
when building for the target and the target item is missing, for example:

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/198/steps/7/logs/step2c

Note that for executable programs this variable is not referred to,
as set by
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
in the same file.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 8a0fb4cb12e..398069eef28 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -5,7 +5,7 @@ set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
 set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
 set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
 
-set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} $ENV{OECORE_NATIVE_SYSROOT} )
+set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
-- 
2.17.1


