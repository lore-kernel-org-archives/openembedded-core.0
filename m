Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD9FE7B5F0
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 11:06:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15690.1696417582546190184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 04:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ibmFW0nc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8641142f6c=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 394Aa61f010979
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Oct 2023 11:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=G82x3
	87VW0dXvVqFC9CSrH54OerWV12eWJ68uG/JDn8=; b=ibmFW0ncZBI/P294iIg++
	guXzzJwjebR8RdkrvycPpljXaxHRFMw8kJWuEgXSEEUTw2f6DK2t6+ge3Z9w5zYw
	wiCq+Z/AymVCfi3zgL0/XX0oP/6kYg+DnYNUhhVh5NwFyl4ZJxIeZXgeeVC10OoY
	Ei1e2ED7F4rWa4W7mg0zmJ1Bu5Jenui0EBwibXH3BoMzHDrM4atcT4zWAf52qzJS
	KsVKyYH8rI6puN60vXoyB5g9FF2x5dtmXZrjs+mFZHErIo/tMniBCR4idcI28U/3
	4LTNAbIoG/ZRbkclVhQviCM9PRzWNe5ATkhKj2gzm2nqX4tcrtb+v2HsNCU9HhZW
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tean63t9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 11:06:21 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 04:06:18 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 1/1] qemu: Fix CVE-2023-3180
Date: Wed, 4 Oct 2023 11:05:58 +0000
Message-ID: <20231004110558.1001323-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: yMpCiktRhlosWSEKPugTA_IYuat-wQ1q
X-Proofpoint-ORIG-GUID: yMpCiktRhlosWSEKPugTA_IYuat-wQ1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_02,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 mlxlogscore=529 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310040080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 11:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188673

From: Soumya Sambu <soumya.sambu@windriver.com>

A flaw was found in the QEMU virtual crypto device while handling
data encryption/decryption requests in virtio_crypto_handle_sym_req.
There is no check for the value of `src_len` and `dst_len` in
virtio_crypto_sym_op_helper, potentially leading to a heap buffer
overflow when the two values differ.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-3180

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3180.patch             | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c8e1d28654..cd17a11335 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -41,6 +41,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-3255.patch \
 	   file://CVE-2023-2861.patch \
 	   file://CVE-2023-3354.patch \
+	   file://CVE-2023-3180.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch
new file mode 100644
index 0000000000..cd9f85fd43
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch
@@ -0,0 +1,52 @@
+From 9d38a8434721a6479fe03fb5afb150ca793d3980 Mon Sep 17 00:00:00 2001
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
+Fixes: 04b9b37e
+
+("virtio-crypto: add data queue processing handler")
+Cc: Gonglei <arei.gonglei@huawei.com>
+Cc: Mauro Matteo Cascella <mcascell@redhat.com>
+Cc: Yiming Tao <taoym@zju.edu.cn>
+Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
+Message-Id: <20230803024314.29962-2-pizhenwei@bytedance.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+
+CVE: CVE-2023-3180
+
+Upstream-Status: Backport from [https://gitlab.com/qemu-project/qemu/-/commit/9d38a8434721a6479fe03fb5afb150ca793d3980]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ hw/virtio/virtio-crypto.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
+index 97da74e71..fdb592861 100644
+--- a/hw/virtio/virtio-crypto.c
++++ b/hw/virtio/virtio-crypto.c
+@@ -633,6 +633,11 @@ virtio_crypto_sym_op_helper(VirtIODevice *vdev,
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


