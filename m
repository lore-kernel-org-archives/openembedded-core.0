Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99269F55138
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 09:57:21 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32662.1772963835573276773
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 01:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XaxgH/dh;
 spf=pass (domain: konsulko.com, ip: 209.85.219.48, mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-89a018cbbf8so85563546d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 01:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772963834; x=1773568634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y98CZOXo9ZOFCG27VnMvBumEPVQg62eMBsQKyMipmF0=;
        b=XaxgH/dhIQ/kCFfRjMfRniqpi6V0QvjSZi5Xp3iNNLD15SHnW7x1HifFEhrfmznzRO
         hO8F5IRe0G0cILD2UlwdOCWhbq4PHNOeAoIJt8QLDDCx5j49AD1AkxQ3861r8bPH/CR6
         38FCGxbYWcbVxezUjUliCUawBPKsJ7T1+Pk/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772963834; x=1773568634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y98CZOXo9ZOFCG27VnMvBumEPVQg62eMBsQKyMipmF0=;
        b=NRo2kr+diRI43cd2WJ1FpGI6Z6kVje4Zsx75hm5yyXTqN9xMnF0oXCfsnDrlCFGv53
         YbRbxi7KM9h1psbhGciQW5eAgY1hizDp7nZYDQcrmtqKVE7MG9Pnq7j2mfuL/9XDZXa6
         wI2VmzSYGjQFliOLNAYyIPKgydzbHL9onrotBx4VRkj8Nbnw8odOB18I8h93iwy+C+uS
         xvnjPUrzKCUz9y8NThzTLETmM4gpfSDkbI+efzNkiEMScVaL/0fwkE9cOqH3aE7OJHyx
         PPTeG2nssZcH5G5VBtuFXXuIRhTES5AgGT+w7bBT9kFf8O0Dosrq2pG6nByvwDAmtPYK
         Yi3g==
X-Gm-Message-State: AOJu0YzzM0hVXffs0hFJaEGIDxArDOZmAoXmhr9oc4vhXdgeDxS/OFqC
	Kc92YLet83En6Cfk0AAbEM559DWemHQ1zIpvocPaDDAGW+XFyts8LXJSi2hBuSDfREVL6sZ48XW
	6wbVG
X-Gm-Gg: ATEYQzy594SbA9xL1fF7ZEKfuL9hTgt3d37+oVHnUKekkaQ4y7luMYnw58cXPuO9qWN
	lXCQyFfoZapwmvl1zhhCzHgtPa/pwauQycij3Rbs9AMVIzpFxe/j5JRFRZbohSHJlvPG9EYvErg
	mlsiBk4WvPS67RZAkohfdKvROURTbjFETopnODWuZvxftqCTTrH27J1sMH9VEBRiDymAdw2msVK
	JLYOJLIuyxRXCTfER3siGjWlPLqGeyzu/RgBBaRTiwzDhPDughWy0aO10gW6TARSUgxXHwOoN9U
	iqWNB2s1EcSVzzOwE0dNdltfO6iAHY/LL7fjMqeLwDUpRRJITNA4WbtENRpBRll2o4z8SJT4VCK
	4AAoWkNBzPJiWy1/oisjFu2236IioWmiQVOb9N1WzX1bYUk2rZlGh4F9bpIUq1M48bQWtaCs4rO
	og3fmOmBiMELChstYE+5tntW+Kpnzw1U2uZ+jGpQtbZBcXHordLQnTcdBLX+TyvRGTYdmvGTny8
	C2n74kviC7a3R6f7aZ/O1YZCzpt5AEWNRlbQ6lrH3aDO1JiMhgS+emoWHS75cLk
X-Received: by 2002:a05:6214:ca4:b0:899:f1d0:68fc with SMTP id 6a1803df08f44-89a308acaadmr105275796d6.24.1772963834250;
        Sun, 08 Mar 2026 01:57:14 -0800 (PST)
Received: from ghidorah.spiteful.org (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a3171bca1sm50858976d6.51.2026.03.08.01.57.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 01:57:13 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] u-boot: move CVE patch out of u-boot-common.inc
Date: Sun,  8 Mar 2026 05:56:59 -0400
Message-ID: <20260308095713.2773163-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1772963425.git.scott.murray@konsulko.com>
References: <cover.1772963425.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 09:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232638

Commit f5b980ad added CVE-2024-42040.patch to the base U-Boot
SRC_URI in u-boot-common.inc as opposed to adding it in the
u-boot recipe where all the other patch additions are. This
breaks at least one downstream BSP that reuses u-boot-common.inc
(meta-sifive), so move that patch addition to the recipe file
with all the others.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 4 +---
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 7a63420642..d366f10398 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,9 +14,7 @@ PE = "1"
 # repo during parse
 SRCREV = "d637294e264adfeb29f390dfc393106fd4d41b17"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
-           file://CVE-2024-42040.patch \
-"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index 0ff2477c39..f0ea3ef9e0 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -11,6 +11,7 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://CVE-2022-30790.patch \
                    file://CVE-2022-2347_1.patch \
                    file://CVE-2022-2347_2.patch \
+                   file://CVE-2024-42040.patch \
                    file://CVE-2024-57254.patch \
                    file://CVE-2024-57255.patch \
                    file://CVE-2024-57256.patch \
-- 
2.51.0


