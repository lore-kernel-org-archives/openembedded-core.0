Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA9FC47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:42 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.44632.1669904615429564266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=eQDTBltu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 62so1772496pgb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnpQw1Lg57aKhQ5I4WM3lUJrRx7Gy02QQCUqIR0PZZY=;
        b=eQDTBltuARRw7veXQ6WAq9VQTd6SFSTb1lR31q1djpKtjqXHPMudIBAhIyeaHDvRCj
         s3un5o2/LgvkBtkmsUBmiELs8qU2R0RB+xaglCTh7l4579vBPdnrHyu/fOmAC/Phrroc
         wKAylARndb1H6gsBXc6ZPNjdiU8LLNn0LEkyRYW4xLt+VOJXsc+/NqXoJobKYGHNzmQv
         c6QpjBfhlyJ756h8NEp9EZenzSWHwglR1l3VXvRek/DI2Ks7y+iZ6S/BBpjgcC/evGkY
         57/Ivi15hr9/lG+acfluCF1lwpe1thGvho0MXEjb8XmU4R+YvHrp134UuNpvZcZqG9/h
         NX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnpQw1Lg57aKhQ5I4WM3lUJrRx7Gy02QQCUqIR0PZZY=;
        b=q5dsFKOu8Sm6WEDR9Kc0vrf/PJ5vvWUTdosXX7+Ft6coBCjiYcSwIveydG6t6Fxg1y
         hnVvUwv09t3+KxZs8DFqKLXOh6u2WKnMH2G6MeR0A/KLyMfB+1/hadkBS6C7X2VrKFwX
         yQTVnSNvQywHILGSJO4PQXDl+lrPelW0iddLfmvjUHzCj9gInSRo2/Oj70OZGYX57enP
         2ffvPhB5Yw72hsrVnSJJIOJXijG45+YPB6FsY/Z0NKURTJdsnKX5wVNn1Ao6r48fcTd/
         TqjbeLZlVMiATEcb+sm3SkbxrGG4XdxzRgIzEDkYtjHlQUtXNoZIFyiewiScNNEjPvBK
         Wx/g==
X-Gm-Message-State: ANoB5pkBohIzEieh+c2eI59WD2nj08mcVpTnTxIw4lTPXbqOyZdxzhmc
	ytILq2R11xo7E3bunR7lu5xWJN5TsF8F3q9Fd7A=
X-Google-Smtp-Source: AA0mqf7/XLsEcZ1VuI/AXGcLNXxct9ezK9L9lNtdRwgdf2Pc8D4ZX8yqEGtHi5K7L+aNu7lul12eJg==
X-Received: by 2002:a63:b513:0:b0:477:3052:248c with SMTP id y19-20020a63b513000000b004773052248cmr46827431pge.179.1669904620524;
        Thu, 01 Dec 2022 06:23:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/22] kernel.bbclass: make KERNEL_DEBUG_TIMESTAMPS work at rebuild
Date: Thu,  1 Dec 2022 04:22:46 -1000
Message-Id: <5e508a8060c7397b5f9630fc62797dd091f99c6e.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174079

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
 meta/classes-recipe/kernel.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 3834a42fb9..3f6b40907f 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -367,6 +367,10 @@ kernel_do_compile() {
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
@@ -412,6 +416,10 @@ do_compile_kernelmodules() {
 		export KBUILD_BUILD_TIMESTAMP="$ts"
 		export KCONFIG_NOTIMESTAMP=1
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	else
+		ts=`LC_ALL=C date`
+		export KBUILD_BUILD_TIMESTAMP="$ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
-- 
2.25.1


