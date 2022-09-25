Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5D3C54EE9
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:19:12 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.20287.1664133542707413372
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HAlbEEmV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id t190so4775431pgd.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=FtoeO8R9RJiv5sLdaYlS7r9gikh0iQP4bXWJKDYaxCg=;
        b=HAlbEEmV9DWXfRPBCpT0l6r8FiwktjYAlfyTwY3himvVXV1st0TGVBJYDAopZlfRg3
         Y3PCTG3I3f3SjQ2xPQOIk/MSA/Bg/Z92DFKkDRAaCo4lNyhnH0D8o2mINth4IwdNwZu6
         +ZopGR3GJg2tdhJhDXDmejfnE0+sEs85Dv0zXo5j9ng8Xp8dAaKcyY4v80sWfNvEJh5x
         Xm1aDAeqfuOSBpfuBO9fpMvedOoU1RFWldoES17iQ0fP0ZIFMHyvl45LbBYE1fc4KVUL
         onmDk24/VhGfSqC1rZy2bsRnb+lRLxhX2H1G6Y4QIRO61ZbCU3DRetPKuDOkwb155UTJ
         7+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FtoeO8R9RJiv5sLdaYlS7r9gikh0iQP4bXWJKDYaxCg=;
        b=Tv0fxd6TilVHSAInkY36ZiLjTodx0JyZ4l8gIqfVSNOSV9NsrdtbolJ+lNk0mzoCQ/
         l0xSzWVk8dGjGONKpYKBG4nPZgm5u8UlG2JWzyjo7Nyh4TeIZXtMtb9VD99OMK50mQ8a
         bIpby5sFYv4WTWZSHZz4WIPmSB3G85Ueyl4k0D+8AsoceoSYqqdxEQZ9XOsYeYQCu4Wt
         +i6/qpontBs1fvyuLDVmyHv+bVxLfj+c+l5Xz1KWVURfw1LsFKO7256uKRzEDS8Yqupm
         ilYG/fHTLUjzAXWUpm2+gJuJxGwAPQbrS6VgSefQ2koCZI9vM08qYK5Tw6Zrwlgm5lx1
         VYpA==
X-Gm-Message-State: ACrzQf2RL7wYFc/UjHEQLW7h2WnL1+rVy5ZlsxLWMvP2WxK8eMRwRMln
	emvkX7MBCM+1Q5rqBrdRomp/I8qelH4Oe/np
X-Google-Smtp-Source: 
 AMsMyM5MBBXhXcp+fqTOUwid+Xq8R5Ey+vRUeqdM7bx+NvQONw8otJ0g/YfWBIG9gxl6feHP28N2aA==
X-Received: by 2002:a63:f353:0:b0:43c:3b4c:84cb with SMTP id
 t19-20020a63f353000000b0043c3b4c84cbmr13560459pgj.298.1664133541691;
        Sun, 25 Sep 2022 12:19:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.19.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:19:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 32/33] oeqa/runtime/dnf: fix typo
Date: Sun, 25 Sep 2022 09:17:43 -1000
Message-Id: 
 <7bd92a0fac5f83c5c8b38591901760753192e586.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:19:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171046

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 454b85fc612bd060b51ac2b94e36698ed1b76d56)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/dnf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index f40c63026e..2cfb36425c 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -144,7 +144,7 @@ class DnfRepoTest(DnfTest):
         self.assertEqual(0, status, output)
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
-    @skipIfNotInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when enable usrmege')
+    @skipIfNotInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when enable usrmerge')
     @OEHasPackage('busybox')
     def test_dnf_installroot_usrmerge(self):
         rootpath = '/home/root/chroot/test'
-- 
2.25.1


