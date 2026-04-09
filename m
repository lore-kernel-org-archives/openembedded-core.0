Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB1CE98FC7
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:17:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126441.1775715410201857726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VLCeVqCy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394sTpt1739904
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Apr 2026 06:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=yfGoRKKYImdJ7KQqK+cfZtcLb38HX4ckGfLLmXR+Z5U=; b=VLCeVqCy5aPD
	wxD+MfeXo4A9drST5c3gpSA7EPqCHd3dvDR7qdYNAUFtpGhFgsFgTBbOAactv9Iv
	AYy8f4LELymUwFacIv6Q+gwaaif+EibPAgBvRzVCHKKb5kvIo2jFAH7hFpaPxxQu
	1ENFXk4aKZ6IOMjgWCpCWBifr0G1N78w+IpPTPLKuQd1LR4Mg/1uHxed+iYe2in4
	WVSeRnEPV/tKADlVpdL+PKqW7kT8vFiC7AJJo4HEsAB+z+oD3u7Yl9pFyhkcsb8o
	P+Hrk2DQiLV8WgC+Fv8EspyvgjlKL5cfkeu580pz7cNAR9ubKY9uuw1/Fc8Pid3w
	y22Mbw4s2w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrybr2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:49 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:16:47 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:16:47 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 07/12] gnupg: fix CVE-2026-24882
Date: Thu, 9 Apr 2026 14:16:34 +0800
Message-ID: <20260409061639.1688205-8-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d74451 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=xNf9USuDAAAA:8 a=GwUem0DFAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=9-0Oi0abAAAA:8 a=DQ1Kp4HctteD4J4uMbkA:9
 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22 a=dBj5yYZmX_pdmi9WmahZ:22
X-Proofpoint-GUID: 2X2VWKfDSNW8N6efw5kGnVHgpgakaOYn
X-Proofpoint-ORIG-GUID: 2X2VWKfDSNW8N6efw5kGnVHgpgakaOYn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfX8mnVDVndVmpf
 7gzWgAeb/LqYMRLRuG0apRDme2Z/KgVJKNn+bJtX2qS0w9pyP9ye0aHeRAr2lLJbbOknlrBf2hO
 60dzyPilfcGsFMHJacO8IUO4ii0LEplxVNLjt4o3V22W4s7jSpjMHoa/NHJk3LSv6gkpywYOA0z
 X1YNxy9E2osBHCF/ZHpEcX4lOcmFP/aRskQo5D0e3WgZSJJzzco+7+ht0pg7YuEfwbb6HEd1CiF
 dKGi8UcD8tJujvK5YaVvoJVRWLK4nzoGlAN7CWlWgPxDMLyzXMCpmp3aWXnPXgHALhQn0QMqxK3
 gwLVvGZtxTjDcDkwz0oWUiWhWVDme87BiValYbvbhnkUJAAi4lXz7mEQkTY4WZQvUieSMGUck1P
 UbtOmzLkDc0rrFfHDuOyemDPRy96+PIo7S0P7C1iEb3hw4h0WVmha4tPxRWwu9auH1Ol7GXKZLT
 x55KkXBPR5hb1KWg0ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234883

From: Guocai He <guocai.he.cn@windriver.com>

Backport patch to fix CVE-2026-24882 per reference [1] [2].

[1] https://security-tracker.debian.org/tracker/CVE-2026-24882
[2] https://dev.gnupg.org/T8045

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../gnupg/gnupg/CVE-2026-24882-0001.patch     | 70 +++++++++++++++++++
 .../gnupg/gnupg/CVE-2026-24882-0002.patch     | 47 +++++++++++++
 meta/recipes-support/gnupg/gnupg_2.4.8.bb     |  2 +
 3 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0001.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0002.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0001.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0001.patch
