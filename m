Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CB6CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 15:53:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2093.1762530824995838537
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 07:53:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VOOQ2uN1;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=FmV2rqy0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7DSO5X3292134
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Nov 2025 15:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3HmSBC7Rsi1ok/9fynccQH2nzAikAzK7RMK
	x73LtWwg=; b=VOOQ2uN1mHHPzELfStzGoWV/eBHCOEcHTdtrZyeBPW0lUQEqrRt
	KeV7W/Bp+GgYUjf01WE14hQcqyjj5Dn+Qs6T6zb03wwm8W9C7E6gfqGuez2zC9ix
	bkhQg+yq/r1BkKwuo5FUff6ZqY6Rpi0Jn9YbDTWBGARJkZ7T8s/NC2aNlUeyYV+D
	OkFnVaBRtEceN8+VXgH1FizsAgITx4UjuuwEHSAzkEULOBwmZKHVyaBUe87LmLhu
	DruECLhh02PAYBeUSvVP1Bkz3N6b3EEjljjcR0dbhyBabcNgttqxIE87tdwycsMe
	DJjTMsHiFpbOD6vduA9j740+oqXCaXS6dnQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9hpbgc9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 15:53:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a432101881so1532004b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 07:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762530823; x=1763135623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3HmSBC7Rsi1ok/9fynccQH2nzAikAzK7RMKx73LtWwg=;
        b=FmV2rqy0mg36kz2mUT2EugmRymVcKGCKdSCTfOzzVb1UHmld7GLXmY28lHJ0bCaqyI
         0rhxJqsNtoGwtJYkMlbuc2+s3qJcs945nhckHMwTaxZFDTEarSAWz5NPVIxYgjM2jvFv
         6G2OPPiWpyqpgQMnFvc9tt4qkA1jlmF8z/c2k7HWvMqDPwGrrauyoKZNZt3Z9Bj8Ti2l
         0uNxE353/ZdYTozXyLrFlz+LMn6g8cZMLclwt3yKgpn4cshHzgLGyrO0gze6tKoOk6ld
         swfU2R5dJjJyINXXK7tlTrfG7zNIQtzsCb05XTjdM2tH9mFVdbDiDXkYkQqER/MvKMZ+
         lEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762530823; x=1763135623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HmSBC7Rsi1ok/9fynccQH2nzAikAzK7RMKx73LtWwg=;
        b=r0J01kTRb5slnkgbOeDwUba8U1+4PzmfUgH4vwYcGqQTe6jFnJk8XsPOu+5JXCP3N2
         0iJggvdDog+P/KBSm/JMqm6GTxF3mHQWKiTJWTiHUzJdXjTxEPeOuCjma7qSKZ/+iCFr
         f8+YRSS4mjrKZnIYlf+zO+Ekgm7AamGvMe0YZ1JDsB0Rb9t7EXloo+K4dJ6cHzor9YLk
         TI3Ut1NrPwvbx6g75wwYoYoY+uYliKrP3Os1KDa+XfD/7ZlY8PRDKTNpmUVs9z9n5jOK
         wwVFc0Zr4XsGBV5QRDA3xfV3YKknn2cjxppNCzDr8u1sl9KjW7llu9k+XqjegDYtSQ7b
         nOSA==
X-Gm-Message-State: AOJu0YwzDiN57yirjSoW5v36peCaElujottT34Ss6hc55Uf9IbWThZXj
	v1l21Ax3pMa9x3A9CBn98nidsI3Y4qZGbDSfia7CZF+7kczTmBoZbUyIAqXPywcM4u7cbNu/SUw
	wA+zShDA9jJtfX0iOfgFvsV8ZJiLNS4Pcl84UARBNzc+Z1Lqch73l39lxjyJwFhFa815syJMvU0
	0TYLyl6UTk28nB5jYARDV4
X-Gm-Gg: ASbGncsTYrccVGxl8D6MFi3IypTdDq82Z2GWOXKhpTEH9e8sgEslSjPXK2d6jQZ8rLq
	f0uot9NHOpNaLYTvPzlfjSB4cD+eYaehLeqvUsEZh6kmJNxP2/hO6JHbCybcQg0EoZ/6GBpYxMb
	0pxtuCgVrCZwPzp0Ri9+QaAVIVjHB/EshElQby+uHXbNd+k9hqWgtIqqD4IbjcNR2Gg/TWr27Jv
	mWRxENVUCIIRJEgFeZl5Hxv5myIspAm7BtKTjiw2lAfFaF4Uch201Xy8HMbWdH8KWFIAB9T78lX
	xfZ2LJS580V9YmxBprh9ZAjqg3Tp9MVr7y/yQk0Fsl4MHTklTiT07i7czmWiUyadgYitzhYKNY/
	J8y+8a+m8zb+SUxM=
