Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC30C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 12:01:46 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.8977.1708689705787603901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 04:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kp9uqRBf;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a3e550ef31cso83291666b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 04:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708689704; x=1709294504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1z31RHaHiY8+IULtx4EM/dAvi6dGN1TMREQeo8g8IuI=;
        b=kp9uqRBfRB2xtRrN5HEOZw2hmVNB8pVceG0vKo7RxYkLU7V15VcaKFmJgw33R5h9Wk
         8NgLfslvvJGUDMNT54LgxyLSams1ER7ZYpud3n0XlNKGbWr+YS1awZvi8nYpuYqfANMU
         n5ZzdV2ZKcbWxo5pBZYIlUghsdBXLg3zL9MlP+jIw8kudb3+L6BKaCc0EI2ZyeVBaRl4
         9i91gt4q558sTokiDl4Xx2CFBUHyz+unL17zAQT564hZSwW94CtSBE1AR+cZkR1eDL9X
         1kkzRHEEOU1AA3GHu9RYqrAlY1NSi0LAsEC0qCf0FNW7bDGrMU1lK33yM8WPdLg08jl3
         NH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689704; x=1709294504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1z31RHaHiY8+IULtx4EM/dAvi6dGN1TMREQeo8g8IuI=;
        b=wqozKNXH4veX+huA79ndKtuUCujo7l4AfyTkKDk9T7Yub/dLTF9ITwZ9OCOlFhw2uf
         vH0OLRYhxyMkt6DCaZfHfKHeO+9nfFYR6sJS+zuyJIPn0ZSFpAx0Fb3kFSmsGsaOFrD7
         4aLRL/7sllKLqmeqGHKkukWQbUdcnznw3Zc/WliVDmcArQzSQJcBPg3EAdd0TGk7f3lF
         /JsQkEitEGXOtz0dffZBldfjojP4Vyb/S1IQAiH1bXRgeDV81GsjhAmgG0AvxNtKQMxf
         Mi60EhITxle9phPjnKXN8PXj+W5dXFyrDj4TCsYooV0DHrHXP9EKQfr7AIYPDqlrIgv/
         VddQ==
X-Gm-Message-State: AOJu0YyoiOwtrzCF5YO2ZVxi6ttyVfTcHE6/nL+mL4+tZqAD7MOjNWsQ
	xwGjz2bYJlhT/XooPQmWtLNUt/He03CaR0LsnrYHt/iPLmnj8k2sEbLpzTcF
X-Google-Smtp-Source: AGHT+IHtVUTgPt0vsWpeftTdavdPKfJCFKLnNZ0x6Z0NIp8TU2UptK0HRWIQISfh/bmCsWlOm26RaA==
X-Received: by 2002:a17:906:6b8c:b0:a3e:4fc6:c881 with SMTP id l12-20020a1709066b8c00b00a3e4fc6c881mr1218284ejr.36.1708689704098;
        Fri, 23 Feb 2024 04:01:44 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906345100b00a3d125b9c0asm220330ejb.81.2024.02.23.04.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 04:01:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 03/10] bblayers/makesetup: include local repository paths in discovered layer repo data
Date: Fri, 23 Feb 2024 13:01:27 +0100
Message-Id: <20240223120134.3713127-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223120134.3713127-1-alex@linutronix.de>
References: <20240223120134.3713127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 12:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196063

This can be useful when the caller needs to know where the repos actually
are on local disk (for example to make a local copy of them or obtain
additional information about them).

This field however should be removed from the json output in oe-setup-layers
plugin, as it is host-specific and not part of the schema.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bblayers/makesetup.py                    | 1 +
 meta/lib/bblayers/setupwriters/oe-setup-layers.py | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
index ecfa65adc7f..814cbb6357c 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -89,6 +89,7 @@ class MakeSetupPlugin(LayerPlugin):
             repos_nopaths[r_nopath] = repos[r]
             r_relpath = os.path.relpath(r, top_path)
             repos_nopaths[r_nopath]['path'] = r_relpath
+            repos_nopaths[r_nopath]['originpath'] = r
         return repos_nopaths
 
     def do_make_setup(self, args):
diff --git a/meta/lib/bblayers/setupwriters/oe-setup-layers.py b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
index 59ca968ff33..56c929471e6 100644
--- a/meta/lib/bblayers/setupwriters/oe-setup-layers.py
+++ b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
@@ -85,6 +85,8 @@ class OeSetupLayersWriter():
             if not os.path.exists(args.destdir):
                 os.makedirs(args.destdir)
             repos = parent.make_repo_config(args.destdir)
+            for r in repos.values():
+                del r['originpath']
             json = {"version":"1.0","sources":repos}
             if not repos:
                 err = "Could not determine layer sources"
-- 
2.39.2


