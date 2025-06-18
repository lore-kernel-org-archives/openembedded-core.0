Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31856C7115F
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:05:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.8215.1750255533408266994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pSocCuvX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IBuCKK024068
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4e2BxkPexIz
	s8xpwI/AgOueGif/RjaBce9DCdNz9mn0=; b=pSocCuvXiriMDSVVEvwe4HxVu9B
	mb1pq/rhped160R+8dYW1z6SZpfb2aTIme5M4OzIGj2Jh8li8ZrIieCWsAo8qmFL
	9s41OaEdYIdlxws+rHZ/u6CAv4otPEyUjVuxrcr8LLvFZYgfqPfX6WK5Bp+jmDJ4
	77pir8kAhwoK8yCcepTBhXynQ2eDmQQnsSPuthyGFZOVz0lrQcrg7tf20dw70Dyo
	Gml5A0TG/SN570Rmpm21eOz5xEAel88vzcoZgq+lG4oxf2QmAhUGWt+p5h78PjG0
	k8h0rAPGxvY6pswp2oBV50xVNgTA1JqVhhgClRS7udpO3enhM4Mz/QDkWXA==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw138c6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:32 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddd90ca184so53941345ab.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255531; x=1750860331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4e2BxkPexIzs8xpwI/AgOueGif/RjaBce9DCdNz9mn0=;
        b=WIhTvnJN0uuSuORm3sWjzppjfUqk22jlcjuqlo/48IXQ5Atl9RVuCaIX0huhq4mNkF
         hf5DSZWPOnEEHy9VDBO64Rm6dJL4oWOceXy7UK+zfTqWD0p8JeAyKpFzrGlbZ0yng8i0
         MLXZbcv4sN75/DHQbhJVNeUKs3IJ2ItvweUoFZ5i757xtYaYMKkKlN7ubrK/20EDFnRs
         qQbslrEU3q7Jk9SNbTidx+4KD5g5F2eczQsbRuOvORBXGatIVbKV7qc8aOnA1tW542pV
         gy4GbbuMqnKvz7O58b92/T+TG1w/R/7es5xrwMCgClC5fhraOtfb38EzvyLVfgYB6I5H
         bt7w==
X-Gm-Message-State: AOJu0YzZOyBndeoC+MD1Myd+BPGOoUc2JbK028qg0aQb/d4GYqB/Im8Y
	Ej2WVOsQqmrbERRDG6sxCZmOwfdAeeuDE/Aac+8rJ44hCfbvZMA7162rauPy/cNFqTtDAAeNCQQ
	bW04csEwB9zzVNVPe/1KHsCXLJIh/YyuDl7zhRrE96xAuuitBE2sUPy1T4AAwDqfqTKbys9zVDr
	5IgoUsnbRXWKqYS73H2N/e
X-Gm-Gg: ASbGncszQwlQEPpMWdtS3yKe1mKsDAOacAtxZj30XxytBYOIcXFIr45btA7BtNhT7t9
	kVXaoGOXUJ197eOwKC2J6WbIrtxrlkh/5rXEX5at6cbxPuzGci1PuHz/+GLBRv/qwiUfPmi8Z88
	vcE9QUQvsydvtRRPGVoTOwhZpGmIjC10Swr+EUzaOuPlgQVR+XSw0D6a4E4/rsiyLyklVYozbVb
	b2VzCjwc8ADA5wvEXDYUZ9XlWYmvh25JXbLOBJcamlu2tgg2HTUiqETKpBuPtQh8XAF4SfTezl0
	jfWq0tKyXEMzSgPiK8A9mJkQYQegVwC5Ri3xqZvGavKMh8d9Fej1ubAGsq4Z+ALvq7AZdd6jLOy
	nXRTuOCfwOo/fVy5hC5FIchIjvr01aU8Lr3M=
X-Received: by 2002:a05:6e02:1a2b:b0:3dd:ce95:7f36 with SMTP id e9e14a558f8ab-3de07c4c2cemr206569165ab.4.1750255531038;
        Wed, 18 Jun 2025 07:05:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd26eGhvTyDZ/g8WjlhyPzszeLM8ZjLXHecWBEMpyYmcpCYVGoQBeS/GvlhSRdj3d+9lJsDQ==
X-Received: by 2002:a05:6e02:1a2b:b0:3dd:ce95:7f36 with SMTP id e9e14a558f8ab-3de07c4c2cemr206568705ab.4.1750255530574;
        Wed, 18 Jun 2025 07:05:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3b769f9esm20164281fa.30.2025.06.18.07.05.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:05:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 4/8] qemux86: drop duplicates with default-providers.inc
Date: Wed, 18 Jun 2025 17:05:22 +0300
Message-Id: <20250618140526.1431757-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=6852c7ac cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=_kTybgIiMiGBH06O6-8A:9 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-ORIG-GUID: qIGVrp50klfqsTudQY0UDsiBKsv12Hh4
X-Proofpoint-GUID: qIGVrp50klfqsTudQY0UDsiBKsv12Hh4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExNyBTYWx0ZWRfX8EfDxG1eNVFv
 4mMBXfgr9X8vNWu5oZpwyjEV4REXAQ6gkQNzs2zxthNi83gkJLq1cCbgUxp5afT6ZOoznbGOaNZ
 e94cILeWcxcbjWK/R+EJIaIWx3uyuNaMiheJsTxA5uhUUKUAq809zzYaasE9qT4UWXbTJSskHuq
 N7gq4UajTCPgXA1mpmVNJJB03TN4+l8id2NtfXfPMEoxy8V9gR+16ySwlmAKMx0YR0DkDPDXhFL
 FSstWiLL+zkt28gCfI4ZYchkzMseVA1Z6OrzJ7vDyBbPNBDx2X9vUO/IxjX90/GdNGpjOcNXmps
 u+MioNgTd+1PfJDptCdELzBfwrC96308lbmJyza2LojzQ3B/dEW3qmZMoSgefqAclEbFxG7ElGj
 CpUJGffnRPYur20711vq3VX5cdewi2lUOOUqttZ1bXSLuq1EMso73HWimB2he4SuCW8zvDfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219017

default-providers.inc already includes PREFERRED_PROVIDER values for
xserver and GL libraries. Drop the same values being set in the machine
config.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/machine/qemux86.conf | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 1e072e1ae285..51f080bd2a51 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -2,12 +2,6 @@
 #@NAME: QEMU x86 machine
 #@DESCRIPTION: Machine configuration for running an x86 system on QEMU
 
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
-
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?= "core2-32"
 require conf/machine/include/x86/tune-corei7.inc
-- 
2.39.5


