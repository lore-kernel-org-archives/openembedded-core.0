Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7FFC96067C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:44:12 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id o25so2168715wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 05:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=sJJyzvdvepxv31if/9cEN3Andju4P67IAXHmqX6gCSk=;
	b=QEu9xqYFe/Yj+kGUr6eV6MdF/v453DkEz2weVbcQPMSMqpNFTtywOxJjFg5c6Yq/Jb
	FENpU60GyxVjVBYqKDE7Z1CEh7wQpTknx+uYh2b6QgphKvVeEkXJqf2lwW0KFH6xqR2A
	9LDtPWOdexXvKMsTuw0b3EdEs/Td+Q8iKNe+6zB2FlPa5GYDrGwGvy5CxSahW3HLRNw9
	1vlGeqNu4bhvClhoVHmGCfg8wInBYT4KFOzDrUmtIRnK5omUbls++cNqa7RVsi3ee8GE
	nkxbbaClbHOb7Cau+UHSde3aFXQrwib7W8R4Y8brOvfv8bXBuLDC++cTXLk/X7eCLX0P
	3brQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sJJyzvdvepxv31if/9cEN3Andju4P67IAXHmqX6gCSk=;
	b=saM1TdFdBNUQxzPJez00CncZtesgVW2aUFWSOX7JGQm/r37j3R73DOCClg3bqHyCsb
	Ulh23pnpL0ZAmB24azuf59rvpoki06dWuUSqte5eyPfif7YETx+KKxPFQmjIDunLuw++
	ZHGKh2b2nSHMAKp3CYmUqU3FXNqAxqbemj19PId7zrTK4HPffze9ffM6g8cGci0RPzhh
	ybQjwrFucVwm7cBHC42fdFGK0GvEawjjHkoHhZdrSkxRrdlk43IymYQTXn4b9p6XF15G
	hu8Ze81rxNidAlXr8gls75tFu4sZttyCAux9BjjQdJAcjRzGtWyebh5ZtO09FkO2gXlb
	ugWw==
X-Gm-Message-State: APjAAAVyzgvVbqUD8ve3W6mELBuLuzGmoeCyd8QGuIp1JN0Pypon4RWM
	RKg5mFYo2afaUlHz3M69/BPt7znCyFY=
X-Google-Smtp-Source: APXvYqzSt9Imh257qoZ4FvjjP4XMdeGoLy3lP6GAHqqREjsoj44ig0+1wCj6+7JE/b+cTXjww22N9A==
X-Received: by 2002:a1c:9e89:: with SMTP id h131mr2509480wme.41.1553172252914; 
	Thu, 21 Mar 2019 05:44:12 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h131sm16353371wmh.1.2019.03.21.05.44.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Mar 2019 05:44:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 12:44:09 +0000
Message-Id: <20190321124409.4611-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] meson: support multiple cross configuration files
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
X-List-Received-Date: Thu, 21 Mar 2019 12:44:14 -0000

For historical reasons Meson supports only a single cross configuration file but
multiple native configuration files.  Add support for multiple cross files, so
that recipes such as glib can use the toolchain cross file and extend it with a
recipe-specific cross file containing values needed to build.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/meson.inc              |   3 +-
 .../meson/meson/cross-libdir.patch                 |  18 +-
 meta/recipes-devtools/meson/meson/many-cross.patch | 207 +++++++++++++++++++++
 3 files changed, 215 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-devtools/meson/meson/many-cross.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index ca448b00a0c..2d18f72c0c1 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -11,10 +11,11 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0003-native_bindir.patch \
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            file://disable-rpath-handling.patch \
-           file://cross-libdir.patch \
            file://0001-modules-windows-split-WINDRES-env-variable.patch \
            file://0002-environment.py-detect-windows-also-if-the-system-str.patch \
            file://cross-prop-default.patch \
+           file://many-cross.patch \
+           file://cross-libdir.patch \
            "
 SRC_URI[sha256sum] = "ef9f14326ec1e30d3ba1a26df0f92826ede5a79255ad723af78a2691c37109fd"
 SRC_URI[md5sum] = "0267b0871266056184c484792572c682"
