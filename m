Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2FAD5CCA5
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:55:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18739.1765878915066530189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FUwx43WD;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Rqu0cxpd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG8SNt03745902
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ulg8jgRGTMhW7tuiHupRZYzkAZP4K+Mq2wm
	yp1McQ20=; b=FUwx43WDoIDZTk/OyuUOW6K/HsZF1Ck3LByn7B6WAwT0Z3F5zRZ
	HQQQ6puzZ/+qpjVYXZxvF95VMdBiCHRe1nUbLXHPs1oxG4IzI0qGFnQVj+K4Y0ez
	Ggd6L9bJuTAVe0Sbu70Y482dATMMX5prdWcZlw7dzXdX8XvStXXHlCcFlz1ik0AU
	BqHHD5PcPKWcQ+mNFVSppsD9cCcCtQlNG7z8246sA9zJkLuL+V6zt4X0vxhHTFXx
	sgm8hU94Ho8uMzM3Ei6RxP0rjjCgCxw4Wl4oToiJcyQ+J973nCwPPUbvx8vN+yUO
	TUxgwarHFgoMx3Bd5ZASNV/kpRfYL2O/MZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33xj0cxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:55:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d26abbd8so11701681cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 01:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765878913; x=1766483713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ulg8jgRGTMhW7tuiHupRZYzkAZP4K+Mq2wmyp1McQ20=;
        b=Rqu0cxpdBKf/lIgPcJQF9217RV360BNuR0m1vVomHqPsFoy1OB1cz7roob9f3MtZzS
         LBJCmdTTIRORGHKSGPvOgmjIrPFCOogWwyM/UQh0t7xqXPTV6MzM25n/yN6HTduaJnHD
         8mrhoM8DtkCt9QDL6sLyjVtyEiU0zJCgTr0R68MyiguJ4BuAOWIlTLqEeGiBH4ntJ54I
         +lZZnEspFIaTVlGICfmkvVcTE476YBjHZWvHBPkoYRXS0K/Bo/RUWGfqZGDj2UzJ3gF9
         02F0D8Y5Q2ruqNL0bJhVf1O9q6gHWWNxO7c52ZjkaemoUBmFaWq5hquJK9JrrukwayrL
         jx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765878913; x=1766483713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ulg8jgRGTMhW7tuiHupRZYzkAZP4K+Mq2wmyp1McQ20=;
        b=qZAe4rB52+6lAuFIAaz06wjRJrdVJcMtfgnwrwG2mKuZSfpU6gSLxSUKwZKx8LgzcS
         KhMzfEvFaNjJm9UKfaegqJk4a5jnRriMq5jecSCs2JsIdh5ZcKH8FXIfYN4fJYVfvwn/
         M1fTsYr7++KyDWet0+HrBiZGk3BkjDuwLwfJXwF/yBOzt8T/vO985jr0P/UmdQ82U2XU
         a5JK+/xu+TP4L7OZ2RLADSD87YG4jsinoBTHtuN+FY0orJ81TiXPARY5rwwujwLW1j9h
         qZLWXccFRpudKLln7rZUq7O2RD6CylZl/Jr/pjIjMHCATbbYctQjSJFu3R8+rS/sZ7w3
         hAyg==
X-Gm-Message-State: AOJu0YwOLCmKVMtEwAKkbCWAIvd7ON4bd8AwbdK+SL+ul35fAjGZ91Xo
	OGggeLw3fuBnSD0BykDV+weJDCBb/lUyb5UZrQ2dRK0QwmHJ0JbWpWum0AdL0FFNkEs9yIk+n7O
	OddLMnDiwKCcCxepMVqqO1Kt2i6TkIZ8fA2dpB7SS/BruPmINJ5ngz8qVIcQS7ZXI9/+mFMT4zz
	5IKf3JqlFuIcVhfSE3VQ==
