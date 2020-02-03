Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B6508610AB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 17:33:13 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b17so238337wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 09:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3shjjZlJvoqeO7B6h7LnjQbtiefPLMsWoRmWKHMDfwA=;
	b=jN25KN7zDhSro6Ps5D84mK7chT40rI2HQhEmhpbM1iHmaYyAwj7pdvJ/7HXRzkY6J8
	tAeQKVaUgcyc1Dx40cQyMqJycEeTumHJdcnYh4DBqDZLGKGorCur3DZRFAjkbp+cdS7w
	Chamr/+5Lv5UODXoG0bdQ0y103dhTneFq+efYLg1n7WEdBUKHXN+7FGvXB7U6Siz2gSG
	0z+WsrAuvY59y8+M0A/dopIJk9Y44fJvKYX0LbGCcE1tH3Z2hpIFUjHoS71mB7PbriuD
	NRv1mrDgHDC3JbMIIFwQhgu3O+xko55pc7A8/Xc6Ew5OAoG1YO567hJA+arkbNCbCT3S
	IDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3shjjZlJvoqeO7B6h7LnjQbtiefPLMsWoRmWKHMDfwA=;
	b=nTtjFFd2DutjlDECxDMb4Ml9UB1JTtpMDtDW7Jy8ABoAQjRneA7lVZ9aSIAA05waa4
	Mm+lWQHu6qxuLL06p7LgGbWVea+PwJ+CumOCpt8JyJDQo7TSOAukRzSolxiTrnEnDv4I
	yLcuky8TN8t7Z2Oo3/4T7HXO8cuba7Fi4ODjfNZOzq1XGxLmZdWI4hEwFBs+neIL/nVE
	5klbd9puE8R06pF3IydVj/xrAuuowVh/BRiVNX8/WzVGvrThrgkZQwY6I42sr534SsxX
	hKuVdVE4ZA6ZTmkW14SzeIb3d/BAAv23pL8Tn8iYoZjHDJvNgZqCObgG1lI9YlD3QqUE
	epxA==
X-Gm-Message-State: APjAAAW88TlcNFi975uigCrE/GwXS5sYDA7FA0ewbUfxunhY3tduc07N
	yjYnhk3CO8k6xF2cLFv5l/Dq31Jx
X-Google-Smtp-Source: APXvYqyLbXRHYsicp8rum1rUq2/go1CfA/AbRR26/0Joyqg8S7IXSc0pi+zMLQ7GE31eHM0z5Egn8A==
X-Received: by 2002:a7b:c392:: with SMTP id s18mr101170wmj.169.1580751194228; 
	Mon, 03 Feb 2020 09:33:14 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id y12sm120317wmj.6.2020.02.03.09.33.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 09:33:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2020 18:33:11 +0100
Message-Id: <20200203173311.32208-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CA+chaQehJEiOLysVA8Sf86tGJ-cVmr+Z7FsPt0LGHLEMQLzEtQ@mail.gmail.com>
References: <CA+chaQehJEiOLysVA8Sf86tGJ-cVmr+Z7FsPt0LGHLEMQLzEtQ@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH] kernel.bbclass: set LD in KERNEL_CONFIG_COMMAND to fix 5.4+ builds when gold is enabled
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
X-List-Received-Date: Mon, 03 Feb 2020 17:33:14 -0000
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
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ebe5378301..1a953dca35 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -507,7 +507,7 @@ sysroot_stage_all () {
 	:
 }
 
-KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" oldnoconfig"
+KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" LD="${KERNEL_LD}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" LD="${KERNEL_LD}" oldnoconfig"
 
 python check_oldest_kernel() {
     oldest_kernel = d.getVar('OLDEST_KERNEL')
-- 
2.20.1


