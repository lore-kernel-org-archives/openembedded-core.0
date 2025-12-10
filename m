Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF165D3C526
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 04:37:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7436.1765341455163170111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 20:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eokuq/w/;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=aV0bpN8c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LPsu1391414
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 04:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WI6tSkMrHDbIYq9ujSo0hOXwzvVBM/EkCkv
	jZI/yORk=; b=eokuq/w/n7R/ufpFpxShckwKEFWoo4QEO+PUgZeVK7THyWtpXFi
	03QK2tXC5bEvQSgfI56wMEtKEZgMWRpqePtsMFrvx2OSO9Am5KeH3UTznntLlcQB
	MLsLRoxGeMrGjqlzVq0SGjKhPT/Ezgn04DNFGT93FoNsJbJnQIm6B8WBgI9FuIAF
	80XFIv0RP30d0KbMDqqAUuUo2ilNsEDy4WWISyZXZN+DiMNCz34rpLjKWCM6Njmm
	Qp+b0ex+xqkJejL+IRIdgPJbTpnMUX6Gbrp4OQP33+hwjnFm86/wQps3aHQGePFa
	Nj8b+h1tIyA4CqzDGGg6DwCkDS8g/Pasx6g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axpx1a7mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 04:37:33 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-55b11778b1fso754008e0c.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 20:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765341452; x=1765946252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WI6tSkMrHDbIYq9ujSo0hOXwzvVBM/EkCkvjZI/yORk=;
        b=aV0bpN8czSDaL0on4YB4jh56YaPitIenJTlZq+rrGY0mTKXJYnZMvewBhlwjOOie1d
         DKjP+fHh/+m/98LDGfb6jR6Ogrj2VJFjvKJ4HdfAz4dgLjnlpQA5uzsvSOClES6WWlyN
         3BdZ7JFqqV5u2BQw0JKpKyc6klCeKLP6ytnewZ8euioU3CYXy7gxC3OpQQHx2oiA1RdQ
         +jcIuO4LCe5/LFadeN9NqRPJDyWB34+mexkJRrysv5swRtyhZkO3zC3P/DBh1XfR1bJO
         PRdIYSxw6bSWzM/dWC0ugt1h4wlKxCRywVh35ONZAGlXBfLCYQFXHQYKypuk35mPefmI
         viHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765341452; x=1765946252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WI6tSkMrHDbIYq9ujSo0hOXwzvVBM/EkCkvjZI/yORk=;
        b=jzj9McJqnRQb6fT67fvyLn2jpQIDDT5Wm1imp9ppNlFtjdytvfr1YZ8eFqkEyYjilP
         XgY/z3laYGcAsrz1KDvPIe/VFp6Ob/J+xGwgVI7Wge5whJs0ImrMyqvUqVVP2xZcuy7H
         a+1VGq/UeonwIs/w52oEeYpqcaufxRxFBIXA/KgRT+EmJFrXd2FAJQ6KpPxJFSnkF4KG
         cGQ+pTTBjBtqWxkiYwdqCGgigNwKp2V76wfq9CXvzbne4+3QZtHxLicRcRsj998hZ1hR
         tgz1FcTIPMq/qTosrf4OFthvF64IPhv4tVHFJkb8vyFfgLdDU42RrcUk9a3D/FXS+19j
         iqvA==
X-Gm-Message-State: AOJu0YwtxwRzJ2GE4fr1QY15D1jI/AYzPTSplGaIIPK/qUW+N0kL8wWZ
	+ckMUVDWaVwpS1G8jt4yG6YDiB+iy9czYtpWmWlOnqR+I144Tky9dzP0zHiLfAyBjJHtTGqOHyM
	CVIhTrZtm0P7UOI3RaxvEMOZ+MBRdi/p6s5ds2VhAtRV6ot5HRPkzKArQhuHJ2nd0WqXNbzHR9y
	rU/ApsT/Wjm0jItn8=
