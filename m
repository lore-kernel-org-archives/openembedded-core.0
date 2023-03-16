Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C50C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:46:04 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.5087.1679003154637938665
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7mM9gS26;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id p20so3236554plw.13
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kxx1b/DIRh1oAvqHN+2l6yrCVrTpHEKcJ2JQw8CdSZE=;
        b=7mM9gS26AHbXTbiIa6GGbHckQCKmpkj5hyr2T3JuuBj6rS7Xjfbkq8CDaneOCY3EaD
         AcUA+QwMdKMUJIQ25GSmXWIEWbUeYTesIK/PFl3tg1x7SUW7x+xmI2YW2bxaEkSB7EU7
         ebdwyphLATITBZodWUNccld3bvwW3xUCFff8ODOHU3JSmJ9u82YIy7BPMf1Qq8M9zOhg
         LYQkIaVHYmgxU+DXA/Tg3gTcqvEIuVrhwyYqK8z6llpD8WAkqtzd/cBitBDcevPhld7m
         bRgZT4/DUV0+BHi71WYuTPKDDpM7/aWG0DIn2YbMUYM5I2hmqYO4x+BAsoyZ/E/pUnYU
         Y2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kxx1b/DIRh1oAvqHN+2l6yrCVrTpHEKcJ2JQw8CdSZE=;
        b=DWsQUua/pIYBVN8Uc/GDQtjPCuMKG7wwVqmGnS01H1dlzmgRuPN7O8XweU/PAyrYC5
         KZMGtsj0Xl+TgXcv4xUp1qXBgTTTRxqLz4vZpBinzowUjs/5iuYVPovEnQhBhrVWkJDr
         n9Tp9K+TDwQi2m2jS1OVF1A/RbIiAIaGEUGrGFylkB2uKHDKkZNru0TXwGM/2N84HYev
         liac16osxkK/uw6YHKc0dQsxSsRtIQjPoODnU7E05zAlhOihcqamTROEqs/Dqa/BY3DO
         EHBDcJVF1vN5lV2DS6OsdtANzl/BY0MynSmR3b5XU6Z20CnE1ozYhA4Wu67/QX4s1HiP
         vLBQ==
X-Gm-Message-State: AO0yUKWc2lijb2URg6FYomZImDw+Jw0BHWAKA/hp+VgoI4+PKXWL3Y9C
	RI3Cu9k2SHOrKCMNXe/vET75ePO3A7eFamNIxdc=
X-Google-Smtp-Source: AK7set/M2mSDItS6uNYd0bTcoINLAyrTaVth/xc7Dhwy45TsvzuR/gmNrKlzcHAw/kl7IftX5u9nLA==
X-Received: by 2002:a05:6a20:1327:b0:d3:72c6:b018 with SMTP id g39-20020a056a20132700b000d372c6b018mr4067974pzh.39.1679003153528;
        Thu, 16 Mar 2023 14:45:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/23] cups: use BUILDROOT instead of DESTDIR
Date: Thu, 16 Mar 2023 11:45:11 -1000
Message-Id: <992c571fc2f69c62d8f916440251a5189fae3aa1.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178725

From: Trevor Woerner <twoerner@gmail.com>

The cups documentation is clear that the correct way to install into an
alternate root directory is to use the BUILDROOT variable. From INSTALL.md:

	Use the `BUILDROOT` variable to install to an alternate root directory:

	    make BUILDROOT=/some/other/root/directory install

DESTDIR works, but we should use the mechanism the project specifically
created for this purpose.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f8fc70674e0ea5df46969a06da62f8ed135cae4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 9c920bb133..b8b655a4fb 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -66,7 +66,7 @@ EXTRA_OECONF = " \
 EXTRA_AUTORECONF += "--exclude=autoheader"
 
 do_install () {
-	oe_runmake "DESTDIR=${D}" install
+	oe_runmake "BUILDROOT=${D}" install
 
 	# Remove /var/run from package as cupsd will populate it on startup
 	rm -fr ${D}/${localstatedir}/run
-- 
2.34.1


