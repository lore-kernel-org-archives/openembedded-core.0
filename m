Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D5DC54E52
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 12:01:56 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.9018.1708689707816042054
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 04:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OwziZ5Vy;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a3f1bf03722so41285466b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 04:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708689706; x=1709294506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10CoF3ztwnY21f99CLvzWe5fEhXGn21nDxJ5CDreXOE=;
        b=OwziZ5VyDrf+bOtFtqqiQlIE9AeqjEsgdOs5sjnGu7/2nrE/DJQlU6rCDeeTIXeaSJ
         lqUaUYZSpmKIzmgbUWIYRA2LfRrVodOK9irzxTaJB0RdpaIFN1kQo3Haz1sARQLGL/vr
         6OxTiPjetZoL91eGqhgM6HrsQf/s9bQk07tP1yoCjapQv4TSqwZXXoJyyZ1wE8JlbycD
         YbWyq8NGKBBfNTryvGHZVtaO1HzA9zABP96pL4qT1aCbmyyLqsQ7HupM0eET8W8lr2bM
         Bzft5BsbzAV7eu8nQ2kagiIiHHF433cdSXi3yipZhJJ+7/dVe6pe0FcPWOksRgifdWJA
         XlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689706; x=1709294506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10CoF3ztwnY21f99CLvzWe5fEhXGn21nDxJ5CDreXOE=;
        b=fTaie78Q4wtvcuGllZXF3qY55rK8d3gsHPT1Pq8nKxx0UP8GcdyEwUn2msAhuJcHkq
         jO/reMugnyoGDiB5ALJFIVaBHEfI3cDjf5eQ3n95o0LQZy8N4NBa4xgynUNd2+/yfN0X
         HwBlHfIYY3XbNKvGE0LORMsSJoyk6hOYZ361jXoTGNLbRBgqwmoY+rWA5fUpjC7u0ek2
         CTpF77Qg68tfKvsbEX+dw/dmW9V8LYVc0uBK6Pf/iJdS+HUHF8ZycnzZhDn1ruc6o1PK
         A68rjlMewFycqwn1GkVAL9fP0DqWaGx/Zj7XK1Wm1FcbhXNXgtkGq6wueQwkd5VE+w0X
         eJjQ==
X-Gm-Message-State: AOJu0YytiJC7o5bKRfKoIdKRN7nVSKNvaxEB2t1AuKTD/4KHtGPbkg08
	ESw7d4bDNZIdcrsNRBKZlh0qYtRwouOdhbnb5EuLBT+efNgP/d6ZCZjU1jru
X-Google-Smtp-Source: AGHT+IE7n18pjJxxzRJpLyz+N79zZIuBa+O2FDk2DF9m65UkLfilFkxa5jT05EI6Hf3t15pPuvqckw==
X-Received: by 2002:a17:906:b88e:b0:a3f:c922:6ed7 with SMTP id hb14-20020a170906b88e00b00a3fc9226ed7mr851911ejb.21.1708689706125;
        Fri, 23 Feb 2024 04:01:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906345100b00a3d125b9c0asm220330ejb.81.2024.02.23.04.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 04:01:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 07/10] sstatesig/dump_sigs: allow setting output directory explicitly from command line option
Date: Fri, 23 Feb 2024 13:01:31 +0100
Message-Id: <20240223120134.3713127-7-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223120134.3713127-1-alex@linutronix.de>
References: <20240223120134.3713127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 12:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196067

The default (current directory) is unfortunately non-deterministic, as
the operation is performed from bitbake-server and not from bitbake
process directly. If the server was started in a different directory
it will write the files there, and not where bitbake command requesting
those files was started.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/sstatesig.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index e2582917fbd..4c5b168fb3f 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -142,14 +142,19 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         super().set_taskdata(data[3:])
 
     def dump_sigs(self, dataCache, options):
+        outdir = os.getcwd()
+        for o in options:
+            if o.startswith('outdir'):
+                outdir = o.split('=')[1]
+
         if 'lockedsigs' in options:
-            sigfile = os.getcwd() + "/locked-sigs.inc"
+            sigfile = outdir + "/locked-sigs.inc"
             bb.plain("Writing locked sigs to %s" % sigfile)
             self.dump_lockedsigs(sigfile)
         if 'unihash-cache-copy' in options:
-            cachefile = os.getcwd() + "/bb_unihashes.dat"
+            cachefile = outdir + "/bb_unihashes.dat"
             bb.plain("Writing unihash cache to %s" % cachefile)
-            bb.parse.siggen.copy_unitaskhashes(os.getcwd())
+            bb.parse.siggen.copy_unitaskhashes(outdir)
         return super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigs(dataCache, options)
 
 
-- 
2.39.2


