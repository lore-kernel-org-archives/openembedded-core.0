Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8E2D711DD
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:46 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9326.1766114563178736715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UUPkZ48n;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso1407298b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114562; x=1766719362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RytcawXprBtdZavteg/YAT+ca6HHAFbtH0jF11YwVIs=;
        b=UUPkZ48naFKM7EucHWfmpNQsrenob54FQI2JgPcuEn8PKVWs04iEzj2+u1JQcN8Erz
         DLkf+IdgpDkIwqIEHL7fY+ra0Spk8OJXi7q9aJMIxYzp4qbcE0M0UVC9ApQG3TKLnRLD
         RtwgRpYSeUIe3oGm+RMGmYiKJZM2AK+WT7JZMv/b/KQGLo9R9bzpHrvoBbopVin003DU
         GZZKTBdlOWY0x/Y+shmmRp8M2Vq43Zs2XmlqFED0ebALTNsHPMUGZ1zUGR+krBrXVa2h
         AofpEnCKF/+VbCfAmwRurk38AJO/6eyfXJav+0bF3h7bd59NPmevx3qBYdM5E/Gsaw7K
         +khA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114562; x=1766719362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RytcawXprBtdZavteg/YAT+ca6HHAFbtH0jF11YwVIs=;
        b=urDvVVaE7Uudx35XRmVEYCktqa9ZvIqJ8w+TYtshfLlkc9/qmxOO9JUye6IWozcGRk
         oOB6g3+9fxeHuThmo5OLibFhr29vx+ymXKaAMhRzM37VQvp5PrtDcvJeFMwWeKZnVTeC
         Xw/cqyEiRidUfch3DCVbh5//jzb11uBeHHjRECy4Z16Fr11xk9bcq8gkJYFuKoIS9AxZ
         OwRR9ox4pTNCQCfiGnJjJPzGb498u6oz2Dowirc40fg20cgPLnxydj8Ul186Ogcmv57q
         nJEf1lPyHIh7ToYt5fnqQMdBm5FVYcH0Kil/GkDTMJjkYBgI3YWCR4zLE21+JvV0mfL9
         kvVQ==
X-Gm-Message-State: AOJu0YxJcofLOb2VSg4/u5JAv8uCUjb4T/K7lppELK5WjiFBpourl5ke
	SqZ2/68CNXCI1iuS3V0HNxw/euN/eiViJaIoFYpXP7a+WbWRI2zpBDvycXCi3w==
X-Gm-Gg: AY/fxX5Zs/BtuQ9wIr6vZiirhvXweR/qWEqL07Z99gT1uqRkYmT/xuObZeJwiCbYy4K
	XT5AVIDle54ly6aCQWePLCN6CaPG07sgPbT+WYyZG2rxfY4CEqn1FSsNWJ3WUcxsNTTx09rIF9x
	4/5YY7zb6Na5XnRmmXHzSWK/pu+PtVeHyR+q1tgkGxrB3I3364CbX0xj2O1STAdNCmBT4UDhhLq
	LCp/+g7ihaN3bKyWWF4Hs+28CRSiilsZXToTmeig245kd6bGMstjMWhFcYwVcvIlWZgo86VJXER
	KfUmp2o6D9p8YtloFrjlEDUxMFR8VJRa4a7mSd4gbOJYLtZj1WAlQD0IbQ6ITpt2DCPmJM8BAja
	fpZhsoFwbtKoI8hS3sbNmNzA9t0cgcBrUTrmtfadZlRV8gKfEBfxw0ZTMUt1Ige6Q7rMpYDVbXE
	HIpbCd7c+Pas7kLcJ46Iy5zpipYjwhsLuNMgU=
X-Google-Smtp-Source: AGHT+IEhXjkGoSkTYxvKpKUoX9g3quyPRmvcND8jwrtMpVFuoU9oUS3pZX0KvVaCMdig9xxlQ0i7qA==
X-Received: by 2002:a05:6a00:808c:b0:7e8:43f5:bd0e with SMTP id d2e1a72fcca58-7ff66f590c9mr1498819b3a.35.1766114562397;
        Thu, 18 Dec 2025 19:22:42 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:42 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 10/29] gstreamer1.0-plugins-base: upgrade 1.26.5 -> 1.26.7
Date: Fri, 19 Dec 2025 08:51:49 +0530
Message-ID: <20251219032209.960840-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228178

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 6719158979df0fd8eed2c1730dd0f3dc2d67baea)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ugins-base_1.26.5.bb => gstreamer1.0-plugins-base_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.5.bb => gstreamer1.0-plugins-base_1.26.7.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb
index f12d81cda9..4dfd0a207c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "f0c0e26cbedaa57732cb6a578e8cc13a1164bf18d737d55c333061c52f0c48d7"
+SRC_URI[sha256sum] = "969e3cbf05dfab92cf37e94840fbe398517d7ba3275331d1c216a2e30a7208d0"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 

