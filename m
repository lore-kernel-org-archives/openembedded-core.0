Return-Path: <erik.boto@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id E2F5F75544
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 09:20:32 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id o18-v6so1840500wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 02:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7HP5tZUOTf2BALr9GJWb3HZ4wtrVsA1HCE8wjU+FltI=;
	b=lsk2MbtlIi3crV1u0DiKhQyeez6epjM1JoPDwKC1htS88JxgF1EToDSIQrkSltnuoK
	isz9hjkcSZJv7zZEffbKK3vrmUwHjycQnY7mjdHm/uw/aqxdqwECx+VuGJm+yHN1fI5H
	j99DD+PrVIv/2NRQD5AD0z6GSL6eCeJ7g1h1DXDXk0U/YAeiHfUJKd1wyi6kS0IrYUq3
	8c+dtYfWfC5+wjjeWG8j2cHL3OO9uJI1SQI37n6KkLP91U1+W+7a09oHN12gWQ9IjTAA
	gvoXv6xExh6uqnHqwsopegW7rMQmV/ErSVgbPD3txRlvgfdwt/YjMv0rxd3oMwRqAll7
	U3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7HP5tZUOTf2BALr9GJWb3HZ4wtrVsA1HCE8wjU+FltI=;
	b=lx8CDoY5pMidsQrk/otZgfiOoFFvXSgNc/3mhqmLuvIGrBje600HH0fEJKCeUxo192
	5M52SxJmTn/DhrzDQLPXhVJwSeQjf84ZO3Lc1d7AxStGGRD+IFnw9Wtr0u2buoaQARVJ
	r3SGitij6yeoMdGryQVaOPGJO+1D/lwp9Yd/bZg2E/rONVFOSzktgRrLexn/dFCFYHL/
	vin5DHspkw9rnTzouu0sX9LM7wW6pYV9XNtCBQWVRlkS2IfxyJh6GgKbp3Mk6IArVi65
	HWPwertyOwU2TXvubp87rg05yDtLaDWcuboLPId07719T/1Gb2sqBKMkf72pjtLpztVk
	e4pg==
X-Gm-Message-State: APzg51BnA8fiBaUvxijzuSOmksbZrKCFpk3PxqkFlVwYNv/+3WnnzjN0
	A2QZn5GpnfTmU1iPeSlRMchaAbab
X-Google-Smtp-Source: ANB0Vdb2nJMyS3SQNrHz3ZaVH0Zo9B6c/f0YTkbE8pMQ9BRjW2s6PFtlcsHcQWtZBawTNJlPlNGNDQ==
X-Received: by 2002:a1c:b49:: with SMTP id
	70-v6mr13816199wml.149.1537262433140; 
	Tue, 18 Sep 2018 02:20:33 -0700 (PDT)
Received: from debbie.luxoft.com ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	132-v6sm1432727wmd.13.2018.09.18.02.20.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Sep 2018 02:20:32 -0700 (PDT)
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 11:20:19 +0200
Message-Id: <20180918092019.14722-1-erik.boto@gmail.com>
X-Mailer: git-send-email 2.19.0.rc1
MIME-Version: 1.0
Subject: [PATCH] testexport: Add support for testcase utils
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
X-List-Received-Date: Tue, 18 Sep 2018 09:20:33 -0000
Content-Transfer-Encoding: 8bit

Add the possibility to ship a lib/oeqa/runtime/cases/utils directory
that will be included in the generated testexport tarball.

This makes it easier to split common functionality from test suites
into modules that can be imported from multiple test suites.
---
 meta/classes/testexport.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index d070f07afa..e67e5842d6 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -74,6 +74,21 @@ def testexport_main(d):
 
     copy_needed_files(d, tc)
 
+def get_runtime_cases_utils_paths(d):
+    """
+    Returns a list of paths where testcase utils must reside. Utils can be e.g.
+    common functionality used by multiple test cases.
+
+    Testcase utils are expected in <LAYER_DIR>/lib/oeqa/runtime/cases/utils/
+    """
+    paths = []
+
+    for layer in d.getVar('BBLAYERS').split():
+        path = os.path.join(layer, 'lib/oeqa/runtime/cases/utils')
+        if os.path.isdir(path):
+            paths.append(path)
+    return paths
+
 def copy_needed_files(d, tc):
     import shutil
     import oe.path
@@ -108,6 +123,8 @@ def copy_needed_files(d, tc):
         else:
             shutil.copy2(src, dst)
 
+
+
     # Remove cases and just copy the ones specified
     cases_path = os.path.join(export_path, 'lib', 'oeqa', 'runtime', 'cases')
     oe.path.remove(cases_path)
@@ -121,6 +138,15 @@ def copy_needed_files(d, tc):
         if json_file:
             shutil.copy2(json_file, cases_path)
 
+
+    # Copy cases/utils provided by layers
+    utils_dest_path = os.path.join(export_path, 'lib', 'oeqa', 'runtime', 'cases', 'utils')
+    utils_source_paths = get_runtime_cases_utils_paths(d)
+
+    for f in utils_source_paths:
+        if os.path.isdir(f):
+            oe.path.copytree(f, utils_dest_path)
+
     # Copy test data
     image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
                             d.getVar('IMAGE_LINK_NAME')))
-- 
2.19.0.rc1


