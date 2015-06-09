Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8FCEC75751
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 09:04:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5994l9W009324
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 02:04:47 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 02:04:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 02:04:46 -0700
Message-ID: <9b300b48a521a5c1535785459915cf495a3b2583.1433840650.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433840650.git.liezhi.yang@windriver.com>
References: <cover.1433840650.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gcc-source.inc: fix STAMPCLEAN to avoid race issue
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
X-List-Received-Date: Tue, 09 Jun 2015 09:04:47 -0000
Content-Type: text/plain

Fixed race issue when build more than one gcc-source and inherit
rm_work, for example:
$ bitbake gcc-source-4.9.2 gcc-source-5.1.0

File "/path/to/bitbake/lib/bb/build.py", line 512, in exec_task
  return _exec_task(fn, task, d, quieterr)
File "/path/to/bitbake/lib/bb/build.py", line 489, in _exec_task
  make_stamp(task, localdata)
File "/path/to/bitbake/lib/bb/build.py", line 599, in make_stamp
  os.unlink(name)
OSError: [Errno 2] No such file or directory: '/path/to/tmp/stamps/work-shared/gcc-4.9.2-r0.do_rm_work_all.02cf1ed9b79d4edb0a51d3b913b7f9ba'

This is because make_stamp() uses glob.glob() to remove the old stamps
before create the new one, when gcc-source-5.1.0 removes gcc-4.9.2-r0's
stamp, we may get the error.

We can't use deltask do_rm_work_all as do_rm_work since it is a
recrdeptask, otherwise:
ERROR: Command execution failed: Traceback (most recent call last):
  File "/path/to/bitbake/lib/bb/command.py", line 102, in runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/path/to/bitbake/lib/bb/command.py", line 324, in generateDotGraph
    command.cooker.generateDotGraphFiles(pkgs_to_build, task)
  File "/path/to/bitbake/lib/bb/cooker.py", line 847, in generateDotGraphFiles
    depgraph = self.generateTaskDepTreeData(pkgs_to_build, task)
  File "/path/to/bitbake/lib/bb/cooker.py", line 672, in generateTaskDepTreeData
    rq.rqdata.prepare()
  File "/path/to/bitbake/lib/bb/runqueue.py", line 587, in prepare
    generate_recdeps(dep)
  File "/path/to/bitbake/lib/bb/runqueue.py", line 575, in generate_recdeps
    add_resolved_dependencies([taskData.tasks_fnid[t]], tasknames, newdeps)
TypeError: list indices must be integers, not NoneType

Update STAMPCLEAN to contain ${PV} to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 529b8e0..794fd4d 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -16,7 +16,7 @@ WORKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
 SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
 
 STAMP = "${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}"
-STAMPCLEAN = "${STAMPS_DIR}/work-shared/gcc-[0-9]*-*"
+STAMPCLEAN = "${STAMPS_DIR}/work-shared/gcc-${PV}-*"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
-- 
1.7.9.5


