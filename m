Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B35C7EE30
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 16:14:03 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.37309.1683648836247731823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 09:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DYYVCnJC;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-50bc040c7b8so9432766a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 09:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683648834; x=1686240834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edcBmstFNHSQvZeoogrbXXz6RfKNvuTPWIDQX4qDR3g=;
        b=DYYVCnJCkC2lii7G9jjiRAWcqT78Adte9TU4B22lLnEvYi7PT7Nfsp7IW+rXCaBoNb
         zotqFnw6mVHa/xeWWcSuJEjOA3vwDC8hLFoV6kntptqlk86l6fF8FD31WuybHQ3GPqG1
         f9KL/1J+cx//BfTY1QIGEM2e+yPzZb0Qbx8C4xF0NY0gT3mlXOeopbrR0Tx735sxEesR
         I2CNil2o7x7ZqFexeJx0u/Wg6Ym3YWIC32iXzQccPtv1i5fWl9i9PBow1nfdYFB9ZAV1
         gwylTyRL0RPgXwIVqgqySDqIryX3FipHAijiJdHcSCYQxeziHx0msqW6Bs0lNuyGTE5W
         Xd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683648834; x=1686240834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edcBmstFNHSQvZeoogrbXXz6RfKNvuTPWIDQX4qDR3g=;
        b=RJUGVGEFZskKe37eSgoPBtSJ6NTrRswBUfFc8UhkFhKa5TsPYr8JClkbthcyyi2u4Q
         RaiQxOY7yknsVdz/yHvrrGQ54tfoqYzqbA9uOEwHwzaiyVvp3yIYOsDUNlCbr1sbSoL+
         65G/gDZq72xMbCG2RCHe+HAOZXgy8JDCmGEwiee8tntIN9QlijaTsDyerjekbB+bXrl/
         Fd5ttxCCvHzjn8dw3SNyHVatlszT+4q6mHRS6WdF820IVu5rnZOO3ZPygXd6cX3qnnNy
         DB8yLLl/hjDqY6KwrbjCCK5snA6F9s5tfyly7b2GgG/Fl0soOItYrm45Bn81QO7otRSE
         5C6w==
X-Gm-Message-State: AC+VfDyqKVqmN0+9bS3pOniC6nst4t/M8Fr8SVlgX3muSQVsgo3P9aAh
	lwPeiqhK11JTF35hDAalp7+JLwJL+mw=
X-Google-Smtp-Source: ACHHUZ4eCU4p19Y/NEfKgQtAaN3w66WrRNC08URcdNmD1114obC9CRVmbXzNLgFoesoF4Merc5l0gg==
X-Received: by 2002:aa7:d71a:0:b0:506:6008:995f with SMTP id t26-20020aa7d71a000000b005066008995fmr10768399edq.39.1683648834499;
        Tue, 09 May 2023 09:13:54 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id z19-20020aa7c653000000b0050bd2f16ef5sm903997edr.84.2023.05.09.09.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 09:13:54 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v2 3/3] perf: add libtraceevent packageconfig
Date: Tue,  9 May 2023 18:13:10 +0200
Message-Id: <20230509161310.3839898-4-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230509161310.3839898-1-max.oss.09@gmail.com>
References: <20230509161310.3839898-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 16:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181052

From: Max Krummenacher <max.krummenacher@toradex.com>

With kernel 6.4-rc1 commit 6898e60f709b ("perf build: If libtraceevent
isn't present error the build") having libtraceevent is a required
dependency unless building it with 'NO_LIBTRACEEVENT=1'.

Older kernels did build libtraceevent as provided by the kernel sources.
(Unless LIBTRACEEVENT_DYNAMIC=1 was defined, then it tried to pickup
an external provided libtraceevent and printed a warning if not found.)

Add a libtraceevent packageconfig which adds the dependency on
libtraceevent if set, otherwise builds with NO_LIBTRACEEVENT=1.
For older kernels the old behaviour of building libtraceevent from
the kernel sources isn't changed.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/perf/perf.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 80199a4515..19f8aadaa0 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -11,7 +11,7 @@ LICENSE = "GPL-2.0-only"
 
 PR = "r9"
 
-PACKAGECONFIG ??= "scripting tui libunwind"
+PACKAGECONFIG ??= "scripting tui libunwind libtraceevent"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
 PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3 python3-setuptools-native"
 # gui support was added with kernel 3.6.35
@@ -27,6 +27,7 @@ PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
 PACKAGECONFIG[audit] = ",NO_LIBAUDIT=1,audit"
 PACKAGECONFIG[manpages] = ",,xmlto-native asciidoc-native"
 PACKAGECONFIG[cap] = ",,libcap"
+PACKAGECONFIG[libtraceevent] = ",NO_LIBTRACEEVENT=1,libtraceevent"
 # Arm CoreSight
 PACKAGECONFIG[coresight] = "CORESIGHT=1,,opencsd"
 
-- 
2.35.3


