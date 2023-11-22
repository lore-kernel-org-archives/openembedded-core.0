Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F15C61DF7
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:28 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.18443.1700657120481640980
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A3v9ZFC0;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a00cbb83c82so363936866b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657119; x=1701261919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhP9OpWLIOrt/PGtaX6EbLmcnKflFbEnQWT734D0Vpk=;
        b=A3v9ZFC0DWjdbBYVBYAUqiLTfUtnyFGDQBc4t6PsmO/YIcdTvnWwo5dwLeff1qIa4d
         U68xdaVJOvCWiE7NLqeXrqp0hwkeuUjDIpKfjYBpPXIzA+H/ATHt8w6nh/xqe2NfODCh
         BkCIWq/au9w2ZuC+gmWv2BW0O82Gql0Xh025rGmb1ZgtIPXbMB9gFbLSCYXNktQ6HukN
         e4znf2dxcCgB8gTuUrA4kEJ3QcHJ5Arm5Lk4AfCaK1WFNB3q1F4DPOwQIdDxpyNc2lVO
         SdDKVeaj2vgSLO9+uvXH0t/DxCa0AD9skCVcA9n2BOdDbEbsFocRDCujvoCvEM8rkoly
         Li2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657119; x=1701261919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhP9OpWLIOrt/PGtaX6EbLmcnKflFbEnQWT734D0Vpk=;
        b=CyR1ZRe8qwqgfFkQSS+t3pFRFTOUidG7oGctvygrG8ntw5KMjnmDIMR0Vx4y5LVc4T
         u+uBrq3RRndOrskgwXvazfzD/vMzr3EeCynYlEoPHAu/cq53ysSUyvckvdBvtZz31EiE
         PMgn7/fzfLXsPx6n1+bYLlZl/hj2pqvijyYN2UuyevMKtIqIYGeiKoEfQJai0HpDPgGg
         nCZceJcOJ3/cO6iPrfYj0sx27DOHxvz0DpomRdw3veV0LYtb/KN322Hm4Lf4VK2yxz4q
         wL3nzvadx6GGWWEqYTmsM0rCVNb9BOsJjdWPUQbZhu083cZVmV4npSOUvNUDsSkpljeo
         +u+A==
X-Gm-Message-State: AOJu0Yyl2imWUr0DtKw6HvWm8+Z8CV5r5sULwuqnNgHSaWBCf8seilQb
	9fQRggIe66bHVtO2FN+IVJchlRtUYwQ=
X-Google-Smtp-Source: AGHT+IGa8ISRENKxREqKY0ZJiyF77PA2O3V9v9eyHL35VMKauE4x4UhRrt9OT/UvuPnes6BMhQPZFw==
X-Received: by 2002:a17:907:4c8:b0:9b6:aac1:6fa5 with SMTP id vz8-20020a17090704c800b009b6aac16fa5mr1319187ejb.55.1700657118948;
        Wed, 22 Nov 2023 04:45:18 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j24-20020a1709064b5800b009fdb3ec3c57sm4070601ejv.160.2023.11.22.04.45.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/21] image.bbclass: don't append -dbg suffix twice
Date: Wed, 22 Nov 2023 13:44:44 +0100
Message-ID: <ec58b6829e44701e223c9abc23289d55877dcd73.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191091

* now with IMAGE_LINK_NAME defined based on IMAGE_NAME we don't want to
  append -dbg to IMAGE_NAME and then again to IMAGE_LINK_NAME

* this resulted in filename like:
  core-image-minimal-qemux86-64.rootfs-dbg--1.0-r0-20110405230000-dbg.tar.bz2

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/image.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index aa24a92245..e68b8034ea 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -338,8 +338,6 @@ addtask do_image_qa_setscene
 
 def setup_debugfs_variables(d):
     d.appendVar('IMAGE_ROOTFS', '-dbg')
-    if d.getVar('IMAGE_LINK_NAME'):
-        d.appendVar('IMAGE_LINK_NAME', '-dbg')
     d.appendVar('IMAGE_NAME','-dbg')
     d.setVar('IMAGE_BUILDING_DEBUGFS', 'true')
     debugfs_image_fstypes = d.getVar('IMAGE_FSTYPES_DEBUGFS')
-- 
2.43.0


