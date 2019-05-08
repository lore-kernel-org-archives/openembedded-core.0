Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7ECBA7DE6B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 15:57:48 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s15so27858922wra.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QngeTKOtVt7BexrJwP3xv5u4fpwBXqdapi3CDyhh9E0=;
	b=gVB6xRft3mE5ZTChdsEZgih9fcoxzbvv4iQf7PxOXEfp9PfC9TT3L8vxjlqcfRVTi8
	oNI2/Q5eN9pPAcNcHP2xthSxMVKIA2PT5dT7sn2RDqxkWWC7lc4MIQQTePsXKNATFeEb
	MurmeD289xhkbXYmxKXDt7aQUzchF04gHN4eX2r8PvJ/sHgDJuIY/hhwxU0rh1563iEi
	/WE7w37R2x6UoZBmI0clgV3Beq4ioW5BifF0g4Woo+RoIvNeimiYYV4Zby5g3rTBNqvw
	OPiQVplVbAVpfMmpuzfsLUprt/PML+i8h5Jz5/fezOtZuBCNgrfrycEyCJgOvdPk0UUA
	zC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QngeTKOtVt7BexrJwP3xv5u4fpwBXqdapi3CDyhh9E0=;
	b=Et4vJlfIyh/KWCgZj578HBm5Nlmk3DHopymRUnwKDPUXfViPub4svz2M5taPQF72Ht
	XMWZFAlJKKmWUXzGxTkPPqcJJkYFlNBlaEQOzlWuZ2DkDrCNnwS8tz68eNbgLWUrg6Mo
	abIV2IzWmPLcWhTSB5S17IcaUfBXrtQF52Xusj8KF7JonSD631DlS1KTnqFUwXSCzaur
	qK+R/m2BHf182RXtBkGZIX6hVUSBAFOxSlM9tpsErS1PjAgs6s0tH4pqB9oGBcw26/fI
	PkM1Y7p7VD+FPItUEwRwn4FNJ68CFB7gbC0leXC17jrTEPjSgiGzZfi/lwkh6MtPcBAT
	DwBA==
X-Gm-Message-State: APjAAAXWiVclOR2cuc6EJToQp3EqvQMoAkhRNKMEKKhecj2oZZlO1C0B
	VcFO66WCyjSo/+yTP97gko80ayou
X-Google-Smtp-Source: APXvYqxaQkfJjJoLU1U+upEKOESC7hab3xryW3t/mgy6jGqf2PWFKio1j1mL2L7sZtCN/Lk+T4PQKA==
X-Received: by 2002:adf:db0b:: with SMTP id s11mr2578691wri.180.1557331068829; 
	Wed, 08 May 2019 08:57:48 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18])
	by smtp.gmail.com with ESMTPSA id m6sm4027175wmc.32.2019.05.08.08.57.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 08:57:48 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 16:57:27 +0100
Message-Id: <20190508155728.66729-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508155728.66729-1-alex.kiernan@gmail.com>
References: <20190508155728.66729-1-alex.kiernan@gmail.com>
Subject: [PATCH v2 2/3] systemd-systemctl: Restore support for enable command
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2019 15:57:48 -0000

Refactor so that SystemdUnit is its own class, then add support for the
enable command. This restores the ability of systemd.bbclass to create
instances using syntax such as:

  SYSTEMD_SERVICE_${PN} = "serial-getty@ttyAMA0.service"

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- restore support for enable command

 .../systemd/systemd-systemctl/systemctl       | 179 ++++++++++--------
 1 file changed, 102 insertions(+), 77 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 7fdaf8ce03d9..8d7b3ba32d62 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -20,6 +20,8 @@ SYSCONFDIR = Path("etc")
 BASE_LIBDIR = Path("lib")
 LIBDIR = Path("usr", "lib")
 
+locations = list()
+
 
 class SystemdFile():
     """Class representing a single systemd configuration file"""
@@ -111,12 +113,6 @@ class Presets():
 
     def _collect_presets(self, scope, root):
         """Collect list of preset files"""
-        locations = [SYSCONFDIR / "systemd"]
-        # Handle the usrmerge case by ignoring /lib when it's a symlink
-        if not BASE_LIBDIR.is_symlink():
-            locations.append(BASE_LIBDIR / "systemd")
-        locations.append(LIBDIR / "systemd")
-
         presets = dict()
         for location in locations:
             paths = (root / location / scope).glob("*.preset")
@@ -146,27 +142,6 @@ class Presets():
         return None
 
 
-def collect_services(root):
-    """Collect list of service files"""
-    locations = [SYSCONFDIR / "systemd"]
-    # Handle the usrmerge case by ignoring /lib when it's a symlink
-    if not BASE_LIBDIR.is_symlink():
-        locations.append(BASE_LIBDIR / "systemd")
-    locations.append(LIBDIR / "systemd")
-
-    services = dict()
-    for location in locations:
-        paths = (root / location / "system").glob("*")
-        for path in paths:
-            if path.is_dir():
-                continue
-            # implement earlier names override later ones
-            if path.name not in services:
-                services[path.name] = path
-
-    return services
-
-
 def add_link(path, target):
     try:
         path.parent.mkdir(parents=True)
@@ -177,69 +152,113 @@ def add_link(path, target):
         path.symlink_to(target)
 
 
-def process_deps(root, config, service, location, prop, dirstem):
-    systemdir = SYSCONFDIR / "systemd" / "system"
+class SystemdUnitNotFoundError(Exception):
+    pass
 
-    target = ROOT / location.relative_to(root)
-    try:
-        for dependent in config.get('Install', prop):
-            wants = root / systemdir / "{}.{}".format(dependent, dirstem) / service
-            add_link(wants, target)
 