diff --git a/meta/recipes-devtools/meson/meson/cross-libdir.patch b/meta/recipes-devtools/meson/meson/cross-libdir.patch
index 2bd4fb3f9e3..7395fdbdaa6 100644
--- a/meta/recipes-devtools/meson/meson/cross-libdir.patch
+++ b/meta/recipes-devtools/meson/meson/cross-libdir.patch
@@ -7,17 +7,11 @@ Date: Thu, 27 Dec 2018 23:43:35 +0200
 Subject: [PATCH] Default libdir is "lib" when cross compiling. Closes #2535.
 
 ---
- docs/markdown/snippets/crosslib.md |  7 +++++++
- mesonbuild/coredata.py             |  8 ++++++++
- run_unittests.py                   | 13 +++++++++++++
- 3 files changed, 28 insertions(+)
- create mode 100644 docs/markdown/snippets/crosslib.md
-
 diff --git a/mesonbuild/coredata.py b/mesonbuild/coredata.py
-index d70c23038c..4e2f3e008c 100644
+index ff810683..9ee23a69 100644
 --- a/mesonbuild/coredata.py
 +++ b/mesonbuild/coredata.py
-@@ -299,6 +299,7 @@ def __init__(self, options):
+@@ -298,6 +298,7 @@ class CoreData:
          # Only to print a warning if it changes between Meson invocations.
          self.pkgconf_envvar = os.environ.get('PKG_CONFIG_PATH', '')
          self.config_files = self.__load_config_files(options.native_file)
@@ -25,15 +19,15 @@ index d70c23038c..4e2f3e008c 100644
  
      @staticmethod
      def __load_config_files(filenames):
-@@ -348,6 +349,13 @@ def __load_cross_file(filename):
- 
-         raise MesonException('Cannot find specified cross file: ' + filename)
+@@ -309,6 +310,13 @@ class CoreData:
+                      for f in filenames]
+         return filenames
  
 +    def libdir_cross_fixup(self):
 +        # By default set libdir to "lib" when cross compiling since
 +        # getting the "system default" is always wrong on multiarch
 +        # platforms as it gets a value like lib/x86_64-linux-gnu.
-+        if self.cross_file is not None:
++        if self.cross_files:
 +            self.builtins['libdir'].value = 'lib'
 +
      def sanitize_prefix(self, prefix):
