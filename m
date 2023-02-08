Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4870C64EC5
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:14 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.3137.1675840910086201632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VEPI4Ecq;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso741950wms.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnoN4xJDbNk7Xa3KkuCQk0eAm8Mtyf3097h8WJ2oXZk=;
        b=VEPI4EcqS0/6PYCj907U116BXBPIvX5f7c1RkGI8N38EKJq+/EYx4cMdFDbAKcUbhH
         5n0yx1zFoBwrY8Fpy0pxBxKYlYWoVrWznHXvAOniC6SJmKmFMhkNdzcAhnTIHW1ppOhw
         wfl344q5iVj7M+rSPo4GK3ONbkUsXgZJmo05ETzy3gby5ML3rmypfo5Cn0RdrmN6DAnu
         KgaWd/BhAGp8sF1tB6uAsEQE+7f/hpy8oCTELbKvbU8JGQ5zEBz7oTc8nIa3VO5DCwfg
         jOaeEc+efDLEaWQb3sEKdVxsclDhVRkv4GhjM2uzevmjyCIFRdqtYeM+MaHFY4rW3Sji
         G5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnoN4xJDbNk7Xa3KkuCQk0eAm8Mtyf3097h8WJ2oXZk=;
        b=2Syksj6ZoUaSc2jJkw6zGePxNplhKHZVgxpOYuTiF5+uHzXkzswPDDu1uVEMdExt3S
         Ffd+/PoM/UYWDC4OBWSyjyOT2xpL8VtWuRE99WMhpX+m1rJEzVeTpRLeCSI70gGVcfG5
         bJDOmSoW14XVwiDt3lUKNzjmEt0ZMbCoAkEP8Kv+SZvXAIQmDYE8OSnX97YNIqt3JYf2
         D7UVizaF0Ub2/M9bQF4dPmrwEtetm2osx9+zCmJ/r//to9PSAXz3ZL8ZL/8TtCa1Xq8n
         6Ba7jA45Jq/X3yacK2lZ9ij7Ckv0ZVL/GJnMDozI6yC3OJLaac7rO+aDiXDFWKSo3ITa
         5ydQ==
X-Gm-Message-State: AO0yUKWklYj2OvO3rdS3vhQaqclFbwY90dT6H+YRXRpRgMTnsoK83Pvd
	Rv0H7hJbzNjU/i/pyXSMexlx+ib1pgI=
X-Google-Smtp-Source: AK7set8867WPnLv4dwojK+NLX4GUnqfSXJxpA6JAfDyP0wQXhOGe5EXIzbLjg5Lv8XOc0b7ZnCtA3A==
X-Received: by 2002:a05:600c:3c9c:b0:3dc:d5b:5f6a with SMTP id bg28-20020a05600c3c9c00b003dc0d5b5f6amr5530972wmb.30.1675840930270;
        Tue, 07 Feb 2023 23:22:10 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 39/52] msmtp: upgrade 1.8.22 -> 1.8.23
Date: Wed,  8 Feb 2023 08:21:30 +0100
Message-Id: <20230208072143.2930292-39-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176879

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-extended/msmtp/{msmtp_1.8.22.bb => msmtp_1.8.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.22.bb => msmtp_1.8.23.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.22.bb b/meta/recipes-extended/msmtp/msmtp_1.8.23.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.22.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.23.bb
index d56af7346b..5e68a7ea92 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.22.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.23.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "1b04206286a5b82622335e4eb09e17074368b7288e53d134543cbbc6b79ea3e7"
+SRC_URI[sha256sum] = "cf04c16b099b3d414db4b5b93fc5ed9d46aad564c81a352aa107a33964c356b8"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.30.2


