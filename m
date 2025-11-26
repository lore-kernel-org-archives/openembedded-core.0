Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E646D11183
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 12:46:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14156.1764167919908326627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 06:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=R6yPYndg;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=N1tdNwdk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQB3rCL1667784
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 14:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5j0e5TUCWuh
	4BHfmG9IKL+cz357DxAltYxUdXfYrmuo=; b=R6yPYndgk2NLqngnlH4/i+4F3h0
	Svq0Tli52tFwzCZl+gfC8A6QPTH6fL2E8++8T+77eI4iZHzrwEA3PVoss+g3iiBu
	lmhqkdC9P1b+lbE0ikaOEPse2Mca5DqbCKebHtOTF6N6QAGIYhGQagqYXm3FPK3H
	4BHS90Stsic8B0L9wveNg59xdKuwtlqqLIgUMA/hioXG52xBXw1uti0tl7EMeXX3
	b6ZRdIw0MQO61a+l/FGjneFu7EpnFTKhkLzMIdgkEKZwB+1DJ55o0Vtrb7F1ore1
	tD49r39LgbAco5dNcQMnspfn7ebpf90P3JNWRm761i9BJfupOnLZ6Zth6qQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0bmrebc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 14:07:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b4933bc4aeso5974042b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 06:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764166049; x=1764770849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5j0e5TUCWuh4BHfmG9IKL+cz357DxAltYxUdXfYrmuo=;
        b=N1tdNwdk9I/aWG4unpe0fenmjh57mutbAizAKyMkoM3v0WyiFDFl5QsbwHbOTHSnUA
         5rPMoEDGdGUdJQZOLsoeiGio+8fJOUw9hg7atGHT0UEmKFolsm9XX4KXgqafSmx+TOK/
         /bCmBuewL8D2dsyjUlCVbHzHQEMtnf8IlFZHU2g6+L6XseLZaQfcSjdewQjwR2PI/tXa
         PgIekz7j5VpR7GGoy0kqkq3yCof0WqKVOxeUd/Kt2gGC9d+PeCYnVfznXSTrrntoth1N
         xHVOZ4dh4VmdzRJFx00p/JkGx4F8uT2CVD+SkKCoYpQ29UQy2Plz566kvjhUcrnaB6Gs
         KbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166049; x=1764770849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5j0e5TUCWuh4BHfmG9IKL+cz357DxAltYxUdXfYrmuo=;
        b=kuu2lRTtzcfy0IYy3RmekA4aHazwBQIFP4nFnf83C30EwztPuBjbntGlKtjNpggYBp
         w5UOxaHoJE+2E0lW0M3ICyOMhdW4/GwyGBKom6lqB7UmUYBY56ltPDTMdrSfhAMfoKRX
         7KpIIbghI8JzzlHV7rbIIvCw3thz02UzdISDD9GjmNRyb4d9NebW3yJA/L9/eZYi+15w
         aquyYCCkih0H4nVZy21LWJ9ydMGd58aVL4QsPk0vmv1JB1XCQvRT/HsTsuZ69ZLjtQUT
         KzUoRAY1OuMS5gI28Xs6dP9kSVdluOHIAODHPF0fgLgGafhTGy+pr+8eTTMfGTJWy9yW
         Vt/A==
X-Gm-Message-State: AOJu0Yy0QqfmJPfK6Ud9nPLII79cqtV7NBX1APNgGJxvvpX8By+whjM1
	dtMj6DPgQHtRVNl4hNmp3TWqQX5/Lkr0vVjo0W2FMpFXPyGlcRimYxJmirZYn0JEvbKMePRJhLs
	hJaKIedpSqTAG0AMcsE1ghv8HmT2ayWfmjYerV+w7MA6h4DV7PzyXmrZo88oQvSYANkFm2wxC6+
	guJEseQuFyMHcZEKzuAQ==
