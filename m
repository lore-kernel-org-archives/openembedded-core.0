Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BC7C44512
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 07:05:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42552.1784703758882842985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 00:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Me4wKx9D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=16634ecc35=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M50sMx158090
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 23:47:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=vYrvBOGAfDUzLfPOPJFrMW2E67Tj1Dc8fYaFOjvK9EI=; b=
	Me4wKx9DlyYVBJqvRpkd3nQaE5V0AYEGaHTk7T0se8UJoOrzUe45eFhLJaCdTucB
	r15VxGK+G5f0a8RTjVabayvgFbhJfh4g0N2Vd3jFZ510EPiUk8U3wkswh7byyaJr
	Hcvfg4hJy+L2PS+0LmxiNL0w1e6Wx0TCMPHA9iOaeiDdSiLHBLD4yY+RWouycYLA
	bDFW19RHKL6viBsT+ZuCpOw3GMUzVzUnvzYVi0tZ56uE9VWrWo38dtTfkIuILR42
	QrhAqDObDLcRAMeHnWpgavgAaNmGPiXR5b0QpfRW7iyEpRvHOwuIiUFYEAaoEWb6
	69oIetGZnQBavT0ew7dVAA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fg4ryqf6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 23:47:31 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 21 Jul 2026 23:47:30 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 21 Jul 2026 23:47:30 -0700
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>, <Shiva.Komati@windriver.com>,
        "Himani
 Ramesh Barde" <HimaniRamesh.Barde@windriver.com>
Subject: [PATCH v2] systemd.bbclass: fix service enablement for cross-install scenarios
Date: Wed, 22 Jul 2026 06:47:30 +0000
Message-ID: <20260722064730.3212268-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716061519.765593-1-HimaniRamesh.Barde@windriver.com>
References: <20260716061519.765593-1-HimaniRamesh.Barde@windriver.com>
MIME-Version: 1.0
X-Proofpoint-GUID: S9ONK6A6mkLacEOyJt3KnoG25nN1GLy6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MSBTYWx0ZWRfX4kpHBq2ZqY1v
 WY996T105oOFeABSURjjTjNt8551IdRtvn8wJZszyVUXp+g1rqRtqTjoNEoMO6tUwxXCaRpas1p
 wWvlJj7FqY5tN/l4Pz9X4V8vL0S0asMu1he+l7Es7WgzlFHkeRG8
X-Proofpoint-ORIG-GUID: S9ONK6A6mkLacEOyJt3KnoG25nN1GLy6
X-Authority-Analysis: v=2.4 cv=CfQ4Irrl c=1 sm=1 tr=0 ts=6a606783 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=A1W1FX-mHNmlLdSUdnYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MSBTYWx0ZWRfX9VlI42+AWVng
 KXlOaA3fVpgp7+5i4cvaMpWBYLnzrBEfibi5KQO3RtFSCiX6GavRxJKp0Iu+iQIiZ5taIcNwg/Y
 KVytoYQ0p3QkFkUoa1Vr4zr5YLBgtCAVSPK8KrBQ6sPlpyPIKfGyZq9Jk3vvwKCxdtgPs8XYkqh
 eAFwKe5I40/EA0NycP3P/vgNoj9a7TJNWCINpHz/dFFhis54XFwajn7bW+b7H5QwGc8jfH6dFno
 RRSD/P1ct7tePWuIlSGYWIfE008gpmUhJsgQVtVr1x0gyTv1sX+XAEH8IpOZeelzxQEaJX+SBSx
 xN5sN8Z9CBhhCsPOlFkMJIAKhOAKzhW9VrwBu7E7syim/FkmrdPxBavr80EH4Mk5KaUs8TbT8Kl
 gy66vtkDL+XEYRBTRrtGpKuh8R9E02sr6gyZXbc6bRX19Fz62O5BdYD1lZR5s6/xegxM269tAuM
 OqVJ7yQPbL4QI+2udSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220061
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 07:05:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241603

When packages are installed outside of Yocto's normal image creation
(e.g., using multistrap, debootstrap, or dpkg directly on a host),
the postinst script fails to enable systemd services.

The issue is that the entire enable logic is gated behind
"if type systemctl >/dev/null 2>/dev/null". In cross-install scenarios:
- If systemctl is absent on the host: the check fails, script is skipped
- If host systemctl is present: it cannot find target unit files

Fix this by separating the offline ($D set) and online ($D unset)
code paths into distinct branches. The previous code used a single
OPTS variable to switch between "--root=$D" (offline) and "" (online)
within one unified block. This variable is removed because the two
scenarios now have dedicated branches with different logic:

- Offline ($D set): Uses "systemctl --root=$D preset" per service,
  which reads preset files from the target rootfs and creates symlinks
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
 meta/classes-recipe/systemd.bbclass | 30 ++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 26eaaf1..c209bb3 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -27,24 +27,36 @@ python __anonymous() {
 }
 
 systemd_postinst() {
-if type systemctl >/dev/null 2>/dev/null; then
-	OPTS=""
-
-	if [ -n "$D" ]; then
-		OPTS="--root=$D"
+if [ -n "$D" ]; then
+	# Offline/cross-install: apply presets to the target rootfs.
+	# This handles multistrap, debootstrap, and similar tools that
+	# install packages outside of Yocto's normal image creation.
+	if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+		if type systemctl >/dev/null 2>/dev/null; then
+			for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}; do
+				systemctl --root=$D preset "$service" 2>/dev/null || \
+					systemctl --root=$D enable "$service" 2>/dev/null || true
+			done
+
+			for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}; do
+				systemctl --global --root=$D preset "$service" 2>/dev/null || \
+					systemctl --global --root=$D enable "$service" 2>/dev/null || true
+			done
+		fi
 	fi
-
+elif type systemctl >/dev/null 2>/dev/null; then
+	# Online: running on the target system
 	if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
 		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}; do
-			systemctl ${OPTS} enable "$service"
+			systemctl enable "$service"
 		done
 
 		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}; do
-			systemctl --global ${OPTS} enable "$service"
+			systemctl --global enable "$service"
 		done
 	fi
 
-	if [ -z "$D" ] && systemctl >/dev/null 2>/dev/null; then
+	if systemctl >/dev/null 2>/dev/null; then
 		# Reload only system service manager
 		# --global for daemon-reload is not supported: https://github.com/systemd/systemd/issues/19284
 		systemctl daemon-reload
-- 
2.54.0


