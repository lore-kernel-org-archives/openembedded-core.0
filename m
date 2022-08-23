Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68166C3F6B0
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:38 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web09.4548.1661294194926671375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pzXu3RKC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id p18so14070516plr.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=hK+Y2EKBbVMkJ+EFmhehcwMZ3q8hFQnAVDPLYXgTlVQ=;
        b=pzXu3RKClXxNUqDgmr2+dRWLSs+TU8Vf1kq8gExY8aYHUYPrIAmLGLHqsssqaDlkls
         6trDsrGTkb4BJyj5C/jjsBTQgHX9XY02J7AaH3Et3MF7B5OTFUSkzLIs9kKB2zqKvdIO
         SYAXNLU/bbVoRJY7irm3+epmUxyt+2tbxkc9AnSyS0aybUVqLc0UlmxmuH4VA1P5qr+5
         oRj1PXfByZGYTyaUTafa7uzf0/VQd/Ty/O5Bh/n4p1fxxYyr7HAZHD6s5Mkb/TEDlu9f
         p7F31V+odo1bMlKp1wFlkyoTIyfsdHlgOUMN2Op1b3h7W4MN8VbyF7FE57VbA7pYKUJg
         pZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=hK+Y2EKBbVMkJ+EFmhehcwMZ3q8hFQnAVDPLYXgTlVQ=;
        b=MYcDpXIjl18OLfeW0AAlfrFaQf2Ml+iyBIZydgC5YqcbOGXZOWbkdkmqy13UnEF1fW
         sWNjC0CPg048/Uh1y/NZD7ftj45as+sR5BiK9+ZkAhkyoeBIf1bpnSFSKVhVf3ZtAEWs
         4Q3pAR7R/g++pgFB5FZhcmoUtUtHOz4sjwbfPJLt7HwIkZWxR4JNtVOywIXIAdlSWUeO
         mJx0ZcyhyXuKxHNW0qW44+u5EjkvoFq2JuCzomxq9bckWWfAJBNyj2jqXCn1BB9reA80
         lr084RmkkHM2ypZDcHUrUOY193KcDo9SDYDyj2dQZxfU9ii/9vF5ZVGDVHd82H4jVxXC
         b0Ew==
X-Gm-Message-State: ACgBeo1hYSuMGR/dZPXgnb+0eWULlN9z5CaZTgstDmOvkKTzTTeEWTGw
	PBmycRg/lkW73toO2WCFDiA7zzbvkaoCJ2Q0
X-Google-Smtp-Source: 
 AA6agR7DGoYv3CyS0sqFKF0OmiXIMNTTEQEX/s8PFS74wXz4T1rgGEL8muLFMJz40p+jC8qx7Hu0FQ==
X-Received: by 2002:a17:90b:388e:b0:1f5:40d4:828d with SMTP id
 mu14-20020a17090b388e00b001f540d4828dmr5387173pjb.31.1661294194037;
        Tue, 23 Aug 2022 15:36:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/28] libpam: use /run instead of /var/run in
 systemd tmpfiles
Date: Tue, 23 Aug 2022 12:35:34 -1000
Message-Id: 
 <ed0cbea49e0bad6ed8b23a469fecfeb09fc3cd5f.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169754

From: Beniamin Sandu <beniaminsandu@gmail.com>

Update the deprecated path to remove the systemd warning:

/etc/tmpfiles.d/pam.conf:2: Line references path below
legacy directory /var/run/, updating /var/run/console
/run/console; please update the tmpfiles.d/

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7865234fadf01a434d1f7097881b70905c1b8aa2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/pam/libpam/99_pam | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam/99_pam b/meta/recipes-extended/pam/libpam/99_pam
index 97e990d10b..a88247be13 100644
--- a/meta/recipes-extended/pam/libpam/99_pam
+++ b/meta/recipes-extended/pam/libpam/99_pam
@@ -1 +1 @@
-d root root 0755 /var/run/sepermit none
+d root root 0755 /run/sepermit none
-- 
2.25.1


