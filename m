Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAC6D2ED00
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 02:48:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123.1768877320826515499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 18:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Si1SWQAG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548000d0aa=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K2K2bI2637816;
	Tue, 20 Jan 2026 02:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=XXzbNssRsGkIiucV6NVZ
	yJOBCuVKTuJQAOkSftUe5wY=; b=Si1SWQAGCqvzcPTOOfoqOjoEwxmekbMhin4q
	ZIrmVrE2UHSngpNRRrudSnSItqCAm/V8BUlIMoGa5nmyMfoXcO4zQo0UUglTSGSf
	okU7O34vvjGtPfYutFsphZ8yEZAT3amBqqbPDRg05awiWM50Wt8Xh9jgMX2WnjeB
	BDMAJ9sQFVRZyNn7IGgBcS+b6UmqfugjHG3jubK+GO1CtnCZqdFPkpAVuAODMhic
	8/oNACT9gEPQpZzTJhBlBSwSDOPkrftKOAlKsOawyGflNQWdhIh0ON8TEq8vXv/H
	IDxaK6+qMO8I0bVYyvuuWWDSbMpUu3qUxmaO43TXM2CNKYLDfg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymujhuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 20 Jan 2026 02:48:35 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 19 Jan 2026 18:48:34 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 19 Jan 2026 18:48:33 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Ross.Burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] flac: fix compile failed on musl
Date: Tue, 20 Jan 2026 10:48:32 +0800
Message-ID: <20260120024832.3683926-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696eed03 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=XkRKQH6RAAAA:8 a=t7CeM3EgAAAA:8
 a=UsiYnwEOF0ai7ImNx9wA:9 a=1gUyE30hU_ULiMxJiLUW:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: eGRRsWPy8Sh8lAj5GJPBIFIVSVTsRLag
X-Proofpoint-ORIG-GUID: eGRRsWPy8Sh8lAj5GJPBIFIVSVTsRLag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDAyMiBTYWx0ZWRfX+rIEyMQ6ZqDW
 h5nVzQV9drBA4dQxdiJ0N5Ymdv+5ZDaLGQV58pvC3c9RTTTxjonh2zydHaC3NLG/ey14NBHvAs2
 /EVk2LfVO+hT7kalUrnZzjTrxn8jmvx4zmOTD9lJ1ZHDdlL1c0b9QKtiSE7zyvaNdQ4FM8H1d4B
 mDybv/S/aVMwaqURU5WgWTvSIa2kDY2vximusb8n8yJ7VzVgq2tWFdNrOfFOUPsfiqC4N+BZUOr
 z8fJndj1JpuuREOGcv+SPAjt7s+laxegJ3Ga6Knh9d0EfNt8jUOzxMhSrGMbCTF0/Jn5CyKOqBW
 WcV5gtFK8wqIe5inhigDv3wNbtW7m+7idPHGLFrgvngzJ9qZ+CBWQIpg1wPTwlYqMkxNsonTeCp
 nyykqt39FD+L/YzXXjhk0qSqH44T+JfV1T5OfL4zjb3i+4duMwJZ6WPS8WXMimLRrXaJb8Deiy8
 XYDMPZdn/J3MfnkNLhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 02:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229640

While not including security_flags.inc

$ echo "TCLIBC = 'musl'" >> conf/local.conf
$ echo "MACHINE = 'qemux86'" >> conf/local.conf
$ bitbake flac
...
| libtool: link: (cd .libs/libFLAC++-static.lax/libFLAC-static.a && i686-oe-linux-musl-gcc-arx
"/buildarea5/hjia/oe-core/build/tmp/work/core2-32-oe-linux-musl/flac/1.5.0/build/src/libFLAC++/
../libFLAC/.libs/libFLAC-static.a")
| build/tmp/work/core2-32-oe-linux-musl/flac/1.5.0/recipe-sysroot-native/usr/bin/
i686-oe-linux-musl/../../libexec/i686-oe-linux-musl/gcc/i686-oe-linux-musl/15.2.0/ld:
.libs/metadata.o: in function `FLAC::Metadata::VorbisCo
mment::set_comment(unsigned int, FLAC::Metadata::VorbisComment::Entry const&)':
| /usr/src/debug/flac/1.5.0/src/libFLAC++/metadata.cpp:913:(.text+0x2032): undefined reference to `__stack_chk_fail_local'
...

Refer [1], make gcc pass -lssp_nonshared to the linker whether
including security_flags.inc or not

[1] https://www.openwall.com/lists/musl/2018/09/11/2

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-multimedia/flac/flac_1.5.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/flac/flac_1.5.0.bb b/meta/recipes-multimedia/flac/flac_1.5.0.bb
index d6df801aec..e227133ad7 100644
--- a/meta/recipes-multimedia/flac/flac_1.5.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -26,6 +26,10 @@ EXTRA_OECONF = "--disable-oggtest \
                 --without-libiconv-prefix \
                 "
 
+# /usr/src/debug/flac/1.5.0/src/libFLAC++/metadata.cpp:913:
+# (.text+0x2032): undefined reference to `__stack_chk_fail_local'
+LDFLAGS:append:libc-musl = " -lssp_nonshared"
+
 PACKAGECONFIG ??= " \
     ogg \
 "
-- 
2.34.1


