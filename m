Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8014CC001B0
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:37 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.32109.1688959233570531241
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nI5W7p25;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-635e54e22d6so31901646d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959232; x=1691551232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRl2sXhrUp/EeVC+uQpLbHbtdPoxqqjY2+wR8v7rauI=;
        b=nI5W7p25OedaF/vphCtZNvcF/Dcbb+7zcFIePZ1kK4u4QfTJsutXQBB0RvaTxP6ac0
         bdQdptOOvQAeeZ2jbvlik4ajtRVZfs05CfBo9Mc1o9kmn48WDVdXpLEqUSS9D/EsKROm
         K6btIERHgAEUeI8dcRiEOU1Pn/xjsD5tZC3vkX17nfP6nwRiD67V856rBbhZrUFVZI5s
         XiCZ/cWeBJq5EBeOew0u1XycUbTXwTbGdsr18KklweGoE8q47od2oMRE2uFvOPxteWKR
         VBeCnkdRDckO/KTtDBpGf9q3ymrKnW6BgTTbCLnHQcISxgM1K//H5bV//+oSP3q2Namu
         lCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959232; x=1691551232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRl2sXhrUp/EeVC+uQpLbHbtdPoxqqjY2+wR8v7rauI=;
        b=HaHSF3ny9hf7AvZj9WW3Wwd74QfGYKP0uGL8kj5Yi3XZRmp9+UxSjdBSPTzNavBdR6
         kwRDPohr5+J4Mpd4lxwHUubGisQ+dt1DJdzoc8glRY1sL5MrYP6kxCButo+fx+erjkpT
         QHwsi8mQC+BljfpQbYg/v+an05nCMrndMDqtOJMGZKJ0kkxXauK4hxhbI7XGS6PtSW3J
         oZvQ8en5GDXaQ8Z4+kFn+3F85rs0WVcbZswNmgi3jCKQ8HLkpIpv61jP9DpO/sMPX0jM
         kPuj4NknuXnHF+aISg5J/Pia/xmqrVvrYgrGlYVdkkTk6v1ZJigC+Q1/ZHq9ifAuVxR2
         j8Uw==
X-Gm-Message-State: ABy/qLYkPWWUEG/WC568liJ7A9v7xRZTdG/Y27DusAi0V2YuE7I9nZbF
	wZRV9vcniRsWScS0QPpSYmuNoM4aWlQ=
X-Google-Smtp-Source: APBJJlHdJoQ5tyFlVeKpJmJc9I+THdfQEV23MYmc6CFfwRtO9e1wvfnaAHnV1NVwnoDyCpDMS68p0Q==
X-Received: by 2002:a0c:b310:0:b0:637:ca3:67e8 with SMTP id s16-20020a0cb310000000b006370ca367e8mr10848320qve.39.1688959232597;
        Sun, 09 Jul 2023 20:20:32 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:32 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/15] kernel: fix localversion in v6.3+
Date: Sun,  9 Jul 2023 23:20:16 -0400
Message-Id: <7aea9e4b1932c62c3cb08604ea1e81338f2f00f0.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184047

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
---
 meta/classes-recipe/kernel-arch.bbclass | 7 +++++++
 meta/classes-recipe/kernel.bbclass      | 6 ++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 6e19dbbba8..df4884b6c4 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -80,3 +80,10 @@ KERNEL_OBJCOPY = "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 KERNEL_STRIP = "${CCACHE}${HOST_PREFIX}strip ${HOST_STRIP_KERNEL_ARCH}"
 TOOLCHAIN ?= "gcc"
 
+# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" in
+# the local version. Having it empty means nothing will be added, and any
+# value will be appended to the local kernel version. This replaces the
+# use of .scmversion file for setting a localversion without using
+# the CONFIG_LOCALVERSION option.
+KERNEL_LOCALVERSION ??= ""
+export LOCALVERSION ?= "${KERNEL_LOCALVERSION}"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 855c784149..2aedf3a31b 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -426,7 +426,7 @@ do_compile_kernelmodules() {
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
 
-		# Module.symvers gets updated during the 
+		# Module.symvers gets updated during the
 		# building of the kernel modules. We need to
 		# update this in the shared workdir since some
 		# external kernel modules has a dependency on
@@ -620,7 +620,6 @@ do_shared_workdir () {
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
 SYSROOT_DIRS = ""
 
-KERNEL_LOCALVERSION ??= ""
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || oe_runmake -C ${S} O=${B} oldnoconfig"
 
 python check_oldest_kernel() {
@@ -642,6 +641,9 @@ kernel_do_configure() {
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
2.34.1


