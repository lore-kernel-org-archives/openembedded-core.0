Return-Path: <Ishaan.Desai@ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04249C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 17:05:15 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.166.1783703113946381869
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 10:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibm.com header.s=pp1 header.b=Q+/omuOT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: ibm.com, ip: 148.163.156.1, mailfrom: ishaan.desai@ibm.com)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEmGNS1906941
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 17:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=YZV7sg/+rjLYnUrnzSvbi12EqWNgSw620jahvgAYe
	Bo=; b=Q+/omuOTrOWeBSeGH6Ma3JHxLbWOx7kJcT/PDOwdeXKwjLnOYK+pIoLBL
	tf2ZlOR9yJDWH90G4IEtVaM6U+3JlYyY5BY4hf0f969+qmB6n0jY0xMBaBbgDhSS
	owJVfTa6vUqNmm2BSwRWXtfuWJuwtORt6iQRjJqanjxf/qf2XA/mz/URvwVpvEDp
	opG7Chtzbrb7cjJd+IIbMd8rw4N3sRc0GEI8Bo32jKInGN58p3TkFh9AGDtRDUGn
	Lcn4Du34V5oVTPBOHO0R6Pp+tTc5z1QIACm3u2OSvS+jK9t2bQD2gXQGa26Wsu4Q
	KQllnAqNePZgLHtDJ8NYuQCOgdr1g==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sur7hyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 17:05:13 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66AH5B8e003410
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 17:05:12 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7dgkjy9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 17:05:12 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66AH5ArQ9175782
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jul 2026 17:05:10 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F406358052;
	Fri, 10 Jul 2026 17:05:09 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F65158050;
	Fri, 10 Jul 2026 17:05:09 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jul 2026 17:05:09 +0000 (GMT)
From: Ishaan Desai <Ishaan.Desai@ibm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ishaan Desai <Ishaan.Desai@ibm.com>
Subject: [PATCH] memory-control: add recipe and bbclass for cgroup v2 memory limiting
Date: Fri, 10 Jul 2026 12:05:00 -0500
Message-ID: <20260710170500.3863193-1-Ishaan.Desai@ibm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE2OCBTYWx0ZWRfX6IlxBCd5BqpM
 KkK0ecqiMQqtJwHvyGQtWjTgckvsJTSpc74Mx0NcVovs/TRanjsApzauSM55A/tGGfnc8xUkPxA
 LCytsypgEjS/Fox3U2FpZpHlS0RA7xo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE2OCBTYWx0ZWRfX0EcrNF35E1Gc
 cOC3c+WY8zP3L8QlPULC7pgsk5FNqyES4JwDRHBjd65mEV3/brLmbSVZuuaVhLvbH8D/zlG03Kj
 89aVN0UH6JJRh7x7L2ANRKbJ/15dGqBA3/lBrncwxwSRuK7NJ71DA9gjB/xUD0/P630XXoUCm1P
 U2/cQfVRZnBWdjlX0PLeOaK2HGXuMXxvDw3vjTw+tWiDBIV1sYFVhwiktbP9zlO03MB29R+rxyU
 j+XMQ08jaBhVGCfOmAsQc+KO+XeA8JIouW96In2BhlVLc9m0vaC8qxKM+te5N3UegXHX8ot9Ql0
 T0iJE2nnl/ACab16ME5cEGDETlMgvWqWQMy9aVk8XQzjG4OiJERtjCogF2mTWqOop7Z0xhzpEht
 988Du+IZnN6oz4XyEa69p/72bcy8t6boX2gHU03u/J7u0vOedQUNgsxwvK8y/qPbzwYUd8zv+0z
 X6eD+avHGAIY2itKl4A==
X-Proofpoint-GUID: WDFtcUKRgBF7NwVBKYffww9_IIyoFhVG
X-Authority-Analysis: v=2.4 cv=Oot/DS/t c=1 sm=1 tr=0 ts=6a512649 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=VnNF1IyMAAAA:8
 a=YDHw8K1o7AQTAJipLJUA:9 a=OlMNXAcGbEZC_NE3:21 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: WDFtcUKRgBF7NwVBKYffww9_IIyoFhVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 17:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240680

Adds a CLI tool and bbclass for applying per-service memory limits via
systemd resource control and Linux cgroups v2.

The memory-control command inspects MemoryMax and MemoryHigh settings
for any running systemd service and lists all services with a drop-in
applied.

memory-control.bbclass allows any recipe to set a memory limit at build
time by inheriting the class and setting MEMORY_LIMIT. Two OOM policies
are available via MEMORY_OOM_POLICY: "reboot" (default) reboots on OOM,
and "kill" terminates only the offending process.

