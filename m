Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 22C94760FD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:47 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so6522232pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=L89HUMYAiLfKRJs1Y/Hrv5I0sIaycg8SiAzIxpSou7M=;
	b=TqnHVJWPTcUH4cVP4yBbMJHO/IGcXACuwBfK57RoNL0jFQG7tNSFRmWo8bx4sKVPzt
	1ztoNFk+PaIRellZLkUGz+VoThhX7oZ0F69wYqO2pn7rKsMri/yliMYaYz28ThJB5VH5
	Ffg4wCKtAA/GSeRKh3AVh9NaqrnZ/TcFBss0zlcysmiMkcoplAem1mr+STDSFzRWPLpV
	M6yHliJI6cG8fn6OUVA8UU65TDRR0eN2aA4906EjB+8yK/NAFhvlfXGIKNgpCuvADDhJ
	Y8q9EsjSW0OZo4uZ+EfgJzf+nKckmxCoJxWaiIXlXI+oaa3WwiaiPIZZwvHq8iPE6b6j
	zucQ==
X-Received: by 10.66.146.132 with SMTP id tc4mr40333329pab.124.1437232608200; 
	Sat, 18 Jul 2015 08:16:48 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	qz7sm14630918pbc.11.2015.07.18.08.16.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:46 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 89631FC12F0; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:15 -0700
Message-Id: <3fafd91342a2c20c6af5a1817f8b0d517aad8c2e.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 08/25] license.bbclass: set dirs for do_populate_lic_setscene
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:49 -0000

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
Signed-off-by: Armin Kuster <akuster@smtp.gmail.com>
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
1.9.1


