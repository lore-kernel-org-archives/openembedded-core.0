Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31365C54ED0
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 17:14:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.29170.1747934036753185590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 10:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=H2CrQGNJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFkNjq020598
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Iwa3NKQBwKX
	CciC7+UrcE0b3oKWGzdLSWuq7XgVVq7w=; b=H2CrQGNJuhb2lUBFlzpFvVEPoUD
	jjIy6jTu2iVN5rZ09qXvIFSO7xxisZZyRycUXV3KhkSBroAoV5/5QeJVEd2R2S/H
	/rz4Cjq+1/GWJLOL/ebp3lVec5QZrMshUSQdNU+filz5GwSV/ihBzdrsGYa1gEEl
	LfKuJ9mCdl0fkd8IbuPORwjULg6TNsVQfclqdDX/pII6xuM8JNLXDEFFryuDeUol
	bBV5ZRnxFiVcMWqCbuvppv+/9yxcs+ti25SzrKAABQvrgVT9B2aOlQQ9ktDiXOu0
	ZU3HbURMIx+e1018jUs+JQENspeaJoXbPcQmqVmv/hMkOyuBRElgnA0T1jQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb5h1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:56 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-87bfc9a21bdso61637241.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934034; x=1748538834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iwa3NKQBwKXCciC7+UrcE0b3oKWGzdLSWuq7XgVVq7w=;
        b=Jcin5GzNExgKBQAWiUlNXxSsDsf3psq880nlPduT4S84fhNTUvGHB9/nbhriDKLdPH
         AFiLfvp3bNTrJjNTV1J0JAA8Q/PN3U9UNAJ/hVxzieHD+pIDPC4Wlar+HhrnGTsT5aI2
         td0Kyx2I1oEQAk+Pa+8aNYZxI3iIGAP/UVwirvxX2IFMh0frWIuGqu1aTTmUArfGk2mC
         UhavsOViGir3+3xGA3fyvPcPCyEJm+IE2dB01g9NVrrghVSi/N91wZBtC5NZ4min22Ml
         RlX21cdkkRqaQXuhB10t6jmZsPg6OMa5IkaMHJIbdE9DHcXmFV2wHvNOF5dzgkJL6pOd
         O3/Q==
X-Gm-Message-State: AOJu0Ywu10nM1qLjmPVUNaYcDn+1veX8Ah1KFjs7MAbZx0K5foUhM32j
	lDvvBtZ6qTHo2NWK9B+/buvV71XAO/HTKrP0M/d5BltDP2PA+jMKOLkrpNpppTHIPEQwOtBRHcq
	IosP+ZnFcniRDDQ74lphsMg11Izl+8Ff+xyIENHMl/N92AaE612Qhr5CLcRqGwHMsn7JTsiAe0I
	SOkx7hXVkMoer1eAM=
X-Gm-Gg: ASbGncvwe4xuKYqbTtwvFly1a9kX/GjV3B8i2501XAUrsJXkVT11EfnoDuBd6fpF2+b
	BVcxW/jw3fgiak2MLNpcigMhdVZg5sFJL1keHc7t0jkWzRSG28sWAslO21mF51kdLdOk/UsPaTU
	BFqjL56TZf0E18HQJd3KcEaeVUvbVRLNDd57e+GkXIpq32qEpOAaU+XN/6x7v4veNR4xGgEvPY8
	ocuCiGVuFdV3qKrbkpxU02pxuwApSGTEB8OXGnh1veeRD66LSN+AJODBLyvI2SkZftuMaApqH3H
	n4AY7tOsOIKDO5NF8WNzIp4B8ijc0EHULs0/5bZn+Ybb3CTZkFQp93cd9/a35RceDeGsib0Dj+a
	8/EwL2Bsd9gUwthoiulqTEwah
X-Received: by 2002:a05:6102:55ca:b0:4df:995c:1c33 with SMTP id ada2fe7eead31-4e2f08e78c5mr288074137.10.1747934034571;
        Thu, 22 May 2025 10:13:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaTq3UQVQr7KN6WkNkWDEX92wPs5knkleYvawkuqx2KfxjYXmlzBkxhMdDE2fJKtfHg5+hcw==
