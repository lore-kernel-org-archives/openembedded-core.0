Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A10C4829E
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:29:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.13379.1707380941007005368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 00:29:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZzNNE1ca;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4100826df08so13415555e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 00:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707380939; x=1707985739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3sjBnf8Hy5ZDNmJrihKEvkaMGcLVSOU8cTsOu0RMDw=;
        b=ZzNNE1cai8cdzrW/YjTwcdHb4JFO/sq64FBWim1zV1xBg+0KzXGRSU7VoXTrleG0kA
         fSSu4mkKfsYakINaz+AvjYruDuRGDQJ7UyjUw9/M8W3CzWQV3448C9rd0ZRkWMTKRq6n
         Bfy9sFDriMd26mDAiDIP2o+5lW6FpLN7Pp6rKdyMtvi4ot0/H2q9Lzyw9QHGilmL4hZ0
         evbQrVnS3pfKHAoMKz5fZLwe+En7JxHr7TxeB7LEIWUPW2Q58AyPA7EiqTL2RBV5XKiH
         MFxm7ZlM3FSZG6CeFashobo/uqaW//o1pDljZ2PgUboYb0xkCMPpqdOOJXvvDF/rCI5q
         7Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707380939; x=1707985739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3sjBnf8Hy5ZDNmJrihKEvkaMGcLVSOU8cTsOu0RMDw=;
        b=RaQ74F5a0qGytTZe73RPvfMajeW2/Y1lCfXV6fr/XMsl5TtJfhhXWMnVxjwa3MmpvJ
         iUxUWIio+fnGTjMgUADjsQlm1M444RhwpD0dQnpbi6JihTJ4mqfczy0HoCDymLuCk2Yv
         HN1kKUgKZ1WOk68RcEzbeav+9AmVnN/8OVkXmSKLLXgF5uEzKlgFMFUACWpsBXNWaQUf
         92n/878kTZDp9E8MUPyRjAwAJI2mKC3mnHVId0jAXcQtIT/Ck/2PrgnFyy5wXllUYoai
         P6QRi6uOTVdN8hvHuI68LTfUM2ndu01ZLPXaMK8YiDuPHYwj1AGDgMuQOh8yzM7G1ZFJ
         2CrQ==
X-Gm-Message-State: AOJu0Yxvxzi06UWw8aTJuhC1o2K+/z4CmW/t+eeOjiST8SctiZd0Bdan
	bum8mYtuSBrNtv7lkEhmexJTtdl8K2bxVvqKKyLHlEMIJfTNBCwlnr9Jg8lX
X-Google-Smtp-Source: AGHT+IHs/wO29Fh2+RV/IL2Enc7V/eDQ4mKo6N8Iopm+a6/tOTHbrBad5PLlGa1KvF8aHLeFRA6TcQ==
X-Received: by 2002:a05:600c:5029:b0:410:41e5:3a3d with SMTP id n41-20020a05600c502900b0041041e53a3dmr509294wmr.5.1707380939080;
        Thu, 08 Feb 2024 00:28:59 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id j12-20020a05600c190c00b0040ebf603a89sm913321wmq.11.2024.02.08.00.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 00:28:58 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 7/7] python 3.12 compatible regex
Date: Thu,  8 Feb 2024 09:27:33 +0100
Message-ID: <20240208082821.430510-8-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208082821.430510-1-adrian.freihofer@siemens.com>
References: <20240208082821.430510-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195112

All the regexes throw a warning like this:

