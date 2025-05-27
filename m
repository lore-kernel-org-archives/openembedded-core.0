Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4088C5B543
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 23:49:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.4214.1748389766894372481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 16:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TE8t58SH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RHTf4R028987
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 23:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0O76EGfizZg
	Gq9MOZ/KoPfDg/jbXeTSvaS4TqlQSd0A=; b=TE8t58SHsrpZjUtptovdBlnwScw
	BTcjwx40/T6legCMXUwLYdWi2CJsrlLZ1xSvk4Kq87+hvtIYKUlw1sg2bLt8XApm
	ffpqgRgRu0NGFaDzgwE9KGniQYR2HP225f5Ekl1ajX2eG2JqdFMEq2kKtXzJMQLG
	wMvFzWW5OzQv90qaZFQqOb73ANSquEqpXjrw0p6aVu/Vtgp63RwXud6YYii3VR98
	vjaUPWrhyxZ6Fd9Y2BOGMr4qeepqoRQGqQEBytzdajOMY5bVZQ/78OwNYpkoTVma
	voungpvFnRFPJQoEKsC0wQDY9yX9RgT2ZTdQxBm1xC14EACiGRX98zQhL7Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf0udc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 23:49:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faa443fb86so33456096d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 16:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748389765; x=1748994565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0O76EGfizZgGq9MOZ/KoPfDg/jbXeTSvaS4TqlQSd0A=;
        b=UZxtV8QIFaHdmIjlAH/8GJVeab3EoDK75zK2LJaIBbM/RCOH3uj4/CUk3z85qA/khV
         dNHNwWTY0c5nYawROLnslmXuVjX35UIRrMHMYUU3OE+F0BEM/WxJzo3sg5l6S/1BSXFf
         PSJluhwnNZepff5K+sQTmd4upP7ZNMNDFPjL4LQ9g/TOacKxfGcDWNfbK+AYHmvy2EWr
         W2E1wKOX/icmlw90cQ/QXJuwcJVczFbtIlERMXAUctndaccmfk1HvpBGfgQa3VUHPPmO
         /dRuDLnyDt2YUhDYHK5pe6H1QLptfcH6fFc5fBYqSbVEsl2WJOUGeWUhYA4qAqGTW+jB
         MN8g==
X-Gm-Message-State: AOJu0Yz/vIU6ku6gWLqu9+GLklDyAFWuZSmgjAInLVKcC8jPYWlAQQT5
	WQcDcpj/IXQnPiKebouGqs9+aK4yRUxkM7EakXEtXChMypYswa1/d+v9xa+aIp/Mn+ikY55qEkg
	zDuBLE6fFQpFMzlrrklCmJs1+kp42uBWQT7q4sAhnrEiazljpqzZWfir5V2M7+1EHyXx0b+nT/e
	4zMtoqZyC2V6IzBDk=
X-Gm-Gg: ASbGncsIk6gx+nzfX7GVDm90Z1K7K+uj5+vclNJXHnvvD/VLraXxZkIwVK+88i1PD7g
	FT+Ws5PIQrreVKLjgPfMrROCAkestL7QZEzkEWsXDHqe8PhTdSn4TYlGKzD1L+NZBOlp2ksYUrU
	YTxA7emwibu2mGvd3u1PlEruzSYVwuiS2IP2DucNNOA6H79Y72HRuzGZuQtJ4GP5M028VoJ3Knw
	zdkUG3xxemmR0ymN9KId/qyW3l7DOjTuyMudhSvCE+DhHwfYufPiS3mWLHLacFuCBo40qb0ITDN
	sm+DzBmz3qrkRYio4L7ibdlJbJG1h7iVj8fxiWBffgJTjcgs0MdSRyQ878maq2sTQUuCM7esbm+
	fwA9GKz9nafr9uXX39V8/Whrw
X-Received: by 2002:ad4:5bad:0:b0:6e8:955b:141e with SMTP id 6a1803df08f44-6fa9d13e870mr239223236d6.21.1748389764837;
        Tue, 27 May 2025 16:49:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWGOBPSnQOPwgyRFZqBiAaY9q9p2D520OtzFN4shb2I0Q7RmzrMNTese+grpUPPgoYWIxdDg==
X-Received: by 2002:ad4:5bad:0:b0:6e8:955b:141e with SMTP id 6a1803df08f44-6fa9d13e870mr239223026d6.21.1748389764449;
        Tue, 27 May 2025 16:49:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69a674sm11797e87.152.2025.05.27.16.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 16:49:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [PATCH 2/2] mesa: add support for Teflon, TFLite delegate
Date: Wed, 28 May 2025 02:49:20 +0300
Message-Id: <20250527234920.263235-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250527234920.263235-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250527234920.263235-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=68364f86 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3A_R96mb3GHpI25bHCsA:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: So8C73QrkJmoIDYJHgmYHnuMidUjNE2R
X-Proofpoint-GUID: So8C73QrkJmoIDYJHgmYHnuMidUjNE2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDIwMyBTYWx0ZWRfX7fUxlXLQFuO7
 lc15Le36OpayOYAVAM0/nWZbhJvaAAYQXquJv5wZb7xsllZJX0v/5enB5g35T98xGpnHuuxEsfA
 NDq6joKB4XY0BBRiRPQkXfbTmJ7iKgeRXiXcpG2MmL+b99iy6jE1vZtJnUVLorXwVCPrghJS9wL
 liu22+SIGStBCL1rKYV3AHDbLDNThd5PJHOn4d5HkQQUbvls9RyAwxqR1fo3I2xjIw2g0EeR/Mv
 mFHnVUPDWoWSBIEnfcGAbe/q3bwR0brQ5H0/+TyYPafchrNS8BkjfWhx1IucIUckcVHPbafYBGG
 lK8OALz3+9He/9pUrO8RRAi7sqA9V55pKSMeBe20HPfwTQ8o8Nllr6Ddg90ng5kHq0H+3Ccjw0x
 xi5FQeVi3nTa4vuMp8QEp8xUpJ8h6pHx9XrC/FUzJd7oiCOVIvdjxbw1rqyqdyzs2ARIo12O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_11,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270203
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 23:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217324

Extend mesa PACKAGECONFIG with new option, teflon, enabling building of
the TFLite delegate, libteflon.so. Currently it supports only
VeriSilicon NPUs.

Suggested-by: Fathi Boudra <fathi.boudra@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 75467fc856ce..4b1e427ad5b5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -228,6 +228,8 @@ PACKAGECONFIG[lmsensors] = "-Dlmsensors=enabled,-Dlmsensors=disabled,lmsensors"
 VIDEO_CODECS ?= "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'all', 'all_free', d)}"
 PACKAGECONFIG[video-codecs] = "-Dvideo-codecs=${VIDEO_CODECS}, -Dvideo-codecs=''"
 
+PACKAGECONFIG[teflon] = "-Dteflon=true, -Dteflon=false"
+
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION:append = " -fno-omit-frame-pointer"
 
@@ -253,6 +255,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libopencl-mesa \
+             libteflon \
              mesa-megadriver mesa-vulkan-drivers \
              mesa-vdpau-drivers mesa-tools \
             "
@@ -352,6 +355,7 @@ FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL/*.h ${libdir}/pkgconf
 FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
+FILES:libteflon = "${libdir}/libteflon.so"
 # catch all to get all the tools and data
 FILES:${PN}-tools = "${bindir} ${datadir}"
 ALLOW_EMPTY:${PN}-tools = "1"
-- 
2.39.5


