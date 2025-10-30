Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE8ECCF9F5
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 09:23:05 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web01.19199.1761816177587050154
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 02:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U6cym2C8;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so107819666b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 02:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761816176; x=1762420976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YFW2Qo8Rd5Mlmq46SBmrGDgobhiW+dt6D7ZuKkgVJcQ=;
        b=U6cym2C8oL9kNpqHLCZEtGcotqr0tGW4Shv2rhz961cdPlgaRw4ANc0qzuMLRttf/A
         ryadHVXSLxYRAIfNa6DdBs6EIe7rEuKHkQUeJzVnf/7nHqOYkAfuw8oP6D8jj9YHbdIh
         NLmYi3Od+tRVlJSZ3xoDUGpVCqJwZQ7nu2AiO5aO17THwd1z2qRabQUiPMCwy3zXjb3v
         Uo9nuwGGmb/kJXHt4Wb95KjrDNKiKduCtDn+pDs8wyUzA3ZW93LJ7uejCd0+RNhquZ02
         oK4sZgHFKBkBKA8YcJLibv6Qz+18AjiC2MhuEZ02QzjQGzyOWVCYitvo7JTZbpydDvmA
         3Qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816176; x=1762420976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFW2Qo8Rd5Mlmq46SBmrGDgobhiW+dt6D7ZuKkgVJcQ=;
        b=h0xDay/aQaJUtRJX8JWSQ5cy5KsPMgKp+P0Pny8iVrPl44JYfVHOGJYQxC4pWgqGft
         Z1fvgf0I98HTA5blKCmmA4Z7LPWxkJMx8OudF+n0T6LdWLNuhOErhzwcjC33L3gOM6jx
         Rz/x/Tg7SysmfNMQ3hlzihvlbE4ElaxxaJqogciXLM9P23X1LawPSB3eJZMoIbky14Z5
         sPa37P1YUJEFz94/tGqKkOGmNTSdvFVdIgcaYieDq46FqyyAPvqVGw2EvqQZhUiAm9fA
         phDawOZoAJdXiQDMRDVw3l/SBBwXAi78xOdN0LLld3y9Q52+Z1ak/aCeTP9HiK4d5xsO
         w/XQ==
X-Gm-Message-State: AOJu0YyEyy2uiBR4RaVRuVdIE8cI6LPNvBI7fwWIPCvcK/9cgbTbJfJd
	UIzyuyOHcO52GZcMJb2pe8JpDM+b57Ebpv9besQyGE5L6LA7YcQhg25AyTG1lg==
X-Gm-Gg: ASbGncs1Bxnw+JyM9z+/wHPD+Ihwi7SvcGWGFVxyHuxsgtZQbYZkmY6mIPNJYKkxGTu
	WojK29uVWOUMvDey72PGkpgNsORT4Jum1pnHfPDtMvB1uJeumiiPmv9JSM9pLNE1vVUtbCt0uXY
	yQQvKYtQFxKbB0ixUoft3x7zgVj47NUME8sfzb8w1/tpvm0Z2cr8enGXaEndGYwjYW3vUxbc2io
	D5hfzZyt3AKBARqmm6vR7AxG5Rao8JZ0NnjncZIUn2qMQdugBFPImwV/+r1RPUsMehOPwK0x9wU
	jzygkrn4M/MCq+IYG72bvazq5Ai/O1Dkf2WfzHPUg9aceXgKaPuE4c+7xR8Ybdtfs+y6QWOvnbt
	D6nORESpshqsisvcZU0l1KQ2q+8OHifiSr+algbjP/jayArneSCIDuOAtwl0XLaE1WF4BtNpc6x
	IOQiqGZeB5Xsg2B1ejtlgpleD4sb8UMey1s7sQoRhT+TJ5pZDoNuLmwf/HgiDXCmqrmMVFST4/b
	iBPTWfZ2ClyCCGoi1ZYTsuSPhc8XM1y8q0ZP5aztoC9FteHGg==
X-Google-Smtp-Source: AGHT+IGMAdBk0jWXop2ery9w8MlCZzWOpw7HR/djI+k9ydk8NPYBK8KJJGzVjh8UTsSLZcBjnHKWyg==
X-Received: by 2002:a17:907:7253:b0:b6d:2c70:4542 with SMTP id a640c23a62f3a-b703d4f7dfemr593083666b.30.1761816175649;
        Thu, 30 Oct 2025 02:22:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85308c6csm1742469566b.1.2025.10.30.02.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:22:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 1/6] bbconfigbuild/configfragments.py: run discover_fragments() only once when enabling them
Date: Thu, 30 Oct 2025 10:22:43 +0100
Message-Id: <20251030092248.723968-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 09:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225479

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bbconfigbuild/configfragments.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index 21baedc9a42..60cdced555c 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -97,8 +97,8 @@ class ConfigFragmentsPlugin(LayerPlugin):
                     print_fragment(f, args.verbose, is_enabled=False)
             print('')
 
-    def fragment_exists(self, fragmentname):
-        for layername, layerdata in self.discover_fragments().items():
+    def fragment_exists(self, fragmentname, fragments):
+        for layername, layerdata in fragments.items():
             for f in layerdata['fragments']:
               if f['name'] == fragmentname:
                   return True
@@ -136,8 +136,9 @@ class ConfigFragmentsPlugin(LayerPlugin):
                     enabled_fragments.append(f)
             return " ".join(enabled_fragments), None, 0, True
 
+        fragments = self.discover_fragments()
         for f in args.fragmentname:
-            if not self.fragment_exists(f) and not self.builtin_fragment_exists(f):
+            if not self.fragment_exists(f, fragments) and not self.builtin_fragment_exists(f):
                 raise Exception("Fragment {} does not exist; use 'list-fragments' to see the full list.".format(f))
 
         self.create_conf(args.confpath)
-- 
2.39.5


