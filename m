Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0A5E77188
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:46:26 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.18206.1735998386558082491
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:46:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3HWErk3l;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso14846645a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998386; x=1736603186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5EKEattWN6HQGgftKlxWGL6QsDfPaPiHjNZ40M34yg=;
        b=3HWErk3lkMEijdw87+qxv+Gqx8+gUfANDJVmeMUHsehyJV2RXYtv2XzznmJjKsLwcf
         VeYAGZ2S2gwKl4hwBLUJIqWj8Vh7q1Qtvw8cBCbydhkrybB7faXqxk5yd6wXAKjkUINH
         r5FIPSYFIoOGmDqwFU/BjAGhqgrUvqdqBnNSih+gtkxbzfNuQG8RvIzzKUulYYxg1ihj
         bsyyPvLA5kNXzUneOr0JI2NZ2WgqGqPVGL7vZOvLprIax2GdrqwWa9mMd7PaskRGImKp
         L2QhpZ3Gf68KSPzZ8aHODu6UKOZHvMoMVVm/8Hl2XTceBsSVLtB+zrQtrokFwMyXbiVT
         Crdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998386; x=1736603186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5EKEattWN6HQGgftKlxWGL6QsDfPaPiHjNZ40M34yg=;
        b=cA/YowAs2B/OuSnbUIoKmgicIRMF+X76SzjJyAMBOT0x24JSP7P2qV0/R3lAZbGxMR
         3D/Tao6SFznip/czshIqE5e83+tPeG4KH8TcjdGKUVe6XHa0l3gg5+MdoGAPmEwZYVl/
         +PVFY9xEW9wR67kB5rzocIVTIX4Knx3N6Ny2Ilk9MScD18TOzX9/DwKGjdnRM4sEyXW1
         89uRpIfx8FX7VImESdGbe8yK5kid1MQgebmOxEO5j8yXJtPKpk+vY2V+s/7HiZrTUYH0
         y9HNumHK6tEul1bsnks/FGSf8aVFL2zJQit/Eko6OAt2hq3GdFAgvwek3h66ntxcVPFi
         sc5A==
X-Gm-Message-State: AOJu0YyIfUmSMINusPHUdCH5r4sb90YBM1WQC2VPpv2bKwlXQ8Ou/WHT
	puxP5G2vclAAuXiLjDryXkBnxu3sMiI7kTa6psr6UkqQb8WAlDgGl7Li/uihNXqe8Ab5rYAWfo+
	e
X-Gm-Gg: ASbGncuH+16tae1pwnhR5430as/7w3Q9khFfzczZ+UmMdw6z5ogeZC2Z3PUpoXDQ2Ux
	wBC5lB8aif+3GoJu6k/UsXc0fyoOygSsQNzbaNwnuHqCgsE1FLR3Ygk1H9m1ye1wtAYXlkEYMZ6
	EehXDkgOCnw5wEXlzHPdTSl6XVIqHBlHCd9o8HSOhwXLRztNUyFpV6PoTKWS3lVxVMBAeku0rlv
	rPvhxX8CqcIHMUEBSIKdhq0miaiBx74kQD8RwM8E16mhw==
X-Google-Smtp-Source: AGHT+IGlXRniDs2yIwa5RzAsW9kTcluJfInK2EpMUmcW7eQfEJxVeEzNVqUUM3+8iJ+M2vpe8TGA2g==
X-Received: by 2002:a17:90a:da88:b0:2f4:49d8:e718 with SMTP id 98e67ed59e1d1-2f452e214cemr80235960a91.9.1735998385871;
        Sat, 04 Jan 2025 05:46:25 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447882b09sm33498230a91.41.2025.01.04.05.46.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:46:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 08/10] buildtools-docs-tarball: Add rsvg so we can handle svg files in docs
Date: Sat,  4 Jan 2025 05:46:00 -0800
Message-ID: <6de3ca794d136f6a622e173d72c43da2553db7af.1735998221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735998221.git.steve@sakoman.com>
References: <cover.1735998221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209403

From: Antonin Godard <antonin.godard@bootlin.com>

We need to convert svg into png in the docs build so add rsvg tools
to handle this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-docs-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-docs-tarball.bb b/meta/recipes-core/meta/buildtools-docs-tarball.bb
index 72648e3b1c..b9ef68eb6d 100644
--- a/meta/recipes-core/meta/buildtools-docs-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-docs-tarball.bb
@@ -9,6 +9,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-python3-sphinx \
     nativesdk-python3-sphinx-rtd-theme \
     nativesdk-python3-pyyaml \
+    nativesdk-rsvg \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-docs-nativesdk-standalone-${DISTRO_VERSION}"
-- 
2.43.0


