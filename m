Return-Path: <mohammad.rafi.shaik@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A9FF327A9
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 06:01:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12021.1776751296578819253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 23:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ihjxL7Th;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Hw64rvU+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: mohammad.rafi.shaik@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5fkfl1014378
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 06:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=i7XsLFdLMUNi6ymMVzXdDftIVwn5MU4Eg1L
	PSstB6ws=; b=ihjxL7ThIHwVIJwlqVhE+Vf4BpOICy3clbMwNGc0zBI43yTVJFs
	R/+o7LV/+9n0FwE3lnZ/D2AmfDTjgIP0tUQdYVEksBrXQnetmLQ/v8DUHPCxmOHg
	SYZOXEcZyymlkB8T6vj9xwcLWL27KcIghiuAIfJa/ZcZEG4aUm6qAqweZJvYN+l8
	cTvRV2fP2sfglVEeSWvvwWAQ/AkgUK8Hwkk79t2NqZUwQYHXxP/tiR2J/sR2W6wJ
	/f0ujHWMCLcFcGk6ePMpgoELYE+191eI1fuVHNTu5Sg3L08VMxUvNflZF3ZDr7gw
	OH2r6QhYPU0iubN4VBmFEl8kSssMM1Z5Hrw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt901qr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 06:01:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so6989642a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 23:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776751295; x=1777356095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i7XsLFdLMUNi6ymMVzXdDftIVwn5MU4Eg1LPSstB6ws=;
        b=Hw64rvU+95ExWN2kbvH9c0PCz1GzkaJ11ybyN22+tyvOZNrO2SqP9tgOH8pilRpJgg
         2iTri4qjsnsX+Wcp7VsEz5YLONVVZAHg3yJZAoy6tMiG2oQyYYF9W0MGSv9STBB58Fne
         9hvj+U4haiYmwGeeX9tsZjdI7WvaTS8QVA6B5KFRbhJHcPNUoqTkhroFPtkTAyxENpNq
         8MQHTV1EDPLAbBWOWCe/4yT79ShfiMae5I1hTvNbdRSoJt/DIxmytn2nb0t54q1dtg32
         0foYJRRbPjDDDy1Xnq5uLqZegH79zmkdKrOdAZ2OKtdakgENuvdrgiyXuCrzNOVeu64F
         3RkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776751295; x=1777356095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7XsLFdLMUNi6ymMVzXdDftIVwn5MU4Eg1LPSstB6ws=;
        b=YZDUpsMxYZKiSY2j1zhGha2m77Bp0/AhqwZdaX5/uyZhsycYMgTyc1XR/RnQxuu64F
         tl/iKvT1Qlen2Gfi6asmnCCbe+/2D7kGr++YGSMdRhusYyfkAgeeKrKl8mPL/xuXr6gV
         SKybjEOHXFj4QqOYpm1GergfpOcTycnmvkXp5YGC8tTcNasw1CZjJmvct3n2PIi3DOrr
         cvktzEfgECuJUIYkWEPlxl4tP8pNMMscmxuo5r6Cd17xRXiOelzQ6lfRFXCM4pQQyXmz
         J+uEw9a3x32t3CmZMINQZVKf50o9qsutV+t1MyXnoKRhdMR4qq0w6HXtpzOQlqO/0Lml
         NJlw==
X-Gm-Message-State: AOJu0Yz3+lMeTHx3PCU/4FXatXQNO3mbxyBseuTB1BWHvCb+ZP5xiuVm
	z5UEAS3Ny+Gx7CWR8lqGKdY8hastF7YfTcq82keHkL1MLdRcGbyIaHdLMrqCqL0ub5lTgoBHZm/
	hMSCyviyWr4rEcvEdWDhZNvSux/Kj40LZvMIsTm5e4wbTzbXQrpeF8XWffTndOVVBBJwOW2NZD9
	nYAD95tiscGMp7d9s=
X-Gm-Gg: AeBDiesO666UfSiOwsxzjUHl6VtAg1FRUZMRo+Tss+aEZT4mORNtBi6O+MO+mA1IOgB
	mz0Se/CQc2DWmDzncDrmNPrV/XjF1RW6MuAg6HbjtzwafM0slcwewYIsKqQkhluiRB/l5F0gLpQ
	ZbfwhnAToJi++iYkxl/EcrUW7hU3I3+5mR+P1zmwMtT35LiDI2uvNPNspIcmTuDhaBQC60KqbZy
	A7XSp4ZJa5/mP2ecTPH7pIeDwwVbXUmArPhaXeWn8hupT6dK+mgZuirLmRytnKNPAN0tOrqJJ7y
	CP6Q2VFzjL9u3Vz3kB5CSYrXbVeIG3E+fYMqEF4DBDVN0Q22JESysCLan8nYewI96sbJxqEVOYd
	B0vcojzDqmWFVWvnmhYe0gDpOy0+mxPtk0+8WhCEf3fjDxrSJAj6+68n9cFNrRCBP+jkb
