Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8CDC6FA8A
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:50 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.5283.1663078723323537401
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Vq2Qqb+p;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so15824188pjm.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=Ih3Rn3whnFjnRJ/cjgW6fk2vx2on1/O1qRw18wGz0Co=;
        b=Vq2Qqb+p80WrkBG+0BgqZn+6DxhC5nosLY/nDQuVQWyKvbg8iqtK6jUMe1xZTi1+78
         daLzTZaa4wdHd2XYkNXFTn8/+c61sOLh6WTDd4pxJ+Kns5bZjZvP/EluCdWzLcIm4XED
         s/oN/tngo2r8h4bXOsaULM4ocQCHGpyaa1vF0aM+5n/4Qp3F7hH29aP07q/7mFxcgrSA
         WOWMcrzKOFvwdzTod/XTw3+rIrwY4hBG8ejUO+qTaa7KQFVHgnUVZXkiuJgejLNIMShL
         M63P4JoqkmI/DtWnMV+xVHpyCjjJfzl/g7Odzb3IXPu4+35OriQRFY3mroDnl6WofQtb
         yVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ih3Rn3whnFjnRJ/cjgW6fk2vx2on1/O1qRw18wGz0Co=;
        b=SnHk5y0nxryMqE6jSb6o2KJmGiKkylpZahduw3xuNuVG6w7G8/CIKfyO0x4B3ZP4f2
         qtZHnNNGKp43K7QPg63zp4H47FqehiyytXLf4OnFDVX7ZIt8HLc0aVfEf6FWdMjVkArd
         PmVQ3qnReSHVwn8hju7L009pDhzRK2oOFUIkDM3i65NlIcXr93Odb0+jY/hcpUqqS/db
         sNDuzTas8t52Dj7nrZbLJlVtsm8XslrRJ1tDVQHPuagfUHMMF+NPyGhGlWiLN73iopTt
         CvYXgIUiiMqI4d6zQ31eoncP9PyKJ2dWw4V7+wxJZQctLp5JG8J28YS1p5n5Bgmat7Xc
         qErQ==
X-Gm-Message-State: ACgBeo07gxXq4ee4euWl387cLajR8Lyw+Ts0H+2rdqDGewY0Vxw7gqH1
	R6gu+WQPYbxr2dtclSMkZ0bd+S/Ud1myoQFb
X-Google-Smtp-Source: 
 AA6agR5yMYkHF3xV4e3gUBVM1VXZ32MlrRXWdeJSPjqL8aaWxCY0K5bDN5DtgDRJPM8Ac17cEyijHg==
X-Received: by 2002:a17:903:2601:b0:178:a68:82ee with SMTP id
 jd1-20020a170903260100b001780a6882eemr20375224plb.163.1663078722228;
        Tue, 13 Sep 2022 07:18:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/16] rootfs.py: dont try to list installed
 packages for baremetal images
Date: Tue, 13 Sep 2022 04:17:54 -1000
Message-Id: 
 <e713e118b46aa0c8a5015b915a93718b7aa20a74.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:18:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170592

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

Theres not a rootfs for baremetal images, hence we should avoid
trying to list rootfs packages for them.

This fixes an issue where some classes (e.g. license_image) rely on
rootfs functionality when included for baremetal images even if its
nonexistent

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5a7e13f46083ce3b08aa762238c1e93b7626dda4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/rootfs.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 9e6b411fb6..91312f8353 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -384,6 +384,10 @@ def create_rootfs(d, manifest_dir=None, progress_reporter=None, logcatcher=None)
 
 
 def image_list_installed_packages(d, rootfs_dir=None):
+    # Theres no rootfs for baremetal images
+    if bb.data.inherits_class('baremetal-image', d):
+        return ""
+
     if not rootfs_dir:
         rootfs_dir = d.getVar('IMAGE_ROOTFS')
 
-- 
2.25.1


