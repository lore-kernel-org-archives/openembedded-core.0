Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341ABC27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:27 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.46654.1674657746634631299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3LrWU6as;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id x2-20020a17090a46c200b002295ca9855aso2249898pjg.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zAHIIOldCcvGfY4edpHBaLZ+nINO/yg5dj0XGcQ245M=;
        b=3LrWU6asWXy5NbQ/VL4d8IqoTWe+dv01dqPqzMXk/2s6iwz4CorOXQX9ctNxiQCHau
         aNmprciJ8gIpzbw4QXBx0JXOK1kw3AzlDbQkFm2W5lkThPdmPLIwoKTbZkLam6DFU5jz
         o4mWcv40IV4vPfKin4oPAqfYXCrpi6M/bFwvUUOVZTnWMvt+HLzDRSZTyNlpu/aJeLjG
         Xn12bKrgO7Ia542c3ZLud0Z7BsQKeGD5f8HxLPigiNsJhAu4Y1gEr3SF3++Wnogyy7Ys
         kLMMAhOfndwoOKXCh1fk2lUyQaxHnLwjUjn18S5pZ5iZYyyTsRQbYryEjFem8zPPzLbu
         IYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAHIIOldCcvGfY4edpHBaLZ+nINO/yg5dj0XGcQ245M=;
        b=IDiJ/81jFwcm3Ob2jZW07/HLJtKKJDFTyNU3TSogNMoDym7iyAJvE1vhFA/HYqTi2s
         Jh72o8eeJXGTAQk0hj3v/dYNjFJcrHfqXuFCHauxw2Idmh1VRSKFaoSTSgGiH9Trsm2l
         WLAf4pYB6yfkC38T+2zcJwqDw0oZPwymBoj/uXtKJEVmGNSqiXsWCi/bP4fqfnAMc3po
         a43cZLezE3qMDVXDo3mKOXGf2lEgCrM8Y8siHP7wYhyANPxI4hSj02ZNeWkcY8/R4AT4
         fF8fJA3LmbBB81WM/9+jfHkFkB2Ej3+rSSPdtC4xcWH3edItrT00VC2ICyByQzO3Fvv6
         GAxQ==
X-Gm-Message-State: AFqh2kozRjTCoYlrzJIqA0/5tis+4dUUqFX4THlDIuybNkABfkPhHVVI
	uVff/pOzBg7mfUUk4qlwUjzIaH2kqEqkCVaV0sE=
X-Google-Smtp-Source: AMrXdXtHIvgXGGATcx7P1mCxiDNO9Ub+yIzLeMo2hblDtrRtvPX5XBDOUugjUpBSac0m0+UMU/+Mww==
X-Received: by 2002:a05:6a20:1b28:b0:b8:ca34:fd5a with SMTP id ch40-20020a056a201b2800b000b8ca34fd5amr31112175pzb.47.1674657745481;
        Wed, 25 Jan 2023 06:42:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/16] linux-firmware: upgrade 20221109 -> 20221214
Date: Wed, 25 Jan 2023 04:41:53 -1000
Message-Id: <b18b005eea839af8e38377f3d279a7d45d02571d.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176361

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional files

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 15f3a9f6c4406ddc00f7dc0ca7e1beafe9c71a9f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20221109.bb => linux-firmware_20221214.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221109.bb => linux-firmware_20221214.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
index 8c132c8f34..e3105053c7 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "ab4ba608dc4b757716871f9be033f0f1"
+WHENCE_CHKSUM  = "bf7c716d16e48fe118c6209f99b13253"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c0ddffbbcf30f2e015bddd5c6d3ce1f13976b906aceabda4a57e3c41a3190701"
+SRC_URI[sha256sum] = "e793783e92acbde549965521462d1d1327827360664cf242dbda08f075654331"
 
 inherit allarch
 
-- 
2.25.1


