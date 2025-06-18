Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696DAC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 21:21:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.7319.1750281677489695976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 14:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CPrEVVo2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IFv3QF019267
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LzvH2GWkoiP
	RbezPfpt52egmVEhiIPOxmj1/1E1wo9I=; b=CPrEVVo2vxtwPdyJQP7dg+dAeI8
	RnPVwK0q+U3Z268iA8hLkZAGMcR5+GHwwYPIPDms+DD7ebt4k/G/7pacU3YVrPo5
	g4EY7lJxWyOUDcvgKVGUjrUgaKV5VvhrVoXP7ClfubtS5TIRC8QeFrftLJxUMMGg
	132+n96UmuGY+AwvtRG5LLeA/JsgEku6T/VVAbFUh1t/KFLMKe9QieLape3+Ru7O
	7oEJ1wCLPqcx2k9boFMhSKYTmqJX9iSgmiG2xpXbJ5yf9TPXQZreGcbm2G1c1OCc
	ujbi9Dnn+vtEKEqffHVx2nmzbr/rMBoj2aLbgb52XbvF70SrpnXhNL151Hw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd5rta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d099c1779dso20140885a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281675; x=1750886475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzvH2GWkoiPRbezPfpt52egmVEhiIPOxmj1/1E1wo9I=;
        b=NoR7tYmbaA7T7PQnRbY6xrGgOSOomrtraaPQ0ob0FoxfllYwtbVWiSvQqq0/YDu27T
         ZiHc6weWUNxSR6C/Y9qicJiI6XNyzr7fSD4kwYt1eJyBnCLUCjzbfMXwHNUiICQ5q0Nr
         hB+PSypEGbETDb5BEKKvowu+S0JD6JuTF1eayCdwqYLe0FJVobU6mmrrcnCtJDrdkn4W
         yNG8O4zpPrfV77hZZOG22ShTSn1MVt1ubRTyhzY2GMu6FK/Sit/B+9ug5h4tjIzqPaGR
         KeTe22lLKoQQ2lqsgMSVvh1rtvO4tKgPTjcq3VKIEi1rbY0qRmRwQf5BR880HWCLKNey
         hpIA==
X-Gm-Message-State: AOJu0YykDQqWJcX/CWXIA2rw8mqYQCDmVv7qA8F3IRbFezCgCpwx03sR
	EkBp4nneCPhuI3t9EY3yUcF23UGwDWCoftxfcEkKGWfwj8ShiciWvwnbQwPqqM8oeaNAKJ2TmjQ
	4LrRCoIRI+pVJTkzuzIqsUHY5ohE6yszF2Ms20igyIZY6SmW3RYRtixXaXNpqQy73vK3jxz/SHX
	7FA+bHZmOWHmVG6ng2UJgq
X-Gm-Gg: ASbGncv3R5A4hoKcIm9HVeDwFn2Pu1M31XLHpsnVBbLkfTZrcwhCbiNcjigI0vBG4QL
	wV993bE2gefcTN9As0ABWVGcJwX/73W8MGmM15rs5QHMWHYNyf1zwa7ty0mVKx33FQszIz1P1Ce
	o8svUjoeQHyRnUMh+DQGOS+EtdQudULa1GWWnj2dg21Kud/gnidMjgN4BcQA5moS6aEmnxEPZPW
	GBKSL+eZOEcPP0tlpxNy4scbUsCmlTcVvH7/8QT49m0yQp2Nj41x69ASUXu9Rs9RdYnPmdCXoQ/
	3ejYsDcBiQMb564zm2md/yanaWGlKrIOUo491n5022w/1awDnTLKtSjUT9fcBArKGLxOW7TUUqG
	BzZHBMvVKMfAdYQgaVmUWbR5IdCbDb+vJ08w=
X-Received: by 2002:a05:620a:1b86:b0:7d3:f0b0:39b2 with SMTP id af79cd13be357-7d3f0b03ae5mr293564185a.22.1750281675445;
        Wed, 18 Jun 2025 14:21:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdjglRvFTtxwN+4XRZQ9Uf27HCDv2m4C8w0efZ3b/KbFrZypKOfM/SyI58rgSeOaxwwPHjpg==
X-Received: by 2002:a05:620a:1b86:b0:7d3:f0b0:39b2 with SMTP id af79cd13be357-7d3f0b03ae5mr293560685a.22.1750281675060;
        Wed, 18 Jun 2025 14:21:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c12e2sm2368806e87.153.2025.06.18.14.21.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:21:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 8/8] fixup! libglvnd: migrate from meta-oe
Date: Thu, 19 Jun 2025 00:20:55 +0300
Message-Id: <20250618212055.1529969-8-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE4MyBTYWx0ZWRfX0eVXedJOwEws
 KI6F4cXd+nIJr805/5Kl403kEeTM9N/Pk+p2uqsPBJzLhReibL7YqojZ94BByzG5N10asbl9/Q0
 BgLhi/SJ6rA/c6ircOVfhykoO73zQhlJzauacAnySOMIiEeP7Xhs0VZt86W4/0aZ12uSocaL42k
 2fmxUp7nTQpiUmNOYQ8Z2sf3Leb2Mkg90x+jUZLThAQgfKCLpFF50ovBtt8fN4iI6eXDl09mVKe
 KHtGvaAtW+oObNJ6OcezY7wjV4NFPmOr5OEDkEnAQ6dopBD0Im6695+4TDGmCRr/RYDmDfy/tHh
 AYSAF2rUJ4r8B5OaGqfiW8rBViGZjejjE19baF5cwOP6b3tvHXPy5AG7PRcTNRS5/FxU9Ysq3MX
 VVzwzpzCoW8AZ1cbS+Xy21KeYpJyQEEfe+fnOmQa0wKKwR6R3liOjgEVEK1nNBYT0BRL7Nsx
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=68532dcd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=WatApDCU1WzaS95dWbYA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: WOjyXWgf1CuRZ-J_n5pqQmtVdz_h1ypN
X-Proofpoint-GUID: WOjyXWgf1CuRZ-J_n5pqQmtVdz_h1ypN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=723 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219044

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/lib/oeqa/selftest/cases/distrodata.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index 1e88ea82e6a8..f2c6124d704f 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -56,7 +56,7 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
 
         def is_maintainer_exception(entry):
             exceptions = ["musl", "newlib", "picolibc", "linux-yocto", "linux-dummy", "mesa-gl", "libgfortran", "libx11-compose-data",
-                          "cve-update-nvd2-native", "barebox"]
+                          "cve-update-nvd2-native", "barebox", "libglvnd"]
             for i in exceptions:
                  if i in entry:
                      return True
-- 
2.39.5


