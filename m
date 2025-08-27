Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6164CA0FF7
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:49 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.6649.1756330244626555259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x4Du/H4c;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24456ce0b96so4000855ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330244; x=1756935044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7FiU9WkD+teXxbd7RIY7i0njOm5lkEpu8lFq3a+NFo=;
        b=x4Du/H4c/NAwptkOaTQe3ACjAhgmqbkCQos1nupbAJjld/0euR8J0r68YO9quI+H7Q
         ntuD+Xo4NuN1PbmGUOJPfTfElVQJ7ysr7HnJhqy47qr2QVHS791R5zVoflnLZF2BEzq2
         i3iyksQq+eUOipgd2sPGZitwIAyNT6FeQTyJZoiByY6rGY9TmSueyIyHQt3W/ttMH0CA
         8z/3S2XcBK/PDG3+2aUNfCNvftgdWJqgF4WcvSRpAF1sfCWc+T9J9tbCQLkqcaP50ttJ
         a27TQWUfY7j4LEMo+68K773KVIuYv4nUL8gfr9BTokWH7hykD3vxcXc0+G0ESvxwpZK+
         STpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330244; x=1756935044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7FiU9WkD+teXxbd7RIY7i0njOm5lkEpu8lFq3a+NFo=;
        b=mQ9KC4kqObW+ry0jdYumLBOIpyA1QaBBC+bxZcmByr/gq1pOqrdJcPcY/ckDUAgDME
         Z9gKZ3YhZ4ZS8CO96TPsoKQrr+nKVJcJbhrrzCNeF8Tfsakm9bQHdszAOV6l2+EJJa27
         vhPM4G8+RXhoSkSWWYH+QMBTvaz2dT1NUVR4dhEH0d82fWgp7+TZ8BWIQq+GwgrY/1O9
         Txqp0hn8BBDORuCxPnS9lZyOrXN4VbYTe3LMm7VBn993fWCsZBa+7LalVBu5dd3NdYLz
         17+UvNRj4QXK3VREM4vFVmfB5poZ3Nvi4v2a1NGLIWFCDCMizQRerzhRKCO8PD0RjyUW
         oHQA==
X-Gm-Message-State: AOJu0YwJfNh+r7vJL39QZ4RceAyA15/giwhdso2Z9H7OUT2zOAMRLWpb
	/Phle/ffkGW/eqnKrAE0bpNGPQLp3dLHz/ZVoFCXsGdYI7CxK5G7zDsPG6HNhXAqvc4OMlhSlci
	IQyN5
X-Gm-Gg: ASbGnct72LD8+zER8RfiHQUfAoub3lUBrkhseZWrdZ/N+vgDddw+d/oBCM37mKYVIWB
	7HZo86oRc5zrcavq+7SONtigfVTGAMPRzKu9GqSLTY35AIIWCafuGd0z+gIb9wzT0o0hAp2Cvaz
	3E8oEHtlnUQQYhPawvOBo2jWnt3E9IrfSF6UuHIgz2nz1/08QG8z4/vE2WHxo7MRNB08QdHejWC
	7vccRTXtRyFFbBU05QsEE6zNrw8bIk8gm4Y8QKhnn++ZlAYUng5FEMxf4RbPTmOe1y1eQQXeSyW
	oG6vau0NGd1kZ0lirCHqqwYOmjQdIK8zBxI6xHFEyqpwm2hFBDDLHM4tAf1nuZJMBZWb0dunsLI
	1/gEJv/ZA5g5TuA==
X-Google-Smtp-Source: AGHT+IH1N7ySGxOECXHHWc8QhygEKSzTrzZNTW2ySc5T0mT8f6pFl8Ijlv2ZfAg95iy3BgqfpyxK8g==
X-Received: by 2002:a17:903:24e:b0:246:7c16:ebab with SMTP id d9443c01a7336-248753a22e9mr75892815ad.9.1756330243870;
        Wed, 27 Aug 2025 14:30:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 29/33] yocto-uninative: Update to 4.8 for GCC 15.1
Date: Wed, 27 Aug 2025 14:29:36 -0700
Message-ID: <02b285fb0258587e9b78ee4b1b4b2eea0e0a4b3e.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222537

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 3d0f1fdccd..dabd604e8e 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.41"
-UNINATIVE_VERSION = "4.7"
+UNINATIVE_VERSION = "4.8"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "ac440e4fc80665c79f9718c665c6e28d771e51609c088c3c97ba3ad5cfed197a"
-UNINATIVE_CHECKSUM[i686] ?= "c5efa31450f3bbd63ea961d4e7c747ae41317937d429f65e1d5cf2050338e27a"
-UNINATIVE_CHECKSUM[x86_64] ?= "5800d4e9a129d1be09cf548918d25f74e91a7c1193ae5239d5b0c9246c486d2c"
+UNINATIVE_CHECKSUM[aarch64] ?= "0d75ae3cc6e8245be40f55d48612285248ad331896ca3f4c772ed2fb34239fcf"
+UNINATIVE_CHECKSUM[i686] ?= "2cbfd7ad3e1362538764999dd4962eb2511211867ae17a327b65631f64f38e31"
+UNINATIVE_CHECKSUM[x86_64] ?= "6d5e28258176c52b9eecf882d4553033fa700902e60ba80d4b7ce0edacbe41d6"
-- 
2.43.0