new file mode 100644
index 0000000000..6e6d44c372
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0001.patch
@@ -0,0 +1,70 @@
+From d07e2f19134129d59014fe181642cd122dc2e29f Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Mon, 26 Jan 2026 11:13:44 +0100
+Subject: [PATCH 1/2] tpm: Fix possible buffer overflow in PKDECRYPT
+
+* tpm2d/tpm2.c (tpm2_ecc_decrypt): Bail out on too long CIPHERTEXT.
+(tpm2_rsa_decrypt): Ditto.
+--
+
+Cherry pick master commit of:
+	93fa34d9a346020355cd51d54102d30d4f177323
+
+GnuPG-bug-id: 8045
+Co-authored-by: NIIBE Yutaka <gniibe@fsij.org>
+Reported-by: OpenAI Security Research
+
+CVE: CVE-2026-24882
+Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/01c130031]
+
+Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
+---
+ tpm2d/tpm2.c | 22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/tpm2d/tpm2.c b/tpm2d/tpm2.c
+index 3e908dd..cd0347c 100644
+--- a/tpm2d/tpm2.c
++++ b/tpm2d/tpm2.c
+@@ -917,10 +917,20 @@ tpm2_ecc_decrypt (ctrl_t ctrl, TSS_CONTEXT *tssc, TPM_HANDLE key,
+   size_t len;
+   int ret;
+ 
++#if defined(TPM2_MAX_ECC_KEY_BYTES) /* Intel stack */
++  if (ciphertext_len > 2*TPM2_MAX_ECC_KEY_BYTES + 1)
++    return GPG_ERR_TOO_LARGE;
++#elif defined(MAX_ECC_KEY_BYTES)    /* IBM stack */
++  if (ciphertext_len > 2*MAX_ECC_KEY_BYTES + 1)
++    return GPG_ERR_TOO_LARGE;
++#else
++# error TMP2 header are not correctly installed
++#endif
++
+   /* This isn't really a decryption per se.  The ciphertext actually
+    * contains an EC Point which we must multiply by the private key number.
+    *
+-   * The reason is to generate a diffe helman agreement on a shared
++   * The reason is to generate a diffie-hellman agreement on a shared
+    * point.  This shared point is then used to generate the per
+    * session encryption key.
+    */
+@@ -976,6 +986,16 @@ tpm2_rsa_decrypt (ctrl_t ctrl, TSS_CONTEXT *tssc, TPM_HANDLE key,
+   TPM_HANDLE ah;
+   char *auth;
+ 
++#if defined(TPM2_MAX_RSA_KEY_BYTES)  /* Intel stack */
++  if (ciphertext_len > TPM2_MAX_RSA_KEY_BYTES)
++    return GPG_ERR_TOO_LARGE;
++#elif defined(MAX_RSA_KEY_BYTES)     /* IBM stack */
++  if (ciphertext_len > MAX_RSA_KEY_BYTES)
++    return GPG_ERR_TOO_LARGE;
++#else
++# error TMP2 header are not correctly installed
++#endif
++
+   inScheme.scheme = TPM_ALG_RSAES;
+   /*
+    * apparent gcrypt error: occasionally rsa ciphertext will
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0002.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0002.patch
new file mode 100644
index 0000000000..2e872ea491
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0002.patch
@@ -0,0 +1,47 @@
+From e8eaa9bf018d3276d613f371207c91c1ffa3e16c Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Thu, 12 Feb 2026 11:51:17 +0900
+Subject: [PATCH 2/2] agent: Fix the regression in pkdecrypt with TPM RSA.
+
+* agent/divert-tpm2.c (divert_tpm2_pkdecrypt): Care about additional
+0x00.
+
+--
+
+Cherry pick master commit of:
+	6eed3959303c81c9699fe9273030e480732f72be
+
+GnuPG-bug-id: 8045
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+CVE: CVE-2026-24882
+Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/555a9f5b3]
+
+Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
+---
+ agent/divert-tpm2.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/agent/divert-tpm2.c b/agent/divert-tpm2.c
+index 2496d09..5b5bd14 100644
+--- a/agent/divert-tpm2.c
++++ b/agent/divert-tpm2.c
+@@ -135,6 +135,15 @@ divert_tpm2_pkdecrypt (ctrl_t ctrl,
+       if (!smatch (&s, n, "a"))
+         return gpg_error (GPG_ERR_UNKNOWN_SEXP);
+       n = snext (&s);
++      /* NOTE: gpg-agent protocol uses signed integer for RSA (%m in
++       * MPI), where 0x00 is added when the MSB is 1.  TPM2 uses
++       * unsigned integer.  We need to remove this 0x00, or else
++       * it may result GPG_ERR_TOO_LARGE in tpm2daemon.  */
++      if (!*s && (n&1))
++        {
++          s++;
++          n--;
++        }
+     }
+   else if (smatch (&s, n, "ecdh"))
+     {
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.8.bb b/meta/recipes-support/gnupg/gnupg_2.4.8.bb
index 2d27f4454e..6a865ed57d 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.8.bb
@@ -19,6 +19,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
            file://CVE-2025-68973.patch \
+           file://CVE-2026-24882-0001.patch \
+           file://CVE-2026-24882-0002.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
-- 
2.34.1


