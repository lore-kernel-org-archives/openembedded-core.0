Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12343C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 20:58:35 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33816.1784667509557507565
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 13:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UIbMUFIk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4798bea72f9so6243230f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 13:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784667508; x=1785272308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cRbRUdiAYrtT6ODZA6yMBj31jmnPVAKd65+6Wjol1ag=;
        b=UIbMUFIkntZfeotg26wRfOPgeGM+xLFrJInMXqQqvR8Z9O9oylv9YuFJ3Ah1VAxZPO
         xROsEK067XPLs11U5qKLk7aIyZT4QvS8JBgATyZWBj8OMcfIFSqTzqhRIfLBC/AqG9nj
         rmIX3zjxZhJYJA4b/8X7VS0U4/I3WKDSYJXIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667508; x=1785272308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cRbRUdiAYrtT6ODZA6yMBj31jmnPVAKd65+6Wjol1ag=;
        b=RGOzmZTRVE+RM4+V2WA1lR+7KI3qvKHycTNr57Z4MzpaabMGbgSuJKWlGFiA6MIVqk
         YmOA8qVccwUiLKlMDgO7SMfd+BfhJWZbizPXYtS0MOIhip4a3wlD6qGAMPdsOU0Dv/C6
         UjPCew6oJi5ZjVlNsAav6x0L7Ypghg6VN7b52HJlYyTltc78mysmmaF9tbno2occ0G45
         vLIQAQyxk4QBksOZFJdsrrvruaOh5ZaNYM2VU8/8v2PUM1HUFml16xnTge1XtyPSP56l
         CmiqrbOllYwJxEzUqYx/hLujt7gZI636BwHqfSLkidNeSShOXh8fUeloCHvoz42bYsSL
         nsRg==
X-Gm-Message-State: AOJu0Yzh19dKJ8SRKWhi3ryj+Bn3Oo0eqpL4Dr0uwzdbtwnHjzdGUBQy
	nmZFSVwRdsNZxuCD0PHJdr/BVwHPeThe585g2dBYXbRKtOaivslqHaWhexxUUcahfprsvos3IVj
	Nn3vr9x8=
X-Gm-Gg: AR+sD12+Tp8X//6t009ZLVpWPxQ43T86B/A+XllvgULtaB9EDTni01SKfV8ximWvu0Z
	wXDy95dIN2gwMNOSHcGIVlWx9+8oRhnJypKvqJaqBxJIijBWBnlPF2RmOLaWWgnzJcuMSzDGbi3
	aY5a7V9fhqXkLPpIzxFnAgo9KkIJd8EOstZPrPn+2c0cKBIPDPdotoVsCoHw4rUBSmCoRGtKOrh
	jKCU+XGmgOnx6VSItBLl+3KqTziX0X1TFIaMexLUYtiofOsX29/xiLIPObxYe3zO8lKQB3r2cmn
	pk+/IzoD0tiI/OVcRHDyPoYGbfrTikWm+UFKJQUxhZZBVwogv2ThPskzN4i8PTiC2uDYzXZ8q5c
	EtHG8eKIBL14Daq0VsSNKJs7GQ3S/tOr1qfFpeO5J0SXQgOOenU6BydiSPlgoh0EfCgNrNOCMsH
	iayc5Un+qDsBfq+aIU0IW58XbJBupjngw=
X-Received: by 2002:a05:6000:4a06:b0:475:f3c5:f8a5 with SMTP id ffacd0b85a97d-47f6230bdffmr24043538f8f.15.1784667507665;
        Tue, 21 Jul 2026 13:58:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1746:65c1:1387:dd9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed2314sm5906117f8f.23.2026.07.21.13.58.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:58:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Add in openat2, exec and linkat fixes
Date: Tue, 21 Jul 2026 21:58:24 +0100
Message-ID: <20260721205824.2727987-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 20:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241577

Pull in:

 * linkat: Fix AT_EMPTY_PATH handling
 * makewrappers/openat2: Add noignore_path option
 * pseudo_util: Correctly free memory allocated by pseudo_setupenvp
 * exec*: Replace bash workaround to avoid memory corruption
 * pseudo_util: Clean up memory handling for setupenvp results
 * pseudo_util: Avoid a memory leak in pseudo_dropenv()
 * pseudo_util: Ensure pseudo_setupenvp handles memory consistently
 * pseudo_util: Avoid accidental free calls for without_libpseudo()
 * pseudo.h: Avoid accessing unallocated memory

[YOCTO #16316]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 45407b532d2..9f02d905681 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https;tag=pseudo-${PV} \
+SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https;branch=master \
            file://fallback-passwd \
            file://fallback-group \
            "
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "823895ba708c63f6ae4dcbfc266210f26c02c698"
-PV = "1.9.8"
+SRCREV = "ca47829825f297d7bf83665c0541a9de4aa78009"
+PV = "1.9.8+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

