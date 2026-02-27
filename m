Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042ACFD9E31
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 02:24:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86671.1772159064887101980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 18:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZJcVowqg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6518253275=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2NJCc3669190
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 02:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=xKsEy3QyW2p/2vJKk0WSRLT26E4JG7KY+DxS2n2A9LI=; b=ZJcVowqgtLaE
	xKCrVMBfoasxu6J7YEobzLjdn2aQrHIUKzuVikM885p6j0K8jWKJb81cTRSvozAw
	5xc3DOUP5/Wn8MLdI038jSssGZ0EEe7Onbtt4jR47rzDSkOloWfS5gSsHdXnAf7K
	GEzXvSYArUPVYNeVtcmbF66GsntnTar5vuDdlsP4Wuwh4djIxx1z8O08LptEByDx
	/WJhdHN53IMAXGqjQKRP4fZJm8BeTy2FsItjxZkG1Sj9LH/jxelu47U+zisjWT74
	74frJEjjn91DjOtvTMclzEHGSD8W6jT2UO2QGA6dCFeNMGgusYdgUuFqt7L+JVkd
	yymMv9tusA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdvdsceu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 02:24:23 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 26 Feb 2026 18:24:21 -0800
Received: from oak-lpgbuild14.wrs.com (10.66.9.59) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 26 Feb 2026 18:24:21 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH V3 2/2] oeqa/selftest/sdk: add test_sdk_runqemu
Date: Fri, 27 Feb 2026 02:24:21 +0000
Message-ID: <20260227022421.4072802-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227022421.4072802-1-Qi.Chen@windriver.com>
References: <20260227022421.4072802-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAxOCBTYWx0ZWRfXxDvyskaSgeAs
 uD/AXcKS8OYyLM3XA8YJwymeUl1xSdAGgsh/zBV77xG9REDYRmG1eZL8VJjOWioia34vZ/5Ju4R
 HQ7WtLyZnJwqEzBTtL+PnxIVxDYJCDaapW21eVhn9751AkmyiX8w3v46Tce6i5e08C3RlxkBXjI
 AHJcJxPkSe7i+1ulgVVjcX3Y8qNnlAE9bmOvMKevVGL7yfKllkVmt1WnLi342ZAzoy/A67NfwSs
 dlPFI+ePjpTEw/ct1lZc0cqX2bpy1H018CwkHAqhBQhNXdPmVYoeFta24CQiMigcIFwIqcD5NhA
 TB2YeT+oXEiEC5YmfHxhkU/MdZSxRsxvtfQYJOKLDgQ5phBXEJ89PgUEiDPDU9cdmQrmm78zrNq
 dt+Lfbx35yO0IPi+FJ2HxPAI3I4egiVffxzj5c96PbG/MdhPyU+fAZKC8OScwvVuU4wGHm4EgnR
 4QIw19CpVc9IlFgZnxQ==
X-Proofpoint-GUID: 5D94nMTnNw4BKcNJEkHGwDj_IeAYtRmv
X-Authority-Analysis: v=2.4 cv=UKzQ3Sfy c=1 sm=1 tr=0 ts=69a10057 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8 a=2V6DY6BgAAAA:8
 a=QklhIAnghPIZTLOfvdoA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ldqKKs2zR4t-S6fqr-1n:22
X-Proofpoint-ORIG-GUID: 5D94nMTnNw4BKcNJEkHGwDj_IeAYtRmv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 02:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232074

From: Chen Qi <Qi.Chen@windriver.com>

Add test case to ensure runqemu works in SDK.

Using runqemu from SDK has been supported for many years. Add a
test case to ensure we have no regression.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/sdk.py | 88 ++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/sdk.py b/meta/lib/oeqa/selftest/cases/sdk.py
index 3971365029..ee1e4ca420 100644
--- a/meta/lib/oeqa/selftest/cases/sdk.py
+++ b/meta/lib/oeqa/selftest/cases/sdk.py
@@ -4,7 +4,13 @@
 # SPDX-License-Identifier: MIT
 #
 
