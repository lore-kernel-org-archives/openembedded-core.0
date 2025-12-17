Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B24D65525
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:34:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10566.1765964057605776358
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 01:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hoosz/UR;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=kmNAjWHb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3wt6f1904439
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Vm9+LVnzzVMexhMruY6RwtMIX3WpqrwDniy
	NcHjXPPc=; b=hoosz/UROnZupKbu/wDD3I9rYIVzuZGY+sYv8UF5LPcUwS8tUro
	9Ou0qQmDDz0Ph9um+ZaL+/XfVIvrlxtOw3KUFkyTETEGykaemh27hZkglXVSMgY3
	OT1nTY3Wove3SH+lFZwxHLD7ZWg72t5Fx7oMLHbIKRN6EQvPdJIyclr2fxpialgi
	jZmQWZ4fbEJ8JRublPLZ1rW/W103k32nvN9jK6+Y3/fSMvO35g+5P8Z38SRX7MTq
	9JTkrE9nRtar1JBa9MEpDCMd0qc1WRG/X2K33vhBbAM+dV2Kfj6RSfJJK98tyGUQ
	eLshObL/akyh1V6mYTsobAear12HNjVIXZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n3311jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:34:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1b7686f0fso104464951cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 01:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765964056; x=1766568856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vm9+LVnzzVMexhMruY6RwtMIX3WpqrwDniyNcHjXPPc=;
        b=kmNAjWHbc1s6MnicnzjDb1M6SW+eLzoxtAkdnb52uhfwJYjF3Rlq5Mb8RNkPcUjP+W
         0TaHvsZ3v8op8ZsEGLnZ3tKHcAmuWwrvh1d1WSHPmOEt+W1iOnxcrfg+HvxBAl8tYhJZ
         N6Fs+mkeaRUmGdkrcJADRuH4gAF5/tC60RTucNRm1lCAzq0wQApYluAp730YjO+YNptC
         TUq//DgYod6+J9Y3uredrJI4uQFHSGvZnGRbNxfWYR8YzuJ6Ognwa6voFhBPRc2I3ZM8
         6fFZs7KhzoD7YEe6QZqUmOBEzBW8uhquTm1V3smDvJ1UOWn6sy2wj8LtZBThL7tesWF1
         7Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765964056; x=1766568856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vm9+LVnzzVMexhMruY6RwtMIX3WpqrwDniyNcHjXPPc=;
        b=ooTL/Rdf7fPBKwiGqOMbihRUmh7ShK9fEyaFuxI+vem4BdIwzrqP4HIGn2KIxcvc2C
         a3GF3/X2NNYMatCfVYEFqK8HF69qwt04LINzDP6xCP4qg76T8iPiGCTEHPUuy7jutMf+
         4z+yPC/rLQw4Yr2gJZDYZ/dlSmMsgRO1l5LuOhQy/6I7Y9z/KofQE+HRgloMgxl/kSd4
         W/JlCDlBGMKvGJKoqZ7QmAnooNSU1BVktSlMkdnkV08Fu9RmrCzQL5oaeyAwfJPW9GXA
         nV8pNa3udms7dh2Zw01h9OCLxg1Qi+HWUqTLr247GrSOz0eSGhjWIejtqORT0vCYuN6U
         EdcQ==
X-Gm-Message-State: AOJu0YzwLEXbclGhdQLlWlS3JyWCRHKm5iTt+zeHB2yrRvK9QrldbOaH
	FYOsGYscGH+9WurV37jmOAe4FvtjyWOLq94O2bsj308M7LaBTbv7QqVDGx6d5G0l7OQUn87hs0i
	t4TIC6qenMQqzn45GFrUefs9FjmjidXPFAdbV4o0orYEhxVy88mtSeUaitXiF4nDnbHbR+OVi4Z
	IZttRd3eThKxgXggixSA==
