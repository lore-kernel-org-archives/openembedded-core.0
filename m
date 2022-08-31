Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09F3C0502C
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:31 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.26507.1661956823080020121
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NND2baDN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 z3-20020a17090abd8300b001fd803e34f1so12653734pjr.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=eV3MXCRkWxu6d4WqMNhy7fKqNzBZTWNHO8D95LTUtJk=;
        b=NND2baDNT1N+P4v4cgTfP6AejghiipTFO6eGVvHI13V3eStpqv7a9W8xdohbual2Pd
         QHeY9L2+Ct4YIpbbP2eaeTvhCzAmLDoCYzmvZTdDwai2G0p7NjizsjJJKSWAAlm2NCoV
         xU61bUYQGjkOBK6IM4XJKCpzfwHPOKba7ThXyoiglYT+rKtLnZzDQ7r5szarUYIBBZs8
         gt/pxCkZtPfg30ccmr3LfmohrOAXkieczIxZsw/w1Wtk2aM/vVKhkFY5OugmVzdaVUoB
         tI8mDALsat9yD19zMnIh9aKqYIprpHVvqoKHZjKVN23zN8dyIGxKm25DXJlglPjDz5sz
         oJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=eV3MXCRkWxu6d4WqMNhy7fKqNzBZTWNHO8D95LTUtJk=;
        b=7DB8XBYX6crzB2GX541Cx1W43G+9QtMiBG6OYP5gaVhbDr25ArQwvoi9Oav+nDs1nO
         ccdZO4r9aZxJdTiTU5/zdvnmL4xnyb9N4w2O1z7pcILa/MSkRcEUw8mtX3uXwVOU4r7L
         UjACJBKS97eEVG6R9GcRxqfLCXAS6e/KgUdCw9mEjsskRgNIRnRr5sm0BYJetCroyhCx
         WTxn/J5XU8EDygyyJiSb8dxzKEO+GMkTf6I85JxE3dXefPHCGJjFiHQ6nBxGYiZQbKUk
         12Pc8KyqBQxiGWLLS3BgxqQU99cZVZaqQ5xdZ9BVXwYCl90xW7z+N9xTzRL5THaRpGj1
         YH9A==
X-Gm-Message-State: ACgBeo3Wsh9hZtbf5hlolftKRDhxaJtDpOAMhSjX6yXBlkH3GTZOV70N
	mn4yMGLhUnVTQSgVIpDtcI37C1vDRh11tfZl
X-Google-Smtp-Source: 
 AA6agR4PkHfo8efG/zLSb3ZUpEVw1AR6aSISSx/cY1QqK8rgTRO96KZmEhM2B3YBJEArlZvxKpo0Kw==
X-Received: by 2002:a17:90b:2644:b0:1fa:e0be:4dcb with SMTP id
 pa4-20020a17090b264400b001fae0be4dcbmr3514964pjb.85.1661956822116;
        Wed, 31 Aug 2022 07:40:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.40.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:40:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/19] parselogs: Ignore xf86OpenConsole error
Date: Wed, 31 Aug 2022 04:39:34 -1000
Message-Id: 
 <4b0b0affacc46191fede1dadf1685482ff05386a.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170125

From: Pavel Zhukov <pavel@zhukoff.net>

[Yocto #13854]

If VT argument was not specified Xorg server tries to bind to VT1, then
VT2 and so on. In some cases (runqemu with nographics or serial options
for example) VT1 can be taken by systemd getty service which generates
error message. Do not fail on this message if Xorg is running. (covered
by test_xorg_running test)

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d047f493e0c7f341dd307a4d8dd0db08a22824f1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index a33d645155..2d59bcf5f7 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -64,6 +64,7 @@ common_errors = [
     "[pulseaudio] authkey.c: Failed to load authentication key",
     "was skipped because of a failed condition check",
     "was skipped because all trigger condition checks failed",
+    "xf86OpenConsole: Switching VT failed",
     ]
 
 video_related = [
-- 
2.25.1


