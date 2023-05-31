Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CB5C7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 02:34:59 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.4697.1685500490607609582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 19:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Dp6iu6TS;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.45, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-19f62a4924eso2236256fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 19:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685500489; x=1688092489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6n8GTg3aXgWeltBoLJzUdoGs5OcveNrx0fmXXdRWyYE=;
        b=Dp6iu6TSzRIKU51Zhqp/w4kUw3vB7naqMjOTHn8vBZ0YvyqcbsSWq+RTVstCVwzscw
         r5+uGQj/d+0eWx6M3ZLR2EA1+LVBV0hULEprWBo7xkzCuNf1OXsImZL/rl374AKpE36L
         rDN1v9X6kxhAivIbHChbyxZoTLVKODV1BHyflfICpC9aYgcZ/VOGHegVVtMdnH9qPXzq
         KLn4wiPwI48g2ftj1Ozm0RCfnTgj4zNJ48WgW4GO6i3WJBpib5yOv1cXE3oHeI/JlGz7
         FbTIPZMDxzjDniOFrCmUrKhgTDRneXB7lif9LXAojGYVy4hzDzxC8rnlV+9p+8nUIbBk
         LAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500489; x=1688092489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6n8GTg3aXgWeltBoLJzUdoGs5OcveNrx0fmXXdRWyYE=;
        b=NPq5+nWDJcE/7uPfAjVvts3jDxUVT9+8Mu1W8NQAdqHIp7ZeNK4dKoNtRkmUcc0kYp
         joiohNVVMBYCFb7pLKjevZdk/zCy+gBbM/sXMfdLHVFJO2yCiXIZ9QTgQMHBBxYs0Gx1
         lDeI1KWkos/NkwCuX1RcGGZ/i/RRD9W33SH0+9jBsUBbNLFTsJb5Uvf7h8Qzm01z5qGm
         nshaFI2chnWs9hh3/6T5QKIlfDGJQATH/4svH6h3YuuHDr8ekFidE7rGq2s2dpMstLV1
         WcGRdFU3DSV5Y+2C2VMEmp/TQ23d08F8AHrTYzx4yp3UkNPx6QzZ6WB1xM2ryQYzXmwe
         nw5g==
X-Gm-Message-State: AC+VfDxeVH5oi4AnTqeNGGoSRCjeUAd/2h2nPANiycrd+lDh5cRTAxVF
	0v7zL8Yq4WLfC25BaOMY1ex1tlmxznc7AiqAsQE=
X-Google-Smtp-Source: ACHHUZ6LqCpT9ao1t5UMgPAMHE/0HLituZYaKTzO9o7+1ZxFMfZHkU1EMlehDl7KNZzCKPELuEwKtQ==
X-Received: by 2002:a05:6358:4411:b0:123:1395:629f with SMTP id z17-20020a056358441100b001231395629fmr332308rwc.8.1685500489492;
        Tue, 30 May 2023 19:34:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k91-20020a17090a3ee400b0023a9564763bsm92877pjc.29.2023.05.30.19.34.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/13] package: enable recursion on file globs
Date: Tue, 30 May 2023 16:34:19 -1000
Message-Id: <90855ef11e3bd85eea718532f20878b72aa729b4.1685500244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685500244.git.steve@sakoman.com>
References: <cover.1685500244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 02:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181981

From: Randolph Sapp <rs@ti.com>

Enable recursion of file globs. This just allows the use of '**' in file
globs to match 0 or more subdirectories, it should not make all current
globs recursive [1].

[1] https://docs.python.org/3.6/library/glob.html#glob.glob

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 67acc278d1..fed2f5531d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -262,7 +262,7 @@ def files_from_filevars(filevars):
             f = '.' + f
         if not f.startswith("./"):
             f = './' + f
-        globbed = glob.glob(f)
+        globbed = glob.glob(f, recursive=True)
         if globbed:
             if [ f ] != globbed:
                 files += globbed
-- 
2.34.1


