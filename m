Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7891D73AB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 08:35:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2B8ZgQ6022278
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 01:35:42 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 01:35:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2015 01:35:38 -0700
Message-ID: <18cec0bedc4916b29d28d6ee078bfa8d7f05d895.1426062917.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1426062917.git.liezhi.yang@windriver.com>
References: <cover.1426062917.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] license.bbclass: set dirs for do_populate_lic_setscene
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
X-List-Received-Date: Wed, 11 Mar 2015 08:35:43 -0000
Content-Type: text/plain

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
---
 meta/classes/license.bbclass |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 044b3b0..95e0121 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -438,6 +438,8 @@ do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
 
 ROOTFS_POSTPROCESS_COMMAND_prepend = "write_package_manifest; license_create_manifest; "
 
+do_populate_lic_setscene[dirs] = "${LICSSTATEDIR}/${PN}"
+do_populate_lic_setscene[cleandirs] = "${LICSSTATEDIR}"
 python do_populate_lic_setscene () {
     sstate_setscene(d)
 }
-- 
1.7.9.5


