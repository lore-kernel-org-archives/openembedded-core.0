Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95192C79F8B
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 22:44:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4330.1788648253066133524
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 15:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lTw0hseL;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=NP0C4nRt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685Knekc2835960
	for <openembedded-core@lists.openembedded.org>; Sat, 5 Sep 2026 22:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J3frGBDcrBll4pjUJu9OGhNDWwYVqV3gm+D
	I+ifG3S8=; b=lTw0hseL/e1v38gD+JByM7+jYPiTuNtYuPu6Fq5Z/8BPgzHFD4N
	1yhL/KSK3tH5T8t0tB9vUoRtKytEZiAMK2yP58T3Q82JGpq0bGYpUFwpTkpug5KJ
	IXI61DnRqHZ7IR6bJO5Y28r60dgo2KZHDlGpKcRbmxF/5P1Onw+8bttDcdg4UG0+
	/y5EPDhvD74RKmA5wt+E9cSPqZNSGdpCLgZGpjSO7TbDm/LWbypkQL8Q1Tohv7Io
	z8RK6JmE+OZNDKDg+Z+PflGNzZvjYJohoQf6h6yYx3fB6aGUhkDNlX4BrkINJsJ2
	nLzQylCfhaZuytFikooGu4Bxn2NNWuVfYEg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuejb78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 22:44:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39906175917so2600866a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 15:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788648251; x=1789253051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3frGBDcrBll4pjUJu9OGhNDWwYVqV3gm+DI+ifG3S8=;
        b=NP0C4nRt7Ap0p4sV7UJlvwVSTAT6lo0K20GaPbV5xo5AYXqYnbYaaZVRdxdyLvuC0a
         rVXOi/Wt4sJiIjJxNXZcuqCkPYvfoF6vQPG7BzrVduvYxnqMm/3P0QzjOPLSv1terImn
         PohZtyxBO7N/nfeK9Y6h60hV3PxsyvfIYjx36cy8Tb69Dj/A2Qyp79kQ6njjeR2CJ/BB
         OedqJn4F3WEJDQPLv0h2HtlcpLlSnQ9ny6uTL3/QSphBXyPk7nT+m0TFig7cK6PWtatc
         U6LlWEHOs4mjwxGtwfXOlYclWxyxQ6zFS33pvqGS2AJUP3QasmL2PsbfXJk7aLAKUn3i
         indw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788648251; x=1789253051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J3frGBDcrBll4pjUJu9OGhNDWwYVqV3gm+DI+ifG3S8=;
        b=bIcuKbH8PQC26PXtIz/vjFqZOTTX7OagvI1t1TXigJiR/NOlV67empBr+oRS2bW/rK
         70zCqsWv/jCJKMhb1ZT1MMgeAhj7Lmf9s552O2MWvrW8u9NExr7tqYt4sNcU+lKyQIPq
         H+D6EOE+0zqGQaufW3RcFfhaOeLIh1LmcUp4hhdeO7iIIsi7zmHO/nGsrs1X4R/eyMBV
         OVf94miYxmNL7fZ35gwA5YnYEBKJ/yGyGp5kj8PtPAQMXnDaKgnazl5FH0sy48dJ5bda
         WkODYFXkQ6CQxU3nhWDYva+1uk+RnQstp/o8OjSMRNCB6RGwk45JTX2lIm4kUrKHRgod
         atVQ==
X-Gm-Message-State: AFuF++lls7ElsSTAPlEmSO+bnJ0uz+nFNEBcw9xVBnIaUeJzdZ1jFZlz
	J/wk3wUeH4hv/zHcjcJcOJdgUC8PLmG+Ieuh/9Gh03vmXmR0BbwJ7JNh2VO3OqVBO4XuATbh0gm
	nP0yxqYhmTW2B1WItHM8xtjb6KfiqMyFRfExrKWhWbkwV1Ds3M7ZYtm7JWLs4Qtv3foBX8Tm5jl
	iNByzD0Ejsj4NKgR4=
X-Gm-Gg: AYBFou2EtK7g6JeINIGdkkhU5SyF8ljt9sZrsewLj2Z0M6MaZT0MhlohaP1Hu3+alV6
	vIDKRKmDeiNHX/liA0uEoCCeqFligY9DBEQbqIWGfh6EtwLULNrvB9dGy7ydUMlMr87W68wkAqp
	TuGmQpIvRM4C/CHdvlRil3BnQ26xVnxP3HKzY0lEJnYWk6ENFv3iyVV/Eb9ETUwUL9liPknAnDe
	lpcrCM7tRfjll9gem+yw74/NDseDKP6cc0BeYOvnHKbPG2630y1vXWebh/c9LGyFo0jVeP4jjwv
	YwTyRFLUpLqpobdqmcILlNde0H8YjE9kHCdWk8Kfb1eKTs9vY7rSEjLcaWjP431pvzNI3HthCgw
	FzW0dOXZ8TwaWg3/RD/8J6Lfu9UTxa4m3cr2DFBjSs5hYKOiY6YEmhOUjMSyxEet9n5WcQVV8zl
	UBt+6pZnsqgoq833rL8nB81LcQieXMH3Gwrvo2JFg=
