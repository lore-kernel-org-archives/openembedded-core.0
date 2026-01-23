Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB66D74EC6
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 13:18:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67222.1769174298529904825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 05:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cbOIS6+b;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=g/gdjUoT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NBsDfC3656648
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 13:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WJQTS1msoEyUSZIaGmqwLMfj/40dMFQ+AiI
	C9Z3Xixw=; b=cbOIS6+bA84U90OWgcb+/q6Eop6cHN9i4URLV9zGMvSGsw16XM5
	eG2oONAPyfjHk4Evwm5XevOqf9B31CyvuoT3rtjSrB/mRP0XAdfWOHfEQpp9emz7
	VJMddg9ecXc8iYh+jemzazjQY59fZOGiSoprLMHDbSOqS0ZTNc83M3WuxwTaWgeM
	f+dIFMcTadYk87yxreJ7rB7/1rix9jJAzsREYRd30rI64MJ+7eli/e8kzEyLohfd
	gmeYnBAkJQFfBrK1zr9bIlnx6Yw+Nld9gOSpP7XQL4Hjwgm0vBNp3L+HYy55TY8Q
	/WzqKPTOLEfyV0Z9qg9zmo06M0fKjK1ffqA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv2hw9njy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 13:18:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6deddd7f7so348494985a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769174296; x=1769779096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WJQTS1msoEyUSZIaGmqwLMfj/40dMFQ+AiIC9Z3Xixw=;
        b=g/gdjUoTJA34JMCwioEGlwmGAQO3G6ttdfo12XLoEGnT9qgnFBh7Me9P/9jM4d70Ww
         mHxc5uzYhMJxWYMuL3E7oa9QfvaaE2GfWfjrJJt8tOa13Y8WpnDTcjynwdsIcFItnxuk
         4blHWoH1AUoL17z4rxxKI5A0ciX8NkZAm3mvfJatBuiN8Pb0v/z5LxhEsCD2hGMiiQhJ
         IrPd1k+1QYONVNcjSKtVV60skv6l3N7mJK8tpmaPkDKBN4iWW6wMBoQxhbrKo/EXeHU6
         N7NdUbTWix/rAVy1IU3g0fKchHRhA1BEyzbRzsYyT7MG2T8X7WZrqMhxfWO0TgOZVg8h
         U4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769174296; x=1769779096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJQTS1msoEyUSZIaGmqwLMfj/40dMFQ+AiIC9Z3Xixw=;
        b=v4huLp4JTEWNuDNDJ7BtzwAhWfBptRNSfQyHZxr2mYLVIQXycMxRlXpBNJVZmK/R5e
         AOyAUEgLJyTnwCVze2KNC9f+7Dt/leNB2sMruuBgmkb5NlhqnEqI8YopKMVdbBd6nLp/
         VRv36EGGFt9bgsx01Sry3gJiwCT5HQVhgE0c6FyodvdRzMkuyCmlZBG+ICZELA+FqvU0
         V1RoWFnUX63ZkC9jHmrSQhWM1yWo1ObF/XBoWLkwoiXRoqFzsvBgWXaBsUGgAd10sY/K
         vlgXZWcBbfwleSg42ECChkrNGMnWDvZJtqoByBKO9lpJhghKY2Znu5vafrugptoAIVw5
         e55w==
X-Gm-Message-State: AOJu0YzoWaHbQxGwrh5MUprNu+DlD6aoaVO2UWp/laRO7CVjwjeFm7UG
	7j8M6HWwcl8smzG8usmqT/h2MxWOyn/31zh1/JG/hzzycfMni0RVpEjHEiWyV5Oa1p626sL31OC
	t3E8PUlPZTJoegNMWXnYQCpznaSKrpsuCD4gMokaK2W+sHeLL+HGWirb+g1IIuqsmavkCsqAh9Y
	ZoaiY3+fAc0+jDPQY=
