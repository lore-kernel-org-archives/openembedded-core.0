Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 757897D777
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 21:10:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l2so5254215wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 14:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u1H1Ju+WQvBBfDVOgg20KrmUNbLWRAjxb2VYdnOKAJg=;
	b=mxidt2VAPAlYL9iojU7+Gs95n5lxjnQT19f/ewhUVwVk6vh+u0Jqp+9zY0Pyh07/TH
	JpHQocrf9RRDo9ZQeN29CCjogFumkmH7wzcEpPvt5tlBEsNuCtv/dheXKmrZ5qJnQoiH
	56rKslrHW5esyBVkKWIIackfL0kIuWfgxStlBPsoAhQr6AIib5wIeXDWTyZYJzZ/6+Qa
	E9PgU49vFBgEiWq31ecEllydcN9bsDycqZUlmRN2L43OmrcYLHnJo5wIfa6x6gmsqcqU
	H3f9kaGCKCIn2WiO0O3PG9NmVyLc4qUUOExpsFiCyAPNoOw9uSchFwCkV5fkwdjmyBrx
	Thjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u1H1Ju+WQvBBfDVOgg20KrmUNbLWRAjxb2VYdnOKAJg=;
	b=diPkuDRpJidwGRsKjztO/QMFjWgpcrV83kx62+UTnuFZ4eVHoa59ciT8qfoXpryWUB
	3137QfUsC7ewFmwK8j/p7mbAj0DjUBYTyvTH1h1KkMoVPZ9iersKpbl8C/Wrxiy7DlfQ
	5n8LsUl7I40q9++cY5WlsQWz+roLgj6fNTT3N5z70O7I2wQ9v6p7oOYZyN8qR5UdKqVK
	Pn0/7RJNk6K32zG7O5OPi9npwNSfR60B7yen2ZZ5Rfhmw4vPqg+OosU3EODG4+PjUAnd
	sw9NTl8u8amE/h9hmqns5vbhvlWYvUvNHgJaOnBdrk1Fw2RrM/S50R2vFiIcN/k3j5i4
	H3/g==
X-Gm-Message-State: APjAAAU9lx22Nw8QWRg+9PeOYbx8zQ4f0+Duj1WdIg0+KL3NFP5zJI5V
	GEDfY9zsyom77ybCPzv3FAJuXEqo
X-Google-Smtp-Source: APXvYqyWmiX2g3n/CH6raQAMI1IvZmbeR8Fc41WtPfzaIn5JnL6Oz0qzazQ1z8vvALHCJdIJSq09rA==
X-Received: by 2002:adf:e302:: with SMTP id b2mr4113261wrj.328.1556831423855; 
	Thu, 02 May 2019 14:10:23 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id y184sm523486wmg.7.2019.05.02.14.10.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 May 2019 14:10:23 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 22:09:43 +0100
Message-Id: <20190502210944.62696-6-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190502210944.62696-1-alex.kiernan@gmail.com>
References: <20190502210944.62696-1-alex.kiernan@gmail.com>
Subject: [PATCH v6 5/6] systemctl-native: Rewrite in Python supporting preset-all and mask
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
X-List-Received-Date: Thu, 02 May 2019 21:10:23 -0000

Rewrite systemctl-native in Python so that extending/testing it is
easier.

Now that the systemd class sets up service presets instead of actively
enabling services, the 'enable' and 'disable' subcommands for systemctl
are not actually used anywhere.  As such, we can remove these to make
sure that nobody inadvertently introduces new uses of them.

This implementation covers `preset-all` and `mask` which are the only
options used in the current code, but should be readily extensible to
other commands.

We use `preset-all` at image construction time to populate the symlinks
used by systemd.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v6:
- rewrite systemctl-native in Python

Changes in v5: None

 .../systemd/systemd-systemctl/systemctl       | 476 ++++++++++--------
 1 file changed, 280 insertions(+), 196 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 2bc648961761..d7d4e0d29a09 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -1,196 +1,280 @@
