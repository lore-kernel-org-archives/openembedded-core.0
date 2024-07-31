Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DCAC49EA1
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 12:02:28 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.41335.1722427340420811965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 05:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0YAG3ZzA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7a264a24ea7so3776945a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 05:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722427340; x=1723032140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eA8FME1q7PaRqTy8XfOKeDV/GN3KsbghlFIbyTUlRTw=;
        b=0YAG3ZzAq2TAWMLF6IIaTJ23IjlS6BVNVYPSEcsyUREWOskPpGOD/71rDmnC6BvlAU
         DZmtWpfKG2AYKofYPPvdWjQi6cjhnB/fUJQTkLspRcCfElC/Q3VIG70xVE9KwSyqahTG
         L/P5ON3ljxWULm5fs/jrcNEjz2YhMEVyH4CyI+ShCZ/W00+k6JdTDOH4vg+54LWIOobD
         2qkAvV5aZpoyvb8MPrO4msJ3R8KF3X1Y3d86hxTjYUBawWFdjHaOosHGwRfiOuiJI3nV
         HscDR7OR+blNfph2cRVQVReFoImapD176JggtYtVoULJinekvC4Jenpf0hDUdrGgJEH5
         abRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722427340; x=1723032140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eA8FME1q7PaRqTy8XfOKeDV/GN3KsbghlFIbyTUlRTw=;
        b=ZqzvQbtNB9cv6XL6OGO7EOoySA4oYNLevWQUKCHmVx7iY5MFiSSkQuwzCX/W05qsV6
         eyaG1T4t83cDow4NFEzntITCONkmegvkrM7bQiV6+CJdEwVmZjcRH01DRQ1B/X70MpUi
         l3nkQ/II4VLVKJUFDMjCBhJENVqghdrBDEkD0gyjvULqCpjU7ulDbSBhiYi27/6O9rZg
         ff7ynXejxqYRi9cki6lzuu9Wdl8T5mF/t+Cr1WwPkaiwukF/uvUCf2xwa7vHB+gsNyxB
         tpQzPfjcAHwtg4rVfrgEM022FgZ3X4Ut+PFK8JWbrdARABnIKFw3VQ41EDu6fZH7AWuF
         cceQ==
X-Gm-Message-State: AOJu0YweTk3Mw4w7rMRHk0dHtGrQi0BZtaS7kuFPLF0Pygy7pgm29uGI
	wNhExZgVPhoTiCePOH6ElGmKwne8nX3tA9DA3eW+Axr7mvWWsEyDtAE09sZkm68zLGpblzGJKbb
	iq7Y=
X-Google-Smtp-Source: AGHT+IHND6CEZkZ285hIE5uO6XBaKkqSLVqdCcaV85DWrXfnWR2L6KndRfQfUFZwOd7p6jlP76rsPw==
X-Received: by 2002:a17:902:ec8c:b0:1f8:67e4:3985 with SMTP id d9443c01a7336-1ff048a04c3mr174650455ad.49.1722427339679;
        Wed, 31 Jul 2024 05:02:19 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7d4129asm119048315ad.118.2024.07.31.05.02.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 05:02:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/5] gcc-runtime: remove bashism
Date: Wed, 31 Jul 2024 05:02:05 -0700
Message-Id: <c6cafd2aa50357c80fbab79741d575ff567c5766.1722427225.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722427225.git.steve@sakoman.com>
References: <cover.1722427225.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 12:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202708

From: Peter Marko <peter.marko@siemens.com>

Debian 12 no longer supports replacing dash with bash as default shell.
Therefore to achieve compatibility with Debian 12, all bashisms need
to be removed.

Shell comparison via == gives an error with dash and thus the condition
is always false.

(From OE-Core rev: 3723b26f82219ff71823335d550dbf29086d63d4)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index d019b0790b..3aa8fe4045 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -145,7 +145,7 @@ do_install:append:class-target () {
 		ln -s ../${TARGET_SYS}/ext ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext
 	fi
 
-	if [ "${TARGET_ARCH}" == "x86_64" -a "${MULTILIB_VARIANTS}" != "" ];then
+	if [ "${TARGET_ARCH}" = "x86_64" -a "${MULTILIB_VARIANTS}" != "" ];then
 		ln -sf ../${X86ARCH32}${TARGET_VENDOR}-${TARGET_OS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/32
 	fi
 
-- 
2.34.1


