Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE196D1F9D6
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 12:45:15 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42835.1764852307998927404
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 04:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=AP/ruElZ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fAnk/Z0i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AEuU2926199
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 12:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3vAcTDkwMVBCFWmU9a0hohlxcU2f39U3fOh
	6lRqLTu4=; b=AP/ruElZF9JO0Z7I2NYsIxXK8/DOETY9Vlg1VtJbAu/sJ5E0SeS
	beIJ6QSWWL4WC6h70cvo7H6k+IQQvW/mzP08Em4yk4EF2gvtxb7CtVZv4bWqiPoU
	hPRV14ZmI5NX0zzMOocdyImo4azqbq97irSj1KusznmKGAH4VSwByP3WnvV3UbMu
	FV0Jk6bD0D2gheNvxxtQG/Exs9zCtZPUK2vKvSJO6H1G2IGa5SSa6p0z3gM9n2Ml
	FME+RQYY/61YW1Q7+sOE8ABNyVZUll5InZUqgCSD+Gyf3G/OHlDRW60Y9ThDSi5l
	Mp2ZrVvScfP64ZjsnHsVqn5fGc2QNZkrPDA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au5m310tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 12:45:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2de6600c0so207552085a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764852306; x=1765457106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3vAcTDkwMVBCFWmU9a0hohlxcU2f39U3fOh6lRqLTu4=;
        b=fAnk/Z0itKR2Q6wbeoyGEsXmrbkieQH875TPmyqjhhJcmVCcEGwVhdn9MoqK/r0DDh
         7jAr5NRZUYLK4DZIMob7HIJCEVK4t4h50HuoaBUf5XtVHGxgo43+cGArideOtpro90W2
         IKMBaQ3HfFdZjfyRXx/HhLLlTG39I7HxKjIMOIR9QAUjp5jikv0JfkZASXmY1fY45mtq
         w8U+47ECjNyXqMwDe75iWpQJBPRx8NvX2i+K4RtN8amNyRQP7QtOh0I7toZpJPzV3msl
         eKbuNSHM3NYkNRadpgZGrN3rKEf76dPLTK2zSexldY0s9nMr7x7JcQT82IyyWcH+DM+B
         6cZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764852306; x=1765457106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vAcTDkwMVBCFWmU9a0hohlxcU2f39U3fOh6lRqLTu4=;
        b=n0pkUMSGdJsei670uVmsYZq02d11ns061t7NC7NTL7WE4RkseMRDx1XPLqra1VYNY7
         +6y8Y3G1E1eqXPAGiRPyPHMIsKhNpFeNZm0Ea4h33WON8v0winqMgeBgii67gyQgWMkz
         PWJUpacD5YKr0inXqrCF6XkAkZob2yiJYraOqRgKSqtTcmg0Mgqf9YmC2cohNC8yUBzD
         beMI5HnHyqEiO0KhmyMrDVJFiR0xIzx8pMD5AxctsQZ+UFBeofQKFDL1LVRP3CinPLyn
         szkB9f9HUdYmQ7WZx4O+o2wRnb12puP2zm53873qg8J6IDp9LFod8mg2K8S4X2WHIP8t
         pGiQ==
X-Gm-Message-State: AOJu0Yxyz6jcnz+QL3iNPw58LnzhmRyEHGHp6LLjBAfO43r/5WbQpvQb
	rGp/ehZhv81DqI2dvPrADLPczNjQ8gaTslRRQKC+i51bWNI65MBnFIf9+AhorcoNtJ2MGMhseX1
	gYMOTbkhMQY2pT6glm6Z7JDalsHv0GeLz/qFq+FmEUmtHp4xBqVhWBnQaMqjSigQLL2SAtmhwA1
	ISWPE89NIMxlAglCU=
X-Gm-Gg: ASbGnct3TdyqQyjBbtgSPlg0k9ErPky4iBgqyDVvw8Ey+cuVynSao28OXlMnVLHi5Zy
	MVhMnrIJ1+13E6E7ct+UbQg+SMPVNkJj3shawQJXpl2XQmaxnkC28JrQVclSwZ76Gh2goljD7i8
	lhyzC/XXvlg917imuxmOpprpaF7w0E4uATCanYKbjygWHiESfonLfRQb1bnKMPcEY2pu23UL93d
	KLq4XvO/8O1z0zuJ7mUBUq8sJOdUxLiBWJsZG92723Y7z8MT4GR6lbKfjNriTUFnQ885NQ60Kz0
	68BEg0ZIJTRn9L93enF31HjDun/4KMCecQ4eqCEULmDyZKheGMf5wigJLKJBOD140zkb+Vi8mWZ
	VMpKkBgtfe364DooF5nR+DToWiSQf2Nl2jSlc+vNZvus21Nl2Znn9WsExDqLPDjb52CvCiDrv2s
	pJ8YTMo/so8xf2Ct6QvpmLJHU=
X-Received: by 2002:a05:620a:400d:b0:8b2:e4f0:74d0 with SMTP id af79cd13be357-8b5e707280fmr885706785a.63.1764852305950;
        Thu, 04 Dec 2025 04:45:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7bTwYWxO+W5XiRaKtVPy8SS7YIwdm74eZiTrmr7rBkzS6iYvFlGvK0UR8jKopC57HWIPbKQ==
X-Received: by 2002:a05:620a:400d:b0:8b2:e4f0:74d0 with SMTP id af79cd13be357-8b5e707280fmr885702585a.63.1764852305332;
        Thu, 04 Dec 2025 04:45:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c283c9sm474876e87.79.2025.12.04.04.45.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 04:45:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: upgrade 25.2.5 -> 25.2.8
Date: Thu,  4 Dec 2025 14:45:04 +0200
Message-ID: <20251204124504.287824-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5zxe78I9MRp6ie3F_LpDk731yVajIaCr
X-Proofpoint-ORIG-GUID: 5zxe78I9MRp6ie3F_LpDk731yVajIaCr
X-Authority-Analysis: v=2.4 cv=esHSD4pX c=1 sm=1 tr=0 ts=69318252 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ZpVaWaFtAAAA:8 a=EUspDBNiAAAA:8
 a=VAGHLSkYOi_0krsDwucA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwMyBTYWx0ZWRfXw21drQaQPZMD
 8+53i/DKVD4G+t7QDksC4PW5ZtyZ+yzwbv1vT+D+CwvNkVtzMF7FyNzLiNZeqf08dJ1BGBNNUt3
 nuANfCpRMu4E67OJ++jGJtJMzKjGymzHg4KaXGBo5ttSQdjhg7K/iXN5qCldjHJ0gQriaw62vwT
 2cYfN3yWZlJFtsj0a6ECQn/Isj3Ypl06awszG0usGq//X0LRoo3PAkkIhjngkNQZAh8tmSTNmS3
 92vl/VuFk9J9BPnmCzQfZbI42I2L1q4p2H2I3QUJi+9h+lh3aNILhSIkUJ8oHFi7cljnNiGUkjd
 MJXqg1UI6LBXm72Zr8ml1G2s+GWtHfRKGT2S5U0me6TBdrERvbJ/TtzdZ+kM1pBR56HVkrfJ91o
 3STkuCzO0mQ73OEkFw+e5nSj1gsg4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 12:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227290

Pick up the latest (and last) release from 25.2 branch, fixing several
issues with the drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e8786aa2e986..27483f69514d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"
-PV = "25.2.5"
+SRC_URI[sha256sum] = "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"
+PV = "25.2.8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.3


