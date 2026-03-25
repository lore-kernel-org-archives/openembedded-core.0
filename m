Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05433103A9A6
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 10:49:19 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19629.1774435753762838472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 03:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qU2hoPvj;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a299cba953so1570488e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 03:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774435752; x=1775040552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nuaWltDDqWnAHc/BgCIZVPeCKAHjsRgQu2neTqlGl58=;
        b=qU2hoPvj7wdoPfvE0L8aImxRUdqVcLxslqGAaqFe32BGcD3Mw/nIMn7DUPFGhQDxmj
         N3dbWG5tkrgs7v3p5Y0O/1wwPLaQHmAD4vGgMBcl7zaEJgUotgDtK9JRnNYPV8lrggbv
         4JRhNGygm710bdW52UuXmtErMlBqc2zYuxj1cclQ6NVi8lkHh1KJBdweHnkk5YmJiTIB
         YqL4WZEtvxN+RxZokf9ga1hxcnGUMRDh/HxSZeIUcMxzwE/mexq/4O48CgO2Y9f8mnkm
         6Ie41JvpdELQ1DUtNbat9xtim2bGympmErCDMVNuD8+Qu80h29DKDbz5IIgx3P4xyK0v
         fYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435752; x=1775040552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuaWltDDqWnAHc/BgCIZVPeCKAHjsRgQu2neTqlGl58=;
        b=C7RKnDz4C8bYn+JvcupIBPCpJsFvprY1Z2m255Dp3qVTjOvDGFm+RHvfYklRBfrCKm
         miX0DtRFZymBeE0NN6l0z8D4eONOnS+39MqIiUgEf2qxZFKmS4bpSNgje9lKgfxA/F5m
         FnFcIjRrXaBNhSvzEVPiYi4ubKAhc6qaT2SnwJsIx+YcQJ9jlKgF9SJw2JDqD9jUW58Q
         Twb8IJYiq5UtK8r5girwQvaMaokcQ7Hlj/BV49KyUHyFZ2UK1NkTlUBNiopM7ZMMPDHH
         +HJjZ8IxT2PT99EbQcEaKtyqobnb0lWryWs2+eOR5JpIxrWXWRW3wp+LLXdVToh9uAAI
         6Acg==
X-Gm-Message-State: AOJu0YwDgRPfnv9cjFldZ8rGINXwPQ+wXbM6zWsbkPe1i5x9RzJjSpL8
	rqnhlQaqb4g+jmyvOY5AkYecRe2Vot+t11y5fcnmAZ6tsdmM1UMxdMUoWALm9rp/4JN9uHjwKJm
	Be6Zy
X-Gm-Gg: ATEYQzwXYFQjY498/pvyCoT3DGxoapG648dgbvk7uWvTFFVy6rwttCm50DoA4LV0pgM
	XovFj666fPFxDbBBDjLpZE1gGsizDoK63jTyILwUIE6nCAEIFgkhR5p1GtAsizq8mXZoh+jQogl
	U28o5CT0NFOxWjh83KWRoe+q/3DvJFg7U1P2PPv+WwxyIHdk1a0Yr3ShpuUsdXlLH5Ns7k3qOpn
	kuYAd7ozyI563m+CFKYF5r2wN2pqRbVqXjcR3juZFfKG63f02Dd8ZHRFiUiWTdLksYkiAMjiVge
	xcElf2AebySvJ9P1XAmemR15c1Rwih3pzEJDnGnSPEVOQ53KJwejnSZ/4fGCmF3N+271mO7ch49
	cFVOCodLyEcGGUAaA2Q8WjUTlLAxZyMS0JcmfUvSxoKozK7/qDzF/3tVHn3YYJVjVTtJy+yGwPi
	xcSs/DYf5vj9rzEIOgPt2uaJWFk05H4MrSgHbO7OsuAJMsR6CuPtqB9Bc9
X-Received: by 2002:a05:6512:1153:b0:5a1:d0d:1ba9 with SMTP id 2adb3069b0e04-5a29b9767b2mr1195082e87.7.1774435751742;
        Wed, 25 Mar 2026 03:49:11 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a296d7c953sm1050454e87.65.2026.03.25.03.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:49:11 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] uki.bbclass: fix UKI_DEVICETREE
Date: Wed, 25 Mar 2026 12:48:30 +0200
Message-ID: <20260325104830.23519-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 10:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233870

UKI_DEVICETREE needs to be empty when KERNEL_DEVICETREE
is not set. Fixes genericarm64 uki image builds:

ERROR: ERROR: cannot find /home/builder/src/core/build/tmp/deploy/images/genericarm64/${KERNEL_DEVICETREE}.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/uki.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index 326697a06660..a6a88240f798 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -80,7 +80,7 @@ UKI_CONFIG_FILE ?= "${UNPACKDIR}/uki.conf"
 UKI_FILENAME ?= "uki.efi"
 UKI_KERNEL_FILENAME ?= "${KERNEL_IMAGETYPE}"
 UKI_CMDLINE ?= "rootwait root=LABEL=root"
-UKI_DEVICETREE ?= "${KERNEL_DEVICETREE}"
+UKI_DEVICETREE ?= "${@ d.getVar('KERNEL_DEVICETREE') or ''}"
 # secure boot keys and cert, needs sbsign-tools-native (meta-secure-core)
 #UKI_SB_KEY ?= ""
 #UKI_SB_CERT ?= ""
-- 
2.34.1


