Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AAFC7619A
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 21:05:22 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.85138.1679605517717487341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 14:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ecJyytru;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so3172523pjb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 14:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679605519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOvKg3fkq6e/Ld367HNCUf9IS5+6OCC/OUlenJMx9DY=;
        b=ecJyytruQwN7+6UpOScEURe80x7XrRwB/TJ4S8vJHrKWdzqxgNHDhINzmhOj9rZrjp
         LOR9jmTzgnyonQW/cXsG7/PHdDt6XTe+XdA9PGJ+TnDtvXTbDJ2BuRxB2KivNzW0yHMR
         xCz/uoE/B5BhRwvWsvUj6iqt6XgN33M5kP2LksjIaSMceyrreVBA5Z/bc/ZsTDIk8WpI
         arx10yZVLGcvstV1bXh2+yhegrNCz8td1l3eUP18Ie936ZijRGLrZQdpjSnmaSRjJCH2
         Mehf5/y7lb65cl3fraj73ypihBzYMHFcDZjAKZF15GmBN2lpWuInPbDszfb/FE5qYwcW
         fymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOvKg3fkq6e/Ld367HNCUf9IS5+6OCC/OUlenJMx9DY=;
        b=zPvH4LRRiYsRILu1EkXI4g/lzRp8tLNfRtcY+MPGHfno3NvOCVQST6BSri0HGQdtX4
         L9RbEPnIKP+IbG1anMrlbQbgnKYUoTMnNj2X+k+nQnsnAcGrnt/bvVbGgXU2kO19DBpB
         61LqQyxhZP0ZZEGKenWjPduh5eeJsOXgNmgAinZk5Hm1uskqCZutajD60WQMXbeH46Jl
         jxnXZcosQLy7mcM9CRP950YepJNM/coVOuZVIlE9J2E2cDIzV3zBe3knlTvHM2ar8/0V
         uKUeAD8YLj6hOHAqjHFzQv2Y5ammP/tSaepRdo+DJs0T5AioS1BvD7UfBYKU4vUcCu6y
         DRdA==
X-Gm-Message-State: AAQBX9ePX0j/hbr71NUBzXLsUo12IBdejp3YtVUTu/oTIzy490JtKXpx
	d3i1mZ+lj5ua9mj9IifflrM9FCIX7HVNihLQuHE=
X-Google-Smtp-Source: AKy350YKFZHbUlgDq83R5efba11lLN3QnwOqLUQOwTudYx3VdLflRGyeKpx1bd2t0ntlzEDLMBy7sg==
X-Received: by 2002:a17:903:181:b0:1a1:f0ad:8657 with SMTP id z1-20020a170903018100b001a1f0ad8657mr251958plg.37.1679605518765;
        Thu, 23 Mar 2023 14:05:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm12760417pll.88.2023.03.23.14.05.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:05:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/14] systemd: fix wrong nobody-group assignment
Date: Thu, 23 Mar 2023 11:04:42 -1000
Message-Id: <08ab1f02da65ee9815115e6a1cdb51ffed10a2dc.1679605352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679605352.git.steve@sakoman.com>
References: <cover.1679605352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 21:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179008

From: Piotr Łobacz <p.lobacz@welotec.com>

The generated /etc/group file had a wrong group name for nobody-group
which was nobody with same id as nogroup groupd. This was leading to
duplcate groups, with same ids and different names.

More can be read on this link:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=11766

Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d69fccf2e5d108dd7c6059310924588d36a45865)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_250.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 5405e4b6b3..784a7af271 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -223,7 +223,7 @@ rootlibdir ?= "${base_libdir}"
 rootlibexecdir = "${rootprefix}/lib"
 
 EXTRA_OEMESON += "-Dnobody-user=nobody \
-                  -Dnobody-group=nobody \
+                  -Dnobody-group=nogroup \
                   -Drootlibdir=${rootlibdir} \
                   -Drootprefix=${rootprefix} \
                   -Ddefault-locale=C \
-- 
2.34.1


