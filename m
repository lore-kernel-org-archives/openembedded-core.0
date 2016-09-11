Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 47182731D2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 17:13:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b187so10373987wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 10:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EmaThGub+F3KcfC7WuDrabxbBEdbncAYPfFTmatdR10=;
	b=ivf8LVppCvCNyXIE41RjB3peJdpL2mPsUFK8qT6TKHHQRWH7Q+s0yvGGLCYLlyjSM9
	AfZzfCoqufTelRwa5x7v9Ms3mG/BPyO5mdPkIvSRi50tkQX+AjDJRChJhZMqMninweg8
	BT75klPuXsQ+//OgDmTmuBJ2n6ZXzZJWW2HM87ah+LLpo4LE24HZyf5TmEgwXOMGG45c
	VLHutk0zC5i95WH0HB87SqvvT2i85zDzXzoeP8v2iFN4C5QX92NGJ3rBmeeKRiWC9Wld
	C69dX7m341p8TmXAXE8TbHqRYd+8bLeKILFG4WSKGU0GMPo2qDfdqJqxruLGavRKTdaB
	D2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EmaThGub+F3KcfC7WuDrabxbBEdbncAYPfFTmatdR10=;
	b=dexz0vSlw/FLx5nJCXArVooMPZqRhmAZG4PJJS86vHJA1OKl30WPt5EpBNQRA3Hikl
	03vdIjnYlcRRzVfGSldIDMEkVBGkms2/f9lTJm4NNKeA4/9gk4F55xiOWjLbIxtweuLc
	uCRPIIXj0lh6tUnY/u/VOGp6le6VUwthizNfuGQu0AjI95HpCmYeYESwGRao6yqdMEYP
	SrEiJa5P4yly4C/IwvdtM+W8jWNgXTBB16jpHNSuuZxvL5vIcU1TEuekyOeIv75zXbB7
	NW4uXFMI+6iqL9NVpUxPvHbESLTbUW5e6IbwhIkESCiEOLhuOxlkmqfzOXiTqpFpVGNm
	VUXA==
X-Gm-Message-State: AE9vXwMjNU+vUuWruNz5DK7xJ+J1eb2jd5cpDpf1a0+DErezfaP9MFiz8Z1YQlntPNRbXw==
X-Received: by 10.194.184.39 with SMTP id er7mr11603206wjc.159.1473614036029; 
	Sun, 11 Sep 2016 10:13:56 -0700 (PDT)
Received: from Saturn.local.all ([194.191.225.91])
	by smtp.gmail.com with ESMTPSA id
	o5sm13750287wmg.16.2016.09.11.10.13.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Sep 2016 10:13:55 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Sep 2016 19:13:20 +0200
Message-Id: <1473614000-5924-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [Patch] sstate.bbclass: normalize whitelisted paths
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
X-List-Received-Date: Sun, 11 Sep 2016 17:13:57 -0000

Without this a whitelisted path containing /../ breaks the test for a file
allowed to be provided by more than one recipe.

Noticed when local.conf contains:
DEPLOY_DIR = "${TOPDIR}/../deploy"

|ERROR: core-image-minimal-1.0-r0 do_image_complete: The recipe
| core-image-minimal is trying to install files into a shared area when those
| files already exist. Those files and their manifest location are:
| .../poky/deploy/images/qemux86/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
| Matched in b'manifest-qemux86-linux-yocto.deploy'

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/classes/sstate.bbclass | 1 +
 1 file changed, 1 insertion(+)

Tested on a plain poky installation
Build Configuration:
BB_VERSION        = "1.31.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "SUSELINUX-42.1"
TARGET_SYS        = "i586-poky-linux"
MACHINE           = "qemux86"
DISTRO            = "poky"
DISTRO_VERSION    = "2.1+snapshot-20160911"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta              
meta-poky         
meta-yocto-bsp    = "master:51d03898cb1ca46db98179cfd3b1e8e0980de917"

With the patch core-image-minimal builds successful with or without
DEPLOY_DIR = "${TOPDIR}/../deploy" in local conf.
Without the patch, but with DEPLOY_DIR = "${TOPDIR}/../deploy", the build fails.

Max

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 8b6ac50..216e133 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -205,6 +205,7 @@ def sstate_install(ss, d):
             f = os.path.normpath(f)
             realmatch = True
             for w in whitelist:
+                w = os.path.normpath(w)
                 if f.startswith(w):
                     realmatch = False
                     break
-- 
2.6.6


