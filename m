Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37C0C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 20:13:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43050.1782504782065487995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 13:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SNAKA8EC;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=SafHiLwA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8jXJ1682104
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 20:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DhllSAIqcKYcMZ2AZrpJK47aZzfB1Zv7jqr
	9Kk/LAfw=; b=SNAKA8ECBRcOQcDAEtUNq5Q0HDca0NLfZ+uI7dRZ9z9+C1Aqx+R
	sZI4njAEp0c57bY8y0td3AkOBVhRkam5ODOxZC0WlNR0v7CzkDpFgJf7VOktYvlh
	wwudlmo2BaVr6snjSLerhPGv19p3wgWhurSOux5ESPjuMSC0SjqWcnSGMd58QHnY
	ymbahbpB1/Pt+NGDWiz786soQAg9KtCMcv/IIQ3/qY6O1rQTaaQgFT91zE+Td9FG
	QoGUMBlf8TdFazAcRYAWZuGhN8IbizH/sh3VWIhIjKT7cC9f9v0KTZzdjRFmzTBh
	9dRSqzXscODP9NMHWBYdWv3Iq6+ovYpqChQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdv2tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 20:13:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9158f2c4b55so188716185a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782504780; x=1783109580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DhllSAIqcKYcMZ2AZrpJK47aZzfB1Zv7jqr9Kk/LAfw=;
        b=SafHiLwA8eNl79FZLmYwwigmNjAf6DTkKmCD82B5dOUPE54uKcSUTcr20Cotil/ehD
         LeSKgITWPxpHnLYmSg59gqYZ1rYmywopaepzVDeagQD1hp6IfyqpcPPH3EzL+tb3ysOB
         JwWM42ei1UNS3rYnlSTgWWX96J6ourcmfbi9uobpnw3lNhte7q4IAAkZwvDRuzeXriW/
         Njl8N5Mj8NG2PhIFk2iksJvQuIDtlRIUL+6NAcebcGs77cp24/B6NlF3L9lxsFokkg/d
         TMg2WbcUb4+1+OatNIgZYBVdrQn5tZ1R8QsTImM0jbWQ/uNNBcguphq3DIvuWc2HQMiY
         t7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782504780; x=1783109580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhllSAIqcKYcMZ2AZrpJK47aZzfB1Zv7jqr9Kk/LAfw=;
        b=RaHnmSDNQl2N54EObu0YokC/AWvNBePpb+BFyNs7zPcLWZVqBkfJ9KnlnQKdDzZqHy
         l/tpn7rvXAHeYpH+mGLVG2tqvYm0Bx70rJx8s7Z3r1QkplxRucdA2lSHg5bT+PHF/ou+
         3X1wplIGiSjCnE6FhzMAOffZy2t6FVQ6TRcwCw3EJD+hNV92HI1MRGuarYMaT5ZM31NM
         Fkn95eMC9SNej4ZiAAHAqROcNAZ7EcQh4UgeINWJTFhYfPB4E4Ec2/teWH1rWLjcdaR6
         GOiZyJC3Sik71+8pU1HV0nhVh6y69leQ1Pt/kKvAN3DytwDFox5zV+az/X4NS8EbCO1q
         fZZg==
X-Gm-Message-State: AOJu0YzUf81R3jVBleN3pH9ZIU7nqltU9Rclh6WcslPDp1YW8m5dmjfK
	PwWN9ALDAcA79pCZ2PNdV+icDKPLQaKJcx6mXso2VQgAp8vv3G/UriKbHz5AbtfbCkI9e0gognD
	FoVM1xKV4FKVSXCvPGCi25Qz3SDs8p6/35fLaBu6xoxMdtrzlOnRTDjDZ0NskAAn/LjlXP2xr2R
	Lth7oRyJuY+p472DM=
X-Gm-Gg: AfdE7cnj76m3E+WOISb4fY080B2dKK2YwR59oLEmabPIq8BNRro1kATAA3GAQLzyCXC
	nOJ1R6guFEe7HvD0SZiLY1XGEaSayiljO1qI+oS8+RVfvUi2OvV2/4w7xzTZzVn8z3cZI6HLmo7
	ujL3BD7h4sVPftk8zrrVyQy0gZLy5SNrVJpkWMNw2v8x/ZWeRvkjU21AX2RRBMTh1gkHHTOF7Zg
	l4uceRL8L+OrLD4epQOku1g3MgACV5LU4Vl3MIWnKX0rxA0C+ZaWh4RYHkA0KUfT9vCJYSdbENw
	9qfTAjp7URT6i5Zc6IQQQ/LuE/HRH7TwSTaA6OcfjZ6BtKZQfhNp6TSaGUba5ANyBy0+tZOifCp
	1bPUIzFiI4xhVHuOp31VTDWg87428fizJljRZip05E1J9uOMMJJq/+Nnc3TXi98yiAcLtS+2qAC
	ZjgrrgK/ioYtSUQ+WbBANfXWq2