WARNING: scripts/lib/recipetool/create_buildsys.py:140:
      SyntaxWarning: invalid escape sequence '\s'
      proj_re = re.compile('project\s*\(([^)]*)\)', re.IGNORECASE)

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 bitbake/lib/bs4/tests/test_tree.py            |  2 +-
 .../feature-microblaze-versions.inc           |  2 +-
 meta/lib/oeqa/oetest.py                       |  2 +-
 meta/lib/oeqa/selftest/cases/bblayers.py      |  2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      |  6 +--
 meta/lib/patchtest/tests/base.py              |  4 +-
 meta/lib/patchtest/utils.py                   |  6 +--
 .../perf/perf/sort-pmuevents.py               |  8 ++--
 meta/recipes-rt/rt-tests/files/rt_bmark.py    |  2 +-
 scripts/combo-layer                           |  2 +-
 scripts/contrib/bbvars.py                     |  6 +--
 scripts/contrib/convert-overrides.py          |  8 ++--
 scripts/lib/checklayer/__init__.py            |  4 +-
 scripts/lib/recipetool/create.py              | 12 +++---
 scripts/lib/recipetool/create_buildsys.py     | 38 +++++++++----------
 scripts/oe-check-sstate                       |  2 +-
 scripts/oe-pkgdata-util                       |  2 +-
 scripts/opkg-query-helper.py                  |  2 +-
 scripts/patchtest-get-branch                  |  2 +-
 19 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/bitbake/lib/bs4/tests/test_tree.py b/bitbake/lib/bs4/tests/test_tree.py
