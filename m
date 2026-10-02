Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04F3CA5FE0
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 19:30:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2368.1790969442478974332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 12:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jDYL2r1M;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ZJFzNshZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692IXsCG1320301
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Oct 2026 19:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xo5khttiHsNcPBQU9A9hBY
	ve+MhjG71g8TXEet+hlZA=; b=jDYL2r1M8X5Akxk89OECYTNl1hd5m5sMOgwMmL
	20r8GHSTEzwExwFL0Kl5TQeE+pJBH8IYidBqk/cTWGI/utigRygg+toadPxcJcTa
	GmEPmtKzx6ZxD+n/ySna6HpIw9PoYPk8ADF/1eU8QBqEwBhXOFKpQRN3Y4Elc5jo
	xzZvlSQ45MdU0dRxFMnpt53IWMPzmfmkzE65kYdbeYMFH3vy1GVwhtrrEJNEe4o5
	TMJ2vdmveDJ9k2Nm1utpdNSKPxQNNpaS0PvbLP8kWOXdBWDsG27efp0FDPC0uT00
	jHTMVnJ/SAPtR4YzkjQTZYvaunMphs+Qa9my5TFxlyci/s6Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2j0kr5qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 19:30:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so451097985a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 12:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790969440; x=1791574240; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xo5khttiHsNcPBQU9A9hBYve+MhjG71g8TXEet+hlZA=;
        b=ZJFzNshZcQZezSv0SV4k4XDdi5dCySo+2htHCah67DYw/cveQklsHp28S+TXCE9Edm
         cBx09phcZuo+6UaKQA4hj51fX7vMHfAuqL9bEGR5v1OfjgIHe6ONQ2+c1+OIkB4F24id
         i3ExdrtWVriL+bvbm6FBluRV4GGwKtGb4Sj0B+i3gRC4QEJa6/vZr15tMnzwyGQJjrXC
         RFrMMuZwcmEOQgNbOrzg7d+IVFcpHtxI5NCx916WvIkfbuEuvA+TQdlKlWTt+2q1oJUn
         H1paZWDIcGFhkLmXWiJZrEG7uKpaqeShXxi2RqSrSc1SrJrCv+xmUdzYzi8+GzS5Cq0Z
         E3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790969440; x=1791574240;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xo5khttiHsNcPBQU9A9hBYve+MhjG71g8TXEet+hlZA=;
        b=PpppHjZKGAGbCg5oau5xN1jKJZy3YUU9PCPlKFbYti7VwYVxq5uSgDqBE+7qzuYeQC
         oE3aov6hJvL/P7YYdKIYC1OCNzXqxJN2Goq+Mk68XPnObdVNk8jwwFqANu9bU00AyZ+U
         PFTmDKzxHNQiwCNPbYVKwpUUX3ndMJrqxn4Pwgv903qXZ0ZphVueCy2K9j9daam3hDPU
         mIEUbKpOImfeLK7UvlhBGt1Jhr10+LC0vY4oJRgHqNhyKsEC6HfxFypQgV6ZCydjfZA6
         9tmxnevqEP+9NzTpFObLIuShj9HZdTdgTMzmvUL1ZsqHCq9PQU2Pv5RJkiCEZSK0UwDv
         ZjgA==
X-Gm-Message-State: AFuF++n65Bh1C+NpwfFAvtO/TjE8fj0+StT05qsjV5aowa+4um9lVMBi
	IOEbsVDsQMoydiFrOAlvGeP4juPS8ZmW2SwMcJC/cDpPZyeL8PBcFWN7ymmj2Oop028PxS7GRVb
	sb17Fidg+26NJ/GkHyXNgmjIcR8xStQcaDePcbe5NgYydapxEiTZBQLPREi942R2VVASZtLAAmb
	u2VYQw5xcgXdamVt8=
X-Gm-Gg: AYBFou3gVB3jLRA2TrrfrcZM6rQfWWYKs4pqDBgN+KcssCV5ytIp/EWPk+V/X03nQ8w
	Rr19taRuA9e8yEZUMDs2zHl4T6Lv3We9v5aFM4UNPcL+mJQ2YRVPmJdP9NYJQw7ezdz542wkMAz
	NrqtIu2pDAJZjj2IJy3gYc07fm5L1BL2iYdtAcCaWRCNPALqm4r4xz+2oAnSM8HbytiEsvs3MRd
	vnnlFxvgsXebZukT96LP9v8e4v9CNilLmDHIh/IvHUBDKv0P8a7f4uQP+ZhU+pUyWjOglzKYftH
	AYOe0klRPzlZtiW3QRmPG7l3FGOuZm1wt45/mCQVUiRJLkhZHje+MKQNLI6fEXxBYcQgaxCkO5i
	F/uF+2J0jiJAptuy/w3xREaxNSqGqoabGhcbCFEx1OMjaBiO7KHs5AkPFj4P7AcUdErSjCQjaRV
	YhRfjKRiiLZOcy
X-Received: by 2002:a05:620a:a409:10b0:93c:b23a:f976 with SMTP id af79cd13be357-93ce99ba2b1mr532177185a.13.1790969439954;
        Fri, 02 Oct 2026 12:30:39 -0700 (PDT)
X-Received: by 2002:a05:620a:a409:10b0:93c:b23a:f976 with SMTP id af79cd13be357-93ce99ba2b1mr532168985a.13.1790969439144;
        Fri, 02 Oct 2026 12:30:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bc98cf8471sm746570e87.72.2026.10.02.12.30.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:30:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 22:30:34 +0300
