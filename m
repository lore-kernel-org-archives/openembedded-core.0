Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAC6C61D97
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:36 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.34101.1674440550055669645
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lbIW6l3+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so13160801pjq.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BWH2EbzAVaiQ/bxLSMc7AVhIkcI52msEW/eUHPHq68=;
        b=lbIW6l3+vIauXekfMq4CMS4ubxCcWUDTiFKs+LOxH3kgxmhNeiSmDn9YZEfSbTgUps
         6clIzdRdxWWfNWFCFkAqmLepyYTFmxMmX8h33gdNqg3FpTXrMj564HapVuNMCcUsXlfe
         VfWdAuhlrxY8VrvoQH7c21Y4RPGHJkl5K66Rje3tc5mn7simK8bvn8nUmeaMVpNK2LGA
         DA8/SdJDztbyb0v1gDp5vbklTHT+J9a6tL5zoL3vpZPe88/SI+lzp7kGprHB3nE9YlDj
         5u0v+2FAsVYH9asUkkar5Tk+7wUZidCsOlVzoW9/dY+l30u20FkGwHg32uc36hUzE8rG
         iVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BWH2EbzAVaiQ/bxLSMc7AVhIkcI52msEW/eUHPHq68=;
        b=Z5vvVPtlx4j2Z2E+IZS32T23DIXIdKv5wgcw988k7sIfAhSskxwZ6L2UlWhZI8CDa4
         fFceDRTtWlH6/okcrCn+eklPKxpz4bTjAv3mPo3zZvQQreuHfWziCHcBdipo8z3pvS3h
         LZCmwXfGXSWDTvMpQ7UooLcpFZASBtZvBFs2UNLbwxmE72/sE36PCwu+ZehL8zPCtvZy
         sW8/Na7ZlBAH3D+tM80Zu6Fcca8TFFlzZZLjiDb1N0ceNiPLwozsHvBD+VbXby5W6Wxy
         LmJXIHdqxy4ymULiP3uv2HyAsyvGQPxJgukZZvKwHrLI51IZ648zqJw9zJv9Am7QRTuW
         d7Ng==
X-Gm-Message-State: AFqh2koX4f997q3yetNPP4lukPkMA5+nnOmwxXH1fSGf4lmCbALlq6/x
	C70IXEvLB5F8el3SJtRimkalI1ZMDF5be89E17c=
X-Google-Smtp-Source: AMrXdXspAFFv4asT5NXjaGBPykRGo37zHUEL3xh30CgBUq+NQWjdZT9nheqA9IY1LKvnw9sDLJtfbA==
X-Received: by 2002:a05:6a20:4392:b0:9d:efbf:48d7 with SMTP id i18-20020a056a20439200b0009defbf48d7mr27116345pzl.27.1674440549000;
        Sun, 22 Jan 2023 18:22:29 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/32] kernel-fitimage: Adjust order of dtb/dtbo files
Date: Sun, 22 Jan 2023 16:21:17 -1000
Message-Id: <ca91d226e3e1671872bea9de55510545598acf91.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176287

From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>

The dtb files must be before the dtbo files, otherwise the overlays may
not be applied correctly.

From Bruce Ashfield:

  We can split between dtbs and dtbos, they just need to be sorted
  for reproducibility reasons.

  Of course, this was only working by luck previously (before the
  sort), since it has always been gathering dtbs and dtbo's with
  find, depending on filesystem ordering for the order in the
  fitimage).

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 3df94d3c93707f03c501f8aa56450457d0f7fb71)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-fitimage.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 983392c23a..3cd4a45bbe 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -540,10 +540,11 @@ fitimage_assemble() {
 
 	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
 		dtbcount=1
-		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
+		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf '%P\n' | sort) \
+		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' | sort); do
 			DTB=$(echo "$DTB" | tr '/' '_')
 
-			# Skip DTB if we've picked it up previously
+			# Skip DTB/DTBO if we've picked it up previously
 			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
 
 			DTBS="$DTBS $DTB"
-- 
2.25.1


