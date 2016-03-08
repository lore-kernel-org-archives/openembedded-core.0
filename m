Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8565C6FFFB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 05:36:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 07 Mar 2016 21:36:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,555,1449561600"; d="scan'208";a="919077674"
Received: from jlee45-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.164.131])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2016 21:36:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Mar 2016 18:36:03 +1300
Message-Id: <70397d457f1b23c0d84966784fb807ec3fd8e7e3.1457415260.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457415260.git.paul.eggleton@linux.intel.com>
References: <cover.1457415260.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457415260.git.paul.eggleton@linux.intel.com>
References: <cover.1457415260.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/6] recipetool: create: add license file crunching
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
X-List-Received-Date: Tue, 08 Mar 2016 05:36:46 -0000

Matching license texts directly to md5sums only goes so far. Some
licenses make the copyright statement an intrinsic part of the license
statement (e.g. MIT) which of course varies between projects. Also,
people often seem to take standard license texts such as GPLv2 and
reformat them cosmetically - re-wrapping lines at a different width or
changing quoting styles are seemingly popular examples. In order to
match license files to their actual licenses more effectively, "crunch"
out these elements before comparing to an md5sum. (The existing plain
md5sum matching has been left in since it's a shortcut, and our list of
crunched md5sums isn't a complete replacement for it.)

As always, this code isn't providing any guarantees (legal or otherwise)
that it will always get the license correct - as indicated by the
accompanying comments the LICENSE values it writes out to the recipe are
indicative and you should verify them yourself by looking at the
documentation supplied from upstream for the software being built if you
have any concerns.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 77 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index def2eea..718f2aa 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -25,6 +25,7 @@ import json
 import logging
 import scriptutils
 import urlparse
+import hashlib
 
 logger = logging.getLogger('recipetool')
 
@@ -717,6 +718,76 @@ def get_license_md5sums(d, static_only=False):
     md5sums['54c7042be62e169199200bc6477f04d1'] = 'BSD-3-Clause'
     return md5sums
 
+def crunch_license(licfile):
+    '''
+    Remove non-material text from a license file and then check
+    its md5sum against a known list. This works well for licenses
+    which contain a copyright statement, but is also a useful way
+    to handle people's insistence upon reformatting the license text
+    slightly (with no material difference to the text of the
+    license).
+    '''
+
+    import oe.utils
+
+    # Note: these are carefully constructed!
+    license_title_re = re.compile('^\(?(#+ *)?(The )?.{1,10} [Ll]icen[sc]e( \(.{1,10}\))?\)?:?$')
+    license_statement_re = re.compile('^This (project|software) is( free software)? released under the .{1,10} [Ll]icen[sc]e:?$')
+    copyright_re = re.compile('^(#+)? *Copyright .*$')
+
+    crunched_md5sums = {}
+    # The following two were gleaned from the "forever" npm package
+    crunched_md5sums['0a97f8e4cbaf889d6fa51f84b89a79f6'] = 'ISC'
+    crunched_md5sums['eecf6429523cbc9693547cf2db790b5c'] = 'MIT'
+    # https://github.com/vasi/pixz/blob/master/LICENSE
+    crunched_md5sums['2f03392b40bbe663597b5bd3cc5ebdb9'] = 'BSD-2-Clause'
+    # https://github.com/waffle-gl/waffle/blob/master/LICENSE.txt
+    crunched_md5sums['e72e5dfef0b1a4ca8a3d26a60587db66'] = 'BSD-2-Clause'
+    # https://github.com/spigwitmer/fakeds1963s/blob/master/LICENSE
+    crunched_md5sums['8be76ac6d191671f347ee4916baa637e'] = 'GPLv2'
+    # https://github.com/datto/dattobd/blob/master/COPYING
+    # http://git.savannah.gnu.org/cgit/freetype/freetype2.git/tree/docs/GPLv2.TXT
+    crunched_md5sums['1d65c5ad4bf6489f85f4812bf08ae73d'] = 'GPLv2'
+    # http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
+    # http://git.neil.brown.name/?p=mdadm.git;a=blob;f=COPYING;h=d159169d1050894d3ea3b98e1c965c4058208fe1;hb=HEAD
+    crunched_md5sums['fb530f66a7a89ce920f0e912b5b66d4b'] = 'GPLv2'
+    # https://github.com/gkos/nrf24/blob/master/COPYING
+    crunched_md5sums['7b6aaa4daeafdfa6ed5443fd2684581b'] = 'GPLv2'
+    # https://github.com/josch09/resetusb/blob/master/COPYING
+    crunched_md5sums['8b8ac1d631a4d220342e83bcf1a1fbc3'] = 'GPLv3'
+    # https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv2.1
+    crunched_md5sums['2ea316ed973ae176e502e2297b574bb3'] = 'LGPLv2.1'
+    # unixODBC-2.3.4 COPYING
+    crunched_md5sums['1daebd9491d1e8426900b4fa5a422814'] = 'LGPLv2.1'
+    # https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv3
+    crunched_md5sums['2ebfb3bb49b9a48a075cc1425e7f4129'] = 'LGPLv3'
+    lictext = []
+    with open(licfile, 'r') as f:
+        for line in f:
+            # Drop opening statements
+            if copyright_re.match(line):
+                continue
+            elif license_title_re.match(line):
+                continue
+            elif license_statement_re.match(line):
+                continue
+            # Squash spaces, and replace smart quotes, double quotes
+            # and backticks with single quotes
+            line = oe.utils.squashspaces(line.strip()).decode("utf-8")
+            line = line.replace(u"\u2018", "'").replace(u"\u2019", "'").replace(u"\u201c","'").replace(u"\u201d", "'").replace('"', '\'').replace('`', '\'')
+            if line:
+                lictext.append(line)
+
+    m = hashlib.md5()
+    try:
+        m.update(' '.join(lictext))
+        md5val = m.hexdigest()
+    except UnicodeEncodeError:
+        md5val = None
+        lictext = ''
+    license = crunched_md5sums.get(md5val, None)
+    return license, md5val, lictext
+
 def guess_license(srctree):
     import bb
     md5sums = get_license_md5sums(tinfoil.config_data)
@@ -733,7 +804,11 @@ def guess_license(srctree):
                         licfiles.append(fullpath)
     for licfile in licfiles:
         md5value = bb.utils.md5_file(licfile)
-        license = md5sums.get(md5value, 'Unknown')
+        license = md5sums.get(md5value, None)
+        if not license:
+            license, crunched_md5, lictext = crunch_license(licfile)
+            if not license:
+                license = 'Unknown'
         licenses.append((license, os.path.relpath(licfile, srctree), md5value))
 
     # FIXME should we grab at least one source file with a license header and add that too?
-- 
2.5.0


