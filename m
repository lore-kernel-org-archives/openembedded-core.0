Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41751C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:03 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.7346.1651727155417544331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hFXlBcw1;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id p18so3901289edr.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gk980eh16vdOEiMSZmvgFKdmQyPza3BRRZejaUp5+vY=;
        b=hFXlBcw19Lx81G1c9fxAzcLU92EH+0QLDEaJrsfpWkr4av/375llFQr4VWih3wBrkJ
         Zy9ZT1AmOenaR+nIQDZ2XWuLi5/B6Kby4naF5M3zHeanL/qZHqy9oBGtrTF4rDSy7Cmx
         pHAYGjKMZMvF4nOPvD9WO1nCKOYgRQecGG09uIF3eF67MxQbamEISLrK6mda2p2MbccH
         99INocxL+0XLAVtyptAWL5b4LUQSbKmwJf9aODH3gzXyUhqDSYhPD7mF4AuYuRnk9B7+
         p6vVC0fOHM3zjeTHx5irEfgZP+/r8TsccfUFEJMebGG/0vbByQlj2prhTWZbJeqSbrz1
         MHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gk980eh16vdOEiMSZmvgFKdmQyPza3BRRZejaUp5+vY=;
        b=hAGioP5UjL/ectpoFDxeNzQNC6dJBB1U1raS22ipVEushZmIZFxcI3IDNJy4sAtpdV
         L79IiADudBQczyB1sHZ9MIWn5HgVeL/2/JxhbYNNGg3NcIgGkSFGRhb9K01H+lXSl9jd
         DTOJiQPF4NAJByyx3z1XeXPZa+t3v9Z9b9PE9aw+MK68GGuY9xBmW/Kw2l4x8X8uvGUz
         2ZqvE4WqXlW8bKF25FhIdrX659WcCP0Y0mQ6T9Q5n/mpk1OeascvH0blmS1RYW5TWqiJ
         iZ2pPCXImocDx9aG2L3Ismu4kU9tVCWpSzQxZpI0lEL7/a8ox79qysoVsLO7PURYAeLa
         jaFw==
X-Gm-Message-State: AOAM530xw3kCS0BdFUUAVnkH1Nx2B1/OQzFs9BT53ab2q7zxLouDBCL2
	0QlM9Ej80f16VJ9FXIrDEIr0fld3U2o=
X-Google-Smtp-Source: 
 ABdhPJwAfmMB4755KtiGy9di0aO71jyKeB9PIvolXAaMQYGEI0bwT1m5XjtPgA6iHiQAusfeIirVUA==
X-Received: by 2002:a05:6402:26d6:b0:428:c30:3a45 with SMTP id
 x22-20020a05640226d600b004280c303a45mr8711956edd.210.1651727153991;
        Wed, 04 May 2022 22:05:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:05:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/61] python3-babel: upgrade 2.9.1 -> 2.10.1
Date: Thu,  5 May 2022 07:04:52 +0200
Message-Id: <20220505050544.651895-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165238

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-babel_2.9.1.bb => python3-babel_2.10.1.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-babel_2.9.1.bb => python3-babel_2.10.1.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.9.1.bb b/meta/recipes-devtools/python/python3-babel_2.10.1.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-babel_2.9.1.bb
rename to meta/recipes-devtools/python/python3-babel_2.10.1.bb
index 11c8d60105..d06eb2bf5c 100644
--- a/meta/recipes-devtools/python/python3-babel_2.9.1.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.10.1.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "A collection of tools for internationalizing Python applications"
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=05fb707293a85504aa67afc8ea34d747"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1b3f4650099e6d6a73e5a7fc8774ff18"
 
-SRC_URI[sha256sum] = "bc0c176f9f6a994582230df350aa6e05ba2ebe4b3ac317eab29d9be5d2768da0"
+SRC_URI[sha256sum] = "98aeaca086133efb3e1e2aad0396987490c8425929ddbcfe0550184fdc54cd13"
 
 PYPI_PACKAGE = "Babel"
 
-- 
2.30.2