X-Gm-Gg: AY/fxX65ydUQAfQtxBfINzXIOP/7QoWl8q+n4eu8ihQhemZcuhBJBZm784r9dqEVCid
	XgSnANgfqyzP/RvQHW9q02uuXU97S43102phGlT3ITTJCW8LlmMQ3TzKcQVQGfRMEBxntnZatJN
	I3RTODmOcxnm9f8/amJgHgaw+OolqbbkmbA5adiLOtEXOkCcwt0aTcBK2rGKOP8tJEQq6ymkSHt
	b5qpHADdppf0Jk42JyIB4rD4oh8CP6HrIgwws511AOQdhe+zOCAfE5h89HDozf6sIDa8wv14xqd
	KKx04TLx+IxjL0a/h44JPu667TNIk4/nhhXI6BzX0kP4t2kSxz8gCf7Hh7H8zsQRc1SmIeXdmA+
	rO102qaMQuYYUaRNCU3JjrquJuGgOVzphlenc7d/nUkZ1V8PfGfQQo+gLY7xyKJ+Jvy3FSZa7nj
	6hZbXopuhW8G2OwkjUZ03YW/w=
X-Received: by 2002:a05:6122:218b:b0:55e:8569:4dd1 with SMTP id 71dfb90a1353d-55fc78c1783mr1277826e0c.1.1765341452514;
        Tue, 09 Dec 2025 20:37:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmrOmrN4IYf/jfoxpVyFMZhu3xi/X9kuMDFAAucQ2MuIDftPbScawwg9HHyQChumDRq0xCjw==
X-Received: by 2002:a05:6122:218b:b0:55e:8569:4dd1 with SMTP id 71dfb90a1353d-55fc78c1783mr1277821e0c.1.1765341452022;
        Tue, 09 Dec 2025 20:37:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fb5442cf7sm1287461fa.37.2025.12.09.20.37.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 20:37:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/4] mesa: fix drivers sorting order
Date: Wed, 10 Dec 2025 06:37:25 +0200
Message-ID: <20251210043728.847548-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7pBkr6YaQpMwrwXIapgh_PRmrxTOc-wP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAzNyBTYWx0ZWRfX7pk8R39K2yoO
 aZSAlO5kuopDFAG/WFEY1yes1VI4tcDIVVJLIJXbzfYJ1EMiPbQLg+3K5PjR38qbxAroSFymmdj
 /KHbTtp/gJCrjCq9Gw0TBYKZs/m43e85pDcsJznEmBwjDxhvIgcxtvNBYQeKr3Crl4gnec9RCkf
 xVmNluHztGe7IAL5TvJM2RQzr/4lN0M15Vch2KwLeHc8FPAfYMXJpuXh1Ybb1mEYxdi8rSDQpYi
 QOWl6wBXpUnINS97b+lIca4F/UVHOFM89tpGJAzLMAEvyO53IX50xIaVLDIbdziQ6IKjl3z7WuD
 Ie/H6gmXzjOgLAcOoj+f/5SQQsKEVRRKPvz2U+o087nwBkolxjVSYlqwK3vaDdZU7CPHfeK2l5Y
 NRhaGUWDiab4MMTbLIWy9NZI997Neg==
X-Proofpoint-GUID: 7pBkr6YaQpMwrwXIapgh_PRmrxTOc-wP
X-Authority-Analysis: v=2.4 cv=Su6dKfO0 c=1 sm=1 tr=0 ts=6938f90e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=CSqd8LzyNWODBqvqKkwA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 04:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227454

Fix few issues that were left unnoticed or breaking sorting order.

Fixes: 64108679ada8 ("mesa: sort out driver lists")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 27483f69514d..9b25bc0301f0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -129,8 +129,8 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom'
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
-VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
@@ -176,9 +176,9 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r
 GALLIUMDRIVERS .= "${GALLIUMDRIVERS_SOFTPIPE}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-llvm', ',svga', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra', '', d)}"
-GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
-GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
-- 
2.47.3


