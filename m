Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B02ACCA473
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:29:38 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.1277.1655854176430592266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jJkBQ6sl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id c205so7751306pfc.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BRLdEtAvYhq2D9sQgzr1Aspx1dCROKWBHv47w7KfzHc=;
        b=jJkBQ6slYHvYydJRIBws1sjSxT6mPdao7OA+0+oPmfQFNEDsrYPDXaoqcEYnq6bS04
         QePg4MNNPCgCJXAdsxdRGk4MpUqbbDunoVgTqzZeod54qyZL9Clb1Wk/L4kOSmnH/4ZN
         W+skgOCRnMrhfSsC4FbWWGiGKZ8WIR/PGLqT+CGXjbyV7Vd7a/BbRAj09XA65gDjEJ69
         xr7lkpxvitjmEPXmNF64PL8bmO0qbVr7CMH7DymmYQLXie3K4UFZ2df5Li3kux9HXbOq
         tYmM52Cz+9MtSENC1uYH0zsukCsRTjygHa7jXV4IkGXn3xgsFAyBuX4G6A9INR3m3+02
         /QHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BRLdEtAvYhq2D9sQgzr1Aspx1dCROKWBHv47w7KfzHc=;
        b=sbkIDBCn9L1BF+htF8Jd7+/gwCFWuEctFvN7PasFzxa+jrYRaDBG+pdO5E1bZ72lwO
         6RabrTkHMph3EIdoLCrebWENR9NfKCP7zuXv67UjC8pzcz2BpcWKCksdV5/MfprOeHTp
         c2s10wen3n/3p8SR3ukZ2w93eOEZMSrplH9Vfpak7CAr8wK7R3UqvDIO1VFH4NVWkKuB
         Weoo6MWQCqfxndC3sGemLXdP/Rtib7R4xJVCwsZPVDW99InZk8r0SGSJPaRD+YD2BINM
         a1gjgGikWWcTwpL86q5ZLXeov4lO0VHaCuAb2WP6+HOM1+wLEmuACVUsuBOMVAtzEx8g
         mu8Q==
X-Gm-Message-State: AJIora9VRRho0uK7vQ6pFR0JJ4ZJF+8RU/ArW9Vx55Jc0IlhwPkAzf7k
	bLzIIfAGzp9Pgpb7AAHxuZSiGBw+tliWD9vF
X-Google-Smtp-Source: 
 AGRyM1vMqVmfwz7VbDFhWtOXE00/3aMC2F6IuM07J6DG2H2tq54RDnkMagENAmpx6ar7u7S+0oztWQ==
X-Received: by 2002:a63:a55:0:b0:3fd:e492:354e with SMTP id
 z21-20020a630a55000000b003fde492354emr367067pgk.416.1655854175424;
        Tue, 21 Jun 2022 16:29:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f25-20020a637559000000b0040cf934a1a0sm2041614pgn.28.2022.06.21.16.29.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:29:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/6] systemd: systemd-systemctl: Support instance
 conf files during enable
Date: Tue, 21 Jun 2022 13:29:01 -1000
Message-Id: 
 <f2d59bf2240eaf4c483edc4feb6e5d66b8dc387f.1655836866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655836866.git.steve@sakoman.com>
References: <cover.1655836866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:29:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167208

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
index 990de1ab39..6aa2e20465 100755
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
@@ -193,8 +198,11 @@ class SystemdUnit():
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
@@ -206,7 +214,7 @@ class SystemdUnit():
             # ignore aliases
             return
 
-        config = SystemdFile(self.root, path)
+        config = SystemdFile(self.root, path, instance_unit_name)
         if instance == "":
             try:
                 default_instance = config.get('Install', 'DefaultInstance')[0]
-- 
2.25.1


