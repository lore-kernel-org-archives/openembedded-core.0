Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0D6CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 06:45:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9070.1760424313867983457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 23:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O2n8sDU9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=238229c306=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59E5SFb73707309
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 06:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=KjDOTXNusqcdMO0JfMI2
	cQ0rMsSisFTJ1OqvzFAicI0=; b=O2n8sDU9Am42qjSv6/GqBv1bII8Scgc+g3Dc
	gQpMoAuX8TC+O5sVgmpHyj+cRz63CKGC3Wwinik4KRdb6SVQ3j943QAGaVR2vAVD
	txbjtE5lzhvQb/8f13yxWgxXycQLPOehzJNE9wyfObky5xmyTDnaN2RsWv2p8PPD
	gCsHBDrxPfOBvTSSS2WBQ0QUpmLg9dEAPBas0SMU335zVtbC2z7paCJXLs/StFV5
	XMe4WYSIwkC/t7DFFr0MHOHMrg/lCKjwgZlM5ooYV8lgU0bdfFXi+3e68Dns9rFE
	A8CdYm9E7KpuPjyszCFkxuVZNbIcPEqj8MkIO9Lm/hLDxjqWUg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewju0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 06:45:12 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 13 Oct 2025 23:45:09 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/1] qemu: fix CVE-2024-8354
Date: Tue, 14 Oct 2025 12:14:11 +0530
Message-ID: <20251014064411.1306847-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: phwEBAqLkj59j1_Ln6pkYBxKScUQYfu5
X-Proofpoint-ORIG-GUID: phwEBAqLkj59j1_Ln6pkYBxKScUQYfu5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDA1MSBTYWx0ZWRfXzP78J4kagXr/
 QAb3ZyE7r9SzRtvq8SppfwDO024M/DvntU+UCcuXwQnKfFEd8oeVvebal0mEDqB8KqBddMqMlOW
 31RihNB5GPzozh/OeKjEE2F3Alc3lIG8loEv3N/zWAvgjjjw5EuLcG2pW29LY439aylfCgscFJJ
 bMKCn9Al+WbBh1GgHiTDZ0B9W2jX/UwmJxTyVtox6UzdQcipSjNHjsiXrAO8JHrO1W6UC030gxI
 Bo+D6DrPB9tF1ihNh4ZPldNSsemOZeOGrS3Q0EUlMn9R7SBvR0IBykwyxE81WQiCC5olZiHHe9A
 vGglFmMoFF5mkdWVaUXvh80fbMI/qvg2wOuRqQu3uXOw84gRSYfvxJP94AXGJTZHDfQ9jlWuTR8
 D65qL4rw+uYtubHmMLWvDb6b5smpgg==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68edf178 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8 a=ID6ng7r3AAAA:8 a=t7CeM3EgAAAA:8
 a=KKAkSRfTAAAA:8 a=69wJf7TsAAAA:8 a=9qUTvQc-AAAA:8 a=y_clRnggAMR6XA6l3nwA:9
 a=AkheI1RvQwOzcTXhi5f4:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22
 a=Fg1AiH1G6rFz08G2ETeA:22 a=axOgMmt4Ejcwn1cqzmsR:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510140051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 06:45:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224808

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was found in QEMU. An assertion failure was present in
the usb_ep_get() function in hw/net/core.c when trying to get
the USB endpoint from a USB device. This flaw may allow a
malicious unprivileged guest user to crash the QEMU process
on the host and cause a denial of service condition.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-8354

Upstream patch:
https://gitlab.com/qemu-project/qemu/-/commit/746269eaae16423572ae7c0dfeb66140fa882149

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2024-8354.patch             | 76 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 80316af88d..56a93cd2f6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -34,6 +34,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+           file://CVE-2024-8354.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch
new file mode 100644
index 0000000000..9d8464a4aa
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch
@@ -0,0 +1,76 @@
+From 746269eaae16423572ae7c0dfeb66140fa882149 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Mon, 15 Sep 2025 14:29:10 +0100
+Subject: [PATCH] hw/usb/hcd-uhci: don't assert for SETUP to non-0 endpoint
+
+If the guest feeds invalid data to the UHCI controller, we
+can assert:
+qemu-system-x86_64: ../../hw/usb/core.c:744: usb_ep_get: Assertion `pid == USB_TOKEN_IN || pid == USB_TOKEN_OUT' failed.
+
+(see issue 2548 for the repro case).  This happens because the guest
+attempts USB_TOKEN_SETUP to an endpoint other than 0, which is not
+valid.  The controller code doesn't catch this guest error, so
+instead we hit the assertion in the USB core code.
+
+Catch the case of SETUP to non-zero endpoint, and treat it as a fatal
+error in the TD, in the same way we do for an invalid PID value in
+the TD.
+
+This is the UHCI equivalent of the same bug in OHCI that we fixed in
+commit 3c3c233677 ("hw/usb/hcd-ohci: Fix #1510, #303: pid not IN or
+OUT").
+
+This bug has been tracked as CVE-2024-8354.
+
+Cc: qemu-stable@nongnu.org
+Fixes: https://gitlab.com/qemu-project/qemu/-/issues/2548
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
+
+CVE: CVE-2024-8354
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/746269eaae16423572ae7c0dfeb66140fa882149]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/usb/hcd-uhci.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
+index 3d0339af7..afe5dfdee 100644
+--- a/hw/usb/hcd-uhci.c
++++ b/hw/usb/hcd-uhci.c
+@@ -724,6 +724,7 @@ static int uhci_handle_td(UHCIState *s, UHCIQueue *q, uint32_t qh_addr,
+     bool spd;
+     bool queuing = (q != NULL);
+     uint8_t pid = td->token & 0xff;
++    uint8_t ep_id = (td->token >> 15) & 0xf;
+     UHCIAsync *async;
+
+     async = uhci_async_find_td(s, td_addr);
+@@ -767,9 +768,14 @@ static int uhci_handle_td(UHCIState *s, UHCIQueue *q, uint32_t qh_addr,
+
+     switch (pid) {
+     case USB_TOKEN_OUT:
+-    case USB_TOKEN_SETUP:
+     case USB_TOKEN_IN:
+         break;
++    case USB_TOKEN_SETUP:
++        /* SETUP is only valid to endpoint 0 */
++        if (ep_id == 0) {
++            break;
++        }
++        /* fallthrough */
+     default:
+         /* invalid pid : frame interrupted */
+         s->status |= UHCI_STS_HCPERR;
+@@ -816,7 +822,7 @@ static int uhci_handle_td(UHCIState *s, UHCIQueue *q, uint32_t qh_addr,
+             return uhci_handle_td_error(s, td, td_addr, USB_RET_NODEV,
+                                         int_mask);
+         }
+-        ep = usb_ep_get(dev, pid, (td->token >> 15) & 0xf);
++        ep = usb_ep_get(dev, pid, ep_id);
+         q = uhci_queue_new(s, qh_addr, td, ep);
+     }
+     async = uhci_async_alloc(q, td_addr);
+--
+2.40.0
-- 
2.40.0


