Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3FCC6610BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 18:11:53 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a9so358435wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 10:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K/GE9bWyF24AzXm8PIODTGunlRZb7H2WY+wYUaJ8lDo=;
	b=LKIiQSxRRY41Pzqt7ReYIYWBvM3BwoAWXCtH5WYVtBwaCXVmv762zEx1t6tOuaFSvf
	vIpJF/k4wahJycnVx95RfNBu1TrFH7c/qvvOGoK9lklYJhVOGOqePiH6f7OCJ8JhPl7O
	3cr+Qe4HSkSoHmPywOduP/gFywnbyOAYt2aTIp9MCG/7pCjmGLm2Efb+4upsKcq20Ud5
	xGtRPQyLQwRhPUrN/3PfSnywHpK/Y0LodTbLdIcF/8SM2Dc5sfCLbw2wTcZ/NkVSSu4Z
	aeWlWsdM+pKlSIA7565d6H/vDGeK5eKfL/5x5T+qkdBsTTBU0NXCBksn+4S22w7iLuAk
	CajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K/GE9bWyF24AzXm8PIODTGunlRZb7H2WY+wYUaJ8lDo=;
	b=ivjIEQ9zjhSfP7xz8IFSrK0kKQugqmaaorKY6UjWiI9q522M/W8F9IMZcS4ZBu3KOJ
	KdeuSVfGOEdWLJ+VefHc5gVA9zc0pGErgn9FwvVYFiVc9/OOugm2sIkOw5h2B95qqk3F
	3U+DpKhIXoENXvwBnopoAzQeH4edgnKCZNFhFpa9jIhOIf1SQa0SnLEde6C6EwmG7t9c
	4+myRGABU2yWtoOoXSAvFngNaZU97bARd7Vzk0lDWN3LqL4MZhoLYpQ22CTUKuegY/SG
	ARrKmKYD8BYdm+ckgXukXMVGxR61ZZmCm9IdBuaArOgBoEQ/c/LE+j1M7tZVw6QbcIKR
	qaSQ==
X-Gm-Message-State: APjAAAUbURARd3JDwGCw7+dumILW4rtoE7poHkX1NoSM9HLZ4lfNHZDi
	T98QKERMzcOnyYf1HyISmaWI2syr
X-Google-Smtp-Source: APXvYqz7HLBPjkJUFeeoUkNOPouWcFwxO8p2rRM5SfnrMbccx34UlqAMfeC7NP9VK619mtmjUTfixQ==
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr323060wmc.106.1580753513664;
	Mon, 03 Feb 2020 10:11:53 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	v17sm25998577wrt.91.2020.02.03.10.11.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 10:11:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2020 19:11:50 +0100
Message-Id: <20200203181150.29162-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCHv2] kernel.bbclass: set LD in KERNEL_CONFIG_COMMAND to fix 5.4+ builds when gold is enabled
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
X-List-Received-Date: Mon, 03 Feb 2020 18:11:53 -0000
Content-Transfer-Encoding: 8bit

* with 5.4 kernel the do_configure fails when gold is enabled (with ld-is-gold in DISTRO_FEATURES)
* bfd is already being set in KERNEL_LD:
  kernel-arch.bbclass:KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
  but KERNEL_LD is currently respected only by do_compile and do_compile_kernel modules
  and new kernel which contains a check for gold in Kbuild:
  https://lore.kernel.org/lkml/alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de/
  more details:
  https://lore.kernel.org/r/CAMe9rOqMqkQ0LNpm25yE_Yt0FKp05WmHOrwc0aRDb53miFKM+w@mail.gmail.com
  will fail during the configuration even when gold wouldn't be used to
  build it in the end, add LD setting to KERNEL_CONFIG_COMMAND to prevent
  premature error when configuring

  scripts/kconfig/conf  --olddefconfig Kconfig
  scripts/Kconfig.include:39:  gold linker 'x86_64-oe-linux-ld' not supported
  make[2]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/scripts/kconfig/Makefile:73: olddefconfig] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---

v2 just without --in-reply-to to original thread "kernel-yocto: v5.4 LTS kernel (rev2)",
because patchtest tries to apply it with linux-yocto changes from that thread and reports
failure that it cannot be applied in master

 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 750988f4e5..15219c596f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -508,7 +508,7 @@ sysroot_stage_all () {
 	:
 }
 
-KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" oldnoconfig"
+KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" LD="${KERNEL_LD}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" LD="${KERNEL_LD}" oldnoconfig"
 
 python check_oldest_kernel() {
     oldest_kernel = d.getVar('OLDEST_KERNEL')
-- 
2.20.1