index 8e5c66426e8..cf0f1abe0cc 100644
--- a/bitbake/lib/bs4/tests/test_tree.py
+++ b/bitbake/lib/bs4/tests/test_tree.py
@@ -585,7 +585,7 @@ class SiblingTest(TreeTest):
                     </html>'''
         # All that whitespace looks good but makes the tests more
         # difficult. Get rid of it.
-        markup = re.compile("\n\s*").sub("", markup)
+        markup = re.compile(r"\n\s*").sub("", markup)
         self.tree = self.soup(markup)
 
 
diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
index 5c37f49abb7..658e87b8cdb 100644
--- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
+++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
@@ -16,7 +16,7 @@ def microblaze_current_version(d, gcc = False):
     # find the current version, and convert it to major/minor integers
     version = None
     for t in (d.getVar("TUNE_FEATURES") or "").split():
-        m = re.search("^v(\d+)\.(\d+)", t)
+        m = re.search(r"^v(\d+)\.(\d+)", t)
         if m:
             version = int(m.group(1)), int(m.group(2))
             break
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index cf417db0d42..bcb6a878c7a 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -241,7 +241,7 @@ class TestContext(object):
 
         modules = []
         for test in self.testslist:
-            if re.search("\w+\.\w+\.test_\S+", test):
+            if re.search(r"\w+\.\w+\.test_\S+", test):
                 test = '.'.join(t.split('.')[:3])
             module = pkgutil.get_loader(test)
             modules.append(module)
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 8faa0602348..2475a79468f 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -54,7 +54,7 @@ class BitbakeLayers(OESelftestTestCase):
         bb_file = os.path.join(testoutdir, recipe_path, recipe_file)
         self.assertTrue(os.path.isfile(bb_file), msg = "Cannot find xcursor-transparent-theme_0.1.1.bb in the test_bitbakelayers_flatten local dir.")
         contents = ftools.read_file(bb_file)
-        find_in_contents = re.search("##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
+        find_in_contents = re.search(r"##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
         self.assertTrue(find_in_contents, msg = "Flattening layers did not work. bitbake-layers flatten output: %s" % result.output)
 
     def test_bitbakelayers_add_remove(self):
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 9383d0c4db1..347c0653776 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -204,7 +204,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         signed_sections = {}
         for line in result.output.splitlines():
             if line.startswith((' Configuration', ' Image')):
-                in_signed = re.search('\((.*)\)', line).groups()[0]
+                in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match('^ *', line) in (' ', ''):
                 in_signed = None
             elif in_signed:
@@ -525,7 +525,7 @@ UBOOT_FIT_HASH_ALG = "sha256"
         signed_sections = {}
         for line in result.output.splitlines():
             if line.startswith((' Image')):
-                in_signed = re.search('\((.*)\)', line).groups()[0]
+                in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match(' \w', line):
                 in_signed = None
             elif in_signed:
@@ -680,7 +680,7 @@ FIT_SIGN_INDIVIDUAL = "1"
         signed_sections = {}
         for line in result.output.splitlines():
             if line.startswith((' Image')):
-                in_signed = re.search('\((.*)\)', line).groups()[0]
+                in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match(' \w', line):
                 in_signed = None
             elif in_signed:
diff --git a/meta/lib/patchtest/tests/base.py b/meta/lib/patchtest/tests/base.py
index aecbbc4aae5..424e61b5be2 100644
--- a/meta/lib/patchtest/tests/base.py
+++ b/meta/lib/patchtest/tests/base.py
@@ -34,8 +34,8 @@ class PatchtestOEError(Exception):
 class Base(unittest.TestCase):
     # if unit test fails, fail message will throw at least the following JSON: {"id": <testid>}
 
-    endcommit_messages_regex = re.compile('\(From \w+-\w+ rev:|(?<!\S)Signed-off-by|(?<!\S)---\n')
-    patchmetadata_regex   = re.compile('-{3} \S+|\+{3} \S+|@{2} -\d+,\d+ \+\d+,\d+ @{2} \S+')
+    endcommit_messages_regex = re.compile(r'\(From \w+-\w+ rev:|(?<!\S)Signed-off-by|(?<!\S)---\n')
+    patchmetadata_regex   = re.compile(r'-{3} \S+|\+{3} \S+|@{2} -\d+,\d+ \+\d+,\d+ @{2} \S+')
 
 
     @staticmethod
diff --git a/meta/lib/patchtest/utils.py b/meta/lib/patchtest/utils.py
index a4a523b4e25..dd0abc22d9b 100644
--- a/meta/lib/patchtest/utils.py
+++ b/meta/lib/patchtest/utils.py
@@ -132,7 +132,7 @@ def get_subject_prefix(path):
     if len(mbox):
         subject = mbox[0]['subject']
         if subject:
-            pattern = re.compile("(\[.*\])", re.DOTALL)
+            pattern = re.compile(r"(\[.*\])", re.DOTALL)
             match = pattern.search(subject)
             if match:
                 prefix = match.group(1)
@@ -146,8 +146,8 @@ def valid_branch(branch):
     invalid  = lbranch.startswith('patch') or \
                lbranch.startswith('rfc') or \
                lbranch.startswith('resend') or \
-               re.search('^v\d+', lbranch) or \
-               re.search('^\d+/\d+', lbranch)
+               re.search(r'^v\d+', lbranch) or \
+               re.search(r'^\d+/\d+', lbranch)
 
     return not invalid
 
diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
index 0362f2d8fab..0a87e553ab8 100755
--- a/meta/recipes-kernel/perf/perf/sort-pmuevents.py
+++ b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
@@ -36,10 +36,10 @@ with open(infile, 'r') as file:
 preamble_regex = re.compile( '^(.*?)^(struct|const struct|static struct|static const struct)', re.MULTILINE | re.DOTALL )
 
 preamble = re.search( preamble_regex, data )
-struct_block_regex = re.compile( '^(struct|const struct|static struct|static const struct).*?(\w+) (.*?)\[\] = {(.*?)^};', re.MULTILINE | re.DOTALL )
-field_regex =  re.compile( '{.*?},', re.MULTILINE | re.DOTALL )
-cpuid_regex = re.compile( '\.cpuid = (.*?),', re.MULTILINE | re.DOTALL )
-name_regex = re.compile( '\.name = (.*?),', re.MULTILINE | re.DOTALL )
+struct_block_regex = re.compile(r'^(struct|const struct|static struct|static const struct).*?(\w+) (.*?)\[\] = {(.*?)^};', re.MULTILINE | re.DOTALL )
+field_regex =  re.compile(r'{.*?},', re.MULTILINE | re.DOTALL )
+cpuid_regex = re.compile(r'\.cpuid = (.*?),', re.MULTILINE | re.DOTALL )
+name_regex = re.compile(r'\.name = (.*?),', re.MULTILINE | re.DOTALL )
 
 # create a dictionary structure to store all the structs, their
 # types and then their fields.
diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index 3b84447a0fd..2a4eed412f0 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -265,7 +265,7 @@ cmd = ("cyclictest",
        "-d", str(interval_delta),
        "-l", str(loop_count)
        )
-rex = re.compile(b"C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)")
+rex = re.compile(r"C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)")
 
 def run_cyclictest_once():
         res = subprocess.check_output(cmd)
diff --git a/scripts/combo-layer b/scripts/combo-layer
index 2312cef9ac1..4a715914aff 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -483,7 +483,7 @@ def check_repo_clean(repodir):
         exit if repo is dirty
     """
     output=runcmd("git status --porcelain", repodir)
-    r = re.compile('\?\? patch-.*/')
+    r = re.compile(r'\?\? patch-.*/')
     dirtyout = [item for item in output.splitlines() if not r.match(item)]
     if dirtyout:
         logger.error("git repo %s is dirty, please fix it first", repodir)
diff --git a/scripts/contrib/bbvars.py b/scripts/contrib/bbvars.py
index 090133600b6..a9cdf082ab9 100755
--- a/scripts/contrib/bbvars.py
+++ b/scripts/contrib/bbvars.py
@@ -36,8 +36,8 @@ def bbvar_is_documented(var, documented_vars):
 def collect_documented_vars(docfiles):
     ''' Walk the docfiles and collect the documented variables '''
     documented_vars = []
-    prog = re.compile(".*($|[^A-Z_])<glossentry id=\'var-")
-    var_prog = re.compile('<glossentry id=\'var-(.*)\'>')
+    prog = re.compile(r".*($|[^A-Z_])<glossentry id=\'var-")
+    var_prog = re.compile(r'<glossentry id=\'var-(.*)\'>')
     for d in docfiles:
         with open(d) as f:
             documented_vars += var_prog.findall(f.read())
@@ -45,7 +45,7 @@ def collect_documented_vars(docfiles):
     return documented_vars
 
 def bbvar_doctag(var, docconf):
-    prog = re.compile('^%s\[doc\] *= *"(.*)"' % (var))
+    prog = re.compile(r'^%s\[doc\] *= *"(.*)"' % (var))
     if docconf == "":
         return "?"
 
diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index 1939757f1bc..c69acb4095a 100755
--- a/scripts/contrib/convert-overrides.py
+++ b/scripts/contrib/convert-overrides.py
@@ -81,19 +81,19 @@ skip_ext = [".html", ".patch", ".m4", ".diff"] + args.skip_ext
 
 vars_re = {}
 for exp in vars:
-    vars_re[exp] = (re.compile('((^|[#\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp), r"\1:" + exp)
+    vars_re[exp] = (re.compile(r'((^|[#\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp), r"\1:" + exp)
 
 shortvars_re = {}
 for exp in shortvars:
-    shortvars_re[exp] = (re.compile('((^|[#\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp + '([\(\'"\s:])'), r"\1:" + exp + r"\3")
+    shortvars_re[exp] = (re.compile(r'((^|[#\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp + r'([\(\'"\s:])'), r"\1:" + exp + r"\3")
 
 package_re = {}
 for exp in packagevars:
-    package_re[exp] = (re.compile('(^|[#\'"\s\-\+]+)' + exp + '_' + '([$a-z"\'\s%\[<{\\\*].)'), r"\1" + exp + r":\2")
+    package_re[exp] = (re.compile(r'(^|[#\'"\s\-\+]+)' + exp + r'_' + r'([$a-z"\'\s%\[<{\\\*].)'), r"\1" + exp + r":\2")
 
 # Other substitutions to make
 subs = {
-    'r = re.compile("([^:]+):\s*(.*)")' : 'r = re.compile("(^.+?):\s+(.*)")',
+    'r = re.compile(r"([^:]+):\s*(.*)")' : 'r = re.compile(r"(^.+?):\s+(.*)")',
     "val = d.getVar('%s_%s' % (var, pkg))" : "val = d.getVar('%s:%s' % (var, pkg))",
     "f.write('%s_%s: %s\\n' % (var, pkg, encode(val)))" : "f.write('%s:%s: %s\\n' % (var, pkg, encode(val)))",
     "d.getVar('%s_%s' % (scriptlet_name, pkg))" : "d.getVar('%s:%s' % (scriptlet_name, pkg))",
diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 8271ed7fe3b..62ecdfe3906 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -324,8 +324,8 @@ def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
         else:
             raise
 
-    sig_regex = re.compile("^(?P<task>.*:.*):(?P<hash>.*) .$")
-    tune_regex = re.compile("(^|\s)SIGGEN_LOCKEDSIGS_t-(?P<tune>\S*)\s*=\s*")
+    sig_regex = re.compile(r"^(?P<task>.*:.*):(?P<hash>.*) .$")
+    tune_regex = re.compile(r"(^|\s)SIGGEN_LOCKEDSIGS_t-(?P<tune>\S*)\s*=\s*")
     current_tune = None
     with open(sigs_file, 'r') as f:
         for line in f.readlines():
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index d2997cc2420..8e9ff38db6c 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1166,12 +1166,12 @@ def crunch_license(licfile):
     # Note: these are carefully constructed!
     license_title_re = re.compile(r'^#*\(? *(This is )?([Tt]he )?.{0,15} ?[Ll]icen[sc]e( \(.{1,10}\))?\)?[:\.]? ?#*$')
     license_statement_re = re.compile(r'^((This (project|software)|.{1,10}) is( free software)? (released|licen[sc]ed)|(Released|Licen[cs]ed)) under the .{1,10} [Ll]icen[sc]e:?$')
-    copyright_re = re.compile('^ *[#\*]* *(Modified work |MIT LICENSED )?Copyright ?(\([cC]\))? .*$')
-    disclaimer_re = re.compile('^ *\*? ?All [Rr]ights [Rr]eserved\.$')
-    email_re = re.compile('^.*<[\w\.-]*@[\w\.\-]*>$')
-    header_re = re.compile('^(\/\**!?)? ?[\-=\*]* ?(\*\/)?$')
-    tag_re = re.compile('^ *@?\(?([Ll]icense|MIT)\)?$')
-    url_re = re.compile('^ *[#\*]* *https?:\/\/[\w\.\/\-]+$')
+    copyright_re = re.compile(r'^ *[#\*]* *(Modified work |MIT LICENSED )?Copyright ?(\([cC]\))? .*$')
+    disclaimer_re = re.compile(r'^ *\*? ?All [Rr]ights [Rr]eserved\.$')
+    email_re = re.compile(r'^.*<[\w\.-]*@[\w\.\-]*>$')
+    header_re = re.compile(r'^(\/\**!?)? ?[\-=\*]* ?(\*\/)?$')
+    tag_re = re.compile(r'^ *@?\(?([Ll]icense|MIT)\)?$')
+    url_re = re.compile(r'^ *[#\*]* *https?:\/\/[\w\.\/\-]+$')
 
     lictext = []
     with open(licfile, 'r', errors='surrogateescape') as f:
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index d4b194f5679..ec9d510e233 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -137,15 +137,15 @@ class CmakeRecipeHandler(RecipeHandler):
         deps = []
         unmappedpkgs = []
 
-        proj_re = re.compile('project\s*\(([^)]*)\)', re.IGNORECASE)
-        pkgcm_re = re.compile('pkg_check_modules\s*\(\s*[a-zA-Z0-9-_]+\s*(REQUIRED)?\s+([^)\s]+)\s*\)', re.IGNORECASE)
-        pkgsm_re = re.compile('pkg_search_module\s*\(\s*[a-zA-Z0-9-_]+\s*(REQUIRED)?((\s+[^)\s]+)+)\s*\)', re.IGNORECASE)
-        findpackage_re = re.compile('find_package\s*\(\s*([a-zA-Z0-9-_]+)\s*.*', re.IGNORECASE)
-        findlibrary_re = re.compile('find_library\s*\(\s*[a-zA-Z0-9-_]+\s*(NAMES\s+)?([a-zA-Z0-9-_ ]+)\s*.*')
-        checklib_re = re.compile('check_library_exists\s*\(\s*([^\s)]+)\s*.*', re.IGNORECASE)
-        include_re = re.compile('include\s*\(\s*([^)\s]*)\s*\)', re.IGNORECASE)
-        subdir_re = re.compile('add_subdirectory\s*\(\s*([^)\s]*)\s*([^)\s]*)\s*\)', re.IGNORECASE)
-        dep_re = re.compile('([^ ><=]+)( *[<>=]+ *[^ ><=]+)?')
+        proj_re = re.compile(r'project\s*\(([^)]*)\)', re.IGNORECASE)
+        pkgcm_re = re.compile(r'pkg_check_modules\s*\(\s*[a-zA-Z0-9-_]+\s*(REQUIRED)?\s+([^)\s]+)\s*\)', re.IGNORECASE)
+        pkgsm_re = re.compile(r'pkg_search_module\s*\(\s*[a-zA-Z0-9-_]+\s*(REQUIRED)?((\s+[^)\s]+)+)\s*\)', re.IGNORECASE)
+        findpackage_re = re.compile(r'find_package\s*\(\s*([a-zA-Z0-9-_]+)\s*.*', re.IGNORECASE)
+        findlibrary_re = re.compile(r'find_library\s*\(\s*[a-zA-Z0-9-_]+\s*(NAMES\s+)?([a-zA-Z0-9-_ ]+)\s*.*')
+        checklib_re = re.compile(r'check_library_exists\s*\(\s*([^\s)]+)\s*.*', re.IGNORECASE)
+        include_re = re.compile(r'include\s*\(\s*([^)\s]*)\s*\)', re.IGNORECASE)
+        subdir_re = re.compile(r'add_subdirectory\s*\(\s*([^)\s]*)\s*([^)\s]*)\s*\)', re.IGNORECASE)
+        dep_re = re.compile(r'([^ ><=]+)( *[<>=]+ *[^ ><=]+)?')
 
         def find_cmake_package(pkg):
             RecipeHandler.load_devel_filemap(tinfoil.config_data)
@@ -423,16 +423,16 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 'makeinfo': 'texinfo',
                 }
 
-        pkg_re = re.compile('PKG_CHECK_MODULES\(\s*\[?[a-zA-Z0-9_]*\]?,\s*\[?([^,\]]*)\]?[),].*')
-        pkgce_re = re.compile('PKG_CHECK_EXISTS\(\s*\[?([^,\]]*)\]?[),].*')
-        lib_re = re.compile('AC_CHECK_LIB\(\s*\[?([^,\]]*)\]?,.*')
-        libx_re = re.compile('AX_CHECK_LIBRARY\(\s*\[?[^,\]]*\]?,\s*\[?([^,\]]*)\]?,\s*\[?([a-zA-Z0-9-]*)\]?,.*')
-        progs_re = re.compile('_PROGS?\(\s*\[?[a-zA-Z0-9_]*\]?,\s*\[?([^,\]]*)\]?[),].*')
-        dep_re = re.compile('([^ ><=]+)( [<>=]+ [^ ><=]+)?')
-        ac_init_re = re.compile('AC_INIT\(\s*([^,]+),\s*([^,]+)[,)].*')
-        am_init_re = re.compile('AM_INIT_AUTOMAKE\(\s*([^,]+),\s*([^,]+)[,)].*')
-        define_re = re.compile('\s*(m4_)?define\(\s*([^,]+),\s*([^,]+)\)')
-        version_re = re.compile('([0-9.]+)')
+        pkg_re = re.compile(r'PKG_CHECK_MODULES\(\s*\[?[a-zA-Z0-9_]*\]?,\s*\[?([^,\]]*)\]?[),].*')
+        pkgce_re = re.compile(r'PKG_CHECK_EXISTS\(\s*\[?([^,\]]*)\]?[),].*')
+        lib_re = re.compile(r'AC_CHECK_LIB\(\s*\[?([^,\]]*)\]?,.*')
+        libx_re = re.compile(r'AX_CHECK_LIBRARY\(\s*\[?[^,\]]*\]?,\s*\[?([^,\]]*)\]?,\s*\[?([a-zA-Z0-9-]*)\]?,.*')
+        progs_re = re.compile(r'_PROGS?\(\s*\[?[a-zA-Z0-9_]*\]?,\s*\[?([^,\]]*)\]?[),].*')
+        dep_re = re.compile(r'([^ ><=]+)( [<>=]+ [^ ><=]+)?')
+        ac_init_re = re.compile(r'AC_INIT\(\s*([^,]+),\s*([^,]+)[,)].*')
+        am_init_re = re.compile(r'AM_INIT_AUTOMAKE\(\s*([^,]+),\s*([^,]+)[,)].*')
+        define_re = re.compile(r'\s*(m4_)?define\(\s*([^,]+),\s*([^,]+)\)')
+        version_re = re.compile(r'([0-9.]+)')
 
         defines = {}
         def subst_defines(value):
diff --git a/scripts/oe-check-sstate b/scripts/oe-check-sstate
index 4187e774581..0d171c44632 100755
--- a/scripts/oe-check-sstate
+++ b/scripts/oe-check-sstate
@@ -53,7 +53,7 @@ def check(args):
             cmd = ['bitbake', '--dry-run', '--runall=build'] + args.target
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, env=env)
 
-            task_re = re.compile('NOTE: Running setscene task [0-9]+ of [0-9]+ \(([^)]+)\)')
+            task_re = re.compile(r'NOTE: Running setscene task [0-9]+ of [0-9]+ \(([^)]+)\)')
             tasks = []
             for line in output.decode('utf-8').splitlines():
                 res = task_re.match(line)
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 7412cc1f477..44ae40549ae 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -296,7 +296,7 @@ def package_info(args):
             extra = ''
             for line in f:
                 for var in vars:
-                    m = re.match(var + '(?::\S+)?:\s*(.+?)\s*$', line)
+                    m = re.match(var + r'(?::\S+)?:\s*(.+?)\s*$', line)
                     if m:
                         vals[var] = m.group(1)
             pkg_version = vals['PKGV'] or ''
diff --git a/scripts/opkg-query-helper.py b/scripts/opkg-query-helper.py
index bc3ab43823a..084d9ef6845 100755
--- a/scripts/opkg-query-helper.py
+++ b/scripts/opkg-query-helper.py
@@ -29,7 +29,7 @@ for arg in sys.argv[1:]:
         args.append(arg)
 
 # Regex for removing version specs after dependency items
-verregex = re.compile(' \([=<>]* [^ )]*\)')
+verregex = re.compile(r' \([=<>]* [^ )]*\)')
 
 pkg = ""
 ver = ""
diff --git a/scripts/patchtest-get-branch b/scripts/patchtest-get-branch
index b5fb2b0f04d..c6e242f8b68 100755
--- a/scripts/patchtest-get-branch
+++ b/scripts/patchtest-get-branch
@@ -16,7 +16,7 @@ import argparse
 import re
 import git
 
-re_prefix = re.compile("(\[.*\])", re.DOTALL)
+re_prefix = re.compile(r"(\[.*\])", re.DOTALL)
 
 def get_branch(filepath_repo, filepath_mbox, default_branch):
     branch = None
-- 
2.43.0


