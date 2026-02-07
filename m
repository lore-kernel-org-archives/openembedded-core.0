Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBC2EE6B76
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 05:13:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3790.1770441188902097441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 21:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=In+tsKwL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64987582b7=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174o1xd419103;
	Sat, 7 Feb 2026 05:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=xKsEy3QyW
	2p/2vJKk0WSRLT26E4JG7KY+DxS2n2A9LI=; b=In+tsKwLGRu3MCLsWjSOH7jF9
	rPa1NDMVeOxMigLAQfMhTCyJeiVtXjJE4zVhk8uNahXK231wiUmeHJq9BRKXr11G
	r31hdniYKSCIWPbztAjTefNDcDzlcPKtGB/NBM+NlER5+HjwoCzKOO78hcXdisRj
	bCwTITjGBdy2809wmQTRPOWeyUCapKfXEUAfN+pEFkIphX5tFYUOOBSZ+kwWYyTW
	TdswndzS6FqpJIBG90eZU4jByHhlBQjhlQL3TGlirezRs2E79t7yz17/cudzDVCJ
	Cx103CI6RynaXAUuK0/2hYNpKu37BWgEeb/rfzDDxYE2ThRAI2+9S7s/D7Q1w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5vc582sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 07 Feb 2026 05:13:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 6 Feb 2026 21:13:06 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 6 Feb 2026 21:13:06 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>
Subject: [OE-core][RFC][PATCH] oeqa/selftest/sdk: add test_sdk_runqemu
Date: Sat, 7 Feb 2026 05:13:05 +0000
Message-ID: <20260207051305.2363194-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=dPyrWeZb c=1 sm=1 tr=0 ts=6986c9e3 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=2V6DY6BgAAAA:8
 a=QklhIAnghPIZTLOfvdoA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ldqKKs2zR4t-S6fqr-1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDAzOCBTYWx0ZWRfXwJVQUg3ndHYW
 UPh6cJEpHCoFAximtAs3cIlAA6eYWVUTS1P4M94S+cQGeHHmzdW1PO2Y2Gpim8NoGl+n+5jf/be
 KHlE52rb9KCCxyWEpzebIVmOYvol0NUzkoB2ME7xD3adyYvSqiBHySRF5VGD6THWYJiCmZdP0zT
 aBnCdx8jjnmNStZ3yzII5WF10u1QKHDm2fQQ8cXs94zJEnStDRI9ABPjecYFUDxJrFO+PTxJeew
 B5auAyCzmJidxV7MeVNv+BhDOZvn4yyxg+0hnV1xeSIWbrmBP5vmTnTr0fNgKNIJCEwNiSWOWvX
 R1cE6c4bL5KJz//S1cfunsbnfmlLdTw+q0FKFeOWUa6/KTpVVSbF+03NjH5ktdbFkfQwBSlvT5U
 bsz2gbsJjcPWHh+46yvQ6pFCLHBcYpp9+DUON+/KCCBg9rFhUL28h7EJ458WUvXdBG9qKAAJmhH
 ar091dC5k7xJNaWowIw==
X-Proofpoint-GUID: YrlZE-wwDL-zMIL5v0-gmmlFe5XmgqKU
X-Proofpoint-ORIG-GUID: YrlZE-wwDL-zMIL5v0-gmmlFe5XmgqKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602070038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Feb 2026 05:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230667

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


