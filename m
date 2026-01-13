Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF69D2D117
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:43:23 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60625.1768315399216616627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 06:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Hn/VI6FN;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.42, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b86fc3711ddso68099066b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 06:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768315397; x=1768920197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzRIDMqUJl+hD74DDhM01pKGrpdlHt8Cj43+PhA6ebE=;
        b=Hn/VI6FNk+3X7e1AmikToLMkkfB66sg21QdNHDx/5Xg/O7Z/MVpFr6uwrvBZe7oIAX
         M04EFD67uOe/H/EoS6TTmBurwzfsv+UR6ADgfnKAKLG3HnmJMJegfcwXz+iJLPZbc405
         /zsIXCNKVm9Ufsow3ubIpnU2h6rAAUUHiqvoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315397; x=1768920197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzRIDMqUJl+hD74DDhM01pKGrpdlHt8Cj43+PhA6ebE=;
        b=hvsM+76fATsMmWk/ZeeP6LNHwEC6JJp1KxiAD6KvzUJdKi9YTUATpJJg8UrjgsK5BP
         mUzqc/6HnWJZnFs1njRPzuOfqyvCoVANMmeE5HiFcmYP9cdKnx3CspQJCrwqQ6RWfIDV
         gpeNPOcPqMP+MfJzLBNntxcetWIfck7N96JqBQ8/sc9qp7zbgE/FMMgxrbCH7LINcyxk
         TD7AWtBEhoEehJCnkws1OLECO6nQikUkmBI3jruSCfR68kBvs2Sr+QSH01nEFKxTOxda
         DBDr867i8IjY6goXyRbxEabkM1DM1WyVOQjnVubrSaF03VThmi1sYxRSxJG85qhXsgYJ
         /ePA==
X-Gm-Message-State: AOJu0Yz66DKkxnfwkakNEujTczZBaKcuvtAacjgVzsKMqFiUBG7mbFDs
	YHK955RZSXhzp99RJWOePedU/pKMWfzM7LkC/AV7g+BYYrMylslEty/rAMxTgr7bQJLYPkJz7br
	rIlIm
X-Gm-Gg: AY/fxX5Njg272zy7/bmI7dStbMR7b7zKWLQOG9Z2zlKQ6eou1BxpMyU/rcP2vxXEVr+
	SPr8VqD552TJ/0h1KzhwYGF/e+BVTeEnjV7wWkGJ8Rd4Eov5xW+v3b2zmZLHc0vS7MNPGUKvrKB
	B2QVMKxRgnVFOx5TuwaJmPFMUpKiCDXPbSUf3H1t/uErA5E3Fp6ThJv+R9F2dLaC4wc6JuaI1/g
	zrXpyzx4UF5M67OwdqZaXgT9NPtOxjMXzsxaS6783BTKlO6BOm/UKtu7ZaDojSlbXgoeXq4GRbI
	p9LL6+QebixQyyd0q5z38bIdnmcdmpllxN7+KEENFSuVzgl1tZuE0ZsbnqwXHzLxdi8J/nY7fQi
	S6wUTwb8JnzeB7RnpKoDg1TJThbnXXV9zF+frEVrk9VtRm1w2C37XdFXq8OLNcP/G1yFTfMkdUQ
	upH5/b7dlebg1hk+jtHizZn5go9TQUNWymviMwwEu3xkgA2xJir+8Wh902obuYK3IBn5O5Nbv/4
	M8tyXtMIHkebXGA8Y211gEYfK8sHq0cIaSiBxdw7CZ0ZvbFH7bu
X-Google-Smtp-Source: AGHT+IFrCEDIATme6DUMkU4n9Eydh5xmq4TDnfb8hEKhBz4oLotfr6Rco/70+aAjkfjHrR7odeVTgQ==
X-Received: by 2002:a17:907:c0e:b0:b87:515e:654a with SMTP id a640c23a62f3a-b87515e9472mr37606366b.2.1768315397483;
        Tue, 13 Jan 2026 06:43:17 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a23433asm2244955266b.3.2026.01.13.06.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:43:16 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/6] wic: extra-partition: Small code cleanup
Date: Tue, 13 Jan 2026 15:43:08 +0100
Message-ID: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 14:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229267

- Remove redundant charachter escaped in the src_entry regex call.
- Remove an uneeded semicolon for cls.install_task.
- we copies -> we copy

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 scripts/lib/wic/plugins/source/extra_partition.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index d370b0107e..a1d9aa9a7b 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -69,7 +69,7 @@ class ExtraPartitionPlugin(SourcePlugin):
 
         # list of tuples (src_name, dst_name)
         deploy_files = []
-        for src_entry in re.findall(r'[\w;\-\./\*]+', extra_files):
+        for src_entry in re.findall(r'[\w;\-./*]+', extra_files):
             if ';' in src_entry:
                 dst_entry = tuple(src_entry.split(';'))
                 if not dst_entry[0] or not dst_entry[1]:
@@ -80,7 +80,7 @@ class ExtraPartitionPlugin(SourcePlugin):
             logger.debug('Destination entry: %r', dst_entry)
             deploy_files.append(dst_entry)
 
-        cls.install_task = [];
+        cls.install_task = []
         for deploy_entry in deploy_files:
             src, dst = deploy_entry
             if '*' in src:
@@ -111,7 +111,7 @@ class ExtraPartitionPlugin(SourcePlugin):
         """
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
-        In this case, we copies all files listed in IMAGE_EXTRA_PARTITION_FILES variable.
+        In this case, we copy all files listed in IMAGE_EXTRA_PARTITION_FILES variable.
         """
         extradir = "%s/extra.%d" % (cr_workdir, part.lineno)
 
-- 
2.52.0


