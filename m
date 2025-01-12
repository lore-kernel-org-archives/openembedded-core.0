Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BA3E7719F
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 14:40:33 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.36893.1736692498207531798
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 06:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jkhChtx/;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: arturkow2000@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso4984698a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 06:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736692496; x=1737297296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRFHxfKTMh/ajsdRUV48QHvGrdnwOumqPeJZY1VuhUM=;
        b=jkhChtx/ICkjeC9PSuMHiWuOjwwvFJLLaV98pnO0jdsgx8Ch06ADSz4dkZYz6XTuNa
         ytKA8lGwdbY10e9yqNuUANxt1Nj9uzdp0xHUnR5d3IzyEOdvoy7qfP8wrJOJ76CE3fT1
         Lkxd8L8yylXglvjh8XiVhiYDaG+MSrW+Q4kgMZUPG0yeSmAVnTh5erObEdEqafUK7gXZ
         0on8HjfLBqgbNYqe4yoHwtaHPh8Gxf3IMdAAB1iUrImkVyWQg8+Ku8Pw7Y0OYqbjjF7k
         PJS6/7M6uw/BZevGdNDEv+yVsZKQlfvEEX0+Zl6p56A3jc2XtoKTVDcv87Y39YEZcCoL
         wfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736692496; x=1737297296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRFHxfKTMh/ajsdRUV48QHvGrdnwOumqPeJZY1VuhUM=;
        b=FfxifmmsCOiGVjLsUaMGFInFkGevRTIhLDeJvy51Viy4HvgKcShVnv1AHvyLem3Ze3
         9UBuXGjJndF5Rw2EX21lFyQGPUdwbPPol4dCJVAnzzbyljEhsJhmZCOV9t2uLLaHdhuB
         L+agZ/IIkjRZ8AP3aCbCr8AkbdVlkzPotG9cSKwgpePyx2pirC/18RU756V5SqZfTUDf
         rLU0LZBcJT3ofIhSWpn0VgcIq1KyD2jTA0DzwqZQrxam1vxesWlcK+4yKG2UaNRNU3C1
         MFihY1fJpN/XIIE7Uhdk6XTWN1BnLFNU9Udz6OP3Axrn0uKnaE4s7uuceC7SCaWNEjaI
         BJPg==
X-Gm-Message-State: AOJu0YxvGwPcu30oP0HruziQio0ZgCalWZDHXPww5A/pk+YP5msRr8dD
	30Ta1ceOD5zHiaRUve9SMNpzmfzgAZjzinwWg7vYaibnzLrlhwHbWbvgWQ==
X-Gm-Gg: ASbGnctap41Ma7Bfj9c1LAgI/Vpo/c8Vy0x1zItzkQ3i6mTDK0XCnAj926ge6+f4ziE
	9sXeQEL+dwwOkIf/YOndIOwxmWfZi/tn3PcKUF7Ar1BtSYFziF1LMiUs96Ss7b1JTWbvRWZWgd9
	MZoEcro1vvkveeUTpT+/pj+XwoEZUPiPF5L3wRDeRFVsq+e7m6J+z7IkrW8rl736jTscPff/v6V
	KMmE/6ERlXzRp5cjbNMXC99X7JluB5dqPfD6xeOwInUsxFWG5sVuqBJpED0JzHs
X-Google-Smtp-Source: AGHT+IGkSZQvo8UfDQVu+ydmk9UMz8SRVvrZPcBqyUm8l6mYgqlKv0062FA6edoaTDxEpEaWcNyu4A==
X-Received: by 2002:a05:6402:401d:b0:5d0:c9e6:30bc with SMTP id 4fb4d7f45d1cf-5d972e06c2emr15766111a12.10.1736692495957;
        Sun, 12 Jan 2025 06:34:55 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:dec6:9e22:e5fb:f0d5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99d05bec4sm3207739a12.14.2025.01.12.06.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 06:34:55 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH 1/3] systemd-systemctl: add support for --global flag
Date: Sun, 12 Jan 2025 15:31:39 +0100
Message-ID: <20250112143141.1300189-2-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250112143141.1300189-1-arturkow2000@gmail.com>
References: <20250112143141.1300189-1-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 14:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209686

The flag is similar to --user flag as it causes systemctl to operate on
user units, but it performs operations globally for all users. This is
required to for user presets support.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 .../systemd/systemd-systemctl/systemctl       | 42 ++++++++++---------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 2229bc7b6d..9b8fe81459 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -29,15 +29,15 @@ class SystemdFile():
 
     _clearable_keys = ['WantedBy']
 
-    def __init__(self, root, path, instance_unit_name):
+    def __init__(self, root, path, instance_unit_name, unit_type):
         self.sections = dict()
         self._parse(root, path)
         dirname = os.path.basename(path.name) + ".d"
         for location in locations:
-            files = (root / location / "system" / dirname).glob("*.conf")
+            files = (root / location / unit_type / dirname).glob("*.conf")
             if instance_unit_name:
                 inst_dirname = instance_unit_name + ".d"
