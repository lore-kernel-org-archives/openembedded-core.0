Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F272EC0218E
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 14:00:13 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.35714.1737377272828660472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 04:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hbJ6pIyL;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: arturkow2000@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso4406236e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 04:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737377271; x=1737982071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YemSaV1dfOrNvGXjnyX1/wBtLsVbmiKiA5SY2t8+UBU=;
        b=hbJ6pIyL4cIFE6iWn1fKcy/mmcZmVsB7iO9p3XQwmvUs48Xe8dvRmj5Ermg+3LvXfN
         77uV6YzyUFftpASyoz/vK/HMKZeDoFcfqbgLTBCrgp7YgkpcuG9ZbrjUarXv1TrImhrD
         1tyUGbHkSc8TfakSo3JiJhq+i3eDd880WvrIqwdaVlJVYyU4hXjheLKC6TOlkbo9QxMl
         mcB1EyJa/WwVWI/9bUgipQRW9SFgiQeFrienpTHxPYQTFqtWylQ32m4TrvbmHupVepmX
         vD7f0sqHOKtz/SWTKsGh5nlYxuOBm4hFahASAQ1+5AabKPaCIJ2vEqLpvBDp/mYwoKId
         AXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737377271; x=1737982071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YemSaV1dfOrNvGXjnyX1/wBtLsVbmiKiA5SY2t8+UBU=;
        b=wTKRp9gQ6YUVW7KMUPJ8qgvcPg5RVABb70HOHP7Cm6vwibM9mU/C/w6GBqbtZS2Ge1
         ssMZcjR5m2bvCENoKK4nyvmdCbUqCBWnkGIWKpwDXSQMIORqTJxBtSiqX7mZy5fEfL/d
         EyjxZKA+NCy7ebs9+nXb8CmRVmhVWdWDnADAeAvAotFTtNTQb1PCHodqpcFiXsnQYUn7
         SEtd6JHV23neZw+stKhywrTb4Gr6OVN4L0zED3wLRJxf7YhbvwZPlatjsrn5zK6w17fw
         2FRYrfZQvrStcg/FBjvlr9uQJcTKvFfYPNuz9uBTTN0AOLP0kInI91JUvmVLPfEUjnKv
         JK/g==
X-Gm-Message-State: AOJu0Yz3gkDrpDqiu2dhIagU2g7clZZsDDaFYpZR9+scjgPuF5LcAW1c
	fBfnxNy+1HFknvOJUfyYggwIfhCT0gqH2RWByFc4HGjbeGY3G+PkixHF3Q==
X-Gm-Gg: ASbGncsufc8J5H5wuea3udXBPerCXw3TEQrM2hycGn4RYjsej9OSDsgQ/c5ouUzxb0y
	O3jaCTxee9kKYWABTAhYGAg/90bKeqxPnEfhWxPCaBlaxH5ZKddE79cVx1acVkIn9iKIYUI2PiK
	54EkudRR4pvfaMlc/8qfNCrlzlJx7lmh8QsfR7GouJFjydKecB0tJK5g91kD0yU9uilsAw3Xd8L
	8ABe8v9E/ub02xVgYmzdJO+oZ32Qid+7pPXvNAEHjWE20E2HcLZ7X+5/8U6ieva+SRUa/DK9DXm
	Tw==
X-Google-Smtp-Source: AGHT+IF7TM34vWIFDXJb9Vs/0zvVwxpeDrjhG3mGYbwvLLLUE3qDub9ZgAmENmqvhW9Zx4F2etdnwA==
X-Received: by 2002:ac2:4541:0:b0:53e:389d:8ce4 with SMTP id 2adb3069b0e04-5439c281f4fmr3868307e87.34.1737377270265;
        Mon, 20 Jan 2025 04:47:50 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:23ed:c831:8228:ebaa])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0742csm1307523e87.37.2025.01.20.04.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 04:47:49 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v3 1/8] systemd-systemctl: add support for --global flag
Date: Mon, 20 Jan 2025 13:45:59 +0100
Message-ID: <20250120124605.263817-3-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120124605.263817-2-arturkow2000@gmail.com>
References: <20250120124605.263817-2-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 14:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210032

The flag is similar to --user flag as it causes systemctl to operate on
user units, but it performs operations globally for all users. This is
required for user presets support.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 .../systemd/systemd-systemctl/systemctl       | 42 ++++++++++---------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 2229bc7b6d..81c246a5b2 100755
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
+    parser.add_argument('--global', dest="opt_global", action="store_true", default=False)
 
     args = parser.parse_args()
 
@@ -336,16 +338,18 @@ def main():
         parser.print_help()
         return 0
 
+    unit_type = "user" if args.opt_global else "system"
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
2.47.1


