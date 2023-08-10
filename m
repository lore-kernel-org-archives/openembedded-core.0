Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E244C41513
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 07:00:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12045.1691650834277709703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 00:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=i9LUoqAR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=758670bc78=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37A5f83s004421
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=+K4mu
	D2mSxoxi/efSu5iEdK+Vob+akwC8JpSSAZCYzM=; b=i9LUoqARpYQKcGgIGqBVF
	tMLsXFCCVs1OEByGh1USEjrr5sLi5e4kYCBQG1T4LVz1ieyOkZhobEvfYP30ItUd
	tRlQeO/ylDF7vJ5hwMjEE8aIfc94Jq4AOxnQeCK/iY8MxwxUDoLVCUfIsPjHm/Jn
	q8zxasbIhz2Cy9hZygpzj2f2Lf6bVpnpaIU1wj3qSvMa0l6xQKzOC4qG0s8Z1Dkc
	rL2oGdhrH8S6FsUQW1iYkj6Je07UOjL/ht+ZEpw6QTnnWvlVJQm8xFTyyUjWSizS
	GJVn8F7p+jp0Lc8iIAQwUmDSU46PDeFMqo6ck1qpHP7JNe8XXDmSHh4maVRuk/Jm
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9dd64knv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:00:33 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 00:00:30 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 1/3] qemu: fix CVE-2023-3301
Date: Thu, 10 Aug 2023 07:00:10 +0000
Message-ID: <20230810070012.3740596-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: Eur-MBnXjThg-tt6nKk9Ps2yuj6Xk8pA
X-Proofpoint-ORIG-GUID: Eur-MBnXjThg-tt6nKk9Ps2yuj6Xk8pA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_05,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308100057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185725

qemu: hotplug/hotunplug mlx vdpa device to the occupied addr port,
then qemu core dump occurs after shutdown guest

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-3301

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3301.patch             | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 9233378925..f5b408036a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -37,6 +37,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://qemu-guest-agent.udev \
            file://ppc.patch \
 	   file://CVE-2023-0330.patch \
+	   file://CVE-2023-3301.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch
new file mode 100644
index 0000000000..977f017ed2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch
@@ -0,0 +1,65 @@
+From a0d7215e339b61c7d7a7b3fcf754954d80d93eb8 Sep 17 00:00:00 2001
+From: Ani Sinha <anisinha@redhat.com>
+Date: Wed, 2 Aug 2023 09:25:27 +0000
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
+CVE: CVE-2023-3301
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/a0d7215e339b61c7d7a7b3fcf754954d80d93eb8]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ net/vhost-vdpa.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
+index 2b4b85d8f..8dbe929c1 100644
+--- a/net/vhost-vdpa.c
++++ b/net/vhost-vdpa.c
+@@ -158,6 +158,15 @@ err_init:
+ static void vhost_vdpa_cleanup(NetClientState *nc)
+ {
+     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
++
++    /*
++     * If a peer NIC is attached, do not cleanup anything.
++     * Cleanup will happen as a part of qemu_cleanup() -> net_cleanup()
++     * when the guest is shutting down.
++     */
++    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_NIC) {
++	return;
++    }
+     struct vhost_dev *dev = &s->vhost_net->dev;
+
+     qemu_vfree(s->cvq_cmd_out_buffer);
+--
+2.40.0
-- 
2.35.5


