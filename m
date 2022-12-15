Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09395C25B04
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:24 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.143557.1671132076966356878
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vorL1jUZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id x2so6576561plb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1LDCyCk7ttvN5a7XtBcqG217gurymU2gtxoVtIio98=;
        b=vorL1jUZwoumFXMwnK9liAWClnDG4ThU3v+MGtBKzGRgPagvVDYdZ0MBwbqcFC7hUy
         d2mb7dnCAyyryF+iCxR7655txTWitICiYwaljTD4s5MbTtayk2JAt5a2ceuIYUwnmef9
         NppiDcykduatwosvYfauvkMrIbm6W6egNcDvmnbyh5yfU0OJNYv7ULp3Z/PJKYDC38NG
         WcB59IvqnraMiqd2hNJJDTpeQ1tx7cLAutJ8GuXfnZxq8GofsEQ9aWw/6DUFlMtDcH7R
         pGWy2YDVWIFr0kH1iCr+PrK75nx2oW5dmR3YJc/tr4JWG0uQonBo4xL+R/jVwR/tfD63
         2zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1LDCyCk7ttvN5a7XtBcqG217gurymU2gtxoVtIio98=;
        b=upJr9tU6BqYmSyi7Vjrsuc2D4zU7ZY28As3KWrYUpvidPqdUJCCEgnJv1zsOyBNglA
         1yFYkNH3jDcc2kIz0cjfFcbZkKN08R0HEiLqZIwaeXFEdMHMJKzbGfVKkpFipleDjH2Y
         3TwcZIsi1LFmZ7XP3mvynkzqlOhQXJzDmcYVEjpzkGX/MYFhfHnwj7BSYdxWiCtCFmXR
         PFX6CHJu17h6vH97Mux7QAUeluJQox00EYcFWztFA9awk5KKQ5HCxBfvNcPW+speABub
         f+Wta5EnCp2OstSPCjrPoDrJNQCPEcz1MxSqce0IwJh2+3Hn4ncCpwhObSWwwQTmlWH7
         WuOg==
X-Gm-Message-State: ANoB5pk4R2Bja0ZuYmoZb8enGOjumqv34/Ll+zNIkOmJC3ESb8oo9ulZ
	Jb53sH9TrfPQkRWIrIXOxE3pI7ElGqwStmlyqXs=
X-Google-Smtp-Source: AA0mqf5H3YJwaNXcEpn8qDEamsonOiRgNj/glFBivr0Ic+eri9cq/XvnOD8/sEuTubm29gBl/GVrAA==
X-Received: by 2002:a17:902:e194:b0:189:aab9:cd80 with SMTP id y20-20020a170902e19400b00189aab9cd80mr25703898pla.64.1671132076042;
        Thu, 15 Dec 2022 11:21:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/30] opkg: Set correct info_dir and status_file in opkg.conf
Date: Thu, 15 Dec 2022 09:20:32 -1000
Message-Id: <2c7284c36398078b38271412ec3b2a457c197a5f.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174600

From: Harald Seiler <hws@denx.de>

Distros can customize the location of OPKG data using OPKGLIBDIR.  In
OE-Core commit 11f1956cf5d7 ("package_manager.py: define info_dir and
status_file when OPKGLIBDIR isn't the default"), a fix was applied to
correctly set the info_dir and status_file options relative to
OPKGLIBDIR.

However, as the commit message notes, the opkg.conf file deployed as
part of the opkg package must also be adjusted to correctly reflect the
changed location.  Otherwise, opkg running inside the image cannot find
its data.

Fix this by also setting the info_dir and status_file options in
opkg.conf to the correct location relative to OPKGLIBDIR.

Fixes: 11f1956cf5d7 ("package_manager.py: define info_dir and status_file when OPKGLIBDIR isn't the default")
Signed-off-by: Harald Seiler <hws@denx.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit adb939ae3635de6e02208859fbf29cf0ed39f565)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/opkg/opkg_0.6.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
index 4cd589cd29..53c7399929 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
@@ -47,7 +47,9 @@ EXTRA_OECONF:class-native = "--localstatedir=/${@os.path.relpath('${localstatedi
 do_install:append () {
 	install -d ${D}${sysconfdir}/opkg
 	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
-	echo "option lists_dir ${OPKGLIBDIR}/opkg/lists" >>${D}${sysconfdir}/opkg/opkg.conf
+	echo "option lists_dir   ${OPKGLIBDIR}/opkg/lists"  >>${D}${sysconfdir}/opkg/opkg.conf
+	echo "option info_dir    ${OPKGLIBDIR}/opkg/info"   >>${D}${sysconfdir}/opkg/opkg.conf
+	echo "option status_file ${OPKGLIBDIR}/opkg/status" >>${D}${sysconfdir}/opkg/opkg.conf
 
 	# We need to create the lock directory
 	install -d ${D}${OPKGLIBDIR}/opkg
-- 
2.25.1


