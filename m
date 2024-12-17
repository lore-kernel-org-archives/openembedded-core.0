Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B1EE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 14:07:18 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.82190.1734444430681718994
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 06:07:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VqGP2mXG;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401e6efffcso6129138e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 06:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734444429; x=1735049229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AJajv3STajgaqd47RkyXaQ/I5dAFR3muztaz98UKm50=;
        b=VqGP2mXGgYX13ZZDnzgiq/6zewdHv5d8om82JLY76Af27HDeeyLUKQYZHK2LA1f5bn
         bg4aqSUoFF7FDOqtvJkpTcVlvhZQx/MibugIbbhzhyMNqVwNpUm6/y0F/g4IAN8eyiec
         EtQtIuCB+zLvxkuY5k8YDCHBsTMp+ixDvNSipxgK50j+3/1UlJ/iu2bTry7afi8y/4gk
         cgFqtVPqHlqLiVgbBw2l6LDxFevuT3F5QIJsGZUTS+sAZjPXvLOA2leHdxlNzWAOvmRg
         /mrqEzOcsoNpntZEui+OcCliEeOOIyQ5RAbyQQHVuf92F7DYyHpPFK6XLaV9Ecv0lNW/
         2srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734444429; x=1735049229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJajv3STajgaqd47RkyXaQ/I5dAFR3muztaz98UKm50=;
        b=L5vATuFiPX1p9DQYNH9Pz51tPJ2trcXy5Jjf2B2MOAYJMZYDoq+P1CQUhsaC0mQbwQ
         PlGz+6TIr8m3REPhz2qlPmkEFPM0iFY2mWO4MBCLZkKdD/Ojpx5O4Vuldyt897vHQQ1J
         9zethFVfLR94c4KV8lT89ouErwbZQjL57nNuAoUpx7IKXRQnI9dgfhB0hnjGm0nkeC4I
         Go6jec/SPcdDY3mVppbgTqOtZY/sfz4WQboZfNZtssZ0Qu+1XaLu7g/VWNEr3BV0Zsgs
         cteqeyZsNHncdW9jGxxz2R/aUYapqGJkOfIj1VZzDuEOY7QIoouKzVwPAC1redWU+6Ew
         lEhA==
X-Gm-Message-State: AOJu0YxL4pbnQOh1lCkzTecEoZg7Ej6oiZtfoLWMRUBmW25GaQc0dgzg
	Zre2NGCLRbkTUAci4ayvfbQZi2ZcRvo+B64xrxLt+Q9Hg1bRCBlBfoumKw==
X-Gm-Gg: ASbGnctyWxFTKLZmBIR7MQnHM55gn5/lpY7Y/T9KFiTTei351g35nDH19fbU5YlB2Ma
	MNpsS/IRO+9EhoB32RXd3KYcLTdpYVeIYiSi8gEB1pjZMoAnWczUmVzaLOd1ndjHUEmrup1TrL1
	LFxfaApZw0Y/uaPVMMPS50q/LRdCGTcXA/nDWmxeZ+WlrEd4K4qsU7hQoHGh3wtmB9KnipoVSxQ
	N630UCWJ98w38g74jgdM639zsMgDqm0PvyVkNWRDDEokTLJkIwmZnt/8jUxTqczSTdPO5E/L0Dg
	XkMdAgNexEbP2W9IaA==
X-Google-Smtp-Source: AGHT+IEh6P5oIprrUPxIPbV+GiwCA6cbydEKFQhc0Wb4sWf8M0O9NGQhv67voIxEDZctjo82jfBg/A==
X-Received: by 2002:a05:6512:1296:b0:540:3566:5b37 with SMTP id 2adb3069b0e04-54099b6a827mr5850498e87.57.1734444428362;
        Tue, 17 Dec 2024 06:07:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9638ec48sm450784666b.147.2024.12.17.06.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:07:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] oe-setup-build: raise exceptions on errors
Date: Tue, 17 Dec 2024 15:07:01 +0100
Message-Id: <20241217140701.1445851-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 14:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208840

From: Alexander Kanavin <alex@linutronix.de>

Otherwise the tool simply prints what went wrong and exits without error,
which makes it impossible for tools like bitbake-setup to determine that
the requested operation did not succeed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-build | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index 80d8c70bacc..49603d9fd17 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -18,8 +18,7 @@ def makebuildpath(topdir, template):
 
 def discover_templates(layers_file):
     if not os.path.exists(layers_file):
-        print("List of layers {} does not exist; were the layers set up using the setup-layers script?".format(layers_file))
-        return None
+        raise Exception("List of layers {} does not exist; were the layers set up using the setup-layers script or bitbake-setup tool?".format(layers_file))
 
     templates = []
     layers_list = json.load(open(layers_file))["layers"]
@@ -77,8 +76,7 @@ def find_template(template_name, templates):
         for t in templates:
             if t["templatename"] == template_name:
                 return t
-        print("Configuration {} is not one of {}, please try again.".format(template_name, [t["templatename"] for t in templates]))
-        return None
+        raise Exception("Configuration {} is not one of {}, please try again.".format(template_name, [t["templatename"] for t in templates]))
 
 def setup_build_env(args):
     templates = discover_templates(args.layerlist)
-- 
2.39.5