X-Gm-Gg: AY/fxX63Duof32K7OC7/4O1jUg00hdd6/SiFhZBiZKZdLmXGS9pMB5yHjFeNVVtnNSp
	njso55Ekgk7LYe4d4cXC6Cn7cEwsJD/Ryi/SkIwaKS/ckIcgHNKK8S8W2qzrnzgplWxlGJar5iJ
	bzCucbvQtJA7aAj4enCo6sQXZrZkibXM+3cOvaghpreX71pabf4Zjx4+wbkvwqC8GVwK16XCXwb
	ad2vhZWp6FosB7nT73b3I3tWCZRnDMcQ4bslDR/s+Iug1HlVgptM1Zeog2GvzshVsqCgEBVa7xy
	cb4I4lbOEnLsOhOk5zukvfkTcucBIc/yNRvMYdebyRBm0w2rMpzTtKLtV3IYKdyJYNxw6z1b1Z8
	oSE8/FtQeonPOwVBq2N1YColqQGpd7XgE
X-Received: by 2002:a05:622a:11d1:b0:4ee:28d1:4b91 with SMTP id d75a77b69052e-4f1d059d49dmr176379131cf.54.1765878913066;
        Tue, 16 Dec 2025 01:55:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHosrnA8zx0hyfwEHqfMl3qEtVRh8DX7VfF/jgSwtTHriBmh9+mU3pGKjCjjxPBO0NkZQYSg==
X-Received: by 2002:a05:622a:11d1:b0:4ee:28d1:4b91 with SMTP id d75a77b69052e-4f1d059d49dmr176378941cf.54.1765878912643;
        Tue, 16 Dec 2025 01:55:12 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5d0b0dsm1645389866b.67.2025.12.16.01.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 01:55:12 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH 0/2] Fix and adjust ukify packaging
Date: Tue, 16 Dec 2025 10:54:57 +0100
Message-Id: <20251216095459.3551985-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JRost_HtvCKsz6hFR7GjyFbF9IVmN96u
X-Proofpoint-GUID: JRost_HtvCKsz6hFR7GjyFbF9IVmN96u
X-Authority-Analysis: v=2.4 cv=KtNAGGWN c=1 sm=1 tr=0 ts=69412c82 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=hNRUeyV2LAob6j15zJcA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA4MiBTYWx0ZWRfX3ZgNoXNXELmW
 uohu6kOFgVB1rpdhVFMuXakGMoxa6Q91cvrfpQ743RR+KjVZm0Cqza9qg7aRVVfgHTJJzyQIHv+
 UYviWo8cuqU5p/cSKfyAVcb0Wyx8ax6n8Hl0DRUbSfdX0tETUKzOuOyl0CTQy1ulgqiAn6N6ajs
 hdahz7DEhj1hYGpc9xyYxuexoSxhnkNDozoVp/bACpVG9uSfbqyO+tIbKc/8XFnb8wn2j0PCM1x
 SGhXmYqFWoZqQyeYfz3IvJj01fQVW3qz5AHd1PmEJoHgTxPeDsWtgNkpVJpiej4Ii0WuUUbRJ+T
 7SbmJV2tOOc+cOHMfyRFdMeSw8l4a2G9qJ2U3nTW1hDvJUl6KqGjPUfZigf8TcDvIpSmjYqDQnj
 4zWsnqoCHHTXf2/cO4MqYSMPyL3KSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227935

This packages up 'ukify' from systemd to be used as an, optional,
stand-alone tool to generate and inspect Unified Kernel Images (UKIs) on
the target. The original plan was to add this to sytemd-boot, as
systemd-boot-native already handles 'ukify', but the recent systemd
upgrade snuck in 'ukify' under the radar. So package it up properly from
inside the systemd recipe.

Koen Kooi (2):
  python3-pyzstd: import 0.17.0 from meta-python
  systemd: package 'ukify' seperately

 meta/recipes-core/systemd/systemd_258.1.bb    | 19 +++++++++++++
 ...-setuptools-dependency-from-74-to-89.patch | 27 +++++++++++++++++++
 .../python/python3-pyzstd_0.17.0.bb           | 19 +++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-89.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb

-- 
2.34.1


