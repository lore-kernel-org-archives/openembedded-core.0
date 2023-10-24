Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F12C00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 14:40:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.149464.1698158429162630016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 07:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=C5VsYOQH;
 spf=pass (domain: baylibre.com, ip: 209.85.128.48, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40806e4106dso26588425e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698158427; x=1698763227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USMCgTKeXzLAaKbN4c5Kpv5mmnijD+t4SluhNvlO2U4=;
        b=C5VsYOQHZaSHOSAMS7BELSS7GR3GjGydDMluI+b4By5mshkOkiBKPV7rGVBLtUJb8R
         JUx3Cryf9vZZ4E3s0/IAtv8cfeQDmhE1IJa82FA/YH1rixvbNVHE+r67uf7qM2CpSY3b
         fVyYCxFLBzjFXX1+EK91JxgbagkH3y0aVf8iJ2zU+1axW15fPmjdpOJd4xOX6/Ztpcls
         N7RrbrppWBTlPEiXZGetDRxyhtpWG4EJH/yFvE34y4qQ4fgtOLCwGfNgVWm4Z8jeCpmK
         iVoLptljBp2k4xjw4C9W+rzv6C1GqBJ0ez7BMHhF4+FXNwKF9pWBrUzcltn1N+NfVElr
         W/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698158427; x=1698763227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USMCgTKeXzLAaKbN4c5Kpv5mmnijD+t4SluhNvlO2U4=;
        b=r4RPjuIupKgrOfWOM2UYp5Ao7iX4t0u18BCsK00HPivBcid+DI3xiNaY6H1AXBwt6O
         iYThdEG2lgJdvcEoB/rRqlNFyo1PBptjfqc3aUp0MhqgUqDUxrItV7sTClCmbv0pj6d8
         kibgjbGBF239w7sIJnRpczrn9w0LQARLhueUYDFgCEbV+AuAUR5ZIf/Bes4/q6qLmHfQ
         CfKH0gKNz0X3bIADpcZKN5QB2k4/Y2PgyfIr/I9ecZUischHYCHTeUqRyFttqTQgNisn
         RMnX/p8RbfYpOb/nXyXqjsDW+I6t79XgTKqB2X0N60909RDDkN/y7KZSnkmL20VWufnn
         KIFw==
X-Gm-Message-State: AOJu0Yx/8qH7jdPISN4R28Z8onMFJEPCGCQb9KvgJpUrIRV5JXWOGyHE
	QISKxzvq0J2U+cRCODyIdBaKGOY6hDQ23kczPXh1/w==
X-Google-Smtp-Source: AGHT+IGzzgHuTu/4a3MPS5PQSmt4ymDhDLuRLJCWEJJF2BZ5VGRvEar1bVHRDWm2ZYdfwIrHTRU5lg==
X-Received: by 2002:a05:600c:2294:b0:405:29ba:9b5c with SMTP id 20-20020a05600c229400b0040529ba9b5cmr15533321wmf.16.1698158427273;
        Tue, 24 Oct 2023 07:40:27 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id k32-20020a05600c1ca000b00401e32b25adsm12387271wms.4.2023.10.24.07.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 07:40:26 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 2/4] scripts:recipetool:create_buildsys_python: refactor code for futur PEP517 addition
Date: Tue, 24 Oct 2023 16:40:19 +0200
Message-ID: <20231024144022.1532605-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024144022.1532605-1-jstephan@baylibre.com>
References: <20231024144022.1532605-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 14:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189650

In order to prepare the support for pyproject.toml (PEP517 [1]) enabled
projects, refactor the code and move setup.py specific code into a
specific class in order to allow sharing the PythonRecipeHandler class

No functionnal changes expected

[1]: https://peps.python.org/pep-0517/#source-tree

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../lib/recipetool/create_buildsys_python.py  | 748 +++++++++---------
 1 file changed, 385 insertions(+), 363 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 502e1dfbc3d..69f6f5ca511 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -37,63 +37,8 @@ class PythonRecipeHandler(RecipeHandler):
     assume_provided = ['builtins', 'os.path']
     # Assumes that the host python3 builtin_module_names is sane for target too
     assume_provided = assume_provided + list(sys.builtin_module_names)
+    excluded_fields = []
 
