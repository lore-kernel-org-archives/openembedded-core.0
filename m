Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2279EC04A94
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 07:42:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.102580.1691998964410458686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 00:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L7xvlHTo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=759056395e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37E72RTf006103
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 07:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=PzMgr
	b3EcduaVkMD7lChn0RPkPMb0Mc0fUAaMNCuUCA=; b=L7xvlHToYrV6eqoQ7Lmkn
	IeJAt1wgaNXlK0AmTpvlE9KjTMSpsYZBA3dljadPwqMSbamGg3sItOR9zaNHaE5H
	vRZ6E+u/XPGmBIzIVKcQwIDY/pxqmySY7DSRrARnBJT9wtpRcOQ/UraPxIQsqyst
	lbwLO4oxqYWzbX9kLw6aKTJF26E9j7FXloxX5c5L9TJN2ppUjvYnfckXeib+OwH0
	61t1XLKym+geWB3GUbb1a096aNtHrPt6GHpLym9REyLSxAzBTHvNalPqlIlNoi9C
	6mYh/hZZC5I3Q7HKs1T10iHXvAHiwYOGFv74X1YFhk1J8fgpfLxfhI8orpyqGAg3
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125snps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 07:42:43 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 00:42:40 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] qemu: fix CVE-2023-3180
Date: Mon, 14 Aug 2023 07:42:27 +0000
Message-ID: <20230814074227.3083403-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 9YMn9qHqP-145KMKNxhh1IclpqiwlXl1
X-Proofpoint-ORIG-GUID: 9YMn9qHqP-145KMKNxhh1IclpqiwlXl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_01,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=600 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308140069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 07:42:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185924

A flaw was found in the QEMU virtual crypto device while handling data
encryption/decryption requests in virtio_crypto_handle_sym_req.
There is no check for the value of `src_len` and `dst_len` in
virtio_crypto_sym_op_helper, potentially leading to a heap buffer
overflow when the two values differ.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-3180

Upstream patches:
https://gitlab.com/qemu-project/qemu/-/commit/49f1e02bac166821c712534aaa775f50e1afe17f

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3180.patch             | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3347a99e19..d77c376bb6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -99,6 +99,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2023-2861.patch \
 	   file://CVE-2020-14394.patch \
 	   file://CVE-2023-3354.patch \
+	   file://CVE-2023-3180.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch
new file mode 100644
index 0000000000..5ec7dd0aa0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch
@@ -0,0 +1,49 @@
+From 49f1e02bac166821c712534aaa775f50e1afe17f Mon Sep 17 00:00:00 2001
+From: zhenwei pi <pizhenwei@bytedance.com>
+Date: Thu, 3 Aug 2023 10:43:13 +0800
+Subject: [PATCH] virtio-crypto: verify src&dst buffer length for sym request
+
+For symmetric algorithms, the length of ciphertext must be as same
+as the plaintext.
+The missing verification of the src_len and the dst_len in
+virtio_crypto_sym_op_helper() may lead buffer overflow/divulged.
+
+This patch is originally written by Yiming Tao for QEMU-SECURITY,
+resend it(a few changes of error message) in qemu-devel.
+
+Fixes: CVE-2023-3180
+Fixes: 04b9b37edda("virtio-crypto: add data queue processing handler")
+Cc: Gonglei <arei.gonglei@huawei.com>
+Cc: Mauro Matteo Cascella <mcascell@redhat.com>
+Cc: Yiming Tao <taoym@zju.edu.cn>
+Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
+Message-Id: <20230803024314.29962-2-pizhenwei@bytedance.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+(cherry picked from commit 9d38a8434721a6479fe03fb5afb150ca793d3980)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/49f1e02bac166821c712534aaa775f50e1afe17f]
+CVE: CVE-2023-3180
+---
+ hw/virtio/virtio-crypto.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
+index a1d122b9aa..ccaa704530 100644
+--- a/hw/virtio/virtio-crypto.c
++++ b/hw/virtio/virtio-crypto.c
+@@ -635,6 +635,11 @@ virtio_crypto_sym_op_helper(VirtIODevice *vdev,
+         return NULL;
+     }
+
++    if (unlikely(src_len != dst_len)) {
++        virtio_error(vdev, "sym request src len is different from dst len");
++        return NULL;
++    }
++
+     max_len = (uint64_t)iv_len + aad_len + src_len + dst_len + hash_result_len;
+     if (unlikely(max_len > vcrypto->conf.max_size)) {
+         virtio_error(vdev, "virtio-crypto too big length");
+--
+2.40.0
-- 
2.40.0


