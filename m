Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE356AC3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:54 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id v187so33916027wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IkeGc2u6GBJnwwSMSFXpz7a+HtupEIWAhkIFdqDcAbM=;
	b=dAIpZIXu3fLvZEYYsQVrC+MSRPbHALiqSjR9qz1qTj2OBqTxdSQqo8x3CUxnuafnbQ
	W9wiLcW6KuzwlDRu+gBaSYvgC3SGyoQitPoSrwnAr489IB8YgaDBQEej+HAjjwhldWLn
	xJeHgv2gzLyPNBgaRSOLFWUkaGSd+btTaulMLl3JWhiF04juvE0V6uF5rJ1JvrIBUUVe
	N7rgIhnsCIfrWVtuefo7Q+ge7UXj1OALD8LZdbyKu9xWLV7+6IhRLots/ovb+/8bVNz8
	v2qTVCTLVUd9fT/RAWa2ux7fAHG6PHXlha2vicSzxApcycqFJW4/cm096IU0/dEI3GfS
	YWbg==
X-Received: by 10.28.187.69 with SMTP id l66mr17852731wmf.21.1449755215464;
	Thu, 10 Dec 2015 05:46:55 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	yr7sm12532158wjc.9.2015.12.10.05.46.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:24 +0100
Message-Id: <1449755316-17611-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754341.git.Martin.Jansa@gmail.com>
References: <cover.1449754341.git.Martin.Jansa@gmail.com>
Subject: [PATCH 03/11] directfb: add fPIC to CFLAGS
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:55 -0000

* fPIC is missing when building directfb-csource.o
  | arm-webos-linux-gnueabi-libtool: link: arm-webos-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=softfp -mfpu=neon --sysroot=/home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/mako -I/home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/mako/usr/include/freetype2 -I/home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/mako/usr/include/libpng16 -Wall -Wstrict-prototypes -Wmissing-prototypes -Wno-strict-aliasing -Werror-implicit-function-declaration -O3 -g2 -ffast-math -pipe -O2 -pipe -g -feliminate-unused-debug-types -D_GNU_SOURCE -std=gnu99 -Werror-implicit-function-declaration -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o directfb-csource directfb-csource.o  /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/mako/usr/lib/libts.so /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/mako/usr/lib/libpng16.so -lz -lm -ldl -lrt -lpthread
  | /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-webos-linux-gnueabi/gcc/arm-webos-linux-gnueabi/5.2.0/ld: error: directfb-csource.o: requires unsupported dynamic reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
  | collect2: error: ld returned 1 exit status
  | make[2]: *** [directfb-csource] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/directfb/directfb.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 446aaea..e00b59b 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -20,7 +20,8 @@ SRC_URI = "http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-${PV}.ta
 
 S = "${WORKDIR}/DirectFB-${PV}"
 
-LDFLAGS_append =" -lts -lm"
+LDFLAGS_append = " -lts -lm"
+CFLAGS_append = " -fPIC"
 
 BINCONFIG = "${bindir}/directfb-config"
 
-- 
2.6.3


