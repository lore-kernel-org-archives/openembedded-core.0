Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE9EE7D0DB
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:41 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.15994.1695367477128493187
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SD2i5v+l;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53339349956so1892511a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367475; x=1695972275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99EhGoLIAcRFT7VGllQ4nM1o7CdT9XrxObzA7lySwSI=;
        b=SD2i5v+lqmTC9ipCgaMBKgIG0Hyt2aYbp/090Etr98VBocX7yNYUkEJho6PNgFq09i
         KRWnHeLNJ2vW9sd4LaLpbJUgEjLWri2AFrGoYAFiyL5eNy3bN8DyIN3QkrLU+taKoesi
         /JoQm8Q8WlfRbtvFDsfu4XpGZ7q8rPNSkqVXtMZ4j/6iePwAewrmfUztbRp5pDZAHhuU
         gsfC6ZrtrC4LK4slg5RYTdC4TPATT0q7J6HdFcEIszPCOONs9SF7h5omgjZNN9PPUHDQ
         R0Dk3BeWN3NZSOV8GJw/MpGyjdJE/qNSas7XRJoOz2j3rXDlfKiZdedpgVJzmh8bJ76w
         M0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367475; x=1695972275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99EhGoLIAcRFT7VGllQ4nM1o7CdT9XrxObzA7lySwSI=;
        b=hz5z/dFjMd+a5EXVh5nnxb4Rhgei+Ycswsx/VRYtOTN7ITSyVPPxT/UVaJ8+DFMRNb
         R+SeQfDHbVpUUYL2RXXbJRwgZsqst4FMCXmHIUPSPuCaBR83B3utzdOo4mULwJnNrxHG
         Q5x2yonu1olu0MCOxi46+83ODw4QzWpShjMzfTbwBu52v2jn1oSp/IolBWTnxpdfdPVX
         lb5IvR4tJqPIzd0XPzQEXb0lPouupT7u22kz1nDT/FJNEknVfrZu/Gmyp2p5tOZzqOfZ
         txNYmuoGY++o8yhkmE+DjopcC3c0dv13MZ75vN1QmaAmWfydN9Q6TEeJWnxabOwjQsKR
         ZauA==
X-Gm-Message-State: AOJu0YxMnS/Gj7kcl0VgT5Bw8S0WX0NCBDRGcK2uLgtAadxkk8lTawjK
	xG9hP1z/z16SCFsnV+hPh/VOyLcS1gQ=
X-Google-Smtp-Source: AGHT+IHDtctF7nDH3HwYF6zRFcnSmaLulP4d2WUJXos5zPyDxll1BAyDvtOjGmXtK3WGaZ9fxfWYYg==
X-Received: by 2002:a17:906:8474:b0:9ae:690d:4282 with SMTP id hx20-20020a170906847400b009ae690d4282mr3133799ejc.18.1695367475378;
        Fri, 22 Sep 2023 00:24:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/40] util-linux: upgrade 2.39.1 -> 2.39.2
Date: Fri, 22 Sep 2023 09:23:53 +0200
Message-Id: <20230922072431.1481743-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188046

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...til-linux-libuuid_2.39.1.bb => util-linux-libuuid_2.39.2.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
 .../util-linux/{util-linux_2.39.1.bb => util-linux_2.39.2.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.39.1.bb => util-linux-libuuid_2.39.2.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.39.1.bb => util-linux_2.39.2.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 57f366f6c08..952a680a849 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -38,4 +38,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch \
            "
 
-SRC_URI[sha256sum] = "890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b"
+SRC_URI[sha256sum] = "87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f"
diff --git a/meta/recipes-core/util-linux/util-linux_2.39.1.bb b/meta/recipes-core/util-linux/util-linux_2.39.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.39.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.39.2.bb
-- 
2.30.2


