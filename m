Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D73D37E57
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 15:48:36 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13327.1768405714359970734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 07:48:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Qo9rD8oq;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.45, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b876b5c69baso13340866b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 07:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768405713; x=1769010513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eT8KLyj8aBeK85Nv0/NPb72uftcbknaGlPN/NVWkcI=;
        b=Qo9rD8oq4nQ/pumighJT3hGk4J0z0Gs90ULm+VoXnNCtq+8svcnin0I4XhZv0/741G
         Xuzl6xPZ7A4teC9zLpXc1T/cD7NlQOWHdHATt+WBu3j1eHDOihRC77qXjaByxDz/tl8F
         EyxfbydM3ziau9n7X0xr1JmyzPmwaEyPUr4mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405713; x=1769010513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4eT8KLyj8aBeK85Nv0/NPb72uftcbknaGlPN/NVWkcI=;
        b=QS66ylZzSouPbjT7N1QGyOTVXCQT8EZMviWDAJo5Afylwi6Db4euwDimMuxv7r25rg
         KeppEkqEzyOLDw7LIjnUJdM5VtxHCYgcdnC0b3wGN/3vXJ2YO7xWUgB4JPxuyEkucY20
         OPmFPmYvkZx3gaVJptmULLpHpBuaCnsrU7k+0Nwx8lR0tjzr6kYFRb/xHe/D21K6eyOz
         yeIUQlhcfHSPO3rg0/hGPrizIdKc5P0Sl5XJOpnChX0aKdK8pCsT7VH2HjSUyTezPZYB
         U1NFUBqABA1qWv52JOzugLw9YAo0lV5ghsjIz6PdDouQ19AiF9MsVb8PERFLwr5HKGRC
         lK3w==
X-Gm-Message-State: AOJu0Yy8UaYgmGhjMNYjskug9TdlCx5hPFx0wH7eauS5cRJyfxL+RUiK
	HczZy170QOLrqnRuCj+ggbYPPb3j6kbFurRtXkxxV80trF2ZSDseheHp4PXBQ1xMWux8gA2QIVk
	6cb34
X-Gm-Gg: AY/fxX7xivlcN2x+CS8zbwCqcsNgENxt9Y6iiSa/NHL5lMZnWDQiBYCp0zXRX3PMxTH
	R2haTSJssMSDhOoASvgnQvVs0REK154WsDxjB13VOddMREBlWqNLZQreNEvdzfx3W1js7OHCFAU
	Us9XINMn0hEfGFQiOROXiOetAkApx8rZfNDluqCJKB8QTSNql1l03BZa2rkDyrkqmQED+JroTbt
	IMx//mLjXi5cOLZ2UKN7UCh3QnVBDgYHFxBPOYoiOmFKfO3kXL6dWnDDutHiWqgqplB08h1Hjw/
	0kOSEbIDDQelLYq5DckYHw5s4lRr0v7yk1cSrYU14Fk/XT/NQUg8afpcUave3aAUrnodLqtcyZV
	MU0fUZa/a+I9S193/FcUbJF2MT0gSqfsfHmOwL4s7IacNhMsoKPgFH1Gw2QM/ZP7IzvueR2VcKj
	ar40Xs65pvZfuiRQG93KPvKZjMj1tHQHhlciboyIyO53n2H1U2kSA8Djs/fE+6YmXLOwTMNha8T
	Em01M/MMJz9hlAA/G62EzrN1oC+NQu0jMx+dInhGk7TDSdZCFwR
X-Received: by 2002:a17:906:6a25:b0:b87:20c2:e837 with SMTP id a640c23a62f3a-b8761293471mr153477866b.5.1768405712796;
        Wed, 14 Jan 2026 07:48:32 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b876e9ac655sm135616466b.6.2026.01.14.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:48:32 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 3/6] wic: extra-partition: Move extra var handling to a dedicated method
Date: Wed, 14 Jan 2026 16:48:22 +0100
Message-ID: <20260114154825.4043483-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114154825.4043483-1-adam.duskett@amarulasolutions.com>
References: <20260114154825.4043483-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 15:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229340

For organizational purposes, and to make the following patches
easier to follow, move the extra file parsing to a dedicated
method.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../lib/wic/plugins/source/extra_partition.py | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index 040b6d22ad..d41743ec40 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -36,6 +36,20 @@ class ExtraPartitionPlugin(SourcePlugin):
     name = 'extra_partition'
     image_extra_partition_files_var_name = 'IMAGE_EXTRA_PARTITION_FILES'
 
+    @classmethod
+    def _get_extra_vars(cls, part, var_name):
+        """Get extra partition directory or file variables"""
+        extra_vars = None
+        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), ("_part-name-%s", part.part_name), (None, None)):
+            var = ""
+            if fmt:
+                var = fmt % id
+            thing = var_name + var
+            extra_vars = get_bitbake_var(thing)
+            if extra_vars is not None:
+                break
+        return extra_vars
+
     @classmethod
     def _parse_extra_files(cls, part, kernel_dir):
         """
@@ -43,16 +57,7 @@ class ExtraPartitionPlugin(SourcePlugin):
         """
         deploy_files = []
 
-        extra_files = None
-        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), ("_part-name-%s", part.part_name), (None, None)):
-            if fmt:
-                var = fmt % id
-            else:
-                var = ""
-            extra_files = get_bitbake_var(cls.image_extra_partition_files_var_name + var)
-            if extra_files is not None:
-                break
-
+        extra_files = cls._get_extra_vars(part, cls.image_extra_partition_files_var_name)
         if extra_files is None:
             raise WicError('No extra files defined, %s unset for entry #%d' % (cls.image_extra_partition_files_var_name, part.lineno))
 
-- 
2.52.0


