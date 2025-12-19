Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB76D767FC
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 12:01:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15348.1766145679324047705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 04:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=OBYxBd11;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Hna0wOqn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBglj91771837
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0jsVVuXCcFh
	WaACSYC3vkcV9cT9F3KPz3m04su3VDXw=; b=OBYxBd111QXn/CDKknh6rll6NnZ
	Xs5pmLq87GIXmE/XLO65v/Vw59/Ftls3OBtbs+4V0t0EMOMtWyTdoFE9fLVFgT7r
	RgUBWlyp51fTKmFnhkdcvpZ2G9S+fbBGNusTq+BX6iekUb3IPlApDkIbNx6Dvz+C
	BOMJe7h7VfyCKLUAPakrP1yEErzsHih0qOZIJEm3YSgallSihcrelhupk7w2UjoI
	XuAnniz9ZSTn6vUbjK/vsBXqgcMXr35cEqogVWq+/PDl/EDcF0u5hNPzfh7PnMih
	osHfYEO/eCz54AeyZw9jJAfrxLvhmIENhb2xVqD/NkJOz1U0NJcliTXg0tw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bjj75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:18 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55e64ee5efcso678816e0c.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 04:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766145678; x=1766750478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jsVVuXCcFhWaACSYC3vkcV9cT9F3KPz3m04su3VDXw=;
        b=Hna0wOqnHRNW+cxQvvMj72k92p2i6TLETT2dXD8DhdfMMNM9bPQYRSAx1OeeTO8xna
         GGe0jWBBNoM9YtFiJPtvQ5fA/QwdXokEhqKZSdzzHDMmsnYpkDyowqBS1LF1+q5HFbnP
         4mN21KzZ1X9UfMzXy/t9Xnr216zfrsgRjQ/0L/egdFscwB2BIZ1ZJ7rF7Gyv6rwREHti
         y1Ew3GewDlNngAjPYHwM3gqs82insEq3uDCj0pGS6h7CpUH8MGmvfNSJorWjbTWsQPmA
         VovnhHHEZUjJVOslf/ILZn3180mPkPsdVX/1kPfBv/gW9wYv1HwEJHqfFec2ev5hlbCH
         9oNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766145678; x=1766750478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0jsVVuXCcFhWaACSYC3vkcV9cT9F3KPz3m04su3VDXw=;
        b=b3Sus479y80QM/9DMMFoKrQHXND+orqWi+btHMh0DGlQeTwS9IwSOiuRQVHUqL/1F7
         mnM1tZALb1G/SX/ZaeIzp3XbJefqETOLT+3CBs4DS2e1jPoICR37TORA4RjMb1qhRXAV
         1aRdBUzIytENAPLULLsJEVfkpyzElBdpapc8i4C4zkm9kztIqqIVa66nZQdLk6BMhzbW
         RoGeU48Ayuwo4Q/Z7cxN5jBz9O87zW1e3aF4JbKPMp/VkSMygGukYKB6F0BVLNo+EfVz
         h9BRnj2MDfs2IezEDiJyofn2iSGvHWZj4yJg/oynXfkqrXDNSFk6CrmssQR2sx+pj0Mw
         F6RQ==
X-Gm-Message-State: AOJu0YwJfkIRJbBzqRKwozcxvtMBq64hFBtSm51g1YhW1Z2N/F8Bfihs
	FI1PN/IJLxdDj+DSsmYLNVrolNOa+3HL4lCp2lpPI3GuvJLaM5YiFHh9WZIksvpvPoXZfee4jjq
	JWmSIvh/ysYp3SKN4s1Kc+P4zUfNJKQQItuom6lBhO5T9UUlcTb5gWrwen02IyTQ0Jk3fAks3wx
	Zi5EhOshgTrWHnwh7Pjw==
