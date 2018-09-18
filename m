Return-Path: <erik.boto@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0F31B75544
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 09:36:37 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id a108-v6so1295198wrc.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 02:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tgkhHTD+yV6eylcYHDmZACOuUPzVFrnw6DpNB/AN9xs=;
	b=tok3bczTqoL7KA5kCaLoy/eyBLjBwnk1lyLuAShfCy7LmMNkECC59xFcmjPAKjwWWZ
	aegYRDaZiO0Aug3r81vSRDpxDKK6/QDRQm00M7PAx6gpVUBu0qpYxZ0WSMyaWmmFJ35y
	9YnUBaPtqstEldYWR1bhE5c1nHrGQWWWGCkd9SrmZUo0HaGJYqjtfULa3r+bOwC758Q0
	AglNwDIfui/uPDVICzwiEnEjTyPEh3Hq+8GEBf5hzJ6BI2qnwXAdAzofE97WpblVmqoz
	RVbUUw6/XrELRlGjoHeGC6UjJ65kdsAWaYeY5rv8QWxdu5enPdImaSfuqK+bCJbQ8Xug
	46AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tgkhHTD+yV6eylcYHDmZACOuUPzVFrnw6DpNB/AN9xs=;
	b=dKtvaKhn4nwfa8iY6an2ilRNxQ02q+6VdWI0FGnXTw8SlmvoVCF00wZqgmLLlgtvvw
	CNmOyEAsLENCOszcmgIJIIbYa/A4XWqgyUvLP3gHxWIhF1wSO8pFuPe9Wkg1vAYCE+DP
	7Buj54hcQorljeMq4wT6yE7zn+2MYbUc2Lx7mqyKAUZfV6eQ3YykJj4qTFi3+Y18Hag2
	VG4PoBQLI9EiMjPwf9KQBUv6d0JOi9BNgB1OtjxftL6LiORy6GACYtvYSENbP+MaVS8e
	CZpdpf/tOJXTdRehvmkYXPVtwK3jMerLJpS7LjnykumM5T6NfofaWmfaewei0tbPC3Sx
	2jEA==
X-Gm-Message-State: APzg51B0TmgT8f/PB8KrTXcqNGH7yjLciKL+XU2eo5e4JfLjSwxNTGUd
	Bb4RMtU7xZxQcVh6t31Wo3cJLohv
X-Google-Smtp-Source: ANB0VdYNzK9ayQ/x+O13F5wr020ire0v5j4AkQjtBC2JdUlLVFvTkjtQ9zoZQ5pcobnceOIn3wS/tA==
X-Received: by 2002:adf:ed88:: with SMTP id
	c8-v6mr22739077wro.264.1537263398385; 
	Tue, 18 Sep 2018 02:36:38 -0700 (PDT)
Received: from debbie.luxoft.com ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	h73-v6sm4972438wma.11.2018.09.18.02.36.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Sep 2018 02:36:37 -0700 (PDT)
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 11:36:30 +0200
Message-Id: <20180918093630.16280-1-erik.boto@gmail.com>
X-Mailer: git-send-email 2.19.0.rc1
MIME-Version: 1.0
Subject: [PATCHv2] testexport: Add support for testcase utils
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
X-List-Received-Date: Tue, 18 Sep 2018 09:36:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the possibility to ship a lib/oeqa/runtime/cases/utils directory
that will be included in the generated testexport tarball.

This makes it easier to split common functionality from test suites
into modules that can be imported from multiple test suites.

Signed-off-by: Erik Botö <erik.boto@gmail.com>
---
 meta/classes/testexport.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index d070f07afa..790ca3aff0 100644
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
@@ -121,6 +136,14 @@ def copy_needed_files(d, tc):
         if json_file:
             shutil.copy2(json_file, cases_path)
 
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


