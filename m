Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B7CC54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:38:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3046.1748551117921997177
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 562E22574
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:28:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 575093F673
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:28:17 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] lib/oe/license_finder: extract license-finding code from recipetool
Date: Thu, 29 May 2025 21:28:01 +0100
Message-ID: <20250529202802.1198179-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529202802.1198179-1-ross.burton@arm.com>
References: <20250529202802.1198179-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217447

Move the find-and-detect-licenses code from recipetool into lib/oe, so
that it can be used outside of recipetool.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../files/license-hashes.csv                  |   2 +
 meta/lib/oe/license_finder.py                 | 226 ++++++++++++++++++
 scripts/lib/recipetool/create.py              | 226 +-----------------
 3 files changed, 230 insertions(+), 224 deletions(-)
 rename scripts/lib/recipetool/licenses.csv =3D> meta/files/license-hashe=
s.csv (95%)
 create mode 100644 meta/lib/oe/license_finder.py

diff --git a/scripts/lib/recipetool/licenses.csv b/meta/files/license-has=
hes.csv
similarity index 95%
rename from scripts/lib/recipetool/licenses.csv
rename to meta/files/license-hashes.csv
index 16397e85546..5729a7314bb 100644
--- a/scripts/lib/recipetool/licenses.csv
+++ b/meta/files/license-hashes.csv
@@ -1,5 +1,6 @@
 02d4002e9171d41a8fad93aa7faf3956,BSD-3-Clause
 0636e73ff0215e8d672dc4c32c317bb3,GPL-2.0-only
+0ceb9ff3b27d3a8cf451ca3785d73c71,BSD-3-Clause & MIT
 0dd48ae8103725bd7b401261520cdfbb,BSD-3-Clause
 12f884d2ae1ff87c09e5b7ccc2c4ca7e,GPL-2.0-only
 18810669f13b87348459e611d31ab760,GPL-2.0-only
@@ -22,6 +23,7 @@
 5f30f0716dfdd0d91eb439ebec522ec2,LGPL-2.0-only
 6a6a8e020838b23406c81b19c1d46df6,LGPL-3.0-only
 751419260aa954499f7abaabaa882bbe,GPL-2.0-only
+7998cb338f82d15c0eff93b7004d272a,BSD-3-Clause
 7fbc338309ac38fefcd64b04bb903e34,LGPL-2.1-only
 8ca43cbc842c2336e835926c2166c28b,GPL-2.0-only
 939cce1ec101726fa754e698ac871622,BSD-3-Clause
