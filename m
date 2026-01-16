Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0549ED4A61C
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 09:32:25 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2465.1768555942395956953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 01:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=omleZTjD;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.48, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b873a14bb99so31381466b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768555941; x=1769160741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8y/CmP55xsrs5A90HHpW0hBBV/60nVQ8jDDmIqJBeQ=;
        b=omleZTjDIM1jWuH0IZML/ve2TGUnfkpLgkjcg6oomxSC/PibeAioTYSLu43etdxz8Z
         5D/1EszgmQAXR3ZL0XU+RxMjwjv6LCfmFJLLOPlRUqTs3Ua1SHXPV3JSnBHzP6Tz8223
         6ShE+JpyA8ACIfyDohRhlvkiB/DZnnmt37C2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555941; x=1769160741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/8y/CmP55xsrs5A90HHpW0hBBV/60nVQ8jDDmIqJBeQ=;
        b=n/r1Wwjv4xApnguOc/IQ7GTyC7veeg9sgakqB2xfWx9yhDFAKgW3hvap4TV5dAGV2W
         6dgeIK0Z6+xy3dFI+fUDYBdkcb2X1tvTNfdHb68sulQ87oOjhrec1BcUtvAGV/M82Yte
         rcJnKH0ZtMlODyEnMVPs5SPqRNN/8LP86ovljNRzx/yFjGOSDFt085aNBEtbf2eCg0rZ
         l49WuL6buh1aVFcq762NIqJ1YiIiDBHFtwHMOjGQgmro40WweUcEVJEwJHP6i5K/fGF6
         fcFXU51GU5TwrVmnTwtdDi4bPPfIqZ+eq5dUtORbRB/h8zh9G8tu3e0/N7Kxg6yTBAhs
         20ag==
X-Gm-Message-State: AOJu0YxMLmiy/iv9+BIuyUgCXosjGt8f8EW9HjJl0nPkL+Hs93L4vOuw
	flz+CXIvK1Jwij4nd10tJHFUszrkF6wqXrkFkCSpYBSa+JPN+YQiJfMHXn06yvf2B5a61oNR21p
	XdORz
X-Gm-Gg: AY/fxX5HGP2iViraG+9OgNRZN+cy2f1AId74xouG2Edba5AhxZ2Corp76tRsxc+VZtz
	aIWZuTc4w1AZY4Jl+dfs0dh5rAyZDLRj4pGNoQ3jXavYlxAawJt2ilVYYaOL+kP+95BvxLTG/jv
	w5OuWeStqfCWI6YEG+RSb8AzLQlcEFByVkVRVsMaCha3Meky02S3J7W1FnUuwN7Nr1zsFZsEOeh
	GGX8wKfDZZeUm4ARFzVoEm58OgJxE7CF9YgemboHIV/HmfoSWdx+njoOyVm/8wyBw4kDDsKtBJS
	fPjS4/AbC7DEJbw7mcWM1yibV9O4I3UVmWW+tFb+kTD9+4E7ZeRJLvifzPTQlK6z1tVQbhJawKc
	9uVWIZ7Vz2LZGsFJtvLBqA9m4Vu22MdYq1sj3jqb58IrDh9CGnUfC+hEsF9s34rjvOZErz8du4k
	YExzXrgVZlW8rHz/sFyXICN3qWKukXHVLyAHJciPt9uCoVJ2iu9u6Pl25vEup8FocjE7xkwwpp5
	eD68ykoHrMTsDNU3YAFZCxdOc6B/aoUXN4T0+JWdaMWJ9lWdkvq
X-Received: by 2002:a17:907:928b:b0:b87:1e1:e562 with SMTP id a640c23a62f3a-b879330b4e2mr92197566b.8.1768555940754;
        Fri, 16 Jan 2026 01:32:20 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e6d3sm187982366b.4.2026.01.16.01.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 01:32:20 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v5 4/6] wic: extra-partition: Rename install_task to extra_files_task
Date: Fri, 16 Jan 2026 10:32:13 +0100
Message-ID: <20260116093215.26108-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116093215.26108-1-adam.duskett@amarulasolutions.com>
References: <20260116093215.26108-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229534

Rename install_task to extra_files_task for clarity

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: If the list is blank, print a warning instead of an info.
v2 -> v4: Raise an error in do_prepare_partition instead of making
          extra files optional. Extend error message.

 scripts/lib/wic/plugins/source/extra_partition.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index 05b0ace361..25aab06c52 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -73,7 +73,7 @@ class ExtraPartitionPlugin(SourcePlugin):
             logger.debug('Destination entry: %r', dst_entry)
             deploy_files.append(dst_entry)
 
-        cls.install_task = []
+        cls.extra_files_task = []
         for deploy_entry in deploy_files:
             src, dst = deploy_entry
             if '*' in src:
@@ -92,9 +92,9 @@ class ExtraPartitionPlugin(SourcePlugin):
                 for entry in srcs:
                     src = os.path.relpath(entry, kernel_dir)
                     entry_dst_name = entry_name_fn(entry)
-                    cls.install_task.append((src, entry_dst_name))
+                    cls.extra_files_task.append((src, entry_dst_name))
             else:
-                cls.install_task.append((src, dst))
+                cls.extra_files_task.append((src, dst))
 
     @classmethod
     def do_configure_partition(cls, part, source_params, cr, cr_workdir,
@@ -130,7 +130,7 @@ class ExtraPartitionPlugin(SourcePlugin):
             if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
-        for task in cls.install_task:
+        for task in cls.extra_files_task:
             src_path, dst_path = task
             logger.debug('Install %s as %s', src_path, dst_path)
             install_cmd = "install -m 0644 -D %s %s" \
-- 
2.52.0


