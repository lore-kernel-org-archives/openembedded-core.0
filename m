Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9B1CD98F6
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 22:20:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5046.1763072418960628546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 14:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=APk4SdDK;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=BRJFI440;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADH2okB862363
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 22:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2/Qa7mFeV5GWvNTNgod8VZAZ0fLa9XGP18m
	iOu4Juag=; b=APk4SdDK7VLqdeKbwhap4P0bOyySM9vHWlcnBupXYTvCXn80rQA
	GENPRYo4V5hfnvBtwnxyOjKJAWFM5jBgBM2LxIheHOLB4HXGzyhC3bhCdcUivWy3
	051eTuPOsRfULiBXeaGXUiwTPI+3MMuXci6tM7d6Zb1slG7y4eQ1jwijYqWpyIxz
	ufu6i7cuO+ijdnscBXIzng+2qfqvy/9zQnWwOU1jle3WFBTtRwbhcHdvdl/UYQfX
	SeezS6cv4F2JmdOIuxV3AsiFO8zThhpjNcU7dX/jIeujary8a4JkiLQAD4/KcC7e
	lAgGIQM/rHXwxfMdr7+KvS+nm0iXYhq5BJg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adkcw0un0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 22:20:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b9ceccbd7e8so2860580a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 14:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763072417; x=1763677217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2/Qa7mFeV5GWvNTNgod8VZAZ0fLa9XGP18miOu4Juag=;
        b=BRJFI440CBfeRGR6dDRR6Nao0Bk32OiborToNgd4aYdwl4SC1gkqFWwwoMr0MNe2Ry
         tRCbtObZWj7OSJVGuLD7nBsZREvBnRqHDFEaUqwsfYEo2ybQQJgG74LUOh3h5Xij3gdx
         tTI6ocEkc565O9hMYgkA03mq9ZiYMRtJ7bdhVO7vHk9sTJ1X23EPHxHRDjQlV4NbC6e6
         tbO4hWLlWuSqMK98ENS9/OQKmCyFISozPlV64i0LgXA7c2ZEOHd7bd1DSmvzoS0svhxX
         wkva9i0Ghi/apVH+8mL2JqeiZAR4gKW//jb+LDXmhEUHAsd+Ux7Fxipz171Izae+saAN
         kVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763072417; x=1763677217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/Qa7mFeV5GWvNTNgod8VZAZ0fLa9XGP18miOu4Juag=;
        b=agffdHQD6n/4R3KSvc0Q/QgXPPhhb4xkEcIfzTwOC5v7yLpTQo1f9TksugwvVV5fFd
         WTYcZBPWOAwqRN7t/ken84H0zT7k2NP+8F3xXPHEgQE2olByXTgGGRfiDOG0RxkRFEHj
         f41nm5tnFyKM5D2tN3gY/8Vdgya/shvJC7Gt5wHj734dtmgCjT452Ue8pMTs1/DqSTRH
         2TU2kOzJAM0wBIYXuSS8ZKhC8D7eBQEppQdyIAdWdRykk8jIeJmWf2GVT1xR4+xkT4UU
         ppMZBxKyMkQw1pEt2254NLP5m+2nL8XgYK+UhWSqxUDheXZHb87y4tsewJ3hgvB2luMC
         cuPg==
X-Gm-Message-State: AOJu0YztNYluIrxvlVarZJIe6KSRk3mqnc/pCZPeDnwptZnwWf6eh9sZ
	LPYp5Fmo5vTgO2AuebIcmEOR9oEhVN5siUBcrVbKmDt+elnzXcogbQYnXavzDHP4sctwDNt9kQ0
	PGAyFQyRxel79x2LdRbS14+j+F1Btxf7JApAJODSJPtezWV9qPIn3rzdkPAM48RFpu2EsUA8raT
	mgxOelTZxhDirOfkc=
