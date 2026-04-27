Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB65FF885E
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 10:30:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40782.1777285849303609037
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 03:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pZWiwasD;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=TDSN6BpR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TGsb3682620
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 10:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6zDyOOkPtEhZDZTWNH4CGQImf+AGNhw5zVf
	+lPDngMM=; b=pZWiwasDNJDASFQmlfOgNXhsPW3/qrqx8UE5iVvFhx8bWcfxALP
	9fIqI9JR2W6ZCzx/i7qnAO5OFGIWZZiQazE+ozqoeVURnAnm4YTF2n0COujw9V8o
	VDh2RHFAC9nnkiH8pVSvLfdAPRTJ6CVvbQnK+De70LY9hiLnDNu+UBwCalL/rKal
	U9Qc7i0sJNUe0U6GKvjx83ah9KWouu+QVWgRoyjQQaWirk8xZHGuxICoKNptphF8
	yG+3pL9iMTt0ZLOrYhGCRkHnuX1O/8C2qDlG+g4n4CGSS7eJLT1jmQBUSpPEP992
	IY5Mpv8hdXHnanVumSTla6lpyrffPbdAp6g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr5nyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 10:30:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7977177675so5111456a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 03:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285847; x=1777890647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6zDyOOkPtEhZDZTWNH4CGQImf+AGNhw5zVf+lPDngMM=;
        b=TDSN6BpRyM3KHbXhNHa89eLmGofRERt7CMFX8wOwn8HKxJj3JdZtq3fsfYNeWDNaT+
         gOKA5flYM4BDbrNdrt2/E4TVhncSlgVVkQuwWiLgp9nihbXGTXKmJ+uD84nZdeMvUVhB
         pa0/+UzQJHjTWZ1lSTvD9iILFYlo1BeHU+ZbCnhz3pBeJdVJNJeX1nHaBPD0TTIyB4wn
         FbwN7tQ+J8fSCPGTIXt0R4OVV7OQkbDwwJbSrnjRKftIr37ZICzynPRT8KG26V1mLMQG
         QMIEVjt1SIO+I3TcYYjgG8KtghUseYtaE/jggzDvx1ZsjlLsUof4ofW/K88XmW6/KDUO
         uOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285847; x=1777890647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zDyOOkPtEhZDZTWNH4CGQImf+AGNhw5zVf+lPDngMM=;
        b=HP5pM6tRI+tMQc6GH88fzqwa5rw8ZH+iS1RwMQUXUypNId/pBMWFAFHJ/xCnwaknQI
         hO5v2MgnaJhgSRtMn4BBWMtxNrvPQ9g9pOuGPCen3FL+/9EPWEUsTglzjZZpJ3S35CTu
         EXH4Qo+bKPzxcuBZvQiMSrgNDJxUDgmWSI1GbexzKpZ5E6uNn2FJJYpFPKL7VHHcHEpx
         gM4n1K1mYydm/hr/9AQhy0XRz9kwr1DQ3mMzda9AlYB0kiPfdykPU4QeMnfZcCWukb1S
         baLxZ63Bfdnm96SIUdHc9EaIxMXbtfbDAVRQBc6wXjzPW296xMCEIG5cvDw9AB7dyQqJ
         aBSw==
X-Gm-Message-State: AOJu0YwDQur8ZRVy6ujjB28dHOyQ4u3G5qXEbxk8CkaK+k0Xhxi1zUkR
	Uy+OzOfvSxOo3POiCnagTQdW2aEd/PJW6pXaA4VDsDRho/xZhkL5h7FbZ2pBcsDI3aK42LC8dYG
	ID9i8twuE4DX8gV33MZt1G1mbX67cPwPa7U9zhUQqgycqSTrEzxwdj8JC/OsrYUcWes0pmeT7dp
	TzVu6QcUrMerKkbhA=
X-Gm-Gg: AeBDiev6oDYa/+JA2gO4DP/M5CWHPtZ4zW7frG8y8Fa0bDZS1XAUCUMMGyCFZ6Q1XV8
	KiornXEYziiGDtIwytv8y+tuLgYOmOpBHg3So2E9oysuM0iTfas2dJh7+0bMmM9JMqq0bHkWY3a
	lsqqhwrzr7/CuDZWqvEJ00jIORPcVdqPXXtUMEAcTkrvHK46Jf+Y5hAo5mtrZWfM6wg+s5dLZYf
	21iMt4Xw/q7wObq23LFYPtk2Ugc9LSfkvtPljh9Rc14Cywt2IFASxQzZ2KEbNUU5qERP8srl7RP
	AeGpq8CQY1N58ULusl1sAhs7jzsh5FKwf0zWkqIr+wK1GigOlcntm7pkJFruNM0071R/3UpIq/3
	JIwM9k3VvkT3fu4qFv6qJHO1x8D8ADRoslyZtDPN0JlVzDMcgCSNGVkdPhu4iyHin3pk0L2CWzA
	dB3iOsOqHBSXlUtltcZwoR9H6mYs+5hQ==
