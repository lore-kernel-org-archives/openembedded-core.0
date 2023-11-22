Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEA6C61D9D
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:18 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.18522.1700657115988276160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a5y8GFaN;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5401bab7525so9636190a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657114; x=1701261914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMrcdPAoeMlhwviv1Hn6mOdSBQI8As2RRxLNv+v+uXs=;
        b=a5y8GFaNteUDOgG+2AfNR4DNFaf3qLlb/eJmAVerRpvIdiOoVKpbTgRjMilE2JVmcw
         ptRd3iThbcHoljLaTe5HTm3/cLp9EAej4Pke5LVBtHFnDcgc+gjn9PEAQGG5QhENgRZ+
         OBY8nmbCejzr27MorrjyztY4vEYEB4yxHDL6OdeS/NHxdhJzF060u9vwnx/ptvJWTAAU
         WGCqBoYPOmmv8HfxE5YMqGoDAM7sDfXfYGoVRdjZstbjf13gNlgJexU4MKvuM3tFhIDh
         AYkBcNNHX26ab+D7r4p2P4wtclZT2zMiBdeLgsLwx7kNAMfxoHTp+TbcTB06ecoILjWr
         0h7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657114; x=1701261914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMrcdPAoeMlhwviv1Hn6mOdSBQI8As2RRxLNv+v+uXs=;
        b=GumaMNfmVnNjdtwEAl69WjXBIMdSP88Pvn2m1qYVDi/pLxY+JYgdnC4xpHwkI/ZtAI
         Gl6zumUAvqITcjJnBOKwYVlN1GixLOrgA/i/MeeR2wVDAsje6lowKVlS+rcgn6XaCfeH
         yuL2Vzg/xZYgWNj6vulYe/p93bT2vCv2K69cGnc5yxD8VwPrU0m4ue8j0E7mvMje9JAC
         gS/0Q7h2KhdIpzDPOkoGo7wtnhD8yDNTnzyKl0IfIBeoYWOZD955KTwbNhv7/OTa9QYd
         NMIQH6do7egHhcvUFTL69D8TWTS/gNhB0y/K1sDXHzKUKHI0k2agt13zqHpt/mL63vIt
         ZV/Q==
X-Gm-Message-State: AOJu0Yy6Rvj8tLme0V4tkECIHcV8vyxDj6Bm5h5CNNoTf+A/jmVQtboY
	wBZRhLbHa2DDPPwFX74s0rXzBaQyBxk=
X-Google-Smtp-Source: AGHT+IH2Qi0T+bj12ZlldP0lFAALeerCZjKh6ELzie2smMgtKvyzP2dKbrLaklmT/192wIf1l7uNbw==
X-Received: by 2002:aa7:d3c6:0:b0:543:caf4:e5bc with SMTP id o6-20020aa7d3c6000000b00543caf4e5bcmr1811994edr.1.1700657114326;
        Wed, 22 Nov 2023 04:45:14 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u10-20020a056402110a00b005487c48d9ebsm4722582edv.57.2023.11.22.04.45.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/21] image.bbclass: rename create_symlinks to create_hardlinks
Date: Wed, 22 Nov 2023 13:44:38 +0100
Message-ID: <167efa2f229459d7b6b9334ee1c740d9413664ec.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191085

* to make it more clear what this postfunc does now

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/image-live.bbclass | 2 +-
 meta/classes-recipe/image.bbclass      | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe/image-live.bbclass
index 95dd44a8c0..4d926cb7a7 100644
--- a/meta/classes-recipe/image-live.bbclass
+++ b/meta/classes-recipe/image-live.bbclass
@@ -257,7 +257,7 @@ python do_bootimg() {
         bb.build.exec_func('build_efi_cfg', d)
     bb.build.exec_func('build_hddimg', d)
     bb.build.exec_func('build_iso', d)
-    bb.build.exec_func('create_symlinks', d)
+    bb.build.exec_func('create_hardlinks', d)
 }
 do_bootimg[subimages] = "hddimg iso"
 
diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 48dc70b8fc..aa24a92245 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -508,7 +508,7 @@ python () {
         d.setVarFlag(task, 'fakeroot', '1')
 
         d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
-        d.prependVarFlag(task, 'postfuncs', 'create_symlinks ')
+        d.prependVarFlag(task, 'postfuncs', 'create_hardlinks ')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', ' DATETIME DATE ' + ' '.join(vardepsexclude))
@@ -584,9 +584,9 @@ python set_image_size () {
 }
 
 #
-# Create symlinks to the newly created image
+# Create hardlinks to the newly created image
 #
-python create_symlinks() {
+python create_hardlinks() {
 
     deploy_dir = d.getVar('IMGDEPLOYDIR')
     img_name = d.getVar('IMAGE_NAME')
-- 
2.43.0


