Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE83C05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.3852.1676835079540292228
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hyR0KSrl;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id bk4so884318wrb.9
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+22HdVvwc3AHYAjkI0UAQAjMtJpHequdDIoT2OrVnc=;
        b=hyR0KSrl4FdECs4+hUPQ8M24JoUAeAH4nq8aAjyrhwmdapEKXmf/xI3QZaOaFqEKu8
         vXwY91Y7g5xZIL5cgg6PRGn5L3VPvv/cmjmuBeupOruIli+rmjXKeXAuhcOSr5DfQLV4
         OBKrqY5vWk1wMaGwIj+kEzE/8NzBM8chTzsTFo04q65crBJ/jnSj+YnK+fSf5PkwobCQ
         KaXlfsP8ATf+4PBTPi3HiGOVgrmwjl8tWvY6IrPKAV3bC2T8dcC9kq/ZwnBhbnZnSk7Y
         k0qSC7EQ4AIHMjBJSxwzgqLM2jXwWnYpAUcAmb8ebIzPLV+jv4m2BQWW/huhRqlFlLb2
         d88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+22HdVvwc3AHYAjkI0UAQAjMtJpHequdDIoT2OrVnc=;
        b=VU4Y2cDGpnCbf4d2w56ns3iccpDfBTDag7jGfRx/OVxd3lGqr9csSbhXuu+oI2tNVl
         BZ1gZntrto/A+YAT4gFNP7/DYpAxi8AI7ICsd+yMhRxkvaJJ5aOtUAzGXFnZ/67qbKmY
         lgvKOuzjz3MV5DGiGB23987nilQ/f4n2/o/qiJHW44y1Ali8AiC4liX20y58kgu7ydhY
         W8/epFAdiXWfNMl78QmjmIrzrS4qViA2BmDBeVr1dNDH6jy/J5v5k9DhzALBO2OTej2V
         /bS88xvOZ2Eoeb4ROlE38RlWpROS85IBA5JSyNLkW8XEC2Q4lChBKA7lXIuvn5VhhXiP
         d1qw==
X-Gm-Message-State: AO0yUKVj+fDftup+19ulgfCcbp2qGO79JhAnTFqbhpm1YzoL9lSZ5IdA
	uDS0qO+WBousq1PdO+ogO/gMQcPdfKE=
X-Google-Smtp-Source: AK7set+i0Nq4XUDgVrDQe9De3lDUsxemDeQXzWlkVX1TeF1YRTWTv3uub9cqfxb/9Nrxo2kEUCCFKw==
X-Received: by 2002:adf:f30c:0:b0:2c5:9c7a:866 with SMTP id i12-20020adff30c000000b002c59c7a0866mr411323wro.51.1676835078088;
        Sun, 19 Feb 2023 11:31:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/39] util-macros: upgrade 1.19.3 -> 1.20.0
Date: Sun, 19 Feb 2023 20:30:42 +0100
Message-Id: <20230219193101.338397-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177363

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{util-macros_1.19.3.bb => util-macros_1.20.0.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.19.3.bb => util-macros_1.20.0.bb} (62%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb b/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb
similarity index 62%
rename from meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb
index 13d8ce22df..60495ad0c8 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb
@@ -5,12 +5,11 @@ DESCRIPTION = "M4 autotools macros used by various X.org programs."
 require xorg-util-common.inc
 
 LICENSE = "MIT & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1970511fddd439b07a6ba789d28ff662"
+LIC_FILES_CHKSUM = "file://COPYING;md5=42ba50748cb7ccf8739424e5e2072b02"
 
 PE = "1"
 
-SRC_URI[md5sum] = "66cb74d4a0120a06e32c3b01c29417d8"
-SRC_URI[sha256sum] = "624bb6c3a4613d18114a7e3849a3d70f2d7af9dc6eabeaba98060d87e3aef35b"
+SRC_URI[sha256sum] = "8daf36913d551a90fd1013cb078401375dabae021cb4713b9b256a70f00eeb74"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 DEV_PKG_DEPENDENCY = ""
-- 
2.30.2


