Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309D3CD342E
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:42 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9495.1777739436688165024
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IzOBAsNy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so1498376f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739435; x=1778344235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9lEB6CN0ADX9bNqB0c7jFYWLqIMzcGrIVDWddfZpYg=;
        b=IzOBAsNyvOYIaz09drtOFPtzMOjab2tZzRZawqDz0h5SSM8Bm7oP7wisa2aolqkkLm
         hgGAtcvHaDP1UaKSKYUADPtEYk7PY1y7Y96M424G80SF0fNbvOEjFIr88J43CXrqlX2F
         1072GZEgdRgxCJVaCNnQRWmXVNs8azG9JI3Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739435; x=1778344235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G9lEB6CN0ADX9bNqB0c7jFYWLqIMzcGrIVDWddfZpYg=;
        b=i9EKRY9sM6xBL4e8O6ikCPkU/B8PE7rJD7xAJ/Zsd+U69hIzrNnXyWlK1ShMAYwv8a
         n/1eLALrmPl1MQ/x7TGxYkwejyFyDjtIrWYOp+rFLBewG8AVAyxU9zTMB+E4XM/dMPKC
         nr1xpNHwZS0CPBuwaVOFfHPBPEf0pA271ysC+nCLNs+cjdcDEiAW16FX6uRQlZ3ij2A8
         L2jV7Y2OaHcwa1sgqIVBtXacivzq3jCb39MWEvyywFHAMedviCCu9t28pVdVG9ZEAZmu
         znbpmkT4WlwB6LXGi4cM1d6xBphszKYqysUrEYEQxWUsaS0dZccoPbk8DrAWz7pu+ulT
         3YOA==
X-Gm-Message-State: AOJu0Yzba/KkZTbvaVux6ihpEVnyoL/FpcvvEa2zVeizFrK4tXIL3aOr
	zaB6VduT0C6agCI2jNjEOnRMSuIt3MixOExOhg7+RzujiV5EyUm+XDqe/D7AVRc9IT+yOac81e0
	D/dzVfq8EOTLKkWVR3waKTmoXGZ23XFcTCNWfAcyqUMXF2S3LSZQ2u7GLVWE+AHSp7VywdgdVMI
	ya3mpBwhOuE0u/PLI=
X-Gm-Gg: AeBDietFxN7s+4dKSrP+8iF8Cctx+RiGzV4GvYrlxAyh7CljGirfV1iViJ7F0UHAxHX
	h0lMS7Oup99odR/tqMVwPr1W8upof+IbUR+Za8qUIFk5GOSPFdWZ8YvGjS9byy+UUWd8v5ZX4RX
	gEJ+qaIQsEl8nHwESYjxGhy5OXuPpMLG2etjiEgl+utFzU1LCDzSaVgsb/QUWFrDLPn+wrS2FTA
	teo/2kdKVN6HUKiQe0vcm1XqWRdTi9l+y+oq2c4XjEswhlqwPavzY+WKqQhLzL2od3M77sHARN2
	KfWIFI41hXgG5A4upj3qvpwSn6FXCIXraryVS0KoIjikpHhaeq6PrAGI6NMAwDh164YOOFVyEsY
	Fl+Uh3n9e8/2zHDhsDWc2NhiGBciICQxWkJ18FEARxU/pGGLPVWkmu4n2OVsV4WfogAQcOFDYn1
	kmTBAn9Qh16ws4+u963fRebP2F3duPB65OYIYjoQrK78izNyzwmAPjGUvmUjV3NhA=
X-Received: by 2002:a5d:5f44:0:b0:43d:70de:1c68 with SMTP id ffacd0b85a97d-44bb5963dfcmr5605602f8f.30.1777739434608;
        Sat, 02 May 2026 09:30:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 32/62] python3-build: upgrade 1.4.3 -> 1.5.0
Date: Sat,  2 May 2026 17:28:52 +0100
Message-ID: <20260502162929.1377831-32-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236341

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-build_1.4.3.bb => python3-build_1.5.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.4.3.bb => python3-build_1.5.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-build_1.4.3.bb b/meta/recipes-devtools/python/python3-build_1.5.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-build_1.4.3.bb
rename to meta/recipes-devtools/python/python3-build_1.5.0.bb
index 1e7794fe3f5..e263e29383b 100644
--- a/meta/recipes-devtools/python/python3-build_1.4.3.bb
+++ b/meta/recipes-devtools/python/python3-build_1.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "5aa4231ae0e807efdf1fd0623e07366eca2ab215921345a2e38acdd5d0fa0a74"
+SRC_URI[sha256sum] = "302c22c3ba2a0fd5f3911918651341ebb3896176cbdec15bd421f80b1afc7647"
 
 inherit pypi python_flit_core
 

