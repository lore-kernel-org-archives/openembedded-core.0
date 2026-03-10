Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC078EB104F
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 11:34:17 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37788.1773142455884140310
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 04:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=U30sOFa9;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a12f88d839so6557633e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 04:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773142454; x=1773747254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dxq5tWmvfHajIBd9DlmF35RNMmD4iTjc1Y8GQMXlo1Q=;
        b=U30sOFa9D1sDmtJYGe7I4LK3GhHymyLYe/djQDShHAwQVClnZ1Q6h+fmyOo1wf9VJa
         YYHE+atsGWlNYyOjl3kVvSH7CDLh69U0A3BK9IDV+M0tAoGNwo+DvmOMkFFiqzK4AlUh
         9cN5v7OwwwxFfZ/Eg0f8Tmi588YR80dn/3msJRXeZOvuQ+Fs4cgLV2Q+ISptXhaN+yso
         ukpIgvMP2czdq3PNO+P6H8KSeREpLmKxNWTj/fVwQfeWQ9+bfFhCp8+WU7J2GEV17uXi
         d/EK2Gn2FT4f6qwKh2ZP1wzIa9N3ZGS1Mab+lQHXDqw7EZ7aLRwhnHKFsc8qkWF4hBkL
         cSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773142454; x=1773747254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dxq5tWmvfHajIBd9DlmF35RNMmD4iTjc1Y8GQMXlo1Q=;
        b=kClZwD55Akt/4DIWI56sH6UePChyz+E/u5G9dtimBT4lBwD2U05ZuHNKS6dD2soTgO
         8i172ND39zy2FTmks8HjoYyqoM6ACMS0nAEmXkpybOhkqGd30XLoyW7KT2f3KA0MeWvY
         O1VG/jnS/qgorXgtKT1mc5G220PZi29NFoSjE/a4WqX84Ajd+Dd4Ys2S7e/6BxgarmPE
         +VCZgBkOrMs6UpvsG+w1dND+Fw9+khZPpzgBsSzzLIyToTLO452TFzNctkK6Kah5/4+/
         c6gFal72KXfbv3FbGA+sMiRFVjm1ZS8kSsaSEbwwe3kGHF5GmIwRGrfYnbXwvln9p34w
         yZWw==
X-Gm-Message-State: AOJu0YxLbBjjDRS4jsilgzecLgTcZjxwezXkjebUmd+A6GdhEPVgTx2j
	H+uZXT58RsucIObFTGGV6QuhFHeS/hxXDoa5YdgHgY6S8Al9gfH+psvnMU0jhINf+ds/Q31BCzi
	Hqqx1R/k=
X-Gm-Gg: ATEYQzwxI2mfMT8Q0gZDK8grNHix+bWVikPZOsiLg/4cNf4RlNGtIP+AB5Qs8ttqwiJ
	F89zZ2xpc4NzzjgWK3lURRPHWWs8ViyGsKYQtCufhwBTNGIUufF4STTXHP/10MQs20etOSlbbMZ
	1lHsGhsBuMonqEGXtO3DTwfQk+Llgtx1KieHp+BL882IPP58+LNH+MGVyUv2T/4Y4zemiDtBvIh
	ae0UMcnuJ7hs3Rvv0ofQEIloZjqZv0KzvlMuAY5gBCt5YWJiTsTJj/EHsknDIpnA1BaxTiGJLBD
	hsQW2UMp/OmnuATyy6JkjfYmhE3RbWbylozMNlNWy/ri5qwG1k2D9eJgifpctYF6u8ZLnaqL/+k
	sMK4WXvMFms0HB4rnmFSRBmrPhRU7X1/GtCSg8MsnysnBsD2B7D8qgQROF0K8zaU/T1tZIZTsgF
	FSRupCnydJ7jSR+hydOf2NjCYjo3Z9UxET/hgBax1krRKFbIAnT2dmXg70yGz1QRRHQ3M=
X-Received: by 2002:a05:6512:6c8:b0:5a1:18f0:930b with SMTP id 2adb3069b0e04-5a13cd1c912mr4942790e87.42.1773142453702;
        Tue, 10 Mar 2026 04:34:13 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d383sm2678721e87.86.2026.03.10.04.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:34:13 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] kernel-yocto.bbclass: capture merge_config.sh output to task log
Date: Tue, 10 Mar 2026 13:33:51 +0200
Message-ID: <20260310113351.194882-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232770

With https://lists.yoctoproject.org/g/linux-yocto/message/16359
updates to merge_config.sh in kern-tools-native the output
is useful and not too verbose. Thus capture it to normal
do_kernel_configme task logs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/kernel-yocto.bbclass | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e53bf1519418..d981ca0e30e6 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -492,14 +492,9 @@ do_kernel_configme() {
 		bbfatal_log "Could not find configuration queue (${meta_dir}/config.queue)"
 	fi
 
-	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
+	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs}
 	if [ $? -ne 0 -o ! -f ${B}/.config ]; then
 		bberror "Could not generate a .config for ${KMACHINE}-${LINUX_KERNEL_TYPE}"
-		if [ ${KCONF_AUDIT_LEVEL} -gt 1 ]; then
-			bbfatal_log "`cat ${meta_dir}/cfg/merge_config_build.log`"
-		else
-			bbfatal_log "Details can be found at: ${S}/${meta_dir}/cfg/merge_config_build.log"
-		fi
 	fi
 
 	if [ ! -z "${LINUX_VERSION_EXTENSION}" ]; then
-- 
2.34.1