X-Gm-Gg: ASbGncuqT5qq2XcKiKW+cE8aH+XirJNpYbyjyQw4CjzEwl7RJXu0RTlbna+0UzqmXgW
	45I/j0uOnE9xRPNOAzrlsmy8N1KexDHHI0oBfFUK4LNcBXFQsdRBnCyxsbkv9cfsMk1/2mbfCtf
	VnmYLyQBnSjIceWXFuhmEiA1TPmhL5vKrpHVH/gYRD/9QJJd9jL2mt/XEIti3lwKLr/L2TraAZN
	aHh239D4ft0xT4Y/6mepNHZFhIlV/1PxXLolqZfUDOmCmjIb0aTR4Yml9kJoKnt+EDPxHZClO9Y
	fTgw/tYmjB3CN09RBYK8vN076jM7QVsHlXais7/1smd39Ak6gEGm275n+ZC2cEfYeqvw/L6BJeu
	khkJjJ24Tr8lLe6F6HGKtvpfYhSVQyWrA82FwTGCPzg==
X-Received: by 2002:a05:7022:1b10:b0:119:e569:fb94 with SMTP id a92af1059eb24-11b40e7bb7fmr490366c88.3.1763072416692;
        Thu, 13 Nov 2025 14:20:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGr0ZJH99LqgRGFAp9mUMLe4fJyTOcQLc4JafFSXbCNrYURSwooxpJjJjMKI7Vya3hXnkVpRQ==
X-Received: by 2002:a05:7022:1b10:b0:119:e569:fb94 with SMTP id a92af1059eb24-11b40e7bb7fmr490355c88.3.1763072415984;
        Thu, 13 Nov 2025 14:20:15 -0800 (PST)
Received: from evatuf.. ([187.65.199.47])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885cdsm2076574c88.6.2025.11.13.14.20.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 14:20:15 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: bootimg_efi: fix debug output for part.include_path
Date: Thu, 13 Nov 2025 19:20:10 -0300
Message-Id: <20251113222010.714308-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K8kv3iWI c=1 sm=1 tr=0 ts=691659a1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JEjW2rnyS3Y/5sYvBvSpBA==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=43FVl3k78ISnbFD_MtgA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: O6rq_r5cZuvDDSMuDDpvxnnzOHJIJJqv
X-Proofpoint-ORIG-GUID: O6rq_r5cZuvDDSMuDDpvxnnzOHJIJJqv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE3NSBTYWx0ZWRfX9BYijTdKhyiv
 iEIBT1Ek+DtAcOgETpvi03EhW3kq6zhuYZfujbJ58b32IIap8ORYRIc/mHyAecq2xCki0l5mToo
 NTAXZgswh06NGqUq7r3NhT4mfjr/9STKK/HN/2rXp7R3czAQbX7r9M/2uxw5kUEziIePAIP/qoQ
 rHfwxEOOPu3Jrd/ty9a3e+4RsmvR8bqmH5TV4HMOx07xk8S9p0vRhuONi+3QlN/Rwf5I0255UBR
 RDX2u6qIaWvsXkmju3w9J1lIYQkPTsuDpVtYze1kJAoN3W5j94htA23+OJPacfrR2HVwtT7F+Sz
 grXwxaD7aYQf0LERtvb5ieMrVL6x1loQ9mALOauQ6jpPsTJkAEsCngsPutgp9ziANoOiLVArMCC
 pKl0w6wlv4fy9AzpA+kmPnDXavw0PQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130175
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 22:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226283

Set the copy output correctly when handling part.include_path in order
for the debug log line to correctly show the copied files.

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 scripts/lib/wic/plugins/source/bootimg_efi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
index cf16705a28..ba520cd78b 100644
--- a/scripts/lib/wic/plugins/source/bootimg_efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
@@ -386,7 +386,7 @@ class BootimgEFIPlugin(SourcePlugin):
         for paths in part.include_path or []:
             for path in paths:
                 cp_cmd = "cp -v -p -r %s %s/" % (path, hdddir)
-                exec_cmd(cp_cmd, True)
+                out = exec_cmd(cp_cmd, True)
                 logger.debug("include_path files:\n%s" % out)
 
         du_cmd = "du -bks %s" % hdddir
-- 
2.34.1


