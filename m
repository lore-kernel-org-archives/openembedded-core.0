Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEF7D64088
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 07:51:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9670.1765957883826085413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 23:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rwH4a5cL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4446912528=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH5RiV81116634
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 23:51:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=RExC4Y5QVTmR+59QXDFs
	a8wuDp6mFllNkEOd6E3j2i0=; b=rwH4a5cL+HvSWP1XvWDaOqdCrFJ4676bcuOX
	ku7EBSpkQM5fGqjTnkcBDxQnjQ6AxCkvxsbLFT9cWi3RsCtIA8iw6jmFTO4AKoCr
	FYTzZS9HsR2gb3buj6JJuMQUChIetduQc1Xyy30+XRQ2R7rq2iHltR9nfjj6r6Qr
	wLFkUjt0pggr8sF0oy2scBeDZwQB9f7pcUG28dezPOdwlGElywc+oZdKWzBlOYJG
	CYGu6sTrrW/b0SED9rq5mFtM2a6nnHcU4jZ4i9cA1q+TPRcPN2rM1/IAJsLveHFt
	YqMfvxf5YSUxp341OqtLFU0AEDcZqHxXLDzxKugH4vuF7TD+dA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j08t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 23:51:23 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 16 Dec 2025 23:51:22 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 16 Dec 2025 23:51:21 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] qemu: fix CVE-2025-12464
Date: Wed, 17 Dec 2025 15:51:18 +0800
Message-ID: <20251217075118.380338-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=694260fb cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=p0WdMEafAAAA:8 a=ID6ng7r3AAAA:8
 a=t7CeM3EgAAAA:8 a=KKAkSRfTAAAA:8 a=69wJf7TsAAAA:8 a=20KFwNOVAAAA:8
 a=rQuykwKOvVSuO4N8f10A:9 a=AkheI1RvQwOzcTXhi5f4:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=cvBusfyB2V15izCimMoJ:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-GUID: odCYfuwdQgRURbH1h_PZ7HOsDnVJU2uO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA2MCBTYWx0ZWRfX4FOb+TnVKdQb
 AHkCy1XLBZ8SpQpjrxyScNzom9zXpZbhshu3HGFOyRxKwxL+q/f9OxXJxkKiDITvRNFd2hRp7fy
 hdr2qMg5DFr3H5k+tDTnjsyIaYM6JUcXYwyBFpaNmeYLa4/jrdW48A2Rku12C+hDa1wr+RKJFsM
 gmsuPgCrpfb9G4qGvdhBliJU4IocAp/0MPDJ538MOvgSY3z17r8ItITvLwVZXU/WkEXToUvc+rt
 at+ALJawLvnDjWsjHZL163+t9q6Vb+iHWk92s4XRCXVKFWaWeYpSOaeZ6z0R0wxw3M98VjBl4Fq
 TV11LJ4zUQSldYtdm2EQLUIBfnjdEWk8TKYt3NLJKNt44HE/RyzNyB0x7jda36fjE1FItEBdhDT
 U4VTXzHJGD1eqrByp2Xu5vhFgq/Mww==
X-Proofpoint-ORIG-GUID: odCYfuwdQgRURbH1h_PZ7HOsDnVJU2uO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 07:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228002

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2025-12464 for qemu.

Reference: https://gitlab.com/qemu-project/qemu/-/commit/a01344d9d7

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2025-12464.patch            | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 60d372fce0..dde3b0be13 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -42,6 +42,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
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


