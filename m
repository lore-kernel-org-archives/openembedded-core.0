Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E074C54E49
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 12:01:46 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.9015.1708689705420209203
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 04:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PS06JP4g;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a3ee69976c9so49508066b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 04:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708689704; x=1709294504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oy9njXgd7UeS0Vdnklq95qp49wdar6iDZvYtG8lpUDw=;
        b=PS06JP4gMQmzL46sz3Zx3lJZZg//wFLeOjOrtrty6RPFIQiEGDdiAJ24UIgIOwh8DM
         LUj8LpIB49+L4IwuOZV+qKfG/wT1ZPjY+UXNq5u5Oh/kafrngatBI/fVtu71fnpcv4jY
         sN1kCDU8Mg/RJYaTnD7eJzaYRbHj/e9NB7Bbq4MjNkDMjaMrxIvoAoeuFCr3yFm7jbjG
         JWv6+ElUpkmuT0Mf2kdVM9GWQ+CkB2/vbmx9pDd09Tf9Q7tAg36UGG25AYNHcyaKZ0PR
         0BUGQif1GIoFxII6S0GX/DdSmZ2dy2bMpS00peZ3zJw0BPxIvrS/ZrrK1OWdWUaFW0u5
         e02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689704; x=1709294504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oy9njXgd7UeS0Vdnklq95qp49wdar6iDZvYtG8lpUDw=;
        b=SFQPDL50AjGg+qsiQqbxDl7V7wDGW25NjCz/EK3zwTDCJG1q2t3x9+4XFRn3u38FKC
         oTMae6+fzwFnBspLhr914CFIOb1/QXjoawzMRt9mTXabbnCugXCB/jtXwMJS/11eeg4n
         fPYswyxQtRwWJgVw7GHWYu5TX1m3TK47X+0eRTDXcWQNdaOZMy5T0QFja2xoHBcH8BdG
         b4XJds9G3oI8mdTIJaugjEQ+ciQdDxmvz0x/ZdYYy0EIIs4t2e+bJgSwxN09hirLV98z
         gIsO6AwMtGLZuAwjDzwkzCqdAddt7XGdmVs3bQMZHMeEYgdmkRuY0YvWGJhg1I46EkV9
         UdqA==
X-Gm-Message-State: AOJu0Yx8S92YQhIYYj3271Pk8Rbkc+P9P+TRB/kgN7Fjc+M8HWXQ4WFw
	tyHwi1c4uGBFon1Kt+4amlNyMTQZ1VIAoHwo40TdSZqtbwQQuCu9ZJMTcJ/Z
X-Google-Smtp-Source: AGHT+IEMw+6r3pWMPKK8h2f29tCBFFSv4ZMCFrgdy4BW/SgjfufkQAHZDGWR0JsUNK9auaag1oVyeA==
X-Received: by 2002:a17:906:4813:b0:a3f:a3bc:1444 with SMTP id w19-20020a170906481300b00a3fa3bc1444mr1093537ejq.54.1708689703557;
        Fri, 23 Feb 2024 04:01:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906345100b00a3d125b9c0asm220330ejb.81.2024.02.23.04.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 04:01:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 02/10] bblayers/makesetup: raise exceptions when errors happen
Date: Fri, 23 Feb 2024 13:01:26 +0100
Message-Id: <20240223120134.3713127-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223120134.3713127-1-alex@linutronix.de>
References: <20240223120134.3713127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 12:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196062

Otherwise the calling code can only issue a generic, unhelpful
erorr message, and it's difficult to tell what went wrong
if logger.error output is obscured or redirected.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bblayers/makesetup.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
index 4f27c565eeb..ecfa65adc7f 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -65,8 +65,9 @@ class MakeSetupPlugin(LayerPlugin):
             if l_name == 'workspace':
                 continue
             if l_ismodified:
-                logger.error("Layer {name} in {path} has uncommitted modifications or is not in a git repository.".format(name=l_name,path=l_path))
-                return
+                e = "Layer {name} in {path} has uncommitted modifications or is not in a git repository.".format(name=l_name,path=l_path)
+                logger.error(e)
+                raise Exception(e)
             repo_path = self._get_repo_path(l_path)
 
             if self._is_submodule(repo_path):
@@ -76,8 +77,9 @@ class MakeSetupPlugin(LayerPlugin):
                 if repo_path == destdir_repo:
                     repos[repo_path]['contains_this_file'] = True
                 if not repos[repo_path]['git-remote']['remotes'] and not repos[repo_path]['contains_this_file']:
-                    logger.error("Layer repository in {path} does not have any remotes configured. Please add at least one with 'git remote add'.".format(path=repo_path))
-                    return
+                    e = "Layer repository in {path} does not have any remotes configured. Please add at least one with 'git remote add'.".format(path=repo_path)
+                    logger.error(e)
+                    raise Exception(e)
 
         top_path = os.path.commonpath([os.path.dirname(r) for r in repos.keys()])
 
-- 
2.39.2


