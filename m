Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6D1D2D0EB
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 12:45:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58036.1768308325759828042
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 04:45:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Fw47NOch;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54739ea024=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DBpKJ73595516;
	Tue, 13 Jan 2026 04:45:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=0i9nsGTaTm/75h/YfQeF
	R+xfbncGXU6s3xAEQd2x9ac=; b=Fw47NOchoznj2GB1iYguUtXM1A/4dCJ8IUnE
	mIJKSA+o19SrQ/SWDWqzUyuEuIy9N70wpFFpmYMNdiR3IU00FYWEoXwKwVZtpCAG
	d0OLNtwwu7700W2z+N8lo44Zfngs4n/KtGWFkh1Jqc+LF/ZO8fIT/6RK9Vrv5l4y
	fIayZrOtSxKtlvi0Ci3phS6YIpkwl1k8JmfCyQlVbM+SfSRwiDH9t8hKqSKFbwtx
	hIC5RVHdH5HsUMP3RU9G2dC/WRHoZWLCxHkiHiVVc8YAyJ7Wc2s4hdoiNcmzFZDI
	K5cpKF7DN1gRrnexcXPX/Hn37dMStV876zNHu0gWDOO/kc68og==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkq5fttbe-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 13 Jan 2026 04:45:07 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 13 Jan 2026 04:45:06 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 13 Jan 2026 04:45:05 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <alex@linutronix.de>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 1/2] flac: fix compile failed on musl
Date: Tue, 13 Jan 2026 20:45:03 +0800
Message-ID: <20260113124504.961856-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=d/z4CBjE c=1 sm=1 tr=0 ts=69663e53 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=QgmiAaltjVGJE8pY0bEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwOCBTYWx0ZWRfX7Ki/ZmKd6bTX
 lJPAdbEZ+yVLsKYUeD9YUUc6M33mcUM4CnmROde/mR6EJId/kXszGHDEs6KhqKHs0weicRt3HUM
 0cA4ZFcv1ZK6+MXcXXzg8pY3OvWk1N0RSfhUTvgK5bjwHngwNepTtMp+Oyay9gOFUCC4j3stkwX
 xiGf5iZCW4gLKqeP7bE2mhfHXzHvd9SBjsy4zabmrMI5MJjG/udRdAsuAjzPcxVKx6a7no9eYrp
 JnD4lzkT9/bwuuHiXTdueoqygpBA460I4icF9LVVR7PAH/V/h+g6aSIrxdQ1PpPK84qi9CMl4Ox
 4bQa2NdEzdniI5blxQpms1hbeu1aBg+6+HwGsxjmgVqCKeOadseOozxv5juBv4hWZAqF96e1ZBi
 +7PNrX5c6EWM7OfXm3MhCN0F3/rThtzPdzXSqvDgMdSeB5uB3UxEah69ONy52vqKickYPlF3Y47
 jE/reqo4X/IZZezi0xA==
X-Proofpoint-ORIG-GUID: qfEdJt160M705U-m7QNhiNKSgPqSFO_h
X-Proofpoint-GUID: qfEdJt160M705U-m7QNhiNKSgPqSFO_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 12:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229263

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

Disable stack smash protection to workaround the failure

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-multimedia/flac/flac_1.5.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/flac/flac_1.5.0.bb b/meta/recipes-multimedia/flac/flac_1.5.0.bb
index d6df801aec..1813b75faa 100644
--- a/meta/recipes-multimedia/flac/flac_1.5.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -26,6 +26,10 @@ EXTRA_OECONF = "--disable-oggtest \
                 --without-libiconv-prefix \
                 "
 
+# /usr/src/debug/flac/1.5.0/src/libFLAC++/metadata.cpp:913:
+# (.text+0x2032): undefined reference to `__stack_chk_fail_local'
+EXTRA_OECONF:append:libc-musl = " --disable-stack-smash-protection"
+
 PACKAGECONFIG ??= " \
     ogg \
 "
-- 
2.34.1


