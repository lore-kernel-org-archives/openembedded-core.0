Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848C3D2ECFF
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 02:43:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27.1768876999124627199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 18:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HUjrG3I2;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=QnE1j5hR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JMbDmx1931209
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 02:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=St1lITjMKWyH4K15qRscpckE/3ElI/I2dE1
	C1CtoXYE=; b=HUjrG3I2xim4RJzTfxkmfFTRWo2y9Za0nydAC/s3L2uqOwrAXVq
	YRA9SQ42nn40NHsIEgwhtpTVimKbgerxkELfY9+Vc0RnbduKZhSmUPllrv3l3c1+
	VkHzF/7ofMqvrBzZHetBBygcXu+Mb71Gh9j4NwpaZmCY4iprpToiSoO/3KR1n2LZ
	Fwvh45fm6fhaER0Z8l2gVgc+2w4eX2u7ZmOtgcA+yWW95Z3nTOrf7PSS1hvZ0bd9
	jqP0tYNd5IRyITP2otLC8Q+Mooxb5aQImisSFZGypRORFhQjy8IIjYfVEJv0x/wE
	pCUkGOlVn360oK0QYaRRPryF2tU3yjoY6Ew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfrargq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 02:43:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5e166fb75so1198577385a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 18:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768876997; x=1769481797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=St1lITjMKWyH4K15qRscpckE/3ElI/I2dE1C1CtoXYE=;
        b=QnE1j5hRbOWfN+p5HKkVgjZl2SaaOGj4op7lvlkSPf9a/kB7PF+oVDM9vZInVvpAjc
         r0fpwBs5FstYKWouyUKL4F2OIHiNwCFwuf14Gkx8fmdASdtGlxwa5wJAfJB0mSN0qznY
         lCtwYdtNnyqpiY1O5xDCmYlRrWoMh88+hmi2uG50k6mrCBZE2Z2KuMUTJvKF32sqOavx
         KPqDcOHyoYbcsWT9c/wcD6zmVyfMCEk1QmIk7skvY1x/c3Yh181kZRFf2nznYHqEnhZB
         YHDG02Dn69N/SDYsthI7WKLP4u2tHgwwuNCmiTGIj4Qra4RmemM3wAFSO7D1Cyf+lvN+
         mDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768876997; x=1769481797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=St1lITjMKWyH4K15qRscpckE/3ElI/I2dE1C1CtoXYE=;
        b=rsGdwCPmPtCRRvs1jtN66hZsVWc+SMTg5XyeRTcJhZfagNwOybLRyVzcD8GrTv3Ddr
         OHg+OhHp/rqlhawVbDo7Nh4nrHEnWWgnrHN0EAr+gUEQHuXQqxk49UMBiTSChXL3DXbx
         vhZ4rqlmZwnabz87MfDUzuPxqrKUV+bqCuOnILGLDGopIR3F/OsOk3ZR8/pEddrYptac
         7j0UNUy9MJYHEzIkj5yQh58JPKgdEJsIeV1v0Taj9u7a642b5ToB0rHlOGKVVy3YkOj9
         TlIVeQ6TRvp+YHzA2bstgwfyPNS47mvf3iPskRHfdBd3H3C8+bGQyuAhM62I1Z/Gbp9k
         CWhw==
X-Gm-Message-State: AOJu0YzQaywzjjTum/jPRkpgU209AGE/8Uu5yaF1Nk5PavPHz/7am5Xc
	6WbjULjf4iktX9um9S2LsNOPe5owNvcU91vrzFPKx+xPO5UmTWdjtVo8RiLyCwxJd/Wzo/khMS5
	RQTen2E7vwSdnPvpA76liUSOr5sLOAEggBehMI8CfGN+QQBVqM13WJ2VnR2IUzU33gcCvhj9pFY
	XCR34nJXSLmlHouE1NLgzj
X-Gm-Gg: AY/fxX7myczwxSyOaXun9ZQ0MqWyTChP5feB8OySGi5jRL1fQN1+MMnkIvZYIPXp2OP
	86BXvyBrLiVv+j1ql8CfS8LBA+48pz9pNTTWNGOpLjdVQBPBBAHH7QVQHPFM+evH+IJhTIF3sFq
	u10o9mp0AMNoH7U3lOm2ThW5jwNg4p50pMkk0p8GYpWKVj9c+KTEtAuvCr6hIsaU87P/+3l1Kwp
	Od/W0SwHWVW0Uiet51Ke/wPdKsRyvu7Uxs6bbob97HjLhRjhtVUSYvdEtozyf/i3TfDd0BPRGv3
	oIDbZrvZF2Utijfzz6ZZtSfmriStAu+LegWeL48hsB5vLI/RTxhJ3+HCnJOMDbcQUUiFq4Xkhhq
	/DVs/DEKTawO/ymu5R6xo3qffhrrSSs2mcoCww68uHBRxeDD3MpIGL19NCGwaRSqbZ7nS6JKirx
	ikOqgcrp2mIqD3w3bUFt7XZwI=
X-Received: by 2002:a05:620a:690f:b0:8b2:7224:b254 with SMTP id af79cd13be357-8c6a66d2232mr1790243185a.13.1768876996883;
        Mon, 19 Jan 2026 18:43:16 -0800 (PST)
X-Received: by 2002:a05:620a:690f:b0:8b2:7224:b254 with SMTP id af79cd13be357-8c6a66d2232mr1790241285a.13.1768876996257;
        Mon, 19 Jan 2026 18:43:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34f2b2sm3857122e87.34.2026.01.19.18.43.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 18:43:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] uki.bbclass: fix building of UKI images with multiple initramfs fstypes
Date: Tue, 20 Jan 2026 04:43:13 +0200
Message-ID: <20260120024313.3467088-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vfEYXwS-z3s1DTKeSGSz23jUG2V5iFaj
X-Proofpoint-GUID: vfEYXwS-z3s1DTKeSGSz23jUG2V5iFaj
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696eebc5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Iv4kaBUZLcscCCURl44A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDAyMSBTYWx0ZWRfXyysVJ4n163jK
 814DWjB50oWAUHMzeD8QkrxfZ2KfS4b0MvenNewrlNkyLntIShJGdEadLr5bNhHAL2YsZcRVqUJ
 RPRrDUD7lmcZcsdPbOw8P7hcwB2z8Ve/3SccIdpYHyOMjM338eYjFEH4JqHFdnX/Eo574+R95bU
 P3rVOEIsQ9SANXn7rnVv7dsKw0/lPOUCVE0K/XJ2RsVsHr8JMZehYuFe0H9UuNtsMnFX6L9nTUe
 rCq2L/RFW0VT9+KA7qBpG0b4CVRiBOmzcie1PY3PXf0ZGLiGNRE8rTiwMq545ESZTtWdUSJtkub
 FOuX+rxz3MBgbkrb6yQgpJjdVTDrrkL/lrOE4WhVx5e4Y3Eivbzyh785F5SG67gdhBFrXQtyA+1
 CF8F1nHJq2/3IjJwtUBmbyeLJQLZHXcGMBbzelZwQYabinYNS2poKzWj62WO3ty4oXwZ7YMN5l5
 dyPBpA+esqa30S32miA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 02:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229639

If INITRAMFS_FSTYPES contains more than one entry, ukify build command
will fail as INITRD_ARCHIVE will contain extra strings. Use only the
first initramfs type, letting the user to specify other fstypes in
INITRAMFS_FSTYPES.

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