AI-Generated: Uses IBM Bob

Signed-off-by: Ishaan Desai <Ishaan.Desai@ibm.com>
---
 meta/classes-recipe/memory-control.bbclass    |  95 +++++++++
 .../memory-control/cgroups-v2.cfg             |  19 ++
 .../memory-control/memory-control.sh          | 196 ++++++++++++++++++
 .../memory-control/memory-control@.service    |  13 ++
 .../memory-control/memory-control_1.0.bb      |  53 +++++
 5 files changed, 376 insertions(+)
 create mode 100644 meta/classes-recipe/memory-control.bbclass
 create mode 100644 meta/recipes-support/memory-control/memory-control/cgroups-v2.cfg
 create mode 100755 meta/recipes-support/memory-control/memory-control/memory-control.sh
 create mode 100644 meta/recipes-support/memory-control/memory-control/memory-control@.service
 create mode 100644 meta/recipes-support/memory-control/memory-control_1.0.bb

diff --git a/meta/classes-recipe/memory-control.bbclass b/meta/classes-recipe/memory-control.bbclass
new file mode 100644
index 0000000000..4b45720a1d
--- /dev/null
+++ b/meta/classes-recipe/memory-control.bbclass
@@ -0,0 +1,95 @@
+# memory-control.bbclass - write a systemd drop-in memory limit into the image
+#
+# Usage:
+#   inherit memory-control
+#   MEMORY_LIMIT = "512M"           # required; K/M/G or raw bytes
+#   MEMORY_OOM_POLICY = "kill"      # optional; "reboot" (default) or "kill"
+#
+# "reboot": system reboots on OOM (vm.panic_on_oom=2; typical platform default).
+# "kill":   only the offending process is killed, system keeps running.
+#           Writes /etc/sysctl.d/memory-control.conf with vm.panic_on_oom=1,
+#           which sorts after vm.conf and overrides it at boot.
+#
+# MemoryHigh is set to 70% of MemoryMax so the kernel has room to reclaim
+# file-backed pages before hitting the hard ceiling.
+#
+# Kernel config prerequisite:
+#   CONFIG_CGROUPS=y and CONFIG_MEMCG=y must be enabled.  A reference kernel
+#   config fragment is installed to ${datadir}/memory-control/cgroups-v2.cfg.
+#   To apply it, copy the fragment to your kernel recipe's files directory and
+#   add it to SRC_URI in your kernel bbappend:
+#
+#     SRC_URI:append:<machine> = " file://cgroups-v2.cfg"
+
+MEMORY_LIMIT ?= ""
+MEMORY_LIMIT_SERVICE ?= "${PN}.service"
+MEMORY_OOM_POLICY ?= "reboot"
+
+RDEPENDS:${PN} += "memory-control"
+
+python memory_control_do_install() {
+    import os
+
+    limit_str = d.getVar('MEMORY_LIMIT') or ''
+    if not limit_str:
+        return
+
+    service    = d.getVar('MEMORY_LIMIT_SERVICE')
+    destdir    = d.getVar('D')
+    oom_policy = (d.getVar('MEMORY_OOM_POLICY') or 'reboot').strip().lower()
+
+    if oom_policy not in ('reboot', 'kill'):
+        bb.fatal("memory-control: MEMORY_OOM_POLICY='%s' is invalid; "
+                 "use 'reboot' or 'kill'" % oom_policy)
+
+    limit_str = limit_str.strip()
+    units = {'K': 1024, 'KB': 1024,
+             'M': 1024**2, 'MB': 1024**2,
+             'G': 1024**3, 'GB': 1024**3}
+    number_part = ''.join(c for c in limit_str if c.isdigit())
+    unit_part   = ''.join(c for c in limit_str if not c.isdigit()).upper()
+
+    if not number_part:
+        bb.fatal("memory-control: MEMORY_LIMIT='%s' is not a valid size" % limit_str)
+
+    bytes_val  = int(number_part) * units.get(unit_part, 1)
+    bytes_high = int(bytes_val * 0.7)
+
+    dropin_dir = os.path.join(destdir, 'etc', 'systemd', 'system', service + '.d')
+    os.makedirs(dropin_dir, exist_ok=True)
+
+    dropin_path = os.path.join(dropin_dir, 'memory-control.conf')
+    with open(dropin_path, 'w') as f:
+        f.write('# generated by memory-control.bbclass\n')
+        f.write('# MEMORY_LIMIT = "%s"  MEMORY_OOM_POLICY = "%s"\n' % (limit_str, oom_policy))
+        f.write('[Service]\n')
+        f.write('MemoryMax=%d\n' % bytes_val)
+        f.write('MemoryHigh=%d\n' % bytes_high)
+        f.write('MemorySwapMax=0\n')
+        if oom_policy == 'kill':
+            # keep the unit alive after the cgroup OOM kill
+            f.write('OOMPolicy=continue\n')
+            # make this unit the preferred victim for the system-wide OOM killer
+            # so it is killed as a process rather than causing a kernel panic
+            f.write('OOMScoreAdjust=500\n')
+
+    bb.note("memory-control: wrote %s for %s (%s, policy=%s)" % (
+            dropin_path, service, limit_str, oom_policy))
+
+    if oom_policy == 'kill':
+        # override vm.panic_on_oom=2 from vm.conf; value 1 kills only the
+        # process inside the cgroup that hit MemoryMax instead of panicking.
+        sysctl_dir  = os.path.join(destdir, 'etc', 'sysctl.d')
+        os.makedirs(sysctl_dir, exist_ok=True)
+        sysctl_path = os.path.join(sysctl_dir, 'memory-control.conf')
+        if not os.path.exists(sysctl_path):
+            with open(sysctl_path, 'w') as f:
+                f.write('# generated by memory-control.bbclass\n')
+                f.write('vm.panic_on_oom=1\n')
+            bb.note("memory-control: wrote %s" % sysctl_path)
+}
+
+do_install[postfuncs] += "memory_control_do_install"
+
+FILES:${PN} += "/etc/systemd/system/${MEMORY_LIMIT_SERVICE}.d/memory-control.conf"
+FILES:${PN} += "${@ '/etc/sysctl.d/memory-control.conf' if (d.getVar('MEMORY_OOM_POLICY') or 'reboot').strip().lower() == 'kill' else '' }"
diff --git a/meta/recipes-support/memory-control/memory-control/cgroups-v2.cfg b/meta/recipes-support/memory-control/memory-control/cgroups-v2.cfg
new file mode 100644
index 0000000000..00661668de
--- /dev/null
+++ b/meta/recipes-support/memory-control/memory-control/cgroups-v2.cfg
@@ -0,0 +1,19 @@
+# kernel config fragment required for cgroup v2 memory accounting
+
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_MEMCG_SWAP=y
+CONFIG_MEMCG_KMEM=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_FAIR_GROUP_SCHED=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_PERF=y
+CONFIG_CGROUP_BPF=y
+CONFIG_BLK_CGROUP=y
+CONFIG_PSI=y
+CONFIG_PSI_DEFAULT_DISABLED=n
+CONFIG_SWAP=y
diff --git a/meta/recipes-support/memory-control/memory-control/memory-control.sh b/meta/recipes-support/memory-control/memory-control/memory-control.sh
new file mode 100755
index 0000000000..251c902ca6
--- /dev/null
+++ b/meta/recipes-support/memory-control/memory-control/memory-control.sh
@@ -0,0 +1,196 @@
+#!/bin/bash
+# memory-control - inspect cgroup v2 memory limits for systemd services
+#
+# requires: kernel CONFIG_MEMCG=y + cgroups v2 (mount | grep cgroup2),
+#           systemd 243+, bash 4.0+
+#
+# usage:
+#   memory-control get <service>     show MemoryMax/MemoryHigh
+#   memory-control status <service>  show live usage and memory.stat
+#   memory-control list              list services with a drop-in
+#   .service suffix is optional
+#
+# build-time configuration (recipe or .bbappend):
+#
+#   inherit memory-control
+#   MEMORY_LIMIT      = "512M"       # K/M/G or raw bytes
+#   MEMORY_OOM_POLICY = "kill"       # "reboot" (default) or "kill"
+#
+#   machine overrides work as normal bitbake syntax:
+#     MEMORY_LIMIT:mymachine = "512M"
+#
+#   if the unit name differs from <PN>.service:
+#     MEMORY_LIMIT_SERVICE = "my-custom-unit.service"
+#
+#   accepted sizes: 256K  512M  1G  536870912 (raw bytes)
+#
+# what gets written at build time:
+#
+#   /etc/systemd/system/<service>.service.d/memory-control.conf  (always)
+#     MemoryMax=<bytes>        hard limit; cgroup OOM killer fires if exceeded
+#     MemoryHigh=<70% of max>  reclaim/throttle starts here; 30% gap to max
+#     MemorySwapMax=0          swap disabled
+#     OOMPolicy=continue       kill policy only; unit stays alive after kill
+#     OOMScoreAdjust=500       kill policy only; preferred system-wide OOM target
+#
+#   /etc/sysctl.d/memory-control.conf  (kill policy only)
+#     vm.panic_on_oom=1        sorts after vm.conf, overrides =2 at boot
+#
+# oom policy:
+#   reboot  BMC reboots on OOM; matches vm.panic_on_oom=2 (platform default)
+#   kill    only the offending process dies; BMC keeps running
+#           when MemoryMax is hit:
+#             - cgroup OOM killer fires (scoped to this cgroup only),
+#               vm.panic_on_oom is not consulted
+#             - OOMPolicy=continue keeps the unit alive after the kill
+#             - OOMScoreAdjust=500 makes this the preferred target if global
+#               RAM is also exhausted, avoiding a kernel panic
+#
+# troubleshooting:
+#   cgroups v2 not mounted:
+#     mount | grep cgroup2
+#     # add systemd.unified_cgroup_hierarchy=1 to kernel cmdline if missing
+#
+#   memory controller missing:
+#     cat /sys/fs/cgroup/cgroup.controllers   # "memory" must appear
+#     # rebuild kernel with CONFIG_MEMCG=y if not
+#
+#   drop-in not loaded:
+#     systemctl cat <service>                 # check for memory-control.conf
+#     systemctl daemon-reload && systemctl restart <service>
+#
+#   check kill policy is active:
+#     systemctl show <service> -p OOMPolicy -p MemoryMax -p MemoryHigh
+#     sysctl vm.panic_on_oom                  # should be 1
+#
+#   MemoryMax shows infinity after daemon-reload:
+#     ls /etc/systemd/system/<service>.service.d/
+#     ls /usr/lib/systemd/system/<service>.service.d/
+#     # look for a conflicting drop-in
+#
+#   service keeps getting killed (limit too low):
+#     watch memory-control status <service>   # find peak usage
+#     # set MEMORY_LIMIT to peak + ~30% in the .bbappend and rebuild
+set -e
+
+CGROUP_BASE=/sys/fs/cgroup
+
+usage() {
+    cat <<EOF
+usage: $(basename "$0") <command> [service]
+
+  get <service>    show MemoryMax/MemoryHigh
+  status <service> show live usage and memory.stat
+  list             list services with a memory-control drop-in
+  -h, --help       show this text
+
+Limits are set at build time:
+  inherit memory-control
+  MEMORY_LIMIT      = "512M"
+  MEMORY_OOM_POLICY = "kill"
+
+Drop-in location:
+  /etc/systemd/system/<service>.service.d/memory-control.conf
+EOF
+    exit 0
+}
+
+to_human() {
+    local val=$1
+    case "$val" in
+        max|infinity|"") echo "unlimited"; return ;;
+    esac
+    [[ "$val" =~ ^[0-9]+[KMG]$ ]] && { echo "$val"; return; }
+    [[ "$val" =~ ^[0-9]+$ ]] || { echo "unlimited"; return; }
+    if   (( val >= 1024**3 )); then echo "$((val / 1024**3))G"
+    elif (( val >= 1024**2 )); then echo "$((val / 1024**2))M"
+    elif (( val >= 1024    )); then echo "$((val / 1024))K"
+    else echo "${val}B"
+    fi
+}
+
+resolve_service() {
+    local input=$1
+    [[ "$input" =~ \.service$ ]] || input="${input}.service"
+
+    local fragment
+    fragment=$(systemctl show "$input" -p FragmentPath --value 2>/dev/null)
+
+    if [[ -z "$fragment" || ! -f "$fragment" ]]; then
+        for dir in /etc/systemd/system /lib/systemd/system /usr/lib/systemd/system; do
+            [[ -f "$dir/$input" ]] && { fragment="$dir/$input"; break; }
+        done
+    fi
+
+    if [[ -z "$fragment" || ! -f "$fragment" ]]; then
+        echo "error: no unit file found for '$input'" >&2
+        return 1
+    fi
+
+    service=$(basename "$fragment")
+}
+
+cmd_get() {
+    local service=$1
+    [[ -n "$service" ]] || { echo "error: service name required" >&2; exit 1; }
+    resolve_service "$service" || exit 1
+
+    echo "service:    $service"
+    echo "MemoryMax:  $(to_human "$(systemctl show "$service" -p MemoryMax  --value)")"
+    echo "MemoryHigh: $(to_human "$(systemctl show "$service" -p MemoryHigh --value)")"
+}
+
+cmd_status() {
+    local service=$1
+    [[ -n "$service" ]] || { echo "error: service name required" >&2; exit 1; }
+    resolve_service "$service" || exit 1
+
+    local state
+    state=$(systemctl is-active "$service" 2>/dev/null || true)
+    echo "service: $service"
+    echo "state:   $state"
+
+    if [[ "$state" == "active" ]]; then
+        local mem_max mem_high mem_cur
+        mem_max=$(systemctl show "$service"  -p MemoryMax     --value)
+        mem_high=$(systemctl show "$service" -p MemoryHigh    --value)
+        mem_cur=$(systemctl show "$service"  -p MemoryCurrent --value)
+        echo "current: $(to_human "$mem_cur")"
+        echo "high:    $(to_human "$mem_high")"
+        echo "max:     $(to_human "$mem_max")"
+        [[ "$mem_max" =~ ^[0-9]+$ ]] && echo "usage:   $(( mem_cur * 100 / mem_max ))%"
+    fi
+
+    local cgroup_path
+    cgroup_path=$(systemctl show "$service" -p ControlGroup --value)
+    [[ -z "$cgroup_path" ]] && return
+    printf "\ncgroup: %s\n" "$cgroup_path"
+
+    local mem_stat="${CGROUP_BASE}${cgroup_path}/memory.stat"
+    [[ -f "$mem_stat" ]] || return
+    printf "\nmemory.stat:\n"
+    grep -E "^(anon|file|shmem|kernel)" "$mem_stat" | while read -r key val; do
+        printf "  %-20s %s\n" "$key" "$(to_human "$val")"
+    done
+}
+
+cmd_list() {
+    local found=0
+    for dir in /etc/systemd/system/*.service.d; do
+        [[ -d "$dir" && -f "$dir/memory-control.conf" ]] || continue
+        local unit
+        unit=$(basename "$dir" .d)
+        printf "%-40s %s\n" "${unit%.service}" \
+            "$(to_human "$(systemctl show "$unit" -p MemoryMax --value 2>/dev/null || echo unknown)")"
+        found=1
+    done
+    (( found )) || echo "no services with memory-control drop-ins found"
+}
+
+case "${1:-}" in
+    get)       cmd_get    "$2" ;;
+    status)    cmd_status "$2" ;;
+    list)      cmd_list ;;
+    -h|--help) usage ;;
+    *)         usage ;;
+esac
diff --git a/meta/recipes-support/memory-control/memory-control/memory-control@.service b/meta/recipes-support/memory-control/memory-control/memory-control@.service
new file mode 100644
index 0000000000..20efea5a9c
--- /dev/null
+++ b/meta/recipes-support/memory-control/memory-control/memory-control@.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Memory Control for %i
+Documentation=man:systemd.resource-control(5)
+Before=%i.service
+PartOf=%i.service
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=/bin/true
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-support/memory-control/memory-control_1.0.bb b/meta/recipes-support/memory-control/memory-control_1.0.bb
new file mode 100644
index 0000000000..3740b783b6
--- /dev/null
+++ b/meta/recipes-support/memory-control/memory-control_1.0.bb
@@ -0,0 +1,53 @@
+SUMMARY = "Inspect and apply cgroup v2 memory limits for systemd services"
+DESCRIPTION = "Provides a CLI tool to inspect MemoryMax/MemoryHigh settings \
+for any systemd service, and a bbclass to bake per-service drop-ins into an \
+image at build time."
+HOMEPAGE = "https://www.openembedded.org"
+BUGTRACKER = "https://bugzilla.yoctoproject.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit systemd
+
+SRC_URI = " \
+    file://memory-control.sh \
+    file://memory-control@.service \
+    file://cgroups-v2.cfg \
+"
+
+SYSTEMD_SERVICE:${PN} = ""
+SYSTEMD_AUTO_ENABLE = "disable"
+
+RDEPENDS:${PN} = "bash systemd"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/memory-control.sh ${D}${bindir}/memory-control
+
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/memory-control@.service \
+                    ${D}${systemd_system_unitdir}/
+
+    install -d ${D}${datadir}/memory-control
+    install -m 0644 ${UNPACKDIR}/cgroups-v2.cfg \
+                    ${D}${datadir}/memory-control/
+}
+
+pkg_postinst:${PN}() {
+    #!/bin/sh
+    if [ -n "$D" ]; then
+        exit 0
+    fi
+    if [ -f /sys/fs/cgroup/cgroup.controllers ]; then
+        grep -q memory /sys/fs/cgroup/cgroup.controllers || \
+            echo "memory-control: WARNING: memory controller not available in cgroups v2"
+    else
+        echo "memory-control: WARNING: cgroups v2 not detected"
+    fi
+}
+
+FILES:${PN} = " \
+    ${bindir}/memory-control \
+    ${systemd_system_unitdir}/memory-control@.service \
+    ${datadir}/memory-control \
+"

