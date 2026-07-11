Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBCDC43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:43 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1260.1783747474113654401
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=iUVufdlx;
 spf=pass (domain: underview.tech, ip: 74.125.224.53, mailfrom: vince@underview.tech)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66628618509so2214582d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747473; x=1784352273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdBrptHIHcrL36dUVDaY5zFVxxdxCbOaSdIJQGm6iOY=;
        b=iUVufdlx69++DHlWR6BNGojsTaScCTKp/uVXyowJGucK6/Dxgi3L9z8R2jeRL5u5cf
         EvsgxjzVMlVbu3051HJBuNd4eT5I5AR9s0uU0duoPSSDpdjEEzj6915ApOaWBUueVQM5
         SmimOkda2pO5T1k+NMUjJ+dwllM5MzSY4MbfAL71Cs5drMgi+se2YXaKuo+PanefW6tf
         SuIex+74Ff9RbNbigSPnQiW//4GIPHMhsqaZCxXEnW3xjEJH0R2p5IH2ZzuDNYL9ujRA
         7Da82UcL3biMsos+MdjT9KyIt+GOo6t7wcX/9rT7wOKt2KQs0QZI1DB4jLKloo/xVbSp
         qTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747473; x=1784352273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rdBrptHIHcrL36dUVDaY5zFVxxdxCbOaSdIJQGm6iOY=;
        b=BTaQdDfwka31FyWRUNrNLqEJetx8ETyOESduvnA5ezJIgMNVDHYIPAadnsmSO1u3Ry
         d4TGbg8XvoackTCzbyYzTmvXZoeRrvuNt/UWwM5Iu8gGoiz9EGHk6oDAUOGcJ7EYfLy+
         hrc4ELX9EMNdfryGEEbcy3I2JXyB+vS4FM8RiJXVugJ0BhNe6g2m4HFpP/HYGfDhSQxI
         oJPQy23awBBgSgpfBH0gC+59lmtnnsbZQ3W+1rtEQ5K6gAjUrC9AvlOcf74oZcTlYoee
         TWi5kYKwGZ6YqbmrLbD49qN+tgL270JCfaNIFxM3muV1V+9boc0biOyWLoEQ5eQ0ASA5
         26wA==
X-Gm-Message-State: AOJu0Yy1okXlfHm4pHidaP3U90TKPmn96av1TbN067X3+fuQcTH0QRjv
	lp5nMjvcmOlanOUIYxTDaflRZ2gOIZ0XYRGXYMAmGfxXkZ8PYLXNFX+BemEn0jw+v+jbn3E+IVK
	r5+nRDRE=
X-Gm-Gg: AfdE7cl+bZczrbnMs/rSvki8NYyEB0OJosmuraElkHwdTH6HJCSEfwNjw1iEW0T032j
	OKH8QmBE7wSxOH8WKjtSeHiyt1MQmYwb+A3TcU0WbuejVqjgFbjSq2t/W+PQ48tmqJlxrp3TyK3
	aiZ7dQcJ9lPt37AH73f61PQMQrL0vQaapwdkKKNSkv6AVDO94d49J+WrKXDOX1OGIhrZcKOSiV8
	AcM8Fk9Mxggpgj+7b0RiU6ZnsyN9HkwlnC+Xqj9q0ZQditjWKICWfwnk52s8JOuESegq2u4ZARC
	+qTxVjuXksI5cHKl/MYTu7gDFyB5sWMNPldjqCgPZoe/eWMRtfYMGNjo5KAGrYV1ZubewOs1SBX
	EtlFeincPSyUiFcVgRWnsCVnnfmvDWKcvXw8S1MP2meCg7RVXAZwVte3KukoekCV3JTs9NketOY
	IRa8nQttge2JBpAPOZ2iFhxg/r
X-Received: by 2002:a05:690e:b83:b0:667:ba06:8888 with SMTP id 956f58d0204a3-667d7eeddd9mr1362737d50.98.1783747473054;
        Fri, 10 Jul 2026 22:24:33 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:32 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 04/19] packegroup-core-boot: rename kernel prefix
Date: Sat, 11 Jul 2026 01:23:48 -0400
Message-ID: <20260711052403.1292286-4-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240685

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 5cdd161811..e7064c079e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "The minimal set of packages required to boot the system"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup
+inherit packagegroup kernel-vars
 
 EFI_PROVIDER ??= "grub-efi"
 
@@ -22,7 +22,7 @@ RDEPENDS:${PN} = "\
     ${VIRTUAL-RUNTIME_base-utils} \
     ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
     ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
-    ${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER} kernel", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER} ${KERNEL_PACKAGE_NAME}", "", d)} \
     netbase \
     ${VIRTUAL-RUNTIME_login_manager} \
     ${VIRTUAL-RUNTIME_init_manager} \
-- 
2.43.0


