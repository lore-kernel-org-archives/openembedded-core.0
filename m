Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BA0C3DA4B
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 13:36:24 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.15316.1721223378706953774
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 06:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qr2LjHNZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4266fcb311cso48591685e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 06:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721223377; x=1721828177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F5ErRJXACYh507BdMexsppQFtSNSUKZmlNCfaPdh4/k=;
        b=Qr2LjHNZuVGASlyRsPSxIZtO4vTNhiYcNoe/Kd7CYJvgdaR4z2Br800N+y0LXNNuOG
         OE1FrsUl/cbcPq/DHnf1kBy1J026uXexGcz6Se5BkC3Yhg0kaidS4abKfBay80xxH3o/
         XSeEgaqoqlFjbzXCeDd/iZdXUDLKJNQEgi6wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721223377; x=1721828177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F5ErRJXACYh507BdMexsppQFtSNSUKZmlNCfaPdh4/k=;
        b=DOcD2t54/2vqccdMc1nLEOMuoxEouj3klDkSVt3sAcd5ADyqEYF6JMnbKNOdCIkAVJ
         EwZ1wZTebx7S3URNPDpgElN6ZOVRuVdHW+gyq2Ok/GxrQVDxb2r8k5tIdIfZ3udTZuHD
         hWKdJzFnxI4w6B/UUhiLNxv5UGUnOSwynQiT3ULqJ2T6F6+V8HSHWmg02rx01dOQmJpk
         oOuepKg3ovZtvEA3tSf2sbDFP8LLCIo4kq+pVD7X21mcGX8BcuyFWdn/MzCRktqTXTCY
         Pqx9LYNU7Tc+2VG4MHMmAV/jIjAOC39PjRg20yAJnxiLKAAGU7ToHmy2bQfhUv1vwaQh
         cDHg==
X-Gm-Message-State: AOJu0YyEBKDgx2eLViBMiRJCbT7zmuy9wO/KyLuNeKG+DOItyL0D+kIZ
	NbLTnwsaNJ2EnS0W82i6o08TSLNejva1YeCxqL23sS+WAiGaPoi5VmMM0AbZn7iwawdnsFtudJw
	8
X-Google-Smtp-Source: AGHT+IE/O0KSQvQUyvMxf0/I8RfVs2TQwLwt+w3GkzeYX100IOizTjmTRwABmnqBDv7am9DcwJNF3g==
X-Received: by 2002:a05:600c:1547:b0:426:593c:9351 with SMTP id 5b1f17b1804b1-427c2cc9965mr13502945e9.6.1721223376960;
        Wed, 17 Jul 2024 06:36:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9a16:3e6:efff:89c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427ba20beffsm45016785e9.0.2024.07.17.06.36.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 06:36:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/postactions: Separate artefact collection from test result collection
Date: Wed, 17 Jul 2024 14:36:15 +0100
Message-ID: <20240717133615.3601414-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 13:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202165

Combining the test result collection and artefact collection hasn't worked out
well as the data has different life cycles, the artefacts can be large and
we need to be able to clean them up on a different timescale.

Separate them out to be controlled by a separate variable, OEQA_ARTEFACT_DIR.
Also rework the code to inject a directory with a date/time and random component
to allow builds to run in parallel. Pass function arguments to avoid re-reading
variables.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/__init__.py    |  8 ++++-
 meta/lib/oeqa/utils/postactions.py | 53 ++++++++++++++----------------
 2 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index 53bdcbf2661..e03f7e33bb0 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -96,4 +96,10 @@ def get_json_result_dir(d):
     custom_json_result_dir = d.getVar("OEQA_JSON_RESULT_DIR")
     if custom_json_result_dir:
         json_result_dir = custom_json_result_dir
-    return json_result_dir
\ No newline at end of file
+    return json_result_dir
+
+def get_artefact_dir(d):
+    custom_json_result_dir = d.getVar("OEQA_ARTEFACT_DIR")
+    if custom_json_result_dir:
+        return custom_json_result_dir
+    return os.path.join(d.getVar("LOG_DIR"), 'oeqa-artefacts')
diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index 15f423218eb..2de2d18328e 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -7,23 +7,20 @@
 # Run a set of actions after tests. The runner provides internal data
 # dictionary as well as test context to any action to run.
 
