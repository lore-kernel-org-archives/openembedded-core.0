Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBB5D41161
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:14:42 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32364.1768472079080674019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 02:14:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=SdlaH8M/;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.54, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64b5b22f723so131123a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 02:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768472077; x=1769076877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbqtCxy1aIUAoDNXAqbqLiAPApKlcNCX+JDNcW/83fM=;
        b=SdlaH8M/Ln6+gXRQCCbNpA6Gp+AIaRjLRtn8SFBBKgzMv1wIlSpsJbXH43kxgCNKjS
         OrVNGD0FNiJnMm1nxOxzD0aSx0/ub5tib1f5ubzX451bSmbDzRXa5EHZVfA6la+ojW6u
         fgkBvGD04+wUrNjF9SQ2dDHdxIS3AFlFFVyDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472077; x=1769076877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mbqtCxy1aIUAoDNXAqbqLiAPApKlcNCX+JDNcW/83fM=;
        b=I08LES0EyIM64FcXraIwKwmkueb9zorXZPh+yIoxnXqMxnFv99ONyUUeSPhEb7y2jS
         +oXrsLIuLB9TimsFUZFFkQIHYr1WNXYVkjctzncZfQ46pA/ixDOuI2hp+ZJveA4nqsQA
         8svxqFc8jeBflNeCr0OsgDso2ZMh8qOIhjlQcJpr2S+4xyx5Qv+Md4wcU/zea+tyXaym
         KyXsHX65uOjQFxr/t9XAY64fgaRpKJCcV57h0dRzN/b7MyOAY6mvLhu0UenX/Kaa/mpc
         WhF6KtAfc9d6UStDrl2bhFscMXdmztt2TTOF2JYKlZ6CmHmejSJQ5k+QBye4FVSz+BBk
         +LRg==
X-Gm-Message-State: AOJu0Yw22sHRnLMrvlV10/x9vVZkIZQKOMIxP8nDeTFddIOQmwSBR/Fx
	OBqkDlEzfxO7QmJnQp3T86HGL54zVSipcvvxyKxNOdpE4uRrD9jveuba85kHvm2662gRjCpUz2D
	KCHh3
X-Gm-Gg: AY/fxX72SfNVf4r47lLWaofA1Cl5j5Xxu2c2TAc+VgE0oQkFCKvglemH1Y1SVA9WgfW
	IuQ09IcZu1CEFDnv/QcdLxbhL78iGpYIJ5qMnV1Ja3WUFi5fvmBAygrakaDLq+lCvnzDCFYHjoq
	Dba4cwHcgXdQweYUXl1D69ntGnfJ8UC9QpssX8eFul/YJs86z0e6wkf9rTGsTfqS9gUaDrY+sAp
	LMp4e4rVbIsOnhqBJnD9o5sR3fHlyQkrYiWPyUbDitdcK0XKz/HDqWIUzcANNzJVIV35VNv5m1p
	QpZQnVZYd8D9Enz7vLkF9nXCHOzxSsoFD4KjwEC1CKu4jVnwz4vpSjHtuiOw7igQsnjQnmmpN7G
	PznUetlJoWXVZsYUPhVjOe1p5JnwYaZ/VII/LZp+23QoDBk5MrbCogKrjTyWKFbl/tkDGUcT2HB
	t8bT+CR1kufmUnF5nyIiUrxUy6btU8oYAdbQxRUzPL2i7COI4ROkKluOMgGJRc4P1VerXCVuxj2
	u/tcFIyHByGW0QzXUysAL/K6ShXCFBxEKIFxn3qBn36wq929pKUaCjmCg==
X-Received: by 2002:a05:6402:40ca:b0:64d:521e:161a with SMTP id 4fb4d7f45d1cf-653ec466877mr2548187a12.5.1768472077499;
        Thu, 15 Jan 2026 02:14:37 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6541209cd87sm2038643a12.35.2026.01.15.02.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:14:37 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 4/6] wic: extra-partition: Rename install_task to extra_files_task
Date: Thu, 15 Jan 2026 11:14:30 +0100
Message-ID: <20260115101432.162696-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115101432.162696-1-adam.duskett@amarulasolutions.com>
References: <20260115101432.162696-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 10:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229402

Rename install_task to extra_files_task for clarity

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
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