diff --git a/meta/recipes-devtools/meson/meson/many-cross.patch b/meta/recipes-devtools/meson/meson/many-cross.patch
new file mode 100644
index 00000000000..d04c28b8a38
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/many-cross.patch
@@ -0,0 +1,207 @@
+mesonbuild: allow multiple --cross-file options
+
+Just like --native-file, allow multiple --cross-file options.  This is mostly
+unifying the logic between cross_files and config_files.
+
+Upstream-Status: Backport [will be in 0.50.1]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/mesonbuild/backend/backends.py b/mesonbuild/backend/backends.py
+index 40402513..4b9bcb59 100644
+--- a/mesonbuild/backend/backends.py
++++ b/mesonbuild/backend/backends.py
+@@ -726,8 +726,7 @@ class Backend:
+         deps = [os.path.join(self.build_to_src, df)
+                 for df in self.interpreter.get_build_def_files()]
+         if self.environment.is_cross_build():
+-            deps.append(os.path.join(self.build_to_src,
+-                                     self.environment.coredata.cross_file))
++            deps.extend(self.environment.coredata.cross_files)
+         deps.append('meson-private/coredata.dat')
+         if os.path.exists(os.path.join(self.environment.get_source_dir(), 'meson_options.txt')):
+             deps.append(os.path.join(self.build_to_src, 'meson_options.txt'))
+diff --git a/mesonbuild/coredata.py b/mesonbuild/coredata.py
+index c3f5a745..ff810683 100644
+--- a/mesonbuild/coredata.py
++++ b/mesonbuild/coredata.py
+@@ -201,8 +201,8 @@ class UserFeatureOption(UserComboOption):
+         return self.value == 'auto'
+ 
+ 
+-def load_configs(filenames):
+-    """Load native files."""
++def load_configs(filenames, subdir):
++    """Load configuration files from a named subdirectory."""
+     def gen():
+         for f in filenames:
+             f = os.path.expanduser(os.path.expandvars(f))
+@@ -215,7 +215,7 @@ def load_configs(filenames):
+                     os.environ.get('XDG_DATA_HOME', os.path.expanduser('~/.local/share')),
+                 ] + os.environ.get('XDG_DATA_DIRS', '/usr/local/share:/usr/share').split(':')
+                 for path in paths:
+-                    path_to_try = os.path.join(path, 'meson', 'native', f)
++                    path_to_try = os.path.join(path, 'meson', subdir, f)
+                     if os.path.isfile(path_to_try):
+                         yield path_to_try
+                         break
+@@ -291,7 +291,7 @@ class CoreData:
+         self.compiler_options = {}
+         self.base_options = {}
+         self.external_preprocess_args = {} # CPPFLAGS only
+-        self.cross_file = self.__load_cross_file(options.cross_file)
++        self.cross_files = self.__load_config_files(options.cross_file)
+         self.compilers = OrderedDict()
+         self.cross_compilers = OrderedDict()
+         self.deps = OrderedDict()
+@@ -301,52 +301,14 @@ class CoreData:
+ 
+     @staticmethod
+     def __load_config_files(filenames):
++        # Need to try and make the passed filenames absolute because when the
++        # files are parsed later we'll have chdir()d.
+         if not filenames:
+             return []
+         filenames = [os.path.abspath(os.path.expanduser(os.path.expanduser(f)))
+                      for f in filenames]
+         return filenames
+ 
+-    @staticmethod
+-    def __load_cross_file(filename):
+-        """Try to load the cross file.
+-
+-        If the filename is None return None. If the filename is an absolute
+-        (after resolving variables and ~), return that absolute path. Next,
+-        check if the file is relative to the current source dir. If the path
+-        still isn't resolved do the following:
+-            Windows:
+-                - Error
+-            *:
+-                - $XDG_DATA_HOME/meson/cross (or ~/.local/share/meson/cross if
+-                  undefined)
+-                - $XDG_DATA_DIRS/meson/cross (or
+-                  /usr/local/share/meson/cross:/usr/share/meson/cross if undefined)
+-                - Error
+-
+-        Non-Windows follows the Linux path and will honor XDG_* if set. This
+-        simplifies the implementation somewhat.
+-        """
+-        if filename is None:
+-            return None
+-        filename = os.path.expanduser(os.path.expandvars(filename))
+-        if os.path.isabs(filename):
+-            return filename
+-        path_to_try = os.path.abspath(filename)
+-        if os.path.isfile(path_to_try):
+-            return path_to_try
+-        if sys.platform != 'win32':
+-            paths = [
+-                os.environ.get('XDG_DATA_HOME', os.path.expanduser('~/.local/share')),
+-            ] + os.environ.get('XDG_DATA_DIRS', '/usr/local/share:/usr/share').split(':')
+-            for path in paths:
+-                path_to_try = os.path.join(path, 'meson', 'cross', filename)
+-                if os.path.isfile(path_to_try):
+-                    return path_to_try
+-            raise MesonException('Cannot find specified cross file: ' + filename)
+-
+-        raise MesonException('Cannot find specified cross file: ' + filename)
+-
+     def sanitize_prefix(self, prefix):
+         if not os.path.isabs(prefix):
+             raise MesonException('prefix value {!r} must be an absolute path'
+@@ -558,8 +520,8 @@ def read_cmd_line_file(build_dir, options):
+     options.cmd_line_options = d
+ 
+     properties = config['properties']
+-    if options.cross_file is None:
+-        options.cross_file = properties.get('cross_file', None)
++    if not options.cross_file:
++        options.cross_file = ast.literal_eval(properties.get('cross_file', '[]'))
+     if not options.native_file:
+         # This will be a string in the form: "['first', 'second', ...]", use
+         # literal_eval to get it into the list of strings.
+@@ -570,7 +532,7 @@ def write_cmd_line_file(build_dir, options):
+     config = CmdLineFileParser()
+ 
+     properties = {}
+-    if options.cross_file is not None:
++    if options.cross_file:
+         properties['cross_file'] = options.cross_file
+     if options.native_file:
+         properties['native_file'] = options.native_file
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index 6d86daf9..406ab8b8 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -355,8 +355,8 @@ class Environment:
+         self.machines = MachineInfos()
+         # Will be fully initialized later using compilers later.
+         self.machines.detect_build()
+-        if self.coredata.cross_file:
+-            self.cross_info = CrossBuildInfo(self.coredata.cross_file)
++        if self.coredata.cross_files:
++            self.cross_info = CrossBuildInfo(self.coredata.cross_files)
+             if 'exe_wrapper' in self.cross_info.config['binaries']:
+                 from .dependencies import ExternalProgram
+                 self.exe_wrapper = ExternalProgram.from_bin_list(
+@@ -373,7 +373,7 @@ class Environment:
+ 
+         if self.coredata.config_files:
+             self.config_info = coredata.ConfigData(
+-                coredata.load_configs(self.coredata.config_files))
++                coredata.load_configs(self.coredata.config_files, 'native'))
+         else:
+             self.config_info = coredata.ConfigData()
+ 
+@@ -1113,13 +1113,8 @@ class CrossBuildInfo:
+     def ok_type(self, i):
+         return isinstance(i, (str, int, bool))
+ 
+-    def parse_datafile(self, filename):
+-        config = configparser.ConfigParser()
+-        try:
+-            with open(filename, 'r') as f:
+-                config.read_file(f, filename)
+-        except FileNotFoundError:
+-            raise EnvironmentException('File not found: %s.' % filename)
++    def parse_datafile(self, filenames):
++        config = coredata.load_configs(filenames, 'cross')
+         # This is a bit hackish at the moment.
+         for s in config.sections():
+             self.config[s] = {}
+diff --git a/mesonbuild/msetup.py b/mesonbuild/msetup.py
+index 56a0e9a7..f0a1ae19 100644
+--- a/mesonbuild/msetup.py
++++ b/mesonbuild/msetup.py
+@@ -27,7 +27,9 @@ from .mesonlib import MesonException
+ 
+ def add_arguments(parser):
+     coredata.register_builtin_arguments(parser)
+-    parser.add_argument('--cross-file', default=None,
++    parser.add_argument('--cross-file',
++                        default=[],
++                        action='append',
+                         help='File describing cross compilation environment.')
+     parser.add_argument('--native-file',
+                         default=[],
+diff --git a/run_unittests.py b/run_unittests.py
+index e6874b25..1d247291 100755
+--- a/run_unittests.py
++++ b/run_unittests.py
+@@ -529,7 +529,7 @@ class InternalTests(unittest.TestCase):
+         config.write(configfile)
+         configfile.flush()
+         configfile.close()
+-        detected_value = mesonbuild.environment.CrossBuildInfo(configfile.name).need_exe_wrapper()
++        detected_value = mesonbuild.environment.CrossBuildInfo((configfile.name,)).need_exe_wrapper()
+         os.unlink(configfilename)
+ 
+         desired_value = not detected_value
+@@ -541,7 +541,7 @@ class InternalTests(unittest.TestCase):
+         configfilename = configfile.name
+         config.write(configfile)
+         configfile.close()
+-        forced_value = mesonbuild.environment.CrossBuildInfo(configfile.name).need_exe_wrapper()
++        forced_value = mesonbuild.environment.CrossBuildInfo((configfile.name,)).need_exe_wrapper()
+         os.unlink(configfilename)
+ 
+         self.assertEqual(forced_value, desired_value)
-- 
2.11.0