-from oeqa.utils import get_json_result_dir
-
-def create_artifacts_directory(d, tc):
-    import shutil
-
-    local_artifacts_dir = os.path.join(get_json_result_dir(d), "artifacts")
-    if os.path.isdir(local_artifacts_dir):
-        shutil.rmtree(local_artifacts_dir)
-
-    os.makedirs(local_artifacts_dir)
+import datetime
+import io
+import os
+import stat
+import subprocess
+import tempfile
+from oeqa.utils import get_artefact_dir
 
 ##################################################################
 # Host/target statistics
 ##################################################################
 
-def get_target_disk_usage(d, tc):
-    output_file = os.path.join(get_json_result_dir(d), "artifacts", "target_disk_usage.txt")
+def get_target_disk_usage(d, tc, artifacts_list, outputdir):
+    output_file = os.path.join(outputdir, "target_disk_usage.txt")
     try:
         (status, output) = tc.target.run('df -h')
         with open(output_file, 'w') as f:
@@ -32,10 +29,10 @@ def get_target_disk_usage(d, tc):
     except Exception as e:
         bb.warn(f"Can not get target disk usage: {e}")
 
-def get_host_disk_usage(d, tc):
+def get_host_disk_usage(d, tc, artifacts_list, outputdir):
     import subprocess
 
-    output_file = os.path.join(get_json_result_dir(d), "artifacts", "host_disk_usage.txt")
+    output_file = os.path.join(outputdir, "host_disk_usage.txt")
     try:
         with open(output_file, 'w') as f:
             output = subprocess.run(['df', '-hl'], check=True, text=True, stdout=f, env={})
@@ -61,25 +58,20 @@ def get_artifacts_list(target, raw_list):
 
     return result
 
-def retrieve_test_artifacts(target, artifacts_list, target_dir):
-    import io, subprocess
-    local_artifacts_dir = os.path.join(target_dir, "artifacts")
+def list_and_fetch_failed_tests_artifacts(d, tc, artifacts_list, outputdir):
+    artifacts_list = get_artifacts_list(tc.target, artifacts_list)
+    if not artifacts_list:
+        bb.warn("Could not load artifacts list, skip artifacts retrieval")
+        return
     try:
         cmd = "tar zcf - " + " ".join(artifacts_list)
-        (status, output) = target.run(cmd, raw = True)
+        (status, output) = tc.target.run(cmd, raw = True)
         if status != 0 or not output:
             raise Exception("Error while fetching compressed artifacts")
-        p = subprocess.run(["tar", "zxf", "-", "-C", local_artifacts_dir], input=output)
+        p = subprocess.run(["tar", "zxf", "-", "-C", outputdir], input=output)
     except Exception as e:
         bb.warn(f"Can not retrieve {artifact_path} from test target: {e}")
 
-def list_and_fetch_failed_tests_artifacts(d, tc):
-    artifacts_list = get_artifacts_list(tc.target, d.getVar("TESTIMAGE_FAILED_QA_ARTIFACTS"))
-    if not artifacts_list:
-        bb.warn("Could not load artifacts list, skip artifacts retrieval")
-    else:
-        retrieve_test_artifacts(tc.target, artifacts_list, get_json_result_dir(d))
-
 
 ##################################################################
 # General post actions runner
@@ -91,12 +83,17 @@ def run_failed_tests_post_actions(d, tc):
     if not artifacts:
         return
 
+    outputdir = get_artefact_dir(d)
+    os.makedirs(outputdir, exist_ok=True)
+    datestr = datetime.datetime.now().strftime('%Y%m%d')
+    outputdir = tempfile.mkdtemp(prefix='oeqa-target-artefacts-%s-' % datestr, dir=outputdir)
+    os.chmod(outputdir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
+
     post_actions=[
-        create_artifacts_directory,
         list_and_fetch_failed_tests_artifacts,
         get_target_disk_usage,
         get_host_disk_usage
     ]
 
     for action in post_actions:
-        action(d, tc)
+        action(d, tc, artifacts, outputdir)

