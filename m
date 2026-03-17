Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C17FF6E6B
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:25 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86042.1773779363161023286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iv8PJC07;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-662fc12ac5bso11569991a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779361; x=1774384161; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dugZ2Sn8XhtqwG8js6QJJkEBeTyA9A4mQm/615Rr224=;
        b=Iv8PJC072XuH8HCyEinxIRQoG8xJArMlwEuujtLYFFiJazEqVP1PJe37v6fXQOK3wc
         +NMUlFX04YPr9CemImapkwBTDqT+Okg2CaCfMbFJ8g0sXntDE+DbqzonGH+ipIvZwt7B
         V9Dc2HbyKIW7Kz7HxcncGpq7GLh4asFrgQwigkTHdRVlLZJ33lKMBVlZEe54CVbivHDi
         f1Pi6CmDu/Lld2LGVoZ+jFsClAPATM4XnPdMN5Nv6Dmj21PMENut9xtpXbX9ZkDmWaIK
         D6OCZmXiZc/+/g6azy6RRCvY/p0AkwIvNEohfV11IzvK6ypJ5+9xdgJhu7fRjhU+Vqly
         0Bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779361; x=1774384161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dugZ2Sn8XhtqwG8js6QJJkEBeTyA9A4mQm/615Rr224=;
        b=XHZkSKn1ZHo/NFSOrY+E49A90nELG0ibITxHr8iF+EbY3HwiDhWX+I4CDUvg3k7E/R
         oc7GnaVfC5BQEnkTL8gkzmjMjc2e+kAwa3+DtmdTNx412TZ3+u1D8zJdV/GAjUmTlYsM
         H4Hl5HXVW87gLENroxqemRiNBUIa1ENj02zgETSrqYoPe1EXBTEgzem+8kd3QHpDBb4V
         0C8Safnz43bEsToS4AQoTBLueg+lePGOZWLs4d6MHk7zlYthy8N7Ibf0YyYGg2lcx2tv
         3Fp10ds6ZSJXYMbxILhEpcDy1ZjeECyD6QXbvA+niO7+qT/H/OZBSvn38jx7BmbnA7Zn
         whdQ==
X-Gm-Message-State: AOJu0YwA9RpT2TKIwJJmM/QxMCidQXBIlXasmQZoA+iAZi7dndmxuCWP
	AJ5GTnkbVCVxoqbpvulFYHK4GlzroyabiujtSRIUTeW7agLGRYhmFIp7RGUBQA==
X-Gm-Gg: ATEYQzxhevfSYOo3c83AQE/Byich4zn4/nu4Q6LclxpNBPjoO8Jygpl54d8i8fJNnZY
	xkU5Nk8qkL6ozAfqmKsfATKuaDhYJkS6KhKFUCy1mgntR8mLcKHRLKWIrS7JuCpTq8b5l+jHFV8
	hDNKiirsdxk5PWP28GcnIUmLIJrf7JwtOVKJVAL3dUWBL1x2l47w6r7irFi4AdbaKRNV+2RSP4W
	GeUkGLwpN5V4tqNow1re15wlILF8QXWaCm8qjoM1Wz6wpI0Cwrc+tj0xIQBT5xC2betEMI6mASu
	WeULnVs8FzlgUYtQAavjiTlhuAfcqG0UvwtGX7YnI3wxJz/g9h/Ms8lj1+6zxnClIMdDVMrsOgh
	tS8QTaFxrOc8sCyuvEzRe9F62MeeHuJ+i+tblQLqhap9qYMVeO5mxofNtdCBBEVqV5V3vrvbQA3
	u9O8Iynw2OAG2Ryi2zvYiNpGpM08mNsJXsh546xko/P83orR1KVNmL+lnp96FV2ek3OoSCBbu42
	g==
X-Received: by 2002:a05:6402:210a:b0:662:a76a:7039 with SMTP id 4fb4d7f45d1cf-667b1984da1mr694196a12.3.1773779361147;
        Tue, 17 Mar 2026 13:29:21 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-154.cgnat.inetia.pl. [185.164.141.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm451909a12.19.2026.03.17.13.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:29:20 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 21:29:05 +0100
Subject: [PATCH v3 06/13] bootchart2: Convert confusing appends to override
 syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v3-6-59452f073f31@gmail.com>
References: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233341

While in this case `RDEPENDS:${PN}:class-target +=` wouldn't result in
any unwanted override, there is no guarantee there won't be a change,
which would be hidden by this override. To avoid any surprises in the
future let's use `:append:class-target =` syntax here.

Also moving BBCLASSEXTEND to the bottom to conform to the style guide.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 922e665028..013a86bf78 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -106,9 +106,6 @@ ALTERNATIVE:${PN} = "bootchartd"
 ALTERNATIVE_LINK_NAME[bootchartd] = "${base_sbindir}/bootchartd"
 ALTERNATIVE_PRIORITY = "100"
 
-# The only reason to build bootchart2-native is for a native pybootchartgui.
-BBCLASSEXTEND = "native"
-
 SYSTEMD_SERVICE:${PN} = "bootchart2.service bootchart2-done.service bootchart2-done.timer"
 
 UPDATERCPN = "bootchartd-stop-initscript"
@@ -150,8 +147,8 @@ do_install () {
 PACKAGES =+ "pybootchartgui"
 FILES:pybootchartgui += "${PYTHON_SITEPACKAGES_DIR}/pybootchartgui ${bindir}/pybootchartgui"
 RDEPENDS:pybootchartgui = "python3-pycairo python3-compression python3-image python3-math python3-shell python3-compression python3-codecs"
-RDEPENDS:${PN}:class-target += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
-RDEPENDS:${PN}:class-target += "lsb-release"
+RDEPENDS:${PN}:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
+RDEPENDS:${PN}:append:class-target = " lsb-release"
 DEPENDS:append:class-native = " python3-pycairo-native"
 
 PACKAGES =+ "bootchartd-stop-initscript"
@@ -164,3 +161,6 @@ FILES:${PN} += "${libdir}"
 FILES:${PN}-doc += "${datadir}/docs"
 
 RCONFLICTS:${PN} = "bootchart"
+
+# The only reason to build bootchart2-native is for a native pybootchartgui.
+BBCLASSEXTEND = "native"

-- 
2.53.0


