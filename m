Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0F47722D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 05:53:15 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id w71so5413951oia.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 21:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Li9ShYlpr/DQuk1zIqAEpnaYEG1/E0bivkvO/1IyxdE=;
	b=WLg8Bk58lOXGU+SDh/EOVfAzN55ytEnAB+r75CshvUpCSFuhO1sgKtvzV9R3bA7S1P
	NJeAYIqEncL/FoNCG7GHubUOIy1hZ7TCZ3CpR2yo8CBaYVVWwUwhXZQU3MnXTzvfH9G9
	EE69fnCWasdJGc3t3miHiTu/W8AX9v4r4qf0eArD0m/wbFTzOPrnN6Rei4Cg33gcEdDK
	X9sQvOvrl5JNTh3ArJtVma07unUeFRrK7NoIJI4uekUq73eEZ/09bcqD1bD2F78qAboq
	09PUcxflgsBfnI0LOL1RPoRk7Rh6A/V2Vnr19ugw7uoXYwKbiWR+uAlsFzZBsyrs5DBb
	Fgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Li9ShYlpr/DQuk1zIqAEpnaYEG1/E0bivkvO/1IyxdE=;
	b=QpCIZ+RMY30JbVc6XzVxJFbJYfxNDQzDMi78dxNa2nm2JLlG2T9CnZLx/npEMrVoeY
	JbPvuMItTR9FWNAPesRvxQDgPokNHmcV5YvmOQYGLdJu/7/9Bd7xdW3N7M6dCZM0aLMf
	LQibfqlSd0DaioJSvbzhRAqE60StJmpTyhruCrJUoCwBQe59VYCPeevPiNJCbKKN1Wl3
	MN6Qnl/a28r74VFl3d3a3A639eiFvwh7NacFCfN+P6EOK6NVseSvQFjC8Hujv5eNXVbT
	NLS2voQar5v7FsYRWmpMyHZqYkeNn6RsA1mGtMkueehR93GDrcOSVt0paWeAt9LhjnnF
	7PLw==
X-Gm-Message-State: AD7BkJJloh5CDRci664Pki+4vJ16+OhFt3B+aJDGc/4GycAGIzFZqh6+K6QdDWmoDJOQrQ==
X-Received: by 10.202.201.216 with SMTP id z207mr4002851oif.98.1456552396839; 
	Fri, 26 Feb 2016 21:53:16 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	cd5sm10867528oec.15.2016.02.26.21.53.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Feb 2016 21:53:15 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 21:53:04 -0800
Message-Id: <1456552387-10564-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456552387-10564-1-git-send-email-armccurdy@gmail.com>
References: <1456552387-10564-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/4] grub2.inc: dont export TARGET_CFLAGS etc to grub2 configure
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
X-List-Received-Date: Sat, 27 Feb 2016 05:53:16 -0000

The grub2 configure script uses variables such as TARGET_CFLAGS etc
for its own purposes. Remove the OE versions from the configure
environment to avoid conflicts.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-bsp/grub/grub2.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 84a4727..5a12563 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -44,10 +44,16 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
 PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,lvm2"
 
+do_configure_prepend() {
+	# The grub2 configure script uses variables such as TARGET_CFLAGS etc
+	# for its own purposes. Remove the OE versions from the environment to
+	# avoid conflicts.
+	unset TARGET_CPPFLAGS TARGET_CFLAGS TARGET_CXXFLAGS TARGET_LDFLAGS
+}
+
 # grub and grub-efi's sysroot/${datadir}/grub/grub-mkconfig_lib are
 # conflicted, remove it since no one uses it.
 SYSROOT_PREPROCESS_FUNCS_class-target += "remove_sysroot_mkconfig_lib"
 remove_sysroot_mkconfig_lib() {
     rm -r "${SYSROOT_DESTDIR}${datadir}/grub/grub-mkconfig_lib"
 }
-
-- 
1.9.1


