Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798E0C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 21:21:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.7224.1750281665346569617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 14:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=OkhuzWcT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IGCrJE007075
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7zcmQdRI1bw
	wjjZTgFrx4QAMtqGOrMceEEhSysRxJRg=; b=OkhuzWcTnv/rbQ4KdrxuSYxkWgZ
	WUTPgDZhWCUhzji/OopUFi1opTUsCwfRVgKIE3vDYDwnAdIbEQerBhd/o8nffxI0
	rtHEPl3E+tBpffHrIV2fqnMCj/EWLwBKnWu22cpOy8v87Mufvm9QJWDxulGQs0OO
	Vn6K624XC3frIqt3EwODgGfPKOFWpkl3IPVd6hP7TfM3zT+f8RIaAeQp4TIsU8q9
	5lPHO07LLflFiMju0uoukyyn+dVhshDDObpqCtGLXKsQEEAyKBg5RpNVpnqtN0Ej
	qNxvHi9v2OyKk/fcVZK10XtoDtZisr+QfJmxk+D0tqhALwEDFRfMuhx2mwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c0rvgtnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3d3f6471cso21901385a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281663; x=1750886463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zcmQdRI1bwwjjZTgFrx4QAMtqGOrMceEEhSysRxJRg=;
        b=QMsP/wZPaZCWmER/3s/gfOndvhiPl6LLtQWINNP7XkV7t8FlZI3Z4795meimhBP0kA
         JvTg8ne/5R7Hh7wz1W/xcy+yJS3VSlKU/vxhhTzzNfVsR/bYgb2xy/ifFgYsof8W/PXE
         jlguDM2aUsFU/BebG6wEMI8SUQLGKpaXYvcr/J5VGzwTA80joOaJmf6DHCZBFenUBDkS
         9GOruQUwghWNgYU2urdAVaCV75fQ5GFCFmsXFUy8Vr+y4zOg8zYnt5emPW8vcYrNdosL
         LfDPFvFa8coyJVpaHii8zzhBGr1LN0uuskAwum9dXR1tngMqzh/xdOpFdIQGMGV1pMXA
         1orw==
X-Gm-Message-State: AOJu0YzVguxsxTFWbTcDRD2+syonAMBNZx4Vm8BbJ/C95ly71SJSNkDm
	3AbcRa9bZrB0qcZs/+XHPqElEhLOISujjDlKyE8WpHIjaoLG1T1BcBdyC/L41Mg/IGAm7bUfUK4
	GGur7jdAfr3uObO2w2iwIRAddtFSe4eEcj0lB/oCFxJKLaYRAvuin75yv3IL4fNDvLErBp4eqGy
	lLjIWSNyvjcaRZpfWrTySy
X-Gm-Gg: ASbGncs3z/4EGK5s91KPfF4gF5oVR43s3WraSknV5M8CgDRKXznc/WhQ3gxl+i/JLa4
	Zv9jVrXQ8qPvNPr0eijSxqbmb4G9TGvO4XxCm5SF5tJV2BvZUI7OwyrAOE4zlRZSja6mbTNEZv7
	+MbNdYfKk/1AwheBaMUU7BMN70GbkJ0BcXTcW4udITUTYqOiHSr3oGOE9xtvZMnmVTqhLMI7C04
	Iy9/5U2k1Im23w3FFiE71ldjRhOdi8d5zTMHDzLR2zE1flsAlo2kLJY/RgkYILzcSXKnM0VROnJ
	OlYC42vK4V4HCDvH7QeMQteJYuabHj5TQkkhMMZbItXNR0MNmnT7MxPOQ2e9WnWRN0VM0CvKSBm
	fifNnTOUHteT5Or4kVAYjCWcqHm0i6sp1bF8=
X-Received: by 2002:a05:620a:1aa0:b0:7d3:9260:6dbd with SMTP id af79cd13be357-7d3c6c1f601mr2799151585a.23.1750281663284;
        Wed, 18 Jun 2025 14:21:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWmza6Lzu04lAqM5bedB8PQhyHq35attp94iZGVloRG46v1XQLz323HQQNwOPNGjRJARcvjw==
X-Received: by 2002:a05:620a:1aa0:b0:7d3:9260:6dbd with SMTP id af79cd13be357-7d3c6c1f601mr2799148985a.23.1750281662857;
        Wed, 18 Jun 2025 14:21:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c12e2sm2368806e87.153.2025.06.18.14.20.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:21:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 2/8] qemu.inc: drop duplicates with default-providers.inc
Date: Thu, 19 Jun 2025 00:20:49 +0300
Message-Id: <20250618212055.1529969-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE4MyBTYWx0ZWRfX6+Y4FU5Y2uiU
 CgP47CqjO80hgFpSwrU0OUxbaQ/yQs3oaUDKYW/JdcTgjYTjKYXlOhXym2rKek/Y436sYwK0tBK
 +/TCKPV+vXv1ZFd5a7qY7Y4c3USbNdRWGhEvzkO6jTUnd6p79gNvIFy1oJL3XoZaziYMyjayTMo
 QKo7bsPFI7li1PxAQ3jBGch3hsSFSqk39pjoNgcmw+M7KIxgNQ1RrT87eIW+fU0XED5fEtniHJ3
 BHc0XLfwKkiFFJl4DRjdLzsWivKn2BG5y0sTZXi0IC4n7Jmqap5dURBQzASPAL3C00wzICrSoCa
 QGlZdMFKm34Ch5wNpkm/VHasmkfC1+01qcF7QOQvgF7shoJcSUDwyp/CqwvUGoOYa6NDRcCvNvr
 IZXnWRTEr6vQaqohzMhggYQhdNqykhTM3bs+ZUFfFecxcWJ2oSFR9cdpbYT8d1L5qgAKJPjd
X-Proofpoint-GUID: 4GD7NS3m2hJxKCQLK-BVIoOnq3CGVK1D
X-Authority-Analysis: v=2.4 cv=btJMBFai c=1 sm=1 tr=0 ts=68532dc0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=gzXrmaAKBCNsOZIF0V0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4GD7NS3m2hJxKCQLK-BVIoOnq3CGVK1D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219038

default-providers.inc already includes PREFERRED_PROVIDER values for
xserver and GL libraries. Drop the same values being set in the machine
config.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/machine/include/qemu.inc | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index d7392d476238..c143e37f710e 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,10 +1,3 @@
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/egl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
-
 XSERVER ?= "xserver-xorg \
             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
             xf86-video-fbdev \
-- 
2.39.5


