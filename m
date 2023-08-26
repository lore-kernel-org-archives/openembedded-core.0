Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3245C83F11
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:36 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.10500.1693064368127550235
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=D1NCAKO9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68a3082c771so1292033b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064367; x=1693669167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCvmfm/ef0HZZWULgXpsNvUfezdVc6RHBMdaGYL3eew=;
        b=D1NCAKO9aEsbhvX1KKeFFKyZ8QgWztrnoqx/hTvPMwxuRGdXKpZhwssujhBuuxZi6g
         8lLZpsR0txFkfCsb/oeklllXEe+D2e2UEaNB1UU4dSUNyM2mj/KkebliXRj5CzQEpBXS
         N1JMI0DNMvOHFLRjmuxsdym1ggdvp5yZLfP8bxTfV9k+F5Ebm3j1LlEeYses9pQrilKi
         VxiAQxrjFWlqnwdtmKsilt/aKxvZaKdFKhE1GfaltyTcr1lkSokJWFfLxwUqM0UuhS3Y
         /azc49ROhVQ+F1y8CkAkWJJ4y4C32qvcQIYGntE60hy3xTi3f3vYOgxq1uUJ3JkZqVdO
         lrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064367; x=1693669167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCvmfm/ef0HZZWULgXpsNvUfezdVc6RHBMdaGYL3eew=;
        b=ghUjkelrGLn0xZi9MZ8zMzDj6/0nX1yKtwWX77kgqwHMD2/CRruWIQpQNK+tRZwub5
         S1hIHvNHOdYWin7Z0s4IcQwpF5QzQQh95QINWAJp9oIkKATgaWdXGLqFcv/egGbA0fvo
         1FSuwazjpxSoxHJg/DqRB3+FMMNJtRRHF96aXdv8U3sYlbEyJHEJsgNUzSvxKP+Z5ht0
         h4/gkAxdtB3dp7cb3PDPoX5PxsJOWrxwovna9IS5DDwEsE0JscexZXSzBthJtFq4Beyi
         W4cj1oHmELgpe9YviRbcogtWuGsbIph8BUgdEbsr1XnGYWihoMRu48vnnCVrH+08DmFR
         VM5w==
X-Gm-Message-State: AOJu0YzOhte8DaRFRW9RWAkaMgdHeXOQnB35w5YaqJE2hR2oD3kn2gLE
	QW2/ddmhj7blF4ReoeGe41oe7wUtdyNKasYupcw=
X-Google-Smtp-Source: AGHT+IE4kKYJnol8e9PzFBmWAl6EtrD0Q/ztJxAd+H4uyoWfhYCh2MCi4OeosHHhkiuyHpeNa931RA==
X-Received: by 2002:a05:6a20:8411:b0:13e:b6b0:72a2 with SMTP id c17-20020a056a20841100b0013eb6b072a2mr34121068pzd.6.1693064367220;
        Sat, 26 Aug 2023 08:39:27 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/20] externalsrc: fix dependency chain issues
Date: Sat, 26 Aug 2023 05:38:48 -1000
Message-Id: <18d0ace2d7becf2a1588d2d2b7ca0f6f2108b64f.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186761

From: Peter Suti <peter.suti@streamunlimited.com>

Instead of deleting setscene tasks, now SSTATE_SKIP_CREATION is set instead.

This seems to fix the compile issues where the populate_sysroot task was
not run when an externalsrc recipe was built as a dependency.

[YOCTO #15164]

[RP addition: The deltask was added by me in 2012 when the class was created.
The trouble is bitbake assumes 'sstate' tasks have a setscene task and by deleting
the setscene task, bitbake stops thinking the task can be accelerated. There is other
code in the sysroot code which assumes some tasks are always sstate tasks.

We cannot delete the task without changes to the way bitbake learns about 'setscene'
tasks so the patch is correct, avoiding creating files is the better approach given
the way the world works now.

There would be concerns about exisitng sstate reuse however this shouldn't occur
since SRC_URI changes and that will change the underlying hashes. Hash equivalency
could potentially cause issues by joining hashes together again however if the output
matches, that shouldn't in theory cause any issue.]

Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee4667a24ccdd8c9d547e73aecf661e6a1283890)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index b00fdba8e9..aedd78a03a 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -75,6 +75,8 @@ python () {
 
         # Dummy value because the default function can't be called with blank SRC_URI
         d.setVar('SRCPV', '999')
+        # sstate is never going to work for external source trees, disable it
+        d.setVar('SSTATE_SKIP_CREATION', '1')
 
         if d.getVar('CONFIGUREOPT_DEPTRACK') == '--disable-dependency-tracking':
             d.setVar('CONFIGUREOPT_DEPTRACK', '')
@@ -82,10 +84,7 @@ python () {
         tasks = filter(lambda k: d.getVarFlag(k, "task"), d.keys())
 
         for task in tasks:
-            if task.endswith("_setscene"):
-                # sstate is never going to work for external source trees, disable it
-                bb.build.deltask(task, d)
-            elif os.path.realpath(d.getVar('S')) == os.path.realpath(d.getVar('B')):
+            if os.path.realpath(d.getVar('S')) == os.path.realpath(d.getVar('B')):
                 # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")
 
-- 
2.34.1


