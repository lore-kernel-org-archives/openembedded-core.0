Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741C8CD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 19:45:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27896.1778096734596471044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 12:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=ZyZGEkAj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.180.131, mailfrom: igor.opaniuk@foundries.io)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646FQ9xI442793
	for <openembedded-core@lists.openembedded.org>; Wed, 6 May 2026 19:45:33 GMT
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299jfdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 19:45:33 +0000 (GMT)
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-672a501ba46so20872a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 12:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1778096731; x=1778701531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Im1podSm/nZwBpJU4zvzA/KHT8U6ltQ5JsRiCvm8Geg=;
        b=ZyZGEkAjgPw9+bV/vBrX7A4QPZ0OZJ3JNUTRT9wOVMLq0BVHsZsdUr40+j2nmvkF6z
         fp9Joej4UabtzwZkphaIfji3OABjK/nryin5Up5J+oxqCPQ1HKf7gbbOZjVh6MNxgGsz
         cAX+Qqmt1zr8eDKpZlwBMwJcpuUBd7sBez5Gf/FYuGoEQcb7Du9Ul3q8AQlflB70Vu69
         r91ipfx1P9oYPi/GGR9afJCTXAtycG/P6DqdZZuKQejVLo/xRktot4PQCYEUShDzCR75
         2+fRSAxatBteqNoNBCWicPKhGKO/TQx8omSuEJflW/bxxBDCM+Mj0MOeFpjdbLo0Vsdn
         mUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096731; x=1778701531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Im1podSm/nZwBpJU4zvzA/KHT8U6ltQ5JsRiCvm8Geg=;
        b=Ew9vtA59EqnH97ROEALneDpBJtjKMoxgHyevoy+FoVbcx0nq/IkPGASy0wB4jZe3RJ
         x8KVQZHlrJVCJOjDZGgJO8cFFGe9GXQ8WTFXmXSeSHDOI8IhJXVpUFzRb8d7g4Xizx1y
         1GUw9bdlQdGaivN6dAq0ZqDlFwrsPP+2dVDqc5y0l0GEZi1hqmcLqYjoe3ldqPbRKjoT
         r5rg0LZ93WjwFGfNsZv1ooUOUPugb36BtAK37FP2Q6rlUq84bCnxXZQjreaItJ/W8YTg
         /ZrZE9JwDk7e7AUy2Y/NDK0lu2qmdhr02Eveu+mlIlSG/ynaz8hFPwjmeaeS1HkwMaEu
         2Buw==
X-Gm-Message-State: AOJu0YyD2o0O0mGS1GM1qjVG7f0WsipZUmDQvQIVVTS8KSBy/UTmJJLH
	NnXVT92kqskwQMH81PhKUCPEkH5hVQhAmF2wNC4oC/BIx7I6cg7qlBojwOm8RlvDsG3Y1PqVHPI
	+nqVMdq76PzsRqfSNPSTT4b7YugaKIdZJbD7J8jUzf01Br29SRtYnQnDzSLBQ4Rnm2WI62ah3uS
	h1FoAP8EldksusoAr1
X-Gm-Gg: AeBDies3Kd9AWDcWElpj45dHHihGUDIl/NfGJrvz8xigCAxvSvNek0Ogn2hzLKvflS+
	1Ybc6aTPPo4A/EYQIQCWV4q2Tg3dTvYT0ucV1ZGLvZPLmJ0y/IWw5x3TXTpnc0u39UmvbJJ8jp7
	+fCW9x06BNUQmuqObGOBtB936pMUGPysdct3qnk9kVEzQG8owbpzkKsPHnvVfbLruQ/ydflfFVF
	pi1MAj6EBj/d01RnN5u7qjMQ2qxRsom3K7lS4SVx/SWqqtbT4ksZSzTQd50epS+iryKGVxsZOtf
	I5D3mHVq9M4aEgQcHkeBDZ6tGLei/6kLNws36O2YYl8LlZVi7mhvNm0YoOkT1TjJYwGNz6foAgM
	UEvCSLZn8ZBXi8B81SJNEBdzq1mTN5UBUZ+XBQPjwNneu54C/bXjRIr8i2QnZyXaX
X-Received: by 2002:a05:6402:913:b0:67c:e014:464c with SMTP id 4fb4d7f45d1cf-67d638a7675mr2241612a12.5.1778096730964;
        Wed, 06 May 2026 12:45:30 -0700 (PDT)
