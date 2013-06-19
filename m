Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6846AC2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 03:21:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5J3LFVD023868
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 20:21:15 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 20:21:14 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jun 2013 23:21:11 -0400
Message-ID: <e1f2af4962fed9b6439c059b749863d7813d62d6.1371611649.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1371611649.git.wenzong.fan@windriver.com>
References: <cover.1371611649.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] procps: fix that top will quit after cpu offline
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
X-List-Received-Date: Wed, 19 Jun 2013 03:21:14 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

top utiliy fails to read /proc/stat after cpu offline, because Cpu_tot
is still the original cpu numbers when calling cpus_refresh, in which
it is trying to read and sscanf Cpu_tot times /proc/stat.

The patch is from procps-3.2.8-2.fc12.src.rpm

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../procps-3.2.8/procps-3.2.7-top-remcpu.patch     |  111 ++++++++++++++++++++
 meta/recipes-extended/procps/procps_3.2.8.bb       |    1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps-3.2.8/procps-3.2.7-top-remcpu.patch

diff --git a/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.7-top-remcpu.patch b/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.7-top-remcpu.patch
new file mode 100644
index 0000000..0306c8d
--- /dev/null
+++ b/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.7-top-remcpu.patch
@@ -0,0 +1,111 @@
+Upstream-Status: Pending
+
+fix that top will quit after cpu offline
+    
+top utiliy fails to read /proc/stat after cpu offline, because Cpu_tot
+is still the original cpu numbers when calling cpus_refresh, in which
+it is trying to read and sscanf Cpu_tot times /proc/stat.
+
+The patch is from procps-3.2.8-2.fc12.src.rpm
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
+---
+--- procps-3.2.7/top.c.remcpu	2006-07-10 10:41:11.000000000 +0200
++++ procps-3.2.7/top.c	2006-07-10 10:41:35.000000000 +0200
+@@ -912,6 +912,7 @@
+ static CPU_t *cpus_refresh (CPU_t *cpus)
+ {
+    static FILE *fp = NULL;
++   static int cpu_max;
+    int i;
+    int num;
+    // enough for a /proc/stat CPU line (not the intr line)
+@@ -926,24 +927,29 @@
+                can hold tics representing the /proc/stat cpu summary (the first
+                line read) -- that slot supports our View_CPUSUM toggle */
+       cpus = alloc_c((1 + Cpu_tot) * sizeof(CPU_t));
++      cpu_max = Cpu_tot;
+    }
++   else if (cpu_max > Cpu_tot)
++      /* move saved CUPs summary to cpu_max possition */
++      memcpy(&cpus[cpu_max], &cpus[Cpu_tot], sizeof(CPU_t));
++   
+    rewind(fp);
+    fflush(fp);
+ 
+    // first value the last slot with the cpu summary line
+    if (!fgets(buf, sizeof(buf), fp)) std_err("failed /proc/stat read");
+-   cpus[Cpu_tot].x = 0;  // FIXME: can't tell by kernel version number
+-   cpus[Cpu_tot].y = 0;  // FIXME: can't tell by kernel version number
+-   cpus[Cpu_tot].z = 0;  // FIXME: can't tell by kernel version number
++   cpus[cpu_max].x = 0;  // FIXME: can't tell by kernel version number
++   cpus[cpu_max].y = 0;  // FIXME: can't tell by kernel version number
++   cpus[cpu_max].z = 0;  // FIXME: can't tell by kernel version number
+    num = sscanf(buf, "cpu %Lu %Lu %Lu %Lu %Lu %Lu %Lu %Lu",
+-      &cpus[Cpu_tot].u,
+-      &cpus[Cpu_tot].n,
+-      &cpus[Cpu_tot].s,
+-      &cpus[Cpu_tot].i,
+-      &cpus[Cpu_tot].w,
+-      &cpus[Cpu_tot].x,
+-      &cpus[Cpu_tot].y,
+-      &cpus[Cpu_tot].z
++      &cpus[cpu_max].u,
++      &cpus[cpu_max].n,
++      &cpus[cpu_max].s,
++      &cpus[cpu_max].i,
++      &cpus[cpu_max].w,
++      &cpus[cpu_max].x,
++      &cpus[cpu_max].y,
++      &cpus[cpu_max].z
+    );
+    if (num < 4)
+          std_err("failed /proc/stat read");
+@@ -955,7 +961,7 @@
+    }
+ 
+    // now value each separate cpu's tics
+-   for (i = 0; 1 < Cpu_tot && i < Cpu_tot; i++) {
++   for (i = 0; ; i++) {
+       if (!fgets(buf, sizeof(buf), fp)) std_err("failed /proc/stat read");
+       cpus[i].x = 0;  // FIXME: can't tell by kernel version number
+       cpus[i].y = 0;  // FIXME: can't tell by kernel version number
+@@ -964,9 +970,35 @@
+          &cpus[i].id,
+          &cpus[i].u, &cpus[i].n, &cpus[i].s, &cpus[i].i, &cpus[i].w, &cpus[i].x, &cpus[i].y, &cpus[i].z
+       );
+-      if (num < 4)
+-            std_err("failed /proc/stat read");
++      if (num < 4) {
++	 Cpu_tot = i;
++	 break;
++      }
++      if (i == cpu_max - 1) {
++	 // Bump cpu_max and extend cpus
++	 cpu_max++;
++	 cpus = realloc(cpus, (1 + cpu_max) * sizeof(CPU_t));
++	 if (!cpus) std_err("realloc failed");
++	 memcpy(&cpus[cpu_max], &cpus[cpu_max-1], sizeof(CPU_t));
++      }
++   }
++
++   if (cpu_max > Cpu_tot)
++      memcpy(&cpus[Cpu_tot], &cpus[cpu_max], sizeof(CPU_t));
++
++   // and just in case we're 2.2.xx compiled without SMP support...
++   if (Cpu_tot == 1) {
++      cpus[0].id = cpus[1].id = 0;
++      cpus[0].u = cpus[1].u;
++      cpus[0].n = cpus[1].n;
++      cpus[0].s = cpus[1].s;
++      cpus[0].i = cpus[1].i;
++      cpus[0].w = cpus[1].w;
++      cpus[0].x = cpus[1].x;
++      cpus[0].y = cpus[1].y;
++      cpus[0].z = cpus[1].z;
+    }
++   
+    return cpus;
+ }
+ 
diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index 7533859..8436d4a 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://procmodule.patch \
             file://procps-3.2.8+gmake-3.82.patch \
             file://gnu-kbsd-version.patch \
             file://60_linux_version_init.patch \
+            file://procps-3.2.7-top-remcpu.patch \
            "
 
 SRC_URI[md5sum] = "9532714b6846013ca9898984ba4cd7e0"
-- 
1.7.9.5


