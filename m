Return-Path: <andreaskleist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CBCC54798
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 10:35:57 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.9983.1708598149922074081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 02:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OQR5aXBL;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: andreaskleist@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-564372fb762so2358080a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 02:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708598148; x=1709202948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NouBzXoNdrUDSoaom0oT26H3Seo1aq0zbxk2dwe3eok=;
        b=OQR5aXBLA8i/SOApU7i/gON2sHASX++M7yp/WHIXIph90l1TF6eDqY9+0wVRJtGZwT
         XLk+T68QU+QIpnHaqPcJfEPlNF3j1yr+VHuq3JMJdyA/YLQfx9IZAJhq5lwF2s5HigQY
         4TDl45gzztAfJwkvgOFuPhyfUgrUIVc2YBsS87W2nabfgCYl6rGikk/8pfGbOZ4UxGzG
         bVPcwYF9GvmZ/Ihx1AuM68RD32fmhiZbUD/EKCgLSOS+16F29vbRXju4+BUXxanc0AKE
         HVZAT/IPpoSWNpDGJghQ4rdn55+3XOl1wPEWVc5Pf5utvuG4uA13IjC+YdA8vPD67pWs
         HVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708598148; x=1709202948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NouBzXoNdrUDSoaom0oT26H3Seo1aq0zbxk2dwe3eok=;
        b=QjhjZLNVYr0i05zh/K7Z9nn7Wa412qE3T5V4M5KzflX0WbEmJm4KFpj4AlOvDMukt3
         iIPCXcofgOE8q04ThK97UZR4WH6BPHEHQXzp/GA6JMAzmNwFInj9A1KWHUQnQGBINVn+
         CeiEi7WyDIUvHD9/FmQeg50uDytXOB4hiclyTeJP0cye2F8psnwMeahwKyclpVMqgRwI
         hqnxhL7fmd1uKYgfga6m6g45IKuagD8xyAKlQiUG/JPgtCetv2tzVpr75bEETprNt72+
         CR86K1Y9wac/puu+ux+5dKAcJQPe2zlLlTPGWfUqhFcPktu472938rWSopHFme4A50WT
         JOrQ==
X-Gm-Message-State: AOJu0YxSh8SLXvG4izCQWtZnOtO/nQSQeSm0jiwyikycdeWeD6fCZd5h
	hQAZbKaxn1VwyGuJXPkf+bJtJLj6U6saTR5luEV8PEjAF/uCEQElKN4kVm6q
X-Google-Smtp-Source: AGHT+IF0jN4BkHadj4RHDLWuMfJToczOYWKeL9xTxpLTc3n2rBahU49OS2iKRkMdByRuGGICXwMeiA==
X-Received: by 2002:a50:fc0a:0:b0:564:2655:f1b4 with SMTP id i10-20020a50fc0a000000b005642655f1b4mr9659034edr.32.1708598148109;
        Thu, 22 Feb 2024 02:35:48 -0800 (PST)
Received: from localhost.localdomain (c-x5996889d.customers.hiper-net.dk. [89.150.136.157])
        by smtp.gmail.com with ESMTPSA id ev24-20020a056402541800b0056163b46393sm5382260edb.64.2024.02.22.02.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 02:35:47 -0800 (PST)
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: reatmon@ti.com
Subject: [kirkstone][PATCH 1/3] kernel.bbclass: introduce KERNEL_LOCALVERSION
Date: Thu, 22 Feb 2024 11:35:43 +0100
Message-ID: <20240222103545.2970387-2-andreaskleist@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222103545.2970387-1-andreaskleist@gmail.com>
References: <20240222103545.2970387-1-andreaskleist@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 10:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196012

From: Ming Liu <liu.ming50@gmail.com>

Just like UBOOT_LOCALVERSION, an end user can set KERNEL_LOCALVERSION
to append a string to the name of the local version of the kernel
image.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

cherry-picked from master 229435a52f36ddec5f85fb6d5ccd42044b688397

Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
---
 meta/classes/kernel.bbclass  | 6 +++++-
 meta/conf/documentation.conf | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5951347361..80fb1879b0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -614,6 +614,7 @@ do_shared_workdir () {
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
 SYSROOT_DIRS = ""
 
+KERNEL_LOCALVERSION ??= ""
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || oe_runmake -C ${S} O=${B} oldnoconfig"
 
 python check_oldest_kernel() {
@@ -635,7 +636,10 @@ kernel_do_configure() {
 	# $ scripts/setlocalversion . => +
 	# $ make kernelversion => 2.6.37
 	# $ make kernelrelease => 2.6.37+
-	touch ${B}/.scmversion ${S}/.scmversion
+	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
+		echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
+		echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
+	fi
 
 	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
 		mv "${S}/.config" "${B}/.config"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index ab2addb321..e55bfa288d 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -253,6 +253,7 @@ KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build system
 KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages. Defaults to 'kernel'."
 KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
 KERNEL_SRC[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
+KERNEL_LOCALVERSION[doc] = "Appends a string to the name of the local version of the kernel image."
 KFEATURE_DESCRIPTION[doc] = "Provides a short description of a configuration fragment. You use this variable in the .scc file that describes a configuration fragment file."
 KMACHINE[doc] = "The machine as known by the kernel."
 KTYPE[doc] = "Defines the kernel type to be used in assembling the configuration."
-- 
2.43.2