-    except KeyError:
-        pass
+class SystemdUnit():
+    def __init__(self, root, unit):
+        self.root = root
+        self.unit = unit
+        self.config = None
+
+    def _path_for_unit(self, unit):
+        for location in locations:
+            path = self.root / location / "system" / unit
+            if path.exists():
+                return path
 
+        raise SystemdUnitNotFoundError(self.root, unit)
 
-def enable(root, service, location, services):
-    if location.is_symlink():
-        # ignore aliases
-        return
+    def _process_deps(self, config, service, location, prop, dirstem):
+        systemdir = self.root / SYSCONFDIR / "systemd" / "system"
+
+        target = ROOT / location.relative_to(self.root)
+        try:
+            for dependent in config.get('Install', prop):
+                wants = systemdir / "{}.{}".format(dependent, dirstem) / service
+                add_link(wants, target)
+
+        except KeyError:
+            pass
+
+    def enable(self):
+        # if we're enabling an instance, first extract the actual instance
+        # then figure out what the template unit is
+        template = re.match(r"[^@]+@(?P<instance>[^\.]*)\.", self.unit)
+        if template:
+            instance = template.group('instance')
+            unit = re.sub(r"@[^\.]*\.", "@.", self.unit, 1)
+        else:
+            instance = None
+            unit = self.unit
+
+        path = self._path_for_unit(unit)
+
+        if path.is_symlink():
+            # ignore aliases
+            return
 
-    config = SystemdFile(root, location)
-    template = re.match(r"[^@]+@(?P<instance>[^\.]*)\.", service)
-    if template:
-        instance = template.group('instance')
-        if not instance:
+        config = SystemdFile(self.root, path)
+        if instance == "":
             try:
-                instance = config.get('Install', 'DefaultInstance')[0]
-                service = service.replace("@.", "@{}.".format(instance))
+                default_instance = config.get('Install', 'DefaultInstance')[0]
             except KeyError:
-                pass
-        if instance is None:
-            return
-    else:
-        instance = None
+                # no default instance, so nothing to enable
+                return
 
-    process_deps(root, config, service, location, 'WantedBy', 'wants')
-    process_deps(root, config, service, location, 'RequiredBy', 'requires')
+            service = self.unit.replace("@.",
+                                        "@{}.".format(default_instance))
+        else:
+            service = self.unit
 
-    try:
-        for also in config.get('Install', 'Also'):
-            enable(root, also, services[also], services)
+        self._process_deps(config, service, path, 'WantedBy', 'wants')
+        self._process_deps(config, service, path, 'RequiredBy', 'requires')
 
-    except KeyError:
-        pass
+        try:
+            for also in config.get('Install', 'Also'):
+                SystemdUnit(self.root, also).enable()
 
-    systemdir = root / SYSCONFDIR / "systemd" / "system"
-    target = ROOT / location.relative_to(root)
-    try:
-        for dest in config.get('Install', 'Alias'):
-            alias = systemdir / dest
-            add_link(alias, target)
+        except KeyError:
+            pass
 
-    except KeyError:
-        pass
+        systemdir = self.root / SYSCONFDIR / "systemd" / "system"
+        target = ROOT / path.relative_to(self.root)
+        try:
+            for dest in config.get('Install', 'Alias'):
+                alias = systemdir / dest
+                add_link(alias, target)
+
+        except KeyError:
+            pass
+
+    def mask(self):
+        systemdir = self.root / SYSCONFDIR / "systemd" / "system"
+        add_link(systemdir / self.unit, "/dev/null")
+
+
+def collect_services(root):
+    """Collect list of service files"""
+    services = set()
+    for location in locations:
+        paths = (root / location / "system").glob("*")
+        for path in paths:
+            if path.is_dir():
+                continue
+            services.add(path.name)
+
+    return services
 
 
 def preset_all(root):
     presets = Presets('system-preset', root)
     services = collect_services(root)
 
-    for service, location in services.items():
+    for service in services:
         state = presets.state(service)
 
         if state == "enable" or state is None:
-            enable(root, service, location, services)
+            SystemdUnit(root, service).enable()
 
     # If we populate the systemd links we also create /etc/machine-id, which
     # allows systemd to boot with the filesystem read-only before generating
@@ -251,18 +270,13 @@ def preset_all(root):
     (root / SYSCONFDIR / "machine-id").touch()
 
 
-def mask(root, *services):
-    systemdir = root / SYSCONFDIR / "systemd" / "system"
-    for service in services:
-        add_link(systemdir / service, "/dev/null")
-
-
 def main():
     if sys.version_info < (3, 4, 0):
         sys.exit("Python 3.4 or greater is required")
 
     parser = argparse.ArgumentParser()
-    parser.add_argument('command', nargs=1, choices=['mask', 'preset-all'])
+    parser.add_argument('command', nargs=1, choices=['enable', 'mask',
+                                                     'preset-all'])
     parser.add_argument('service', nargs=argparse.REMAINDER)
     parser.add_argument('--root')
     parser.add_argument('--preset-mode',
@@ -272,9 +286,20 @@ def main():
     args = parser.parse_args()
 
     root = Path(args.root) if args.root else ROOT
+
+    locations.append(SYSCONFDIR / "systemd")
+    # Handle the usrmerge case by ignoring /lib when it's a symlink
+    if not (root / BASE_LIBDIR).is_symlink():
+        locations.append(BASE_LIBDIR / "systemd")
+    locations.append(LIBDIR / "systemd")
+
     command = args.command[0]
     if command == "mask":
-        mask(root, *args.service)
+        for service in args.service:
+            SystemdUnit(root, service).mask()
+    elif command == "enable":
+        for service in args.service:
+            SystemdUnit(root, service).enable()
     elif command == "preset-all":
         if len(args.service) != 0:
             sys.exit("Too many arguments.")
-- 
2.17.1


