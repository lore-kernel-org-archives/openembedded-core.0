Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SK6mj-0000GD-OQ for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 13:41:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3HBW01J012556
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 12:32:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11972-08 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 12:31:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3HBVrvi012550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 12:31:54 +0100
Message-ID: <1334662317.616.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 17 Apr 2012 12:31:57 +0100
In-Reply-To: <23138099c77cd3dc6af309c81ef52da03a9ad004.1334589214.git.liezhi.yang@windriver.com>
References: <cover.1334589214.git.liezhi.yang@windriver.com>
	<23138099c77cd3dc6af309c81ef52da03a9ad004.1334589214.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] qemu: Disable curl explicitly, its not in DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2012 11:41:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is an error when build meta-toolchain-sdk on Ubuntu 10.10:

| Installing NATIVESDK packages
| Processing task-sdk-host-nativesdk...
| Processing task-cross-canadian-mips...
| error: Failed dependencies:
|       libcurl.so.4 is needed by qemu-nativesdk-0.15.1-r5.i686
NOTE: package meta-toolchain-gmae-1.0-r7: task do_populate_sdk: Failed
ERROR: Task 21 (/buildarea2/lyang1/poky/meta/recipes-core/meta/meta-toolchain-gmae.bb, do_populate_sdk) failed with exit code '1'

This is because qemu would depend on curl if it happened to be
available at build time and could confuse the -native and -nativesdk
librbaries.

[YOCTO #2305]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8dee060..93325c3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -12,7 +12,7 @@ SDL ?= "--disable-sdl"
 SDL_virtclass-native ?= ""
 SDL_virtclass-nativesdk ?= ""
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL}"
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl"
 
 #EXTRA_OECONF += "--disable-sdl"
 