X-Received: by 2002:a05:6a00:94d5:b0:7aa:3642:2173 with SMTP id d2e1a72fcca58-7b0be063e4dmr5172045b3a.31.1762530822612;
        Fri, 07 Nov 2025 07:53:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQLbF3wMGDxiGtLC5APVJhOpberMYNLKPHJsj3QRWtPdsXsepTOvcKA3fs+gU7wpfN+8h+ng==
X-Received: by 2002:a05:6a00:94d5:b0:7aa:3642:2173 with SMTP id d2e1a72fcca58-7b0be063e4dmr5172003b3a.31.1762530822002;
        Fri, 07 Nov 2025 07:53:42 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c0763csm3334514b3a.19.2025.11.07.07.53.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 07:53:41 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] logrotate: remove reference to state file in CONFFILES
Date: Fri,  7 Nov 2025 21:23:30 +0530
Message-ID: <20251107155330.1651252-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEzMSBTYWx0ZWRfX/gAfXnjhVQwh
 eCWzbsg5rZfF7rQ/PGXdSbaAkzlJc7v7/9aJrxmoI270bc4tkYFvnXov91ZU1afGu12YzFeax5h
 2WPVtLR2QctfytaFryxYQWSX9K0xUCB0mDK+4CJYooftYXPlDEN7TUJZBvhSkLxPYbDYNHEEZAe
 +bNNrTt6RHy4tkgSqO6ekil9kLa3URabkPmNAanEfcnFilCwVafci1cT+zzlMtuxwDHxDo8FdcQ
 fSHNsWQrXG87l9vagAC6swXkp9c2Vyik/w2AZbb9a+6afWF14Rvk4kus+13ZDK6T3CZaLXlZmIx
 /Ft5nCTtv8WssTs5UREs0C6GrFYrgk+lgf3LF+dpSmCbKtxNvoBQJDosiQ+CdBE7MTogdYObRw1
 vjKe8E2LujmDSdznDuuaTLIcJEK6dQ==
X-Proofpoint-GUID: Fgr1ZYK4s6hZEtlyOE4zDB3Or2DG2nAt
X-Proofpoint-ORIG-GUID: Fgr1ZYK4s6hZEtlyOE4zDB3Or2DG2nAt
X-Authority-Analysis: v=2.4 cv=GZcaXAXL c=1 sm=1 tr=0 ts=690e1607 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V25us5O7Y4y1kbDIujMA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1011 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 15:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226061

Since commit a1f7225884 (logrotate: Do not create logrotate.status file) in
poky, logrotate.status is not installed or packaged. Remove reference to it from
CONFFILES and don't try to create /var/lib which is already taken care of by
base-files.

Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta/recipes-extended/logrotate/logrotate_3.22.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.22.0.bb b/meta/recipes-extended/logrotate/logrotate_3.22.0.bb
index 7995438408..601333ac8b 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.22.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.22.0.bb
@@ -26,7 +26,7 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 PACKAGECONFIG[acl] = ",,acl"
 PACKAGECONFIG[selinux] = ",,libselinux"
 
-CONFFILES:${PN} += "${localstatedir}/lib/logrotate.status \
+CONFFILES:${PN} += "\
                     ${sysconfdir}/logrotate.conf \
                     ${sysconfdir}/logrotate.d/btmp \
                     ${sysconfdir}/logrotate.d/wtmp"
@@ -64,7 +64,6 @@ LOGROTATE_SYSTEMD_TIMER_PERSISTENT ?= "true"
 do_install(){
     oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
     mkdir -p ${D}${sysconfdir}/logrotate.d
-    mkdir -p ${D}${localstatedir}/lib
     install -p -m 644 ${S}/examples/logrotate.conf ${D}${sysconfdir}/logrotate.conf
     install -p -m 644 ${S}/examples/btmp ${D}${sysconfdir}/logrotate.d/btmp
     install -p -m 644 ${S}/examples/wtmp ${D}${sysconfdir}/logrotate.d/wtmp
-- 
2.51.2


