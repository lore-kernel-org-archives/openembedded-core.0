Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AF9E77183
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:08:11 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.20311.1734012486915693924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Y+oZQsTg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21670dce0a7so7181915ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734012486; x=1734617286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCShGml12r/vyCIX+EJole9G3fqfJvOaatxMOZOPngk=;
        b=Y+oZQsTgsOxjOSRYyH3LLGgtrzKRqh/vNlpzY1Vuc97agYEgoN84v/hYFTheGZgp9T
         i7wx2dPVet4kHg2MncMsjY8PfKLELY/wsQjvSUVcU7n2F+oja8+j60JLA+tIefcMt5gY
         5QRlZG7IIaS3+GDI8aTjUWkDxeXd1gG2zGzUwATQNJruuBiUuwbXAGSlJT/jCPmthT+L
         awqanBU2fVOSrld0f1qUUntxLq15YP3hu9/R8Eb1n6R1IKbG6+U3xQWgJi+r45KBl/F/
         fvLoVFspq+6wUHXp23jP2MN+u20AQx+hgfc8nlIZVZcQiHvDonLbZ+xryDs1OkxtIEXu
         9zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012486; x=1734617286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCShGml12r/vyCIX+EJole9G3fqfJvOaatxMOZOPngk=;
        b=F0rJm1ncTB+YnQsHKT5KHJ5Ml8lAb/SUZnSf6tl+B7TVtEyyjD8A3sXcKDmHv4tfjC
         5bi2hZYRPwOxNznp7XN+nn3hdOwIM8CSbbjX8rH+ZaD0XrNiEe8Z2ysK4BFZWm9FqeTq
         Dx5q7onAeNB8bn0DncRyKKtx7rjV3/UHgpdq++JTeBeq/QMpFEBRTthMBxLBOxWXrJAO
         YuNpP38FiPtTAo6hEvRqY92cAoKJN03Es12wLzWScpth8sQ7F5ChJPwUnFjg5U4C/zsk
         65qtOIoyuHHeq+Nr2NUD4Qy3ZA81o4EyzGDd6hjNM/v01hI7zYdkAopZjpFWgnXMWvRg
         k99A==
X-Gm-Message-State: AOJu0YwJZMnYBz3rqhH8FEngSsf7oMwiqLGEPs0zuWvFFSr9RLsJLvfR
	IU/SYe3MRJI4rzhDdnGgzFtZyaDBAVaecTed3Bl2ostNz6TzPh58jhLzgZChsT5l999kuEQlZvZ
	G
X-Gm-Gg: ASbGncuqPghdpLq4l0UL4V0daMiTCFo5Uw7qWQssf4VrjnRd5QqLkY6oNTMPQvifEXf
	zBitBdBatZXQ/HUtYjT4SO9ivwZPHca2Yps9dFAIO533dkWiFQ/JwAyZ0aDhv+SzQiPzeVBGtaj
	/hdH5kHhcFTLEYO7OjgvNFNjU9L6b5IvxtOO28eT8Z3WD0J2e+QgzLw0+Xa1HgK30NwHhefR2fk
	gq2Pcp7lWIuSm7pe6dMpDZXZhlN6EQbsDQhv5wZegs1Ig==
X-Google-Smtp-Source: AGHT+IGD2dhxVtdwKKma7sTfUUYTqyfnD2xX+VFQbdhxF934hqM4Hwl0yikJ72Wp1MwESJw3CxnvPQ==
X-Received: by 2002:a17:903:41cf:b0:215:b9a7:526d with SMTP id d9443c01a7336-2177854ac96mr124965195ad.32.1734012486132;
        Thu, 12 Dec 2024 06:08:06 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21630fee27bsm88847705ad.269.2024.12.12.06.08.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:08:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 01/12] builder: set CVE_PRODUCT
Date: Thu, 12 Dec 2024 06:07:47 -0800
Message-Id: <18773170492fc01ce7123ba0fac88e58750a3b93.1734012352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734012352.git.steve@sakoman.com>
References: <cover.1734012352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208635

From: Peter Marko <peter.marko@siemens.com>

Builder is a common word and there are many other builder components
which makes us to ignore CVEs for all of them.
There is already 1 ignored and currently 3 new ones.

Instead, set product to yocto to filter them.

(From OE-Core rev: fd4ec5a5318b36af0a9a0a097a5b1f1de44a8edf)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 7719b783c2..39abaf31ce 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -29,4 +29,5 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session.sh
 }
 
-CVE_STATUS[CVE-2008-4178] = "cpe-incorrect: This CVE is for an unrelated builder"
+# do not report CVEs for other builder apps
+CVE_PRODUCT = "yoctoproject:builder"
-- 
2.34.1