X-Gm-Gg: ASbGnctD5V8zCP5Qeq45MxnEJBt+oFtNTdZckI3llsguxN7FQu0cG/+oBb9Olw7cvgk
	CFuBfPXnyheVVcd+ccaz34LehpkLiol8bZpm7mpu6M14eoIMRUaMhzTm6Flf3rxfrrOkgXMkcYM
	oRrO+V7qBETJ2w0+RthEbukeNiVH3J/PawdxzdmLxQ8kOGADZW8/BSliudgulQ0Su4jSZTszV8+
	fRfxwtmPg/wpTop9Uu+ZYl8jpfhyOcNjWOda0GpnoU/6h0C8uhjy+8/agTUfwd/Qxn4M5nt0+HL
	v49vdnVjFNWBG/vgSwyUNQwJqFWVI+JBQYieLDf9ewAeUpiDjcJ+zCjAMuf1MnB4IYDfqxO7VC8
	OwF5LM1E93Vo7wv2EWUohpmBCiKThxUeQwVF/L8kLS7CVAfNTK4GekL1bxXJnKqSQqhpK
X-Received: by 2002:a05:6a20:918a:b0:35e:4f06:4fc6 with SMTP id adf61e73a8af0-3637de9f332mr8707286637.33.1764166048539;
        Wed, 26 Nov 2025 06:07:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJw22zbVdJQ7q3qHoqHkUXVJw8l7Zspxk/oxixaXwDNqEMfQCj5mqym6O0aNsEGMQ7F01c2w==
X-Received: by 2002:a05:6a20:918a:b0:35e:4f06:4fc6 with SMTP id adf61e73a8af0-3637de9f332mr8707213637.33.1764166047818;
        Wed, 26 Nov 2025 06:07:27 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63dbcsm21624961b3a.50.2025.11.26.06.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:07:27 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH 3/4] wpa-supplicant: enable 802.11be support
Date: Wed, 26 Nov 2025 22:07:12 +0800
Message-Id: <20251126140713.1414484-4-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com>
References: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=AKyLkLWT c=1 sm=1 tr=0 ts=692709a1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TNsu8Qfd1aDV9B-InT4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDExNiBTYWx0ZWRfX8PzeqAj5aqxt
 kP93NdjcyHjrjH9GSUyeXBie6+nxgl0eHtQZRxonqHklYH5z+5wAtHe+tc3bfrG+YVojSgsIgUz
 JR3KqWUZ+h37oYbYQF0/C7+BzXCuw5SKxZWOLM5pzziiRqeZDuXDtQnNllS+J9pJ/DZzp5rTAhm
 BHNYEOg62e3ix1EkFvq0Oh5LDnHIepquZ+L198MBe5FSw0x7EBER8Krve8Urr5zzltRNJvHN1QP
 3RJjTmyAYaQ+Y8Qvwxp73+lHxsgqeef3MgwGgkGCyskFQOS4kx6f53F9Y78wkY3eIortPctSzKc
 blWLB2vNgpyR6YmT8KbEjFS+arU/eDRftToxCYqTBFsrmCMuHo4oJslWbNNiDpOg+qyc65MDc9x
 luC2blBhZM62WNimve+6uVbSqd4/bA==
X-Proofpoint-GUID: z2hgIQ7c2cqCRjFBJbYoxepqqxeUYra-
X-Proofpoint-ORIG-GUID: z2hgIQ7c2cqCRjFBJbYoxepqqxeUYra-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260116
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 12:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226839

wpa_supplicant has supported IEEE 802.11be (Wi-Fi 7) for over three
years. With growing market demand for Wi-Fi 7, it is now an
appropriate time to enable IEEE 802.11be Extremely High Throughput
(EHT) support - mainly for AP mode.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../wpa-supplicant/wpa-supplicant/defconfig                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
index 52befd8f15..e313894ecd 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
@@ -510,7 +510,7 @@ CONFIG_IEEE80211AX=y
 # Note: This is experimental and work in progress. The definitions are still
 # subject to change and this should not be expected to interoperate with the
 # final IEEE 802.11be version.
-#CONFIG_IEEE80211BE=y
+CONFIG_IEEE80211BE=y
 
 # Wireless Network Management (IEEE Std 802.11v-2011)
 # Note: This is experimental and not complete implementation.
-- 
2.34.1