X-Gm-Gg: AY/fxX4XIaDZsouF7ykShDNRB5dHR1nwGnfO6Pi6yjMwiJ0OjNF/j3uOnaFgn9E5W8K
	ygPvDoLUUpZvjLTNjo8k3KHBj2QgoXskNpg4QCwLIbPmcojW/gk713zqpBiNqE5+RlFbALV1dsr
	KCV2R3sgi8oJRVNwicBJ0nKNwT62PxJgtkrbZS4aN7L13C8fgjRLUcxCTtEKFSDzoTUOo4D74Wq
	n4UAKI+Ph4repSKQPJHmrIDjEioD77c3joRbFTVj+gA9BfBmmd3fHjcC+kr43b1HkfzgwVIKjwR
	7skMMg3HHjzMLalkgAZxz7lMoq7w/v0BBk6Sx+2NMSPjUGms/2gpLZYQy8T/o/xx9JwI6a8vz23
	86ne8IRI7SNtP5jgyMKQe2jHtMdQMUz/J
X-Received: by 2002:a05:6122:c9d:b0:55b:305b:4e36 with SMTP id 71dfb90a1353d-5615bebce42mr695614e0c.17.1766145677833;
        Fri, 19 Dec 2025 04:01:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEty+GpPJGzqbu4Fqwe/AnIqL+FuPzcaWnm2cC1soD9XrgMHYTCF5MIlmBrvo62FFO1ZDHVbA==
X-Received: by 2002:a05:6122:c9d:b0:55b:305b:4e36 with SMTP id 71dfb90a1353d-5615bebce42mr695551e0c.17.1766145677019;
        Fri, 19 Dec 2025 04:01:17 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494c03sm2002120a12.18.2025.12.19.04.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:01:16 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v4 3/4] ptest-packagelists.inc: add python3-pyzstd
Date: Fri, 19 Dec 2025 13:01:08 +0100
Message-Id: <20251219120109.1967755-4-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219120109.1967755-1-koen.kooi@oss.qualcomm.com>
References: <20251219120109.1967755-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2DaGPzOg5bnrec4d_OHumLBORyRuBdyH
X-Proofpoint-ORIG-GUID: 2DaGPzOg5bnrec4d_OHumLBORyRuBdyH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5OSBTYWx0ZWRfX31hIVXa0S+50
 vxSejBqHmmENVnEHKGCURq9L5j38ImQNnFt2kc/FdVDyqjTuqGRIPjpv2azXIDL+F204Pj7S2xL
 kY96I1uuseMirBQ5bf8rBpR8YuYiR7d/zxKFzBUlja8VVmxoFtaqRR5L+WPwefAncpeXx/AO/by
 /5ZxMDuuZPk/mbU5PX0CRLvNTTU20LXxihUegKrtRoWv4hbGRs4KUbV6hznbkg2yhW0Cn8dHshU
 WguIgLtRSWM7mQ4NVHxB37xCr6jonE75D86RRo0pX9IePrEMUrXvm5dmRpdYX/K6AQC11Cl1Xcu
 q3UPJXBLvmBPuvIMgOF6Y0g+VT2ibMBM8wKofBLR85TgusyJtlKGPQe5eS3IpRCb8uyqTR8P1G5
 lmjV0cpiSl7EX2744SNNaNJY6rFNoqOayvMJK9ub5UKPPlDIcPRZ8jgHQHf5aTknOuYwwGr7l3b
 bwzpmR0Q/UhRPeSe9hA==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=69453e8e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=l_PBPoOPiMtU5ZZrQPAA:9
 a=tNoRWFLymzeba-QzToBc:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228224

Suggested-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---

Changes since v3:
 * None
First added in v3

 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 50f25d43d9..fff2947177 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -76,6 +76,7 @@ PTESTS_FAST = "\
     python3-pyasn1 \
     python3-pytz \
     python3-pyyaml \
+    python3-pyzstd \
     python3-rpds-py \
     python3-trove-classifiers \
     python3-uritools \
-- 
2.34.1


