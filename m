Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FCDC54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 08:32:53 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.38228.1710750770588634955
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 01:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F5kYHkdP;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-513dd2d2415so2457205e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 01:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710750768; x=1711355568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4F6U8WrZi58L/gZKrWkkkAoW5RUSVjn4R4v4rdWD6xg=;
        b=F5kYHkdPkvNk8UVMrQIWgclO29HmzZfgK665Lo/zD8yvf4WLf65IRovTmrKIu3gBlc
         fiAz2uPWP2RZmEtOtz5f7ilQMAYuIqTPou1HqPLsF5sBHzo0BXay3gMjGJYjrlEOHcbx
         vlEtMk4krGY0mm1+mfxma8EI0GZN4dmbhE95mq5wpQaI8B5c874YPR+G4TtKFAmMjvao
         tukBhrPzzPe1rtLOZAOxU3Vm41pMeOuPVk2s6j/nZ0EJJhFilNXR3XQkEce0Ji0Q4nPT
         J/d8ckcxOf2rul08jtO+qUeUf51TEKYVn7te2CJCOrfG3ZVMF77ChxKl30sjVoSYXoeD
         Mpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710750768; x=1711355568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4F6U8WrZi58L/gZKrWkkkAoW5RUSVjn4R4v4rdWD6xg=;
        b=Mvpz7jU9ejzRBz1up+TrEy2xcsUEp8lCUN+cG8vIqs866BqvQ7hkzicqZspRdfswxM
         qYuTjCKl3zMfG7wzgnqGyskefsy/tgS5UStgnCmGUuQWSODoM8OiHQhPhS44i0t42dFm
         X/TJSJkcpLWMQfk1ZbnoV5B8nebJwCsQWon6mOMw2WwizC9sCx1Rk4FoCwU+YisbGA+z
         kjLTuepq8iydfvarFcggDfpxfisFw49oAARzH6wG/6r0Ztme8pFxBD2tfuLgNi8062Js
         uY1lJVaBC6lvGZUaeDw6ZtgfHccwOPZr3JBck+4ZyuI1bQWIEkty1oexfkcF2rjD1oCb
         /7Jg==
X-Gm-Message-State: AOJu0YyiebU+Q2hJrXBW1V66DCJ97EtKfcDGsbB1X5xGjyYacaC7Nf0Q
	6aGeP1NbC0jZDqKRKqTBqJKJdpxC0GQfhoyAD4Sbhdf+qQbc5mfcVwhuGCqf
X-Google-Smtp-Source: AGHT+IHci+nvuLVsQou1K9ljZTD1Uw9HRqgd0njqYI6bvkBhhkAyKXdcjzkYDqkh/swiqteAarZi0A==
X-Received: by 2002:a05:6512:55b:b0:513:a2e7:746f with SMTP id h27-20020a056512055b00b00513a2e7746fmr525998lfl.55.1710750767552;
        Mon, 18 Mar 2024 01:32:47 -0700 (PDT)
Received: from peterliu-Precision-7530.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id h24-20020ac24db8000000b00512cc85fee7sm1487241lfe.274.2024.03.18.01.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 01:32:46 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] linux-yocto: introduce KMETABRANCH
Date: Mon, 18 Mar 2024 09:32:43 +0100
Message-Id: <20240318083243.14536-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 08:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197295

From: Ming Liu <liu.ming50@gmail.com>

If I want to try a different branch of linux-yocto in a bbappend, that
could be easily done by setting KBRANCH, but there is not such a way to
do the same for kernel meta.

Introduce a variable KMETABRANCH to satisfy that.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 0f62dea29a..381e20461f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -39,9 +39,10 @@ BBCLASSEXTEND = "devupstream:target"
 SRCREV_machine:class-devupstream ?= "9b4a8eac17f0d840729384618b4b1e876233026c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
+KMETABRANCH ?= "yocto-6.6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${KMETABRANCH};destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "6.6.20"
-- 
2.34.1


