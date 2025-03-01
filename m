Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9BDC021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 21:28:23 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.18195.1740864496303103226
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 13:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ozu4J4c9;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54838cd334cso3821193e87.1
        for <Openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 13:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740864494; x=1741469294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUkhhB4f0lJB3UXl/aFcn1SSyJAeloS84Kk2GzqkehQ=;
        b=Ozu4J4c9qAUsuB+kEyC0KClLkse9wZNGRrHoB03ZBTPXdKc7QfVT5nizhUsikVCXL4
         frAbQK5d9vtlmnJfwSvrIt6+effoac80T26C7kDDF2AmYOaFHWgzoqCNHVHZT150+jO/
         jo/dM1+XD5nKGbEZ2XpSdL2deLa3F4gus9gH2/hUWdd0ZwnCta8t+19s4Af0eGs7krz9
         lwjXIZUC3408PLB05LJ36hkLXLfHcVe+4OXr2h6k+nn9dn+c0aj8NAIkLpbSa/odIvdF
         PesPOB8J3K4eH4hj/8bGsCKuB+vKsUF4F3g9k600vcm0OZNo+0oM126DZ1WfTBxwayN+
         AwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740864494; x=1741469294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUkhhB4f0lJB3UXl/aFcn1SSyJAeloS84Kk2GzqkehQ=;
        b=gwwHCIitKAk3KXYqkLcoFDx0HHm2KxI3HzRDQYjWRKAl+j5WKNHFx1OJVCowGdnb1P
         eGo3XyBIwH3JybrXeEM+DybNn7lurogQKpU5yPg11Q3yX9XOS7LlKeiNVmQgwiZlxSCa
         Hi2jIWAqxIPmkzcbQpkjVUFdKzV5JA/oroW2JgmzbPsLBsUEcaghiUUSk6KE5YRsyXhZ
         35b6cTPPRwNWuO8/BNN6JPA5W1psUakUHFi39AtQCpcvi29JHiVULLd1UfngAjbF49qU
         63lH069aKCjvIhoq+iUC0lblwLmBCKCGW0PDiCjFgE4Ed69/JoSZtv2HPM2yWTSVw1qJ
         CzRA==
X-Gm-Message-State: AOJu0Yw9FdJhsbmCelu3Uc8v8VHzpf8nI9SiVO5hrPauOpaBbZUFj5oK
	xJNbabPAp5fFR+9MDCtLlMfoYdIurAEH85LKrUflzS9+S9o0VOTTpgm0UfAc
X-Gm-Gg: ASbGncuitVFU1z2nqrcgwEwvBLv7iOz8tQrEMXPb4wpbzFqc5lCwqbICvPO75C3tJFA
	DNI0PvK6Z75tnDiABKRA6v9ZGclapgXlFPdS4YHA2euycKuevXVQL3nmvEDwsdfIO+q2nMdOAwg
	oVF32qh2nzyUoEHyDzKh6zDAHuGsQgvbl3a9L0s4pO3jNFkfUCJv8bticGxvwYyYlnzrgBgMpdm
	v32clrFeDCnD7N47ub6uHwrrGMpiDzXYCPIBZFouIWjcSKTeHmf7W9ZRhQZn9U6QVhPb7YNhJr/
	AIE9ThhspmeUVLUFpjrR2gCpH17zgGIHBxz971ALD4aNo2KwL2eE+342Cu2alWH7R1l0QS8IQg=
	=
X-Google-Smtp-Source: AGHT+IFQREveWXlVzfvE+g0JBSZaLyCdxNnmIbaB6HgFOXw1i75w3NeIh2k0EfLFMm3Bh8Tll63LLQ==
X-Received: by 2002:a19:7503:0:b0:549:4e86:75cc with SMTP id 2adb3069b0e04-5494e867617mr2741535e87.4.1740864493648;
        Sat, 01 Mar 2025 13:28:13 -0800 (PST)
Received: from slackware.local.localdomain ([169.150.242.3])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494919b530sm721036e87.141.2025.03.01.13.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 13:28:12 -0800 (PST)
From: uvv.mail@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v7 1/2] systemd: Build the systemctl executable
Date: Sat,  1 Mar 2025 22:27:52 +0100
Message-ID: <20250301212753.78302-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 21:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212183

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Instead of the python re-implementation build the actual systemctl from
the systemd source tree. The python script was used when systemd didn't
provide an option to build individual executables. It is possible in the
meantime, so instead of always adapting the script when there's a new
functionality, we simply use upstream implementation.

