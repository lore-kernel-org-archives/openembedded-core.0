Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CDBC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:58:21 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.105644.1747238297696270446
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MJRQDfYy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e331215dbso7998255ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747238297; x=1747843097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4zJBICUPcbEDUD/BjdmjR4GUV62950taMoWRwyqZb5U=;
        b=MJRQDfYyLL5AGaZq14RdWvr8Vw36UCmooSndR15k/CzGOWEHlLWcS83meJKOy/Ei9T
         JXWMZurNBR8jgSr4y8AZ6JX6sxZ0JmvSxAaOw/3NpMFU3xkCL6Baojhn2HlvuKl7SdWJ
         WA8tkIEssm208bTXDRDEPm2kYKcfYXQv3B22Pex3+flF6bctX0XWHKLA8tRWPH+Njpkp
         dJfapc3qNw0glkTfa3SCATizCmoNrhJ5Jo3Pu+LXT3LKsasF9dppvFNUOzbDq/ZdgWxI
         9ua2b1056JepNnBPo3yKZK0QnrQaSxSslhXFVmwgkgMjlIFy37f1Y9Z3KoFeJCM936qy
         d/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238297; x=1747843097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zJBICUPcbEDUD/BjdmjR4GUV62950taMoWRwyqZb5U=;
        b=D5M1A3Swjg1XwF0RFKwzToNYOgr9OXXqlUqEGaKCjEKuuUNEmMszpG+r4P/aLj3t8m
         KTzukf3eXbonDwgBwhMGL4fbNFJHTBt6j89SGF9/8SwdhSfVCOnsJhw1bRku8G3EuIIf
         RMX+Rj1+3aTIOk8SqrsxzEM2B1F1CU56dIYF2K1dqs3o68b7AwGdcmNBpW/qr9L/X4e0
         14mgNMztGEzeVrWb5JzTxiYdGL+gXgljzhWqANIwb2tpk7cX3GKDrdA05m+KSgcoSX/l
         dXGBp9ZuUdECBNyToxJbowgb4U3JIYli3Z2Sert9bFn8Ni1vTiLfwEgei/sUwdjacErr
         FzWA==
X-Gm-Message-State: AOJu0YycOhXLX/nnK+ZmgEEMyyWyWV5+Mr9eDxSRXFvmP7+1yaBq90WU
	pS6wlziNcOrhxFMbkmHPYMtglPGaD7ARfwdHV3jPyib53MsrAw9TCu/aAValn6Xcf5uoyyBDH86
	JkA1x
X-Gm-Gg: ASbGnctwjNWJrpxlUpPG1DTNioqhmc5tTLLCiGcgFDUEDFonEruqYrceWH0KViQSsqW
	+dvT3guaq3G5D9V9X01l5/KXxX1TpIYbPNrQubLio99luh5HqUW8kI9qkqgqofKKk4L/DlfvCD5
	0Fh/C7dyx8tlj8DHe5bCSfarakPTCneOC0T9gvDm4LAda5HiqambS7fxmbrHyYQyEaR6E/gsZ4h
	KX2ahrW0GD9pugJqMx8jwwI2DQkFBZPNKCssprhA39Et/QoPI7M8CF88Q81UXoGmgW5g5sJHCVr
	8A3ltsg7fSEqb2iuPA/sJ2doMUQ04D9hp9FCLciT
X-Google-Smtp-Source: AGHT+IH3r41qca/b07U6iFFTtbMcCSM+4BRDGJYU+UQ8CoXuwsMWko356YbDPRwaPxOvfxqHZSrhwA==
X-Received: by 2002:a17:902:d2c1:b0:21f:6f33:f96 with SMTP id d9443c01a7336-231b3959f60mr1109685ad.6.1747238296932;
        Wed, 14 May 2025 08:58:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:671:bf16:d45b:ad8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271bcfsm101347385ad.125.2025.05.14.08.58.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:58:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 06/12] perl: upgrade 5.40.0 -> 5.40.2
Date: Wed, 14 May 2025 08:57:54 -0700
Message-ID: <8e91cd8293a13d21eb1df5b9b750d9b498bb3530.1747238138.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747238138.git.steve@sakoman.com>
References: <cover.1747238138.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216510

From: Archana Polampalli <archana.polampalli@windriver.com>

https://metacpan.org/pod/perldelta

This provides a fix for CVE-2024-56406

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/{perl_5.40.0.bb => perl_5.40.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{perl_5.40.0.bb => perl_5.40.2.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl_5.40.0.bb b/meta/recipes-devtools/perl/perl_5.40.2.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.40.0.bb
rename to meta/recipes-devtools/perl/perl_5.40.2.bb
index 0d4338f29f..95c230060d 100644
--- a/meta/recipes-devtools/perl/perl_5.40.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "c740348f357396327a9795d3e8323bafd0fe8a5c7835fc1cbaba0cc8dfe7161f"
+SRC_URI[perl.sha256sum] = "10d4647cfbb543a7f9ae3e5f6851ec49305232ea7621aed24c7cfbb0bef4b70d"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.43.0