-    bbvar_map = {
-        'Name': 'PN',
-        'Version': 'PV',
-        'Home-page': 'HOMEPAGE',
-        'Summary': 'SUMMARY',
-        'Description': 'DESCRIPTION',
-        'License': 'LICENSE',
-        'Requires': 'RDEPENDS:${PN}',
-        'Provides': 'RPROVIDES:${PN}',
-        'Obsoletes': 'RREPLACES:${PN}',
-    }
-    # PN/PV are already set by recipetool core & desc can be extremely long
-    excluded_fields = [
-        'Description',
-    ]
-    setup_parse_map = {
-        'Url': 'Home-page',
-        'Classifiers': 'Classifier',
-        'Description': 'Summary',
-    }
-    setuparg_map = {
-        'Home-page': 'url',
-        'Classifier': 'classifiers',
-        'Summary': 'description',
-        'Description': 'long-description',
-    }
-    # Values which are lists, used by the setup.py argument based metadata
-    # extraction method, to determine how to process the setup.py output.
-    setuparg_list_fields = [
-        'Classifier',
-        'Requires',
-        'Provides',
-        'Obsoletes',
-        'Platform',
-        'Supported-Platform',
-    ]
-    setuparg_multi_line_values = ['Description']
-    replacements = [
-        ('License', r' +$', ''),
-        ('License', r'^ +', ''),
-        ('License', r' ', '-'),
-        ('License', r'^GNU-', ''),
-        ('License', r'-[Ll]icen[cs]e(,?-[Vv]ersion)?', ''),
-        ('License', r'^UNKNOWN$', ''),
-
-        # Remove currently unhandled version numbers from these variables
-        ('Requires', r' *\([^)]*\)', ''),
-        ('Provides', r' *\([^)]*\)', ''),
-        ('Obsoletes', r' *\([^)]*\)', ''),
-        ('Install-requires', r'^([^><= ]+).*', r'\1'),
-        ('Extras-require', r'^([^><= ]+).*', r'\1'),
-        ('Tests-require', r'^([^><= ]+).*', r'\1'),
-
-        # Remove unhandled dependency on particular features (e.g. foo[PDF])
-        ('Install-requires', r'\[[^\]]+\]$', ''),
-    ]
 
     classifier_license_map = {
         'License :: OSI Approved :: Academic Free License (AFL)': 'AFL',
@@ -166,122 +111,34 @@ class PythonRecipeHandler(RecipeHandler):
     def __init__(self):
         pass
 
-    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
-        if 'buildsystem' in handled:
-            return False
-
-        # Check for non-zero size setup.py files
-        setupfiles = RecipeHandler.checkfiles(srctree, ['setup.py'])
-        for fn in setupfiles:
-            if os.path.getsize(fn):
-                break
-        else:
-            return False
-
-        # setup.py is always parsed to get at certain required information, such as
-        # distutils vs setuptools
-        #
-        # If egg info is available, we use it for both its PKG-INFO metadata
-        # and for its requires.txt for install_requires.
-        # If PKG-INFO is available but no egg info is, we use that for metadata in preference to
-        # the parsed setup.py, but use the install_requires info from the
-        # parsed setup.py.
-
-        setupscript = os.path.join(srctree, 'setup.py')
-        try:
-            setup_info, uses_setuptools, setup_non_literals, extensions = self.parse_setup_py(setupscript)
-        except Exception:
-            logger.exception("Failed to parse setup.py")
-            setup_info, uses_setuptools, setup_non_literals, extensions = {}, True, [], []
-
-        egginfo = glob.glob(os.path.join(srctree, '*.egg-info'))
-        if egginfo:
-            info = self.get_pkginfo(os.path.join(egginfo[0], 'PKG-INFO'))
-            requires_txt = os.path.join(egginfo[0], 'requires.txt')
-            if os.path.exists(requires_txt):
-                with codecs.open(requires_txt) as f:
-                    inst_req = []
-                    extras_req = collections.defaultdict(list)
-                    current_feature = None
-                    for line in f.readlines():
-                        line = line.rstrip()
-                        if not line:
-                            continue
-
-                        if line.startswith('['):
-                            # PACKAGECONFIG must not contain expressions or whitespace
-                            line = line.replace(" ", "")
-                            line = line.replace(':', "")
-                            line = line.replace('.', "-dot-")
-                            line = line.replace('"', "")
-                            line = line.replace('<', "-smaller-")
-                            line = line.replace('>', "-bigger-")
-                            line = line.replace('_', "-")
-                            line = line.replace('(', "")
-                            line = line.replace(')', "")
-                            line = line.replace('!', "-not-")
-                            line = line.replace('=', "-equals-")
-                            current_feature = line[1:-1]
-                        elif current_feature:
-                            extras_req[current_feature].append(line)
-                        else:
-                            inst_req.append(line)
-                    info['Install-requires'] = inst_req
-                    info['Extras-require'] = extras_req
-        elif RecipeHandler.checkfiles(srctree, ['PKG-INFO']):
-            info = self.get_pkginfo(os.path.join(srctree, 'PKG-INFO'))
-
-            if setup_info:
-                if 'Install-requires' in setup_info:
-                    info['Install-requires'] = setup_info['Install-requires']
-                if 'Extras-require' in setup_info:
-                    info['Extras-require'] = setup_info['Extras-require']
-        else:
-            if setup_info:
-                info = setup_info
-            else:
-                info = self.get_setup_args_info(setupscript)
-
-        # Grab the license value before applying replacements
-        license_str = info.get('License', '').strip()
-
-        self.apply_info_replacements(info)
-
-        if uses_setuptools:
-            classes.append('setuptools3')
-        else:
-            classes.append('distutils3')
-
-        if license_str:
-            for i, line in enumerate(lines_before):
-                if line.startswith('##LICENSE_PLACEHOLDER##'):
-                    lines_before.insert(i, '# NOTE: License in setup.py/PKGINFO is: %s' % license_str)
-                    break
-
-        if 'Classifier' in info:
-            existing_licenses = info.get('License', '')
-            licenses = []
-            for classifier in info['Classifier']:
-                if classifier in self.classifier_license_map:
-                    license = self.classifier_license_map[classifier]
-                    if license == 'Apache' and 'Apache-2.0' in existing_licenses:
-                        license = 'Apache-2.0'
-                    elif license == 'GPL':
-                        if 'GPL-2.0' in existing_licenses or 'GPLv2' in existing_licenses:
-                            license = 'GPL-2.0'
-                        elif 'GPL-3.0' in existing_licenses or 'GPLv3' in existing_licenses:
-                            license = 'GPL-3.0'
-                    elif license == 'LGPL':
-                        if 'LGPL-2.1' in existing_licenses or 'LGPLv2.1' in existing_licenses:
-                            license = 'LGPL-2.1'
-                        elif 'LGPL-2.0' in existing_licenses or 'LGPLv2' in existing_licenses:
-                            license = 'LGPL-2.0'
-                        elif 'LGPL-3.0' in existing_licenses or 'LGPLv3' in existing_licenses:
-                            license = 'LGPL-3.0'
-                    licenses.append(license)
-
-            if licenses:
-                info['License'] = ' & '.join(licenses)
+    def handle_classifier_license(self, classifiers, existing_licenses=""):
+
+        licenses = []
+        for classifier in classifiers:
+            if classifier in self.classifier_license_map:
+                license = self.classifier_license_map[classifier]
+                if license == 'Apache' and 'Apache-2.0' in existing_licenses:
+                    license = 'Apache-2.0'
+                elif license == 'GPL':
+                    if 'GPL-2.0' in existing_licenses or 'GPLv2' in existing_licenses:
+                        license = 'GPL-2.0'
+                    elif 'GPL-3.0' in existing_licenses or 'GPLv3' in existing_licenses:
+                        license = 'GPL-3.0'
+                elif license == 'LGPL':
+                    if 'LGPL-2.1' in existing_licenses or 'LGPLv2.1' in existing_licenses:
+                        license = 'LGPL-2.1'
+                    elif 'LGPL-2.0' in existing_licenses or 'LGPLv2' in existing_licenses:
+                        license = 'LGPL-2.0'
+                    elif 'LGPL-3.0' in existing_licenses or 'LGPLv3' in existing_licenses:
+                        license = 'LGPL-3.0'
+                licenses.append(license)
+
+        if licenses:
+            return ' & '.join(licenses)
+
+        return None
+
+    def map_info_to_bbvar(self, info, extravalues):
 
         # Map PKG-INFO & setup.py fields to bitbake variables
         for field, values in info.items():
@@ -305,85 +162,220 @@ class PythonRecipeHandler(RecipeHandler):
             if bbvar not in extravalues and value:
                 extravalues[bbvar] = value
 
-        mapped_deps, unmapped_deps = self.scan_setup_python_deps(srctree, setup_info, setup_non_literals)
-
-        extras_req = set()
-        if 'Extras-require' in info:
-            extras_req = info['Extras-require']
-            if extras_req:
-                lines_after.append('# The following configs & dependencies are from setuptools extras_require.')
-                lines_after.append('# These dependencies are optional, hence can be controlled via PACKAGECONFIG.')
-                lines_after.append('# The upstream names may not correspond exactly to bitbake package names.')
-                lines_after.append('# The configs are might not correct, since PACKAGECONFIG does not support expressions as may used in requires.txt - they are just replaced by text.')
-                lines_after.append('#')
-                lines_after.append('# Uncomment this line to enable all the optional features.')
-                lines_after.append('#PACKAGECONFIG ?= "{}"'.format(' '.join(k.lower() for k in extras_req)))
-                for feature, feature_reqs in extras_req.items():
-                    unmapped_deps.difference_update(feature_reqs)
-
-                    feature_req_deps = ('python3-' + r.replace('.', '-').lower() for r in sorted(feature_reqs))
-                    lines_after.append('PACKAGECONFIG[{}] = ",,,{}"'.format(feature.lower(), ' '.join(feature_req_deps)))
-
-        inst_reqs = set()
-        if 'Install-requires' in info:
-            if extras_req:
-                lines_after.append('')
-            inst_reqs = info['Install-requires']
-            if inst_reqs:
-                unmapped_deps.difference_update(inst_reqs)
-
-                inst_req_deps = ('python3-' + r.replace('.', '-').lower() for r in sorted(inst_reqs))
-                lines_after.append('# WARNING: the following rdepends are from setuptools install_requires. These')
-                lines_after.append('# upstream names may not correspond exactly to bitbake package names.')
-                lines_after.append('RDEPENDS:${{PN}} += "{}"'.format(' '.join(inst_req_deps)))
+    def apply_info_replacements(self, info):
+        if not self.replacements:
+            return
 
-        if mapped_deps:
-            name = info.get('Name')
-            if name and name[0] in mapped_deps:
-                # Attempt to avoid self-reference
-                mapped_deps.remove(name[0])
-            mapped_deps -= set(self.excluded_pkgdeps)
-            if inst_reqs or extras_req:
-                lines_after.append('')
-            lines_after.append('# WARNING: the following rdepends are determined through basic analysis of the')
-            lines_after.append('# python sources, and might not be 100% accurate.')
-            lines_after.append('RDEPENDS:${{PN}} += "{}"'.format(' '.join(sorted(mapped_deps))))
+        for variable, search, replace in self.replacements:
+            if variable not in info:
+                continue
 
-        unmapped_deps -= set(extensions)
-        unmapped_deps -= set(self.assume_provided)
-        if unmapped_deps:
-            if mapped_deps:
-                lines_after.append('')
-            lines_after.append('# WARNING: We were unable to map the following python package/module')
-            lines_after.append('# dependencies to the bitbake packages which include them:')
-            lines_after.extend('#    {}'.format(d) for d in sorted(unmapped_deps))
+            def replace_value(search, replace, value):
+                if replace is None:
+                    if re.search(search, value):
+                        return None
+                else:
+                    new_value = re.sub(search, replace, value)
+                    if value != new_value:
+                        return new_value
+                return value
 
-        handled.append('buildsystem')
+            value = info[variable]
+            if isinstance(value, str):
+                new_value = replace_value(search, replace, value)
+                if new_value is None:
+                    del info[variable]
+                elif new_value != value:
+                    info[variable] = new_value
+            elif hasattr(value, 'items'):
+                for dkey, dvalue in list(value.items()):
+                    new_list = []
+                    for pos, a_value in enumerate(dvalue):
+                        new_value = replace_value(search, replace, a_value)
+                        if new_value is not None and new_value != value:
+                            new_list.append(new_value)
 
-    def get_pkginfo(self, pkginfo_fn):
-        msg = email.message_from_file(open(pkginfo_fn, 'r'))
-        msginfo = {}
-        for field in msg.keys():
-            values = msg.get_all(field)
-            if len(values) == 1:
-                msginfo[field] = values[0]
+                    if value != new_list:
+                        value[dkey] = new_list
             else:
-                msginfo[field] = values
-        return msginfo
+                new_list = []
+                for pos, a_value in enumerate(value):
+                    new_value = replace_value(search, replace, a_value)
+                    if new_value is not None and new_value != value:
+                        new_list.append(new_value)
 
-    def parse_setup_py(self, setupscript='./setup.py'):
-        with codecs.open(setupscript) as f:
-            info, imported_modules, non_literals, extensions = gather_setup_info(f)
+                if value != new_list:
+                    info[variable] = new_list
 
-        def _map(key):
-            key = key.replace('_', '-')
-            key = key[0].upper() + key[1:]
-            if key in self.setup_parse_map:
-                key = self.setup_parse_map[key]
-            return key
 
-        # Naive mapping of setup() arguments to PKG-INFO field names
-        for d in [info, non_literals]:
+    def scan_python_dependencies(self, paths):
+        deps = set()
+        try:
+            dep_output = self.run_command(['pythondeps', '-d'] + paths)
+        except (OSError, subprocess.CalledProcessError):
+            pass
+        else:
+            for line in dep_output.splitlines():
+                line = line.rstrip()
+                dep, filename = line.split('\t', 1)
+                if filename.endswith('/setup.py'):
+                    continue
+                deps.add(dep)
+
+        try:
+            provides_output = self.run_command(['pythondeps', '-p'] + paths)
+        except (OSError, subprocess.CalledProcessError):
+            pass
+        else:
+            provides_lines = (l.rstrip() for l in provides_output.splitlines())
+            provides = set(l for l in provides_lines if l and l != 'setup')
+            deps -= provides
+
+        return deps
+
+    def parse_pkgdata_for_python_packages(self):
+        pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
+
+        ldata = tinfoil.config_data.createCopy()
+        bb.parse.handle('classes-recipe/python3-dir.bbclass', ldata, True)
+        python_sitedir = ldata.getVar('PYTHON_SITEPACKAGES_DIR')
+
+        dynload_dir = os.path.join(os.path.dirname(python_sitedir), 'lib-dynload')
+        python_dirs = [python_sitedir + os.sep,
+                       os.path.join(os.path.dirname(python_sitedir), 'dist-packages') + os.sep,
+                       os.path.dirname(python_sitedir) + os.sep]
+        packages = {}
+        for pkgdatafile in glob.glob('{}/runtime/*'.format(pkgdata_dir)):
+            files_info = None
+            with open(pkgdatafile, 'r') as f:
+                for line in f.readlines():
+                    field, value = line.split(': ', 1)
+                    if field.startswith('FILES_INFO'):
+                        files_info = ast.literal_eval(value)
+                        break
+                else:
+                    continue
+
+            for fn in files_info:
+                for suffix in importlib.machinery.all_suffixes():
+                    if fn.endswith(suffix):
+                        break
+                else:
+                    continue
+
+                if fn.startswith(dynload_dir + os.sep):
+                    if '/.debug/' in fn:
+                        continue
+                    base = os.path.basename(fn)
+                    provided = base.split('.', 1)[0]
+                    packages[provided] = os.path.basename(pkgdatafile)
+                    continue
+
+                for python_dir in python_dirs:
+                    if fn.startswith(python_dir):
+                        relpath = fn[len(python_dir):]
+                        relstart, _, relremaining = relpath.partition(os.sep)
+                        if relstart.endswith('.egg'):
+                            relpath = relremaining
+                        base, _ = os.path.splitext(relpath)
+
+                        if '/.debug/' in base:
+                            continue
+                        if os.path.basename(base) == '__init__':
+                            base = os.path.dirname(base)
+                        base = base.replace(os.sep + os.sep, os.sep)
+                        provided = base.replace(os.sep, '.')
+                        packages[provided] = os.path.basename(pkgdatafile)
+        return packages
+
+    @classmethod
+    def run_command(cls, cmd, **popenargs):
+        if 'stderr' not in popenargs:
+            popenargs['stderr'] = subprocess.STDOUT
+        try:
+            return subprocess.check_output(cmd, **popenargs).decode('utf-8')
+        except OSError as exc:
+            logger.error('Unable to run `{}`: {}', ' '.join(cmd), exc)
+            raise
+        except subprocess.CalledProcessError as exc:
+            logger.error('Unable to run `{}`: {}', ' '.join(cmd), exc.output)
+            raise
+
+class PythonSetupPyRecipeHandler(PythonRecipeHandler):
+    bbvar_map = {
+        'Name': 'PN',
+        'Version': 'PV',
+        'Home-page': 'HOMEPAGE',
+        'Summary': 'SUMMARY',
+        'Description': 'DESCRIPTION',
+        'License': 'LICENSE',
+        'Requires': 'RDEPENDS:${PN}',
+        'Provides': 'RPROVIDES:${PN}',
+        'Obsoletes': 'RREPLACES:${PN}',
+    }
+    # PN/PV are already set by recipetool core & desc can be extremely long
+    excluded_fields = [
+        'Description',
+    ]
+    setup_parse_map = {
+        'Url': 'Home-page',
+        'Classifiers': 'Classifier',
+        'Description': 'Summary',
+    }
+    setuparg_map = {
+        'Home-page': 'url',
+        'Classifier': 'classifiers',
+        'Summary': 'description',
+        'Description': 'long-description',
+    }
+    # Values which are lists, used by the setup.py argument based metadata
+    # extraction method, to determine how to process the setup.py output.
+    setuparg_list_fields = [
+        'Classifier',
+        'Requires',
+        'Provides',
+        'Obsoletes',
+        'Platform',
+        'Supported-Platform',
+    ]
+    setuparg_multi_line_values = ['Description']
+
+    replacements = [
+        ('License', r' +$', ''),
+        ('License', r'^ +', ''),
+        ('License', r' ', '-'),
+        ('License', r'^GNU-', ''),
+        ('License', r'-[Ll]icen[cs]e(,?-[Vv]ersion)?', ''),
+        ('License', r'^UNKNOWN$', ''),
+
+        # Remove currently unhandled version numbers from these variables
+        ('Requires', r' *\([^)]*\)', ''),
+        ('Provides', r' *\([^)]*\)', ''),
+        ('Obsoletes', r' *\([^)]*\)', ''),
+        ('Install-requires', r'^([^><= ]+).*', r'\1'),
+        ('Extras-require', r'^([^><= ]+).*', r'\1'),
+        ('Tests-require', r'^([^><= ]+).*', r'\1'),
+
+        # Remove unhandled dependency on particular features (e.g. foo[PDF])
+        ('Install-requires', r'\[[^\]]+\]$', ''),
+    ]
+
+    def __init__(self):
+        pass
+
+    def parse_setup_py(self, setupscript='./setup.py'):
+        with codecs.open(setupscript) as f:
+            info, imported_modules, non_literals, extensions = gather_setup_info(f)
+
+        def _map(key):
+            key = key.replace('_', '-')
+            key = key[0].upper() + key[1:]
+            if key in self.setup_parse_map:
+                key = self.setup_parse_map[key]
+            return key
+
+        # Naive mapping of setup() arguments to PKG-INFO field names
+        for d in [info, non_literals]:
             for key, value in list(d.items()):
                 if key is None:
                     continue
@@ -445,47 +437,16 @@ class PythonRecipeHandler(RecipeHandler):
                 info[fields[lineno]] = line
         return info
 
-    def apply_info_replacements(self, info):
-        for variable, search, replace in self.replacements:
-            if variable not in info:
-                continue
-
-            def replace_value(search, replace, value):
-                if replace is None:
-                    if re.search(search, value):
-                        return None
-                else:
-                    new_value = re.sub(search, replace, value)
-                    if value != new_value:
-                        return new_value
-                return value
-
-            value = info[variable]
-            if isinstance(value, str):
-                new_value = replace_value(search, replace, value)
-                if new_value is None:
-                    del info[variable]
-                elif new_value != value:
-                    info[variable] = new_value
-            elif hasattr(value, 'items'):
-                for dkey, dvalue in list(value.items()):
-                    new_list = []
-                    for pos, a_value in enumerate(dvalue):
-                        new_value = replace_value(search, replace, a_value)
-                        if new_value is not None and new_value != value:
-                            new_list.append(new_value)
-
-                    if value != new_list:
-                        value[dkey] = new_list
+    def get_pkginfo(self, pkginfo_fn):
+        msg = email.message_from_file(open(pkginfo_fn, 'r'))
+        msginfo = {}
+        for field in msg.keys():
+            values = msg.get_all(field)
+            if len(values) == 1:
+                msginfo[field] = values[0]
             else:
-                new_list = []
-                for pos, a_value in enumerate(value):
-                    new_value = replace_value(search, replace, a_value)
-                    if new_value is not None and new_value != value:
-                        new_list.append(new_value)
-
-                if value != new_list:
-                    info[variable] = new_list
+                msginfo[field] = values
+        return msginfo
 
     def scan_setup_python_deps(self, srctree, setup_info, setup_non_literals):
         if 'Package-dir' in setup_info:
@@ -540,99 +501,160 @@ class PythonRecipeHandler(RecipeHandler):
                 unmapped_deps.add(dep)
         return mapped_deps, unmapped_deps
 
-    def scan_python_dependencies(self, paths):
-        deps = set()
-        try:
-            dep_output = self.run_command(['pythondeps', '-d'] + paths)
-        except (OSError, subprocess.CalledProcessError):
-            pass
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
+
+        if 'buildsystem' in handled:
+            return False
+
+        # Check for non-zero size setup.py files
+        setupfiles = RecipeHandler.checkfiles(srctree, ['setup.py'])
+        for fn in setupfiles:
+            if os.path.getsize(fn):
+                break
         else:
-            for line in dep_output.splitlines():
-                line = line.rstrip()
-                dep, filename = line.split('\t', 1)
-                if filename.endswith('/setup.py'):
-                    continue
-                deps.add(dep)
+            return False
+
+        # setup.py is always parsed to get at certain required information, such as
+        # distutils vs setuptools
+        #
+        # If egg info is available, we use it for both its PKG-INFO metadata
+        # and for its requires.txt for install_requires.
+        # If PKG-INFO is available but no egg info is, we use that for metadata in preference to
+        # the parsed setup.py, but use the install_requires info from the
+        # parsed setup.py.
 
+        setupscript = os.path.join(srctree, 'setup.py')
         try:
-            provides_output = self.run_command(['pythondeps', '-p'] + paths)
-        except (OSError, subprocess.CalledProcessError):
-            pass
+            setup_info, uses_setuptools, setup_non_literals, extensions = self.parse_setup_py(setupscript)
+        except Exception:
+            logger.exception("Failed to parse setup.py")
+            setup_info, uses_setuptools, setup_non_literals, extensions = {}, True, [], []
+
+        egginfo = glob.glob(os.path.join(srctree, '*.egg-info'))
+        if egginfo:
+            info = self.get_pkginfo(os.path.join(egginfo[0], 'PKG-INFO'))
+            requires_txt = os.path.join(egginfo[0], 'requires.txt')
+            if os.path.exists(requires_txt):
+                with codecs.open(requires_txt) as f:
+                    inst_req = []
+                    extras_req = collections.defaultdict(list)
+                    current_feature = None
+                    for line in f.readlines():
+                        line = line.rstrip()
+                        if not line:
+                            continue
+
+                        if line.startswith('['):
+                            # PACKAGECONFIG must not contain expressions or whitespace
+                            line = line.replace(" ", "")
+                            line = line.replace(':', "")
+                            line = line.replace('.', "-dot-")
+                            line = line.replace('"', "")
+                            line = line.replace('<', "-smaller-")
+                            line = line.replace('>', "-bigger-")
+                            line = line.replace('_', "-")
+                            line = line.replace('(', "")
+                            line = line.replace(')', "")
+                            line = line.replace('!', "-not-")
+                            line = line.replace('=', "-equals-")
+                            current_feature = line[1:-1]
+                        elif current_feature:
+                            extras_req[current_feature].append(line)
+                        else:
+                            inst_req.append(line)
+                    info['Install-requires'] = inst_req
+                    info['Extras-require'] = extras_req
+        elif RecipeHandler.checkfiles(srctree, ['PKG-INFO']):
+            info = self.get_pkginfo(os.path.join(srctree, 'PKG-INFO'))
+
+            if setup_info:
+                if 'Install-requires' in setup_info:
+                    info['Install-requires'] = setup_info['Install-requires']
+                if 'Extras-require' in setup_info:
+                    info['Extras-require'] = setup_info['Extras-require']
         else:
-            provides_lines = (l.rstrip() for l in provides_output.splitlines())
-            provides = set(l for l in provides_lines if l and l != 'setup')
-            deps -= provides
+            if setup_info:
+                info = setup_info
+            else:
+                info = self.get_setup_args_info(setupscript)
 
-        return deps
+        # Grab the license value before applying replacements
+        license_str = info.get('License', '').strip()
 
-    def parse_pkgdata_for_python_packages(self):
-        pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
+        self.apply_info_replacements(info)
 
-        ldata = tinfoil.config_data.createCopy()
-        bb.parse.handle('classes-recipe/python3-dir.bbclass', ldata, True)
-        python_sitedir = ldata.getVar('PYTHON_SITEPACKAGES_DIR')
+        if uses_setuptools:
+            classes.append('setuptools3')
+        else:
+            classes.append('distutils3')
 
-        dynload_dir = os.path.join(os.path.dirname(python_sitedir), 'lib-dynload')
-        python_dirs = [python_sitedir + os.sep,
-                       os.path.join(os.path.dirname(python_sitedir), 'dist-packages') + os.sep,
-                       os.path.dirname(python_sitedir) + os.sep]
-        packages = {}
-        for pkgdatafile in glob.glob('{}/runtime/*'.format(pkgdata_dir)):
-            files_info = None
-            with open(pkgdatafile, 'r') as f:
-                for line in f.readlines():
-                    field, value = line.split(': ', 1)
-                    if field.startswith('FILES_INFO'):
-                        files_info = ast.literal_eval(value)
-                        break
-                else:
-                    continue
+        if license_str:
+            for i, line in enumerate(lines_before):
+                if line.startswith('##LICENSE_PLACEHOLDER##'):
+                    lines_before.insert(i, '# NOTE: License in setup.py/PKGINFO is: %s' % license_str)
+                    break
 
-            for fn in files_info:
-                for suffix in importlib.machinery.all_suffixes():
-                    if fn.endswith(suffix):
-                        break
-                else:
-                    continue
+        if 'Classifier' in info:
+            license = self.handle_classifier_license(info['Classifier'], info.get('License', ''))
+            if license:
+                info['License'] = license
 
-                if fn.startswith(dynload_dir + os.sep):
-                    if '/.debug/' in fn:
-                        continue
-                    base = os.path.basename(fn)
-                    provided = base.split('.', 1)[0]
-                    packages[provided] = os.path.basename(pkgdatafile)
-                    continue
+        self.map_info_to_bbvar(info, extravalues)
 
-                for python_dir in python_dirs:
-                    if fn.startswith(python_dir):
-                        relpath = fn[len(python_dir):]
-                        relstart, _, relremaining = relpath.partition(os.sep)
-                        if relstart.endswith('.egg'):
-                            relpath = relremaining
-                        base, _ = os.path.splitext(relpath)
+        mapped_deps, unmapped_deps = self.scan_setup_python_deps(srctree, setup_info, setup_non_literals)
 
-                        if '/.debug/' in base:
-                            continue
-                        if os.path.basename(base) == '__init__':
-                            base = os.path.dirname(base)
-                        base = base.replace(os.sep + os.sep, os.sep)
-                        provided = base.replace(os.sep, '.')
-                        packages[provided] = os.path.basename(pkgdatafile)
-        return packages
+        extras_req = set()
+        if 'Extras-require' in info:
+            extras_req = info['Extras-require']
+            if extras_req:
+                lines_after.append('# The following configs & dependencies are from setuptools extras_require.')
+                lines_after.append('# These dependencies are optional, hence can be controlled via PACKAGECONFIG.')
+                lines_after.append('# The upstream names may not correspond exactly to bitbake package names.')
+                lines_after.append('# The configs are might not correct, since PACKAGECONFIG does not support expressions as may used in requires.txt - they are just replaced by text.')
+                lines_after.append('#')
+                lines_after.append('# Uncomment this line to enable all the optional features.')
+                lines_after.append('#PACKAGECONFIG ?= "{}"'.format(' '.join(k.lower() for k in extras_req)))
+                for feature, feature_reqs in extras_req.items():
+                    unmapped_deps.difference_update(feature_reqs)
 
-    @classmethod
-    def run_command(cls, cmd, **popenargs):
-        if 'stderr' not in popenargs:
-            popenargs['stderr'] = subprocess.STDOUT
-        try:
-            return subprocess.check_output(cmd, **popenargs).decode('utf-8')
-        except OSError as exc:
-            logger.error('Unable to run `{}`: {}', ' '.join(cmd), exc)
-            raise
-        except subprocess.CalledProcessError as exc:
-            logger.error('Unable to run `{}`: {}', ' '.join(cmd), exc.output)
-            raise
+                    feature_req_deps = ('python3-' + r.replace('.', '-').lower() for r in sorted(feature_reqs))
+                    lines_after.append('PACKAGECONFIG[{}] = ",,,{}"'.format(feature.lower(), ' '.join(feature_req_deps)))
 
+        inst_reqs = set()
+        if 'Install-requires' in info:
+            if extras_req:
+                lines_after.append('')
+            inst_reqs = info['Install-requires']
+            if inst_reqs:
+                unmapped_deps.difference_update(inst_reqs)
+
+                inst_req_deps = ('python3-' + r.replace('.', '-').lower() for r in sorted(inst_reqs))
+                lines_after.append('# WARNING: the following rdepends are from setuptools install_requires. These')
+                lines_after.append('# upstream names may not correspond exactly to bitbake package names.')
+                lines_after.append('RDEPENDS:${{PN}} += "{}"'.format(' '.join(inst_req_deps)))
+
+        if mapped_deps:
+            name = info.get('Name')
+            if name and name[0] in mapped_deps:
+                # Attempt to avoid self-reference
+                mapped_deps.remove(name[0])
+            mapped_deps -= set(self.excluded_pkgdeps)
+            if inst_reqs or extras_req:
+                lines_after.append('')
+            lines_after.append('# WARNING: the following rdepends are determined through basic analysis of the')
+            lines_after.append('# python sources, and might not be 100% accurate.')
+            lines_after.append('RDEPENDS:${{PN}} += "{}"'.format(' '.join(sorted(mapped_deps))))
+
+        unmapped_deps -= set(extensions)
+        unmapped_deps -= set(self.assume_provided)
+        if unmapped_deps:
+            if mapped_deps:
+                lines_after.append('')
+            lines_after.append('# WARNING: We were unable to map the following python package/module')
+            lines_after.append('# dependencies to the bitbake packages which include them:')
+            lines_after.extend('#    {}'.format(d) for d in sorted(unmapped_deps))
+
+        handled.append('buildsystem')
 
 def gather_setup_info(fileobj):
     parsed = ast.parse(fileobj.read(), fileobj.name)
@@ -748,4 +770,4 @@ def has_non_literals(value):
 
 def register_recipe_handlers(handlers):
     # We need to make sure this is ahead of the makefile fallback handler
-    handlers.append((PythonRecipeHandler(), 70))
+    handlers.append((PythonSetupPyRecipeHandler(), 70))
-- 
2.42.0


