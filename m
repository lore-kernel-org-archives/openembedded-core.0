Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 58A1B7F555
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 21:34:30 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b11so5582161wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 13:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mb9AAn5zWVkdE1ff9i5Mlmum1UaMjnDblDDnQaOYTUE=;
	b=R904X20TIp2BN/sApbzVdsAIYi+ZTtq1NGVA/yIFwr2Ls8VasY4zsKUTjKe3UXRHas
	UN494VpTroReUfAkTBo58uY8gg4Rrt48jg8umlUFLibCIz5PoA7cZtRch+B0rw4BZp2S
	qSqqMumFH/FFboamhNjh21JH8mFZtfg/G15VA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mb9AAn5zWVkdE1ff9i5Mlmum1UaMjnDblDDnQaOYTUE=;
	b=sdjXDAf02SOGFuF3MFeqMj2XsyUieQGY3WTa7Ev+xF9c+QbTY/5tlKkBoblGsXXmoV
	yW2XGBcXRYiHC5ug5nBoOxwiHx3RxcBkzCgCo4L+UH8HiphRW815GWJrn+IIa+w3704J
	DVy3fd/rMpNOKrpl+4rkjt0l2yZ1ZaJGBrwC+srSGz+obmxiFGf6XywQt8ByXLutd8a5
	UGArLFUDYXuDDwlBH9cKfCCXDcNe3yzcyMhUSnv4BJr9C0KbknjiAY9TxYDlQxMbKLm3
	SDBdoD4uxjqXHZsQwpKcHt0C2aj2aFNS7RGBcL8RU065m8zk2nTyjgqcfB0npUHvkjVF
	RqMQ==
X-Gm-Message-State: APjAAAX7atcNd+TooTHuWMb2iFMtfqnMVvA+GzUN21rMDC1SXfZzyXit
	DolSA4Ijfwy88tOxBJ9rIoUixHA5y/E=
X-Google-Smtp-Source: APXvYqz/rAYig5YDmgMRxhikIaMSJqtwo0H7DHkiMkUSKOSQYbkb1wsSqOnsuBfKW1/3AwN0yuiJdA==
X-Received: by 2002:a1c:3d87:: with SMTP id k129mr6986515wma.26.1575581670731; 
	Thu, 05 Dec 2019 13:34:30 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x7sm13643217wrq.41.2019.12.05.13.34.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 13:34:30 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 21:34:28 +0000
Message-Id: <20191205213428.13693-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] qemu-helper-native/systemtap-native: Ensure sysroots are populated with dependencies
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
X-List-Received-Date: Thu, 05 Dec 2019 21:34:30 -0000
Content-Transfer-Encoding: 8bit

As Alex Kanavin found, dependencies aren't always populated, particularly
with the hash equivalence server enabled locally:

'bitbake core-image-minimal' with gtk+ disabled.
can confirm with: $ tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-x86_64 -display gtk
qemu-system-x86_64: Display 'gtk' is not available.
Enable gtk in local.conf with: PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"
'bitbake core-image-minimal', without deleting tmp/
$ tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-x86_64 -display gtk
qemu-system-x86_64: Display 'gtk' is not available.

This change ensures the dependencies are correctly handled as the full
sysroot is always depended upon even if things come from sstate.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/native.bbclass                           | 2 +-
 meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb  | 2 +-
 meta/recipes-kernel/systemtap/systemtap-native_git.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index d5b6f6af8bb..2cc6ad60b34 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -185,7 +185,7 @@ native_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
 python do_addto_recipe_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 }
-addtask addto_recipe_sysroot after do_populate_sysroot
+addtask addto_recipe_sysroot after do_populate_sysroot do_prepare_recipe_sysroot
 
 inherit nopackages
 
diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index 372eebd8864..ab4eb2d2268 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -21,4 +21,4 @@ do_install() {
 }
 
 DEPENDS += "qemu-system-native"
-addtask addto_recipe_sysroot after do_populate_sysroot before do_build
+addtask addto_recipe_sysroot after do_populate_sysroot do_prepare_recipe_sysroot before do_build
diff --git a/meta/recipes-kernel/systemtap/systemtap-native_git.bb b/meta/recipes-kernel/systemtap/systemtap-native_git.bb
index 19cc1cf0f0a..b00f66e25dd 100644
--- a/meta/recipes-kernel/systemtap/systemtap-native_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-native_git.bb
@@ -3,4 +3,4 @@ require systemtap_git.bb
 
 inherit native
 
-addtask addto_recipe_sysroot after do_populate_sysroot before do_build
+addtask addto_recipe_sysroot after do_prepare_recipe_sysroot do_populate_sysroot before do_build
-- 
2.20.1