X-Received: by 2002:a05:620a:6089:b0:7c9:574d:a344 with SMTP id af79cd13be357-7cee22ef854mr45157785a.25.1747934023480;
        Thu, 22 May 2025 10:13:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f165c7sm3501438e87.32.2025.05.22.10.13.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:13:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 06/11] mesa: don't add extra tags to the libopencl-mesa package
Date: Thu, 22 May 2025 20:13:29 +0300
Message-Id: <20250522171334.3040820-6-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682f5b54 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=jzjW0sQIQVclgA_JvjMA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 6mkYgbBOwr2vx1Lwl6Q6HHBzO8D64PIg
X-Proofpoint-GUID: 6mkYgbBOwr2vx1Lwl6Q6HHBzO8D64PIg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE3NCBTYWx0ZWRfX9O50UrdX3rYj
 7s7yhNJN5kxffYWUg1u6uQeAmAKGAUTYuqFRxZKSPVE1HevPrIxGCWH2uBjVBPd/tBCllC5V/ls
 Au0OIvPlfbTJCid8i6kdZcXRF7Tj+SmnKNJssUcyAvkjJes5b2AlzkBvQBcAyJLl/k5ZC17v1kV
 +stHVT0H+EiFvdWMZI0SGRMtoOpdZLiYOGsED/qOxov90pvutIp1mS8FreKeknML+nLLe4XMzMJ
 hajAZJKUzhVUQkg/uPjm49V1i4eZkgCRiA7nP+nlIzH6yXJmJ4ewWObxF3tU4+oCTMJR/PP2LVL
 shVqnNUcAc9/4kez6RG+zsqVGtTzxA8yfiBr4B0lsHNMRdoj8LujHhbX8v8hUp1mr4hGni8YIow
 VxwKgFRJAe0urhudPzHjVVVBAtKrmqjGQS4E7qqdbYe26HvlOES77E/ELMzcyrsPSo1EDcxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=910 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217141

The libopencl-mesa package provides OpenCL ICDs (Installable Client
Drivers). As such, there is no conflict between several packages
providing ICDs for different vendors. Split the loop that modifies
package metadata and stop adding extra RPROVIDES / RCONFLICTS /
RREPLACES tags to the libopencl-mesa package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a309c8023bd2..3d2914a66fbe 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -264,28 +264,31 @@ do_install:append () {
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
 python __anonymous() {
     pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
+    mlprefix = d.getVar("MLPREFIX")
     suffix = ""
     if "-native" in d.getVar("PN"):
         suffix = "-native"
+
+    for p in ("libegl", "libgl", "libglx", "libgles1", "libgles2", "libgles3", "libopencl"):
+        fullp = mlprefix + p + "-mesa" + suffix
+        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadriver" + suffix)
+
+    d.setVar("DEBIAN_NOAUTONAME:%slibopencl-mesa%s" % (mlprefix, suffix), "1")
+
     for p in (("egl", "libegl", "libegl1"),
               ("opengl", "libgl", "libgl1"),
               ("glvnd", "libglx",),
               ("gles", "libgles1", "libglesv1-cm1"),
-              ("gles", "libgles2", "libglesv2-2", "libgles3"),
-              ("opencl", "libopencl",)):
+              ("gles", "libgles2", "libglesv2-2", "libgles3")):
         if not p[0] in pkgconfig:
             continue
-        mlprefix = d.getVar("MLPREFIX")
         fullp = mlprefix + p[1] + "-mesa" + suffix
-        mlprefix = d.getVar("MLPREFIX")
         pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
         d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
         d.appendVar("RREPLACES:" + fullp, pkgs)
         d.appendVar("RPROVIDES:" + fullp, pkgs)
         d.appendVar("RCONFLICTS:" + fullp, pkgs)
 
-        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadriver" + suffix)
-
         # For -dev, the first element is both the Debian and original name
         fullp = mlprefix + p[1] + "-mesa-dev" + suffix
         pkgs = " " + mlprefix + p[1] + "-dev" + suffix
-- 
2.39.5


