Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 871EB7F352
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 10:06:19 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y8so11835613pll.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 02:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6irPLu1F4WkOkGl2fMNOF14vAhZGbVOTdlf+GzPzEnA=;
	b=GvGYaiT+3i3/KwFCeqO+FdsENVQwhjMKzOJau5GFK1wvBHhX0SSec7wx/xeBxn1MAW
	PkblLJEhLjeJgWrOZdvM/GJXZA3A/CJZXOb1CpT7MwsnURlrNzBJYm/TsTZUO6qMGl9U
	LoG8n0kzvNbk+Pp4OR8X8CgJ8b5t95G55UYoki8/6pRlLdHn/L9S+toBd9OQuaJiifFo
	muvB3DlfHT5sI+NrOJ4crG1StprDd5Po5DcQpGiEPn/2KPeP0aJWkG0BD97nwY+i50an
	3OQVR96IJS20M0e6T8mTVyWZhCjHKxIf0pZIUskUG9Sa55b2JfmoN591llGxV2gkd6Nl
	zDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6irPLu1F4WkOkGl2fMNOF14vAhZGbVOTdlf+GzPzEnA=;
	b=I5jOruU6BtdPVihpoXaMSaArXa+OYxFOEufpGAo8wm582hyoZMQXNcDzWhZuuXR0eh
	5rdh4kn8xdNqfjbFR/xKAp1cj4FAa/TQBLqOuVQMK1EDSMFGqsa3bBjqy/OsCg+sacxc
	wo/ou+qz63EbCfDHq22sxTeCYJr82ucEKKDBgFUcytKy8E/rXuNBi+L+38e3vbi9h0Jy
	VdCnhTt0eyn2SH9+zHNANLFQlYDJwwf2xcOPyrW2QLJtsCgx2ffvQ4EvYSpdbVMNq7+v
	+JoEQsKh2qZyMDztT4ljcQFoO1GPPi7UvrK3Adla+L3O++a2MJxonvSsctjlMHqSU0yy
	c6LQ==
X-Gm-Message-State: APjAAAUUM22T4JFwqn9p6+eGS9WJvFXRVJJeSJhDTLDlkQtNgtjOyHNe
	XlFVLwv5AxCI7XNs3toibAkwxNKI6bg=
X-Google-Smtp-Source: APXvYqztF1mRNsdVzYkvIrOfoRdfrbuvbDmqMnkDjJ2pwJTIrEgfAfogVUqojZxq3Tl6yFJDgyxQCA==
X-Received: by 2002:a17:90a:c697:: with SMTP id
	n23mr16467754pjt.37.1579428379937; 
	Sun, 19 Jan 2020 02:06:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id d4sm8218839pjg.19.2020.01.19.02.06.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 02:06:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2020 02:06:15 -0800
Message-Id: <20200119100615.2057319-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] qemu: Enable ppc64le support for qemu-usermode
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
X-List-Received-Date: Sun, 19 Jan 2020 10:06:19 -0000
Content-Transfer-Encoding: 8bit

glibc defines minimum kernel needed to be 3.10.0 for LE ppc64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/qemu.bbclass           | 3 +++
 meta/conf/bitbake.conf              | 1 +
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index f5c5780125..55bdff816b 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -16,6 +16,8 @@ def qemu_target_binary(data):
         target_arch = "ppc"
     elif target_arch == "powerpc64":
         target_arch = "ppc64"
+    elif target_arch == "powerpc64le":
+        target_arch = "ppc64le"
 
     return "qemu-" + target_arch
 
@@ -62,3 +64,4 @@ QEMU_EXTRAOPTIONS_ppc64e5500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc7400 = " -cpu 7400"
+QEMU_EXTRAOPTIONS_powerpc64le = " -cpu POWER8"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ce89b80ade..2da7c5849a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -430,6 +430,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 OLDEST_KERNEL = "3.2.0"
 OLDEST_KERNEL_aarch64 = "3.14"
 OLDEST_KERNEL_nios2 = "3.19"
+OLDEST_KERNEL_powerpc64le = "3.10.0"
 OLDEST_KERNEL_riscv32 = "4.15"
 OLDEST_KERNEL_riscv64 = "4.15"
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index dff5762b80..eb9f060997 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -59,7 +59,7 @@ do_install_ptest() {
 }
 
 # QEMU_TARGETS is overridable variable
-QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc ppc64 riscv32 riscv64 sh4 x86_64"
+QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc ppc64 ppc64le riscv32 riscv64 sh4 x86_64"
 
 EXTRA_OECONF = " \
     --prefix=${prefix} \
-- 
2.25.0


