Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45366C77B7C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 19:15:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.4550.1750446924582337691
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 12:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=AC2nOrEv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFwk0b004735
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7zcmQdRI1bw
	wjjZTgFrx4QAMtqGOrMceEEhSysRxJRg=; b=AC2nOrEv3KZ69EZw5Og/XrPkAgb
	+ostT8t8sMxZ0/IlZFVzOF5ERX8LrMvQWWF8gIBiUGNsMH+2PYOAp7VrVPkBnp9+
	NHEPRV62D15WudoGmkyrKabiUVMBcKUpDIPmnlYy8zMlWce7wJ3CWtjFyi47M/Jp
	ww3BhqJuvqxLpURtFGKuKsIG7kb934wuHpAdvD4HYy2HaeN/iRCirD+PZNzl6wx8
	NWexMKTkPwOfZ6gp16O4gpHyplnHurPEEnq9yGof+qW4oLIVh31+yTIspwzijG0L
	2LNrxzxH/SPuWHpoVIsKNMZQURRoioxZ2mFTKYaZEOOmMCBHHgTYHw3EA0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47darvrfv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7c30d8986so622468485a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 12:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446903; x=1751051703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zcmQdRI1bwwjjZTgFrx4QAMtqGOrMceEEhSysRxJRg=;
        b=WToQbyoF84JLWY7d6T0LC29d8AMMM/51ptwUQ105BfAJcyyyVlx8MSZ5XRNKnvu93z
         O+KpqZe0uPCuCIR3NQMFcEcK2zGvLWxrZiuR9TP8KmYVXdYpOg1NjwvAB+TWUoOQ+ltU
         mHTdr5yKFSgmv3azFdYIV8HqJ185510aqk9OMTux2qtkHGLr0OWyIMSIQaLDodMePagY
         JSD9Y26drItFxkjRGdUsgcHiB7wEhdhJ9sxX4njIX3kuJraug7kyt1BRj262akKHVJfa
         KMMl46Fk2a5bVIMUsuAf0NXtkeyZgsegN6Nv9WSWnrXY2wAOwGSF9sv5JIECQxm/SlLW
         b8dw==
X-Gm-Message-State: AOJu0YzE2CC54TWzOxpn3AoQUGMr4raUy5t/WFyGfyLnD1AXQ7R3+q7X
	QoA4DppxxPf1DzEUhXeFfjUeiwHEzIk/XMZCje5mZ+RU6IMjnAToZyQSiZ+RDU252qIbng4OfCD
	mHsQ7qeRoDNFpBv/ThBOIrAXp3UMmM1DtdCGSJgIoJ083GOwR7vj5GV8fUktWI4ZiiQ4s055viJ
	EDdhw73+VdZ9RdJuas/w==
X-Gm-Gg: ASbGncvvcf6OsR7L65lbp4mtjzr8Ea8PWZ0j8DWkWxD3usPsZEgaIzMDwCT1/aC82qN
	AdhKL6d/uC50bi0uAaRdGAdWxa8GB8SXxVbEnex6EZlmLS7eHTAxvXDOAkQQf83twVBtkatRr7o
	N+GSjorrcoHZQlCG7+R6m4YAREh4qHop+yIfL85DCuR+SuIedidjPq1Hod+LwxhtshmAAXKG0pr
	wIr5jAS4xTz5H8m5VSg6OsepoLN3Q9s6ZK2VY6dKklmah3MLZOsbSleSewiOJyP6kJa41THHvdN
	5UoijztxsCEWQWHihh1sgKGFSu+YOm1xzkW8yZNT/LA/WadMjj3F/OjTEQ9fjohKLxkUj/sXAYR
	/tajkGIvJQizM+m1xv1Zm7jWHFV+RJIkroJk=
X-Received: by 2002:a05:620a:6603:b0:7ca:f37a:2b4e with SMTP id af79cd13be357-7d3f98f3d0amr579516985a.23.1750446903640;
        Fri, 20 Jun 2025 12:15:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1d08Pke9mtvmejOHM9ZcbOD2P/ZWM3RDCzOt1S/7mUsDD39z6t5Jy8D75rDg6UnVVcu70Lg==
X-Received: by 2002:a05:620a:6603:b0:7ca:f37a:2b4e with SMTP id af79cd13be357-7d3f98f3d0amr579512085a.23.1750446903187;
        Fri, 20 Jun 2025 12:15:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc124sm381614e87.215.2025.06.20.12.15.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:15:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 3/8] qemu.inc: drop duplicates with default-providers.inc
Date: Fri, 20 Jun 2025 22:14:52 +0300
Message-Id: <20250620191457.2018861-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FkR3DZ0oObAq77uG8vvwIgDlC5u3fy6Y
X-Proofpoint-GUID: FkR3DZ0oObAq77uG8vvwIgDlC5u3fy6Y
X-Authority-Analysis: v=2.4 cv=YrgPR5YX c=1 sm=1 tr=0 ts=6855b34c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=gzXrmaAKBCNsOZIF0V0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzNCBTYWx0ZWRfX5NG0ELvh1wHO
 bG5Lo2l1q6ce7X/38jhFCt4X2pviwWdQcT7I0twLowQXF2LiihGlUj97BivytfY1CQuvXoeBzAZ
 vrCttosy8jvUnWRFDvgpWI7F589XLHI0702kj/eImlhVaooCXMTFljOWl/46Wy/09uvngsnSC2+
 hpcLT8eOn3y68XJkiQtTDOzr2XiXAygpNvZQ2X9A/M3ay1EVwf8D4jp5wa+i0AuJTcvSkaC6sUQ
 zIwXMazz7bbDWIp5RCUYuPvh/beBZ+JRtcRKONds2g1dpUsHU+GsT9JuhfiwmQLVVlBCUlX2nV0
 lBKgePPgMbL+1wlq9YjxjL/eA1BvHHikgATmhK1TMjg4KkcQhmAxd/cuzhOZAA0SVhWLLkDnoCq
 rlQlTU1n9YUv9PFclgHgGjZ6mVqcYCE0BVA9n9E21IBe6VlnbgURfOK0J66aDVAon8fJdKmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219147

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


