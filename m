Return-Path: <anibal.limon@linaro.org>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id F146D79B29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 23:00:47 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id u6-v6so10657764plz.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 16:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dor5KBE0yFJCC2LlS6kG6gIwWlmsRORXfdirHAVO/m4=;
	b=DYUlyvv3TxT2x5ZrTWNEMdOXYCtzjw5W0WU3ZatYKAJuBfrvQ9yt5JGobTQrnkl20J
	Uwt67pVwueMINs7XNqhdcU2DATw/ZMWUtrnodw3cmwbrcRs45dAeHpT1g4vGXFEKWkNH
	XpuQpkY7cLOKe0DADy0Vt4+Vfuu0Ke5wqglQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dor5KBE0yFJCC2LlS6kG6gIwWlmsRORXfdirHAVO/m4=;
	b=KOOl6l1vMbYMBSnZfDVzh0VniMCL8UqW85tbbgTWVlImI9Vxasic8sKzpVXEQVZ5NM
	LZGErk0UkvXx0L+e0Chr6vE9kJLPqjklcjPS9OLbvb/PGfY+wnoTTnfU3zMaAMj5Q8WI
	NGdRkSAK1RizjDt8HhAupJTUTFUStoQViJX+NhEB8Y8WZwdpAHCEYSKsSe1MEoZc7OsT
	Lfq9DmTwQiwuCGuohFzuNkF3JRq88PsrM4y+ZJ+jSZLYsmD4yRi7Bi00wc+QZg7lpZOY
	Aak9LufrmcBI8w6dlTnFHRGRyZAmuZFNmlg3+6JxtalfWSIaVh6MM423XGbP9foCxM12
	RjOg==
X-Gm-Message-State: ABuFfoipAEstephVDhfiIYR8akBBwBumZ5bvC9VmSvB/wqXnd0Owywqf
	6nZ/ERj+Z/FMJC4jwe2+vQestNxN7oM=
X-Google-Smtp-Source: ACcGV63XmwVEm0lIaakAqUiKdlGTVCHcIfEpJmoA84h81JPhMOOoU4cGzXvQSEpMhiJb15vIeg9iBg==
X-Received: by 2002:a17:902:7b84:: with SMTP id
	w4-v6mr26809847pll.32.1539817248651; 
	Wed, 17 Oct 2018 16:00:48 -0700 (PDT)
Received: from blackbox.Home ([200.68.141.5]) by smtp.gmail.com with ESMTPSA id
	i71-v6sm26467929pgc.87.2018.10.17.16.00.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 16:00:48 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 18:00:43 -0500
Message-Id: <20181017230044.24098-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 1/2] meta/classes/testexport: Use manfiest filenames for package and testdata
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
X-List-Received-Date: Wed, 17 Oct 2018 23:00:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Is clear to know for what image and machine the testexport package
manifest and testdata was build.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/classes/testexport.bbclass  | 4 ++--
 meta/lib/oeqa/runtime/context.py | 9 +++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index d070f07afa..8b01504d3a 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -128,8 +128,8 @@ def copy_needed_files(d, tc):
     tdname = "%s.testdata.json" % image_name
     test_data_path = os.path.join(export_path, 'data')
     bb.utils.mkdirhier(test_data_path)
-    shutil.copy2(image_manifest, os.path.join(test_data_path, 'manifest'))
-    shutil.copy2(tdname, os.path.join(test_data_path, 'testdata.json'))
+    shutil.copy2(image_manifest, os.path.join(test_data_path, os.path.basename(image_manifest)))
+    shutil.copy2(tdname, os.path.join(test_data_path, os.path.basename(tdname)))
 
     # Create tar file for common parts of testexport
     create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR"))
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index a7f3823996..31dba75784 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -2,6 +2,7 @@
 # Released under the MIT license (see COPYING.MIT)
 
 import os
+import glob
 
 from oeqa.core.context import OETestContext, OETestContextExecutor
 from oeqa.core.target.ssh import OESSHTarget
@@ -42,11 +43,15 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     default_cases = os.path.join(os.path.abspath(os.path.dirname(__file__)),
             'cases')
     default_data = None
-    default_test_data = 'data/testdata.json'
+    m = glob.glob('data/*.testdata.json')
+    if m:
+        default_test_data = m[0]
     default_tests = ''
 
     default_target_type = 'simpleremote'
-    default_manifest = 'data/manifest'
+    m = glob.glob('data/*.manifest')
+    if m:
+        default_manifest = m[0]
     default_server_ip = '192.168.7.1'
     default_target_ip = '192.168.7.2'
     default_host_dumper_dir = '/tmp/oe-saved-tests'
-- 
2.11.0


