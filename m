Return-Path: <nicolas.dechesne@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2393CD62060
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 09:41:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.17181.1732009274654144848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 01:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TrZSTvfg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: nicolas.dechesne@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7UN38027045
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 09:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RzNZWQSYbTNPO5McOub1ji1uFc89i5A4psE
	D0w2XLyg=; b=TrZSTvfgIewydG09L7gPCbLfg1AMcAA2fin7fBIZGF4glBVhv0K
	Kicse8XHFf2+IfYuS2SAGU+v6SK9BsKV60QuLnBy7zKWwqgXWfbpnnOutcB759MT
	IifsgTK1mI2E1XJvGrf7gw/yntolfN+lSXGv7KZ2di6PV+d09s+uNjQSVDtOSuGN
	XCo6793qDPOEmwZru2R4GMfAB+S462fWjS6So8g9AYrGJzT4cXvNdmnbcwjfTmjP
	dm0Z8LDDD0Y4ao1flUcmotgCVHZtpKvk0WWJS45b5GtUjPR0Qcn4S8IzLGAVkpJ/
	6Jl1pgIPvqGlRCuu/tQnatUgjVgo4xYhrow==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7t4tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 09:41:13 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-8564f707b27so352561241.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 01:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732009273; x=1732614073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzNZWQSYbTNPO5McOub1ji1uFc89i5A4psED0w2XLyg=;
        b=SZKrr9SaudED/MKRfB+F7O86m21PO2nCJgCED0ae7gjUNvzlKleiGOKCnAKtq8C4xU
         9rTUoz884iaDF78dsJ7putb9trfpCxlil6jxOQD9SRSUYjhBc7xWxusm7eeiAFdaaOK9
         UxzBkh3yz+tEOMd1JD5egBu7An+6rVWroW7KVkxyhgdvPSAoLmTuasP7mh9Vb1iUnVod
         +wqxAFuA0Xx6AxL+qoRNwlodvxH6yw9s6+bosFb4YMLzm0vyQP62NpAoTvqUnh+C8aYK
         L9Ms8skhOkCXzcKbf4KGBecRWlHTZPfdM4RAgF4f6DaFcizysM9NGs0nZ4FxWrH6VAyU
         lpqg==
X-Gm-Message-State: AOJu0YxyqBE1qKp67hM7sxyuwEANnpT4zeuLTZOvfD7v5gPzHz/voYji
	ylG86r9iIzXgkTaLTImwlioM6C/pulpPh8hf5esI2EEsFJKPjZ80ekJiZTbO4eQZcImnFs4DhWE
	B0tHfWeCsGnSBgvZQWUknjWq2T3ydS8J0sr1knWD79kS1j7o48lvmhuOz/xGPVYSdfbQKez04hp
	01QSccQmFZmki6ZCgK
X-Received: by 2002:a05:6102:c8b:b0:493:bcbd:4633 with SMTP id ada2fe7eead31-4ad630186bfmr13219018137.3.1732009272869;
        Tue, 19 Nov 2024 01:41:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPTtyiyXAOC1W7YD8l/dAzvI7pOHF0yLxmmJJ8X1QqBa1I6zdROI86GRV0/9DRTtLFnQzoHg==
X-Received: by 2002:a05:6102:c8b:b0:493:bcbd:4633 with SMTP id ada2fe7eead31-4ad630186bfmr13219004137.3.1732009272449;
        Tue, 19 Nov 2024 01:41:12 -0800 (PST)
Received: from hu-ndechesn-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df571a1sm630782266b.80.2024.11.19.01.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 01:41:12 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
Subject: [PATCH] scripts: patchreview: fix failure when running from a different folder
Date: Tue, 19 Nov 2024 10:41:09 +0100
Message-Id: <20241119094109.2648950-1-nicolas.dechesne@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hYHGw2Yn-bLt5ZdsIojEcT6pdnQzTEpl
X-Proofpoint-GUID: hYHGw2Yn-bLt5ZdsIojEcT6pdnQzTEpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=839 clxscore=1011 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411190069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 09:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207384

When running patchreview with --blame, the scripts runs a git log
command on the analyzed patch. When trying to analyse a layer which is
not in poky tree, we might be running the git log command from outside
the git workspace where the file is located, which results in such
failures:

Missing Signed-off-by tag ([truncated]/meta-qcom-hwe/recipes-devtools/partition-utils/qcom-ptool/0001-ptool.py-Generate-zero-files-in-output-folder-when-s.patch)
fatal: not a git repository (or any parent up to mount point /local/mnt)
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).

Fix this situation by setting the current work dir inside the git
workspace of the patch when running git log.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
---
 scripts/contrib/patchreview.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index bceae06561..f976f2f822 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -47,7 +47,7 @@ def blame_patch(patch):
     return subprocess.check_output(("git", "log",
                                     "--follow", "--find-renames", "--diff-filter=A",
                                     "--format=%s (%aN <%aE>)",
-                                    "--", patch)).decode("utf-8").splitlines()
+                                    "--", patch), cwd=os.path.dirname(patch)).decode("utf-8").splitlines()
 
 def patchreview(patches):
 
-- 
2.34.1


