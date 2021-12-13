Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117ADC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 15:37:00 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.12569.1639409818669520818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:36:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ul4bnZdg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id v19so11427047plo.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=luUPVMV8z1CjvEhdgUSGmdmnP5S83cdaIzMuHBKs9LM=;
        b=ul4bnZdgFkXgLB7/x0L9rD/m5Ul/ujY49vwKBRViC/1C2ERF3ZqD93NxcKzGe5UtnL
         tcZe9s0YueSYGgq7d9WmkxyC/Sj+GIh2WPzDkQCa/4Kz3sfZCaohDAmv5353mEr0P30i
         VONm27uelI17C9q+Km+l1aVB5tZbNa73N3Jp9thT/31c4fPv/rzYgR8/6YAQ+mUDp1PX
         ZRY+GcLgnW3M05dMh9M2iIORs8ykwsparYonuOureJz3GF5DWdMRuZBIpXMUchTUr1s7
         FWnKbMRotPtUn3/iOGxN+gwi+m/5SoU3CAQ0qdeT0HsjG7oRFn8DraVEY9izLJ2yrdT4
         9FmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=luUPVMV8z1CjvEhdgUSGmdmnP5S83cdaIzMuHBKs9LM=;
        b=ICyejpYRloFeeC/molQLQt7EFs8wEDcxGV27Yss1m2IoZNdW2fR3HsKfkxIudOnBy1
         lIHuIF+bnptGLztCdizRsXa3QAszb0J8UUPqQrhCo+8/DSw3vn8j23mVjpL4RYjcTXWk
         n9Q1LxJ4cxHF1ApVgj37rk1IR18BeY0d9S66QnUFyEZyrFVd2jMw+mRgcH3u6PEWQqNG
         JVCOgCXSb5N+303eolcu6bzN9XWNjOK5KtgNQD1h1ldWUhxxcrXfurvSUof4ofvxoGRR
         GeasbxKnl0sCnVOCEL37C1wpxXO0bwO+D0ee0oQyMBE2W6gCmXTAlJpkH7HLXh/UKcDi
         01rw==
X-Gm-Message-State: AOAM5327NWDjvquovbe66jlUJpJiyoEZAlUR23ZAs0er8W5bqjt89qA9
	RXGMHlyD5QixkHh8NmQxjeVQ791sjSPgtxBA
X-Google-Smtp-Source: 
 ABdhPJwbuLb3+XlWhnVrQoEsp0SFKpRDHbSlKpfcgwuvWrutm8rKxHip+7M2JVei/j04PyON+Gt7wQ==
X-Received: by 2002:a17:903:1c7:b0:141:e630:130c with SMTP id
 e7-20020a17090301c700b00141e630130cmr97418239plh.80.1639409817618;
        Mon, 13 Dec 2021 07:36:57 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y28sm12850297pfa.208.2021.12.13.07.36.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 07:36:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/10] wic:direct.py: ignore invalid mountpoints
 during fstab update
Date: Mon, 13 Dec 2021 05:36:23 -1000
Message-Id: 
 <3c8e50b073a1505cc3586ca51dfe1e75338feafc.1639409496.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639409496.git.steve@sakoman.com>
References: <cover.1639409496.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 15:37:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159648

From: Markus Volk <f_l_k@t-online.de>

wic fstab-update creates invalid entries for partitons that are not supposed to
be mounted from userspace eg u-boot partitions.

The following lines were added to fstab on a rock-pi-4:
/dev/mmcblk1p1 loader1 vfat defaults 0 0
/dev/mmcblk1p2 reserved1 vfat defaults 0 0
/dev/mmcblk1p3 reserved2 vfat defaults 0 0
/dev/mmcblk1p4 loader2 vfat defaults 0 0
/dev/mmcblk1p5 atf vfat defaults 0 0
/dev/mmcblk1p6 /boot vfat defaults 0 0

With this patch only valid entries should be added
/dev/mmcblk1p6 /boot vfat defaults 0 0

Signed-off-by: MarkusVolk <f_l_k@t-online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7aa678ce804c21dc1dc51b9be442671bc33c4041)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 7e1c1c03ab..2505c13fce 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -115,7 +115,7 @@ class DirectPlugin(ImagerPlugin):
         updated = False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint == "/":
+               or part.mountpoint == "/" or not part.mountpoint.startswith('/'):
                 continue
 
             if part.use_uuid:
-- 
2.25.1


