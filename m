Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.37014.1629798230829801618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 02:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17O9hnXo012008
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 02:43:50 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17O9hnYn028815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 02:43:49 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 24 Aug 2021 02:43:48 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 24 Aug 2021 02:43:47 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bitbake.conf: update way of setting XZ_MEMLIMIT
Date: Tue, 24 Aug 2021 17:40:22 +0800
Message-ID: <20210824094022.27915-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Update way of setting XZ_MEMLIMIT, considering scenario that
running bitbake in container, to avoid OOM Killer of xz.

For example:
Container has memory limit of 30G, and host memory is 300G.  'xz
--memlimit=50% ...' will get host memory, so the limit for xz is 150G.
And because of the container memory limit is 30G, xz can use nearly up
to 30G memory, which may cause oom kill of xz.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/bitbake.conf |  3 ++-
 meta/lib/oe/utils.py   | 12 ++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f6fb2aa698..2b36e083ca 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -809,7 +809,8 @@ BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
 PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
 
 # Default parallelism and resource usage for xz
-XZ_MEMLIMIT ?= "50%"
+CONTAINER_MEM_LIMIT = "${@oe.utils.container_mem_limit()}"
+XZ_MEMLIMIT ?= "${@ '%d' % (int(d.getVar('CONTAINER_MEM_LIMIT'))/2) if d.getVar('CONTAINER_MEM_LIMIT') != '0' else '50%'}"
 XZ_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
 XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
 XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index a84039f585..581072ac0d 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -252,6 +252,18 @@ def cpu_count(at_least=1):
     cpus = len(os.sched_getaffinity(0))
     return max(cpus, at_least)
 
+def container_mem_limit():
+    limit_in_bytes = '0'
+    proc_sched = '/proc/1/sched'
+    if os.path.exists(proc_sched):
+        with open(proc_sched, 'r') as fp:
+            initinfo = fp.readline().strip()
+            cgroup_limit_in_bytes = '/sys/fs/cgroup/memory/memory.limit_in_bytes'
+            if initinfo.split(' ')[0] not in ('systemd', 'init',) and os.path.exists(cgroup_limit_in_bytes):
+                with open(cgroup_limit_in_bytes) as fpc:
+                    limit_in_bytes=fpc.readline().strip()
+    return limit_in_bytes
+
 def execute_pre_post_process(d, cmds):
     if cmds is None:
         return
-- 
2.17.1