X-Gm-Gg: AZuq6aLzJGaNsB9qKRYb3WJa755Js58yXCtImwIA/lk2oWXiWGj3k+8Bvcro5oYLiVC
	lmRRw2Sia0QiUVDdoRP8z8AteuxfXVhE7J1ifXyjxhAijYtxu3GvvbG0lzo4KbC4kb94MwWMJQT
	uSj4zwc9pxXYLwwf+ekelzdUYvqNz3Z+LU3Hd6QeJT9fOo0KsUTOl2zTDCRtMChyy2AI2Rf4oqd
	prMEesJXLYj52FO5HpXhrXeA8w7iE8agAN87BNTmF1NJuZbMH4QjbIe/sEjSIkJwZURN+Quo96H
	hOGi0IfsVUZ1xQ6H65nMehkXoT+tj2N59rfuICww5BiACyJIXyZiJp3ATxNHfuNRzN/S14D3NrX
	eOUJU45Icq2bcfPKkjkCfx82AWVX3IDVc7xFnx/CrQTN23BYiZ6JJi3eMWhiPlluEZBntGz88TR
	nCEe+Qn1rF+c1QxQ4h3foCfxo=
X-Received: by 2002:a05:620a:4002:b0:8c6:a4eb:11ee with SMTP id af79cd13be357-8c6e2d865a9mr360553285a.1.1769174296424;
        Fri, 23 Jan 2026 05:18:16 -0800 (PST)
X-Received: by 2002:a05:620a:4002:b0:8c6:a4eb:11ee with SMTP id af79cd13be357-8c6e2d865a9mr360549185a.1.1769174295831;
        Fri, 23 Jan 2026 05:18:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3a8sm5804221fa.14.2026.01.23.05.18.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 05:18:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] uki.bbclass: drop INITRD_ARCHIVE, fixing multiple INITRAMFS_FSTYPES
Date: Fri, 23 Jan 2026 15:18:14 +0200
Message-ID: <20260123131814.586417-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6gAtS3oOCYw4cJSb5wPWosJik0AFklzn
X-Proofpoint-ORIG-GUID: 6gAtS3oOCYw4cJSb5wPWosJik0AFklzn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEwOSBTYWx0ZWRfX+oJmzV8r6L/Y
 xXCjSErAW8aUr1ugh03hXnSf0866/piX5O7CJ861CuHCHcz9PjGl3FEVA6yJYVZGZOFDrV/nbO5
 +V+M7IkDFs91iSrDO6n0oQUBzC2Iq3gN9+vNNS8O0R/RDxqKuCibXZAkImoSnhctR09lI7XS9BR
 NQLirA7XyBzrQUt0YyWTip8DX824FMkTCsJ/uVLv1QB1s351yzDsDLAB1hhGdRHIYSS1hRAiuaq
 BU6V3L4pi7sWNqiGsSkMP2R+8BEgNHXaKd7GlyxUcYTTEKfII/hNJyLTdpwoIpA4M3DOkv6IiHY
 1HQfFNEiQLHigJe5HST2+L1bFoP+G2yDmMGecApdIC0clEDO4xYV/27yabWpXVuztS/3d5Khz3q
 OIGodvclZ/14nTNGX4w2ppXgslUuAFoev3v+IJM03lg6qTxyGwEr42hBkq3HwvekyHiv8cKjZYp
 v0dd/GlbgW6oR3jnAKA==
X-Authority-Analysis: v=2.4 cv=A4Rh/qWG c=1 sm=1 tr=0 ts=69737519 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Iv4kaBUZLcscCCURl44A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 13:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229888

If INITRAMFS_FSTYPES contains more than one entry, ukify build command
will fail as INITRD_ARCHIVE will contain extra strings. Drop
INITRD_ARCHIVE and handle fstypes directly in do_uki(), letting the user
to specify other fstypes in INITRAMFS_FSTYPES.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/classes-recipe/uki.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index a2b1c8a82d6f..ea449540db66 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -73,8 +73,6 @@ require ../conf/image-uefi.conf
 
 INITRAMFS_IMAGE ?= "core-image-minimal-initramfs"
 
-INITRD_ARCHIVE ?= "${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}"
-
 do_image_complete[depends] += "${INITRAMFS_IMAGE}:do_image_complete"
 
 UKIFY_CMD ?= "ukify build"
@@ -127,7 +125,8 @@ python do_uki() {
     ukify_cmd += " --stub %s" % (stub)
 
     # initrd
-    initramfs_image = "%s" % (d.getVar('INITRD_ARCHIVE'))
+    uki_fstype = d.getVar("INITRAMFS_FSTYPES").split()[0]
+    initramfs_image = "%s-%s.%s" % (d.getVar('INITRAMFS_IMAGE'), d.getVar('MACHINE'), uki_fstype)
     ukify_cmd += " --initrd=%s" % (os.path.join(deploy_dir_image, initramfs_image))
 
     # kernel
-- 
2.47.3


