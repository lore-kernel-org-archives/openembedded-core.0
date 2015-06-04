Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 43DEA734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 11:37:21 +0000 (UTC)
Received: by wibut5 with SMTP id ut5so18410005wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 04:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/apXJjR5u9glzyV41gs/QXfl1GwTZdT/kRL3pRaLUVU=;
	b=ouCE4vjqtGzhau84D2u3SQhWjmkv+0e5skogfQ/kF+SWlbhSA5RzBAPJX2L00bmrpS
	IMctOxEeJJvNe/koMohtZDr+H85VsbCdZBL8Gi32+JoTLRCNEUu8OnU9MsfwEJJd/QtZ
	rUU7UD2s3/YwDxtItIcpFtPacxTTHFcClYiy6xe5wCHzOlbs6c/+XBTckE7fNmUQw8eK
	iRYD4u8FaBQ5U+sD0mJrPsI4Npge9/UY12Ta08ndbJHuwFNZyGwOPRMEmZPFMXgsif8D
	1nJrpfZLSCb9C6TSYM9o3nYPPj1bpzLe1c6OGdkW6ctjH/FmOB0wNo4/vQd+Rktkknsf
	SFzw==
X-Received: by 10.194.71.226 with SMTP id y2mr54319409wju.34.1433417842594;
	Thu, 04 Jun 2015 04:37:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id w11sm5370131wjr.48.2015.06.04.04.37.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 04:37:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 13:37:41 +0200
Message-Id: <1433417861-18786-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.2
Subject: [dizzy][PATCH] license.bbclass: set dirs for do_populate_lic_setscene
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
X-List-Received-Date: Thu, 04 Jun 2015 11:37:22 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
ERROR: Build of do_populate_lic failed
ERROR: Traceback (most recent call last):
  File "bitbake/lib/bb/build.py", line 497, in exec_task
    return _exec_task(fn, task, d, quieterr)
  File "bitbake/lib/bb/build.py", line 437, in _exec_task
    exec_func(func, localdata)
  File "bitbake/lib/bb/build.py", line 212, in exec_func
    exec_func_python(func, d, runfile, cwd=adir)
  File "/home/nxadm/nx/ala-blade44.1/builds-2015-03-09-163005/qemuppc_world_oe_bp/bitbake/lib/bb/build.py", line 237, in exec_func_python
    os.chdir(cwd)
OSError: [Errno 2] No such file or directory: 'bitbake_build/tmp/work/ppc7400-wrs-linux/taglib/1.9.1-r0/build'

When running setscene, the cwd is $B which maybe removed by
autotools.bbclass or cmake.bbclass when rebuild.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/license.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 14d3107..d03b9eb 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -389,6 +389,8 @@ do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
 
 ROOTFS_POSTPROCESS_COMMAND_prepend = "write_package_manifest; license_create_manifest; "
 
+do_populate_lic_setscene[dirs] = "${LICSSTATEDIR}/${PN}"
+do_populate_lic_setscene[cleandirs] = "${LICSSTATEDIR}"
 python do_populate_lic_setscene () {
     sstate_setscene(d)
 }
-- 
2.4.2


