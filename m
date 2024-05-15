Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294D4C25B78
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 09:46:01 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.10685.1715766338659352524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 02:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L3d1i99R;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1ec41d82b8bso62803785ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 02:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715766338; x=1716371138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dpVi8no80bFoAWvzF9/EbjP81Y51XwabzMiJ09wifsg=;
        b=L3d1i99RpIdZaYO2Znksl/qZ0hVlgwiMIf8ddzqoPiJM5CRjqM+60LnkmyygvsNtEM
         GDUneNhP8iVxRe61Ty+45kymwTIq6YgC+Px0B3Pac+7Dl/SS45D+ybBX1duPJfiWPl+j
         fwVIkavyuw9iWCmbNUm3YYw0H15avXS72nfgZVS7eNeNDSjjf6tyxmw1qlRpq6adnTWm
         zlP/d6MpPCLJhvyKqwicAoyalsFLv89KIOTTfJUcNFQOWR+r6hgHc+1aSNwUUt3H37lw
         WrujUsc6mTiyZaMfccjwnKxW8iJHzFC1PGMIVjkArtyhonRAISrETJYP3LhP2SKnnkfk
         plEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715766338; x=1716371138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpVi8no80bFoAWvzF9/EbjP81Y51XwabzMiJ09wifsg=;
        b=nEkjaNfGsf/iXiUbcX7GtVELG7UYb7vGZV0HcVZRKGnkgNaqvLj5I+H4lBjGDxzlYS
         rTTkKXyj3+i3YJtYzHmSNkSCxYNvjGBwssp7o/mUr4EGsAftAYdXKTyrsJdx2r1+GJ5n
         CC5R4F9fktGfpokGeHHtO3vrpLoquwA0e6AWqxuC5buLkDn7u9CPS0c6Vojj1Dbf9PNu
         pm+tsQcoxBCWethuq1zppfqcqNADIWvxrAtV0Shvazy6HHJ2jmYLESI+GpALpUX1dNi3
         3t0FEXUgeyR/5UCEH5wV2nyGWP48VJsnmsA8mV3YFr+qe8OM7/LzJq5NvtaZYcB7iJui
         IBEA==
X-Gm-Message-State: AOJu0Ywk3BiKLE4V44Qa9QrJNc7P5zchtQxlT/9mVVgsI1Aw/uHxqDjC
	LGIyj8kr6ASUi5FSkQIQefBL9RbJ8pSj3c464yHGQ2U3XnT41c6jAAwwFUj8
X-Google-Smtp-Source: AGHT+IFJK4TXr8LXl12Xmm3TNgOzBhAZTkGZ/yD1Jm8pe3Lel0ZHGXX/4E/BJDrKUVajfhWY9qzpgw==
X-Received: by 2002:a17:902:eccf:b0:1eb:f263:d2fc with SMTP id d9443c01a7336-1ef43f51b80mr190085735ad.54.1715766337609;
        Wed, 15 May 2024 02:45:37 -0700 (PDT)
Received: from LL-2917.kpit.com ([103.85.11.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d177asm113660885ad.23.2024.05.15.02.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 02:45:37 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][master][scarthgap][kirkstone][PATCH] systemd-systemctl: Add extra log for easy of debugging
Date: Wed, 15 May 2024 15:15:23 +0530
Message-Id: <20240515094523.93410-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 09:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199274

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 2229bc7b6d..4389556910 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -31,6 +31,7 @@ class SystemdFile():
 
     def __init__(self, root, path, instance_unit_name):
         self.sections = dict()
+        print(f"Parsing unit: {path}", file=sys.stderr)
         self._parse(root, path)
         dirname = os.path.basename(path.name) + ".d"
         for location in locations:
@@ -39,6 +40,7 @@ class SystemdFile():
                 inst_dirname = instance_unit_name + ".d"
                 files = chain(files, (root / location / "system" / inst_dirname).glob("*.conf"))
             for path2 in sorted(files):
+                print(f"Parsing unit's override: {path2}", file=sys.stderr)
                 self._parse(root, path2)
 
     def _parse(self, root, path):
@@ -88,6 +90,11 @@ class SystemdFile():
                 # forget all preceding assignments. This works because we are
                 # processing files in correct parse order.
                 if k in self._clearable_keys and not v:
+                    print(
+                        f"The directive '{k}' is empty, therefore the values '{section[k]}' "
+                        "are going to be discarded",
+                        file=sys.stderr,
+                    )
                     del section[k]
                     continue
 
-- 
2.25.1


