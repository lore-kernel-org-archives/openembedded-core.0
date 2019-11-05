Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A5C657DAFC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 12:03:00 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c22so19831010wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 04:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jXj1KSZqb4R8hn7LurS2EC0R+8AotyKGfX3shMmfLzM=;
	b=dh9LUsC7qRVXC6iRMYkuCvoJrtXti1Rq6yByfn0zscZf7ZEMkfq54CBXm4mgIY6GHR
	QBKT+N2D2SPwb01DeN4nMdbjbQk+pHRI3pipjrQqEy66C9+b4a1YWv2UYxiCX3U6jk3/
	6GLtTVNiMIAESwmz6CmxATMlCzludq4MIoXUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jXj1KSZqb4R8hn7LurS2EC0R+8AotyKGfX3shMmfLzM=;
	b=TNFhyrh5k7njtClOxksCxpPjuoF7O+kMbSuMy+UW3iSi6pPLxqNVu9bqfKNWYshDVb
	HglrC9QijkjFxgEcBU+XQADahGxpQRlKzWFWtGd+YJCFAyNOxN7GtludJc9/En500RtH
	Y2iCF/WSQ3CkHNmA6KhndeFBMVpD9+11NnmZyTrBUcsLrvBDBW+ICM/UvN/CsNvlBxnd
	DudW9dCAXQkEtFiAtaRORDKncP0T/NfR+UCdTXR6JOLDaMahuI3R1C268do+eTgbNuE9
	OMZnj7pPCCDIPd+v916PzHnETt9Dk1BNJtZvizZHFk/VShyzPzmql1jOXTFU/DQoc8HU
	efkQ==
X-Gm-Message-State: APjAAAVrEu8rCnrN2oSwf0G6wuFItm/e46tdzFSVhW8+RpxVRItO85dc
	OE3XChiSOoMUt77RipBLRed0+fi6Pv4=
X-Google-Smtp-Source: APXvYqzuULC/UmWsPcL9JBfIKNjXlFP5QDO2QstZw5ir5QvPDDx+POnttuBzaRfVPify39z24faaFw==
X-Received: by 2002:a1c:a404:: with SMTP id n4mr3713459wme.135.1572955381062; 
	Tue, 05 Nov 2019 04:03:01 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f13sm20031359wrq.96.2019.11.05.04.03.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 04:03:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 12:02:59 +0000
Message-Id: <20191105120259.16152-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] selftest/signing: Fix test_locked_signatures to use a temporary layer
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
X-List-Received-Date: Tue, 05 Nov 2019 12:03:00 -0000
Content-Transfer-Encoding: 8bit

Tests shouldn't be writing to layers during tests as this could corrupt
other tests running in parallel.

Modify the test to write the bbappend to a separate temporary layer
which is added and removed by the test. This avoids race failures
on the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/signing.py | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 5c4e01b2c36..93b15ae6814 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -3,7 +3,7 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, create_temp_layer
 import os
 import oe
 import glob
@@ -185,8 +185,6 @@ class LockedSignatures(OESelftestTestCase):
         test_recipe = 'ed'
         locked_sigs_file = 'locked-sigs.inc'
 
-        self.add_command_to_tearDown('rm -f %s' % os.path.join(self.builddir, locked_sigs_file))
-
         bitbake(test_recipe)
         # Generate locked sigs include file
         bitbake('-S none %s' % test_recipe)
@@ -198,16 +196,23 @@ class LockedSignatures(OESelftestTestCase):
         # Build a locked recipe
         bitbake(test_recipe)
 
+        templayerdir = tempfile.mkdtemp(prefix='signingqa')
+        create_temp_layer(templayerdir, 'selftestsigning')
+        runCmd('bitbake-layers add-layer %s' % templayerdir)
+
         # Make a change that should cause the locked task signature to change
         # Use uuid so hash equivalance server isn't triggered
         recipe_append_file = test_recipe + '_' + get_bb_var('PV', test_recipe) + '.bbappend'
-        recipe_append_path = os.path.join(self.testlayer_path, 'recipes-test', test_recipe, recipe_append_file)
+        recipe_append_path = os.path.join(templayerdir, 'recipes-test', test_recipe, recipe_append_file)
         feature = 'SUMMARY_${PN} = "test locked signature%s"\n' % uuid.uuid4()
 
-        os.mkdir(os.path.join(self.testlayer_path, 'recipes-test', test_recipe))
+        os.mkdir(os.path.join(templayerdir, 'recipes-test'))
+        os.mkdir(os.path.join(templayerdir, 'recipes-test', test_recipe))
         write_file(recipe_append_path, feature)
 
-        self.add_command_to_tearDown('rm -rf %s' % os.path.join(self.testlayer_path, 'recipes-test', test_recipe))
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % templayerdir)
+        self.add_command_to_tearDown('rm -f %s' % os.path.join(self.builddir, locked_sigs_file))
+        self.add_command_to_tearDown('rm -rf %s' % templayerdir)
 
         # Build the recipe again
         ret = bitbake(test_recipe)
-- 
2.20.1


