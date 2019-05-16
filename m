Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 800F97E04B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 15:04:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f8so2397647wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 08:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0ZghqI/bxy9oC+rsHTjxaBZnMy/FWzJPvfX+6Sg3oZo=;
	b=lTHdWWOc5ENPuQJj3UiZnS+ChiMRSq4EL4s1Vyi4q1cnyfQrVZJkx3LxwAcvDbeBLy
	cPA1R2npt15QlbxCQUYiF1aCSOVEocrBSJyF2h1RKwx3MIeXVCmIAqTQNb7q21O104f8
	eIRXn7SNUWH4M6Hv/XssCI7xIQgilFEJZ6NxJzP44tTh7UO4vRfpj7EjO7BI/IJqF9dG
	0DwbNdOBo3FWU7jVYjal9/VUtZ2+TPBKtsJ/qQ+c7SMAoF+alnBkB2xVaf1j95tKsSKf
	IB80hmWYipjUD8xgouCvRi3yhsH5hWuV/gdko9hd8WZaJCvmZ7YJDURifA7zg8Iw8ldM
	1Wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0ZghqI/bxy9oC+rsHTjxaBZnMy/FWzJPvfX+6Sg3oZo=;
	b=rKHl5Ec7JB/ONk845fmuT1fjEAG7kfqOMGQ3CH3luCu/ZSoDGamt+D9t56dyHAxJMM
	OY+raXKpcSyIuWDL5v3n2jOwH2nPkYpgTu0rDX6aoqzSoYIM/UvpluRYM8FwB4k39crn
	/vA/mHC9maY+zkI/dJYGzfCWOM4EcgMqGpsuYabUfk7RQnPBs1s2vLKCfVqAp+JM1IOU
	QEXz5h2M9ntRGStuGB0iMJowMt2KrBwEnntgqJWHptOoJGG/QL+3NJjGYbhtr8C+C+1g
	7HzOoVAD/J08qU4vTEXl87Y1aO3NEItZqnOKDybGj7DZGgSAEIx+rwdCityxAOQ+JmDM
	aMNw==
X-Gm-Message-State: APjAAAWLvdNvOLro1NbFgLOi8MBmJgt8ztGQ+QBe3fWOoT4GGYjJM8tX
	VvpYdpMQsLFYY8KBXlUnUXhc2vWW
X-Google-Smtp-Source: APXvYqz4AETpmUkjID1Lto0Zsjj9yjWefiN8wOYzbCDD0MsyASe8QKU7khV6qKFB9VF1KGuNIyAYDQ==
X-Received: by 2002:adf:ce90:: with SMTP id r16mr31382697wrn.156.1558019055729;
	Thu, 16 May 2019 08:04:15 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id a4sm7318053wmf.45.2019.05.16.08.04.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 08:04:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 17:04:04 +0200
Message-Id: <20190516150405.124743-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516150405.124743-1-alex.kanavin@gmail.com>
References: <20190516150405.124743-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/3] qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium
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
X-List-Received-Date: Thu, 16 May 2019 15:04:15 -0000

This matches what the qemux86_64 is currently using, and
will allow testing the instructions added in the meantime;
particularly various SSE extensions are now enabled.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/machine/include/qemuboot-x86.inc | 4 ++--
 meta/conf/machine/qemux86.conf             | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 5fdbe4df50e..82ce46d8604 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -1,8 +1,8 @@
 # For runqemu
 IMAGE_CLASSES += "qemuboot"
 QB_SYSTEM_NAME_x86 = "qemu-system-i386"
-QB_CPU_x86 = "-cpu pentium2"
-QB_CPU_KVM_x86 = "-cpu pentium2"
+QB_CPU_x86 = "-cpu core2duo"
+QB_CPU_KVM_x86 = "-cpu core2duo"
 
 QB_SYSTEM_NAME_x86-64 = "qemu-system-x86_64"
 QB_CPU_x86-64 = "-cpu core2duo"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index f2434a4b5f5..272ad1e1870 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -8,8 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 require conf/machine/include/qemu.inc
-DEFAULTTUNE ?= "i586"
-X86ARCH32 ?= "i586"
+DEFAULTTUNE ?= "core2-32"
 require conf/machine/include/tune-corei7.inc
 require conf/machine/include/qemuboot-x86.inc
 
-- 
2.17.1


