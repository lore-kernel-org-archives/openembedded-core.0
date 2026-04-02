Return-Path: <mohammad.rafi.shaik@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8281BD6AAED
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 16:22:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.312.1775146913210432828
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 09:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YlHeNJWC;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XymZN+5i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: mohammad.rafi.shaik@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4VrL1380694
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Apr 2026 16:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JV2LDmWzwEBWkaZ9rdmoeFyuypjLOJUZchQ
	EOFs2ZRI=; b=YlHeNJWCMqJuPu+mnhd2B0efsepqnpKHIbgWX/lCmp2WFplXA6o
	nAslMY0b12bLdske9H2tJJDaesTU43E0YfNMit9AYkrkErOoW2hT1v1kt/0e6/5q
	Fa3glfhqRA7HuYfHXN+NDGugk+jaHiY3d/OolcQMkNnkGv+fOctEI/7FW8U+lK0q
	Xtmhbx0TWMCbGBR7wH6S384L+LurHaG2c1P1HOh5ZWvfC/TGDaYIdGKVF+YTM5ku
	+bcXatkuMJqNfag0i7nwlXVhPLM1CFg3fEDpIJpe/3Na6rFJb3d9HbV2mxTbx9IS
	WmpAQtPqVf2OzLpBPsjJSqFzSyTIFgwHjZQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myh9w1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 16:21:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso1062103a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775146912; x=1775751712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JV2LDmWzwEBWkaZ9rdmoeFyuypjLOJUZchQEOFs2ZRI=;
        b=XymZN+5i4CKRpzTt9AkVCjxt1JOHXaczxZB2hiZNeZFecf4rcoL1fMiIGdIuj/JbeY
         20dS0KOgiMIV5gNYmDrAgikE3fiM5s9UtDhzw0E/7EKmCjIonRKGMtcKIuGZrJYQRsQw
         kn8GVsBWLCRbvJqoqDWaYRt1WPbmAhLayj4e1Odnl21saR3d1FE0bzC0V0Mjq9pskt75
         6Xi4OTn2VW6DUMbQdYpuDCUjed+ew9hwyq5SoaJFAi9tAb1++9qKCH7SR5YnXJj/maUF
         U7Kslrm8LNwhQHIPggf6uJQ8Va9qD4cYlV+EpP0/k64p9ToIj8RdB1/mLn9CYcKlbmMb
         kO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775146912; x=1775751712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV2LDmWzwEBWkaZ9rdmoeFyuypjLOJUZchQEOFs2ZRI=;
        b=sH0aD5dzMEDMlxouRyaGDdqSJBbaaWiJyEf1KcwuGuas4zUPNGyu5l1Z1YUThpYC8S
         +AC/AmGTmAuVXLFAUMWLd1YNTTagirajSJAKCp5xcIrm6dGPgyZWSrE5g6r4Pd6d6+NQ
         +JwYd0St+OCWSLoBG1JF5l9EY4/T7+tFyfQBEo4e2GzMxxSgSmGe6IEpGpUu9eHoyxMC
         KGgzON2inRCJ6r5YdgQfQNc+HwrBP3xkpElSDUPIwhIbYHy/mwjfu22yulTATh2B/xFL
         BOZtWxD6PsrcJCzqx2EyXowkbiUAEwl6V10lG5mSHU4rpORbdbEvfMJfmFnu6kaUiAhd
         61hQ==
X-Gm-Message-State: AOJu0YykUx3Ki+fuV1h/CVgbgHq2wbMGiJXeLxe+f05DxnTEBp3vOSn9
	hxAGi79xiT0NeyoXdz+zDRiDH6TpeRj8vcrhQDTpPeatvliO5hzQ60ocIwgxuKHOcinKQen3YVp
	7hO9h85yVNHpLjKEMQV618OQq8jhsNu5T9C3gBvJix42TDG6UEXHZnF34LxS+F5Kb4xqr05WTaZ
	uUv+wEsW5ZK96A0MU=
X-Gm-Gg: AeBDievZpjYRLXBJCzLmh1yRlIRv84JQ+uvfpFuXMYQyRtHhuuy1T51Nd6ix9IgDiYc
	O7vdXTftZQ39UwEw7a18BHcDAW/8tzr+7SXVOSsyrzAQHxEnub8KTN3VTdiEKyfgVdFAMZMnxi1
	ZuLYVX8/0G6vxpwhs/S6PenqbrRhpY/Qsz2QjtJxcf7Wy3bqxwdnVWdUPCAEuOLLtSiSCsjLyzp
	FRv0PlpNiF912J1/q9WNuE74kFv3P/ZLAHR5fUIU+rNCp3+nrDi2P+PBIRk7XOihRc5PVyMBips
	220++0SscpS9Ja1tJlTHxOd4G4e/qe8Ebnumxq27m4LlpRoa6nQQcHiNEioacpPIGf3RUKx+xlp
	t3vlY6yUtn3wJELw5Aq7NP4Wug9qb1Jt0i0w+ZrP51hLHCMtSCIyLIxBEtQ==