diff --git a/meta/lib/oe/license_finder.py b/meta/lib/oe/license_finder.p=
y
new file mode 100644
index 00000000000..189a39cb68a
--- /dev/null
+++ b/meta/lib/oe/license_finder.py
@@ -0,0 +1,226 @@
+import fnmatch
+import hashlib
+import os
+import re
+
+def get_license_md5sums(d, static_only=3DFalse, linenumbers=3DFalse):
+    import bb.utils
+    import csv
+    md5sums =3D {}
+    if not static_only and not linenumbers:
+        # Gather md5sums of license files in common license dir
+        commonlicdir =3D d.getVar('COMMON_LICENSE_DIR')
+        for fn in os.listdir(commonlicdir):
+            md5value =3D bb.utils.md5_file(os.path.join(commonlicdir, fn=
))
+            md5sums[md5value] =3D fn
+
+    # The following were extracted from common values in various recipes
+    # (double checking the license against the license file itself, not =
just
+    # the LICENSE value in the recipe)
+
+    # Read license md5sums from csv file
+    for path in d.getVar('BBPATH').split(':'):
+        csv_path =3D os.path.join(path, 'files', 'license-hashes.csv')
+        if os.path.isfile(csv_path):
+            with open(csv_path, newline=3D'') as csv_file:
+                fieldnames =3D ['md5sum', 'license', 'beginline', 'endli=
ne', 'md5']
+                reader =3D csv.DictReader(csv_file, delimiter=3D',', fie=
ldnames=3Dfieldnames)
+                for row in reader:
+                    if linenumbers:
+                        md5sums[row['md5sum']] =3D (
+                            row['license'], row['beginline'], row['endli=
ne'], row['md5'])
+                    else:
+                        md5sums[row['md5sum']] =3D row['license']
+
+    return md5sums
+
+def crunch_known_licenses(d):
+    '''
+    Calculate the MD5 checksums for the crunched versions of all common
+    licenses. Also add additional known checksums.
+    '''
+   =20
+    crunched_md5sums =3D {}
+
+    # common licenses
+    crunched_md5sums['ad4e9d34a2e966dfe9837f18de03266d'] =3D 'GFDL-1.1-o=
nly'
+    crunched_md5sums['d014fb11a34eb67dc717fdcfc97e60ed'] =3D 'GFDL-1.2-o=
nly'
+    crunched_md5sums['e020ca655b06c112def28e597ab844f1'] =3D 'GFDL-1.3-o=
nly'
+
+    # The following two were gleaned from the "forever" npm package
+    crunched_md5sums['0a97f8e4cbaf889d6fa51f84b89a79f6'] =3D 'ISC'
+    # https://github.com/waffle-gl/waffle/blob/master/LICENSE.txt
+    crunched_md5sums['50fab24ce589d69af8964fdbfe414c60'] =3D 'BSD-2-Clau=
se'
+    # https://github.com/spigwitmer/fakeds1963s/blob/master/LICENSE
+    crunched_md5sums['88a4355858a1433fea99fae34a44da88'] =3D 'GPL-2.0-on=
ly'
+    # http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
+    crunched_md5sums['063b5c3ebb5f3aa4c85a2ed18a31fbe7'] =3D 'GPL-2.0-on=
ly'
+    # https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv2.1
+    crunched_md5sums['7f5202f4d44ed15dcd4915f5210417d8'] =3D 'LGPL-2.1-o=
nly'
+    # unixODBC-2.3.4 COPYING
+    crunched_md5sums['3debde09238a8c8e1f6a847e1ec9055b'] =3D 'LGPL-2.1-o=
nly'
+    # https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv3
+    crunched_md5sums['f90c613c51aa35da4d79dd55fc724ceb'] =3D 'LGPL-3.0-o=
nly'
+    # https://raw.githubusercontent.com/eclipse/mosquitto/v1.4.14/epl-v1=
0
+    crunched_md5sums['efe2cb9a35826992b9df68224e3c2628'] =3D 'EPL-1.0'
+
+    # https://raw.githubusercontent.com/jquery/esprima/3.1.3/LICENSE.BSD
+    crunched_md5sums['80fa7b56a28e8c902e6af194003220a5'] =3D 'BSD-2-Clau=
se'
+    # https://raw.githubusercontent.com/npm/npm-install-checks/master/LI=
CENSE
+    crunched_md5sums['e659f77bfd9002659e112d0d3d59b2c1'] =3D 'BSD-2-Clau=
se'
+    # https://raw.githubusercontent.com/silverwind/default-gateway/4.2.0=
/LICENSE
+    crunched_md5sums['4c641f2d995c47f5cb08bdb4b5b6ea05'] =3D 'BSD-2-Clau=
se'
+    # https://raw.githubusercontent.com/tad-lispy/node-damerau-levenshte=
in/v1.0.5/LICENSE
+    crunched_md5sums['2b8c039b2b9a25f0feb4410c4542d346'] =3D 'BSD-2-Clau=
se'
+    # https://raw.githubusercontent.com/terser/terser/v3.17.0/LICENSE
+    crunched_md5sums['8bd23871802951c9ad63855151204c2c'] =3D 'BSD-2-Clau=
se'
+    # https://raw.githubusercontent.com/alexei/sprintf.js/1.0.3/LICENSE
+    crunched_md5sums['008c22318c8ea65928bf730ddd0273e3'] =3D 'BSD-3-Clau=
se'
+    # https://raw.githubusercontent.com/Caligatio/jsSHA/v3.2.0/LICENSE
+    crunched_md5sums['0e46634a01bfef056892949acaea85b1'] =3D 'BSD-3-Clau=
se'
+    # https://raw.githubusercontent.com/d3/d3-path/v1.0.9/LICENSE
+    crunched_md5sums['b5f72aef53d3b2b432702c30b0215666'] =3D 'BSD-3-Clau=
se'
+    # https://raw.githubusercontent.com/feross/ieee754/v1.1.13/LICENSE
+    crunched_md5sums['a39327c997c20da0937955192d86232d'] =3D 'BSD-3-Clau=
se'
+    # https://raw.githubusercontent.com/joyent/node-extsprintf/v1.3.0/LI=
CENSE
+    crunched_md5sums['721f23a96ff4161ca3a5f071bbe18108'] =3D 'MIT'
+    # https://raw.githubusercontent.com/pvorb/clone/v0.2.0/LICENSE
+    crunched_md5sums['b376d29a53c9573006b9970709231431'] =3D 'MIT'
+    # https://raw.githubusercontent.com/andris9/encoding/v0.1.12/LICENSE
+    crunched_md5sums['85d8a977ee9d7c5ab4ac03c9b95431c4'] =3D 'MIT-0'
+    # https://raw.githubusercontent.com/faye/websocket-driver-node/0.7.3=
/LICENSE.md
+    crunched_md5sums['b66384e7137e41a9b1904ef4d39703b6'] =3D 'Apache-2.0=
'
+    # https://raw.githubusercontent.com/less/less.js/v4.1.1/LICENSE
+    crunched_md5sums['b27575459e02221ccef97ec0bfd457ae'] =3D 'Apache-2.0=
'
+    # https://raw.githubusercontent.com/microsoft/TypeScript/v3.5.3/LICE=
NSE.txt
+    crunched_md5sums['a54a1a6a39e7f9dbb4a23a42f5c7fd1c'] =3D 'Apache-2.0=
'
+    # https://raw.githubusercontent.com/request/request/v2.87.0/LICENSE
+    crunched_md5sums['1034431802e57486b393d00c5d262b8a'] =3D 'Apache-2.0=
'
+    # https://raw.githubusercontent.com/dchest/tweetnacl-js/v0.14.5/LICE=
NSE
+    crunched_md5sums['75605e6bdd564791ab698fca65c94a4f'] =3D 'Unlicense'
+    # https://raw.githubusercontent.com/stackgl/gl-mat3/v2.0.0/LICENSE.m=
d
+    crunched_md5sums['75512892d6f59dddb6d1c7e191957e9c'] =3D 'Zlib'
+
+    commonlicdir =3D d.getVar('COMMON_LICENSE_DIR')
+    for fn in sorted(os.listdir(commonlicdir)):
+        md5value, lictext =3D crunch_license(os.path.join(commonlicdir, =
fn))
+        if md5value not in crunched_md5sums:
+            crunched_md5sums[md5value] =3D fn
+        elif fn !=3D crunched_md5sums[md5value]:
+            bb.debug(2, "crunched_md5sums['%s'] is already set to '%s' r=
ather than '%s'" % (md5value, crunched_md5sums[md5value], fn))
+        else:
+            bb.debug(2, "crunched_md5sums['%s'] is already set to '%s'" =
% (md5value, crunched_md5sums[md5value]))
+
+    return crunched_md5sums
+
+def crunch_license(licfile):
+    '''
+    Remove non-material text from a license file and then calculate its
+    md5sum. This works well for licenses that contain a copyright statem=
ent,
+    but is also a useful way to handle people's insistence upon reformat=
ting
+    the license text slightly (with no material difference to the text o=
f the
+    license).
+    '''
+
+    import oe.utils
+
+    # Note: these are carefully constructed!
+    license_title_re =3D re.compile(r'^#*\(? *(This is )?([Tt]he )?.{0,1=
5} ?[Ll]icen[sc]e( \(.{1,10}\))?\)?[:\.]? ?#*$')
+    license_statement_re =3D re.compile(r'^((This (project|software)|.{1=
,10}) is( free software)? (released|licen[sc]ed)|(Released|Licen[cs]ed)) =
under the .{1,10} [Ll]icen[sc]e:?$')
+    copyright_re =3D re.compile(r'^ *[#\*]* *(Modified work |MIT LICENSE=
D )?Copyright ?(\([cC]\))? .*$')
+    disclaimer_re =3D re.compile(r'^ *\*? ?All [Rr]ights [Rr]eserved\.$'=
)
+    email_re =3D re.compile(r'^.*<[\w\.-]*@[\w\.\-]*>$')
+    header_re =3D re.compile(r'^(\/\**!?)? ?[\-=3D\*]* ?(\*\/)?$')
+    tag_re =3D re.compile(r'^ *@?\(?([Ll]icense|MIT)\)?$')
+    url_re =3D re.compile(r'^ *[#\*]* *https?:\/\/[\w\.\/\-]+$')
+
+    lictext =3D []
+    with open(licfile, 'r', errors=3D'surrogateescape') as f:
+        for line in f:
+            # Drop opening statements
+            if copyright_re.match(line):
+                continue
+            elif disclaimer_re.match(line):
+                continue
+            elif email_re.match(line):
+                continue
+            elif header_re.match(line):
+                continue
+            elif tag_re.match(line):
+                continue
+            elif url_re.match(line):
+                continue
+            elif license_title_re.match(line):
+                continue
+            elif license_statement_re.match(line):
+                continue
+            # Strip comment symbols
+            line =3D line.replace('*', '') \
+                       .replace('#', '')
+            # Unify spelling
+            line =3D line.replace('sub-license', 'sublicense')
+            # Squash spaces
+            line =3D oe.utils.squashspaces(line.strip())
+            # Replace smart quotes, double quotes and backticks with sin=
gle quotes
+            line =3D line.replace(u"\u2018", "'").replace(u"\u2019", "'"=
).replace(u"\u201c","'").replace(u"\u201d", "'").replace('"', '\'').repla=
ce('`', '\'')
+            # Unify brackets
+            line =3D line.replace("{", "[").replace("}", "]")
+            if line:
+                lictext.append(line)
+
+    m =3D hashlib.md5()
+    try:
+        m.update(' '.join(lictext).encode('utf-8'))
+        md5val =3D m.hexdigest()
+    except UnicodeEncodeError:
+        md5val =3D None
+        lictext =3D ''
+    return md5val, lictext
+
+def find_license_files(srctree):
+    licspecs =3D ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', =
'[Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*', 'e[dp=
]l-v10']
+    skip_extensions =3D (".html", ".js", ".json", ".svg", ".ts", ".go")
+    licfiles =3D []
+    for root, dirs, files in os.walk(srctree):
+        for fn in files:
+            if fn.endswith(skip_extensions):
+                continue
+            for spec in licspecs:
+                if fnmatch.fnmatch(fn, spec):
+                    fullpath =3D os.path.join(root, fn)
+                    if not fullpath in licfiles:
+                        licfiles.append(fullpath)
+
+    return licfiles
+
+def match_licenses(licfiles, srctree, d):
+    import bb
+    md5sums =3D get_license_md5sums(d)
+
+    crunched_md5sums =3D crunch_known_licenses(d)
+
+    licenses =3D []
+    for licfile in sorted(licfiles):
+        resolved_licfile =3D d.expand(licfile)
+        md5value =3D bb.utils.md5_file(resolved_licfile)
+        license =3D md5sums.get(md5value, None)
+        if not license:
+            crunched_md5, lictext =3D crunch_license(resolved_licfile)
+            license =3D crunched_md5sums.get(crunched_md5, None)
+            if lictext and not license:
+                license =3D 'Unknown'
+                bb.warn("Please add the following line for '%s' to a 'li=
b/recipetool/licenses.csv' " \
+                    "and replace `Unknown` with the license:\n" \
+                    "%s,Unknown" % (os.path.relpath(licfile, srctree + "=
/.."), md5value))
+        if license:
+            licenses.append((license, os.path.relpath(licfile, srctree),=
 md5value))
+
+    return licenses
+
+def find_licenses(srctree, d):
+    licfiles =3D find_license_files(srctree)
+    licenses =3D match_licenses(licfiles, srctree, d)
+
+    # FIXME should we grab at least one source file with a license heade=
r and add that too?
+
+    return licenses
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/cr=
eate.py
index 390cc37db43..4900bfdbb42 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -956,6 +956,8 @@ def tidy_licenses(value):
     return sorted(list(set(flattened_licenses(value, _choose))), key=3Ds=
tr.casefold)
=20
 def handle_license_vars(srctree, lines_before, handled, extravalues, d):
+    from oe.license_finder import find_licenses
+
     lichandled =3D [x for x in handled if x[0] =3D=3D 'license']
     if lichandled:
         # Someone else has already handled the license vars, just return=
 their value
@@ -1041,230 +1043,6 @@ def handle_license_vars(srctree, lines_before, ha=
ndled, extravalues, d):
     handled.append(('license', licvalues))
     return licvalues
=20
-def get_license_md5sums(d, static_only=3DFalse, linenumbers=3DFalse):
-    import bb.utils
-    import csv
-    md5sums =3D {}
-    if not static_only and not linenumbers:
-        # Gather md5sums of license files in common license dir
-        commonlicdir =3D d.getVar('COMMON_LICENSE_DIR')
-        for fn in os.listdir(commonlicdir):
-            md5value =3D bb.utils.md5_file(os.path.join(commonlicdir, fn=
))
-            md5sums[md5value] =3D fn
-
-    # The following were extracted from common values in various recipes
-    # (double checking the license against the license file itself, not =
just
-    # the LICENSE value in the recipe)
-
-    # Read license md5sums from csv file
-    scripts_path =3D os.path.dirname(os.path.realpath(__file__))
-    for path in (d.getVar('BBPATH').split(':')
-                + [os.path.join(scripts_path, '..', '..')]):
-        csv_path =3D os.path.join(path, 'lib', 'recipetool', 'licenses.c=
sv')
-        if os.path.isfile(csv_path):
-            with open(csv_path, newline=3D'') as csv_file:
-                fieldnames =3D ['md5sum', 'license', 'beginline', 'endli=
ne', 'md5']
-                reader =3D csv.DictReader(csv_file, delimiter=3D',', fie=
ldnames=3Dfieldnames)
-                for row in reader:
-                    if linenumbers:
-                        md5sums[row['md5sum']] =3D (
-                            row['license'], row['beginline'], row['endli=
ne'], row['md5'])
-                    else:
-                        md5sums[row['md5sum']] =3D row['license']
-
-    return md5sums
-
-def crunch_known_licenses(d):
-    '''
-    Calculate the MD5 checksums for the crunched versions of all common
-    licenses. Also add additional known checksums.
-    '''
-   =20
-    crunched_md5sums =3D {}
-
-    # common licenses
-    crunched_md5sums['ad4e9d34a2e966dfe9837f18de03266d'] =3D 'GFDL-1.1-o=
nly'
-    crunched_md5sums['d014fb11a34eb67dc717fdcfc97e60ed'] =3D 'GFDL-1.2-o=
nly'
-    crunched_md5sums['e020ca655b06c112def28e597ab844f1'] =3D 'GFDL-1.3-o=
nly'
-
-    # The following two were gleaned from the "forever" npm package
-    crunched_md5sums['0a97f8e4cbaf889d6fa51f84b89a79f6'] =3D 'ISC'
-    # https://github.com/waffle-gl/waffle/blob/master/LICENSE.txt
-    crunched_md5sums['50fab24ce589d69af8964fdbfe414c60'] =3D 'BSD-2-Clau=
se'
-    # https://github.com/spigwitmer/fakeds1963s/blob/master/LICENSE
-    crunched_md5sums['88a4355858a1433fea99fae34a44da88'] =3D 'GPL-2.0-on=
ly'
-    # http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
-    crunched_md5sums['063b5c3ebb5f3aa4c85a2ed18a31fbe7'] =3D 'GPL-2.0-on=
ly'
-    # https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv2.1
-    crunched_md5sums['7f5202f4d44ed15dcd4915f5210417d8'] =3D 'LGPL-2.1-o=
nly'
-    # unixODBC-2.3.4 COPYING
-    crunched_md5sums['3debde09238a8c8e1f6a847e1ec9055b'] =3D 'LGPL-2.1-o=
nly'
-    # https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv3
-    crunched_md5sums['f90c613c51aa35da4d79dd55fc724ceb'] =3D 'LGPL-3.0-o=
nly'
-    # https://raw.githubusercontent.com/eclipse/mosquitto/v1.4.14/epl-v1=
0
-    crunched_md5sums['efe2cb9a35826992b9df68224e3c2628'] =3D 'EPL-1.0'
-
-    # https://raw.githubusercontent.com/jquery/esprima/3.1.3/LICENSE.BSD
-    crunched_md5sums['80fa7b56a28e8c902e6af194003220a5'] =3D 'BSD-2-Clau=
se'
-    # https://raw.githubusercontent.com/npm/npm-install-checks/master/LI=
CENSE
-    crunched_md5sums['e659f77bfd9002659e112d0d3d59b2c1'] =3D 'BSD-2-Clau=
se'
-    # https://raw.githubusercontent.com/silverwind/default-gateway/4.2.0=
/LICENSE
-    crunched_md5sums['4c641f2d995c47f5cb08bdb4b5b6ea05'] =3D 'BSD-2-Clau=
se'
-    # https://raw.githubusercontent.com/tad-lispy/node-damerau-levenshte=
in/v1.0.5/LICENSE
-    crunched_md5sums['2b8c039b2b9a25f0feb4410c4542d346'] =3D 'BSD-2-Clau=
se'
-    # https://raw.githubusercontent.com/terser/terser/v3.17.0/LICENSE
-    crunched_md5sums['8bd23871802951c9ad63855151204c2c'] =3D 'BSD-2-Clau=
se'
-    # https://raw.githubusercontent.com/alexei/sprintf.js/1.0.3/LICENSE
-    crunched_md5sums['008c22318c8ea65928bf730ddd0273e3'] =3D 'BSD-3-Clau=
se'
-    # https://raw.githubusercontent.com/Caligatio/jsSHA/v3.2.0/LICENSE
-    crunched_md5sums['0e46634a01bfef056892949acaea85b1'] =3D 'BSD-3-Clau=
se'
-    # https://raw.githubusercontent.com/d3/d3-path/v1.0.9/LICENSE
-    crunched_md5sums['b5f72aef53d3b2b432702c30b0215666'] =3D 'BSD-3-Clau=
se'
-    # https://raw.githubusercontent.com/feross/ieee754/v1.1.13/LICENSE
-    crunched_md5sums['a39327c997c20da0937955192d86232d'] =3D 'BSD-3-Clau=
se'
-    # https://raw.githubusercontent.com/joyent/node-extsprintf/v1.3.0/LI=
CENSE
-    crunched_md5sums['721f23a96ff4161ca3a5f071bbe18108'] =3D 'MIT'
-    # https://raw.githubusercontent.com/pvorb/clone/v0.2.0/LICENSE
-    crunched_md5sums['b376d29a53c9573006b9970709231431'] =3D 'MIT'
-    # https://raw.githubusercontent.com/andris9/encoding/v0.1.12/LICENSE
-    crunched_md5sums['85d8a977ee9d7c5ab4ac03c9b95431c4'] =3D 'MIT-0'
-    # https://raw.githubusercontent.com/faye/websocket-driver-node/0.7.3=
/LICENSE.md
-    crunched_md5sums['b66384e7137e41a9b1904ef4d39703b6'] =3D 'Apache-2.0=
'
-    # https://raw.githubusercontent.com/less/less.js/v4.1.1/LICENSE
-    crunched_md5sums['b27575459e02221ccef97ec0bfd457ae'] =3D 'Apache-2.0=
'
-    # https://raw.githubusercontent.com/microsoft/TypeScript/v3.5.3/LICE=
NSE.txt
-    crunched_md5sums['a54a1a6a39e7f9dbb4a23a42f5c7fd1c'] =3D 'Apache-2.0=
'
-    # https://raw.githubusercontent.com/request/request/v2.87.0/LICENSE
-    crunched_md5sums['1034431802e57486b393d00c5d262b8a'] =3D 'Apache-2.0=
'
-    # https://raw.githubusercontent.com/dchest/tweetnacl-js/v0.14.5/LICE=
NSE
-    crunched_md5sums['75605e6bdd564791ab698fca65c94a4f'] =3D 'Unlicense'
-    # https://raw.githubusercontent.com/stackgl/gl-mat3/v2.0.0/LICENSE.m=
d
-    crunched_md5sums['75512892d6f59dddb6d1c7e191957e9c'] =3D 'Zlib'
-
-    commonlicdir =3D d.getVar('COMMON_LICENSE_DIR')
-    for fn in sorted(os.listdir(commonlicdir)):
-        md5value, lictext =3D crunch_license(os.path.join(commonlicdir, =
fn))
-        if md5value not in crunched_md5sums:
-            crunched_md5sums[md5value] =3D fn
-        elif fn !=3D crunched_md5sums[md5value]:
-            bb.debug(2, "crunched_md5sums['%s'] is already set to '%s' r=
ather than '%s'" % (md5value, crunched_md5sums[md5value], fn))
-        else:
-            bb.debug(2, "crunched_md5sums['%s'] is already set to '%s'" =
% (md5value, crunched_md5sums[md5value]))
-
-    return crunched_md5sums
-
-def crunch_license(licfile):
-    '''
-    Remove non-material text from a license file and then calculate its
-    md5sum. This works well for licenses that contain a copyright statem=
ent,
-    but is also a useful way to handle people's insistence upon reformat=
ting
-    the license text slightly (with no material difference to the text o=
f the
-    license).
-    '''
-
-    import oe.utils
-
-    # Note: these are carefully constructed!
-    license_title_re =3D re.compile(r'^#*\(? *(This is )?([Tt]he )?.{0,1=
5} ?[Ll]icen[sc]e( \(.{1,10}\))?\)?[:\.]? ?#*$')
-    license_statement_re =3D re.compile(r'^((This (project|software)|.{1=
,10}) is( free software)? (released|licen[sc]ed)|(Released|Licen[cs]ed)) =
under the .{1,10} [Ll]icen[sc]e:?$')
-    copyright_re =3D re.compile(r'^ *[#\*]* *(Modified work |MIT LICENSE=
D )?Copyright ?(\([cC]\))? .*$')
-    disclaimer_re =3D re.compile(r'^ *\*? ?All [Rr]ights [Rr]eserved\.$'=
)
-    email_re =3D re.compile(r'^.*<[\w\.-]*@[\w\.\-]*>$')
-    header_re =3D re.compile(r'^(\/\**!?)? ?[\-=3D\*]* ?(\*\/)?$')
-    tag_re =3D re.compile(r'^ *@?\(?([Ll]icense|MIT)\)?$')
-    url_re =3D re.compile(r'^ *[#\*]* *https?:\/\/[\w\.\/\-]+$')
-
-    lictext =3D []
-    with open(licfile, 'r', errors=3D'surrogateescape') as f:
-        for line in f:
-            # Drop opening statements
-            if copyright_re.match(line):
-                continue
-            elif disclaimer_re.match(line):
-                continue
-            elif email_re.match(line):
-                continue
-            elif header_re.match(line):
-                continue
-            elif tag_re.match(line):
-                continue
-            elif url_re.match(line):
-                continue
-            elif license_title_re.match(line):
-                continue
-            elif license_statement_re.match(line):
-                continue
-            # Strip comment symbols
-            line =3D line.replace('*', '') \
-                       .replace('#', '')
-            # Unify spelling
-            line =3D line.replace('sub-license', 'sublicense')
-            # Squash spaces
-            line =3D oe.utils.squashspaces(line.strip())
-            # Replace smart quotes, double quotes and backticks with sin=
gle quotes
-            line =3D line.replace(u"\u2018", "'").replace(u"\u2019", "'"=
).replace(u"\u201c","'").replace(u"\u201d", "'").replace('"', '\'').repla=
ce('`', '\'')
-            # Unify brackets
-            line =3D line.replace("{", "[").replace("}", "]")
-            if line:
-                lictext.append(line)
-
-    m =3D hashlib.md5()
-    try:
-        m.update(' '.join(lictext).encode('utf-8'))
-        md5val =3D m.hexdigest()
-    except UnicodeEncodeError:
-        md5val =3D None
-        lictext =3D ''
-    return md5val, lictext
-
-def find_license_files(srctree):
-    licspecs =3D ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', =
'[Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*', 'e[dp=
]l-v10']
-    skip_extensions =3D (".html", ".js", ".json", ".svg", ".ts", ".go")
-    licfiles =3D []
-    for root, dirs, files in os.walk(srctree):
-        for fn in files:
-            if fn.endswith(skip_extensions):
-                continue
-            for spec in licspecs:
-                if fnmatch.fnmatch(fn, spec):
-                    fullpath =3D os.path.join(root, fn)
-                    if not fullpath in licfiles:
-                        licfiles.append(fullpath)
-
-    return licfiles
-
-def match_licenses(licfiles, srctree, d):
-    import bb
-    md5sums =3D get_license_md5sums(d)
-
-    crunched_md5sums =3D crunch_known_licenses(d)
-
-    licenses =3D []
-    for licfile in sorted(licfiles):
-        resolved_licfile =3D d.expand(licfile)
-        md5value =3D bb.utils.md5_file(resolved_licfile)
-        license =3D md5sums.get(md5value, None)
-        if not license:
-            crunched_md5, lictext =3D crunch_license(resolved_licfile)
-            license =3D crunched_md5sums.get(crunched_md5, None)
-            if lictext and not license:
-                license =3D 'Unknown'
-                logger.info("Please add the following line for '%s' to a=
 'lib/recipetool/licenses.csv' " \
-                    "and replace `Unknown` with the license:\n" \
-                    "%s,Unknown" % (os.path.relpath(licfile, srctree + "=
/.."), md5value))
-        if license:
-            licenses.append((license, os.path.relpath(licfile, srctree),=
 md5value))
-
-    return licenses
-
-def find_licenses(srctree, d):
-    licfiles =3D find_license_files(srctree)
-    licenses =3D match_licenses(licfiles, srctree, d)
-
-    # FIXME should we grab at least one source file with a license heade=
r and add that too?
-
-    return licenses
-
 def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=3D=
None, pn=3D'${PN}'):
     """
     Given a list of (license, path, md5sum) as returned by match_license=
s(),
--=20
2.43.0


