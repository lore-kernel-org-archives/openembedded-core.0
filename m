Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21401C07E97
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:56:51 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.102647.1701788208568919011
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Sbu6GrwN;
 spf=pass (domain: baylibre.com, ip: 209.85.221.51, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-332c46d5988so4570523f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701788206; x=1702393006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUSeIOJHjslk5M3M8769+rPHIE5kbg8mkMrYJdMCf5c=;
        b=Sbu6GrwNBvsjrsrVeR3j/QOnW06GR8PVsLqC/yYZJa8dZo3y8N6okeHfCa31xJxvsq
         t0DokIYPJQLqTF4G+jijEzf7V+QTPLEXBkEufguGQMKK4pvN2wm7WFZnx+34J5wmfZIm
         CowAmG2Jmmb74VR7ptH8nXkgQxd5TyYo+Zkb4WJnHULmINg8sWefx6K+uFuyWgDNwaJG
         t9JOVAnvbawUj32GgmlccoOtZHFgP1z1/8oeyJtfaBjlpJunKBHoYCm+i3c09nLNy0NA
         VFMETy4szjePEz8cT7f18cUjQBEAzWIGWpsdM8SyrJMoKGE9MCNl8PLV1lvhEVoRiofY
         i4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788206; x=1702393006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NUSeIOJHjslk5M3M8769+rPHIE5kbg8mkMrYJdMCf5c=;
        b=h4b2PJXEQakNOqIf9QDD2CAJyTm4tPb4mtGfJoWD6tDQ8FcVVHSvqRrfoqnrr+XOgp
         J6gyfHwpCzH7d+55jmAE5i88VzCP7KAXKQFeBtAy3jWmTLjV9Gy33bMH3H5zvjVVVFpT
         kKoiQStnJro+KiR7asP6bAadCXjtt2k4TdwFQEhoUqNF84/ICNrR2khchhipxemNoAc3
         eiTSb76S7kMIlCgoDyS3as8aNcRSbeiBsatOuUSCAz60BUtUDMS8mvgAJhr/6whFOXye
         iZOfizn877gHn4RgvjDuAjnHm90RCRj/QWuTFKrEIWotgqcuBEI3AvN43ejdcy8DDeYl
         44qw==
X-Gm-Message-State: AOJu0YzRzq8Pf9pw6LqpJNGqN8Y32YeRB6WSHm8n3n+E6CIwb03BNF64
	tnvr0tQTlwIP/SOVKzF4ZwOguKZqP6UnVAHg6SMRhg==
X-Google-Smtp-Source: AGHT+IFUnp2pXN4qKnIp7vth77jHtK5FL6FLlR9mmho+YFIe7hQA3OG4WdomiViBHGoTq4bTKoo8hw==
X-Received: by 2002:adf:ee82:0:b0:333:2fd2:5d52 with SMTP id b2-20020adfee82000000b003332fd25d52mr4820085wro.132.1701788206495;
        Tue, 05 Dec 2023 06:56:46 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id cp6-20020a056000400600b003334520e49bsm6750082wrb.53.2023.12.05.06.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:56:46 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 04/10] recipeutils: bbappend_recipe: add a way to specify the name of the file to add
Date: Tue,  5 Dec 2023 15:56:30 +0100
Message-ID: <20231205145636.960819-5-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205145636.960819-1-jstephan@baylibre.com>
References: <20231205145636.960819-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191833

bbappend_recipe can take a dict of source files to add to SRC_URI where
the key is the full path to the file to be added and the value is a dict

Add a new optionnal entry "newname" to specify the name of the newly added file

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oe/recipeutils.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 01c9ad190fe..1d793693bfd 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -677,6 +677,8 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
                 path: the original filename as it would appear in SRC_URI
                     or None if it isn't already present.
                 patchdir: the patchdir parameter
+                newname: the name to give to the new added file. None to use
+                    the default value: basename(path)
             You may pass None for this parameter if you simply want to specify
             your own content via the extralines parameter.
         install: dict mapping entries in srcfiles to a tuple of two elements:
@@ -769,7 +771,10 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
         for i, (newfile, param) in enumerate(srcfiles.items()):
             srcurientry = None
             if not 'path' in param or not param['path']:
-                srcfile = os.path.basename(newfile)
+                if 'newname' in param and param['newname']:
+                    srcfile = param['newname']
+                else:
+                    srcfile = os.path.basename(newfile)
                 srcurientry = 'file://%s' % srcfile
                 if params and params[i]:
                     srcurientry = '%s;%s' % (srcurientry, ';'.join('%s=%s' % (k,v) for k,v in params[i].items()))
-- 
2.42.0


