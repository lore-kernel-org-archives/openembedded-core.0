Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B4CC79FAD
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:17 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34940.1788788167507874367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iNs5XsYR;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482ea739de2so2399170f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788166; x=1789392966; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnMSyLhyHYgQP76hLyrZqxTNK0Nt4A7zDhxgFflgpC4=;
        b=iNs5XsYRwaOUYS6rsk34YcfjgnfLRgdcXJkcNDgdwC3Pr6gFz7LsKQNrnrcVBAFkAd
         7SqPAd+nB23lalq57YLHuRudUIfDWuob9eScHdqOp1hjxVGKPOhRwU+JHoCiF/jc7X4Y
         bp0Oyj50mnVDJf4BMEsAEWy4ZQtD8+GrT3sfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788166; x=1789392966;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnMSyLhyHYgQP76hLyrZqxTNK0Nt4A7zDhxgFflgpC4=;
        b=XljJec4PfOAoJdWjMecBnUZGOzIHad469vsgA4WSTJ3V91ErX9H/FmDVeQW5cD4Pa9
         oVUxQMLU9+Loh58kC+YWBk4JGqbAU3g3lf+Rg0uNkfYssyJhHkgobEAzSQjWJe+/YC/+
         ahumB+Mjiicfn358iD0XwjaR7qy2KPtvy65vVpSHEQs96CU1cjo2FxGaJKCsKn9+WZd4
         aTHtmkXV2VOSJzoIHU8IRh5RJzJxo+y+hTG8IDstkqH/CsUfjhgpnM5TsKUpfNy3qrkX
         G4yI4YKlezJ45AkaCT0X4ehVRgd2g9hgLcWFY/DAW13r4JURPYe3l4tOml+SyZ0ybLl+
         Kvlw==
X-Gm-Message-State: AFuF++lupCSD5byVw+mJ8cKUQTHpLqZiIqmD3n9ZcWfkV5E0IFPDRrC+
	TsdyqEtZjIuv3KL+DkM2xvRq+L0udeUsLkUIJEj7F+HA8At1JACWw+r9HCqnDb94qVIAxsPeHuF
	5Za4h5BQ=
X-Gm-Gg: AYBFou01Z1+fMPvulslX5B93goxVHvZDYL6w2sOGqzXha82RY1Ln6v2SWfyEB9n2YrK
	n9O9krenWniIaEdaOVx0DHMQLEpGLk/lffQ+TFXpA2UqufBY8gvPkJfhFUblC1FMk3eunSXcQuv
	4XUVsGg4Xd5mlfempOa8UKElFpxDM+5ePPve7MtNPqFcY+j6bWA/pKONgIa8PWjQTRXoEWSA1qH
	7iliEuCBdvb8e0x+PjLjzYnXgEjJaaQY+P4reYxPG0ApIs80jI14xA3DgQ9t9N9mnZhyDj7fveI
	X2YtL92AKa5lTW9Z5xdZ3FTDunKOml8nvPUZALfy2aekxIe/HmfJrZv5KShq95hO2OG6lU37yUr
	mMK0xH2GgOw8aGkIukbikv4Unj0jgDzjOVu53QoTiWB1wOoO4d7oAn6SmQP4uTqLd6mu02wcLjZ
	qo816TGUWHnVpaus0+U+fbPm5T+1Ici/2FlSpHkhIUq6HtzbrljEiIUb5zqu4jz6hLCjYh4ZFwT
	ui/Wy5r+1QHJJT6S0Wc9W51rQL7xsjtdA8h/yzNkqYB7cw5snlcJujnz8afZYEc
X-Received: by 2002:a5d:4c8a:0:b0:484:338b:3bc1 with SMTP id ffacd0b85a97d-485872edfb5mr21283423f8f.27.1788788165665;
        Mon, 07 Sep 2026 06:36:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/35] ovmf: fix tpm PACKAGECONFIG to use TPM2_ENABLE
Date: Mon,  7 Sep 2026 15:35:23 +0200
Message-ID: <e01b71bd0e69226399902ea4b0c58dae24ab70c3.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245284

From: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>

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

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d6b434455544e5922d75ba07a74490e6a6df7a0c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 4e6227f4849..06e96d3a089 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -13,7 +13,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.contains('MACHINE_FEATURES', 'tpm', 'tpm', '', d)}"
 PACKAGECONFIG += "${@bb.utils.contains('MACHINE_FEATURES', 'tpm2', 'tpm', '', d)}"
 PACKAGECONFIG[secureboot] = ",,,"
-PACKAGECONFIG[tpm] = "-D TPM_ENABLE=TRUE,-D TPM_ENABLE=FALSE,,"
+PACKAGECONFIG[tpm] = "-D TPM2_ENABLE=TRUE,-D TPM2_ENABLE=FALSE,,"
 
 # GCC12 trips on it
 #see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetools-turn-off-gcc12-warning.patch

