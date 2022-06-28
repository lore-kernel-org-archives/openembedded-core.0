Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00324C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 08:32:43 +0000 (UTC)
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by mx.groups.io with SMTP id smtpd.web09.52899.1656405159328646514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 01:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=D2R1JoOx;
 spf=pass (domain: amazon.de, ip: 52.95.49.90,
 mailfrom: prvs=1712150ab=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1656405160; x=1687941160;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=d+tZTmYUGUjgdubIbI26U+3g1J+QMD4lVlLUmroDZGU=;
  b=D2R1JoOxrM0TRoUma1VzAXhxUnBof5UZgSZbirXY5/8lEpFPsx8rohjY
   Rjc6u+i9zrQKCY6aMYdGdAh5oUpyDAkVH2ko0EROI1zHUY4SsUjSNyzVU
   tIqCdH2gKlcBbWp4KY9AKTC/DKKZYIlfHjASeoG4J5UZ2ueOKqN7vymw2
   Y=;
X-IronPort-AV: E=Sophos;i="5.92,227,1650931200";
   d="scan'208";a="215829451"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-5feb294a.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP;
 28 Jun 2022 08:32:28 +0000
Received: from EX13D16EUA003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-pdx-2a-5feb294a.us-west-2.amazon.com (Postfix) with
 ESMTPS id 671AC84034
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 08:32:27 +0000 (UTC)
Received: from u182adcbddbfb55.ant.amazon.com (10.43.160.124) by
 EX13D16EUA003.ant.amazon.com (10.43.165.51) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Tue, 28 Jun 2022 08:32:25 +0000
From: Thomas Roos <throos@amazon.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] recipetool/devtool: Substitute expressions or whitespace from
 python egg requires.txt when generating PACKAGECONFIG
Date: Tue, 28 Jun 2022 10:32:14 +0200
Message-ID: <20220628083214.200152-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.43.160.124]
X-ClientProxiedBy: EX13D15UWB002.ant.amazon.com (10.43.161.9) To
 EX13D16EUA003.ant.amazon.com (10.43.165.51)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 08:32:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167334

Pysetuptools sees the uvicorn.egg-info/requires.txt as extra requirements.
Recipetool parses this information to generate the PACKAGECONFIG.
These extra requirements contain expressions and whitespace, which are not allowed in PACKGAGECONFIG.
This patch substitute them by hyphens to make PACKAGECONFIG parsable and readable.
Also adding an oe-selftest for this.

[YOCTO #14446]

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta/lib/oeqa/selftest/cases/devtool.py          | 15 ++++++++++++++-
 scripts/lib/recipetool/create_buildsys_python.py | 13 +++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3eea2b1a0e..ddf6c0c9f8 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -444,7 +444,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['S'] = '${WORKDIR}/MarkupSafe-%s' % testver
         checkvars['SRC_URI'] = url
         self._test_recipe_contents(recipefile, checkvars, [])
-
+     
     def test_devtool_add_fetch_git(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -544,6 +544,19 @@ class DevtoolAddTests(DevtoolBase):
         # Test devtool build
         result = runCmd('devtool build %s' % pn)
 
+    def test_devtool_add_python_egg_requires(self):
+        # Fetch source
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        testver = '0.14.0'
+        url = 'https://files.pythonhosted.org/packages/e9/9e/25d59f5043cf763833b2581c8027fa92342c4cf8ee523b498ecdf460c16d/uvicorn-%s.tar.gz' % testver
+        testrecipe = 'python3-uvicorn'
+        srcdir = os.path.join(tempdir, testrecipe)
+        # Test devtool add
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool add %s %s -f %s' % (testrecipe, srcdir, url))
+
 class DevtoolModifyTests(DevtoolBase):
 
     def test_devtool_modify(self):
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index f4f51c88b4..5686a62d3f 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -209,6 +209,18 @@ class PythonRecipeHandler(RecipeHandler):
                             continue
 
                         if line.startswith('['):
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
                             current_feature = line[1:-1]
                         elif current_feature:
                             extras_req[current_feature].append(line)
@@ -297,6 +309,7 @@ class PythonRecipeHandler(RecipeHandler):
                 lines_after.append('# The following configs & dependencies are from setuptools extras_require.')
                 lines_after.append('# These dependencies are optional, hence can be controlled via PACKAGECONFIG.')
                 lines_after.append('# The upstream names may not correspond exactly to bitbake package names.')
+                lines_after.append('# The configs are might not correct, since PACKAGECONFIG does not support expressions as may used in requires.txt - they are just replaced by text.')
                 lines_after.append('#')
                 lines_after.append('# Uncomment this line to enable all the optional features.')
                 lines_after.append('#PACKAGECONFIG ?= "{}"'.format(' '.join(k.lower() for k in extras_req)))
-- 
2.25.1




Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, USt-ID DE317013094





