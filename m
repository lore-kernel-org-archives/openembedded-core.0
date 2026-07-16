Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD9BC44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 19:49:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2485.1784228250196450458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 11:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=O7egsUd8;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Sjm5uPkO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: aswin.murugan@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GHZUj6385376
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 18:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y9lGMjYx7s3MmyF2NZ+uSRA33QKU70VM1Nv
	NjTZQQWU=; b=O7egsUd806k+M/A3nTotNfMF8AEXx2E0Tqk19OX1wzlk3Uy17EK
	anVK9NEOmWbQj6KNOdyalEWFWFTPptK1h1VjUnI0+cUlCpI3MMSspem0cqMQ+Jqo
	chihxad0Px6/+YHE5uE2+omYS15UdQMbtgiPd51LJfEFsQX+KYczXOCMGQumlsK0
	hBq015LWNM4adq4o6GwCAzmAUaFFBCZuwxRKY6zEgS7PDV2973XAyGfoUzRxgQK3
	ZzN7vYBx82W1O/hophy73nU2BAzu6bVy7xohE9/GHksMYcQazv4jQI8UJ0VTrFfm
	muSXSKImNtUbJc8nduDnZUL4D50yJ4Ti2EA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6g88e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 18:44:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84842381150so12205627b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 11:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784227452; x=1784832252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9lGMjYx7s3MmyF2NZ+uSRA33QKU70VM1NvNjTZQQWU=;
        b=Sjm5uPkOCyohY0qbaqBXad6/PRt4nGPY1bTG7jH6uyZZlkG0IHJB6l3Du/garWP7vk
         0oIvbG2nfVDzC6MpGHPhhJhJEmtSTvrGikXquwz1WHV0VMBlV34Ds8FkeosNpjRUwTTC
         8FOOE4Pk58uIBjDbM45QpsC3LFUuAY9TX4iesZhWy9yTyHwxzuy7TwPHtPpD+it3BDeV
         7o6/tqdcQktMuxqfBKTOdk6six0yapAE/hbSDsleD6E4qigCT+PgkQ1KWEMYM/gD7riU
         vTlZgpBN5+TUGxeKdBjsHYSpZzQzzF7CfoMfCBXikQgmIaUA+7SI8MOWhVU4tfFd2mnj
         y+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784227452; x=1784832252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9lGMjYx7s3MmyF2NZ+uSRA33QKU70VM1NvNjTZQQWU=;
        b=WsHiZKMkJDAUypX8yDVogdKyOtFVjdczcpeyHkZIgScXL83TiwzY7oaNcusG6xhBS4
         ep7IygNHHaGK82cZkpRkSO142xll0vajzb9Ni0v64qSmkwgkDuFmlalLpI7WqFgNtKRa
         DmiBd8UOeynOG+fHAtsU3mkuF8CaBGCTK5GdbChgcHZfj+uvcaT0DLTcGQ4hzqjnpE9L
         pg7WJLTyx3KUXMNnaTMts2sspF36vbBFxSU2F8jmAupcS0TgWwC8MD9LxtmrvuW5pKYu
         g8NEcbkAzinhzWaPq8hsUVbQH4nwGs9+nyg8pK6Ld1uc+FKOaFs5Gf3QkHDPyfWVpgLT
         dLww==
X-Gm-Message-State: AOJu0YyWgHAPEaCtLdWDusGzdBjSQm/nrZ11QS69fm7GtOVwEBBAYV0P
	xehewB2Vdg3fsPhYogHQPVGkeaXG1Kwe8j6cVQgZOijSQVjxfJEV0K0nTK/3cJd2tpzPhyYekva
	/wEpW80rRbHtGPl+iN8mcvR4XwQAo3uAsVPN1lO5LDF9UMqr9f3tD8YYhxdyi2YPdy7OFTwxuJh
	zxjdih+ZwxConrXdQ=
X-Gm-Gg: AfdE7clTarW17Bh5GM1jmsPMXzGiPRY5Fz2j4NMTDZHVSpdOm3HAWomKAf7C8r4BXb9
	XeAroWFhMEMml5XDScyOfikWio56lKNHrUr0yYlfsHMAKKqRIkS/msz3t237282IjDSFIheyTna
	s3AyPWG8QQHN1YaZOKgC5t3kJKo9l6urSg1vQxQH1o7O+oxWqLZCliJQmrpk+aBqHd23tcoTZoq
	BmvegeOg1YnjxHRM7wmj04zMaLEg4PhI2QXCR7KHNEL/sZ43jc/3gSThHmV+YbM/sogkU9iAVUM
	CW1ExwXHoguyQlPATeVNo4YBOvgvyAije5OVN6RakoVlMc85300SoVdPGYri5edQBKBK4SHtsh6
	RJ+QuTdLnS2XezPsoklXbQgvQitsKnC4mcbfkfW8wTZOurgS4vYbohe4kW9JcyYl1mLNd2VPmtt
	PWOOEGf5/HBgNZgLXZCWs=
