Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B92C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:47:16 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.11855.1642772835035605430
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UrH2Pg32;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id p18so18031667wmg.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IxBfbSYeRkwBULf+nLshwkppKnIDp/vgr1J9cB/iQi8=;
        b=UrH2Pg32vT8EsZ46DjThZ4a89McXbVIj+0VvbZCWVBb55ME0JQr1EaxMWOKLwTnbjc
         Hwlyfbyau6Hn7+DvfZCUtljcoCkt32rAJTeiRdRbiETIW2lNeaKwqv4ApBYjrFrOTASv
         X2D91i2DN9JM7YTzKl9yzgfFzXxHCEgh/rkN++L/qbgS4AlZqthdXy5hFkz6Mrl34iQg
         PLRA2J0GzAV6D2oBmh8wCH4itmUA+5Kik6Y2c1a4dRMt9r/nCpoteYUAk+0JUnUK2TEc
         jkyCfyFI2rj3GPzZC88f8ZtfCZgFhgK0jlhqQ0QNX2qnb4vE3jBDe3H5Mfzfjj6nFgjK
         6j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IxBfbSYeRkwBULf+nLshwkppKnIDp/vgr1J9cB/iQi8=;
        b=1jx2DYRUTrYt1z9NM1F3dQp9Ta5WnaDetD/lDF4E74HnlDIXVebL0iqa2qKgby66Qe
         J0QXDvT9Tg4Owk5+7n569VKRmAib2cIp8MhUi254hvYfYisyo9yN9h52fIkm+7n6wbJR
         bIPl0/SHJoh7ArMb9QAogagrVW0SFo9ypovEwxJh2GgryOMAEPIShB8K0xuLWuRSp0Ml
         tilSEgvJ18TMSIhNacoeg2uhb1DMGRrap/oTaHPFzAeioWEAl6GahAeZ75oUqALtvR6b
         i0QxBmFIhjRAGArPM9rEdQJ0aYMeUycxkmd8CL/KlDKNR5vBC0qfCmm538/bmH/HuiRd
         lS7w==
X-Gm-Message-State: AOAM530m3sm3DeD/5QETe3AMTyNCnIOueMaeI9nzhEvgxDjtuhuRBLq1
	lIlZ5JnaWEpj4DYJo6TqrZfdv26mPww=
X-Google-Smtp-Source: 
 ABdhPJwovXao4ue9lOuliXc+c1ahkK7fWORX5VRpTP+bZ/Br/Quup9VVmT4CsqJ3V/altztActr3fQ==
X-Received: by 2002:a05:600c:3d96:: with SMTP id
 bi22mr852560wmb.2.1642772833180;
        Fri, 21 Jan 2022 05:47:13 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w9sm11927713wmc.36.2022.01.21.05.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 05:47:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] ruby: do not parallel install
Date: Fri, 21 Jan 2022 14:47:07 +0100
Message-Id: <20220121134707.1894999-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 13:47:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160829

ruby's makefiles are rebuilding several items on every invocation,
even if nothing changed, all of which are factored into libruby.so
and cause it to be relinked as well. This does not seem to affect plain
make invocation, but does cause races in make install:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14695

Rather than figure out how to use make properly and convince upstream
of it, let's just do serial installs and file a bug:

https://bugs.ruby-lang.org/issues/18506

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/ruby/ruby_3.1.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/ruby/ruby_3.1.0.bb b/meta/recipes-devtools/ruby/ruby_3.1.0.bb
index 7183c93d45..e250164d2c 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.0.bb
@@ -48,9 +48,7 @@ EXTRA_OECONF:append:libc-musl:riscv32 = "\
     --with-coroutine=copy \
 "
 
-do_install() {
-    oe_runmake 'DESTDIR=${D}' install
-}
+PARALLEL_MAKEINST = ""
 
 do_install:append:class-target () {
     # Find out rbconfig.rb from .installed.list
-- 
2.20.1


