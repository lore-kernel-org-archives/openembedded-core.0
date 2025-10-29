Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF72CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 12:08:47 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web01.4693.1761739723121308876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 05:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L2Ons2mF;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4298bada5bdso6570012f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 05:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761739721; x=1762344521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5geehZB+fuuwVs1YevvA3XfvsCc2V3I+PnOtS5bFBE=;
        b=L2Ons2mFZjsAkjsjFeH43ubzYwwCXzjhBbFLuaPS/Fl1Ll8am7V46fNZ5AmLtHobbb
         0Yh/Q6iErj2N/we/9QpILJR5bd/qP+kP8Fs4uJm8OmfkfMPY5PoEFiEFhBekv+0x6mQV
         KBww8/CmdTr3UUGVjnaD4K8VXF4+qmzEAzhBuUGk/XaMcMkuw0aHZCnU09qELuFrD4kw
         P4Ge7NbuK+PxAzqpfByP875fZDxMV/83EO4AVHG7tGV0t+LO5FQRHTBcSOLSb8gixI3c
         m6CC97zgGg62/MuiikASCislVj+Od7RWkVrZn8bzvNJYdxY67D1HmnEPwGj7rV8e4Hn/
         QTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761739721; x=1762344521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5geehZB+fuuwVs1YevvA3XfvsCc2V3I+PnOtS5bFBE=;
        b=NUjb9FDRyXf7vLGtGoDnbXxDedX4zBRF8bceiyQMeMAXDJdhfsWB3HqZxiYRfF+Hx6
         6h7flr4ALwNkstclqO/guJOBLtG7yTiBXbP/zCnEnkfz+Jn9z4lmpaDLmHtyxFfn5jvG
         81iyWZTuF0e1LcgJugOMIz+D3wt+xdkEmsi8l+OTBEAi085+uKrHC0ZREFl2ZAWCGHdV
         Z2rfTgS5tVpKKzNUx/XprhL80H/a32DPeAMFuEM4X6lDbgJoz0KZqbfj/UZ4kj88VE1s
         taNqcsGrjvWboJu7z/rUZ+V00IKUOst0KQPb1QlPxmP3iZsPu7mHF03bmw7pkCuNMVQO
         SkPw==
X-Gm-Message-State: AOJu0YzfWBeZBrv5HtrY20FqDCs0IyTzUaV3fxTIS59fw82L2yXEqtol
	nGkTISVnOZTQfBaai8nWkwGOCPV2k78kcmxhm4iZwXbi7Karbigrgn1V8HNE6w==
X-Gm-Gg: ASbGnctd/ysRLmg1ETVZlaLY24Nk8KHd+KBgnyJjaZ/fhsp3CSJBJsI9Lbux64TJapr
	l5hhfJe5F49ju2MOswFezQDBBKQ83o4i3iBZUE030rAREXXVY2gdEW4Kny7Ik6fnlVjMrKZxTC+
	dDwO65gngPtyvcoIZF+qlq1yI69t82ZT4bWv5Z/RvqZlBsrq12RZjtMfgATjkUmbcPABTaRbbqB
	azeff3lLBfAFrLblFCBqqQKu95ckYI6YfxeeitM7N271grJCLZjR0mDl30O1LGDXVLeFni6RX7e
	YymOHEQmiINwil0x2qtaZgt2EbEAATPvQXfnNCQ3Kh9CKXyl64ECoT+yedrE5uxRUnRUjvPe8VI
	fBFbluKR1WrJXHJzdMXtCV1IxiWdb20Yfxh8DSQRljh9ETd+xSBEQYRjcCPhRY/DW8OQEojpVMr
	JCnQlUhY/EEZEK1zXiSixp6lk5Ryfo/iPEUePYoi4eG7T2SqaXTdgK47yo35FtD4a7g4ceh4NjW
	ww1haR+YYn9uhbAiHv/JunpPd8jOulL90zMETYNPnVKtnFkzg==
X-Google-Smtp-Source: AGHT+IHi+J1jgOHoRJgFtJeo3iCXuohdMDGDH/BEFWDOWfNZnXU/KTwiol7wZy4Iu7JsbDnt4ko7Rw==
X-Received: by 2002:a5d:5d05:0:b0:3eb:2428:4a05 with SMTP id ffacd0b85a97d-429aef73574mr2235747f8f.3.1761739721460;
        Wed, 29 Oct 2025 05:08:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b2dsm25685793f8f.2.2025.10.29.05.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:08:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/6] bbconfigbuild/configfragments.py: replace fragment_exists() with a more generic get_fragment()
Date: Wed, 29 Oct 2025 13:08:31 +0100
Message-Id: <20251029120835.4075555-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251029120835.4075555-1-alex.kanavin@gmail.com>
References: <20251029120835.4075555-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 12:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225450

From: Alexander Kanavin <alex@linutronix.de>

This can be used to get fragment information by its name (or None,
if there's no fragment), rather than just check for its existence.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bbconfigbuild/configfragments.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index 60cdced555c..59e760f2909 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -97,12 +97,12 @@ class ConfigFragmentsPlugin(LayerPlugin):
                     print_fragment(f, args.verbose, is_enabled=False)
             print('')
 
-    def fragment_exists(self, fragmentname, fragments):
+    def get_fragment(self, fragmentname, fragments):
         for layername, layerdata in fragments.items():
             for f in layerdata['fragments']:
               if f['name'] == fragmentname:
-                  return True
-        return False
+                  return f
+        return None
 
     def fragment_prefix(self, fragmentname):
         return fragmentname.split("/",1)[0]
@@ -138,7 +138,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
 
         fragments = self.discover_fragments()
         for f in args.fragmentname:
-            if not self.fragment_exists(f, fragments) and not self.builtin_fragment_exists(f):
+            if not self.get_fragment(f, fragments) and not self.builtin_fragment_exists(f):
                 raise Exception("Fragment {} does not exist; use 'list-fragments' to see the full list.".format(f))
 
         self.create_conf(args.confpath)
-- 
2.39.5