X-Received: by 2002:a17:90b:4c06:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39b26116d9fmr18827215a91.8.1788648251430;
        Sat, 05 Sep 2026 15:44:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4c06:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39b26116d9fmr18827161a91.8.1788648250775;
        Sat, 05 Sep 2026 15:44:10 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdc1dsm12015219a91.7.2026.09.05.15.44.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 15:44:10 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] uboot-sign: keep the SPL BSS padding when reassembling the SPL binary
Date: Sat,  5 Sep 2026 22:44:03 +0000
Message-ID: <20260905224403.152831-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDI1MiBTYWx0ZWRfX5RujzvIq5WMP
 QgPGoPlNhKs4aVUx4JJlHirbp9ww+r0OFsPLzgp6c+j8KSIIeJjlLGIfokKrLalnTry+ekemtZR
 RlDBgNn9Q99kNrpejyHMNVSUHLpTqOh929hguhIJBPJk7NadKulo4qbQ0Tzm/N1OLp5341XNwAT
 uRHBv0kXvox+eVk2Eh4F/5rmsQ25QTM6oL6qK+0ecc9NkgF6/Ytg8iSMB2ukgDjpZz3o/dgj5Q/
 D7TF+rZ59TzIsoMbIHsxWMjvl9dfpYBtRxB9lpt5Wj3C+I4g4gQlFiv/WVgxGYdg0RAN2VrCDUj
 554HZPhwsRJOdR7U1pyrKw4b0QUbiVcUxx9duH46Dmr7kl0b5AVRrd24o4Z/RuJPPccjhkNMnOw
 X7K1f427sle+e+GQirSNZSYGh2hVF3l4OrdPdlkCwekCPWwREYHbeGYsSEqpLiK1LHlag1t3H46
 EvdxxMKYC8Yq95yRc9w==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9c9b3c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=JGvkFrioySKvCOEEzxwA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: SH7N4sxycvMVr2EW3tkcrXvdx2kty4XD
X-Proofpoint-ORIG-GUID: SH7N4sxycvMVr2EW3tkcrXvdx2kty4XD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDI1MiBTYWx0ZWRfX2gAVG+fvkQie
 z2mVK6J5SAvAVsXUIoKdWorh74h6w2ckSbkb+CTFV1XkrK7LhHz3s0DfiP5DQXBeM5VKlr09mgd
 ZiPHMD8IE2ZMnMsV9d6OOtXizBnrKXE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_07,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050252
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 22:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245194

concat_spl_dtb() rebuilds the SPL as a plain concatenation of the nodtb
image and the signed device tree. U-Boot only assembles it that way with
SPL_SEPARATE_BSS; otherwise BSS is part of the image and it pads between
the two, so that clearing BSS cannot overwrite the appended device tree.
Platforms loading the SPL as one contiguous image, such as Qualcomm SoCs,
need that layout: without the padding the device tree ends up inside BSS
and spl_early_init() finds none, before the console is up.

Reassemble at the offset U-Boot used, taken from its own image as
SPL_WITH_DTB_BINARY, and fall back to the current behaviour when it did
not pad.

AI-Generated: Uses Claude Code
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 236d19925e..4743b86dd4 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -57,6 +57,8 @@ SPL_DTB_SYMLINK ?= "u-boot-spl-${MACHINE}.dtb"
 SPL_NODTB_IMAGE ?= "u-boot-spl-nodtb-${MACHINE}-${PV}-${PR}.bin"
 SPL_NODTB_BINARY ?= "u-boot-spl-nodtb.bin"
 SPL_NODTB_SYMLINK ?= "u-boot-spl-nodtb-${MACHINE}.bin"
+# The SPL image as assembled by U-Boot, before signing.
+SPL_WITH_DTB_BINARY ?= "u-boot-spl-dtb.bin"
 
 # U-Boot fitImage description
 UBOOT_FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
@@ -249,7 +251,23 @@ deploy_dtb() {
 
 concat_spl_dtb() {
 	if [ -e "${SPL_DIR}/${SPL_NODTB_BINARY}" ] && [ -e "${SPL_DIR}/${SPL_DTB_BINARY}" ] ; then
-		cat ${SPL_DIR}/${SPL_NODTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED} > "${SPL_BINARY}"
+		# U-Boot pads behind BSS before appending the device tree
+		# ($(SPL_BIN)-pad.bin in scripts/Makefile.xpl); keep that offset.
+		nodtb_size=$(stat -Lc %s ${SPL_DIR}/${SPL_NODTB_BINARY})
+		dtb_offset=${nodtb_size}
+
+		if [ -e "${SPL_DIR}/${SPL_WITH_DTB_BINARY}" ]; then
+			image_size=$(stat -Lc %s ${SPL_DIR}/${SPL_WITH_DTB_BINARY})
+			dtb_size=$(stat -Lc %s ${SPL_DIR}/${SPL_DTB_BINARY})
+			offset=$(expr ${image_size} - ${dtb_size})
+			if [ ${offset} -gt ${nodtb_size} ]; then
+				dtb_offset=${offset}
+			fi
+		fi
+
+		cp ${SPL_DIR}/${SPL_NODTB_BINARY} "${SPL_BINARY}"
+		truncate -s ${dtb_offset} "${SPL_BINARY}"
+		cat ${SPL_DIR}/${SPL_DTB_SIGNED} >> "${SPL_BINARY}"
 	else
 		bbwarn "Failure while adding public key to spl binary. Verified U-Boot boot won't be available."
 	fi
-- 
2.43.0


