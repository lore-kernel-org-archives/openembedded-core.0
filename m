Return-Path: <rouven.rastetter.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D25E9380F
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 11:26:40 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.270145.1776079590060765485
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 04:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=NW3QG3+R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=25637fb8b7=rouven.rastetter.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D4UL0j305796
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 11:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=N6ktZ
	c6Ko218aYNd9JYvXmCRd5VKVyJkUWi2BTd708I=; b=NW3QG3+ReLtNkqVl5c/Gl
	krUZz0JYs/Bp3EP5hFnl4mHizJO6/wjhTGDgssck+nm2WvvwyoUJ9BGTNrYfPNwx
	f1oXPDv31W73UodgJLM1wqB+4Vwl0nTikL7HU2jXy8YkeisVINR6MmWXLADHAmoA
	qVI/TtvKRebGdcd61kRaMlBmfUtvsnCGJ/6cW2juBsXfCABHGdXgygpGQ2Kozgni
	s2FqDaG/XaMNemwWcHmV+PqkDGD6Rqh/Kh0nzOqARNGjYKQNMBYzPiJVAx48n/M2
	BxJkqtpVoJAchUo8JVQ0nE9cBXKCBuBO3XV/5/eMIwG9YFnYU0zp7xxys9nlQJmz
	A==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4dfenmmu3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 11:26:28 +0000 (GMT)
Received: from TUT-EX02-PV.KSTG.corp (10.0.10.191) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Apr
 2026 13:26:27 +0200
Received: from tutn-jjhfqf4.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.191) with Microsoft SMTP Server id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 13:26:27 +0200
From: Rouven Rastetter <rouven.rastetter.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rouven Rastetter <rouven.rastetter.ext@karlstorz.com>,
        " van Veen,
 Stephan" <stephan.vanveen@karlstorz.com>
Subject: [PATCH] qemuboot-x86.inc: Allow override of QB_AUDIO_*
Date: Mon, 13 Apr 2026 13:26:25 +0200
Message-ID: <20260413112625.2637924-1-rouven.rastetter.ext@karlstorz.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Osl/DS/t c=1 sm=1 tr=0 ts=69dcd2e4 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=DBWTBMGyQNCzyBkTEoZL:22
 a=-VCclSYHLTda9MBvNMHz:22 a=n9SCklZpAAAA:8 a=L1KePfvNHZOaa9oKFGkA:9
 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExMiBTYWx0ZWRfX+IQDWV9aEgFF
 Z0Llr2BW0xzjtE3jNXILhOBVLoIM9/zA1HmBbd+S7A9wxK8bJ5OS9UoNGTx4UohcY8epICwaWas
 owswwIUGR3luXgekAzEir3HGVwYuZFzMVK/JElV+VcmCbVZb3CPCec+vbc0MxiEWd6uyR2pwEsy
 HkFlwhIBtF/zPJGD0yCnBuo9ifsth7UBHfW3QbsT+o0uML8GmEkUa2YQ+oJ2pGqJqzmyTjs/sQO
 rxO4SSDGn8gmsxUgJ2Iy8WduIL+ArNxsn+9LipUa/K52ZZR9xdtDlTzucvpZrbYjpYQJJVG3WRm
 4FzstTjgyxxP2zFCBmEwJ+uImWHZ8AACp1M1U6vXUGj+MWrT/2Op1nzkH14UEzlZ6v6XqQnZchj
 zAn5N7hoERCSTXX++bM3wIZuZQLjHDYK0c48oWe7wzA6m4A/TvCoGglSDoDk5Ta5vn/6ldLx4OP
 rV/lAL28J9jPjIDvSyg==
X-Proofpoint-GUID: RRREN0NFwvPjbp_jAneMFEXDwjQQ_mTb
X-Proofpoint-ORIG-GUID: RRREN0NFwvPjbp_jAneMFEXDwjQQ_mTb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 11:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235103

This change allows to overwrite the QB_AUDIO_* variables from e.g.
local.conf, to e.g. set the audio driver to "none" or "pipewire".

Suggested-by:  van Veen, Stephan <stephan.vanveen@karlstorz.com>
Signed-off-by: Rouven Rastetter <rouven.rastetter.ext@karlstorz.com>
---
 meta/conf/machine/include/x86/qemuboot-x86.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/machine/include/x86/qemuboot-x86.inc
index 82ef4a0b73..3234e8cbf0 100644
--- a/meta/conf/machine/include/x86/qemuboot-x86.inc
+++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
@@ -7,7 +7,7 @@ QB_CPU_KVM:x86 ?= "-cpu IvyBridge -machine q35,i8042=off"
 QB_CPU:x86-64 ?= "-cpu Skylake-Client -machine q35,i8042=off"
 QB_CPU_KVM:x86-64 ?= "-cpu Skylake-Client -machine q35,i8042=off"
 
-QB_AUDIO_DRV = "alsa"
-QB_AUDIO_OPT = "-device AC97"
+QB_AUDIO_DRV ?= "alsa"
+QB_AUDIO_OPT ?= "-device AC97"
 QB_KERNEL_CMDLINE_APPEND = "oprofile.timer=1 tsc=reliable no_timer_check rcupdate.rcu_expedited=1"
 QB_OPT_APPEND = "-usb -device usb-tablet -usb -device usb-kbd"

