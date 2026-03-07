Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE16CF55123
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:53:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19030.1772923989939773477
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:53:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z3RTgmIR;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852ff06541so6739015e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772923988; x=1773528788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJgCLMawk6y1hfFBEYE0RxI5K6lFpC4N7Cc055o7MGU=;
        b=Z3RTgmIRTwEmHRy8d7unuPFscJbRMnL1uB83+M6kJBQTbsn87o3SZzTfen2t44lVJF
         qgN2KtsCWgUWfCScSQm3PcwlX7blHfOIETEKQ5VOkq1IkXEobmMyqmmJls2fvb/sVBdw
         p4Ht7+yW6KQcqWfYrIMTTpqn9QCKSF8w/Mf2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923988; x=1773528788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PJgCLMawk6y1hfFBEYE0RxI5K6lFpC4N7Cc055o7MGU=;
        b=JMgccksh3rblTdBOAJW82n1BW5p0bGia+KvjqnkJvQ+wB+O5f89YK9Qrmk6WRfxk2x
         b/DmiGpzvbX8+OPP/le+Qamb+VBwcy9+1Jzd/NVkLzzXONFOCDTPapksLkJYf0zHdPwg
         J3YF92TBob96Y+jnsZRXqtqzN20uKYGNkNGina4EL8muGTZqK5zMAfHl9/d9vTOp+/Lj
         Ni6buHee0qNgPosaW6ww0R+6O+4lYtpPJwYiiw90LVqdHtmghUK/RhfUroFq48n533Do
         1UQarbPq9jtpHF1zm0QtCQVZ8uJ8ACTiDL5j+PqM2y0CmuBU4hpOyMT9iF9g99Mm7JGU
         lqYA==
X-Gm-Message-State: AOJu0YxdhmykE//3EtmYwx8SDCWk7pf6/T+A8nhl+TJeJlZg4j4Aj+kA
	/lqTps2mh+BA+6vK43sCqXMb6HEDH2ZjpPQcmxxnyNoqCMNAfUCd0qzUBSitMN9WQGB/JxagdEp
	OPy7N
X-Gm-Gg: ATEYQzzkNYWCRwecSLSp0A2Xtb+iatlrpPiMd2UDqDvlNLQPGt10NX2piPpT25xOYlA
	RHnq5M50jRl83QhD0yjRtuOuCElQaOnX4RdlAca5v4kwZJaGlz01C4LZjXWMfbDeOp09MlE3GVq
	VITT/AoMZ7nzXAf9NfSLNUjTDEo5aKGRiVDGm1C5zpw4c7ax7RruDJ7Mh08of0++bj4Hf+3WB+z
	TuX7hb3QzKNNITXPjLi+KC58/Qb1ZIkdLFupsalHcxZwkfocqCV9gouCBjpS6soLLzxoUjomWPS
	NOtyE317k4MgJaJjH275yYBqMvRv7MOF9fcGYx/DMEQJOttH6mj1GLerE2f9bSaZNoBazAQVUTO
	iGjGfACDxOpnfP5Es4PjDRnJ2/0pWeR6ac6UAnG+beQJ7L+0nEoHKWtqUwmGxkW/g/EuvI7gEHG
	jHbiDLHw+AB9AlgVMELDG6IaZFTlRxvGcSBdoz2QFdd2u2C+t/20eASA4kX/IkXoNffcq/+BJrz
	Bzd4cTsC+//cKUvv7SzyU4dQj8=
X-Received: by 2002:a05:600c:1c10:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-48530f76fefmr40414545e9.31.1772923988010;
        Sat, 07 Mar 2026 14:53:08 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm133287175e9.6.2026.03.07.14.53.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:53:07 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/11] uboot-config: Fix devtool modify
Date: Sat,  7 Mar 2026 23:52:25 +0100
Message-ID: <f26325079e8333142904f6c7d688412a195ad08b.1772923420.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772923420.git.yoann.congal@smile.fr>
References: <cover.1772923420.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232633

From: Tom Hochstein <tom.hochstein@oss.nxp.com>

Fix a problem with `devtool modify` as suggested by Marcus Flyckt on
the mailing list:
```
    I encountered an issue with `do_config` when using `devtool modify`
    on `u-boot-imx`.

    ```
    [...]
    | cp: cannot stat '[...]/u-boot-imx/2024.04/build/imx8mp_wl400s_defconfig/.config': No such file or directory
    | WARNING: exit code 1 from a shell command.
    ERROR: Task ([...]/sources/poky/../meta-freescale/recipes-bsp/u-boot/u-boot-imx_2024.04.bb:do_configure) failed with exit code '1'
    NOTE: Tasks Summary: Attempted 963 tasks of which 962 didn't need to be rerun and 1 failed.
    Summary: 1 task failed:
      [...]/sources/poky/../meta-freescale/recipes-bsp/u-boot/u-boot-imx_2024.04.bb:do_configure
    Summary: There was 1 ERROR message, returning a non-zero exit code
    ```

    The issue seems to originate from the following lines in
    `workspace/appends/u-boot-imx_2024.04.bbappend`:

    ```
    do_configure:append() {
        if [ ${@oe.types.boolean(d.getVar("KCONFIG_CONFIG_ENABLE_MENUCONFIG"))} = True ]; then
            cp ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.baseline
            ln -sfT ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.new
        fi
    }
    ```

    For some reason `KCONFIG_CONFIG_ROOTDIR` does not point to the
    correct directory. It gets its value in `uboot-config.bbclass`:

    ```
    if len(ubootconfig) == 1:
                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join(d.getVar("B"), d.getVar("UBOOT_MACHINE").strip()))
    ```

    So the main issue is that B gets expanded in this expression, and
    then later B gets changed by `externalsrc.bbclass`.
    `d.getVar("B", False)` does not solve the issue, however the
    proposed change does.
```
- https://lists.yoctoproject.org/g/yocto/topic/109254298#msg64152]

Fixes [YOCTO #15603]

Suggested-by: Marcus Flyckt <marcus.flyckt@gmail.com>
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 57b21065a25100c31515b32fd7c77bde3355d684)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/uboot-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index f360050042e..b235b954d4d 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -149,7 +149,7 @@ python () {
             # Ensure the uboot specific menuconfig settings do not leak into other recipes
             if 'u-boot' in recipename:
                 if len(ubootconfig) == 1:
-                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join(d.getVar("B"), d.getVar("UBOOT_MACHINE").strip()))
+                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join("${B}", d.getVar("UBOOT_MACHINE").strip()))
                 else:
                     # Disable menuconfig for multiple configs
                     d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")

