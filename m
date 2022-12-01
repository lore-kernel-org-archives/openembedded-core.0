Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A945AC47089
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:25:52 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.46618.1669908348699038296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:25:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0ul+S8T9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id f9so1943792pgf.7
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 07:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+sdXukAkDZrExt8ijaY+Nt5YPzQTX55rkpceZ31j10=;
        b=0ul+S8T9FzjJF7cLI+6CxSZ0a/wTac54NMuN+Tm/s6fGKNnvKeAtuG09mRr7j/lr2p
         /a3cdXy0+kb4SmMYTn0uCc7EAkjq2JjgGKtCU/42ofgsOIiLtyemjG/jIQB5n5Bs5Rsg
         GV2tsk/SeKWlwbOtwZG5F8QNSLZHDeivINAHTL0l9GTqJ6d/7wihYXMrp6Kt6htL5fX2
         +W9baptZi+D2SFfxDIrhSHM1Ej1x2KE04U2azNpo2JXvPEV1gRPm4PAmR4/+t1w6ah+o
         GDxcAAMFFxdS6k0Vjqu1fAmGGpy+sIcH3jEYUMbns/pbGnVftHmcQFO9gfyeuyo2WGbT
         Ru9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+sdXukAkDZrExt8ijaY+Nt5YPzQTX55rkpceZ31j10=;
        b=I+7A4sHnkgKSDEg4IZFeGCPnN54yTdJiu++Pnkhgu6HiHXN8NFISr5nNxfcINjHzyE
         DFmR2K2jHOsqQU+ctEhsemo1PqoAnQu0B0RnEumUTijrghUhrjDMe5snmeP44N/K64vR
         ShP0iKZ2YxZvhvhDxCUVp3Jr1OkfXqWouzqP8qeWZz8bqBwasJ+Na01340S05sqie/jP
         ahNMlZI8R/zMILr9/AxswTdInDPuoBne/XIA8jaV8vyC33iw/UYgkSg+r09PVtiS7Vq8
         9cfgiNNCYpcUqFt7QW/HvM91++dh+Xj54lX5JoeZ+Qfdl3/pkcptz63T8xFRvldnrSnd
         N+kA==
X-Gm-Message-State: ANoB5pn01Sudt1shHTFBvJpjIihUdR0kOczRpy/DN8oZlH8i7LLEsmgL
	pFEs5i/QUc4loK5ZqMRTU2NMwSvAqGkdgImW6E4=
X-Google-Smtp-Source: AA0mqf7LXFkJGzIrh98URTyosiQchvB6HV9I22fkBjghEPiQ69U23f81EBes3rLztDN4WW5TKPwjlw==
X-Received: by 2002:a63:dd13:0:b0:46e:ccbd:b136 with SMTP id t19-20020a63dd13000000b0046eccbdb136mr45567329pgg.515.1669908347626;
        Thu, 01 Dec 2022 07:25:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id jc18-20020a17090325d200b001891a17bd93sm3812769plb.43.2022.12.01.07.25.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:25:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/7] kernel.bbclass: make KERNEL_DEBUG_TIMESTAMPS work at rebuild
Date: Thu,  1 Dec 2022 05:25:21 -1000
Message-Id: <d9f5bedfb04f3a91b2c7558bc409876a66a859bc.1669908167.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669908167.git.steve@sakoman.com>
References: <cover.1669908167.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174120

From: Chen Qi <Qi.Chen@windriver.com>

Currently, the KERNEL_DEBUG_TIMESTAMPS is not working as expected
at rebuild. That is, even if we set it to "1", the kernel build time
is not changed. The problem could be reproduced by the following steps.
  1. bitbake core-image-minimal; start image and check `uname -a` output.
  2. set in local.conf: KERNEL_DEBUG_TIMESTAMPS = "1"
  3. bitbake core-image-minimal; start image and check `uname -a` output.

It's expected that after enabling KERNEL_DEBUG_TIMESTAMPS, the kernel
build time will be set to current date. But it's not. This is because
the compile.h was not re-generated when do_compile task was re-executed.

In mkcompile_h, we have:
"""
 # Only replace the real compile.h if the new one is different,
 # in order to preserve the timestamp and avoid unnecessary
 # recompilations.
 # We don't consider the file changed if only the date/time changed,
 # unless KBUILD_BUILD_TIMESTAMP was explicitly set (e.g. for
 # reproducible builds with that value referring to a commit timestamp).
 # A kernel config change will increase the generation number, thus
 # causing compile.h to be updated (including date/time) due to the
 # changed comment in the
 # first line.
"""
It has made it very clear that it will not be re-generated unless
we have KBUILD_BUILD_TIMESTAMP set explicitly. So we set this variable
explicitly in do_compile to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1b68c2d2d385013a1c535ef81172494302a36d74)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a965e187e4..8b89360991 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -321,6 +321,10 @@ kernel_do_compile() {
 		export KBUILD_BUILD_TIMESTAMP="$ts"
 		export KCONFIG_NOTIMESTAMP=1
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	else
+		ts=`LC_ALL=C date`
+		export KBUILD_BUILD_TIMESTAMP="$ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
 	# The $use_alternate_initrd is only set from
 	# do_bundle_initramfs() This variable is specifically for the
@@ -367,6 +371,10 @@ do_compile_kernelmodules() {
 		export KBUILD_BUILD_TIMESTAMP="$ts"
 		export KCONFIG_NOTIMESTAMP=1
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	else
+		ts=`LC_ALL=C date`
+		export KBUILD_BUILD_TIMESTAMP="$ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		cc_extra=$(get_cc_option)
-- 
2.25.1