X-Gm-Gg: AY/fxX4PMPIqh/m2lmMwlarPjaim9J8rPxZsirvGgcoZbX4sLOAcYLYqxS2mUg1Kg7C
	e1OBXASz5tsZKZvH3cZi4m27z/y1oLnN1J/UgLjB9tNwX/CwJZfMi78nn4s0oq6jkp4IboYWzRr
	uK4y6DPFqnpiCR+5jZfvZaqvR2g9YiUXhQHeUxZF1sANMum7bvF/Qen4gqymJ0C1X3PYHt2fv7D
	y5Fy4PAOwcQARPHeQAvDsF/WM0QoA2jpcuMHY9sv13m11zHtyuUXtnF0nZJbZTiyyRTlpLGuknE
	t/0Cxcu/2YfAY9XPwbdO2jg5ekbXTML46WVqO8xk7keYjMsyJ1gqazbWwgzcE8kQijvNdF9hJ8m
	SS14EMBIdqONi1hr7Dt4PMZ+2u0NAJ4kH
X-Received: by 2002:a05:622a:5918:b0:4e8:846e:2d8b with SMTP id d75a77b69052e-4f1d04ad285mr230222531cf.28.1765964055695;
        Wed, 17 Dec 2025 01:34:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGOf2exr5ViQoSnVjdYEvDvMn6hfo4hayf0gqRF/eCtkExz9D7/WRpKEyg340rF15tk6rqew==
X-Received: by 2002:a05:622a:5918:b0:4e8:846e:2d8b with SMTP id d75a77b69052e-4f1d04ad285mr230222321cf.28.1765964055179;
        Wed, 17 Dec 2025 01:34:15 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29bea0sm1938143866b.8.2025.12.17.01.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:34:14 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Fix and adjust ukify packaging
Date: Wed, 17 Dec 2025 10:34:07 +0100
Message-Id: <20251217093409.914045-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NSBTYWx0ZWRfX5cSyuVZgHkpU
 BIh5oIAx+03acipnv+ogZBuWLJBENczYXvciPMgosGML1fZvV4GG2SDbfo/zVU4ooZj9wnsmqTE
 PJ7XjHekgC9L1vYkco69zYWHzXhxKrHuXvaDIvHa2VSRkAdbR+AWBrcPmP7bzBN2Z6sC3vclH7V
 kZSSXysxCyY/XZ+r5XRcTre+meVkjoT1W3F6PvzIYnoxFsfQLvs+NyWM91WE3ZEv99UZnluFlR9
 qSxIK/53D71UA5ypsr47EI5D8wp39PmXK2RY5SGfP3onA0UJCtJZnZR/nRLrjsaVMWHnNxzuoUT
 5GKAFsiiWRcdCobhVGfpsGHE2aKIwuvcPPAgbzaYvcntyjpHk36IIbmuHNHr81w5npauPEeCkhA
 biegRMpOkh2VTWRQr4lA71W772DrPw==
X-Proofpoint-GUID: wqyz3PUpfsAg8LZ3Rh6HRXgOcFQsiPFO
X-Proofpoint-ORIG-GUID: wqyz3PUpfsAg8LZ3Rh6HRXgOcFQsiPFO
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=69427918 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=HnmVqgPLSETmD6ZL1HwA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228011

This packages up 'ukify' from systemd to be used as an, optional,
stand-alone tool to generate and inspect Unified Kernel Images (UKIs) on
the target. The original plan was to add this to sytemd-boot, as
systemd-boot-native already handles 'ukify', but the recent systemd
upgrade snuck in 'ukify' under the radar. So package it up properly from
inside the systemd recipe.

Changes since v1:
 * Adjusted pyzstd patch to not specify an upper limit to the setuptools
   version, as suggested by Alexander Kanavin.

Koen Kooi (2):
  python3-pyzstd: import 0.17.0 from meta-python
  systemd: package 'ukify' seperately

 meta/recipes-core/systemd/systemd_258.1.bb    | 19 +++++++++++++
 ...emove-setuptools-version-limit-of-74.patch | 27 +++++++++++++++++++
 .../python/python3-pyzstd_0.17.0.bb           | 19 +++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb

-- 
2.34.1


