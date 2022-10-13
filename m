Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F10C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 16:37:27 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.105.1665679032322272116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 09:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=sGvDVw7W;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id y1so2444498pfr.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEO3J0pe5bDbgmqmD2nPt4FEJu8QGvQ6GMg7BwmufFY=;
        b=sGvDVw7WcMjIuAcdfsj5ErXrfOFoaClYl7Zuqq14GsLDzj5WSqR2iJjQHV+xzfCwoL
         zqww49P6fIkT8DCXwHsvPUgRxkSWF0S0I8ziWNei/2RsCHjJIE5bSIZWNipgEDisXspe
         MLKa7YyVxPVnrF5vH7+AA3ekxim+E+lRtIml6nLqPRl9z9UFvFmsm6UdZyBDNPvZwIM1
         gkYYQC5ongBB80eCbYUdcmd8+rPWOGA+qhs7N/0wt+KSSfuTieLWoXsI4ulpAT45y/3L
         hGq1a6vWvKtQJz1JBGBWRj9yz3Xbvb0I+EpkjOrD9g+1FD5rwySMXlOO+u35/yYH31A8
         AY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEO3J0pe5bDbgmqmD2nPt4FEJu8QGvQ6GMg7BwmufFY=;
        b=ES2cnhyPxJCIuJl9NQfoJXowitBPchHUCGMlDlKRzC/AVoiJ2VLvkczpfQOw0B7VN9
         mPzeS8voVJMldykGMl96GCuabg9cdWkP4qR03vtXzQl0iB+18klDD0WzkTTu4YLoHU9n
         wIulS5TB5zDD7dqr3vH6KYe7emcRamX4wCOkOztkY+zWF8/PI96ymUgRn56gKF17qspt
         BHGDrFixnfnnYN2fh0EjMfCy5wIGaThQGfq/u5vdc45XnPa3kXu9dwY5igIF/kYqR6qy
         ts2G5MsjGJNVRYV8lrYwEO5Y0rNSoM7SGsZ48K5LqZw30h8lLZEvzlqdY5kPztvOz2rQ
         7CnQ==
X-Gm-Message-State: ACrzQf2ub0ePHEACYDBd/gxFmcWuKiyQqX0GZ6CHkKS0qeOUwD22YUHc
	/emVKj64gytOHYihF6XfktQxv2gyrrgTsLnw
X-Google-Smtp-Source: AMsMyM6ajSVWbd/FxUpUoQ1ZOvBIVinhvOUXmxuMk0rqeVnErfNHWIncVMcllpQA7WHwKfJdxz0O4A==
X-Received: by 2002:a63:411:0:b0:460:34da:df2f with SMTP id 17-20020a630411000000b0046034dadf2fmr607542pge.401.1665679043957;
        Thu, 13 Oct 2022 09:37:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d29-20020a634f1d000000b0043a09d5c32bsm3460615pgb.74.2022.10.13.09.37.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 09:37:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/9] qemu: Avoid accidental libvdeplug linkage
Date: Thu, 13 Oct 2022 06:36:54 -1000
Message-Id: <cc979908beec8a40a636d00a1fdcf2769358377f.1665678874.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665678874.git.steve@sakoman.com>
References: <cover.1665678874.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 16:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171715

Avoid accidentally linking to the vde library from the host by
adding a PACKAGECONFIG for the option.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8839e9540528b0b46c4fb4f95e508f038bcef8b9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3c0b34d851..cdd615997f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -275,6 +275,7 @@ PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
 # libnfs is currently provided by meta-kodi
 PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
 PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
+PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.25.1