X-Received: by 2002:a05:6a00:3397:b0:82f:6c31:51f5 with SMTP id d2e1a72fcca58-82f8c830364mr47242878b3a.3.1777285846604;
        Mon, 27 Apr 2026 03:30:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:3397:b0:82f:6c31:51f5 with SMTP id d2e1a72fcca58-82f8c830364mr47242828b3a.3.1777285845928;
        Mon, 27 Apr 2026 03:30:45 -0700 (PDT)
Received: from hyd-e160-a01-2-02.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe41cfsm35025135b3a.43.2026.04.27.03.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:30:45 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][PATCH] mirrors: switch Yocto Project mirrors to HTTPS
Date: Mon, 27 Apr 2026 16:00:40 +0530
Message-Id: <20260427103040.1519121-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ef3ad8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=69wJf7TsAAAA:8
 a=CCpqsmhAAAAA:8 a=VwQbUJbxAAAA:8 a=iRxMQ_xzAAAA:8 a=36Qj4kvwAAAA:8
 a=20KFwNOVAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=4tEvIIQW2aG4pWLP63EA:9 a=3WC7DwWrALyhR5TkjVHa:22 a=Fg1AiH1G6rFz08G2ETeA:22
 a=ul9cdbp4aOFLsgKbc677:22 a=tFTt0Nb773Grf9jZcTZk:22 a=UklWUE76AaA7xuxiX2K1:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: wq_L18YrZFlH68y9GE_B47kjOj2J3ODa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExMSBTYWx0ZWRfX7WSiHXtHERdX
 BSP2+v1NQ2mDNGxjGv9wxoR3Q5dhsqwuZicIiyldinn4qP9bXYdX0O5KSvay4/cpCZVRJCRRh8p
 Y9VXXogoa6LBg3GUYW26nL7osl/LENxtgqJ48koJ37o5nTFQzPkbz445a44+tsmMgKtl8boRwaG
 7KvjmZz+ExOW9T0zl2+axx1rxGhPadsd0PE7eTnVbz1JD0Ronw7j3I/CMJxVEEGM6shuT5Htww4
 oOal6PIRZipIinPAkw/vnT3Bny5f+tM5MZdtnLOj0AiTJOWuvfRWzlxMBTaD4OLuishnuAOCDWo
 zV00ARDQ+1GxA1BOdsq0o7QOcQhTrj/DpHu2w77vyNVI4VqCa8h/knuDgkf4dZT5VJ3xiz5XeiS
 H0CaFuUf6sZAZsects+Pf7A8hLOfRE2asLkS2aamOkATMJ/w0XScQR40ByRPT+t+xNaW7buhopu
 bDVEhyl9xDs4kICwAyw==
X-Proofpoint-ORIG-GUID: wq_L18YrZFlH68y9GE_B47kjOj2J3ODa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 10:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236003

downloads.yoctoproject.org supports access over HTTPS, which provides
better security and reliability than HTTP.

Switch the default Yocto Project mirror URLs to use HTTPS instead of
HTTP to improve fetch reliability.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta/classes-global/mirrors.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index c8ceb9f5c4..c6092a6f41 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -29,13 +29,13 @@ ${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.nongnu.org/releases \
 ftp://sourceware.org/pub http://mirrors.edge.kernel.org/sourceware \
 ftp://sourceware.org/pub http://gd.tuwien.ac.at/gnu/sourceware \
 ftp://sourceware.org/pub http://ftp.gwdg.de/pub/linux/sources.redhat.com/sourceware \
-svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
-git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
-gitsm://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \
-hg://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \
-https?://.*/.*  http://downloads.yoctoproject.org/mirror/sources/ \
-ftp://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
-npm://.*/?.*    http://downloads.yoctoproject.org/mirror/sources/ \
+svn://.*/.*     https://downloads.yoctoproject.org/mirror/sources/ \
+git://.*/.*     https://downloads.yoctoproject.org/mirror/sources/ \
+gitsm://.*/.*   https://downloads.yoctoproject.org/mirror/sources/ \
+hg://.*/.*      https://downloads.yoctoproject.org/mirror/sources/ \
+https?://.*/.*  https://downloads.yoctoproject.org/mirror/sources/ \
+ftp://.*/.*     https://downloads.yoctoproject.org/mirror/sources/ \
+npm://.*/?.*    https://downloads.yoctoproject.org/mirror/sources/ \
 svn://.*/.*     http://sources.openembedded.org/ \
 git://.*/.*     http://sources.openembedded.org/ \
 gitsm://.*/.*   http://sources.openembedded.org/ \

