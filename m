Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0075C47DB3
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 13:24:48 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.22434.1706880280810867820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 05:24:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FRdzMKvS;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a2f79e79f0cso292789466b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 05:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706880279; x=1707485079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jt2+C7JlB3I2UBezUhGp3aHBO9FjstKv+/zUtTOroho=;
        b=FRdzMKvS8Qj8AFnQLGISS9MB6o+YWBevdLXcUDiCUWMimh7VnYvDKmbHlS36vfKLQW
         Oarqlsmyq4reItM9xglU0nRLv6EX//X45SI+OUBZvYPU/ASK1JoTU6TkwQ7sN6C3mq28
         c8hUfO5Y/PBbzyyR+5V4a5dfauldayydZXFH57RohXuYXGu2VyUhTHUc6qKHsc3rzbHa
         zggyE1AqWCFj8PqHY8W5fH6W91fF9AzOuJVQA6hbflPZ745mqFH/fdvNjUEw8kQpoJLv
         Bw1GalOMF3nHFKp87kgqWDSUiOyuEe6TL5lTNUtTRnSqg1uj9yOjuktdI6ibMxHt/xxy
         wxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706880279; x=1707485079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jt2+C7JlB3I2UBezUhGp3aHBO9FjstKv+/zUtTOroho=;
        b=DboyFRyjjxbdTEGoluZNEEn/chS9icmLePOzVK8HPZF5EWrj42vtPWyezFNJ40p/wN
         GRM49lXUZO/aUA+mU8Jl4qOIFKyIo6OnNeBWvzF5ktgHiJMSPcawo4It8d95pGJiO41H
         RdLklAw1uqf3MCH9w2M+Kz5/KdDs9N/HWov9X2iRKFHrVPDmHQw2p9yMIb5FNEC0KIlG
         Tblixhow9Hr5pw3pJ6AYXP85eqJcB9KdG7A3dlUpD7zT3L4/wukxXAcTQyhlLcDdKMg0
         CCsLS/s4oO476pnL+bwFMQ5R1EVqE1UXfDuMT7QjbK6AhQpDgl3e+bo2wnR7vknaqZHv
         IgxQ==
X-Gm-Message-State: AOJu0YxwZG05/LNjWzXR3yHLWT3/CaxJCN4kAPU5C9oxn/ctIYxitMxQ
	YqfA+YEdDfFpUJuTkq5PJ5weJHYsv/Ivasf/V4hlnYzvuVQvKsBFUdEfg/lE
X-Google-Smtp-Source: AGHT+IGWZaXfNe0GQoZ+3Y3z3mCY6ABJkSabZOxA3rCC6DfZxgy3C6TbmLw8bBWwGBv9vwZQkuR/7w==
X-Received: by 2002:a17:906:52d8:b0:a35:9e3c:80dd with SMTP id w24-20020a17090652d800b00a359e3c80ddmr5560771ejn.5.1706880278921;
        Fri, 02 Feb 2024 05:24:38 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id wb14-20020a170907d50e00b00a36fc7f0f85sm767836ejc.47.2024.02.02.05.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 05:24:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 1/2] package_manager: ipk: add OPKG_MAKE_INDEX_EXTRA_PARAMS variable
Date: Fri,  2 Feb 2024 14:24:33 +0100
Message-ID: <20240202132434.1787053-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 13:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194795

* can be used to pass e.g. -f param to preserve user-defined fields
  in the index as added in:
  https://git.yoctoproject.org/opkg-utils/commit/opkg-make-index?id=13f6281d24e17199e0fef6c2984419372ea0f86f

* otherwise it will show a lot of messages like:
  "Lost field Author <value>"
  for every package in the feed

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 8fcbad56aa..c35c90ce42 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -16,6 +16,7 @@ class OpkgIndexer(Indexer):
                      ]
 
         opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
+        opkg_index_cmd_extra_params = self.d.getVar('OPKG_MAKE_INDEX_EXTRA_PARAMS')
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
             signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
         else:
@@ -41,8 +42,8 @@ class OpkgIndexer(Indexer):
                 if not os.path.exists(pkgs_file):
                     open(pkgs_file, "w").close()
 
-                index_cmds.add('%s --checksum md5 --checksum sha256 -r %s -p %s -m %s' %
-                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
+                index_cmds.add('%s --checksum md5 --checksum sha256 -r %s -p %s -m %s %s' %
+                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))
 
                 index_sign_files.add(pkgs_file)
 
-- 
2.43.0


