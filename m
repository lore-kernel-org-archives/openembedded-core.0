Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50513CC6B33
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 13:08:49 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39772.1792069727297281472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 06:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EQ2MfZnK;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dee593f18so322271f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 06:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792069725; x=1792674525; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sc3rjSBoXwAXUdFpLYTbNhDerW4RjY9ZO/FLZxqtbxM=;
        b=EQ2MfZnKZ2pHTjdJQAv5iECCmlw3O2y5fZBPNqOZO1ixcBhFRsNFmtUYD+iL3Yx0vQ
         dtmbbYHPxl5f7hWh3KO2sdwDqtzmzHBBUnkJWsgSmB9DW8NSoCPs5WqeIDGtDsKDarQR
         A9+icK/snAzRT/PTEQ7AnNag3/emPDxOCdKGShf3m7XoyWgM0SLri/57EvEaHvqq/7X2
         LYpA+l7RViyKja5FnJP1eBWVUUDTjRgxCW26WCiTDOq/7nMAp9IiHMameMWFnb5oRSUb
         vSG0iqilR/L7z4mXRiEX8k4srNIU14KERrpWKK3v4cdpkHZD+1xvmHD+eeonx02AcDmm
         p4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069725; x=1792674525;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sc3rjSBoXwAXUdFpLYTbNhDerW4RjY9ZO/FLZxqtbxM=;
        b=BdIxuK8k8OI53KJUmt5tNXOp10xJKsounigtJhg+JT6n90uWVivXVSd+vyb2/EDjlX
         tzTFZxYAjYG8BadTUpx5fOcZWkAGAu2tpIEn4g7B5mC6L+zkP4oto2FikQdXe01wyYPq
         qgH6WeLBUtImXtpkGWlAeMoD8vCCbiEj5ymiJ2LPCQ8MTv4TNVwc+/tBA3Olfv5Vok2o
         v6EapDQb6h0HhEYFLtT9CeZWdo+u3KND223/bToNv/Bg+KfEHrdGdIuT6U0FD86pAj7+
         RSbiAq4rf5mtpck0OuRANKsr2K8uAU+F3w9hypiF7S/Espae9DS2nR8MK4UvoK0AJh8+
         XggA==
X-Gm-Message-State: AFq9FYI/O1IAhBCKOyFuho/NlEdGvovOpmavVeXlMrpN6Y6JBswfKNrj
	gdSAN2WW0MRVH15SjhJSJjRKLdrC97Y1N+x63WYd73JTc4kX1E1tLZasE7Wlog==
X-Gm-Gg: AYBFou2YYo1gXGSdC8OvX/tPCNiU4VPbv6KtB63hbyHhikdCqxJW8YhlwCQrD5A1XHK
	JfxOhslz2MG1pFyOaXDb0mWbBuzcyxL8sYIQO9seAGDRQNFd195XscSR/qCAQcdXvdO3X4APvuE
	bAJ+MbNBlcxcEVC7er453RjhgiiZYF0SBXrIS6ftJQW165IRZ9Hx7aXBWBAbhDmL4uAdAlhuvTJ
	iVnN/99HItR6ZtDgGgpjEmhNrpgCzOGNY/mISohTVkCr9jwP1suB80fpx1VVd/iA1lun2o0A/4F
	9aKL1GXZ12pdLpGQ+thEii0mtRdlC0WHRSZHl36s7I+Xm6aeLoGkyzwwQoEWlMvQgcxoSA5Ywpf
	OnZxGXrRGrpRkVLqrXC/LjBrAuuymwXW8n8Va9dChNlAMKrEG2uqzk9MJF+IfxazALpFBsr4zj8
	db4wPVNNMItaVPtRtoI7jnlNLj0kHrq2BXf6pXcO3yH0I0gQn2OAWyrY5XOGWNeF6SCWks8HR09
	yjN1cwR60v8JddoHsII+U2sivRXnu6WLttBVi3KgsG12x3fdw==
X-Received: by 2002:a05:6000:2407:b0:48b:9d2:1a6a with SMTP id ffacd0b85a97d-48ddf883a1bmr18917280f8f.1.1792069725236;
        Thu, 15 Oct 2026 06:08:45 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm17782453f8f.36.2026.10.15.06.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:08:44 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH 0/2] eudev: upgrade 3.2.14 -> 3.2.15
Date: Thu, 15 Oct 2026 14:08:42 +0100
Message-Id: <20261015-eudev-3-2-15-v1-0-407ba1a93edb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFrQ0GoC/yXMTQ5AMBBA4avIrE3Sjt+4ilhUDcYCaRGJuLti+
 S3eu8CzE/ZQRRc4PsTLMgfoOAI7mnlglC4YSFGulc6Q944PTJDwRapyQ4UpbUEQktVxL+e3q5v
 ffm8nttv7gPt+AFYBWANwAAAA
X-Change-ID: 20261015-eudev-3-2-15-e406a27a8c72
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 13:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247882

eudev 3.2.15 adds a render group for DRM render nodes, so we add that to
base-passwd first, then upgrade eudev.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
Alex Kiernan (2):
      base-passwd: add the render group for eudev-3.2.15
      eudev: upgrade 3.2.14 -> 3.2.15

 .../0001-base-passwd-add-the-render-group.patch    |  29 +++++
 meta/recipes-core/base-passwd/base-passwd_3.6.8.bb |  16 +++
 ....c-sync-dev_urandom-implementation-to-sys.patch | 138 ---------------------
 meta/recipes-core/udev/eudev/netifnames.patch      |  17 ---
 .../udev/{eudev_3.2.14.bb => eudev_3.2.15.bb}      |   4 +-
 5 files changed, 46 insertions(+), 158 deletions(-)
---
base-commit: 6b2dcfdbe16055edc88f72dabf07e33f8163d8eb
change-id: 20261015-eudev-3-2-15-e406a27a8c72

Best regards,
--  
Alex Kiernan <alex.kiernan@gmail.com>


