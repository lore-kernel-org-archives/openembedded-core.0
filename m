Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B0BC44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 06:35:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6907.1784183696991952790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 23:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bm3Vq4hv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1657c3127e=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3x5fM1844095
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 06:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=/5RiNHNkR
	8xgJz/jEZ9p8e9LxnR4MsrrJK0N/bVVWas=; b=Bm3Vq4hv81r1PJyhzMsnKKexe
	4zJ7Grm8CvVlwQRFcgrkXi7RPDcKQ3ivcaNJ9wvCCfs/9zWzV0InNIpEymLSoibo
	PDGw/dFD5m5U9cb49ptCjNIQYb/vKxdROX581aE9WrlveK3QWQCaDGEwuZ+FpfXc
	DwoiaJjJNZ+0E5h2DIHni+SuhmeVvKCamQqND3zi9jNfS3+E8byYYd5slqCYUCHw
	d4JeQWc2KhypGnQulCBplIsj/qusTJxeZTOKTpuvrKCzF+CfC39kDXCiESOiR09S
	0ZpEBZ4PuZVFypQFzf+jsYYX4x/Q7BjN2Li/a+oZxkQ81GJPtuKCS1cWj9K+w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbct4qmfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 06:15:21 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 15 Jul 2026 23:15:19 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 15 Jul 2026 23:15:19 -0700
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>, <Shiva.Komati@windriver.com>,
        "Himani
 Ramesh Barde" <HimaniRamesh.Barde@windriver.com>
Subject: [PATCH] systemd.bbclass: fix service enablement for cross-install scenarios
Date: Thu, 16 Jul 2026 06:15:19 +0000
Message-ID: <20260716061519.765593-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=J9CaKgnS c=1 sm=1 tr=0 ts=6a5876f9 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8 a=eqJagXuFR_UGHyBZsbkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA2MiBTYWx0ZWRfXwN9KMRL/NI3l
 Zroftk5Akh9XdINtD8j+aoVQz3UAplwjaYHt/lts5nc96EXFD7jJM817e4mHMUYcL9rlkuPEERV
 tHp+bgodrYFGkeb23Dj/B+YuROg8ZqCwht0kydElQpN2wyye9pRe
X-Proofpoint-ORIG-GUID: t4wKy7d7FHoQkINgyWQ45eWKLcKDRxef
X-Proofpoint-GUID: t4wKy7d7FHoQkINgyWQ45eWKLcKDRxef
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA2MiBTYWx0ZWRfX4YKUazAkRfNa
 +xdHXRl6ICMOvoQO6Bf+/P76oWAplMa84Tsq8I1V/fEspjPSOPzL3W5NY1BsRBAr/RiCwM9WnOs
 wN1cR6xSpskwUDKPqhB6rZNIGfbhWf1iGuCRTLIp72TkVgTs3EpopdQjA/TTub3g6wlLWYcl2oL
 CChLG/787IttWgAVASZDkpDAU+kxjMEDC7FwW6t+nA+ei7fBDwvxeTxvkZtW0/dVExDY57/gxnL
 mLl6JwYZ1v+D5NOJDt8ZJJ8aHgu7eyOyOgBlP6/nFnohhYPSe16rRuDcolMSthnRZMDoeMtJAKX
 VFRPvBRHFTu0fq2Nc5TWGo36d2jue3x8DciC2w4yIrGGKeZdE84RWPZ7sA1GnWa4MTQUTcPmGoQ
 UhyAp6oNi8yf0G7WJmYJx6KHcbcxydNTC4/dQ7UDLS+ODsm/UIsZxPSSB9xrThFis9MipHQNp3j
 fct95Llxf8fK7+6NGog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160062
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 06:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241053

When packages are installed outside of Yocto's normal image creation
(e.g., using multistrap, debootstrap, or dpkg directly on a host),
the postinst script fails to enable systemd services.

The issue is that the entire enable logic is gated behind
"if systemctl >/dev/null 2>/dev/null". In cross-install scenarios:
- If systemctl is absent on the host: the check fails, script is skipped
- If host systemctl is present: it cannot find target unit files

Fix this by separating the offline ($D set) and online ($D unset)
code paths into distinct branches. The previous code used a single
OPTS variable to switch between "--root=$D" (offline) and "" (online)
within one unified block. This variable is removed because the two
scenarios now have dedicated branches with different logic:

- Offline ($D set): Tries "systemctl --root=$D preset" first, which
  reads preset files from the target rootfs and creates symlinks
  without needing the host systemctl to understand the target's unit
  files. Falls back to "systemctl --root=$D enable" per service.

- Online ($D unset): Same as before - enable, daemon-reload, preset,
  restart. No behavioral change for on-target installs.

The OPTS variable is no longer needed because each branch now directly
uses the appropriate systemctl invocation for its context, making the
intent clearer and the offline path functional.

Fixes [YOCTO #14118]

Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---
 meta/classes-recipe/systemd.bbclass | 32 +++++++++++++++++------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 0f7e3b5..2f655c4 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -29,26 +29,32 @@ python __anonymous() {
 }
 
 systemd_postinst() {
-if systemctl >/dev/null 2>/dev/null; then
-	OPTS=""
-
-	if [ -n "$D" ]; then
-		OPTS="--root=$D"
+if [ -n "$D" ]; then
+	# Offline/cross-install: apply presets to the target rootfs.
+	# This handles multistrap, debootstrap, and similar tools that
+	# install packages outside of Yocto's normal image creation.
+	if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+		if systemctl --root=$D preset ${SYSTEMD_SERVICE_ESCAPED} 2>/dev/null; then
+			:
+		elif systemctl >/dev/null 2>/dev/null; then
+			for service in ${SYSTEMD_SERVICE_ESCAPED}; do
+				systemctl --root=$D enable "$service" 2>/dev/null || true
+			done
+		fi
 	fi
-
+elif systemctl >/dev/null 2>/dev/null; then
+	# Online: running on the target system
 	if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
 		for service in ${SYSTEMD_SERVICE_ESCAPED}; do
-			systemctl ${OPTS} enable "$service"
+			systemctl enable "$service"
 		done
 	fi
 
-	if [ -z "$D" ]; then
-		systemctl daemon-reload
-		systemctl preset ${SYSTEMD_SERVICE_ESCAPED}
+	systemctl daemon-reload
+	systemctl preset ${SYSTEMD_SERVICE_ESCAPED}
 
-		if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-			systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
-		fi
+	if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+		systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
 	fi
 fi
 }
-- 
2.54.0


