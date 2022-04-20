Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568EBC5AC78
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.8037.1650463738195736984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gVxK/3Ux;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id a15so2009702pfv.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=k5Cz9Vf2l/e8Lq/UUf13A/ezUo5CcgBq2MpycrEc/Lg=;
        b=gVxK/3Ux0Fa2DMHAn6j91Rfkent6wkrznpqF0lvX9XjhgfEOfz3o/uHOyj+l/KA/Wz
         ubESKfYiX/DByolaL5hfCDE3/4TPDr4VnF0odlxKeP9NoDqVQS0lgzy002xkjw2WuRpl
         GBKM9d3a5CoaAdAq0SQjPStngzmCwNXxUVpGogENyx+Nc4cGiST4yjwy7f7xJ30cp4Nm
         w9ACyW4SgGf7Rt4ba3C7eGuDd5X27j9/cyL2a3wUwwVOaBPvrBtPDvSCXO/oMkr7wEzY
         +7oSH76ywsjDVYQmpy5GxQOtlYye9zO7TUmbgiDBKs7VABwhOjtmvBOC2/WrjfJMitb2
         upSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k5Cz9Vf2l/e8Lq/UUf13A/ezUo5CcgBq2MpycrEc/Lg=;
        b=uKE0s+HSdxf1XVdXPKLHxisbWvLbh6WN0I+IA9umZIV65KY64Er+xt22XDXzUyALJb
         21/lfZSUB/8oY3sD5QBtm0UJLpk7RYpf1VkkO7Xq8lsd1jhiCtojxfCmyMKZt/v/liSU
         BSUL/yAA9VqNhU0ba7nIywBYxJIRs6b078hGg/SMfjKiCdlpBDKal0uA9vFqGYEvKh9D
         s9b8z9LOEGR2X1kAQdjFdtrhg3LAiG2AYY+VeUieOl1Kt8bGf+XRfHw9ixqZEqI2ff9c
         ex9U71KMcHhA5bWGbsUkl0JgKfiDkfhiIEsjOQ23sqlFVehMfKPx1gkZxueRtHzmJgdx
         XGwg==
X-Gm-Message-State: AOAM532BnTyo5w8AnmfWBvQ3D7huiKKx0Ul/S8iS4oJ8bSOakhdUiS3d
	y3msQQXQf42WK9fgQUcm0ayTM0YO2IYz9MOgk7Y=
X-Google-Smtp-Source: 
 ABdhPJxiFjcLr9O2ZW8C9AVirlGDehbmTTs9LV8SQs9Aco5keKYNvou8Y67XLbC7HVDN2TE2MwE5ug==
X-Received: by 2002:a63:3f85:0:b0:3aa:2cec:57e4 with SMTP id
 m127-20020a633f85000000b003aa2cec57e4mr8781797pga.314.1650463737302;
        Wed, 20 Apr 2022 07:08:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.08.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:08:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/27] mdadm: Drop clang specific cflags
Date: Wed, 20 Apr 2022 04:07:57 -1000
Message-Id: 
 <6af90dfefc043faee90c8ddea9fa0eafa6fecd0a.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164677

From: Khem Raj <raj.khem@gmail.com>

This option is no longer needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8d7130937ea4e47f0fa4d23c1c8394e3ca3f939b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 1c2fc8c37a..19035caaec 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -35,8 +35,6 @@ DEPENDS = "udev"
 SYSTEMD_SERVICE:${PN} = "mdmonitor.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-CFLAGS:append:toolchain-clang = " -Wno-error=address-of-packed-member"
-
 # PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's asm/types.h
 # prevents 64-bit userland from seeing this definition, instead defaulting
 # to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get
-- 
2.25.1


