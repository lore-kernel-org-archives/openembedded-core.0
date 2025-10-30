Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A98CCFA00
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 09:23:05 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.22492.1761816178203546526
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 02:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V++2ZrCu;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b6d70df0851so171731466b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 02:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761816176; x=1762420976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5geehZB+fuuwVs1YevvA3XfvsCc2V3I+PnOtS5bFBE=;
        b=V++2ZrCuQuXzOOEMHX30snvYbt4khAANZrIgbCFiijtVVK1z/UFsrF4Cot47UMx7ZD
         yDPofrc78uDkt+hoNZUI78ACkjTU78a98kaj1Hax3DlXy+na8dlyVjlEoDhQo7lJUVKj
         iKDl54PMsIwM5gjplFdlTLM1lf7zvgYXBBOfXMHXmp2gHgTuayiSLnxWdCPc/qZsn7qO
         BsiGVWSWBAmQhheT5cKvLX0Y+KqbxHl3oD04X4U8ox0oSWdipvss8gzFF3hqDtcCKiIu
         ygAx/qDvIQbBPpwdbEOuuXYdoocWh6644WLH3t2gblpcA/zuydFeiBHnSmmqyjAtn9yH
         dIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816176; x=1762420976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5geehZB+fuuwVs1YevvA3XfvsCc2V3I+PnOtS5bFBE=;
        b=nHf5iTlVOpf5AJLlYTLjOQhQHEZ3s/6lbEq++24ouMf3iattbtzY0AFrWUT5Ghl/KQ
         XXOjZ40kWDAb8vtdPHk2XWNBN7n04kTTeSDEO3hr9zqnC5tMUc3C3/oPUkWBih74gkQ5
         QEAXHgzE9vqovmiJHFUtTh8ysP/nIRCQM0u9d7wJRfTSS14ggjwIex7hvB0mqzk5qRbo
         CBf2BGMc22WRbJoo28FHs2BHUtjry+5cns10niZShxpBKSZrm/Ej3JC3j/FRouuTr6pQ
         qZhrj++8AaDZxEzn0d317dD+vq4QCZmAPmPDQ9aGQaCFZL4j5yQF8rVaVmLo8w0fGdEZ
         d0uQ==
X-Gm-Message-State: AOJu0YzsOoAmx4xSApAYqYlWakamlGVOoVMv24dJphwJbsgU7hESkB6f
	AYthjjsa4D6aUCqmHv6GTCK3UBgRHRKgW0nELa8Xt+LUDR1XzFPfwjdTMfvxVQ==
X-Gm-Gg: ASbGncuyPmMq3Hmtp2tvnynM+QpdfJ+3pnbIX4t7Wt4//8NTUF8gBl21/7quwwuk3Ni
	h97wwCbIgKsPR5QKRDsoN5E8qRqqMzRxi6w278L8MUcJMBj7OuRJ+dSqRbHYvOx8t3XkGO0TDud
	pJjolNZYbCr1DXHpfMC14y1p+AL+h1fovEBRykDI66OlDosR57eGZ7hHvVCoe0RYQRbokOSXKi0
	LFchn/7MTkmxq9KYflTmWF6VAInDyM+0sw5Iyj+KVZShtseGgtrb4YmvBk9vmlNveb6D2QE5vAO
	5/l9aEySxtYdOPiJBzW+3xah3S4Qvs/abDrypRx45zt39oFksc4TazEkqhwYPpzAnkmYXLnt4Kd
	8wDk1FWuob0G/Rg/BuxwBZp+n1zPsMzZpMdYIHkAODvNkFI4/e41Wx6SkYaybpeG+mIpGnIF9oB
	ottyftGlt84VRoKSTVBgkSdICt1fnpeBZW/030oOhr+ui+R4fJXJocXRONAQpc5sjnUo9RItwK2
	1xT8a+qq5lKgfKWycs1Q2QbQ0WHhF11D4ZGFzI=
X-Google-Smtp-Source: AGHT+IEahqW9W9bWIRuRjQ0Ow6puUuBhLUJPx5J7CCRL8diglpobXuqua4fs486SzBLJcNzYBTr78Q==
X-Received: by 2002:a17:907:6d25:b0:b6d:5363:88a9 with SMTP id a640c23a62f3a-b7053b11a19mr223013066b.9.1761816176391;
        Thu, 30 Oct 2025 02:22:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85308c6csm1742469566b.1.2025.10.30.02.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:22:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 2/6] bbconfigbuild/configfragments.py: replace fragment_exists() with a more generic get_fragment()
Date: Thu, 30 Oct 2025 10:22:44 +0100
Message-Id: <20251030092248.723968-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251030092248.723968-1-alex.kanavin@gmail.com>
References: <20251030092248.723968-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 09:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225480

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


