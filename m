Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5407AC63709
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:42 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.9362.1672830366643340608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N7MpGorA;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d4so24593236wrw.6
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AklPpNbNf5gOHaZqJ9XYf5hszawOcwvAFCj9KiqmsMQ=;
        b=N7MpGorAqGtyY0N/aFlt9nEJxFinFMIKIUjhVOHaU8t88lE34Z7DXqj20byMvoblMy
         O/4sEQK6YnUq9B3a1mIY4UXK7Hbs06x2FE1knVyGYwGSufPh6nEE6SXj4FGE11miZ8uF
         4of52tQoJ335nlnZEu6XfUKbuuFRlwRCz6PpOIKSHqvc7ET77BuixcUdJNmXB9vnsl2a
         nijUGpDXs0AltkdOqfYJNIue1h6lAahi4hkAcSPbLlNqQKHZyMRzmEbUwRKekelE2UMd
         ZTHYZT0kv4l8bq1yyerBLc4PE9dclArSzDEHobxh3fjaa+Aa2q/4ay6/Zt8P19D+auJw
         57dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AklPpNbNf5gOHaZqJ9XYf5hszawOcwvAFCj9KiqmsMQ=;
        b=UC6hWiRArqhvlmlxzRnW+oPkpyVelA5H5M1XpisHgwBknHyNytdOnpFUJ3SGfm/QBZ
         d055rDWaZp4iiUQODpGmqA8j62uLjumaVctMlBMq6FIi8W8XguCNpmsaTh+ZUz1stJ2H
         hiszXWNPb5cmnCTyYlVuMjbQwGytv/vdpje5L44KwHFOZqUb3nLTxMUZaVYomVd4D1dS
         vb0hKpYDuGBFT8NCdmQFYg5giXaQeP9733ZJY556TbZA2S566Vk3WCbLIL2GR9XDkxTX
         AD//HN3iF4SIS0FSeXAE6N5hu7hfGmDOa+kKFtXMRdEwAkEAtPICAyvZ0ekce7SxSX0P
         wJdw==
X-Gm-Message-State: AFqh2kqms36ZO1jRuDonrLZ94HEF34XdNORRUkdUuyRatKMzXPf7ozbX
	3vM2pKo5HFbiJKHJX+EIyyTzyuZJXs0=
X-Google-Smtp-Source: AMrXdXtNVxe9n6glJMaU2sI5UCVNdikzoHRdFKgbacvhRn93u0mKsL0UoFIsZCV223xIXr3lBpJ71g==
X-Received: by 2002:a05:6000:78a:b0:26f:6bf:348f with SMTP id bu10-20020a056000078a00b0026f06bf348fmr27576817wrb.6.1672830397052;
        Wed, 04 Jan 2023 03:06:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 58/77] kmscube: upgrade to latest revision
Date: Wed,  4 Jan 2023 12:05:29 +0100
Message-Id: <20230104110548.2537259-58-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175442

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 6ed97dfafe..b2c10e09fb 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "3bf6ee1a02334386d87cfe356c3bfb0b24e1fed8"
+SRCREV = "345111481d654b38a72b5c3629151dc74f7a82bc"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.30.2