X-Received: by 2002:a17:90b:1f81:b0:35d:9f7c:141c with SMTP id 98e67ed59e1d1-35dc706b509mr8113402a91.27.1775146911583;
        Thu, 02 Apr 2026 09:21:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1f81:b0:35d:9f7c:141c with SMTP id 98e67ed59e1d1-35dc706b509mr8113363a91.27.1775146910959;
        Thu, 02 Apr 2026 09:21:50 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dba5d9529sm3065434a91.3.2026.04.02.09.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 09:21:50 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: sbojja@qti.qualcomm.com, Tejas Kanfade <tkanfade@qti.qualcomm.com>
Subject: [OE-core] [PATCH v1] pulseaudio: split pactl into a dedicated client subpackage
Date: Thu,  2 Apr 2026 21:51:09 +0530
Message-Id: <20260402162109.3523797-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gNp8vVAajbaiTTIeu8WMOTBgJrW8zNU6
X-Proofpoint-ORIG-GUID: gNp8vVAajbaiTTIeu8WMOTBgJrW8zNU6
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69ce97a0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=e2ehYq9yfwDmQqE590EA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE0NCBTYWx0ZWRfX4VbYFi2Hdhb7
 Ca/+n6x9EY3KvY13aJH31CemxqWBKOYOY2Wr5NcXx2+MQ3C99LwHYOpIxc+KimQGnkWykPW8ub0
 Xa6shNs/ye1x2DVzjCRhR4PG4cdYqePNOBnaWsSq8znOhl+3nGNO0dyHozigvk51A6lk8HkoitA
 63fNyKBWrELRnBlte8tzbDDJgulOtUeyfy8j+lCwlIq35AbGa+4zqp3fsUUKOycSqhKS1SzflHL
 6Z68amAtMYMeoah70hBJfj4gt/rQnCZnqrw6Cqqtc2iiC555eUvkASmS1acjxyAc+5e2Gi+Jf1g
 1JGJE//71vgDAyPBr3pFOmEdgRXoUMll0zhpYFKaVn/Kb/I0M123fwnJc7Cm6XPfv+Gmf+4po74
 rDEBm0Tak2IMBGQka5eGupbar7d0D64myO4xskPGbLED1PXcAnT6kT4bXMOa3C4tuiiSjNjTL5o
 lC5OYC/DKd0b/H9GjuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 16:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234545

From: Tejas Kanfade <tkanfade@qti.qualcomm.com>

pactl is a client-side control utility and is required on
PipeWire-based systems for audio control. pactl was packaged
as part of pulseaudio-server, making it difficult to use
without also installing and enabling the pulseaudio daemon,
which can conflict with pipewire.

Move the pactl binary into a standalone pulseaudio-pactl subpackage
so it can be installed without pulling in the pulseaudio server.

Signed-off-by: Tejas Kanfade <tkanfade@qti.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index b9dc8e236f..fe1da6a82b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -166,6 +166,7 @@ PACKAGES =+ "\
              libpulse-simple \
              libpulsecommon \
              libpulsecore \
+             ${PN}-pactl \
              ${PN}-pa-info \
              ${PN}-server \
              ${PN}-misc \
@@ -194,8 +195,9 @@ FILES:libpulse-mainloop-glib = "${libdir}/libpulse-mainloop-glib.so.*"
 
 FILES:${PN}-dev += "${datadir}/vala"
 FILES:${PN}-bin += "${sysconfdir}/default/volatiles/04_pulse"
+FILES:${PN}-pactl = "${bindir}/pactl"
 FILES:${PN}-pa-info = "${bindir}/pa-info"
-FILES:${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
+FILES:${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
 FILES:${PN}-server += "${datadir}/dbus-1/system.d/pulseaudio-system.conf"
 
 #SYSTEMD_PACKAGES = "${PN}-server"
@@ -227,6 +229,9 @@ python populate_packages:prepend() {
     do_split_packages(d, plugindir, r'^lib(.*)\.so$', '${PN}-lib-%s', 'PulseAudio library for %s', extra_depends='', prepend=True)
 }
 
+# pactl is a client tool; it requires libpulse and a PulseAudio-compatible server
+RDEPENDS:${PN}-pactl = "libpulse"
+
 # pa-info is a bash script that collects information about the audio setup.
 # It's primarily useful for attaching an information dump when reporting bugs.
 RDEPENDS:${PN}-pa-info = "\
-- 
2.34.1