X-Received: by 2002:a17:90b:2892:b0:35f:b5df:456 with SMTP id 98e67ed59e1d1-36140463bb0mr16800402a91.18.1776751294998;
        Mon, 20 Apr 2026 23:01:34 -0700 (PDT)
X-Received: by 2002:a17:90b:2892:b0:35f:b5df:456 with SMTP id 98e67ed59e1d1-36140463bb0mr16800346a91.18.1776751294249;
        Mon, 20 Apr 2026 23:01:34 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa16e72sm122135895ad.19.2026.04.20.23.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 23:01:33 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: sbojja@qti.qualcomm.com, tkanfade@qti.qualcomm.com
Subject: [OE-core] [Patch v2] pulseaudio: split pactl into a dedicated client subpackage
Date: Tue, 21 Apr 2026 11:31:03 +0530
Message-Id: <20260421060103.1407375-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e712c0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=seAQGd0mmHKe6kPqnI4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: bt8Nwj328y9EnyOVm-HxoQ9BaDr6Crkx
X-Proofpoint-GUID: bt8Nwj328y9EnyOVm-HxoQ9BaDr6Crkx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1NyBTYWx0ZWRfX+yBFtZeHZCWB
 DBB2IZJjebPfwz2CmUC6+CVNFJqWjyKJ6tAJIiryhikgBZHf0DR+xKnQlpXrYICgINuQQGeeEwt
 RkyLUNMk4EeZjADJ8JBf4NrIbODB8XDhzqPh3YgchzlpC3MfwMMO43+EBUU31hmOM1/FvRV6c7w
 4WuNc3I1s5F845+ivb8MEkiq3YwhHNJ2VlWo/olgbcGeMyq6q75w43NGLEgcfPKxxK59uM71e+I
 O3cqv6LzY5o87UP8R2o6l/vnBiTEH6Mb8/TJ2a/YQsbn+cBwVDOuwN07Y8cDpAUL+g8QOOCi1j7
 Gpz4DGyzhB62IsZ1Cy7DrekhJMza3h7P3jTqhf2D8rmZFrcb8Wa5Gl5CJZgdSXaqE/1p+j7pi9M
 tiyLGvnjPMS6mqjqxw47kNoEglgc5qqh7xrjaY/iEE0GM6AyDFmzLfZrrdMrJev7pBHJ9ffIGA3
 ukQfG/+SrsHUIyPcGEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 06:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235598

From: Tejas Kanfade <tkanfade@qti.qualcomm.com>

pactl is a client-side control utility and is required on
PipeWire-based systems for audio control. pactl was packaged
as part of pulseaudio-server, making it difficult to use
without also installing and enabling the pulseaudio daemon,
which can conflict with pipewire.
Move the pactl binary into a standalone pulseaudio-pactl subpackage
so it can be installed without pulling in the pulseaudio server.

Signed-off-by: Tejas Kanfade <tkanfade@qti.qualcomm.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index a8a5a1e074..30305fa44a 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -172,6 +172,7 @@ PACKAGES =+ "\
              libpulse-simple \
              libpulsecommon \
              libpulsecore \
+             ${PN}-pactl \
              ${PN}-pa-info \
              ${PN}-server \
              ${PN}-misc \
@@ -200,8 +201,9 @@ FILES:libpulse-mainloop-glib = "${libdir}/libpulse-mainloop-glib.so.*"
 
 FILES:${PN}-dev += "${datadir}/vala"
 FILES:${PN}-bin += "${sysconfdir}/default/volatiles/04_pulse"
+FILES:${PN}-pactl = "${bindir}/pactl"
 FILES:${PN}-pa-info = "${bindir}/pa-info"
-FILES:${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
+FILES:${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
 FILES:${PN}-server += "${datadir}/dbus-1/system.d/pulseaudio-system.conf"
 
 #SYSTEMD_PACKAGES = "${PN}-server"
-- 
2.34.1


