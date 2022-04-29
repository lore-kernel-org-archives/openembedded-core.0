Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B104C43219
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:59 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.11879.1651248118716885593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=eW00xzOA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id p12so7326078pfn.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZIxLbtbmuf03v0EfSRsnQBtxuKVxskyRfSU/pSicxjY=;
        b=eW00xzOAWO5JoGATTOWUAy4xgTpzMtXjrcrGQ0T9nw41I4uw71gGKH1sFPi8iCmQ9F
         7gffQ+k0TmvivUHIolWzaVUnC50hgZ91Nr5rHn2n8vmo3BW1Erq5ZJTnx12Yq73tjJAc
         SVX1KjdhCKjOCgBbWirKveOlPY3AauEzDXyYV7rtpywWQ+0zlLDOsIbTEyNPmOC4eRn2
         kPQAz2dSv1On0fRPMgLvO1lgWO8SZEKvrHPOExzGOj33i01QRXAkS+vUQjA2zxHVkmoY
         KmxOtqTD3B1buTtwQKTpelUICoY2/vVHtRQltZWWDECoKhzCQO/68RCJVxMQHy7fQCUN
         LbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZIxLbtbmuf03v0EfSRsnQBtxuKVxskyRfSU/pSicxjY=;
        b=HuKrQ8H+l1ZgjUbOCYoxNIoGnKDI1c1b+AqF/QqjN92smswacb9TYWDI6Yq3wec8Jp
         HlyIlZAHxGiIYf50IfRA1r7JV2c6WECudNWmkEMOaNk+sy/Ul+cw76v+du7bhMJxmrq4
         XlfZ3Goz1C9WpKj7vkiYW6blhF/CGqStI+22QJUeGqC0A4CvKpyM5I9khJSTdSA01w9z
         tW/QvKf34x97Y3JbrUxhX+JP0Gp+oBLNl6MrJMtaQ4N9DEbERZyVNKOoyM/0E8suXXoJ
         xjw1ZwuMP9bwWlLN7MjOBIO84yJ3um9VKzw73UU4pInnarXP2gYhH524iZP16k184upF
         0IJA==
X-Gm-Message-State: AOAM532hKH5Ovxz4hkXYkGkwVNf0bxDZGDHlLi47W0MMOdYPaAmkDH4u
	tXVl5tCPNtAIuISAIT+l47jm8ZTYxKc5g3mpJsI=
X-Google-Smtp-Source: 
 ABdhPJxbPPNZg1KZ02zdO5CEyDYFzXi2x2+q3cLhB2D0XsdlD5WRbzFAuCBkMIbBZg5FJgL1a6HrXw==
X-Received: by 2002:a63:5163:0:b0:3a9:4e90:6d3d with SMTP id
 r35-20020a635163000000b003a94e906d3dmr102281pgl.48.1651248117466;
        Fri, 29 Apr 2022 09:01:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/34] wic: do not use PARTLABEL for msdos
 partition tables
Date: Fri, 29 Apr 2022 06:00:34 -1000
Message-Id: 
 <354ef6b723f50b5f0b46a2bf5797e5b982c6ea73.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:01:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165034

From: Henning Schild <henning.schild@siemens.com>

When using "msdos" partition tables and "--label" but not "--use-uuid"
one can generate images which will not find their root, because
PARTLABEL does not work for "msdos".

Fix that by simply not going the PARTLABEL path in case of "msdos".

Fixes: 2fb247c5ecf0 ("wic: support rootdev identified by partition label")
Signed-off-by: Henning Schild <henning.schild@siemens.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9ea1a838b946020e026edc032039552b723fcaa4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 35fff7c102..4d0b836ef6 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -259,7 +259,7 @@ class DirectPlugin(ImagerPlugin):
             if part.mountpoint == "/":
                 if part.uuid:
                     return "PARTUUID=%s" % part.uuid
-                elif part.label:
+                elif part.label and self.ptable_format != 'msdos':
                     return "PARTLABEL=%s" % part.label
                 else:
                     suffix = 'p' if part.disk.startswith('mmcblk') else ''
-- 
2.25.1


