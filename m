Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail.openembedded.org (Postfix) with ESMTP id C14DC7E97A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 19:34:19 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id e20so834825iob.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 12:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PgjmE+7fy177iYqm6T0xCPwCXswirMjicUQX9qrCZ2M=;
	b=lhGfrWjXtEiiQETUIvWlxgH4uUTqJ0wrNBo24w/WrfgZ6i8rfy4XOkyEvFPXA4egQQ
	ZaWmt4AOtlhzBC5kb3FR9/WE0Ec4ce97c77JDHe04AhgJ7hO27EJga7coLLmLDfdyOui
	74HCgAU7yIFkb3a/PNFf4bQ41ngWiCxkDAekpzNmD4H1wtShhkiX8wzTUTwE0Mr8ofZE
	NYlCpbgqoRMmdp7mEj4YgGK5rA5pgy5+yMkUPwypzc4vwiU71T0/F1nj7Qcx56c1FDfx
	1EsmWM+VgrefyciiKkrOdal9/ZVD5OBT1BltS+yoHrtLh2gcPBvgEJ00kN46OPv1imiT
	SIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PgjmE+7fy177iYqm6T0xCPwCXswirMjicUQX9qrCZ2M=;
	b=dneo8lsUA7+jNU4OdfUedbk/ojiJAF7ZUq4T9Hl6K7lxYDgJwQ75aqxXMfBe8Lj7Zj
	BMVKCXlHr8+f9kZGuhH7cnZHBdP7NRldj/r+68EcY98Qy41rZiNsHe/JgRVirv6us3bc
	nDy2D7sejA7GOCRsk6wlo//6I0seD+J0TZ6hF0pxkBvI6fn+J5MaeTvUGp3bbzmsurS2
	jX4mu/hIIf2pnXPcUubA37g7PZTjF1Wzkv0lAomDQsQlH4FesSkQNF6upK7FbEK+i7JZ
	DN0S5yWfCPZwawywqPfXf9pEt1bJ2dfiIBwRHEJrixyKzalX6QGKVcuVYPVziLKN+FsP
	h/wQ==
X-Gm-Message-State: APjAAAUNuWsRUhC3yuA4/cQuDB8aQUfV9A6elnp+0RPSHT2xrPLdeTFP
	sD6cWW7HyyXB3rhQZ5PbbzzMBttz
X-Google-Smtp-Source: APXvYqysmObXEY+ZMviEcYIu9vPcxMKUVx0VTp+uNNyDT+4Z2L6zKnfuGiz7dmAfrk+VznbiyMIUTw==
X-Received: by 2002:a6b:3943:: with SMTP id g64mr25498430ioa.225.1566934460690;
	Tue, 27 Aug 2019 12:34:20 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id 8sm47288ion.26.2019.08.27.12.34.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 12:34:20 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 14:33:48 -0500
Message-Id: <20190827193349.23254-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190827193349.23254-1-JPEWhacker@gmail.com>
References: <20190827193349.23254-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] oeqa: reproducible: Record packages in test results
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
X-List-Received-Date: Tue, 27 Aug 2019 19:34:21 -0000
Content-Transfer-Encoding: 8bit

Records the results of the reproducibility analysis in the JSON test
results file. This makes it easier to do post-test analysis on the
packages.

[YOCTO #13324]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 2b8b4e9e88e..ebfa88fbc55 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -8,6 +8,7 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 import functools
 import multiprocessing
 import textwrap
+import json
 import unittest
 
 MISSING = 'MISSING'
@@ -86,6 +87,7 @@ class ReproducibleTests(OESelftestTestCase):
         self.extras = self.tc.extraresults
 
         self.extras.setdefault('reproducible.rawlogs', {})['log'] = ''
+        self.extras.setdefault('reproducible', {}).setdefault('files', {})
 
     def append_to_log(self, msg):
         self.extras['reproducible.rawlogs']['log'] += msg
@@ -114,6 +116,10 @@ class ReproducibleTests(OESelftestTestCase):
         result.sort()
         return result
 
+    def write_package_list(self, package_class, name, packages):
+        self.extras['reproducible']['files'].setdefault(package_class, {})[name] = [
+                {'reference': p.reference, 'test': p.test} for p in packages]
+
     @unittest.skip("Reproducible builds do not yet pass")
     def test_reproducible_builds(self):
         capture_vars = ['DEPLOY_DIR_' + c.upper() for c in self.package_classes]
@@ -162,6 +168,10 @@ class ReproducibleTests(OESelftestTestCase):
 
                 self.append_to_log('\n'.join("%s: %s" % (r.status, r.test) for r in result.total))
 
+                self.write_package_list(package_class, 'missing', result.missing)
+                self.write_package_list(package_class, 'different', result.different)
+                self.write_package_list(package_class, 'same', result.same)
+
                 if result.missing or result.different:
                     self.fail("The following %s packages are missing or different: %s" %
                             (c, ' '.join(r.test for r in (result.missing + result.different))))
-- 
2.21.0