X-Received: by 2002:a05:620a:29d1:b0:917:fcec:cfe0 with SMTP id af79cd13be357-92b3d9a32e0mr357292785a.33.1782504780552;
        Fri, 26 Jun 2026 13:13:00 -0700 (PDT)
X-Received: by 2002:a05:620a:29d1:b0:917:fcec:cfe0 with SMTP id af79cd13be357-92b3d9a32e0mr357285385a.33.1782504779872;
        Fri, 26 Jun 2026 13:12:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeab19757fsm79844e87.56.2026.06.26.13.12.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:12:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] igt-gpu-tools: fix build on non-x86 platforms
Date: Fri, 26 Jun 2026 23:12:56 +0300
Message-ID: <20260626201256.112352-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3edd4d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8
 a=vsqMbstPxYt-GFuWyhQA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE2NyBTYWx0ZWRfX4iU+SecipC9a
 iHBHS2nepQCslN/jVEu27GmSeC4b8d42hVX093xSYLTzv6Dp7oD9Q7OEntIffZvEJUUddnjfIQV
 PX7aqHK7tpjUGEwdy3AxgveYmCiNy1BwNOvSsN4O+31O4CwIMzFCxFqndbyPMVI2KWTTwOjC/H3
 oCWRShilnT/7HTy5Ve7z+P+OUkvFQkNqc06y2oz/+usDPgaR3ptlSMJR9w+XSGiq7aVu/zT1dN0
 AJ4vCEEYcSiNVfCO/7qbpgcjy6UV7r8iPFmvQv7Y6EHJQtZRDqriK3+/fz0wf56qz9IHm1btmGj
 m4ysCnyXA6TRypx2mbSWg2Q8c/HxvUZysbzkgbps7Pn0/l50+9YqRQMGREV1NAJATYbJ1DJY3M3
 vfyEA6erEk1oVInDnQPtGsiG9MGGhpYR9fy8q9zvKsNSA+kS+OUKavM5KcNQyPLngHZuqOqQlLm
 tr27LWko4Fg5I0h/jeg==
X-Proofpoint-ORIG-GUID: Qmzp8PlPNFV2iyuhzhfGnjZNb8lwLXtj
X-Proofpoint-GUID: Qmzp8PlPNFV2iyuhzhfGnjZNb8lwLXtj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE2NyBTYWx0ZWRfX0M5d6HprCd0D
 /CuZ0bqZypPtOKwntf8ZNMADmkp/klnNqyYH4Qi4zFgPtM8iMEydBRqJgjtR8jJFQ/979Zc6ykf
 JOTc/GwhZDEovMbKyOe3edeSf6utt/E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260167
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 20:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239660

The "pause" assembly mnemonic is only available on IA-32 platforms,
breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
assembly with the preprocessor checks, making sure that other platforms
don't see the invalid assembly.

FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
Assembler messages:
{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...t-pause-mnemonic-only-on-x86-x86_64-.patch | 36 +++++++++++++++++++
 .../igt-gpu-tools/igt-gpu-tools_2.4.bb        |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
new file mode 100644
index 000000000000..1fdaad7b0c66
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
@@ -0,0 +1,36 @@
+From dc072dc0fc680a055d0cdf5adfdccbab6d0566d6 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Fri, 26 Jun 2026 22:34:06 +0300
+Subject: [PATCH] lib/amdgpu: insert pause mnemonic only on x86 / x86_64
+ platforms
+
+The "pause" assembly mnemonic is only available on IA-32 platforms,
+breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
+assembly with the preprocessor checks, making sure that other platforms
+don't see the invalid assembly.
+
+FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
+Assembler messages:
+{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
+
+Upstream-Status: Pending [for internal clearance]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+---
+ tests/amdgpu/amd_basic.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
+index 3ad023472136..e5475f337549 100644
+--- a/tests/amdgpu/amd_basic.c
++++ b/tests/amdgpu/amd_basic.c
+@@ -703,8 +703,10 @@ static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
+ 		/* Sleep if interval specified, otherwise tight loop */
+ 		if (check_interval_ns > 0)
+ 			nanosleep(&sleep_time, NULL);
++#if defined(x86_64) || defined(i386)
+ 		else
+ 			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
++#endif
+ 	}
+ }
+ 
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb
index 32a3a3cc48c9..f5f5b3b87316 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb
@@ -13,6 +13,7 @@ SRCREV = "e6b603e4984e4ce30fe1cc2705734d0f130e0550"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch \
+           file://0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch \
            "
 
 DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native pciutils jansson"
-- 
2.47.3


