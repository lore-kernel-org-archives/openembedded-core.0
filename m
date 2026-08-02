Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13696C55180
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:28 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21343.1785666560746020120
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=URva3O6h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so11825615e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666559; x=1786271359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gYZgmlKidNtD+QNHdeB8qqdc1OhS2mW30CbeJu/h+tc=;
        b=URva3O6hu23H+Zdkr2RD0yF/otkelOACxiZiGGlWRpLYXKBGez/nuF8gpjZj+z6Q8o
         zKcHQEMYE3qZSkSDTzRrFahsAz0xyhapMKXBidS2NI7UDvHxilQh3y8vrDs/X0LhwMPm
         Crv8IDI/xNf1pxx8l+r4d6TqDVwfdjeh1C98Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666559; x=1786271359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gYZgmlKidNtD+QNHdeB8qqdc1OhS2mW30CbeJu/h+tc=;
        b=TL4OoVyNcIeVjyk603zGYV/rofIk/IEPBfE/SndHYIadJ0u58CvbV4ALaeLhO9bnfZ
         pyylPChmqluCQVdK6OiFB2SuVDJRUmQ8LlspiuHhuhj2QN2kFHObweQC8nGYBCXWZc92
         Hz7BJXwrsehKKHT+XtmHiHCB756KaEwUDuycBZKS/JRcwgTecw/3GD+lAIQ5MkOZsedl
         0y35m12TUlLSsK7+PkBuqf453Iv6Ja/+J4HDRxBvz8P3wXDwHT8lnIZDFeWEOM5DlGWe
         QyynpIVFIQOfFnSFhtyWYtFWqdOzuN1qmxGndf82Vd8GbIpCs+0H0dv8J6CvxRVEcjno
         XNWQ==
X-Gm-Message-State: AOJu0YxFM/adW4BMPMd8MZLx0fnViKXFuoHMnYHKaF2BW2r23e9bcl8Y
	jZY9gPWAsXHH+gJlm0+KtyId7ldzdVkUd1CVHmm+fPBzHlramSEdV0Yhn9k6sd5jkK5lBcTEchl
	gilWYH9g=
X-Gm-Gg: AR+sD11+n1szJK50zN6tJyFsjUHZ8kTiy7ZveymYsgBNAaH79AE91CqAhX8eq6difn3
	/xcx0OFO+6X6mUltAPpLoVEZOHF9IECXYnFv4EbSSxmREY/sPi0g+AW0wUk4Gn9ycrVAQnZTnHv
	92IT2vLkoKOH4hJWwJFdGYYhr2+Y0rQB74McxFyZg+ZVyT8OK8uuWF1WjV7VcDcI7n0ag4e1Kxo
	mEV4JiaOhIPLD6Fatp6+pXsLsvIhosA6AonaNkhja2UZCGP0JiDtk+8jNCamlCjLC7JWytiMxj/
	KONrc8nlBdX7/PoceXNjeUS9Hl7ogpP1UFYPjO+soR6k5Yi2gc8vNlPkKF2XXP6zbNzXsCKAun7
	+x3ZEQNfcK+JEC7LcJvztLnygEKMt+it0OO/lk9LixRSSRWtRlpoy9+/nmlaDPbBg9D+hvd3fXt
	QxbkC30Xn5FU3guyd5OqbCkXQYnY7nyAlV2VSHEY1yuN2UIF4hhzxFqFklxdwmXwUpa2SB72zea
	wwaU8vjO8dhavIZHQ==
X-Received: by 2002:a05:600c:524a:b0:498:28b:1025 with SMTP id 5b1f17b1804b1-4980c66c838mr110717735e9.5.1785666559077;
        Sun, 02 Aug 2026 03:29:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/25] linux-yocto-fitimage: Drop obsolete dependency on linux-kernel-base
Date: Sun,  2 Aug 2026 11:28:47 +0100
Message-ID: <20260802102854.3952760-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242543

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/linux-yocto-fitimage.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-fitimage.bb b/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
index 1f95b9064e4..7d02b44c18c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
@@ -6,7 +6,7 @@ SECTION = "kernel"
 LICENSE = "GPL-2.0-only WITH Linux-syscall-note"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-with-Linux-syscall-note;md5=0bad96c422c41c3a94009dcfe1bff992"
 
-inherit linux-kernel-base kernel-fit-image
+inherit kernel-fit-image
 
 UBOOT_ARCH = "${@oe.kernel.map_uboot_arch(d)}"
 

