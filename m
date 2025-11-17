Return-Path: <andreas.stergiopoulos@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC38CEBF92
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 16:00:04 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12982.1763395196431914744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 07:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hrEJs0CR;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: andreas.stergiopoulos@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so15824075e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 07:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763395195; x=1763999995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plB1TprOU2XhKYxz+gpLLYs/+lq4gMA7OO2Ail1qdQg=;
        b=hrEJs0CRthdPqTq3I3cACn4ceHm0845LZVOWF7vwkkr8/jDjUwKyk0KDsa4XI2fEb1
         Jjry67L1tmWDKF57MdER1qrXDk9ueyzvMEVD6TI+gTjcK7oC9Kf5gOz68NZJjcz7H2c+
         jFQYAwsX/uLT1UVZTDEyZDrZ/aevtkyoSyoWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763395195; x=1763999995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=plB1TprOU2XhKYxz+gpLLYs/+lq4gMA7OO2Ail1qdQg=;
        b=i+96yKHgy7Jq7/n2Iar8YAXr74O6AGo0mY5ZPITNJkeXpTdjxnq0Hz4hcaDhmBVOy4
         okdXG+vJbm41+M/z0TfmOeEq0gFBCdKNNfXXUODvhgF7zool4VaY4GMpy01LFBBo3eBU
         stdZgeERJqOKOrtQNwEubK9+/53Vq7K3a0IJY9NTKbGIW9q78ZpV3EmZ7Y0Qbjv2dwlj
         u11bHO0bxrK2BAclb2EsABmdLwBwCzXELpPOgsX53yDVnBR8cf4k5y6wt9VPJkKFtkdG
         OblwrKvAVUJjj5LgSvqXqkynwfqaY8GVGzqm5rf3T2C4IChOFB4OKdHbSq9ofDNCC9gX
         LCzg==
X-Gm-Message-State: AOJu0Yy6vQtGns/11slrtD/GKdQZaS+6sTMMxpy/nZOQi5S4J7QAqmRb
	ooy11G69xA8DHudxcUbKEhMI344RhLygSuTar+h0qWsaBo24v+/NrQo35cZScBehADuZ4woWswW
	Zfbd8
X-Gm-Gg: ASbGnctRR4huxl5RpRH66jZkUm/+YtaIZE0R1hOEHhgHO0sbAGVHcZJa9Lpt/3m4y/v
	iVMnk3IoHz6aUFRVt3hsre5/5vVeHdXAHcvipD4uzWzOuAZXOc1XdXy7dSQ8+K84odps7tG+nWL
	aIC8fqwp70vVfmv4/x5ClgKCoDvwcJp1MinhbtEIZqhssFvFJNCIZUYCpHapNxqr/V+00EDHJds
	fm+kU1/Tc7q0lY79tIUCjiwcG/n9M/RmvLx/UShCY3zvof938UBnCDfU6ab1owfJ0rlEuNvFwmm
	Vno/3SNktY6dy+V2vimM57WfNDnBQs0e24yzp3t/Cy9aLgLoBT+F7sSd9+s2eNZnw98W1mpM4BJ
	pbccUNOu0Fhc6bQxc3Ak5yoZEHR8/nOH0dytb4VdJqrAaDfcss1oV+xUdcPXgRTKcPOomr9b7Y2
	D7yB55jV8aIqx1HwCJMUpqKbnWeKqG282J02TDJZ7QwKEg99HhJghBfJntqJDtGhUGRUekTGFWx
	hc94rnVs5g6L9VMX0XLa3jaKdDQacI=
X-Google-Smtp-Source: AGHT+IG6trLuMi+f86tWVbTFuV3lg7t7TJ1vM/qDSht+8GijxxZnSkiGl0eQrv2uQ6wWSQmjSjbpgA==
X-Received: by 2002:a05:600c:4505:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-4778feb255emr141253965e9.31.1763395194657;
        Mon, 17 Nov 2025 07:59:54 -0800 (PST)
Received: from FRSMI25-PILS.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787daab3fsm340609225e9.0.2025.11.17.07.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 07:59:54 -0800 (PST)
From: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
Subject: [PATCH v2 2/3] cargo.bbclass: Collect installation paths of executable binaries
Date: Mon, 17 Nov 2025 16:59:26 +0100
Message-ID: <20251117155927.427462-3-andreas.stergiopoulos@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117155927.427462-1-andreas.stergiopoulos@smile.fr>
References: <20251117155927.427462-1-andreas.stergiopoulos@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 16:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226498

All the binary executables that are installed in the image are collected along with
their paths and then added to the cargo_bin_exe_paths file. This file is then used
for the CARGO_BIN_EXE_<name> environment variables, used by the integration tests.

Signed-off-by: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
---
No changes in v2.
---
 meta/classes-recipe/cargo.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 2dd28e95d3..167040cb81 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -58,6 +58,7 @@ cargo_do_compile () {
 
 cargo_do_install () {
 	local have_installed=false
+	binary_exe_path_list="${B}/binary_exe_path_list"
 	for tgt in "${B}/target/${CARGO_TARGET_SUBDIR}/"*; do
 		case $tgt in
 		*.so|*.rlib)
@@ -83,6 +84,8 @@ cargo_do_install () {
 				install -d "${D}${bindir}"
 				install -m755 "$tgt" "${D}${bindir}"
 				have_installed=true
+				# Append the install path of the executable to the bin_exe list
+				echo "${bindir}/$(basename ${tgt})" >> ${binary_exe_path_list}
 			fi
 			;;
 		esac

