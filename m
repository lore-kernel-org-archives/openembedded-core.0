Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87901C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 12:01:56 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.9016.1708689706164187959
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 04:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NImkQiCo;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3fd9063261so45279966b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 04:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708689704; x=1709294504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q21Ze4Xo1FqnTNlgq9oxGbt7Xk4ojTxu3fTx4YyPq/c=;
        b=NImkQiCo9V+wVGlJdjsVy8Uf8GQm0UpI0e7AcRcyEagrUEHJP9iD0lUJFLaRUItbkj
         M7wnKgugheXa/7EbvMnAuakBHeOEoKVBSqljUSo3SJtPFW55Wt6rOGbfr5QWxfrXMbcF
         beylOlPGL8ZPEJyjT06p+9tfC2CyBJj5QiKhsDVpuFd+ib7DtP7rGKwy/AZYTqwxpJXj
         7kHTZJBnuIXPkvs+KKQZBwuX6L2CoHZVhR+hn9nAkVKymjK8Cgwfb3usHmnqXRpRygC+
         NxcKOreT7LSZFVNwXJVD0paqD8bk8uaZXjzmZc3NgFdw38+ChFpfK5GAhc86AWSRTZw6
         rbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689704; x=1709294504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q21Ze4Xo1FqnTNlgq9oxGbt7Xk4ojTxu3fTx4YyPq/c=;
        b=Nr/9FyzVlhdnV06C+M44Bfoh95mDOKucipyvPtXwTEBhnwQkiTLogNBfV6zTzljQjS
         lfr1HzsA6Tnv6EWPA9izJJr5RCin+jAPV8gAZT2TmmPVA/ap4W676lnh259a3ScKu70B
         uemAZxLPbZkTS9+Pkl2fcMpC5FZy/70irmNmDUPBIreGae8d35Q642txJ+c9OHblJY41
         v2Fdo26oOoBpQL8uT84HGcrvKH/mzrn41VQfYJm1OBcsijHjF8cZV+hOqQiBpe/cMZhC
         WxuAkQe7jsSu0BmV2vwGAFTkZTphCxKLB5fGy+L3khSXH6G1XO/2Wzx6boL2tYGdJLjw
         anBw==
X-Gm-Message-State: AOJu0YzIQVQAABjX0/+VYvYO/ak5QL1qNdb2XSXSkr7eyWvBQFCcJ3sC
	L9TjJfTLiyqLbWZg8i8szYxIVrgpDPvvDrWcI5f5FjM0PUuVULP/YrSHfrBC
X-Google-Smtp-Source: AGHT+IFcHIRPO/+oUhigzXuivFK94a5JtBMoQoDnfEIxkT8AIUQLWpvyuqUeqR1TpvSbKbK0u7ikjQ==
X-Received: by 2002:a17:906:eb0d:b0:a41:309d:8a34 with SMTP id mb13-20020a170906eb0d00b00a41309d8a34mr246205ejb.56.1708689704597;
        Fri, 23 Feb 2024 04:01:44 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906345100b00a3d125b9c0asm220330ejb.81.2024.02.23.04.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 04:01:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 04/10] bblayers/makesetup: move check for existence of git remotes to oe-setup-layers plugin
Date: Fri, 23 Feb 2024 13:01:28 +0100
Message-Id: <20240223120134.3713127-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223120134.3713127-1-alex@linutronix.de>
References: <20240223120134.3713127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 12:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196064

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
index 814cbb6357c..ebe6bd5440a 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -76,10 +76,6 @@ class MakeSetupPlugin(LayerPlugin):
                 repos[repo_path] = {'path':os.path.basename(repo_path),'git-remote':{'rev':l_rev, 'branch':l_branch, 'remotes':self._get_remotes(repo_path), 'describe':self._get_describe(repo_path)}}
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


