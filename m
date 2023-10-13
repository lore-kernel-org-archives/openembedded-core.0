Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD24C41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:43 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.51157.1697234019251164069
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xMqXln0Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.54, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-57bca5b9b0aso1370406eaf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234018; x=1697838818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X56l/nWnxst38DwQgYBqp7w7UkVS3AULmIt9mDpupkI=;
        b=xMqXln0ZS0fkK4SiDUF8U//wQe5DDoew93Fa3mQopv6OxzwXqu7gKW2hLHankB6alG
         ia4GYnQodV/QtdOUDR0fnbSUeNkPu7tMIP474QIaCjsnXsTK2zHP38I3wVbji2I5izsD
         9t1frGplmWEjr9d+bVvod74Vbik5oEc1H2YiGm5Wrkhy1VjJcVYqpUnA4NEI0xcCKzaS
         rpI+3LrskUM2RtWghhlwR1qF9UKcbyqiG2fCm9GoOb7Vpi/amRAWh4pKOkKBnj/HJxa3
         coKn5kbp1/iZiRp5l6L1M8CqUkSqkiT78+jPTt73nNxu8eFC7dvIgz23DZx1amBmk9Lq
         jNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234018; x=1697838818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X56l/nWnxst38DwQgYBqp7w7UkVS3AULmIt9mDpupkI=;
        b=uId7EvOPiIuMJzqwfs2n/Pp0E9mO5vIrU5LTHzlTuLIV0dr3eOoD1u6o2xhV5o47wP
         MrlGVM6kHkLIezF1m5rpxxwmlGvw8d0eqKHGSWERqRURy+bGMpYFEhoOPem6U2DTDR9i
         JZS8YPs404GP4gUHTRN4ZKu/aIY4o04BuUSc3UpG6NMrZ4ErwZ1bAgmSZzlXYLwN5rIl
         GXZDJHlL6/EPjnYo1kw1i+APIEX+YdBXm/IdYqH5Q1Z1MY8VNp/bVf+xNeKKXdmqdrHD
         YXxi+2nPaUgAHN0KD2QW47CoWEtKar7hpYZgDjRt9oe1lAcE0aNwAIlOaDAIq4XaYkzi
         Qtqg==
X-Gm-Message-State: AOJu0Yz9trhIyosRq5K0X+/sd2YBWSXCQQOYzQimvu+5KijDHGpwGuSy
	dQYcwTOW9/VoQm4SIFJ79m+bSju0Gi+BSea/m/Q=
X-Google-Smtp-Source: AGHT+IGYQhXIWasT3zHyW/G8XgmcRy57yMXtO0a4eAM9pBLjx5L9cn+74xCKBFKTvzemU3iAlZjJNQ==
X-Received: by 2002:a05:6358:3396:b0:132:d32d:d929 with SMTP id i22-20020a056358339600b00132d32dd929mr30608594rwd.20.1697234018134;
        Fri, 13 Oct 2023 14:53:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/27] igt-gpu-tools: do not write shortened git commit hash into binaries
Date: Fri, 13 Oct 2023 11:52:44 -1000
Message-Id: <e0cdfefe3054a2278f7db5d382045304b710118b.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189097

From: Alexander Kanavin <alex.kanavin@gmail.com>

Shortened hashes are prone to collisions, and in this case git
lengthens the hash to resolve the collision. This in turn breaks
reproducibility, depending on whether the colliding hash is present
in the history or not. This has been observed here:
http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230917-br60if6q/packages/diff-html/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a74e1eff93d4de5724481e3298308a6d925a4512)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index f4799fbc77..6bbc601986 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -26,7 +26,7 @@ PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
 
 PACKAGECONFIG[chamelium] = "-Dchamelium=enabled,-Dchamelium=disabled,gsl xmlrpc-c"
 
-EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dsrcdir=/usr/src/debug/${PN}/${PV}-${PR}/git/"
+EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dsrcdir=/usr/src/debug/${PN}/${PV}-${PR}/git/ -Dversion_hash=${PV}"
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
 COMPATIBLE_HOST:libc-musl:class-target = "null"
 SECURITY_LDFLAGS = "${SECURITY_X_LDFLAGS}"
-- 
2.34.1