License-Update: Base recipe is used

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../systemd/systemd-systemctl-native.bb       |  23 +-
 .../systemd/systemd-systemctl/systemctl       | 376 ------------------
 2 files changed, 11 insertions(+), 388 deletions(-)
 delete mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native.bb
index ffa024caef..73862b4e23 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native.bb
@@ -1,17 +1,16 @@
-SUMMARY = "Wrapper for enabling systemd services"
+SUMMARY = "Systemctl executable from systemd"
 
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+require systemd.inc
 
+DEPENDS = "gperf-native libcap-native util-linux-native python3-jinja2-native"
 
-inherit native
+inherit pkgconfig meson native
 
-SRC_URI = "file://systemctl"
+MESON_TARGET = "systemctl:executable"
+MESON_INSTALL_TAGS = "systemctl"
+EXTRA_OEMESON:append = " -Dlink-systemctl-shared=false"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 ${S}/systemctl ${D}${bindir}
-}
+# Systemctl is supposed to operate on target, but the target sysroot is not
+# determined at run-time, but rather set during configure
+# More details are here https://github.com/systemd/systemd/issues/35897#issuecomment-2665405887
+EXTRA_OEMESON:append = " --sysconfdir ${sysconfdir_native}"
diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
deleted file mode 100755
index 65e3157859..0000000000
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ /dev/null
@@ -1,376 +0,0 @@
-#!/usr/bin/env python3
-"""systemctl: subset of systemctl used for image construction
-
-Mask/preset systemd units
-"""
-
-import argparse
-import fnmatch
-import os
-import re
-import sys
-
-from collections import namedtuple
-from itertools import chain
-from pathlib import Path
-
-version = 1.0
-
-ROOT = Path("/")
-SYSCONFDIR = Path("etc")
-BASE_LIBDIR = Path("lib")
-LIBDIR = Path("usr", "lib")
-
-locations = list()
-
-
-class SystemdFile():
-    """Class representing a single systemd configuration file"""
-
-    _clearable_keys = ['WantedBy']
-
-    def __init__(self, root, path, instance_unit_name, unit_type):
-        self.sections = dict()
-        self._parse(root, path)
-        dirname = os.path.basename(path.name) + ".d"
-        for location in locations:
-            files = (root / location / unit_type / dirname).glob("*.conf")
-            if instance_unit_name:
-                inst_dirname = instance_unit_name + ".d"
-                files = chain(files, (root / location / unit_type / inst_dirname).glob("*.conf"))
-            for path2 in sorted(files):
-                self._parse(root, path2)
-
-    def _parse(self, root, path):
-        """Parse a systemd syntax configuration file
-
-        Args:
-            path: A pathlib.Path object pointing to the file
-
-        """
-        skip_re = re.compile(r"^\s*([#;]|$)")
-        section_re = re.compile(r"^\s*\[(?P<section>.*)\]")
-        kv_re = re.compile(r"^\s*(?P<key>[^\s]+)\s*=\s*(?P<value>.*)")
-        section = None
-
-        if path.is_symlink():
-            try:
-                path.resolve()
-            except FileNotFoundError:
-                # broken symlink, try relative to root
-                path = root / Path(os.readlink(str(path))).relative_to(ROOT)
-
-        with path.open() as f:
-            for line in f:
-                if skip_re.match(line):
-                    continue
-
-                line = line.strip()
-                m = section_re.match(line)
-                if m:
-                    if m.group('section') not in self.sections:
-                        section = dict()
-                        self.sections[m.group('section')] = section
-                    else:
-                        section = self.sections[m.group('section')]
-                    continue
-
-                while line.endswith("\\"):
-                    line += f.readline().rstrip("\n")
-
-                m = kv_re.match(line)
-                k = m.group('key')
-                v = m.group('value')
-                if k not in section:
-                    section[k] = list()
-
-                # If we come across a "key=" line for a "clearable key", then
-                # forget all preceding assignments. This works because we are
-                # processing files in correct parse order.
-                if k in self._clearable_keys and not v:
-                    del section[k]
-                    continue
-
-                section[k].extend(v.split())
-
-    def get(self, section, prop):
-        """Get a property from section
-
-        Args:
-            section: Section to retrieve property from
-            prop: Property to retrieve
-
-        Returns:
-            List representing all properties of type prop in section.
-
-        Raises:
-            KeyError: if ``section`` or ``prop`` not found
-        """
-        return self.sections[section][prop]
-
-
-class Presets():
-    """Class representing all systemd presets"""
-    def __init__(self, scope, root):
-        self.directives = list()
-        self._collect_presets(scope, root)
-
-    def _parse_presets(self, presets):
-        """Parse presets out of a set of preset files"""
-        skip_re = re.compile(r"^\s*([#;]|$)")
-        directive_re = re.compile(r"^\s*(?P<action>enable|disable)\s+(?P<unit_name>(.+))")
-
-        Directive = namedtuple("Directive", "action unit_name")
-        for preset in presets:
-            with preset.open() as f:
-                for line in f:
-                    m = directive_re.match(line)
-                    if m:
-                        directive = Directive(action=m.group('action'),
-                                              unit_name=m.group('unit_name'))
-                        self.directives.append(directive)
-                    elif skip_re.match(line):
-                        pass
-                    else:
-                        sys.exit("Unparsed preset line in {}".format(preset))
-
-    def _collect_presets(self, scope, root):
-        """Collect list of preset files"""
-        presets = dict()
-        for location in locations:
-            paths = (root / location / scope).glob("*.preset")
-            for path in paths:
-                # earlier names override later ones
-                if path.name not in presets:
-                    presets[path.name] = path
-
-        self._parse_presets([v for k, v in sorted(presets.items())])
-
-    def state(self, unit_name):
-        """Return state of preset for unit_name
-
-        Args:
-            presets: set of presets
-            unit_name: name of the unit
-
-        Returns:
-            None: no matching preset
-            `enable`: unit_name is enabled
-            `disable`: unit_name is disabled
-        """
-        for directive in self.directives:
-            if fnmatch.fnmatch(unit_name, directive.unit_name):
-                return directive.action
-
-        return None
-
-
-def add_link(path, target):
-    try:
-        path.parent.mkdir(parents=True)
-    except FileExistsError:
-        pass
-    if not path.is_symlink():
-        print("ln -s {} {}".format(target, path))
-        path.symlink_to(target)
-
-
-class SystemdUnitNotFoundError(Exception):
-    def __init__(self, path, unit):
-        self.path = path
-        self.unit = unit
-
-
-class SystemdUnit():
-    def __init__(self, root, unit, unit_type):
-        self.root = root
-        self.unit = unit
-        self.unit_type = unit_type
-        self.config = None
-
-    def _path_for_unit(self, unit):
-        for location in locations:
-            path = self.root / location / self.unit_type / unit
-            if path.exists() or path.is_symlink():
-                return path
-
-        raise SystemdUnitNotFoundError(self.root, unit)
-
-    def _process_deps(self, config, service, location, prop, dirstem, instance):
-        systemdir = self.root / SYSCONFDIR / "systemd" / self.unit_type
-
-        target = ROOT / location.relative_to(self.root)
-        try:
-            for dependent in config.get('Install', prop):
-                # expand any %i to instance (ignoring escape sequence %%)
-                dependent = re.sub("([^%](%%)*)%i", "\\g<1>{}".format(instance), dependent)
-                wants = systemdir / "{}.{}".format(dependent, dirstem) / service
-                add_link(wants, target)
-
-        except KeyError:
-            pass
-
-    def enable(self, units_enabled=[]):
-        # if we're enabling an instance, first extract the actual instance
-        # then figure out what the template unit is
-        template = re.match(r"[^@]+@(?P<instance>[^\.]*)\.", self.unit)
-        instance_unit_name = None
-        if template:
-            instance = template.group('instance')
-            if instance != "":
-                instance_unit_name = self.unit
-            unit = re.sub(r"@[^\.]*\.", "@.", self.unit, 1)
-        else:
-            instance = None
-            unit = self.unit
-
-        if instance_unit_name is not None:
-            try:
-                # Try first with instance unit name. Systemd allows to create instance unit files
-                # e.g. `gnome-shell@wayland.service` which cause template unit file to be ignored
-                # for the instance for which instance unit file is present. In that case, there may
-                # not be any template file at all.
-                path = self._path_for_unit(instance_unit_name)
-            except SystemdUnitNotFoundError:
-                path = self._path_for_unit(unit)
-        else:
-            path = self._path_for_unit(unit)
-
-        if path.is_symlink():
-            # ignore aliases
-            return
-
-        config = SystemdFile(self.root, path, instance_unit_name, self.unit_type)
-        if instance == "":
-            try:
-                default_instance = config.get('Install', 'DefaultInstance')[0]
-            except KeyError:
-                # no default instance, so nothing to enable
-                return
-
-            service = self.unit.replace("@.",
-                                        "@{}.".format(default_instance))
-        else:
-            service = self.unit
-
-        self._process_deps(config, service, path, 'WantedBy', 'wants', instance)
-        self._process_deps(config, service, path, 'RequiredBy', 'requires', instance)
-
-        try:
-            for also in config.get('Install', 'Also'):
-                try:
-                     units_enabled.append(unit)
-                     if also not in units_enabled:
-                        SystemdUnit(self.root, also, self.unit_type).enable(units_enabled)
-                except SystemdUnitNotFoundError as e:
-                    sys.exit("Error: Systemctl also enable issue with  %s (%s)" % (service, e.unit))
-
-        except KeyError:
-            pass
-
-        systemdir = self.root / SYSCONFDIR / "systemd" / self.unit_type
-        target = ROOT / path.relative_to(self.root)
-        try:
-            for dest in config.get('Install', 'Alias'):
-                alias = systemdir / dest
-                add_link(alias, target)
-
-        except KeyError:
-            pass
-
-    def mask(self):
-        systemdir = self.root / SYSCONFDIR / "systemd" / self.unit_type
-        add_link(systemdir / self.unit, "/dev/null")
-
-
-def collect_services(root, unit_type):
-    """Collect list of service files"""
-    services = set()
-    for location in locations:
-        paths = (root / location / unit_type).glob("*")
-        for path in paths:
-            if path.is_dir():
-                continue
-            services.add(path.name)
-
-    return services
-
-
-def preset_all(root, unit_type):
-    presets = Presets('{}-preset'.format(unit_type), root)
-    services = collect_services(root, unit_type)
-
-    for service in services:
-        state = presets.state(service)
-
-        if state == "enable" or state is None:
-            try:
-                SystemdUnit(root, service, unit_type).enable()
-            except SystemdUnitNotFoundError:
-                sys.exit("Error: Systemctl preset_all issue in %s" % service)
-
-    # If we populate the systemd links we also create /etc/machine-id, which
-    # allows systemd to boot with the filesystem read-only before generating
-    # a real value and then committing it back.
-    #
-    # For the stateless configuration, where /etc is generated at runtime
-    # (for example on a tmpfs), this script shouldn't run at all and we
-    # allow systemd to completely populate /etc.
-    (root / SYSCONFDIR / "machine-id").touch()
-
-
-def main():
-    if sys.version_info < (3, 4, 0):
-        sys.exit("Python 3.4 or greater is required")
-
-    parser = argparse.ArgumentParser()
-    parser.add_argument('command', nargs='?', choices=['enable', 'mask',
-                                                     'preset-all'])
-    parser.add_argument('service', nargs=argparse.REMAINDER)
-    parser.add_argument('--root')
-    parser.add_argument('--preset-mode',
-                        choices=['full', 'enable-only', 'disable-only'],
-                        default='full')
-    parser.add_argument('--global', dest="opt_global", action="store_true", default=False)
-
-    args = parser.parse_args()
-
-    root = Path(args.root) if args.root else ROOT
-
-    locations.append(SYSCONFDIR / "systemd")
-    # Handle the usrmerge case by ignoring /lib when it's a symlink
-    if not (root / BASE_LIBDIR).is_symlink():
-        locations.append(BASE_LIBDIR / "systemd")
-    locations.append(LIBDIR / "systemd")
-
-    command = args.command
-    if not command:
-        parser.print_help()
-        return 0
-
-    unit_type = "user" if args.opt_global else "system"
-
-    if command == "mask":
-        for service in args.service:
-            try:
-                SystemdUnit(root, service, unit_type).mask()
-            except SystemdUnitNotFoundError as e:
-                sys.exit("Error: Systemctl main mask issue in %s (%s)" % (service, e.unit))
-    elif command == "enable":
-        for service in args.service:
-            try:
-                SystemdUnit(root, service, unit_type).enable()
-            except SystemdUnitNotFoundError as e:
-                sys.exit("Error: Systemctl main enable issue in %s (%s)" % (service, e.unit))
-    elif command == "preset-all":
-        if len(args.service) != 0:
-            sys.exit("Too many arguments.")
-        if args.preset_mode != "enable-only":
-            sys.exit("Only enable-only is supported as preset-mode.")
-        preset_all(root, unit_type)
-    else:
-        raise RuntimeError()
-
-
-if __name__ == '__main__':
-    main()