X-Received: by 2002:a05:6300:2213:b0:3bf:b931:b3f4 with SMTP id adf61e73a8af0-3c3572324aemr14357614637.51.1784227451753;
        Thu, 16 Jul 2026 11:44:11 -0700 (PDT)
X-Received: by 2002:a05:6300:2213:b0:3bf:b931:b3f4 with SMTP id adf61e73a8af0-3c3572324aemr14357588637.51.1784227451163;
        Thu, 16 Jul 2026 11:44:11 -0700 (PDT)
Received: from hu-aswinm-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4866sm13767783eec.18.2026.07.16.11.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:44:10 -0700 (PDT)
From: Aswin Murugan <aswin.murugan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Aswin Murugan <aswin.murugan@oss.qualcomm.com>
Subject: [OE-core][PATCH v1] systemd: Add backport of EFI_MEMORY_ATTRIBUTE_PROTOCOL warning downgrade patch
Date: Fri, 17 Jul 2026 00:14:04 +0530
Message-Id: <20260716184404.1608484-1-aswin.murugan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE5MiBTYWx0ZWRfXxxz7Evivmdyh
 NW35AdW4w8IUNkv4EoInJ2H+TuQgxMXYX8AEGp7O6x6IqOC6a0nZUC2JXX1Wu5KITKcs96mhCSS
 moIomWxyCSHjNV7LYrSyOz1rtOIL9oZI08P4jU7s2V6vAGg0K6/tFzKwlq5uzw2B3GgCtiPQDdp
 RdmX7HJ+oC0TA1tFX+IHf4DbUAoYDFZCnZpXq7Si3Xn3HHoNFlrSJ6aN1SaeUlCEDtCCCydvEEF
 umHB+nZKBEpmknNF92VVm5T4aLrFqEywYKQyhrKZJUbuOZftDWARDb2HT8qyEn/jt0IOWBbwzlB
 OuyQ1u+GAPDTITbuy9uarOQF2Teve9qOFbny3SEq9ZPvcCNDXQFXYDn4V9goqxKBHrDmBDhUkgU
 IdfOkRSBIizgu+Z20tW2o8hXk9ZMotvcXgviR3GsPqaKm94iktI6vf+u3tRsGxxLORne5Ac9DbX
 arwsHPhglhXavotbswA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE5MiBTYWx0ZWRfXx3estdC0fcBs
 xqqtms7hEjmCrNscLBvrvU4ZkDlIETYevhw+VS39BDx+kFvKDFIFogKsXOIWRu/q7NvY6hztIn5
 exJMYVCF1cj/Zv9phSCBVkvJqJgGJB4=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59267d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=YIGEgNqi8syp7tQ5SbkA:9 a=O8hF6Hzn-FEA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: RZ432Jv_MNjqyatnPT4NZtBE9r86eLij
X-Proofpoint-ORIG-GUID: RZ432Jv_MNjqyatnPT4NZtBE9r86eLij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160192
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 19:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241106

Add a backport systemd patch[1] that downgrades the
EFI_MEMORY_ATTRIBUTE_PROTOCOL missing message from warning to debug.

U-Boot does not currently implement EFI_MEMORY_ATTRIBUTE_PROTOCOL,
causing systemd-boot to emit a warning on every boot on EFI 2.10+
platforms. Although the condition is a known U-Boot limitation and
requires no user intervention, the warning triggers log_wait()
behavior, introducing an unnecessary ~2.5-second delay during boot
and negatively impacting boot-time KPIs.

Include the patch in the systemd recipe to suppress this
non-actionable warning, eliminate the associated ~2.5-second boot
delay, and improve boot performance on U-Boot-based systems.

[1] https://github.com/systemd/systemd/pull/43017

Signed-off-by: Aswin Murugan <aswin.murugan@oss.qualcomm.com>
---
 .../systemd/systemd-boot_259.5.bb             |  4 ++
 ...FI_MEMORY_ATTRIBUTE_PROTOCOL-warning.patch | 47 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_259.5.bb    |  1 +
 3 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0005-boot-downgrade-EFI_MEMORY_ATTRIBUTE_PROTOCOL-warning.patch

diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta/recipes-core/systemd/systemd-boot_259.5.bb
index bab2e7ae27..0344313ae6 100644
--- a/meta/recipes-core/systemd/systemd-boot_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_259.5.bb
@@ -8,6 +8,10 @@ DEPENDS = "libcap util-linux gperf-native python3-jinja2-native python3-pyelftoo
 inherit meson pkgconfig gettext
 inherit deploy
 
+SRC_URI += " \
+           file://0005-boot-downgrade-EFI_MEMORY_ATTRIBUTE_PROTOCOL-warning.patch \
+           "
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 LDFLAGS =+ "${@ " ".join(d.getVar('LD').split()[1:])} "
diff --git a/meta/recipes-core/systemd/systemd/0005-boot-downgrade-EFI_MEMORY_ATTRIBUTE_PROTOCOL-warning.patch b/meta/recipes-core/systemd/systemd/0005-boot-downgrade-EFI_MEMORY_ATTRIBUTE_PROTOCOL-warning.patch
new file mode 100644
index 0000000000..7db73571cd
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0005-boot-downgrade-EFI_MEMORY_ATTRIBUTE_PROTOCOL-warning.patch
@@ -0,0 +1,47 @@
+From 829c2f0e3dffe8b4484e730a3f3058b61e2133ad Mon Sep 17 00:00:00 2001
+From: Aswin Murugan <aswin.murugan@oss.qualcomm.com>
+Date: Tue, 14 Jul 2026 11:37:14 +0530
+Subject: [PATCH] boot: downgrade EFI_MEMORY_ATTRIBUTE_PROTOCOL warning
+
+U-Boot currently does not implement EFI_MEMORY_ATTRIBUTE_PROTOCOL
+even when reporting EFI version >= 2.10. Consequently, systemd-boot
+emits a warning on every boot when running on U-Boot firmware.
+
+The absence of EFI_MEMORY_ATTRIBUTE_PROTOCOL is a current
+U-Boot limitation and not a condition users can remedy.
+Furthermore, the EFI specification does not require all
+firmware advertising EFI 2.10 or newer to implement the
+protocol. As a result, the warning provides little value on
+U-Boot systems while causing log_wait() to impose a 2.5-second
+boot delay.
+
+Downgrade the message to LOG_DEBUG, this keeps the diagnostic
+available for debugging purposes without penalizing normal
+boot time.
+
+Upstream-Status: Backport [ https://github.com/systemd/systemd/pull/43017 ]
+
+Signed-off-by: Aswin Murugan <aswin.murugan@oss.qualcomm.com>
+---
+ src/boot/linux.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/boot/linux.c b/src/boot/linux.c
+index 67ed859993..09fb63419d 100644
+--- a/src/boot/linux.c
++++ b/src/boot/linux.c
+@@ -267,10 +267,7 @@ EFI_STATUS linux_exec(
+                  * if required for NX_COMPAT */
+                 err = BS->LocateProtocol(MAKE_GUID_PTR(EFI_MEMORY_ATTRIBUTE_PROTOCOL), /* Registration= */ NULL, (void **) &memory_proto);
+                 if (err != EFI_SUCCESS)
+-                        /* Only warn if the UEFI should have support in the first place (version >= 2.10) */
+-                        log_full(err,
+-                                 ST->Hdr.Revision >= ((2U << 16) | 100U) ? LOG_WARNING : LOG_DEBUG,
+-                                 "No EFI_MEMORY_ATTRIBUTE_PROTOCOL found, skipping NX_COMPAT support.");
++                        log_debug_status(err, "No EFI_MEMORY_ATTRIBUTE_PROTOCOL found, skipping NX_COMPAT support.");
+         }
+ 
+         const PeSectionHeader *headers;
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core/systemd/systemd_259.5.bb
index 27722f97bb..1e442257e1 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -35,6 +35,7 @@ SRC_URI += " \
            file://0001-meson-use-libfido2_cflags-dependency.patch \
            file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch \
            file://0004-tpm2-util-fix-PCR-bank-guessing-without-EFI.patch \
+           file://0005-boot-downgrade-EFI_MEMORY_ATTRIBUTE_PROTOCOL-warning.patch \
            "
 
 PAM_PLUGINS = " \
-- 
2.34.1