-#!/bin/sh
-echo "Started $0 $*"
-
-ROOT=
-
-# parse command line params
-action=
-while [ $# != 0 ]; do
-	opt="$1"
-
-	case "$opt" in
-		enable)
-			shift
-
-			action="$opt"
-			services="$1"
-			cmd_args="1"
-			shift
-			;;
-		disable)
-			shift
-
-			action="$opt"
-			services="$1"
-			cmd_args="1"
-			shift
-			;;
-		mask)
-			shift
-
-			action="$opt"
-			services="$1"
-			cmd_args="1"
-			shift
-			;;
-		preset)
-			shift
-
-			action="$opt"
-			services="$1"
-			cmd_args="1"
-			shift
-			;;
-		--root=*)
-			ROOT=${opt##--root=}
-			cmd_args="0"
-			shift
-			;;
-		*)
-			if [ "$cmd_args" = "1" ]; then
-				services="$services $opt" 
-				shift
-			else
-				echo "'$opt' is an unkown option; exiting with error"
-				exit 1
-			fi
-			;;
-	esac
-done
-if [ "$action" = "preset" -a "$service_file" = "" ]; then
-	services=$(for f in `find $ROOT/etc/systemd/system $ROOT/lib/systemd/system $ROOT/usr/lib/systemd/system -type f 2>1`; do basename $f; done)
-	services="$services $opt"
-	presetall=1
-fi
-
-for service in $services; do
-	if [ "$presetall" = "1" ]; then
-		action="preset"
-	fi
-	if [ "$action" = "mask" ]; then
-		if [ ! -d $ROOT/etc/systemd/system/ ]; then
-			mkdir -p $ROOT/etc/systemd/system/
-		fi
-		cmd="ln -s /dev/null $ROOT/etc/systemd/system/$service"
-		echo "$cmd"
-		$cmd
-		exit 0
-	fi
-
-	service_base_file=`echo $service | sed 's/\(@\).*\(\.[^.]\+\)/\1\2/'`
-	if [ -z `echo $service | sed '/@/p;d'` ]; then
-		echo "Try to find location of $service..."
-		service_template=false
-	else
-		echo "Try to find location of template $service_base_file of instance $service..."
-		service_template=true
-		instance_specified=`echo $service | sed 's/^.\+@\(.*\)\.[^.]\+/\1/'`
-	fi
-
-	# find service file
-	for p in $ROOT/etc/systemd/system \
-		 $ROOT/lib/systemd/system \
-		 $ROOT/usr/lib/systemd/system; do
-		if [ -e $p/$service_base_file ]; then
-			service_file=$p/$service_base_file
-			service_file=${service_file##$ROOT}
-		fi
-	done
-	if [ -z "$service_file" ]; then
-		echo "'$service_base_file' couldn't be found; exiting with error"
-		exit 1
-	fi
-	echo "Found $service in $service_file"
-
-	# If any new unit types are added to systemd they should be added
-	# to this regular expression.
-	unit_types_re='\.\(service\|socket\|device\|mount\|automount\|swap\|target\|target\.wants\|path\|timer\|snapshot\)\s*$'
-	if [ "$action" = "preset" ]; then
-		action=`egrep -sh  $service $ROOT/etc/systemd/user-preset/*.preset | cut -f1 -d' '`
-		if [ -z "$action" ]; then
-			globalpreset=`egrep -sh  '\*'  $ROOT/etc/systemd/user-preset/*.preset | cut -f1 -d' '`
-			if [ -n "$globalpreset" ]; then
-				action="$globalpreset"
-			else
-				action="enable"
-			fi
-		fi
-	fi
-	# create the required symbolic links
-	wanted_by=$(sed '/^WantedBy[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file" \
-		        | tr ',' '\n' \
-		        | grep "$unit_types_re")
-
-	required_by=$(sed '/^RequiredBy[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file" \
-		        | tr ',' '\n' \
-		        | grep "$unit_types_re")
-
-	for dependency in WantedBy RequiredBy; do
-		if [ "$dependency" = "WantedBy" ]; then
-			suffix="wants"
-			dependency_list="$wanted_by"
-		elif [ "$dependency" = "RequiredBy" ]; then
-			suffix="requires"
-			dependency_list="$required_by"
-		fi
-		for r in $dependency_list; do
-			echo "$dependency=$r found in $service"
-			if [ -n "$instance_specified" ]; then
-				# substitute wildcards in the dependency
-				r=`echo $r | sed "s/%i/$instance_specified/g"`
-			fi
-
-			if [ "$action" = "enable" ]; then
-				enable_service=$service
-				if [ "$service_template" = true -a -z "$instance_specified" ]; then
-					default_instance=$(sed '/^DefaultInstance[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file")
-					if [ -z $default_instance ]; then
-						echo "Template unit without instance or DefaultInstance directive, nothing to enable"
-						continue
-					else
-						echo "Found DefaultInstance $default_instance, enabling it"
-						enable_service=$(echo $service | sed "s/@/@$(echo $default_instance | sed 's/\\/\\\\/g')/")
-					fi
-				fi
-				mkdir -p $ROOT/etc/systemd/system/$r.$suffix
-				ln -s $service_file $ROOT/etc/systemd/system/$r.$suffix/$enable_service
-				echo "Enabled $enable_service for $r."
-			else
-				if [ "$service_template" = true -a -z "$instance_specified" ]; then
-					disable_service="$ROOT/etc/systemd/system/$r.$suffix/`echo $service | sed 's/@/@*/'`"
-				else
-					disable_service="$ROOT/etc/systemd/system/$r.$suffix/$service"
-				fi
-				rm -f $disable_service
-				[ -d $ROOT/etc/systemd/system/$r.$suffix ] && rmdir --ignore-fail-on-non-empty -p $ROOT/etc/systemd/system/$r.$suffix
-				echo "Disabled ${disable_service##$ROOT/etc/systemd/system/$r.$suffix/} for $r."
-			fi
-		done
-	done
-
-	# create the required symbolic 'Alias' links
-	alias=$(sed '/^Alias[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file" \
-		        | tr ',' '\n' \
-		        | grep "$unit_types_re")
-
-	for r in $alias; do
-		if [ "$action" = "enable" ]; then
-			mkdir -p $ROOT/etc/systemd/system
-			ln -s $service_file $ROOT/etc/systemd/system/$r
-			echo "Enabled $service for $alias."
-		else
-			rm -f $ROOT/etc/systemd/system/$r
-			echo "Disabled $service for $alias."
-		fi
-	done
-
-	# call us for the other required scripts
-	also=$(sed '/^Also[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file" \
-		   | tr ',' '\n')
-	for a in $also; do
-		echo "Also=$a found in $service"
-		if [ "$action" = "enable" ]; then
-			$0 --root=$ROOT enable $a
-		fi
-	done
-done
+#!/usr/bin/env python3
+"""systemctl: subset of systemctl used for image construction
+
+Mask/preset systemd units
+"""
+
+import argparse
+import fnmatch
+import os
+import re
+import sys
+
+from collections import namedtuple
+from pathlib import Path
+
+version = 1.0
+
+ROOT = Path("/")
+SYSCONFDIR = Path("etc")
+BASE_LIBDIR = Path("lib")
+LIBDIR = Path("usr", "lib")
+
+
+class SystemdFile():
+    """Class representing a single systemd configuration file"""
+    def __init__(self, root, path):
+        self.sections = dict()
+        self._parse(root, path)
+
+    def _parse(self, root, path):
+        """Parse a systemd syntax configuration file
+
+        Args:
+            path: A pathlib.Path object pointing to the file
+
+        """
+        skip_re = re.compile(r"^\s*([#;]|$)")
+        section_re = re.compile(r"^\s*\[(?P<section>.*)\]")
+        kv_re = re.compile(r"^\s*(?P<key>[^\s]+)\s*=\s*(?P<value>.*)")
+        section = None
+
+        if path.is_symlink():
+            try:
+                path.resolve()
+            except FileNotFoundError:
+                # broken symlink, try relative to root
+                path = root / Path(os.readlink(str(path))).relative_to(ROOT)
+
+        with path.open() as f:
+            for line in f:
+                if skip_re.match(line):
+                    continue
+
+                line = line.rstrip("\n")
+                m = section_re.match(line)
+                if m:
+                    section = dict()
+                    self.sections[m.group('section')] = section
+                    continue
+
+                while line.endswith("\\"):
+                    line += f.readline().rstrip("\n")
+
+                m = kv_re.match(line)
+                k = m.group('key')
+                v = m.group('value')
+                if k not in section:
+                    section[k] = list()
+                section[k].extend(v.split())
+
+    def get(self, section, prop):
+        """Get a property from section
+
+        Args:
+            section: Section to retrieve property from
+            prop: Property to retrieve
+
+        Returns:
+            List representing all properties of type prop in section.
+
+        Raises:
+            KeyError: if ``section`` or ``prop`` not found
+        """
+        return self.sections[section][prop]
+
+
+class Presets():
+    """Class representing all systemd presets"""
+    def __init__(self, scope, root):
+        self.directives = list()
+        self._collect_presets(scope, root)
+
+    def _parse_presets(self, presets):
+        """Parse presets out of a set of preset files"""
+        skip_re = re.compile(r"^\s*([#;]|$)")
+        directive_re = re.compile(r"^\s*(?P<action>enable|disable)\s+(?P<unit_name>(.+))")
+
+        Directive = namedtuple("Directive", "action unit_name")
+        for preset in presets:
+            with preset.open() as f:
+                for line in f:
+                    m = directive_re.match(line)
+                    if m:
+                        directive = Directive(action=m.group('action'),
+                                              unit_name=m.group('unit_name'))
+                        self.directives.append(directive)
+                    elif skip_re.match(line):
+                        pass
+                    else:
+                        sys.exit("Unparsed preset line in {}".format(preset))
+
+    def _collect_presets(self, scope, root):
+        """Collect list of preset files"""
+        locations = [SYSCONFDIR / "systemd"]
+        # Handle the usrmerge case by ignoring /lib when it's a symlink
+        if not BASE_LIBDIR.is_symlink():
+            locations.append(BASE_LIBDIR / "systemd")
+        locations.append(LIBDIR / "systemd")
+
+        presets = dict()
+        for location in locations:
+            paths = (root / location / scope).glob("*.preset")
+            for path in paths:
+                # earlier names override later ones
+                if path.name not in presets:
+                    presets[path.name] = path
+
+        self._parse_presets([v for k, v in sorted(presets.items())])
+
+    def state(self, unit_name):
+        """Return state of preset for unit_name
+
+        Args:
+            presets: set of presets
+            unit_name: name of the unit
+
+        Returns:
+            None: no matching preset
+            `enable`: unit_name is enabled
+            `disable`: unit_name is disabled
+        """
+        for directive in self.directives:
+            if fnmatch.fnmatch(unit_name, directive.unit_name):
+                return directive.action
+
+        return None
+
+
+def collect_services(root):
+    """Collect list of service files"""
+    locations = [SYSCONFDIR / "systemd"]
+    # Handle the usrmerge case by ignoring /lib when it's a symlink
+    if not BASE_LIBDIR.is_symlink():
+        locations.append(BASE_LIBDIR / "systemd")
+    locations.append(LIBDIR / "systemd")
+
+    services = dict()
+    for location in locations:
+        paths = (root / location / "system").glob("*")
+        for path in paths:
+            if path.is_dir():
+                continue
+            # implement earlier names override later ones
+            if path.name not in services:
+                services[path.name] = path
+
+    return services
+
+
+def add_link(path, target):
+    try:
+        path.parent.mkdir(parents=True)
+    except FileExistsError:
+        pass
+    if not path.is_symlink():
+        print("ln -s {} {}".format(target, path))
+        path.symlink_to(target)
+
+
+def process_deps(root, config, service, location, prop, dirstem):
+    systemdir = SYSCONFDIR / "systemd" / "system"
+
+    target = ROOT / location.relative_to(root)
+    try:
+        for dependent in config.get('Install', prop):
+            wants = root / systemdir / "{}.{}".format(dependent, dirstem) / service
+            add_link(wants, target)
+
+    except KeyError:
+        pass
+
+
+def enable(root, service, location, services):
+    if location.is_symlink():
+        # ignore aliases
+        return
+
+    config = SystemdFile(root, location)
+    template = re.match(r"[^@]+@(?P<instance>[^\.]*)\.", service)
+    if template:
+        instance = template.group('instance')
+        if not instance:
+            try:
+                instance = config.get('Install', 'DefaultInstance')[0]
+                service = service.replace("@.", "@{}.".format(instance))
+            except KeyError:
+                pass
+        if instance is None:
+            return
+    else:
+        instance = None
+
+    process_deps(root, config, service, location, 'WantedBy', 'wants')
+    process_deps(root, config, service, location, 'RequiredBy', 'requires')
+
+    try:
+        for also in config.get('Install', 'Also'):
+            enable(root, also, services[also], services)
+
+    except KeyError:
+        pass
+
+    systemdir = root / SYSCONFDIR / "systemd" / "system"
+    target = ROOT / location.relative_to(root)
+    try:
+        for dest in config.get('Install', 'Alias'):
+            alias = systemdir / dest
+            add_link(alias, target)
+
+    except KeyError:
+        pass
+
+
+def preset_all(root):
+    presets = Presets('system-preset', root)
+    services = collect_services(root)
+
+    for service, location in services.items():
+        state = presets.state(service)
+
+        if state == "enable" or state is None:
+            enable(root, service, location, services)
+
+
+def mask(root, *services):
+    systemdir = root / SYSCONFDIR / "systemd" / "system"
+    for service in services:
+        add_link(systemdir / service, "/dev/null")
+
+
+def main():
+    if sys.version_info < (3, 4, 0):
+        sys.exit("Python 3.4 or greater is required")
+
+    parser = argparse.ArgumentParser()
+    parser.add_argument('command', nargs=1, choices=['mask', 'preset-all'])
+    parser.add_argument('service', nargs=argparse.REMAINDER)
+    parser.add_argument('--root')
+    parser.add_argument('--preset-mode',
+                        choices=['full', 'enable-only', 'disable-only'],
+                        default='full')
+
+    args = parser.parse_args()
+
+    root = Path(args.root) if args.root else ROOT
+    command = args.command[0]
+    if command == "mask":
+        mask(root, *args.service)
+    elif command == "preset-all":
+        if len(args.service) != 0:
+            sys.exit("Too many arguments.")
+        if args.preset_mode != "enable-only":
+            sys.exit("Only enable-only is supported as preset-mode.")
+        preset_all(root)
+    else:
+        raise RuntimeError()
+
+
+if __name__ == '__main__':
+    main()
-- 
2.17.1