-                files = chain(files, (root / location / "system" / inst_dirname).glob("*.conf"))
+                files = chain(files, (root / location / unit_type / inst_dirname).glob("*.conf"))
             for path2 in sorted(files):
                 self._parse(root, path2)
 
@@ -182,21 +182,22 @@ class SystemdUnitNotFoundError(Exception):
 
 
 class SystemdUnit():
-    def __init__(self, root, unit):
+    def __init__(self, root, unit, unit_type):
         self.root = root
         self.unit = unit
+        self.unit_type = unit_type
         self.config = None
 
     def _path_for_unit(self, unit):
         for location in locations:
-            path = self.root / location / "system" / unit
+            path = self.root / location / self.unit_type / unit
             if path.exists() or path.is_symlink():
                 return path
 
         raise SystemdUnitNotFoundError(self.root, unit)
 
     def _process_deps(self, config, service, location, prop, dirstem, instance):
-        systemdir = self.root / SYSCONFDIR / "systemd" / "system"
+        systemdir = self.root / SYSCONFDIR / "systemd" / self.unit_type
 
         target = ROOT / location.relative_to(self.root)
         try:
@@ -229,7 +230,7 @@ class SystemdUnit():
             # ignore aliases
             return
 
-        config = SystemdFile(self.root, path, instance_unit_name)
+        config = SystemdFile(self.root, path, instance_unit_name, self.unit_type)
         if instance == "":
             try:
                 default_instance = config.get('Install', 'DefaultInstance')[0]
@@ -250,14 +251,14 @@ class SystemdUnit():
                 try:
                      units_enabled.append(unit)
                      if also not in units_enabled:
-                        SystemdUnit(self.root, also).enable(units_enabled)
+                        SystemdUnit(self.root, also, self.unit_type).enable(units_enabled)
                 except SystemdUnitNotFoundError as e:
                     sys.exit("Error: Systemctl also enable issue with  %s (%s)" % (service, e.unit))
 
         except KeyError:
             pass
 
-        systemdir = self.root / SYSCONFDIR / "systemd" / "system"
+        systemdir = self.root / SYSCONFDIR / "systemd" / self.unit_type
         target = ROOT / path.relative_to(self.root)
         try:
             for dest in config.get('Install', 'Alias'):
@@ -268,15 +269,15 @@ class SystemdUnit():
             pass
 
     def mask(self):
-        systemdir = self.root / SYSCONFDIR / "systemd" / "system"
+        systemdir = self.root / SYSCONFDIR / "systemd" / self.unit_type
         add_link(systemdir / self.unit, "/dev/null")
 
 
-def collect_services(root):
+def collect_services(root, unit_type):
     """Collect list of service files"""
     services = set()
     for location in locations:
-        paths = (root / location / "system").glob("*")
+        paths = (root / location / unit_type).glob("*")
         for path in paths:
             if path.is_dir():
                 continue
@@ -285,16 +286,16 @@ def collect_services(root):
     return services
 
 
-def preset_all(root):
-    presets = Presets('system-preset', root)
-    services = collect_services(root)
+def preset_all(root, unit_type):
+    presets = Presets('{}-preset'.format(unit_type), root)
+    services = collect_services(root, unit_type)
 
     for service in services:
         state = presets.state(service)
 
         if state == "enable" or state is None:
             try:
-                SystemdUnit(root, service).enable()
+                SystemdUnit(root, service, unit_type).enable()
             except SystemdUnitNotFoundError:
                 sys.exit("Error: Systemctl preset_all issue in %s" % service)
 
@@ -320,6 +321,7 @@ def main():
     parser.add_argument('--preset-mode',
                         choices=['full', 'enable-only', 'disable-only'],
                         default='full')
+    parser.add_argument('--global', dest="glob", action="store_true", default=False)
 
     args = parser.parse_args()
 
@@ -336,16 +338,18 @@ def main():
         parser.print_help()
         return 0
 
+    unit_type = "user" if args.glob else "system"
+
     if command == "mask":
         for service in args.service:
             try:
-                SystemdUnit(root, service).mask()
+                SystemdUnit(root, service, unit_type).mask()
             except SystemdUnitNotFoundError as e:
                 sys.exit("Error: Systemctl main mask issue in %s (%s)" % (service, e.unit))
     elif command == "enable":
         for service in args.service:
             try:
-                SystemdUnit(root, service).enable()
+                SystemdUnit(root, service, unit_type).enable()
             except SystemdUnitNotFoundError as e:
                 sys.exit("Error: Systemctl main enable issue in %s (%s)" % (service, e.unit))
     elif command == "preset-all":
@@ -353,7 +357,7 @@ def main():
             sys.exit("Too many arguments.")
         if args.preset_mode != "enable-only":
             sys.exit("Only enable-only is supported as preset-mode.")
-        preset_all(root)
+        preset_all(root, unit_type)
     else:
         raise RuntimeError()
 
-- 
2.47.0


