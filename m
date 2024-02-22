Return-Path: <andreaskleist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C265EC5478C
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 10:35:56 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.9984.1708598151104127821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 02:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TnbymdIv;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: andreaskleist@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5101cd91017so10023301e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 02:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708598149; x=1709202949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/audotyZZ5592zKRD9yGvvhfeB2WLsG86tEoSr6d5M=;
        b=TnbymdIvnTrQkrlf8Y91NhWQHCOvDXXny1pqV0cEztV0MZF3twczx8yZFodSkhOKTB
         joj61W8HzYmbUEXHPUW7UrpgaAEL/nQHZGHCJNaxW0yEFmtNkZBcBq8/C2EEPNDqGg0z
         s1FDLt96eEIbLekHrJNGf6iBSpsQFIUGOIsrx4R0Vs6MmSTKTJMljg9IQQbsSAjBIkyW
         QkxHV2BzSljepBXkxnp3uLoh+YQWZUOG9PCy+cM+Om7XGyIzfRpmAruoBkwsX0H6hGFm
         UPj8LjVesHg/+XfS8vUwSJfm7fhfas7+sofmu+oavqcN/QeBTjIGvTei20Whl2769Vs2
         emNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708598149; x=1709202949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/audotyZZ5592zKRD9yGvvhfeB2WLsG86tEoSr6d5M=;
        b=Q+Rbb+aT3PIOVdX4fqbbx9onX1SiBUt9FSLyTFwFAAfX+guCY/l2Qpf22ObOU6eksd
         slbzz/YUEuCtZBbm5w7bQvnRY4vRMZ/RioFCHZJEK5lgW6yyV/mWJtmEOqbf6VJUnB8t
         t9FoI3lt2ZkC8QKBN4abWhcA4TTwla8jxJzqOv99aMYSD+p5QBCIem/o87LZwSTdyD/L
         g1dXcHdkD86amAMFRCjzFik4PxDdZq8/GmT2aMMMvuVp5kj5IWFsjz5JUIQRSt17JWcw
         CZhXItNGJx1zm8ebBp8Jjfs9gBCaoqLwt9DItQvZd6OyV07mE9CjoD7wnIn8nXqGEsV7
         lHIw==
X-Gm-Message-State: AOJu0Yzl9yAcVhSCnGw0VFefS9JFNmmqDxFOdTLs4rE3oFUmU1xEqbJl
	md9Ogq5i+iMGqgdkEs3wwUwnEJzywxTVw13j9MFu2mKNQmbe4IZlU4x5rRfo
X-Google-Smtp-Source: AGHT+IFriEfR7UGaY7vg223c4kxHN/bmqwTuo3SdmDa2cc0+hZMnrf2Tc9LxOvuvgES5RcpLF02nLQ==
X-Received: by 2002:a05:6512:3ba8:b0:512:a743:3ce3 with SMTP id g40-20020a0565123ba800b00512a7433ce3mr11925977lfv.23.1708598149082;
        Thu, 22 Feb 2024 02:35:49 -0800 (PST)
Received: from localhost.localdomain (c-x5996889d.customers.hiper-net.dk. [89.150.136.157])
        by smtp.gmail.com with ESMTPSA id ev24-20020a056402541800b0056163b46393sm5382260edb.64.2024.02.22.02.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 02:35:48 -0800 (PST)
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: reatmon@ti.com
Subject: [kirkstone][PATCH 2/3] kernel: fix localversion in v6.3+
Date: Thu, 22 Feb 2024 11:35:44 +0100
Message-ID: <20240222103545.2970387-3-andreaskleist@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222103545.2970387-1-andreaskleist@gmail.com>
References: <20240222103545.2970387-1-andreaskleist@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 10:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196013

From: Bruce Ashfield <bruce.ashfield@gmail.com>

During testing of the v6.4 reference kernel, it was noticed that
on-target modules no longer matched the magic value of the running
kernel.

This was due to a different localversion in the cross built kernel
and the scripts / resources created on target.

This was due to changes in the setlocalversion script introduced
in the v6.3 series.

The .scmversion file is no longer used (or packaged) to inhibit
the addition of a "+" (through querying of the git status of the
kernel) or the setting of a local version.

We recently introduced the KERNEL_LOCALVERSION variable to allow
recipes to place a value in .scmversion, so we extend the use of
that variable to kernel-arch.bbclass and use it to set the
exported variable LOCALVERSION.

We must do it at the kernel-arch level, as the variable must be
exported in any kernel build to ensure that setlocalversion always
correctly sets the localversion.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

cherry-picked from master 765b13b7305c8d2f222cfc66d77c02e6a088c691

Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
---
 meta/classes/kernel-arch.bbclass | 7 +++++++
 meta/classes/kernel.bbclass      | 6 ++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 4cd08b96fb..0a79dea0af 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -66,3 +66,10 @@ KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 TOOLCHAIN ?= "gcc"
 
+# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" in
+# the local version. Having it empty means nothing will be added, and any
+# value will be appended to the local kernel version. This replaces the
+# use of .scmversion file for setting a localversion without using
+# the CONFIG_LOCALVERSION option.
+KERNEL_LOCALVERSION ??= ""
+export LOCALVERSION ?= "${KERNEL_LOCALVERSION}"
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 80fb1879b0..940f1a3cf4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -418,7 +418,7 @@ do_compile_kernelmodules() {
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
 
-		# Module.symvers gets updated during the 
+		# Module.symvers gets updated during the
 		# building of the kernel modules. We need to
 		# update this in the shared workdir since some
 		# external kernel modules has a dependency on
@@ -614,7 +614,6 @@ do_shared_workdir () {
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
 SYSROOT_DIRS = ""
 
-KERNEL_LOCALVERSION ??= ""
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || oe_runmake -C ${S} O=${B} oldnoconfig"
 
 python check_oldest_kernel() {
@@ -636,6 +635,9 @@ kernel_do_configure() {
 	# $ scripts/setlocalversion . => +
 	# $ make kernelversion => 2.6.37
 	# $ make kernelrelease => 2.6.37+
+	# See kernel-arch.bbclass for post v6.3 removal of the extra
+	# + in localversion. .scmversion is no longer used, and the
+	# variable LOCALVERSION must be used
 	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
 		echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
 		echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
-- 
2.43.2


