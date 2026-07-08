Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9C5C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 14:23:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9888.1783520578233941533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 07:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=UO8M/GmV;
 spf=pass (domain: baylibre.com, ip: 209.85.128.49, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso2199445e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 07:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783520576; x=1784125376; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPdf6l97EmnYsYJ1xiXbKmJV8nKye+s8LTf3GluXT5g=;
        b=UO8M/GmVxs2cENsluwk5K3LE55gxQW4VUK+0Nll/TuYZdWGbsgkSipyp0p4rxM/GFb
         inhUbw9l7oYDIA4yWd2vnePRaQzzUGBMpn5dei6iZZCjx0i3eBjekbKstnSWvQ6IGIY1
         DTStgdG42XNicVvLRsJRIpM7erN9jMORrPLv6wYEDE97/rr5F3xvhDGz1uwkZTU1NuwZ
         +uMPcg55oNp2bmOmnpnbnyDwRrG01oL39x//AfO5QESpWlWESU0tk+fH3VG2PMqLpPrD
         XvXu8XQf45RsD2qZaYj2aUwep+vaq8MwkizAHxqONqQIJdZQ3n/Pa0WSIlhcdNpNJWrz
         kMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520576; x=1784125376;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gPdf6l97EmnYsYJ1xiXbKmJV8nKye+s8LTf3GluXT5g=;
        b=XCYeJ3x/lQf62ye6lZ1OMJaGoS6PeVx9zDE3iHvyEXOv8xwjeaUAEIreCvOsp19ZN8
         RY2zxwk+vK0LyEUea7UZAfF6aWrT1lOgAQfyT1Cz3ZeskJac6xZiJUZSjpNcTjasTetT
         Pa8U9vLdWuELQmcDr40Ikp0pa400yIMOdsvBbbhLy00ETK52fTf7/TGYtzkSbM4W1tA7
         xwJ7mcj0v8J2D1mHG8fkMyzfzCrZfDsE1mQteCqiEyWOP5Od1i+FV7JNuaOBsP7OvhN6
         68oS7jgMhtrtoDDafsyimyRJLR4uKF7JyPgT0K2L5mAwnZMsiCONRMIfXy/RHIDBwAJL
         s7Ow==
X-Gm-Message-State: AOJu0YxRfFBjXliiWnAcONh+7zLoFxTbpDKmTpU99MB8UBJnt3AwT5mJ
	l1i9u/YuJpC4o1b3+Rn4MlYzhAOTIdF7CnbBJSaSTMGRvC9KQRtqTem1qklK5hIQlHKPcAbeCYw
	FvKeoS5c=
X-Gm-Gg: AfdE7cmxG/lEKPVAERP+TSPnUS/TF2veu7S++MilMiID0W7wLj/m6vhbgMKIOk2hOR6
	lVY6FkkuhRTU3RSJkKmVChCxUXtdrrGgk/pZENUAc7VQDpLlaL6xfxEdIddbA1c43fOJdSROqDN
	y59DA6V6gISAbzookVfA0PHnwzYVVxOsil/Q5b4Cfu+KVvNncuAcass3Q1gnMM/H9CryM6HlXrL
	Mj0GsQhBXhwL9bc0QyyvM5fEg2X5tN0Fh2FU0PjQduncF3cjIGIbj7eciuD3DEUkijsC3yBGWQX
	ySrFAB9d6u4rHPk6XPSn0Z0p2sdEnmVmNbLZlhvHoYczfzF7VHpdxu2MXyEsz3m83s6RIjkI6dr
	+NSR2uq4Wma4TUAUus42rdq2FmVxTx2OjgTmk/d1tvnU/h66V+vhEXtipNiBswc6Owrn1awX754
	D/Ym6f9XKYQKJDhorTuFBMkDdS78nWe00=
X-Received: by 2002:a05:600d:844f:20b0:493:c77c:108a with SMTP id 5b1f17b1804b1-493e68a1dc1mr22133375e9.36.1783520576432;
        Wed, 08 Jul 2026 07:22:56 -0700 (PDT)
Received: from ban.tailbdf2c4.ts.net ([80.233.37.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f43912sm162984755e9.7.2026.07.08.07.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:55 -0700 (PDT)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH] ovmf: fix tpm PACKAGECONFIG to use TPM2_ENABLE
Date: Wed,  8 Jul 2026 15:22:49 +0100
Message-ID: <20260708142249.916053-1-pidge@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 14:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240485

The tpm PACKAGECONFIG passed "-D TPM_ENABLE=TRUE/FALSE", but ovmf
renamed that macro to TPM2_ENABLE in edk2 commit 4de8d61bcec0
("OvmfPkg: rework TPM configuration", first released in
edk2-stable202202). Since then TPM_ENABLE has been an unknown macro
that edk2 ignores, so TPM2 support was never compiled in, even for
MACHINEs with 'tpm'/'tpm2' in MACHINE_FEATURES.

Use TPM2_ENABLE (as defined in
OvmfPkg/Include/Dsc/OvmfTpmDefines.dsc.inc and consumed by
OvmfPkgX64.dsc) so the tpm PACKAGECONFIG actually enables TPM2 support.

The same commit also added a separate TPM1_ENABLE macro (TPM 1.2
support, default TRUE), but its dsc.inc snippets are only included
inside OvmfPkgX64.dsc's "!if $(TPM2_ENABLE) == TRUE" block, so it has
no effect unless TPM2_ENABLE is TRUE. No separate PACKAGECONFIG knob is
needed.

I'm sending a backport to wrynose of this in another email.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index bda33e2631..ab276bad1f 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://OvmfPkg/License.txt;md5=06357ddc23f46577c2aeaeaf7b776
 PACKAGECONFIG ??= "${@bb.utils.contains_any('MACHINE_FEATURES', 'tpm tpm2', 'tpm', '', d)}"
 PACKAGECONFIG[debug] = ",,,"
 PACKAGECONFIG[secureboot] = ",,,"
-PACKAGECONFIG[tpm] = "-D TPM_ENABLE=TRUE,-D TPM_ENABLE=FALSE,,"
+PACKAGECONFIG[tpm] = "-D TPM2_ENABLE=TRUE,-D TPM2_ENABLE=FALSE,,"
 
 SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https;tag=${PV} \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
-- 
2.43.0


