Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 396276BCA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 13:47:38 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d15so6842002wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 05:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=cHlWXF191cBV/Bxdbhne+4b+Megq11tu1kC4B1kEz1Q=;
	b=HRafTAmhSLY3RooLn1PPIqM6bX6dl4mnFqAHxzDjGZuk8Wjx60wLJYtm8oq0+oRHZQ
	47I0XnTmmhD0UK5o4cCdI+hapWapFYaPRSjxscBGUQHzQWhWMyGYYRDBbFkCgiMofcFL
	8a0YQNuqnmSMXv7nNe10ec+ifvfftFKvU1ke0t1hH9W81Yqugp3CR05FrUB/MjOhGCt8
	UlCZC1ybJMVpxSN2qkKaqowqM4LLuWizo40jmmoX0Daxib5V4kKSncmIFlVDIa39RJHT
	R2vpd3AD/zVLyRMCv1WL3ofAUjbzK3/pQQsnHG+PtoHQHay8o/8ILo6YgltcZ77C/LD9
	btDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cHlWXF191cBV/Bxdbhne+4b+Megq11tu1kC4B1kEz1Q=;
	b=GeyhZu6IqI0enUOBcgAW8ATBze5DNaBs7cdnOc8t/H3+EacSztNICfnnmsGfM21hC3
	T5dRJ+yi9egbedE2issgpn1uJJrIigHuudhiKtqsgWxcqW+ELKzYClZHSrsG9Sm9DvG9
	IPfCfq8612BCs1oObsfW9FauHUwvEjsvhKNvehsJyCQGrI8yIvN5/nPBhZxd18g/25mF
	vLjBbI2YpPU3iK2FjgY+8xvSZKGKl3zw/mDTK66K4gGGh6Gs/lcOi8LyWc9uYPsi1kIu
	9LcEg1Ohc/CWOdma883ZhwcdrgWDXU9rl5Ft1XCG5+n6FCXoEoibfK4Ueq5M9SnoPOAL
	Eo+w==
X-Gm-Message-State: AJcUukcMcmBgvRkDVR5/Zi8SrxBTy31trKqjXWcApS0rJ/4laR9CsEco
	rYWgX9Lq29nZHuwq7WjAZdCpGAuK
X-Google-Smtp-Source: ALg8bN5vs5CDSzZ8DKiHtkNFJKbMihNCAZeXayg+2gnM/jUrOJcyOc0QaDrVh/8P5gGqixiW9u8A+Q==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr6941549wmb.80.1548424058512; 
	Fri, 25 Jan 2019 05:47:38 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e17sm166346123wri.36.2019.01.25.05.47.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 05:47:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2019 14:47:27 +0100
Message-Id: <20190125134727.49642-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] li/oe/package_manager.py: turn nativsdk postinst warnings into notes
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
X-List-Received-Date: Fri, 25 Jan 2019 13:47:38 -0000

The warnings deal with two specific cases of failure:
1) unable to execute nativesdk postinsts for mingw SDKs because
they need to be run under wine
2) unable to execute target postinsts when there is no qemu
usermode support for the target

Neither of these should be a big problem as mingw issue was never
found to problematic, and target postinsts deal with things that
are needed at runtime and not at build time which is the purpose
of SDKs.

The specific reason to do this is to reduce the amount of warnings
shown by the Yocto autobuilder, to zero eventually.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oe/package_manager.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f26f597d03d..d0e24a64837 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -440,7 +440,7 @@ class PackageManager(object, metaclass=ABCMeta):
                 continue
 
             if populate_sdk == 'host' and self.d.getVar('SDK_OS') == 'mingw32':
-                bb.warn("The postinstall intercept hook '%s' could not be executed due to missing wine support, details in %s/log.do_%s"
+                bb.note("The postinstall intercept hook '%s' could not be executed due to missing wine support, details in %s/log.do_%s"
                                 % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
                 continue
 
@@ -455,7 +455,7 @@ class PackageManager(object, metaclass=ABCMeta):
                     bb.fatal("The postinstall intercept hook '%s' failed, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
                 elif populate_sdk == 'target':
                     if "qemuwrapper: qemu usermode is not supported" in e.output.decode("utf-8"):
-                        bb.warn("The postinstall intercept hook '%s' could not be executed due to missing qemu usermode support, details in %s/log.do_%s"
+                        bb.note("The postinstall intercept hook '%s' could not be executed due to missing qemu usermode support, details in %s/log.do_%s"
                                 % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
                     else:
                         bb.fatal("The postinstall intercept hook '%s' failed, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
-- 
2.17.1


