Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF657C71155
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 13:16:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10091.1749820583688500431
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 06:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3BE21C0A
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:16:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C80113F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:16:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] lib/oe/license_finder: extract license finding code from recipetool
Date: Fri, 13 Jun 2025 14:16:11 +0100
Message-ID: <20250613131620.221912-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613131620.221912-1-ross.burton@arm.com>
References: <20250613131620.221912-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 13:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218602

This code is 99% identical to the original code in recipetool/create.py,
but with two minor changes:
- The implicit recipetool logger is changed to an explicit logger
- The CSV of license hashes is moved to meta/files/

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/files/license-hashes.csv |  37 ++++++
 meta/lib/oe/license_finder.py | 242 ++++++++++++++++++++++++++++++++++
 2 files changed, 279 insertions(+)
 create mode 100644 meta/files/license-hashes.csv
 create mode 100644 meta/lib/oe/license_finder.py

diff --git a/meta/files/license-hashes.csv b/meta/files/license-hashes.cs=
v
new file mode 100644
index 00000000000..80851111b31
--- /dev/null
+++ b/meta/files/license-hashes.csv
@@ -0,0 +1,37 @@
+0636e73ff0215e8d672dc4c32c317bb3,GPL-2.0-only
+12f884d2ae1ff87c09e5b7ccc2c4ca7e,GPL-2.0-only
+18810669f13b87348459e611d31ab760,GPL-2.0-only
+252890d9eee26aab7b432e8b8a616475,LGPL-2.0-only
+2d5025d4aa3495befef8f17206a5b0a1,LGPL-2.1-only
+3214f080875748938ba060314b4f727d,LGPL-2.0-only
+385c55653886acac3821999a3ccd17b3,Artistic-1.0 | GPL-2.0-only
+393a5ca445f6965873eca0259a17f833,GPL-2.0-only
+3b83ef96387f14655fc854ddc3c6bd57,Apache-2.0
+3bf50002aefd002f49e7bb854063f7e7,LGPL-2.0-only
+4325afd396febcb659c36b49533135d4,GPL-2.0-only
+4fbd65380cdd255951079008b364516c,LGPL-2.1-only
+54c7042be62e169199200bc6477f04d1,BSD-3-Clause
+55ca817ccb7d5b5b66355690e9abc605,LGPL-2.0-only
+59530bdf33659b29e73d4adb9f9f6552,GPL-2.0-only
+5f30f0716dfdd0d91eb439ebec522ec2,LGPL-2.0-only
+6a6a8e020838b23406c81b19c1d46df6,LGPL-3.0-only
+751419260aa954499f7abaabaa882bbe,GPL-2.0-only
+7fbc338309ac38fefcd64b04bb903e34,LGPL-2.1-only
+8ca43cbc842c2336e835926c2166c28b,GPL-2.0-only
+94d55d512a9ba36caa9b7df079bae19f,GPL-2.0-only
+9ac2e7cff1ddaf48b6eab6028f23ef88,GPL-2.0-only
+9f604d8a4f8e74f4f5140845a21b6674,LGPL-2.0-only
+a6f89e2100d9b6cdffcea4f398e37343,LGPL-2.1-only
+b234ee4d69f5fce4486a80fdaf4a4263,GPL-2.0-only
+bbb461211a33b134d42ed5ee802b37ff,LGPL-2.1-only
+bfe1f75d606912a4111c90743d6c7325,MPL-1.1-only
+c93c0550bd3173f4504b2cbd8991e50b,GPL-2.0-only
+d32239bcb673463ab874e80d47fae504,GPL-3.0-only
+d7810fab7487fb0aad327b76f1be7cd7,GPL-2.0-only
+d8045f3b8f929c1cb29a1e3fd737b499,LGPL-2.1-only
+db979804f025cf55aabec7129cb671ed,LGPL-2.0-only
+eb723b61539feef013de476e68b5c50a,GPL-2.0-only
+ebb5c50ab7cab4baeffba14977030c07,GPL-2.0-only
+f27defe1e96c2e1ecd4e0c9be8967949,GPL-3.0-only
+fad9b3332be894bab9bc501572864b29,LGPL-2.1-only
+fbc093901857fcd118f065f900982c24,LGPL-2.1-only
diff --git a/meta/lib/oe/license_finder.py b/meta/lib/oe/license_finder.p=
y
new file mode 100644
index 00000000000..5b09059576e
--- /dev/null
+++ b/meta/lib/oe/license_finder.py
@@ -0,0 +1,242 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import fnmatch
+import hashlib
+import logging
+import os
+import re
+
+import bb
+
+logger =3D logging.getLogger("BitBake.OE.LicenseFinder")
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
+                logger.info("Please add the following line for '%s' to a=
 'license-hashes.csv' " \
+                    "and replace `Unknown` with the license:\n" \
+                    "%s,Unknown" % (os.path.relpath(licfile, srctree + "=
/.."), md5value))
+        if license:
+            licenses.append((license, os.path.relpath(licfile, srctree),=
 md5value))
+
+    return licenses
+
+
+def find_licenses(srctree, d):
+    licfiles =3D find_license_files(srctree)
+    licenses =3D match_licenses(licfiles, srctree, d)
+
+    # FIXME should we grab at least one source file with a license heade=
r and add that too?
+
+    return licenses
--=20
2.43.0


