Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EE9C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 13:54:59 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.6812.1707746094313449631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 05:54:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3DUbO/Gp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6e2dfaa93c5so545677a34.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 05:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707746093; x=1708350893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/u/Cmy71x+Ew3bBW7h41oOkK2HWNLgCKc4ifFchk1uU=;
        b=3DUbO/GpyzVHLAxFryAi+jljRyDC8qJ33K+bQfD2o+6ZgfYZH9Mr40otSCdDC0JsHR
         1tEQiGB6Nip+VoFZMEdP7yYop8vIf/xPWNeNhM90mrHcYiH/UhZUygAvpT/mIHa840ZY
         tNrPFP8JHhv2O5c7s8Ub+mIwvddPN8/8fil0/LVg7Bq8dH+j7GYYvTfACfk91ZgiCJNl
         MwmkGxTYhziUONkSB/yz5YFTl0kHs4v0Yf+V34WmiEQXrQx9upSYa5jJ3Sg6jYNLcpj+
         gk7FeweEKwAoAv3ZphVLTCbqGG99i/9vvVerahAU0KC86RM3kb3J9dBNYMMixnPX8I7w
         YdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746093; x=1708350893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/u/Cmy71x+Ew3bBW7h41oOkK2HWNLgCKc4ifFchk1uU=;
        b=Q9AaeCLCqUGsWopPwFftQXlHdnJYiU7rWgJGIqc5DXhuXbsDt+3dPFvjmF9KkMDqoX
         ByAOyqkhEPTj+0JTuRtKv2dYWo61E2VJMHSQOlIJk4W8/Are9byIv+tJqzEJmcohEq8J
         vCz4cgm44KiwNXBLCltjB/9t1MHZWR1nik4gnvasVyJkh29NF5xZ9UA3Wx1ETOfPnUYD
         s7mSzSeqICUz3kVacc0Krs7YCqPDv2VNUO3QyZevoxjF3vowg/lM9yQBK+sFW9BCLjhZ
         kW97OFJJ4u/nJAKh6DpJqEngis2AqjK0uAYU6hK8Jj30hCzwTDLX7bDQNOn8RAkdWHqa
         VJxw==
X-Gm-Message-State: AOJu0YzkvrzdBnCErKTN1ABzPXu3Ml1COmm2texKp+0EDvmreaIPuKbP
	r7gYcx65mLExp8k9LndEbzuIgR8s/RTjDXEukTF8aPE/dJnJXZJN1Xot063XAakSVLEic229cZm
	NGCw=
X-Google-Smtp-Source: AGHT+IGOFoazf7my1d2PabWafF/acQkbfV3WSzFRupWKiZ9P9Z7ITVmQk9LH31/l0DiNZk/2xAJvKw==
X-Received: by 2002:a05:6358:921a:b0:178:f497:ab3f with SMTP id d26-20020a056358921a00b00178f497ab3fmr4596901rwb.14.1707746093400;
        Mon, 12 Feb 2024 05:54:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k69-20020a638448000000b005dc421f8889sm439889pgd.26.2024.02.12.05.54.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:54:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/8] kernel: fix localversion in v6.3+
Date: Mon, 12 Feb 2024 03:54:18 -1000
Message-Id: <d9273edae80978c34f8426f34f991b9598828aa9.1707745886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707745886.git.steve@sakoman.com>
References: <cover.1707745886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 13:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195328

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

Cherry-picked from master 765b13b7305c8d2f222cfc66d77c02e6a088c691

Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-arch.bbclass |  7 +++++++
 meta/classes/kernel.bbclass      | 10 ++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

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
index 5951347361..940f1a3cf4 100644
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
@@ -635,7 +635,13 @@ kernel_do_configure() {
 	# $ scripts/setlocalversion . => +
 	# $ make kernelversion => 2.6.37
 	# $ make kernelrelease => 2.6.37+
-	touch ${B}/.scmversion ${S}/.scmversion
+	# See kernel-arch.bbclass for post v6.3 removal of the extra
+	# + in localversion. .scmversion is no longer used, and the
+	# variable LOCALVERSION must be used
+	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
+		echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
+		echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
+	fi
 
 	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
 		mv "${S}/.config" "${B}/.config"
-- 
2.34.1


