Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9F6C369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 06:30:16 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.1416.1745562610312173507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 23:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CHy5uVP9;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso2126461e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 23:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745562608; x=1746167408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ia1Hr7DqJMdN4WtL1aMw4YtIE3JHH8I2sNhIYJu7eY=;
        b=CHy5uVP9Fs3aA5Yz6UQY2lSb8ckliixWp8f1+hgRONHxsHLTYeDn6P63vK15t6K99m
         TXAyCfyC43BF6wa2vnpTIMUr3GR8YlTIwJZlq0yo/Dr2PeoD65laozWBzorW910ZKOWl
         yvQgX59BtSmmhoLUfzAdR4UIkAsusz7Pji5w6xBB2CdbciNr5xsvEB1gJywV8sNWsrnk
         4ygVOHvCVl8nF2AV7Iu5V2IwuxVSXy8yLAjPnJpwFlpFnlTmzuy9COksfa/YzXl2+JRi
         Ps/Aw8F9W/6gGK8jA7HnKVmr/1JKPIh9ZmDqKslrzSOJyfj/mzKsvrRI4sBzGbPTpzfL
         x1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745562608; x=1746167408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ia1Hr7DqJMdN4WtL1aMw4YtIE3JHH8I2sNhIYJu7eY=;
        b=excIvJfwWOF1tqVCytMPyJPTFSc2VSuIcl5A1tWZhcn14RQcX1JM51ooxvQvw5CNQN
         1UR6QXej1VI4Udiv8U9bOZwVkDEB5b2aIBilgZRqO63YQc8wZavg6Av2Oswf8gy4Qv1z
         HcXXUQqHpHlakEDpcm4J+k+Q00BESVXTbyxUijdrEASgXWz8GmUhrmEgqW54DjTxn9Il
         c8QktJmxORBFb5aNZDSelFxkzv2kX313z3MmeOLqrGOG+Qt96AFZIOo9S//ULiZwH+2t
         2PcmlMyH38d9BzGpUkiNxpCwmkP7bq6Vo1jEzTIYvKqlTLmdRv6xnHsmCpENChqbO4D8
         5cgw==
X-Gm-Message-State: AOJu0YzOBGnZn8C3y+WBN4YyVGu0y0SK/C8ULsdywDwsn/Tl3lPJ2+eS
	DvdycBYOv0nEAb+lNDMcR9dldC5zBxB0fJg48RkKLVf/kBcG/xJHvRxXbA==
X-Gm-Gg: ASbGncs2J+rLED/CeLAeINnQRC0szGUCwl0die7jeOZ2V1dTc88YQ3R1GfH1x8g6TZc
	RKQx/K7WkvYck+TW6NwryQT9V9WquEM23wj9brNYq8706bMMUVlCG6vY8hbgfyw6dcUb+zyA/pT
	+s6CW8VbSD1TeZa+E4oka1Dr82unzc431BkbC3bH3fRK3bd+nTaxCoDnGweu7Jzn+p8LgnQ9TrF
	HUtTHQUgPfi5utxnQScnfIAPgyVWm/rEthUYqsue4cqcV9Ysnp/7aoOseExqRBf0wmkhJ2jvZo8
	d3R7T+9HRS3uwcpfdYpKFYqFo81coWBl9b+gR5KKUuEEzk2Kiw==
X-Google-Smtp-Source: AGHT+IEIIPkFQh3JTd0l6UQsoKXRrBV3xT72ZCQ0WF5zIuYe+CpMLAVMqDGqg5pofIm9SQSZ6F3NRQ==
X-Received: by 2002:a05:6512:3c92:b0:549:912a:d051 with SMTP id 2adb3069b0e04-54e8cb75d26mr405984e87.0.1745562607899;
        Thu, 24 Apr 2025 23:30:07 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3a2d6sm483801e87.69.2025.04.24.23.30.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:30:07 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] libjpeg-turbo: don't use chrpath
Date: Fri, 25 Apr 2025 06:29:50 +0000
Message-ID: <20250425062950.2888526-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404084324.3024896-1-samuli.piippo@qt.io>
References: <20250404084324.3024896-1-samuli.piippo@qt.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215427

chrpath doesn't work on mingw32 binaries:

| `/build/tmp/work/x86_64-nativesdk-mingw32-w64-mingw32/nativesdk-libjpeg-turbo/3.0.1/image//usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-w64-mingw32/usr/bin/cjpeg.exe' probably isn't an ELF file.
| elf_open: Exec format error

Instead, use CMake variable to disable RPATH and avoid the
useless-rpaths QA error.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
index 56bab4daca..a1d7d57fb5 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
@@ -23,6 +23,9 @@ inherit cmake pkgconfig github-releases
 
 export NASMENV = "--reproducible --debug-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR}"
 
+# The binaries have RUNPATH=$libdir, which is redundant
+EXTRA_OECMAKE += "-DCMAKE_SKIP_INSTALL_RPATH=ON"
+
 # Add nasm-native dependency consistently for all build arches is hard
 EXTRA_OECMAKE:append:class-native = " -DWITH_SIMD=False"
 EXTRA_OECMAKE:append:class-nativesdk = " -DWITH_SIMD=False"
@@ -52,9 +55,4 @@ FILES:jpeg-tools = "${bindir}/*"
 DESCRIPTION:libturbojpeg = "A SIMD-accelerated JPEG codec which provides only TurboJPEG APIs"
 FILES:libturbojpeg = "${libdir}/libturbojpeg.so.*"
 
-do_install:append() {
-    # The binaries have RUNPATH=$libdir, which is redundant
-    chrpath -d ${D}/${bindir}/* ${D}${libdir}/*${SOLIBS}
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


