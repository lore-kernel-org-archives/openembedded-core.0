Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4CDC25B07
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 22:32:51 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.1004.1660170766595357990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=8XDfYhas;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id f65so15559645pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=RIAbbfg+Lz7EiTuuC9e0GI3ImWNxgFh+w39D2Pww/9E=;
        b=8XDfYhasw4LXLrSpOUqHVjgMBTX7SVyHUtwuKSbyn4BgA25WG3FfbKZmjaib1WIvxw
         lauYC8ojmkJdsJon24QxW8d9k5fsHMHBhcTupCCI5MwJ2VqGU3YV+Rhfu1/3aHruYkTJ
         1f19WTiiR9qcGzc4YCr6f2ktX0HZbJHJ9TY9IRt3B7rcLJmphM1eaRKPvir6hfkUSz7M
         lmNhUwevDc9NRHNaHrdmE5+W37tyVxLQXmmHDbKVhCVe4hz+pNHRIfnKmcQS3HNw2OPk
         BIzsa/FZn8QuWvCCVTDCX2OqPGX4efWkmnKlahGD2Bk4wD8Y/shNEFCfFbQY0ww78gOY
         AA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=RIAbbfg+Lz7EiTuuC9e0GI3ImWNxgFh+w39D2Pww/9E=;
        b=DZE1unBaIUsjVlyjZ6ydkmF+Jqz5cGsjhP199FkUhvO6nBN3HbmVDDrcHovAjkVnuc
         Mpz6GmldfSEYzL1PpSAIHRSC8JQc0glhIddYnKhbqze5FtkNQ4u7ZZl3gveaggfHT8oP
         +ocn7d+D7Iqc3LPFExcISovLXPL/bLGAA9uPke7WPsfQPLqSiS1O1wzH40S/rRa5+mdB
         /Z5RRZppCYMn9fIDjNl9c4GyoqpZgEU+Zt+te2bpZzFM9vxb1nzdtNp1sWmoqb4FtbNN
         yiokknSreKBlD8SCtoS2VIOp5IhAeU3sQr+vX9x+coa0ILaPozs82wp38SWIk82MCAxQ
         7f6w==
X-Gm-Message-State: ACgBeo2DTA0/I9qelyiEpPrGgFfrEqMZoX9g/Ie+wqlR+WEaaMGUdLeC
	vRIyXOwcF6LgxQrwoUSIQ6JgtpxAty1jB88T
X-Google-Smtp-Source: 
 AA6agR7Gs6dKyNGjhabUvBpGwoJenqJUlaoFpNb7heDOVtLsoUm9eUpfkipNk4UXE4knFlZYZkHQQA==
X-Received: by 2002:a05:6a00:1910:b0:52f:13d7:44c4 with SMTP id
 y16-20020a056a00191000b0052f13d744c4mr18262002pfi.32.1660170765667;
        Wed, 10 Aug 2022 15:32:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa79ace000000b0052d7606d144sm2532513pfp.74.2022.08.10.15.32.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:32:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/11] gstreamer1.0: use the correct meson option
 for the capabilities
Date: Wed, 10 Aug 2022 12:32:09 -1000
Message-Id: 
 <ac6ea1a96645d2a4dd54660256603f0b191bb4d3.1660170592.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660170592.git.steve@sakoman.com>
References: <cover.1660170592.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 22:32:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169224

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit baeab0f51ecc19fb85101c4bd472f0650231d0de)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
index 236d6034d6..966a904eef 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
@@ -41,7 +41,7 @@ PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 PACKAGECONFIG[dw] = "-Dlibdw=enabled,-Dlibdw=disabled,elfutils"
 PACKAGECONFIG[bash-completion] = "-Dbash-completion=enabled,-Dbash-completion=disabled,bash-completion"
 PACKAGECONFIG[tools] = "-Dtools=enabled,-Dtools=disabled"
-PACKAGECONFIG[setcap] = ",,libcap libcap-native"
+PACKAGECONFIG[setcap] = "-Dptp-helper-permissions=capabilities,,libcap libcap-native"
 
 # TODO: put this in a gettext.bbclass patch
 def gettext_oemeson(d):
-- 
2.25.1


