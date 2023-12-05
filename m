Return-Path: <jandryuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0C4C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 18:42:51 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.1731.1701801763147792241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 10:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N0MY7cL5;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: jandryuk@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-77dc404d926so375017385a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 10:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701801762; x=1702406562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vu2tUxFPrj9y9xQvwe0AiDckfkP0yx7jWSUdIvEuzQM=;
        b=N0MY7cL5ezR+RG8L/zD2cr4cfkmYd1R0qUwASnETFvb0k33o1Cq5bMIX/sgjteFZjF
         4LHUPWB/8YGHy6PHOXpf2kWdkSgeBlVbbTXmgbTPTF4HtuDC8sGrCX56E0cr2YkM7Tyi
         9KM/MJBER9hpv7n9sP4LtSmJRJqWg6tiMCQ9BtXWckYO+CtUCBIJeUM1pnz0g8PqYtCT
         NnIimbFgTAD5uneM/TzJRgmQTENfg1N7XkjQ/ba1zOyvDptWx25LWOPjmOiBEqmbu9QD
         ReMS6i3TXyyIdxJxsAve6dJmy3nqq+1hOHocwXA6B/+MqXugci5N2saqJTcHkFrTIn4X
         JwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701801762; x=1702406562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vu2tUxFPrj9y9xQvwe0AiDckfkP0yx7jWSUdIvEuzQM=;
        b=bOAnfuYMM6dGWIWUGiAi26/02wB0m/VVZySZ5QPl4XYCZQ8JE3RfcnQxf03gpiowW8
         grsHk7Qa+3x8Shy6q+FAuQvbC8vIQfwcB+nF1kjYl9Y1vrgguntCoFj+Tce7t6OPO2qf
         UZ6Wz5e+qCHIakossDbUuqW5QDvbM3zsJjDjTRSO30NtDc+VOzGMPI3o7slqIRw5xSo0
         +NwSAp+1gf0ctPyVN8vkkdLdsi1ZTYu9aHE3C/NTKJi74UAJVBSPJ1X2oNlfegQH+c9X
         DlK/UqhLofyozQv9DB1/azuBS943+KdfqbfvT7GY5Y224JMn6fTNPu7EzPKcaFXZz5uh
         3O+A==
X-Gm-Message-State: AOJu0YzCXC9yRryz5rSvGl91wp/DNt0uBVMjir1J3WDViJm7nvQTU1ev
	lL7zblqgQ+2vTL8SCzhzA0ZJKzPBwUc=
X-Google-Smtp-Source: AGHT+IE+vagKF0GULHBHinK9NjMCqljPw61SI8Pv2dPK9W7u/VSkQKjcvGnn5YnB8r2ctZ3UDd3tDQ==
X-Received: by 2002:a05:620a:13dc:b0:77d:a68b:8b7d with SMTP id g28-20020a05620a13dc00b0077da68b8b7dmr1623274qkl.1.1701801761724;
        Tue, 05 Dec 2023 10:42:41 -0800 (PST)
Received: from pm2-ws13.praxislan02.com (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com. [207.172.141.204])
        by smtp.gmail.com with ESMTPSA id uc7-20020a05620a6a0700b0076cbcf8ad3bsm5267386qkn.55.2023.12.05.10.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:42:41 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH 3/3] linux-firmware: Create bnx2x subpackage
Date: Tue,  5 Dec 2023 13:42:06 -0500
Message-ID: <20231205184206.30387-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205184206.30387-1-jandryuk@gmail.com>
References: <20231205184206.30387-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 18:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191862

bnx2x is another broadcom ethernet adapter with its own firmware.  Place
it into its own subpackage.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 .../linux-firmware/linux-firmware_20231030.bb              | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index a1229e4827..6667f00612 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -341,6 +341,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ice-enhanced-license ${PN}-ice-enhanced \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2 \
+             ${PN}-bnx2x \
              ${PN}-liquidio \
              ${PN}-nvidia-license \
              ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
@@ -1104,6 +1105,12 @@ FILES:${PN}-whence-license = "${nonarch_base_libdir}/firmware/WHENCE"
 RDEPENDS:${PN}-bnx2 += "${PN}-whence-license"
 RPROVIDES:${PN}-bnx2 = "${PN}-bnx2-mips"
 
+LICENSE:${PN}-bnx2x = "WHENCE"
+
+FILES:${PN}-bnx2x = "${nonarch_base_libdir}/firmware/bnx2x/bnx2x*.fw"
+
+RDEPENDS:${PN}-bnx2x += "${PN}-whence-license"
+
 # For cirrus
 LICENSE:${PN}-cirrus = "Firmware-cirrus"
 LICENSE:${PN}-cirrus-license = "Firmware-cirrus"
-- 
2.43.0


