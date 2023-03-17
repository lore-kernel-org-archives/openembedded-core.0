Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E1AC74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:43:19 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.466.1679092964067638986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=T6yYu4x4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id j3-20020a17090adc8300b0023d09aea4a6so10702419pjv.5
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jz24XVCm6K/zhtLvnkLpTl1fFzh3MArpCY1+bgsFfCc=;
        b=T6yYu4x4AC7Pf6fyY04/u1YXFI7VjolGx/W/ma0iLp3EVg/GhlWOajLuNXVplMbo5S
         tYXnpxDhNBVPwjxf2cUU0vz5BCLObVDu93QD3OIf4NUnxmGqheX0i/wuNnVEH9yWskk5
         KXIuxtkye3uwkjO0chE1hKPHr/VQjyb1n3xVqgVRGa31r30rPranxafAvjLDzceIGQOF
         /CkjPyIbCxmZXMECiY8gMC5PvE4RxkBlEHeVVwfQwVxgwhewQ9X/p6gAqfjout47SMAd
         AzeahMZoXrT8RhMr1eCAuoBAGvQCywORhvTK6Kq1Jhut3RIR7uBSSy8XiVEmXLQZ+Uc+
         0Aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz24XVCm6K/zhtLvnkLpTl1fFzh3MArpCY1+bgsFfCc=;
        b=FXapRe+zhZwlsBf90Qvl9BwxSEZg6WMvR8/kabZ7d5Odm6wGHCd04Y9xW6gOMPEZ04
         MtopvGj84/TWfHgnN3MVcjsJj0HmL70RjTyMRCPnMtJ3+J3GS7HQ7otHFnO2TvPej4h+
         ZPEPrPPMKCx0JVr7RjdD4VLFSMLRb0ziUdtrrVETi0IwJ1McaC5GgJ3LXS+XDMNSTi0F
         rSxdZQU8vWZP+HNrNcYAFapT8rwLfylOjdDBVG63cvtY+LAjaRsZfEjaFeaf4evilvtX
         jk9E8i5u6qVje/dx5KZuJB3u6JJcOa9z2nidKdeQ8xQ9qJxwLlGYQLndZTAP15D4J409
         u9Yw==
X-Gm-Message-State: AO0yUKUkohzTp70Qu2J0Ceo5c7bGFU+xtDHk+rHwWw6170NyGKY7RIui
	+8QVDsvtxLKCcViF+izLvjqbvVOsNwNgS9nBvxg=
X-Google-Smtp-Source: AK7set+H/zpZeISXuSddeLCOzy3bGdLJWGtziw7I93uN4oSi38ZsW7dJucbeIljaxODK2ruLButGMQ==
X-Received: by 2002:a17:903:41d1:b0:1a1:97b5:c660 with SMTP id u17-20020a17090341d100b001a197b5c660mr5303747ple.20.1679092989529;
        Fri, 17 Mar 2023 15:43:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.43.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:43:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/21] cups: check PACKAGECONFIG for pam feature
Date: Fri, 17 Mar 2023 12:42:29 -1000
Message-Id: <7b23927a72a1f8b91802f5b2ca10f2cea239bd47.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178776

From: Trevor Woerner <twoerner@gmail.com>

The cups' PACKAGECONFIG is populated based on DISTRO_FEATURES, but a user
is free to enable or disable PACKAGECONFIGs at will. In theory it is
possible that pam is enabled globally in DISTRO_FEATURES but disabled in
cups' PACKAGECONFIG. Checking the PACKAGECONFIG to determine whether or not
pam is enabled would be a safer check rather than relying on DISTRO_FEATURES.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a053dd177ddc99ced11e68914079be0ffe261262)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index cf06c9f1b8..714be4b26c 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -75,7 +75,7 @@ do_install () {
 	rmdir ${D}/${libexecdir}/${BPN}/driver
 
 	# Fix the pam configuration file permissions
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('PACKAGECONFIG', 'pam', 'true', 'false', d)}; then
 	    chmod 0644 ${D}${sysconfdir}/pam.d/cups
 	fi
 
-- 
2.34.1


