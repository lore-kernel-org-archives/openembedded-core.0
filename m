Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64171C77B7C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 19:15:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.4506.1750446903803912960
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 12:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FcJuVimC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFcoWO030403
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kJX1dqjNAGWO2wLzRWmaoCqaAK9z5u71Yjx
	uUfDD9yI=; b=FcJuVimC0YLEPqNpKqXtqMS5uxpur5QzC+SIFWjGc/d2vMS3MmP
	w7JRL7mSwx86fEcW3SlCgaQfLIYwYtM/tJJCETnAxgN1dxp3Ckb204msjedGclf8
	ITF7SjHAwsZfNnGMPzZ5ybI/MhIn8gCzMnLO46dBobEy24fQdzfidW/nmR4BCwtn
	+ChQ8lJzgZgQAb0kTefLtHg2lZXfke7zDhgQKPcX9Tte2vMkIcTjFZvXZDILjHQS
	SgAlERUBNQOlQw5+iudO+W0pRIvVeQYxF772o5FOyOdHyAanho9OLrTyCYwJiPp1
	W8abng58nn1cl6NPDoKeU4sug7AaD9+qN8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47daf98hbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3cbf784acso551445585a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 12:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446901; x=1751051701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kJX1dqjNAGWO2wLzRWmaoCqaAK9z5u71YjxuUfDD9yI=;
        b=OlGmDDppkkZwUNNdCKkdH81IASMuhI+0IDCzV/Zu+EZLSrGpFpSOgtKKVI1s49mmpF
         k557j+owTmNmdZ5ZEskdMnMQzL+Wq/LYGTHAWfQK3do47qCe5PSJoRL8lMzGUyht5D7b
         0UyYp/4fhp+m1gCJlqnUpu0/PYBTbHnKd2wq5qeZA72XFVfDxJQE+c4fjKniu4wu1AIB
         ICJNhs2xE30wulhNxnOiNTFhLYEQuX2H0z822Arudt8fmnSnTr/9R1Jph6o+bKOHRBDr
         yxAoR4IH1sNU4Fzva3G5I1XePT9ibCiMjPY9AktHdwm0hY8RALq9G5asWONPB5rDsGL7
         aRVA==
X-Gm-Message-State: AOJu0YydRoQqX1THphVQBKXOTQK1eryB8NkGxOx3dJEmRRDxnd6NkXZZ
	xMBnl5BH0zDK+D0plCMsL/IXEs2AJ2hCvDihtLisoow/l+lO99++39NYTHlWk+YR6VolXQfjrMV
	ooajeDBKlZn7P8dDDa8fG7Zf+yYNiyKZXz58PpigPRZTJnclUFSMywXCG97fjwXGWxg6sLJRHlh
	e/ixXVxgXN0MNqgGjMTg==
X-Gm-Gg: ASbGnctyHna/vIfE93M62sKQFFihvXZtsSNBxRjzvUz6ygKXJGcoooKXhMm5+JE8VNR
	ogisF6ghoYU3aq2BjGNNFrBcl+bo0l/8QyTN1H3Q0FnAQwQC5seTYCaRWJuDVyTbQVqjs1TOcRM
	jRPqZ4f3WTdXOZ1UlLT/ukkkgrCA9vrQKmddBdXBkVG5YlIMeEowyGechg9S6Hm9WAlHsVlqlu6
	x+QYl9dy3mDuiAW7cPfhNaUZCo1dtHKEKJ9/UOpQheto/dd3hbfxg8uoJAe5xDyEJbKQLBuVQsF
	JVz3nQ5JtYsW1l4TkSa5nVRruGJkXnaS6qQYx0qnLwo0jrwWvNazK12pMWE6iR60AVuoeh2TaUi
	Gp1ONQbOJNaXyMEB22lVX9oxbR3vYEu4K5ZY=
X-Received: by 2002:a05:620a:f11:b0:7d3:8d33:f550 with SMTP id af79cd13be357-7d3f9946aa5mr541231285a.42.1750446900897;
        Fri, 20 Jun 2025 12:15:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHFUpNsPFKLKalZJfqVX2Nta4fOKuMVXON6s6NCtmN+WS7plzVBYSdqbn9JU5XIHlpkm9vDA==
X-Received: by 2002:a05:620a:f11:b0:7d3:8d33:f550 with SMTP id af79cd13be357-7d3f9946aa5mr541227485a.42.1750446900324;
        Fri, 20 Jun 2025 12:15:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc124sm381614e87.215.2025.06.20.12.14.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:14:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 1/8] mesa: fix RPROVIDEd package names
Date: Fri, 20 Jun 2025 22:14:50 +0300
Message-Id: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzMyBTYWx0ZWRfX9O4/qNK32qOu
 SMOu46fcTcNg0zuMqzna8B7M9a4bx7F4z94m2iNOYT0i8x5YyzaC0QZq4wuDgKzS4RT7S4zdscm
 L5IaqkFO26z4HEE2s8/p2JoYN/VDEFHKall0Myk3i0SbzWFdK+h6JltuIcg5OXXsJHqhax7nEc6
 hyiRZb6sgOJxyRjlJswzUV9NR2OeRu92TGeIYMsV9MH/0JKoFR6wAh6qAT4yQQbnFb4JeODBPXC
 W+fHR1XGkmHUyev1p5ImUNKuu2w1uvi+As3SiF/gU/awCQXBlVEmUkD8qO1cHlm0e2+atVwZ/jj
 jjqYZHE3x2m2D5huJTcMrZVdJQOhDIjkM53YkpjhHGR7uPswADse741HQiANof9b4DUccWKKidQ
 VkWaTOQ8VC/NyLGYZp2kZTJUCMC69FYEQODQXfV7CKaLiil71USWAGiT0xRwEY6pK6fQG/FO
X-Proofpoint-ORIG-GUID: gOw5OHRLDrYe2i6xtlTVvXMfZZaeZ4-a
X-Authority-Analysis: v=2.4 cv=Q+TS452a c=1 sm=1 tr=0 ts=6855b337 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=9Lscu--00yPY4GOp4jwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: gOw5OHRLDrYe2i6xtlTVvXMfZZaeZ4-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=989 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219143

The BCP for virtual runtime package names is virtual-foo. Make mesa
follow the established convention and change the names of the provied
packages to virtual-foo-icd.

Fixes: 9d3b4c9bc403 ("mesa: sort out PROVIDES for the glvnd case")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c3adb5ef78ac..b3b369d0eefb 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -286,7 +286,7 @@ python __anonymous() {
     if 'glvnd' in pkgconfig:
         for p in ("libegl", "libglx"):
             fullp = mlprefix + p + "-mesa" + suffix
-            d.appendVar("RPROVIDES:" + fullp, '%s-icd' % p)
+            d.appendVar("RPROVIDES:" + fullp, ' virtual-%s-icd' % p)
     else:
         for p in (("egl", "libegl", "libegl1"),
                   ("opengl", "libgl", "libgl1"),
-- 
2.39.5