Subject: [PATCH v2] igt-gpu-tools: fix build on non-x86 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-igt-v2-1-77231953eead@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFkGwGoC/z2MwQ6CMBAFf4X0bJt2lYZ48j+Mh1IWqFqK20Ikh
 H+3aOLlJZPMm5VFJIeRnYuVEc4uujBkgEPBbG+GDrlrMjOQoJWUwF2XuGlrq2xlTxUCy+ZI2Lr
 3t3K9/ThO9R1t2q+70VLwPPWE5l+TGjRIBaUWSsGxBK54412iRdSGltg/wnwJMYrXZJ42eC/ys
 G37APCCBQ2zAAAA
X-Change-ID: 20261002-igt-afbc1c8c48e2
To: openembedded-core@lists.openembedded.org
Cc: 
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3754;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lC2dXNOfNK6mO1JmocrFOCMTU7aegegSfqy6d4tDY08=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwAZdAwT1aPxQlS44IGZyQuAojwepSJ/p7qWMR
 WuXZH0awo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasAGXQAKCRCLPIo+Aiko
 1X5FB/sF7Repw2M4GHqPfujJugZR0hJglUGtt/ZWpJkaRkM/qLz0RN2Mgsn/h7xhEQVhB5hAcCO
 Js+HMKHRp4z2/9lfFPd66Zjj4GhhaXbgW1MB+w7C6iAE+8vjFuFnKdHUV2Up2s3hfDwcSCsPifz
 Axl406IB3iuq/9tSlKOjN5QI1MdHl27OJF2vvtkUQQq/tSHCKWY5KNwMnrShLnFbmmxgQjGs0EI
 wpCv5EbXAObgEau6CMAx5Suhg8uXh5kX8KlmUtloc2bzrTz0zdtKWs6AS+bIzpOclHA72kDSFOR
 AsykMc/ACgd8oIhrUhnjk40Gj221dQ9DOB4flqmCZc1i7CrZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3NyBTYWx0ZWRfXwiIn/se9/GFS
 e+isk79J1lZdrWheL/j9DXufGZO8YVuEWFrCUJegE1sCxs/QfgUXzAW6qmeUp64eU8e4xtwwwgn
 R14PgljMCTj+LG489vp8YVAh680VfGVHv+Yhz7hEwAq/1Vae/HJ/5bl8VCYi17eWWrllGgiGPVK
 jd5pn2KdyDJqh00LF3eL53xyqH2+ruhkZHP0rQMZpYpH228LN4RIhof64KED5l1Yd5yTJda+Pdg
 tdDRWoiGzFJgzlOjcoRcYk3BmRwwMIHMD1dQfIpdforPrS13rCObin/BlrRAR3cwTL2rXgb/REy
 egER8iLtt7RuITHv9YuPg8aYrXSXimB8W6R65xyIbLJlTnJInqTStCHWHSRov48x+7QbC4+0q+3
 EXYR+4mhLYBe01EiXxPXPrURfLnoRMK1sZ8iAURHJdVkn4+hc5/vFV7AQ4TynH+Gcbj7jyY+Sa4
 tsKJW5VhsLcD0IsNmsg==
X-Proofpoint-GUID: NrlE51AV_LalcdkJNigVxSpPknDXnR4T
X-Authority-Analysis: v=2.4 cv=Z8B5j3RA c=1 sm=1 tr=0 ts=6ac00660 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=vsqMbstPxYt-GFuWyhQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3NyBTYWx0ZWRfXwHG4omgV2OGi
 fj1HTZSw+ORqZZCl88lgoGu2IyUkRr1PalLuJKCxWn9swXfso3dh64UCqFajVZJxc79PuAOQ9gm
 adY0m17m/UinY0hhcT67bW6JsAIZFd0=
X-Proofpoint-ORIG-GUID: NrlE51AV_LalcdkJNigVxSpPknDXnR4T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 19:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247135

The "pause" assembly mnemonic is only available on IA-32 platforms,
breaking e.g. debug IGT builds on ARM / AArch64. The issue manifests
only with -O1 or -O0, the default -O2 seems to optimize the condition
away.

Guard this inline assembly with the preprocessor checks, making sure
that other platforms don't see the invalid assembly.

FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
Assembler messages:
{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...insert-pause-mnemonic-only-on-x86-x86_64-.patch | 39 ++++++++++++++++++++++
 .../igt-gpu-tools/igt-gpu-tools_2.5.bb             |  1 +
 2 files changed, 40 insertions(+)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-tests-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-tests-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
new file mode 100644
index 000000000000..e9ce806ab171
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-tests-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
@@ -0,0 +1,39 @@
+From dc072dc0fc680a055d0cdf5adfdccbab6d0566d6 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Fri, 26 Jun 2026 22:34:06 +0300
+Subject: [PATCH] lib/amdgpu: insert pause mnemonic only on x86 / x86_64
+ platforms
+
+The "pause" assembly mnemonic is only available on IA-32 platforms,
+breaking e.g. debug IGT builds on ARM / AArch64. The issue manifests
+only with -O1 or -O0, the default -O2 seems to optimize the condition
+away.
+
+Guard this inline assembly with the preprocessor checks, making sure
+that other platforms don't see the invalid assembly.
+
+FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
+Assembler messages:
+{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
+
+Upstream-Status: Submitted [https://lore.kernel.org/igt-dev/20261002191401.469214-1-dmitry.baryshkov@oss.qualcomm.com/]
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
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.5.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.5.bb
index f03bf4663048..1f4353292ff9 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.5.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.5.bb
@@ -13,6 +13,7 @@ SRCREV = "a8e2cbd2854d7980a9eccecc6e0c801d0824b88f"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch \
+           file://0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch \
            "
 
 DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native pciutils jansson"

---
base-commit: 8bdc2869a1a9307ee4ad9cc1d662c2fc1ddd9d2c
change-id: 20261002-igt-afbc1c8c48e2

Best regards,
--  
With best wishes
Dmitry