X-Received: by 2002:a05:6402:913:b0:67c:e014:464c with SMTP id 4fb4d7f45d1cf-67d638a7675mr2241599a12.5.1778096730317;
        Wed, 06 May 2026 12:45:30 -0700 (PDT)
Received: from t14s-g6 (185-72-185-25.cgnat.inetia.pl. [185.72.185.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd90e1415sm1639441a12.5.2026.05.06.12.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:45:29 -0700 (PDT)
From: Igor Opaniuk <igor.opaniuk@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Alexander Kanavin <alex@linutronix.de>,
        Ricardo Salveti <ricardo@foundries.io>,
        Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [RFC PATCH] shadow: add libxcrypt-native dependency for native and nativesdk variants
Date: Wed,  6 May 2026 21:45:07 +0200
Message-ID: <20260506194507.3786568-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb9a5d cx=c_pps
 a=Tczdrg5if7+wQeIJmxD/XA==:117 a=TZtGG/qN3gMgVqwrSXR3Ag==:17
 a=NGcC8JguVDcA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=jVwDQN0dAAAA:20
 a=9GoDtVumSKF2uWb4zhUA:9 a=1oAhN8tkTtOBK6_UvoHx:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: YTIRDAvoKoIisO7Aaw3ZHyw_VkgqDdFW
X-Proofpoint-GUID: YTIRDAvoKoIisO7Aaw3ZHyw_VkgqDdFW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE5MiBTYWx0ZWRfX2ALZjSlZHulE
 3zzThwwYL8CADQZLJNc/ZKhxaQdTZNl0mOUuJoLPqlDM1E5OJHRamhD1oQtq468Gt5gqUOQnId/
 xuAn0J/jnB1slR7+gr5Wuk6jTuk1Polez5uVy3SYdGonTNbpVf7p09i+5TfEHcmPeUiUMR0CLGy
 QRIeR+ms3psYbaFBD4HVxPLWUlJS2e04xLjos+fcW4P7dsbagYTiAL1CCBPctkg+DcLbbouWN6D
 nw5Usw/TDtLYs17UWyHKCBTtdagOsLQxeYF94XrgAcPMvvvt4HaCsEMF8cDKVu6BkQj0CxKp3+a
 485KeBVtIxBe29jp5kIQMqBRiNLS8Np3jrk765XIXZZuTdOHvez89n/jf8nMfZJQO9ldLf9hojR
 SAFeiJejV9KjdCgPmC6qdwrhonOZ6j/7z7T7Hk+nndvqu31erCbdkUqB1dRRoPvy6VJ7XMtZwGM
 sdoHuWtjphPeg7LyuiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 19:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236551

Configure fails with "crypt() not found" when building shadow-native on
hosts where libcrypt is no longer part of glibc and the libxcrypt
development files are not installed (e.g. fresh Ubuntu 24.04+, where
glibc 2.39 dropped libcrypt and libxcrypt-dev is not pulled in by
default).

virtual/crypt-native is in ASSUME_PROVIDED (meta/conf/bitbake.conf),
which is why a plain DEPENDS = "virtual/crypt" does not pull
libxcrypt-native into the native sysroot - the host is expected to
provide libcrypt. That assumption no longer holds on current
distributions.

A previous attempt to fix this by adding libxcrypt-native to DEPENDS
unconditionally (commit 65532fc751 "shadow: add libxcrypt-native
dependency") was reverted in 54eccb76eb because it incorrectly pulled
a -native recipe into the target build. Use class-specific overrides
so the target build is unaffected and only shadow-native (and
nativesdk-shadow) gain the explicit dependency on libxcrypt-native /
nativesdk-libxcrypt.

Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
---
 meta/recipes-extended/shadow/shadow_4.19.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow_4.19.4.bb b/meta/recipes-extended/shadow/shadow_4.19.4.bb
index 94f155641c..cc69864a2a 100644
--- a/meta/recipes-extended/shadow/shadow_4.19.4.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.4.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c9a450b7be84eac23e6353efecb60b5b \
                     "
 
 DEPENDS = "virtual/crypt"
+DEPENDS:append:class-native = " libxcrypt-native"
+DEPENDS:append:class-nativesdk = " nativesdk-libxcrypt"
 
 GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
-- 
2.53.0


