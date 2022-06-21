Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6910BC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:28:48 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.1211.1655854119233588770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NkSqf+Wh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id go6so9594001pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=47e460xym5rFRxZjwuijiM++clPlKFSXUvMWSw8UkHU=;
        b=NkSqf+WhpggxaDtEmUbJXZPVgeaKuYTxQKBShjOjid0/on8iA1NDbPZ1F1gzmzntOa
         x+EOM6LMHfDJHXCGs2hlifR5zOo11JI1PdfM6W2s0Iy0Ct5XiSf+vj6urXUauyK8Hage
         n8F3Ogr3EloyUsJMwzzqbtiDkGtWW4a92lP681X23kG3ZHsL1bVMe7ZsEfI5UL4CHBoq
         bSfMR/7FizYvSbsLQI22Kl637fHOpzZGaQpIu4tdTpc0761CjiLPTy9n26ehI2jK8f/5
         gO1KkzAvcqyZae5o9gLhl6PtlYegzhMk8XV1yI0FBLYHlLAJIVuM1UkpD3OXylhzFdYP
         MpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=47e460xym5rFRxZjwuijiM++clPlKFSXUvMWSw8UkHU=;
        b=doy5rnUn5tcy1/khuswReXYy0uJb7ZBO21pSk6n7KKmlyyFC3lGaoq4nZMmEJmUbTJ
         YQI6ELg1hr6wcRIXtMJK/Otyw38TPHAkIAzgOyuJFrbnz3BTBpZwAuhMYgF0aPk2NhVJ
         Wt27xso/rlljJR+ldOeYTqK4XMKoZC9MJYVNYscg9T+fNDvC8vOyJW6+2nhPUSAWao2z
         ChQ+vooFWJOdjfc1takMz3eGqeCjjStIXYHK4eSd8YUrlFFY0w/fAdFgaHt37jpklkBM
         Q+TDenzsI2BJtRQXN0CzlNxPyYMSgwQR6i7RtsSFnR52qtHV5BsofYiKg8R0KJmfmPn3
         9adg==
X-Gm-Message-State: AJIora/NF0b7RamYVrczp+1vICnCW+l/lp7Zu8sS/RHAM1hv/DDXKPmU
	rF8gKPmUuxWfI8RNElgk8FpvVokysCuln9gG
X-Google-Smtp-Source: 
 AGRyM1vsn+6S5oTA1B7T8ELSeziDboKTElGd1sCKG4NxA4yF/yr4LRHGbo9GMHO79q98ZcZDc6T6VQ==
X-Received: by 2002:a17:902:f60d:b0:16a:1a7f:a22f with SMTP id
 n13-20020a170902f60d00b0016a1a7fa22fmr15593289plg.13.1655854118225;
        Tue, 21 Jun 2022 16:28:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0015e8d4eb209sm11323565pla.83.2022.06.21.16.28.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:28:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/13] systemd: systemd-systemctl: Support
 instance conf files during enable
Date: Tue, 21 Jun 2022 13:27:56 -1000
Message-Id: 
 <8d646cc4eec154e051f315de8736356c870a5ad5.1655848177.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655848177.git.steve@sakoman.com>
References: <cover.1655848177.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:28:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167200

From: Nick Potenski <nick.potenski@garmin.com>

Add ability to parse instance-specific conf files when
enabling an instance of a templated unit during postinstall.

Signed-off-by: Nick Potenski <nick.potenski@garmin.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit baa0ecf3271008cf60cd830c54a71f191aebb81c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/systemd-systemctl/systemctl            | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 6324319a45..6d19666d82 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -11,6 +11,7 @@ import re
 import sys
 
 from collections import namedtuple
+from itertools import chain
 from pathlib import Path
 
 version = 1.0
@@ -25,12 +26,16 @@ locations = list()
 
 class SystemdFile():
     """Class representing a single systemd configuration file"""
-    def __init__(self, root, path):
+    def __init__(self, root, path, instance_unit_name):
         self.sections = dict()
         self._parse(root, path)
         dirname = os.path.basename(path.name) + ".d"
         for location in locations:
-            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):                
+            files = (root / location / "system" / dirname).glob("*.conf")
+            if instance_unit_name:
+                inst_dirname = instance_unit_name + ".d"
+                files = chain(files, (root / location / "system" / inst_dirname).glob("*.conf"))
+            for path2 in sorted(files):
                 self._parse(root, path2)
 
     def _parse(self, root, path):
@@ -195,8 +200,11 @@ class SystemdUnit():
         # if we're enabling an instance, first extract the actual instance
         # then figure out what the template unit is
         template = re.match(r"[^@]+@(?P<instance>[^\.]*)\.", self.unit)
+        instance_unit_name = None
         if template:
             instance = template.group('instance')
+            if instance != "":
+                instance_unit_name = self.unit
             unit = re.sub(r"@[^\.]*\.", "@.", self.unit, 1)
         else:
             instance = None
@@ -208,7 +216,7 @@ class SystemdUnit():
             # ignore aliases
             return
 
-        config = SystemdFile(self.root, path)
+        config = SystemdFile(self.root, path, instance_unit_name)
         if instance == "":
             try:
                 default_instance = config.get('Install', 'DefaultInstance')[0]
-- 
2.25.1


