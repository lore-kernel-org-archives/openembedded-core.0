Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322FCC54F30
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:46:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.25577.1747925176879668479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XlHGxmzj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M75Apg016577
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nKY3g5hE05U
	ZNhjzOfe+hgir+955SGgECrcXtfbB+Hc=; b=XlHGxmzjjPAzUiG5fc3vlsefTop
	KbPsZs1b9arz+jhgp9D8lhvBC+AXF6c7KeIOVoxBj+Bcdyuz42QrX0Y4FhN7q1ZI
	Z+Is+CnlvU9jKZ3zPbeI4URrs2YcWWHxr0rb6mMGlPYczkKlBMJzLnIG7wkuujVq
	1ufHENdZ1Qs8RnuzALlQXYmhhSXKB213z5GDAWMlwCN7uwW+IbpxGD75aQlL3yhu
	/4vxqAPb3Y7gzqYzsVVt0qU75kOORZDKD+Dssw8+qZS4ILi5h+PrDtllY3j2pVcx
	ssmK31RH4ebi3BeVFMu32lbtDZvaHPG96oQQRfzWg8MwPLu7aGsWK2yDBBQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9xpjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c8a36d8eso109511456d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 07:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925175; x=1748529975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKY3g5hE05UZNhjzOfe+hgir+955SGgECrcXtfbB+Hc=;
        b=rh6So6eF64kPAD+L0PPDUQ1ICo7ptN4SxST7Aiy9AfGIB+1ZjGy4pcxTHuLAm0OVEG
         ddT8GlgwmAqrkPF6v/OIOoXQuede2OX/NrncsdxHQ4iWCj1iw6TUu/dOJ+4YI4q7TkWc
         8rI2FoEGcvZ1ee2b95IfowyMEVlqwlw/HV0dXD+JWOpl++LLYBLaIKR0UVaNCmog3AmY
         p2K9gV82CXw++1PY2b1syztLlmUFItP2vTLUafmsrEipQFZgWsuGaHyqa7SG6u00Dr5V
         hmmTXmVItx3nnJrPYusUmF/zt/cTsao6OKcooH1RknIgg+JnMSbpFSpXviYGfLsFtpaG
         E5jQ==
X-Gm-Message-State: AOJu0YzM3vYK2XFZqhpfqK0b29euF8faO7p9gBRY8ixzdrtSA/qVNjES
	fLyzgl9kgZOGYJv8DqF1LkmkneFKOMaw58vRkKPTU0N+FYjZp/zrRPGtuJgxK0ZCrPI2QTmrkvD
	cL/RPl3UjjFRXICYIHZzzo2drFgopUbeQj4fqxj+D2Ntc49DFV43EQ6KTV8ninlzAwESD3eW5bt
	D+598OJEX+aK9nJl8=
X-Gm-Gg: ASbGncuIV14wQh0r+rEQ2QzVfnDMvtDbAdUSh5ikmGMH/gVwwfptSkpelnxQKCnfxPf
	pAfGxGP8rgkYtFP71zTRsxwgNbH9FMWkU+g5sLDZ9xrELDTvoXi/MYPmr3gNjVDVhMOzO6nB5El
	j+8jRQGTn2fy7foRLOMYRIvMuuROByqG8O9GiGCkduzxqEpd9H1AzK23gITG2vWk4ebtejc0oA/
	ndz6dKTPlUICFEdfnyg1gjGCp0QKlIaCTDHPc3BDhsvqJjC9wcITEJE1OZTCfYhLeJR6BW+HAqb
	ve+rwKMUNJlsbOXNm0gMCGpwIrhlWR/EtSizvxcxqtbV3k/kV6V3KJ/6PZtvvOUwlXq8/s8L3Im
	+0ThbMTKQtawHoHWskif/A3mh
X-Received: by 2002:a05:6214:1c09:b0:6f8:a827:5847 with SMTP id 6a1803df08f44-6f8b0828745mr419392716d6.7.1747925174721;
        Thu, 22 May 2025 07:46:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4gZtg3/QBsMeXO7ev97bqyuY/3LsDeWd1gD22sXu4E3Cjz3cn86VqTEOlIZmHc7DeF459vg==
X-Received: by 2002:a05:6214:1c09:b0:6f8:a827:5847 with SMTP id 6a1803df08f44-6f8b0828745mr419392346d6.7.1747925174217;
        Thu, 22 May 2025 07:46:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cabdasm33031551fa.44.2025.05.22.07.46.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:46:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 06/12] mesa: don't add extra tags to the libopencl-mesa package
Date: Thu, 22 May 2025 17:45:59 +0300
Message-Id: <20250522144605.2876771-6-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f38b7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=jzjW0sQIQVclgA_JvjMA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: wSTjuEu_tG_EJo6MZ3dWzd-2OM9Hu09x
X-Proofpoint-GUID: wSTjuEu_tG_EJo6MZ3dWzd-2OM9Hu09x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MCBTYWx0ZWRfX5zK8NCQAeFH3
 c8HsQv1laAUiI/fgzRPadtgFbhHQubGxP9lvmMOBmkIiMVhlwKcphMzLmx2W81SmydD7GTHcM5A
 n6c13DdUU3dpmLrqY732BxXuOo8EBCERSfSQAfWjlYv6z2NnIpr+EztaLJ30qaU9ErUu1y9stie
 DVciBb9EDImmvGuvVn48MeAKgLQN2cOriFGyk/GWy0GIv9DbV5CAoy6vTHrOutKq+gWsIOcR4M8
 amscVbxnurlcvUdTXnOAGygiXH41O3EM5ZFSzd620DheQ4/QVmWJcO3OcsElhs6smNFvBKwLfYT
 0ckvzWwg+HY1NzvcO3Q2f/ujjtMMbsLloZ8ooD5igAZbcitF03RXzizz7Nr6yGBFbmfdIAMUZeM
 7toDhpIzprgCv4ex8dhei/IlHyxBKaP9iruxRGm+ncw0Q28bYNWFxZ3/YjSLSdrAuaMprHsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=948 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217117

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
index a309c8023bd2..98860a0d7d15 100644
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
+        fullp = mlprefix + p[1] + "-mesa" + suffix
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


