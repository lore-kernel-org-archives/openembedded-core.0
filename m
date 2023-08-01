Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F7BC04E69
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 04:18:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5626.1690863481995452731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 21:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N/RwAOSH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=757755136f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3713xahF002855
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Aug 2023 04:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=3+76o
	C3lFvKvd3OIj4oMKfKLjUmGERPzLVyyO1kgR9E=; b=N/RwAOSHPwCmwzSSn6vlX
	oCTGvyG9GcTcYhnJnvGh8hah/ECBXAguqdbojMPcSyY1u+fAEp1pu/tzY7O7de8z
	HV9xmlCpMMfukxdnRO4n8J/JO0Yo+8RG1+QzuzZng3nOsy8NQzHLBDXzzKkHvfEn
	Lhclfn9uQWFxFD0dL3jn9rOEg0JlhfWvwJoIam/jMK3QY0MlVuy4qY+F8cyOqfjj
	6GcNLlYTSmp1sNhKA68xFsFDmS9EOuSbkhaaW3LWXumfVnJ0jZzJfLm/N/kK1cQD
	4x0zrey/n2bGPATougi7Gz+uuJLm/hXzCPKJsKnvdBKgcF6s/lBAFcctqGbZiamu
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4qyx2cnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 04:18:00 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 21:17:58 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] qemu: fix CVE-2023-3301
Date: Tue, 1 Aug 2023 04:17:46 +0000
Message-ID: <20230801041746.1486915-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 9Gs5QICsTyOwRcsooI889296f8rcu-O2
X-Proofpoint-ORIG-GUID: 9Gs5QICsTyOwRcsooI889296f8rcu-O2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_01,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308010038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 04:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185188

qemu: hotplug/hotunplug mlx vdpa device to the occupied addr port,
then qemu core dump occurs after shutdown guest

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-3301

Upstream patches:
https://gitlab.com/qemu-project/qemu/-/commit/a0d7215e339b61c7d7a7b3fcf754954d80d93eb8

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3301.patch             | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c6c6e49ebf..d5d210194b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -94,6 +94,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch \
            file://0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
            file://CVE-2023-0330.patch \
+           file://CVE-2023-3301.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch
new file mode 100644
index 0000000000..ffb5cd3861
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch
@@ -0,0 +1,60 @@
+From a0d7215e339b61c7d7a7b3fcf754954d80d93eb8 Mon Sep 17 00:00:00 2001
+From: Ani Sinha <anisinha@redhat.com>
+Date: Mon, 19 Jun 2023 12:22:09 +0530
+Subject: [PATCH] vhost-vdpa: do not cleanup the vdpa/vhost-net structures if
+ peer nic is present
+
+When a peer nic is still attached to the vdpa backend, it is too early to free
+up the vhost-net and vdpa structures. If these structures are freed here, then
+QEMU crashes when the guest is being shut down. The following call chain
+would result in an assertion failure since the pointer returned from
+vhost_vdpa_get_vhost_net() would be NULL:
+
+do_vm_stop() -> vm_state_notify() -> virtio_set_status() ->
+virtio_net_vhost_status() -> get_vhost_net().
+
+Therefore, we defer freeing up the structures until at guest shutdown
+time when qemu_cleanup() calls net_cleanup() which then calls
+qemu_del_net_client() which would eventually call vhost_vdpa_cleanup()
+again to free up the structures. This time, the loop in net_cleanup()
+ensures that vhost_vdpa_cleanup() will be called one last time when
+all the peer nics are detached and freed.
+
+All unit tests pass with this change.
+
+CC: imammedo@redhat.com
+CC: jusual@redhat.com
+CC: mst@redhat.com
+Fixes: CVE-2023-3301
+Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2128929
+Signed-off-by: Ani Sinha <anisinha@redhat.com>
+Message-Id: <20230619065209.442185-1-anisinha@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/a0d7215e339b61c7d7a7b3fcf754954d80d93eb8]
+CVE: CVE-2023-3301
+
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ net/vhost-vdpa.c |    8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+--- a/net/vhost-vdpa.c
++++ b/net/vhost-vdpa.c
+@@ -140,6 +140,14 @@ static void vhost_vdpa_cleanup(NetClient
+ {
+     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+
++    /*
++     * If a peer NIC is attached, do not cleanup anything.
++     * Cleanup will happen as a part of qemu_cleanup() -> net_cleanup()
++     * when the guest is shutting down.
++     */
++    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_NIC) {
++        return;
++    }
+     if (s->vhost_net) {
+         vhost_net_cleanup(s->vhost_net);
+         g_free(s->vhost_net);
-- 
2.40.0


