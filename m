Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94397C25B78
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 11:46:55 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.9478.1715082405919969932
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 04:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J+4Uq12L;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51f0b6b682fso3120239e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 04:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715082404; x=1715687204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3KjOQMiol6AhvXTwXnrEgF8B6xzHo9Kpiwd0eNmqHM=;
        b=J+4Uq12Lq+ej3uz5Ja8Rd0jXEek7x6t9RvOR/G3vCcWUDNsuKYjAvm0VUcTDEQ6bf8
         wXd0mbRJHxzcioje1FXMkdD5WnpMkaDgJo9ztJjEdP5XoUP89lkjQNJZsBCQ+A8r1hGW
         qgvSuRV6ndyNO81plJfX0tkn5H7fzOgX0nqkVj2Azhh9ovxKpP4m90Av0uvCQ2o7e/H4
         UdqvAO7iqQdGAivj0AXoR6WOTCeMY+MDsIZqtdUu4P7LSOEgUBwGVYgOSZA9eCXItRpm
         Omg4W/HUW6aDeqd3HWUDviRWtnarjgrcPa7enxrux3BHeISBYePWo2i8syfx4Uh1hiL/
         NAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082404; x=1715687204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3KjOQMiol6AhvXTwXnrEgF8B6xzHo9Kpiwd0eNmqHM=;
        b=cf5JnYHz2I7KCnlEZx9SC31rExZnWxY/JINYwg3SPGrM7gHrkLbDCflL+iVoUFwoqJ
         R+sgW+1/+AzFJ9j88CNk67WgPqCKW9bP2Gl0SRB0y42Stlcif2ySeQNLfK7xNuomz6I/
         gTubHufjUu6yM2yxhtWaiICMAwWu11nKqkdn86nLz7sA3HxGaVJddhjvZaON3lRJ+j6r
         bJZVQakkqqfMBAh6cZWddj+aGe8d6Rz7xy7piu3DFngsipa/wJfSf5OgyX2+kKNbAwJB
         bZgM7AJDgWy4DoxZIESmJlYuSeSmIi7594bdPxScpgD8WGaSPZOZgBsK2JylQTZrpMmW
         y1uQ==
X-Gm-Message-State: AOJu0Yx7iHGKz3kru28MhQ5gip0+GWc6b8mqgEGM/Mr/bTqsRps/NKoa
	4wbSHh2xHuzGrd3tUIeNQ0nYpq7OUzEEbgx9FL5TnPo9zBUe3ZqoJ9pbAQ==
X-Google-Smtp-Source: AGHT+IEX5+1ObK4d0vxzBx6G3fMT0aqpgat8TRn1ZVXD9E8HjPBlrvuKa1I0MUUKKMA99LHpN/YZiQ==
X-Received: by 2002:a05:6512:3d87:b0:51e:876d:17d0 with SMTP id k7-20020a0565123d8700b0051e876d17d0mr14404138lfv.52.1715082403835;
        Tue, 07 May 2024 04:46:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id et4-20020a056402378400b00572d255e342sm5268215edb.10.2024.05.07.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 04:46:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/9] bblayers/makesetup: move check for existence of git remotes to oe-setup-layers plugin
Date: Tue,  7 May 2024 13:46:23 +0200
Message-Id: <20240507114629.2591882-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240507114629.2591882-1-alex.kanavin@gmail.com>
References: <20240507114629.2591882-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 11:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199086

From: Alexander Kanavin <alex@linutronix.de>

This helps when making a local copy of all the layers: it's fine to
not have any remotes configured in that case.

Also correct the mistake in accessing 'contains_this_file' property:
it may not necessarily exist, and if so, it should default to False.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bblayers/makesetup.py                    | 4 ----
 meta/lib/bblayers/setupwriters/oe-setup-layers.py | 3 +++
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
index 48dc73c288d..4199b5f0698 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -63,10 +63,6 @@ class MakeSetupPlugin(LayerPlugin):
                         'describe':oe.buildcfg.get_metadata_git_describe(repo_path)}}
                 if repo_path == destdir_repo:
                     repos[repo_path]['contains_this_file'] = True
-                if not repos[repo_path]['git-remote']['remotes'] and not repos[repo_path]['contains_this_file']:
-                    e = "Layer repository in {path} does not have any remotes configured. Please add at least one with 'git remote add'.".format(path=repo_path)
-                    logger.error(e)
-                    raise Exception(e)
 
         top_path = os.path.commonpath([os.path.dirname(r) for r in repos.keys()])
 
diff --git a/meta/lib/bblayers/setupwriters/oe-setup-layers.py b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
index 56c929471e6..8faeabfabc8 100644
--- a/meta/lib/bblayers/setupwriters/oe-setup-layers.py
+++ b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
@@ -86,6 +86,9 @@ class OeSetupLayersWriter():
                 os.makedirs(args.destdir)
             repos = parent.make_repo_config(args.destdir)
             for r in repos.values():
+                if not r['git-remote']['remotes'] and not r.get('contains_this_file', False):
+                    e = "Layer repository in {path} does not have any remotes configured. Please add at least one with 'git remote add'.".format(path=r['originpath'])
+                    raise Exception(e)
                 del r['originpath']
             json = {"version":"1.0","sources":repos}
             if not repos:
-- 
2.39.2


