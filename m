Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6368CC64EC7
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:43 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.5.1676236284015063975
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vlKKk/iq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id be8so11624891plb.7
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4fG1zDasFq9AIW8B/FmwXNhucxZABRm+xKCKb6qm/E=;
        b=vlKKk/iqaeX3O2lPxOQyAYdUQiqWpLZRQEFv80/3hOxF/aBxpgWI0mhbMQ3a8sShFK
         cR8md8F304vGhWdi32wy6CL3FbrFFW4jixeFvN0fIRPR1JOsJrsPxdaXQ2i4bhHoHmrN
         FN3F852rGSjEa41fkXyeVeTi9NCXqYVWG4QQ3LouN0cEjcK58eZFZ0tCrncprhgO1Yd4
         xuPIbnUoTRHWiN7E2twuvfNiZv4aX/7R6ZXrauTXTOQCx3bMuUVui7wf1pEg6LymkEm+
         w0oH40oAx+wu3cna/Vcps0OMWP7FCxOxqjoPM5MBDnqCvVSSmAZKZ/Pl4QXIUUSPyL8s
         6F8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4fG1zDasFq9AIW8B/FmwXNhucxZABRm+xKCKb6qm/E=;
        b=VzhdZr90EwyNyjr9XhddVj0aRrY+n/mM7PxLI678MkI4B5IljqtLxXGwVyGNuhYJ4P
         wqSgWeqetyZix4MXWTqB1bZWWp18AkcpJRrC8wtY8eXmqdm91GloPTxra29LkhaxKEcu
         r/+O9newjy/q+BbI3GscovHWqwKTjNX6XH02O+UYu6H1mQ706sYtLLscFHwh+dqQQmxR
         W67uEw9atIZSyJV2zmE+G7qtQl/vU6cUIeGPmeFgRp6BX37qR7tBup4SUQQ36zdw/SJO
         MC0l3XiDFM9U0yCrWTaWcmbkF+N4cvX2xVd0ik3i76C5AIRhUFjN3ui5IuPr8k1sGjh3
         Bytg==
X-Gm-Message-State: AO0yUKWo6kmW1dnwZZ+kpgzAATyCyu6LU2DufXwu/3LrPnbra30rpMje
	9smzc/yRmUHb2jn3giTl1rJUYnnkYnUm4in7kqg=
X-Google-Smtp-Source: AK7set9VJDYEO4cuITMqdP2zU9w60Xfe2N0uP95jAKSyd2wMOkYrGBqPpabh1FGJvdiuhuZFb7a0rA==
X-Received: by 2002:a17:903:32d1:b0:19a:9686:ea85 with SMTP id i17-20020a17090332d100b0019a9686ea85mr4582654plr.17.1676236293991;
        Sun, 12 Feb 2023 13:11:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/27] libc-locale: Fix on target locale generation
Date: Sun, 12 Feb 2023 11:10:39 -1000
Message-Id: <258115c2a7d78f0416f952122c9448a805dab08f.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177066

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If on target locale generation is used, it fails at first boot showing
errors about a missing directory. Ensure the directory exists.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f2844c9f1bbb729562063d96a3d1cc9d44dafa0a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/libc-package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 13ef8cdc0d..baab8fc9a9 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -45,6 +45,7 @@ PACKAGE_NO_GCONV ?= "0"
 OVERRIDES:append = ":${TARGET_ARCH}-${TARGET_OS}"
 
 locale_base_postinst_ontarget() {
+mkdir ${libdir}/locale
 localedef --inputfile=${datadir}/i18n/locales/%s --charmap=%s %s
 }
 
-- 
2.34.1


