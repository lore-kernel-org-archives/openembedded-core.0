Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A50DC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:46:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.27419.1747763159040456777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 10:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=L6vzTZtu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGe8su026466
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H6UrbhzjRnU
	3uMFpyoo32DxRdNe3OSatEA2Do1k1S7w=; b=L6vzTZtu8UKhfJuUvPFx7Ltwm1F
	zqN2LB+gDL7TP2YjlJlLpRHRGeg5KMC8eurzWYUhLOp9LS9zzn1rkqATOZfA200W
	2PPqCgT+JBBbhAcNyWaLpjtcvu19fvSskviLNSjzIUG1sj3He/wqgPofnL8AOlFL
	Kq0AyP6d95lSQlHMm6rbDA3STu6xIvboHv6ncawznJFIn3Hwoo2SWsauJ1caO9OX
	bdLJn72NEkdags2jnMpJNwzNF4PGAPQ8t0gTrlpgTZZaGNhrgZ1RJQMmY4me1fd8
	5344QasrCOzpUjF9056ORxqh/RJRiyGi7rZMDQKZPfr6jLDPLlDNyEsuiPw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf98619-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:45:58 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5240cd60cdbso4906085e0c.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 10:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763156; x=1748367956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6UrbhzjRnU3uMFpyoo32DxRdNe3OSatEA2Do1k1S7w=;
        b=cFhE02H1vH0U9uy5HF04r3QzbDsYSYZTltS30phS5uTIHY9DvillFvKgW1AQDQJrXB
         jyB8P1Zio2G4315BnB0919PKPnwZFJxJkBOdvfmncwIOGxbmw1WJ0S3ABiP9BE0jLphf
         vK9Fnp0Ug4gcBzkS1IAFj0u05mQxxzMnETk32x40uy+9oOaVAJ4uWDihYmyCMkgUg6dE
         CHZ2A6tI/J+pUotJW84kPXnlGM4795D1bwSJ4LLytONBLd4DbwH+H3MR2MzIAy5jssuj
         68PD+mRcodCe9lCD16hspS0q2N2PsUAbHX6O2ybTs3BXcPHjLOX2mS8Gg/rlYsp+TrCn
         9RUQ==
X-Gm-Message-State: AOJu0YyFTgu6I0HzKG6UN7W37lffUdPDpItYXIXVF9WaDWg0mQPlmRDP
	ZJKrGkXJQ7knArd+SLxRyApouNzaNi+7tcJxkUvRxc28FaTIYhR6P7Ogh7j7yMCaahpv1plO6P2
	UNZXhmZe9FskY0w2vql2ldOTLpk1LWxgIFIH2yAMIJoXfKj4CGuIhx9r3XIxhLwf5xQ1mnkFEhv
	0+yrLl9o1ZoQsMfPPTnA==
X-Gm-Gg: ASbGnctM+mxX3f+OUTZ2SnD1fpUf4L+wwH/Wd51Ybo4pbIXQ7z18S/rmyr8r3lruHvF
	R+ji9rO7OX7LtQC2SzPhA42vsztsnb0OeUzkYtSJ3SplOW9DnqFjgyV/UHrNKLSZgVHvKLzSVj0
	2emg1aE6aShKhBU8oXS5rlRJP7XKccVoS9khu9TgJ4WfUjr/AiGVsFCczigfe9PB2dcLm0LJr7y
	NgWJOe9oFn5zdDpj91BlK9AjYvEKTdG88YS7g31z1PisVKt5yU7SKJbc7nsdSlkZ6Vab4CwcYHi
	0c6ztQQmansEYZ0BAC7vIwkWLwK4KKFsWZ2ChjYKBbYNR1t0KL2uWeInVZqesfd58ZTIEK3qSLU
	0Ydig/5sTKz0mGWAjdBkbbUkN
X-Received: by 2002:a05:620a:414c:b0:7ce:b7d2:84c4 with SMTP id af79cd13be357-7ceb7d28bd5mr1373955485a.7.1747763145307;
        Tue, 20 May 2025 10:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd/WvYJKvwZzDL1/LDpmHlWiR13tJUU4NLsSec+lehp2QNIhIMG+da/sdgWm4vWvLD2GIsqA==
X-Received: by 2002:a05:6214:224b:b0:6f8:e878:e082 with SMTP id 6a1803df08f44-6f8e878e10dmr32056046d6.17.1747763134273;
        Tue, 20 May 2025 10:45:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fcb3sm2437225e87.86.2025.05.20.10.45.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] mesa: don't add extra tags to the libopencl-mesa package
Date: Tue, 20 May 2025 20:45:27 +0300
Message-Id: <20250520174529.1173460-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520174529.1173460-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250520174529.1173460-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lhQYwt19IUTY0xQF43VkrrK1ohZi4N8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE0OCBTYWx0ZWRfX8j1dn9ag0JTh
 8cJVK/Qkyq3kpt/1yNXiPyXgchFZQOgSfTLK6EJF+rYLyJ4j98ELJ9KbCt+uuRibtnijDHlIlmw
 rTuPlQwq/ibpPtszoLXufFdvsyGxWhCYH9Pi2Bb2xXob6kFxhaLlbFv3hOOw9+JZq+IPRqVQ2Gl
 Gs7Sz8UDVkCkMDH7tn7KXcjG0+berjF0smufXfwvLdT9hGiVa9nF2MUdsJyqnEOuImZKu8g1q1L
 hD/zB3Dm7UK1kHcOGpIT/ifSrxs2F28fB4RjJmN5m3lYPXZc3gV1PyKdWWWgOfvrqsF7CCgxN1b
 ipsGbyZvks4uPR39i07LpwLn6qummdBgcCwsnuLQUQUAyUF2o1aecpItxGZYWbphVS+cwNmRVKl
 dR5T2bjh7o/3/KKnYRGuYvbIB2Ky7r+sDZ1mNgAc/vL3s8OrS1neenoYs6cLGPSHcczQ8E3i
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682cbfd6 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=jzjW0sQIQVclgA_JvjMA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: lhQYwt19IUTY0xQF43VkrrK1ohZi4N8W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_08,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=910 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216930

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
index 02e502e58737..fdebae7977e4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -278,29 +278,32 @@ do_install:append () {
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
               ("gles", "libgles2", "libglesv2-2"),
-              ("gles", "libgles3",),
-              ("opencl", "libopencl",)):
+              ("gles", "libgles3",)):
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


