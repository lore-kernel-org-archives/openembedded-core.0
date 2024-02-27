Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B924C54E4A
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:16:30 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.10068.1709032581073590777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 03:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ho+4UlGY;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so662865766b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 03:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709032579; x=1709637379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SrZpo1nfds8ODy6sgEeA+EaK2oEAPcENyf3tkZ8OSt4=;
        b=ho+4UlGY/hg8Y3ZUshmRDqX+REMsSn+MXoBLvLVB2WWVZRadWyexyXEupRbv+a2/R7
         71nxizPkrTiWDZRstE5b3Kxkp+UFz90d485QTc4ZmANO3VSHGt6A6iB1clvwrxLTJRJb
         bHKfizrXOhQPu4mII1fA29Yx5Zfhx91T5g4pUTd5H/1H/utZcVm9t62pm12RCy6bv+8S
         xBV5ttJA/5L8It6h1KFjULq4mxxWKOu+qmJJtxTB5YVfbED+WzsTDyxPjGCPoZG412wE
         +HJOU/AkNLNog8sJcqa2qvoojFcod2HibLv/TIzmxI2i0l2TuZ7/KE2hpCrbZSc4Uz3A
         1fVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709032579; x=1709637379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrZpo1nfds8ODy6sgEeA+EaK2oEAPcENyf3tkZ8OSt4=;
        b=VhbPzszsiR+unZoLw35unlXkS3Ho4Dy6J6OGyjFlR33kLz7IgLiaF/JGUAwVu+cbe9
         5tsQK/v2m93S+ah9hiPa/NQljn6OOlFME7ruqD+hvK9MYSDBHNQfF03hdLSa3DoLM2DP
         AuvEX7mYYh8toWjj18DuMYngrpmE2q/ygylOl8r1phJdb1/90LWtwtQ/MBfB9F2VPq+c
         K/1ezVCNmmikdgLaKOyQf1jpO/Juefama3NMBdb7KuQzg/aIzAflF3F8oyoT9fW1c64F
         FNUT3K2NynD3iiXMo2AcADu3uY4PMYmEiYomJQlSVhGG8a1KovPij+acqelQnyG5/kjO
         s5Iw==
X-Gm-Message-State: AOJu0Yy5Rft+bku17zPnWjO4vrZ1dzyuXbumtLycz9+FT65983F807Mj
	ox3KlShUkDn7P7yERXHs8mcQsGq3rmybvjCO2H2np59sn3HfIH0+gvzj2RQZ
X-Google-Smtp-Source: AGHT+IGj51w0OZFEhpSTSyaSda4Rzg76GtsvH8k10RauJ1rKnYbREv4SsqE9LIka9AtJaJ9eoQDQzA==
X-Received: by 2002:a17:906:3b03:b0:a3e:87b7:4954 with SMTP id g3-20020a1709063b0300b00a3e87b74954mr6529624ejf.48.1709032579221;
        Tue, 27 Feb 2024 03:16:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m19-20020a170906581300b00a3d5d8ff745sm659515ejq.144.2024.02.27.03.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 03:16:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] meta/lib/oe/sstatesig.py: do not error out if sstate files fail on os.stat()
Date: Tue, 27 Feb 2024 12:16:11 +0100
Message-Id: <20240227111611.1971075-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 11:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196260

There's an ongoing issue with the autobuilder NFS:
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6463/steps/14/logs/stdio

The file entry exists, but os.stat returns a 'file not found; error. It's not
clear how and why such entries appear, but they do produce printdiff test failures
and should not be relevant in context of the printdiff.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/sstatesig.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index aa891ecf0a0..61770fbe673 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -418,7 +418,10 @@ def find_siginfo(pn, taskname, taskhashlist, d):
                 actual_hashval = get_hashval(fullpath)
                 if actual_hashval in hashfiles:
                     continue
-                hashfiles[actual_hashval] = {'path':fullpath, 'sstate':True, 'time':get_time(fullpath)}
+                try:
+                    hashfiles[actual_hashval] = {'path':fullpath, 'sstate':True, 'time':get_time(fullpath)}
+                except FileNotFoundError:
+                    bb.warn("Could not obtain mtime for {}".format(fullpath))
 
     return hashfiles
 
-- 
2.39.2


