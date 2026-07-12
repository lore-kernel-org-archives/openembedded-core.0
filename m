Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04E9C44508
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:48 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9505.1783835504318536421
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=hluyRSbm;
 spf=pass (domain: underview.tech, ip: 74.125.224.52, mailfrom: vince@underview.tech)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664cb440f9eso2782096d50.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835503; x=1784440303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q8kloaActtlBI0bLNFGHLyKNMjduJ0pKjq9IACdqr3g=;
        b=hluyRSbmHwsFJ22/AxfUylpX83KZXoF6IOaFfi827HZGo4zivxQOyfRBW3a63nra9x
         uYGKTxTDDq91arATjpBNOOlD5k0TWQ9yZPsxhKex0lHToZHnN9p0/DDU5Hg9m4dTZ8sC
         MU6ctQTAYO/CD/6PAlAgJYdFPCrF+O+Sx1E6aIdsswzVTFjwbrucA6PNJZd/MAGM3gu1
         EFriFWvL37dFRvduDT7eBgjQ4z0ZJM9MKQ1R05qgmMOG785V1Ihmy2m40MdEOXdHhYND
         Xj0VcUfTsYv6Kyn94T90w4OnEM9FxqdVlQdLMbkSWQ8y+3dh28TXgV/ZKJHklTU3SqLS
         1WnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835503; x=1784440303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q8kloaActtlBI0bLNFGHLyKNMjduJ0pKjq9IACdqr3g=;
        b=DHdVCPhDPK/zFIcJpcVY3MEpCXPKM/mR7iDAEtgnzTSgl9AhCuEttLOyu+N96NTDDY
         vXGB7mS9lLELxSM9MqPsinmgMH6BArR0P7ADaYRx2XQKskmqUWfch/c5T8W8XVT6dgs+
         KzUG4hHdvaMlItkt0vm7vgwXAEPyNJ+XcTmQiy+Vr7eVyyrhWgrEExxsBDIkn37UuhDE
         indgrh9IlIeO/UYroJRCc5bPhXTWMm8L+BjrZXmOtSnUydJdRzV2MvEOZ86avf6h0GEW
         Fx8I3syu7CpmKm3pwY9MlvtVx9iNJGBUHSAcvkAH8151FcCsToX3GoXBU3ywmgPHHln1
         yCVA==
X-Gm-Message-State: AOJu0Yxk+21k6w7CWJdvNE6ffZNLPotUNNpiLM4ngC3auytnYpx2ufDP
	ON7t4Ics046rH1tKhQNNzv1vMSXInJXPdgGRixqBu8Rdg4cxqSX1TlUhiAz5iEHyHQMzGPw6C8k
	yjSGm
X-Gm-Gg: AfdE7cmIu979fvH25/6oMqsl35lmXbQqNdmyDYZAqin2fUdlfVvs/8wjq38Xd78LaOF
	noBHvjVbTp8Caq5wYQymoQLzPqIdtLjFjtPiYZfbKMnZfbtkcsZNWx4ImdFOHDCCaG7ge/2ENkZ
	YiETUGlYCtYba8ffKooYnrId3l9P1MozqZ8c7rHFxsIq0kGGzj04rguTqdQM8sjSoTZf4UssbaH
	UJWqlYwAhQgkZa/rYuzz62rjqF4DIiO2MjQQmHuHnptvoKR4msCis2HA7Iamew1zdmLPdOaOHRh
	1N+aJC24mneKx7p9F1aRXJaQgt9HNLBMMg9yZpjUJGotm9p8BC608EEYF4uQWKuWfHDvTQSvXTh
	Ck7mapfM0+jOqKY3SER6AuQ2d2AKoS5DrlrXTZhXIulfG8I0OpATCsd4I+HTdJZEHpy9D8oK6Ke
	nkRHIudoaggq9Icw==
X-Received: by 2002:a05:690e:12c4:b0:664:bd7f:134d with SMTP id 956f58d0204a3-667d7b2adb5mr3152036d50.23.1783835503378;
        Sat, 11 Jul 2026 22:51:43 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:42 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 15/26] util-linux: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:43 -0400
Message-ID: <20260712054954.4063745-15-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240740

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-core/util-linux/util-linux_2.42.2.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.42.2.bb b/meta/recipes-core/util-linux/util-linux_2.42.2.bb
index 4943d5c7ab..e0f248e3ba 100644
--- a/meta/recipes-core/util-linux/util-linux_2.42.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.42.2.bb
@@ -207,7 +207,12 @@ RPROVIDES:${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev"
 
 RDEPENDS:${PN}-bash-completion += "${PN}-lsblk ${PN}-findmnt"
 RDEPENDS:${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs findutils grep iproute2 kmod procps sed socat xz diffutils"
-RRECOMMENDS:${PN}-ptest += "kernel-module-scsi-debug kernel-module-sd-mod kernel-module-loop kernel-module-algif-hash"
+RRECOMMENDS:${PN}-ptest += "\
+    ${KERNEL_PACKAGE_NAME}-module-scsi-debug \
+    ${KERNEL_PACKAGE_NAME}-module-sd-mod \
+    ${KERNEL_PACKAGE_NAME}-module-loop \
+    ${KERNEL_PACKAGE_NAME}-module-algif-hash \
+    "
 RDEPENDS:${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY:${PN}-swaponoff = "1"
 
-- 
2.43.0