-import os.path
+import os
+import shutil
+import subprocess
+import glob
+import time
+import select
+from tempfile import TemporaryDirectory
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_vars
@@ -37,3 +43,83 @@ IMAGE_INSTALL:append = " selftest-hello"
         path = os.path.join(vars["SDK_DEPLOY"], vars["TOOLCHAIN_OUTPUTNAME"] + ".target.manifest")
         self.assertNotEqual(os.path.getsize(path), 0, msg="Target manifest is empty")
         self.assertIn("selftest-hello", self.load_manifest(path))
+
+    def test_sdk_runqemu(self):
+        """Test using runqemu from SDK which has no bitbake available"""
+
+        def path_with_no_bitbake():
+            orig_paths = os.environ["PATH"].split(":")
+            new_paths = []
+            for orig_path in orig_paths:
+                if not os.access(os.path.join(orig_path, "bitbake"), os.X_OK):
+                    new_paths.append(orig_path)
+            return ":".join(new_paths)
+
+        def runqemu_works_from_sdk(sdk_dir, sdk_env, machine, path, timeout=360):
+            env = os.environ.copy()
+            env["PATH"] = path
+
+            cmd = f'cd {sdk_dir}; . {sdk_env}; runqemu {machine} snapshot slirp nographic'
+            self.logger.info(f"Running {cmd}")
+            proc = subprocess.Popen(
+                ['bash', '-c', cmd],
+                stdout=subprocess.PIPE,
+                stderr=subprocess.STDOUT,
+                text=True,
+                bufsize=1,
+                env=env
+            )
+            buffer = ""
+            start = time.time()
+            while time.time() - start < timeout:
+                if proc.poll() is not None:
+                    chunk = proc.stdout.read()
+                    if chunk:
+                        buffer += chunk
+                    return ('Linux version' in buffer, "\n".join(buffer.split('\n')[-10:]))
+                ready, _, _ = select.select([proc.stdout], [], [], 0.1)
+                if ready:
+                    chunk = proc.stdout.read(4096)
+                    if chunk:
+                        buffer += chunk
+                        if "Linux version" in buffer:
+                            proc.terminate()
+                            return (True, "\n".join(buffer.split('\n')[-10:]))
+                time.sleep(0.1)
+            proc.terminate()
+            time.sleep(5)
+            if proc.poll() is None:
+                proc.kill()
+            return (False, "\n".join(buffer.split('\n')[-10:]))
+
+        image = "core-image-minimal"
+
+        self.write_config('QEMU_USE_KVM = "1"')
+
+        # generate image and SDK
+        bitbake(f"{image}")
+        bitbake(f"{image} -c populate_sdk")
+
+        # create a temporary destdir to test runqemu from SDK
+        with TemporaryDirectory() as tmpdir:
+            self.logger.debug(f"Created tempdir: {tmpdir}")
+            vars = get_bb_vars(["DEPLOY_DIR_IMAGE", "SDK_DEPLOY", "TOOLCHAIN_OUTPUTNAME", "MACHINE"], image)
+            machine = vars["MACHINE"]
+            image_dir = vars["DEPLOY_DIR_IMAGE"]
+            sdk_path = os.path.join(vars["SDK_DEPLOY"], vars["TOOLCHAIN_OUTPUTNAME"] + ".sh")
+            self.logger.debug(f"machine: {machine}")
+            self.logger.debug(f"image_dir: {image_dir}")
+            self.logger.debug(f"sdk_path: {sdk_path}")
+            dst_image_dir = os.path.join(tmpdir, os.path.basename(image_dir))
+            shutil.copytree(image_dir, dst_image_dir)
+            subprocess.check_call(f"{sdk_path} -d {tmpdir} -y", shell=True)
+            sdk_env = glob.glob(tmpdir + '/environment-setup-*')[0]
+            self.logger.debug(f"sdk_env: {sdk_env}")
+
+            path = path_with_no_bitbake()
+            self.logger.debug(f"path: {path}")
+
+            runqemu_works, output = runqemu_works_from_sdk(tmpdir, sdk_env, machine, path)
+            self.logger.debug(f"runqemu works in SDK: {runqemu_works}\n{output}")
+
+            self.assertTrue(runqemu_works, f"runqemu does not work in SDK\n{output}")
-- 
2.43.0


