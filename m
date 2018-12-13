Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id B21BF79E2A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:44 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id h3so1750107pfg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WHyT+tPIzSBSNQ+xjds9j//QFIDsgYWqfMbGLRizSgo=;
	b=Mdd5JTPehAIKxMFL3kYlocwdianIQiFQeRqgmnXtReYH3YspfIAYTuRqFmq18LevN7
	pHemammzuhQ/L6e1NlC+d5X5IrWC8v7wQ9Yy6CgACxyUE2sP4dEyHQ8S6dxuyUijDboP
	WhT1BLkXR/oryowpqPTK2LMMRgYUy4eazOa0RLG9IxwVpsxC9wn4KEfVjyO/4yRNjZZw
	cOOelty5+yfhxLyeDWC3Bb3YCfa+ELiYupY68yR/oSymje/BNAzT7nF/grsXnK2ses7V
	YhMiHpOcUSTyrC9C6ZjnFY1bt64zTZomSJL0tmxUj50qBsJYB6MLjgyc0dDdRuKZ/IbJ
	2UVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WHyT+tPIzSBSNQ+xjds9j//QFIDsgYWqfMbGLRizSgo=;
	b=KuB+TkwGbXw4/QGt9moZRIyXukb73wnlKcXOGKOMeL1tt1jEXnZv5gQGSZwCCTBVrr
	ili/lFP5NPYdZaYUD5qN8gM0bOB4mY4rv/T4dX7QuYfKVEp1K92L8ZmWPSRaLYpcCCPK
	rDvKuODUgSffJ60UE0HowJIMoANe9UYGcs77SwFq8XFP5s2x3n1RAs8zyJ717UDZo3UD
	TdCdI8xlFY8tIO+U1D5J6l2gy0cHsrWyx1fssFDI270wUy4/Vo3PCI2JAx2FnWqqSt7V
	qiwwTTaO6aNZEtLhrEfyDjdO/rQB8FabUWTGsI4AixV0yliTT1W3z3btjCfoF3hP3+3J
	6lKg==
X-Gm-Message-State: AA+aEWYN3Ip499sOZDtBVHUb8JecW29xGwXamQ8mEeRiHfCfz4bGc9cB
	RSyYE9ej2x9vvhgU2MyeGdRDCIE/
X-Google-Smtp-Source: AFSGD/Vj21hTC+8WtgJ/guKQtrzcWhimxFDKAgNz/LOtfFP8MOzyKqrB2x1hCLAZXgWJm2NCH5/29w==
X-Received: by 2002:a63:4c04:: with SMTP id z4mr426680pga.312.1544737185800;
	Thu, 13 Dec 2018 13:39:45 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:45 -0800
Message-Id: <10e01925ac974eba179de1a4d1919c274102fbc4.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 37/45] testsdk.bbclass: write testresult to json files
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:45 -0000

From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

As part of the solution to replace Testopia to store testresult,
OEQA sdk and sdkext need to output testresult into json files, where
these json testresult files will be stored into git repository
by the future test-case-management tools.

By default, json testresult file will be written to "oeqa"
directory under the "WORKDIR" directory.

To configure multiple instances of bitbake to write json testresult
to a single testresult file at custom directory, user will define
the variable "OEQA_JSON_RESULT_DIR" with the custom directory for
json testresult.

(From OE-Core rev: eefb07907873d20f2e66d3784106f6f72030b5b2)

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testsdk.bbclass | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 103cc56..66170e3 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -14,6 +14,30 @@
 #
 # where "<image-name>" is an image like core-image-sato.
 
+def _get_sdk_configuration(d, test_type, pid):
+    import platform
+    configuration = {'TEST_TYPE': test_type,
+                    'PROCESS_ID': pid,
+                    'SDK_MACHINE': d.getVar("SDKMACHINE"),
+                    'IMAGE_BASENAME': d.getVar("IMAGE_BASENAME"),
+                    'IMAGE_PKGTYPE': d.getVar("IMAGE_PKGTYPE"),
+                    'HOST_DISTRO': ('-'.join(platform.linux_distribution())).replace(' ', '-')}
+    layers = (d.getVar("BBLAYERS") or "").split()
+    for l in layers:
+        configuration['%s_BRANCH_REV' % os.path.basename(l)] = '%s:%s' % (base_get_metadata_git_branch(l, None).strip(),
+                                                                          base_get_metadata_git_revision(l, None))
+    return configuration
+
+def _get_sdk_json_result_dir(d):
+    json_result_dir = os.path.join(d.getVar("WORKDIR"), 'oeqa')
+    custom_json_result_dir = d.getVar("OEQA_JSON_RESULT_DIR")
+    if custom_json_result_dir:
+        json_result_dir = custom_json_result_dir
+    return json_result_dir
+
+def _get_sdk_result_id(configuration):
+    return '%s_%s_%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'], configuration['SDK_MACHINE'])
+
 def testsdk_main(d):
     import os
     import subprocess
@@ -69,8 +93,10 @@ def testsdk_main(d):
 
         component = "%s %s" % (pn, OESDKTestContextExecutor.name)
         context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
-
-        result.logDetails()
+        configuration = _get_sdk_configuration(d, 'sdk', os.getpid())
+        result.logDetails(_get_sdk_json_result_dir(d),
+                          configuration,
+                          _get_sdk_result_id(configuration))
         result.logSummary(component, context_msg)
 
         if not result.wasSuccessful():
@@ -172,8 +198,10 @@ def testsdkext_main(d):
 
         component = "%s %s" % (pn, OESDKExtTestContextExecutor.name)
         context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
-
-        result.logDetails()
+        configuration = _get_sdk_configuration(d, 'sdkext', os.getpid())
+        result.logDetails(_get_sdk_json_result_dir(d),
+                          configuration,
+                          _get_sdk_result_id(configuration))
         result.logSummary(component, context_msg)
 
         if not result.wasSuccessful():
-- 
2.7.4


