Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2AACCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 18:51:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.1057.1760727087051902567
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 11:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=VdZo1HCK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: ricardo@foundries.io)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HIi270017797
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 18:51:26 GMT
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49uqun8tny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 18:51:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33be01bcda8so1098529a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 11:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1760727085; x=1761331885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jCINSDeveOpz5Jcn8JOD3iJZ3KRhwL4y0jwVDqYodUo=;
        b=VdZo1HCKxwDSkcnjICQmpLcQF7tW5gwJXM81AZqWSTN9pHYDsDifT5tHcp13Gug0Js
         I2rzdbWUwjx7cnsjguPgcRtZOY/Sezw8jwQnvR0TB1eToSOLskN3s6+sczDuhShJ0aFJ
         LBzm7jUC6Z/sHZAgPQtjAXlX13uXoMPwA9YND8O2d/do90/Rf0oBhVgcTIOMYrMnC52U
         tpLnSzRoF9EgZClBTHPdjho8fAX8VClWDOg76V7QdV8MkmRpjNOrk002c2VbiVQZaI+8
         I7ujzZXRfkO3X/IiQLV19quNvTAJFrGeZ0RvqeOIPhRbo89LFqYEUASgazubMdhBQeIp
         QNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760727085; x=1761331885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCINSDeveOpz5Jcn8JOD3iJZ3KRhwL4y0jwVDqYodUo=;
        b=jp8RupDv+ehIp8TZ5/P+LsaOTuS069xB2KEVB16GKPjv0H7u9rwssZk3tFv0m6Ii20
         8Vg2hmeY7yYQpZ+xwTk8Q+c4i6XwwEtQkjeRGwBblKdRklhvRIBKxoBXihxfTe3iwMY8
         y+SP5Q8Mg29CiY5stzzc9geno9ALeIHQ5RFiG3SBDA2r9vyjB7Ge2biu4wtc56BhqYJX
         sKIzXMA4pnvT6yNSru9nEkrbeGoqWVV82KmxeXqaUHtbS9RR3Ni3rYVAnMEZwr4OqQYj
         VePXn22+zRDqSU5aUo9/8T9Kfa7TiPliFK12V/2caDHpYjinAsyV26bFzpbp2ppBJPRF
         uNlA==
X-Gm-Message-State: AOJu0Yz5h5/PDIIba1kqt+SSgGwxVS8vNm/M39TG/sFjT+5rALnqZ9uL
	h44SnYkewlmPXD2HZRv+Xu6i633Mf7CPi8fyfUL4obmBO2IAFzCRH9okIds+syZoX4qPD7aY4q8
	ARYxcN1xzmHdb3KVhvks7/MaGGJTP4CMgZeHAJsF3+PNIlydMa88A3l1GhqUbmjVgR4eXbqxJ+Z
	H+oy8YunwOv1Gd
X-Gm-Gg: ASbGncvVp7zIH4V63iUq8zSXDjpDT5RUdncBDX+eCqY1Y55RZtNelMKzGGLmC3ZVr+o
	0sgfB8FvIkD3vpVUamS3O5HZdnTUiSTSBARaCacyNNNtdO76LwUGhfrfS8cQYwRlba5+pRkUtDA
	EsrEu/NfgL00j17is7FNcPvGqmA7thqL+PvhpFcDyVljAaumoT5hIoYpF2J7anoI66OzUjI97C6
	lsLED5C/2OaweF11TCvyrP21ERYnIBEDVYNEiIZATUPka+JBb3KZrVpHFHwiTXWfZ2rp/mga7c5
	XvxDjhxk/rn0MZ+HlNNrnyhjXjiRCzMlWdnIpCsEOeowyp8DFfHtb3Vqr3MEBz9f7EXo
X-Received: by 2002:a17:90b:51c4:b0:32e:3f93:69e2 with SMTP id 98e67ed59e1d1-33bcf87ad33mr6113637a91.13.1760727085224;
        Fri, 17 Oct 2025 11:51:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2cfUkyayAcIYe8ffMGKk6/7hTy15Z2XVWWpE3nHXVMc0kVnDaBCeMmMYG2Bmcp/Pa9NqY6Q==
X-Received: by 2002:a17:90b:51c4:b0:32e:3f93:69e2 with SMTP id 98e67ed59e1d1-33bcf87ad33mr6113594a91.13.1760727084473;
        Fri, 17 Oct 2025 11:51:24 -0700 (PDT)
Received: from evatuf.. ([187.65.199.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5de0b42asm105228a91.9.2025.10.17.11.51.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:51:23 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] initramfs-framework: drop redundant /var/lock directory creation
Date: Fri, 17 Oct 2025 15:51:12 -0300
Message-Id: <20251017185112.3146577-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aM/9aL9m c=1 sm=1 tr=0 ts=68f2902e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JEjW2rnyS3Y/5sYvBvSpBA==:17
 a=x6icFKpwvdMA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zjXOHsodjjj7vvjvTQYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE3MDEwOSBTYWx0ZWRfX/SPGCvQQPDle
 W4jaUHA4hmv8YU9L/IBsWx0glcZbgSJBl/yHDHrVC0e+kPacuXy730k9uuN6RAgZIvaJQ1doxj/
 AeHwTl6YBixrGRyhhPj5YE20cG1hcCU7Vx7puzc9SR4J+60nTP2kwwhM6TL8C+U6vBrSf3MAFZo
 /ND4wmzG/mQ2TQEOoTidzbxpGGu6ZuoazxXD5OBL68YvYL68vGMtp/0zvB4n7WHzAU7PPpkguxZ
 CvYj7C6jfpa1DHJ0U3zovVO9w5rAg0kgznlDsJ1DgPaNoT9kaTrwoxpChmbXYeKPZhtY1V4Wdtf
 iGpGgaKmIHYxDkjdcEnfH+UtfBEwwIqBk0PH5uqecot/CA7GcGFPMGEg0x/RMs3dNbMZ5cCn5z+
 O4CwCaYVko2xZ10iWaKRwnBO0HKIcA==
X-Proofpoint-ORIG-GUID: 7tM_kS9KRsRwczxQoLQDbdpr3TFYuhvA
X-Proofpoint-GUID: 7tM_kS9KRsRwczxQoLQDbdpr3TFYuhvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510170109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 18:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225033

base-files already provides /var/lock as a symbolic link to /run/lock, and
since /run is created and mounted as tmpfs during init, there is no need
to explicitly create /var/lock within initramfs.

This avoids the following spurious error during boot:

    mkdir: can't create directory '/var/lock': No such file or directory

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 5dd252219a..fe6e3cbf07 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -80,8 +80,8 @@ EFI_DIR=/sys/firmware/efi  # place to store device firmware information
 # make mount stop complaining about missing /etc/fstab
 touch /etc/fstab
 
-# initialize /proc, /sys, /run/lock and /var/lock
-mkdir -p /proc /sys /run /var/lock
+# initialize /proc, /sys and /run/lock
+mkdir -p /proc /sys /run
 mount -t proc proc /proc
 mount -t sysfs sysfs /sys
 mount -t tmpfs tmpfs /run
-- 
2.34.1


