Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791F1C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 11:14:57 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.10575.1660043692714511176
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 04:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qbd2v8wC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so578446wmq.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 04:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=oKJapc9loBPxbF9Lb+V8yDJJffSJnk87M8hpL/a0Inw=;
        b=Qbd2v8wCQuWUwwdFKImd/IGtVDIlkvV8CdmnWS5kv8P7p5indq/Vm5lxw+DQS+IidT
         TgrJGVBXqbYWzNcFaLFbEG81OF6Zn0V8OQJ6JjXJ6pzIiKCZCHZEdW6wkp9F7YLV4Uxx
         zdYS9/LdZH8c1V9TOfuuWihtLQTyF9WlXtRew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=oKJapc9loBPxbF9Lb+V8yDJJffSJnk87M8hpL/a0Inw=;
        b=0YVZdQxSEG6dgH1wAvtg8Sd5Ev3kFN4AAgO1s/1XAMLV5getvXW1A1f6l3i4sNsYXm
         /xewTpoRVse//wqxBy0zHYqE+bohvrnZNc57PBn+Vx3Ya0ujqX2QFbqcY81xtFNGsgdA
         dwOTCwrrIhrLZ1iFfvWT6V0lu2yC/MyPFBCZnByh2wyd1GpSPDw6iCdnZMxyjNH0j0pj
         wo+TzG3H1I4qBQnzrP0KvPEABA2FHnJdifbqVKwsIuUTjzsH9TfgvfZVVUmpqa+1na+f
         L6XOIk6x83DJJ/fOeEUk/Zo9XBKZTRdUsgG4X2TO0XVliUqNUBh3NQrSCKjhvrhtGCPU
         E8BQ==
X-Gm-Message-State: ACgBeo3J9LKZBSJvinTNwNsfKctc+0yTCKnqGavJ1Twfngj+akBLE/x4
	Af3mH1K1NUbySft7IBMCgqcLbg0LvL5KrQ==
X-Google-Smtp-Source: 
 AA6agR7Vu4XLReVFSjCk9NX+D5hpOD1kQAF1NqLSokB6VmSxkP5/vI2aDRc8lOmIVd1yOmFpgNYR7g==
X-Received: by 2002:a05:600c:6009:b0:3a3:1506:f60f with SMTP id
 az9-20020a05600c600900b003a31506f60fmr19842152wmb.144.1660043690858;
        Tue, 09 Aug 2022 04:14:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e4b1:e2c4:e19e:2222])
        by smtp.gmail.com with ESMTPSA id
 e16-20020a5d65d0000000b0021b970a68f9sm13487385wrw.26.2022.08.09.04.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:14:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] kern-devsrc: Drop auto.conf creation
Date: Tue,  9 Aug 2022 12:14:49 +0100
Message-Id: <20220809111449.192321-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 11:14:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169146

After this commit in the mainline kernel, the quoting is different in auto.conf
compared to .config:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=129ab0d2d9f38b9d43df35235fc66c6740d6928b

We therefore can't just copy one over the other or it leads to syntax/quoting
errors. We end up running make prepare anyway in all our tests so drop
this copy for fix 5.19 kernels.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index a38d35e82ae..46d706b955f 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -308,9 +308,6 @@ do_install() {
     # external modules can be built
     touch -r $kerneldir/build/Makefile $kerneldir/build/include/generated/uapi/linux/version.h
 
-    # Copy .config to include/config/auto.conf so "make prepare" is unnecessary.
-    cp $kerneldir/build/.config $kerneldir/build/include/config/auto.conf
-
     # make sure these are at least as old as the .config, or rebuilds will trigger
     touch -r $kerneldir/build/.config $kerneldir/build/include/generated/autoconf.h 2>/dev/null || :
     touch -r $kerneldir/build/.config $kerneldir/build/include/config/auto.conf* 2>/dev/null || :
-- 
2.34.1


