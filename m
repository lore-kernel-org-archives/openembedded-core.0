Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D854CD6408E
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 08:14:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10005.1765959282003752800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 00:14:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jSQvuOxJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4446912528=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH535Vx1076109
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 00:14:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Nti7qJtKjAP6cmTlgrJX
	5MLNpv3ayr/WDei52w3dlpk=; b=jSQvuOxJsf1l/f70qDJ6VJYs0ji+49q2kOQ3
	EThCR0a31BSEjCVHl+fkY924piIQIVKHGtdOPj+O/8Ujh94xlcrHj1EER53WxOSi
	/4wsA0BksPbK3k2h4lpZN6BNBR6XU+QtXzj7kXP8Wnk/86FgVlWTqC1XKG0xp6c7
	DJ0VWdLs6878rChcDOEyNluvNrmlVtgyEkctaWtSjEv5F40/6FUDU3lgk9hcGR+M
	+PCoG+BJQofpjiu4AWWlijfTdMy2X3MbJ/NmS/ZzZZt74aPy/desejgUOyQtt/rS
	wuol70jXGossS4ZLnwzdSpradR+FUX7UWrDdvI1V8gy3QAqaOA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j09dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 00:14:41 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 17 Dec 2025 00:14:40 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 17 Dec 2025 00:14:40 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] qemu: fix CVE-2025-12464
Date: Wed, 17 Dec 2025 16:14:32 +0800
Message-ID: <20251217081432.2768782-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=69426671 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=p0WdMEafAAAA:8 a=ID6ng7r3AAAA:8
 a=t7CeM3EgAAAA:8 a=KKAkSRfTAAAA:8 a=69wJf7TsAAAA:8 a=20KFwNOVAAAA:8
 a=rQuykwKOvVSuO4N8f10A:9 a=AkheI1RvQwOzcTXhi5f4:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=cvBusfyB2V15izCimMoJ:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-GUID: zoyQUyKU04uekcNUCd4A1bFgaelWduSC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA2NCBTYWx0ZWRfX9J6rqirmtmTP
 dg1Bh8dicvwAIBukdhQdjwuDUXZR0UWXlHXxAG9uPUo5LNQdm2ZAZyRAcTC1H7FGNq/sva7ar5Z
 WhNmlYmiKnEy0vZ69oqTYGDO8EUGKei+zPgnAmmob51Ttpu7bi+Os9ZNebNzFTuC1tD52P+rb9b
 EFm5oX1TzGAVpPOqN81SdQNmJhvb1ExvN3/wnpBvrA+roXkiH4/UjAdxHR+RfYQ7LM71ubwuTDB
 BOOxxOOk9gXiz72s9XGEigj6v9/jFsj5Wqyg5ZVt8PkKTGICWIuuPVq+UaEWvjLblpl6n4EmZ8D
 FLJCFR2YiaJFcOP7XOULNQMG8Sgu1o2TPNIkV0qWxSlLi87ef8WYt9XCoFiweEhEK1C4Coa3mBN
 gHFmqtsdHuBxarQLIACgv9ZP9KNTiQ==
X-Proofpoint-ORIG-GUID: zoyQUyKU04uekcNUCd4A1bFgaelWduSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 08:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228005

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2025-12464.

Reference: https://gitlab.com/qemu-project/qemu/-/commit/a01344d9d7

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2025-12464.patch            | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index fd1a8647df..2866cbe7ec 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -129,6 +129,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2024-3446-0006.patch \
            file://CVE-2024-3447.patch \
            file://CVE-2024-8354.patch \
+           file://CVE-2025-12464.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch b/meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch
new file mode 100644
index 0000000000..6099fc79cd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch
@@ -0,0 +1,70 @@
+From a01344d9d78089e9e585faaeb19afccff2050abf Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Tue, 28 Oct 2025 16:00:42 +0000
+Subject: [PATCH] net: pad packets to minimum length in qemu_receive_packet()
+
+In commits like 969e50b61a28 ("net: Pad short frames to minimum size
+before sending from SLiRP/TAP") we switched away from requiring
+network devices to handle short frames to instead having the net core
+code do the padding of short frames out to the ETH_ZLEN minimum size.
+We then dropped the code for handling short frames from the network
+devices in a series of commits like 140eae9c8f7 ("hw/net: e1000:
+Remove the logic of padding short frames in the receive path").
+
+This missed one route where the device's receive code can still see a
+short frame: if the device is in loopback mode and it transmits a
+short frame via the qemu_receive_packet() function, this will be fed
+back into its own receive code without being padded.
+
+Add the padding logic to qemu_receive_packet().
+
+This fixes a buffer overrun which can be triggered in the
+e1000_receive_iov() logic via the loopback code path.
+
+Other devices that use qemu_receive_packet() to implement loopback
+are cadence_gem, dp8393x, lan9118, msf2-emac, pcnet, rtl8139
+and sungem.
+
+Cc: qemu-stable@nongnu.org
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3043
+Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+CVE: CVE-2025-12464
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/a01344d9d7]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ net/net.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/net/net.c b/net/net.c
+index 27e0d27807..8aefdb3424 100644
+--- a/net/net.c
++++ b/net/net.c
+@@ -775,10 +775,20 @@ ssize_t qemu_send_packet(NetClientState *nc, const uint8_t *buf, int size)
+ 
+ ssize_t qemu_receive_packet(NetClientState *nc, const uint8_t *buf, int size)
+ {
++    uint8_t min_pkt[ETH_ZLEN];
++    size_t min_pktsz = sizeof(min_pkt);
++
+     if (!qemu_can_receive_packet(nc)) {
+         return 0;
+     }
+ 
++    if (net_peer_needs_padding(nc)) {
++        if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) {
++            buf = min_pkt;
++            size = min_pktsz;
++        }
++    }
++
+     return qemu_net_queue_receive(nc->incoming_queue, buf, size);
+ }
+ 
+-- 
+2.47.1
+
-- 
2.34.1


