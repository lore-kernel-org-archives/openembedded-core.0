Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8091C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:20:31 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.26829.1643278831248781018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DcpHyeGy;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id s18so3796669wrv.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8teWUIf4JQLu8iocsaM7fUrB7yf4VsSflpFAZOR/Z2I=;
        b=DcpHyeGy6HYI35bcdHsaViCfUlFBOdlLa6ZAnN9RFPbYdDzyIendpjn2qs8qEGMGVx
         8pvN6+m5Hz/IwbGm0tt0ciQX2wNHJu1KdiQ51N1ccnKVWfsj4pKe+Ek+rtK2TGZOeWF/
         M834xnBdlJZotxq29gr9Ej3i8Fg/7uk6GrVqv+fIsflVf3QfzyU/aa7zHidMYOVtu8GE
         PrSa8CDuHobwmTpw+r3qOSP6BgcTyqlCfuc7zavNvCjNeHf3nYoWaapiNQuQF/eeaGe0
         ldlzek30R4zgkaHgxbFER0zlu9eefCq6hfZ4/tmWJruNH1RMhaNlocTv/yAQGcuGMdNX
         DY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8teWUIf4JQLu8iocsaM7fUrB7yf4VsSflpFAZOR/Z2I=;
        b=OOdfHO//H0f8/sqBjX+mrAL1k2aSn87yw2lPUodin5j9BhlP7YHD5HXVtkWuP+Lu4r
         SVKjLwFv8mdW/lWUuM1ZB2zkZAVpVWI4JNDNfS1A2TDJcOeo96L4BzS6bny1ztHM3PUJ
         urd/YXbvekdR5itHi4YjSLI6u1BPisOz6IATJ9YmfPRJbKO8YRipXdmg5JCmKhc0x9Yc
         AiC2tVDiDyaqKg4cp3QzhwNTKm5CtBbqjMpOoRydwh5YfRFK84SLhD6XYIoypuw+yIU7
         qhJyys/CoFjIcoSlHIJUvxTzHN+mhOt3GdnszYNWv91D19zRJHiw9JMQnvWS83m0v9k6
         HKQg==
X-Gm-Message-State: AOAM530KNoZ7hNSVdYtWKzNJTNU4rxtYR1Whm/B8GacbGeY5mDWUPaEz
	ErE74l4CjVegToJjVJEpzVhFq3bvs2k=
X-Google-Smtp-Source: 
 ABdhPJxyLHJ4aYDXak+w6+nz/SrkoPMEMfhhC4IrnzX+DoHP+Ey3r03bMoj0QgjfcCdYE2tyBaAcUw==
X-Received: by 2002:a5d:4344:: with SMTP id u4mr2430948wrr.341.1643278829731;
        Thu, 27 Jan 2022 02:20:29 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t14sm4060849wmq.43.2022.01.27.02.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:20:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/17] diffoscope: upgrade 200 -> 201
Date: Thu, 27 Jan 2022 11:19:55 +0100
Message-Id: <20220127102005.3050843-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127102005.3050843-1-alex@linutronix.de>
References: <20220127102005.3050843-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:20:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161029

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_200.bb => diffoscope_201.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_200.bb => diffoscope_201.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_200.bb b/meta/recipes-support/diffoscope/diffoscope_201.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_200.bb
rename to meta/recipes-support/diffoscope/diffoscope_201.bb
index 4239b34d9d..b3c25e1bda 100644
--- a/meta/recipes-support/diffoscope/diffoscope_200.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_201.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2fadac87b41cd5238fad7a624bab47ff5cd4c1f70c523e4e9cf6706c9d1a5e53"
+SRC_URI[sha256sum] = "07bd0b2972e7c4926db7f65bcf23fd106ad42169dbdaef3dc63278af82c5e38f"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.20.1


