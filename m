Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BCFC02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 12:50:45 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.43509.1736858058324793415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 04:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ImnCBxuX;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: arturkow2000@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-304d760f118so39491491fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 04:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736858056; x=1737462856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ur4d+aFaZZJr0I+jUqZrGr0cBru0FNWuXjKdEAH8avs=;
        b=ImnCBxuXWbaRQLpHgYVlEwWUrTa0AcnB9F5HC+V2A49kPLskprZFtzjuwTh0yq6HnI
         6t+G+usbr+jjU4Kq3rCWEt2VYRiG+RNVyR6l8QYHTFx++bT58DVexxzbDqwtqlCB0yVK
         iC0YIgIMpnbkFEGAuj2/nl1ftVmXsOdHr11VDBiC4CYXsTo23noD4u5y71bdzOc0WJza
         4GXNVhHSxHdBOmPlrAICHKv5W6jqN5ROqALIPvUizX5FZChMUUYABvbwJaZpfqlTkKzy
         f0NaZLPsZOyQiWXXXQUvBbJ0rohEaPvioePKr0eMmAX9Qa30v1px2jTdDhwo3tY+86KK
         PpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858056; x=1737462856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ur4d+aFaZZJr0I+jUqZrGr0cBru0FNWuXjKdEAH8avs=;
        b=cJrgxcQn39MQZmnqtIcMFxPTUsusOkPg6iyBTwTD8UVDY+P1Nh+Ku+XwyRiY567QFD
         KlTOJevdlX+UNth/10O4ikb07h5HwzvdeC0wiJpUZjyR9qHXoQuPgOqYhtXgnrwoSZxX
         V58gmcOIX4qU7qtkhUrSI0lN7SfyG7yFZ8bihyf1jda7MXuWbT2BB52eQNTHZnWUT9VL
         vy/Uw8sx/qOwMuoh7kY5NlDl6Jy6/bd8lpo1kzIYj6Z4+pEbBDokIwU4WY0JzNZTGKeP
         dj7hS0eFpyrDWAcJnrKWX0OFgo5o6xcH58YPrffyIQq6YwuYkhcPu3Q57dLBbrkWsIo1
         ruhQ==
X-Gm-Message-State: AOJu0YwnfvA0k7m+Ka1glOl3MOVg6rkfSXwHYyYH4znU+u2vsk9nbeik
	aNunJDbvQb5lrET/XOgHK/9BfbusmEAui8RakwN8jg7BxgJxCACWdR1NNP3d
X-Gm-Gg: ASbGnctPlZeYMZ9nCzXEnFAoivEni4fztYECFY4rWYmX8BJHU6CuVHMsjsTwvt7uWTz
	I8YX0tC/5ib4WBGWauot+lB28YlmU+wP+JjGqwcS5aVphiZP0+J7pwgg0ImUXRmGLu0ZrY9Cw+L
	lHy1C6dxxv6tVzkkSx1dEZ+nSdECkgwECN8f3XJ99fK43ev6db7AhasbpT33Qn2/LQGrixusc66
	59eVW1MFubKW/0rM1v5lmw8qYjlnK8IqsAKm3QsP62Pbd46DfFCkjdOrqDUCAHd
X-Google-Smtp-Source: AGHT+IHiLOh8BfavONDshyp8FqntNcYG/2yIFazHHxdDVam3w/WO6T3TwWbS9IUbPwmTpdErqh4s9g==
X-Received: by 2002:a2e:b8c7:0:b0:300:7f87:a6a with SMTP id 38308e7fff4ca-305f45315a0mr73508071fa.7.1736858055694;
        Tue, 14 Jan 2025 04:34:15 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:86d6:2e13:1a85:5192])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec4d6sm17230521fa.111.2025.01.14.04.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:34:15 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v2 1/8] systemd-systemctl: add support for --global flag
Date: Tue, 14 Jan 2025 13:26:09 +0100
Message-ID: <20250114122613.3046925-5-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250114122613.3046925-4-arturkow2000@gmail.com>
References: <20250114122613.3046925-4-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 12:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209793

The flag is similar to --user flag as it causes systemctl to operate on
user units, but it performs operations globally for all users. This is
required for user presets support.

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


