Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC82DC369A5
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:30:04 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.1444.1743784201614315947
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 09:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vxGH+t6I;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so2671366e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784200; x=1744389000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ALVr6r/uvKn6zuQDHQgIRccVCwpoa+Tg3F1piZ4GOo=;
        b=vxGH+t6IIuSQwnwjAEZL2ojhVXY1/2oSPncJkgWLTLLoNdkvCfTYEtd2WgqKEWqD6O
         SB6Lc9+48zGB0LmXwRkmG8HeANgP+riXpqbAsVbPd94KG0Gh6q/vznsib4N16QOFwmUo
         /PH8IzFbabU22tLXblgwYPohQrO4svosKuIt+yyax5y0PV8TVc9UdwtJoeMtDBSrU37z
         zkQ5JYDCRYreuKeVbRJ8jbeGhVrrZFARU2XKORhyXtzyb2MU1BlTSsG9lSZSXUSIhi8r
         rxmZvFR83iC3V4J5ykROJFlizgpYJ/r8GRXQNR+bqia9MixM54JGpszm9jHfIwJQO1kH
         yB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784200; x=1744389000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ALVr6r/uvKn6zuQDHQgIRccVCwpoa+Tg3F1piZ4GOo=;
        b=oqT7yzRHWihfU4hP+658w0IYl6JTdXwL69TBEEpwaSUY1hrft8WXcDxG42Vxz6yiq9
         a6rLTWV1sNAqJ19s19HVUW1CRkR1QRHmBa5bDNENaFdWf4AQov6R3/DBs/uByEvXvRsK
         MAk8Wau9t9U6vQlkQ0YMR+hAsz2r8wHcbJf/Cq5pkdS6oEVwj6haGDvq2g+NIQgu+mOh
         PJjHRbHB8KwxOCU5P5rLyQke1K3oFyLzutN4yRKCEEFELt+SvA43GapvAQo9u5iKJrgU
         Mx/ZREOSHL3Wme/FrHCXM9XhgBow9P8OvnQ+eM9YG3KPyak5s/7HRBpGldc4M7Kcw2jd
         IiaQ==
X-Gm-Message-State: AOJu0YwHtblc6unOIk6vq4Mnlb2Uguc9jsZYB0SKwSh+SGNkRhKP3BRZ
	HVeARso+QdPian2qsYrW+NTMh96uiWBkVbc6r3qHpgKcb8SOjgIMDSmDKcLkkhrGZvqcbjK11RD
	f1OQ=
X-Gm-Gg: ASbGncsT4D2KAbfqjNwS8yNyDBO9uq+AE7H3xbpb712V2kR3IKHLDUmcEKHOU7NOQFl
	RefvqNo/ipplEKiN+VkcLZh+l3XuQLh0wfAqlT8WF89iz0lUZZXD2iB+zvYCSmET5ma4KctSV3W
	7dxn4oroObQaFW1M1Tq7Z9yU2MmN9rXvofgnK04WraBthl8yjwtBr0Ybt/XZeBtfORPcWtxsPP5
	ggQeb7bwY42b0DGy+uV1u6df9gdoBrSoi6CQbpn+qqNaXJkPq0/Xj1CgCyfoUFWi3KjhBgmr3hh
	IFsoBVI3tZAOYk5pSipOhhjFPdBiNrmleMX4Mtd7jnZvufzInP6PYL9pilvkgkTCkqza8K4uzGf
	U56j1GA/OWJM+S6gkSb0WiQ==
X-Google-Smtp-Source: AGHT+IEIxqzm51A2GJMbf94Qz9yL69yRdwPQeHnqeBvrl3lGT8SSPJlHAictwrIySKrW+DL1t9L1DQ==
X-Received: by 2002:a05:6512:398c:b0:545:3031:40aa with SMTP id 2adb3069b0e04-54c232c410cmr1000686e87.9.1743784199727;
        Fri, 04 Apr 2025 09:29:59 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671f54sm469786e87.228.2025.04.04.09.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:29:59 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 09/11] image_types_wic.bbclass: capture verbose wic output by default
Date: Fri,  4 Apr 2025 19:29:30 +0300
Message-ID: <20250404162932.447699-10-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404162932.447699-1-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 16:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214360

Call wic with --debug to capture logs from wic internals
so that it's clear which partitions get created and which
files get copied where. wic plugins contain for example
race conditions which don't install files at all and thus
images fail to boot and it's not possible to debug these without
something in wic task logs.

For example core-image-initramfs-boot do_image_wic
log is now 576 lines which is not excessive but very
important when debugging problems, especially race
conditions which are only hit in some builds in CI.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 1b422b6280..10888bc12b 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -72,7 +72,7 @@ IMAGE_CMD:wic () {
 	if [ -z "$wks" ]; then
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
-	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
+	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create --debug "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
 
 	# look to see if the user specifies a custom imager
 	IMAGER=direct
-- 
2.43.0


