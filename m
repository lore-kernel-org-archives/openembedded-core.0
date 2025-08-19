Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62520CA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 00:56:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.3054.1755564987897145888
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 17:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=IS7MvONL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: ricardo@foundries.io)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ILfbR3025278
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 00:56:27 GMT
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48mca5gaqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 00:56:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4716f9dad2so8633263a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 17:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1755564986; x=1756169786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x0bR49VYg3w1WaaoCrJt9DjLanSLRo3t34to/yfNS4w=;
        b=IS7MvONLjOnphmYwYpO1idq/1R+YApevYNOfXddEh6HeXhhJvQ5EcebAKuE/VOxbqb
         BPQ3KuxVhEe1zyFiJy7IceE23f+N7OFAv48SUpv83NZYxVEsCik3jxxRpf9Qh4BV9VBf
         wOjGQrI97p8kzeDQBpdFtjQAkQXydvWTtNcP3hnsEGI4XxgroXtzRLlzst3YXPApBNVw
         BXazzl8idaOrP4i/1S+YvrHpSDU4axXyRnNuXY5M4AH1Mxnz2mJ5Mbd1lABkKqauPtei
         +F7+cjPTejtAMWhkYZV0AlCyqR02RMFEUArB5zvd2tP6eWuTfUAVZKJWSYyOjARM1GbG
         pn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755564986; x=1756169786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0bR49VYg3w1WaaoCrJt9DjLanSLRo3t34to/yfNS4w=;
        b=tF7vgO/EzNyB2mwTptHRMaqa700pYvQHXyGw3UuoaZugb6/f+kcF1GaBUGTD9PVvht
         ej1xh2FbQzyY/8Vj8baZBfxThH3zfLxs2EaQ9nPoPYS9sOtm3O7h7wwdHwYYwvZag0mL
         u4MmW+i2ADu8brHIl6f7lf4ISo0d2La3u7U+I8aJkaNyckuvuYv5WyQjLBdZt51FVYx4
         +ZTjp+YKgQsY3NQoqMCCFXn9LWzNhuLOMW0wTMOLO5QOhSWuFQdkLtnFINbAuBG4hRKQ
         ndS7r5qkH0SrGEuhK6KEjoHa4KeHrqHM4ydpmHZ45xFJ2uryD0qzHBcmAn752ll58gGy
         APaA==
X-Gm-Message-State: AOJu0YygYhD2NrREqZaoiBF2njNNdD+7y8hN2l/XG+bIFQabhRrfe95a
	356v5rXaCNBb9RAhn0EdqJ/dO6W8lHiKDQbeOMZHaim0plbYYJwYD85k8zM/DWrjKFnZGGgKIiJ
	R7xUTCzo+xEKP9wI8E6OoN2exreNASdCkBxj+vEzo5wUlHnTIcISjw9GQ+nS4UFxKRQ3cCM4whB
	YMDz+05C8+0bIJ
X-Gm-Gg: ASbGncvl2qs5h/NVZHAG9S3PFGJ5fWI6+jAWB4l/TpYEvOmE4nRluiMYXt4teBankhH
	DpTnRVRiteuV0HdU+e9b3wx/ni/kn4/gj7GzRM3nJIFV8r1IfarqF7t1CCn0FqlZFN7kDblcMty
	dTOqGKWjcfL6AD7mhn+obwOceGd9OwRaKK8DtJibnDKVA3YfO3H2IuZW/nN23goVhShzlE/6PPb
	KpxBsC/gPUiMibbfRSRca4Z+JPDOsbvD3Bi8EYWe/Ki95xc5w19bAdTqCmwYnVCC0pUnQ4GntqU
	H4E0dQDKmkNyPE7FQt0GYq31iVucRJmu1g==
X-Received: by 2002:a05:6a21:9992:b0:21f:bdd5:d71b with SMTP id adf61e73a8af0-2430d337f71mr804536637.2.1755564985985;
        Mon, 18 Aug 2025 17:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdaT9Tl48jRmsrJxgEY6ZaQ9b58Y9Wo2MM9JNTQgBEsJttuv7Rq86k2ikkMCzwaD9O7KqmUg==
X-Received: by 2002:a05:6a21:9992:b0:21f:bdd5:d71b with SMTP id adf61e73a8af0-2430d337f71mr804514637.2.1755564985465;
        Mon, 18 Aug 2025 17:56:25 -0700 (PDT)
Received: from evatuf.. ([187.65.199.47])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d73aa36sm9163240a12.35.2025.08.18.17.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 17:56:24 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: jose.quaresma@foundries.io
Subject: [PATCH] initramfs-framework: mount /run and move to rootfs before switch_root
Date: Mon, 18 Aug 2025 21:56:05 -0300
Message-Id: <20250819005605.2463139-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FdU3xI+6 c=1 sm=1 tr=0 ts=68a3cbbb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JEjW2rnyS3Y/5sYvBvSpBA==:17
 a=2OwXVqhp2XgA:10 a=9UA2AVYIz8kA:10 a=myRPezaHG2k0NIEQnSQA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 1bpOa-NnN1VDyV4fPoJoP0N48bMUWzQQ
X-Proofpoint-GUID: 1bpOa-NnN1VDyV4fPoJoP0N48bMUWzQQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDIwMiBTYWx0ZWRfX59A9Ie+G2BkH
 dDUl/WFgqeYUwatEHPj6RvrgOY3InA/VrrIvJnVFM1UKtt7EguO0UfjZfFlrIVFM2IDkXhU3JhR
 V/d3yVohEwTlOPOENGkvV9tZSI6qaPM1cxmXyX0iKJDlOI2D7EpgwW+gztp9bvAStBgh7b7pbW1
 azk+k8IGibwTzNFjbc6EDfR0bCykhiIxjkceswhXKFqBPqkKgdUYeHjWYPTlLabJGOrGZa+Wafs
 8PTrsQghd+mKkreE/CC66LQN6IM1R+J54lXs//yvJ1BzsmrlJ0IKX7ehC0nrt6vvXC+PnnZ78+2
 AI6ckfadxebYtgF+n8Od9FxrebgG30bormru5R1AKKIUpGnQx+x0qH+UKBfHvo8WLJmHKyqtkXR
 2KcEZUqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 00:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222056

Mount /run as tmpfs during early init and include it in the set of
mounts moved to $ROOTFS_DIR prior to exec switch_root.

Having /run available early lets initramfs modules stamp state that can
later influence systemd service jobs, since systemd will reuse the mount
point instead of creating a new one during boot.

This is particularly useful with ostree, as it uses /run/ostree-booted
as way to describe that the rootfs comes from an ostree deployment.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta/recipes-core/initrdscripts/initramfs-framework/finish | 3 ++-
 meta/recipes-core/initrdscripts/initramfs-framework/init   | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index 716c2f44af..21eaa57393 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -35,10 +35,11 @@ finish_run() {
 			mount -n --move "$dir" "${ROOTFS_DIR}/media/${dir##*/}"
 		done
 
-		debug "Moving /dev, /proc and /sys onto rootfs..."
+		debug "Moving /dev, /proc, /sys and /run onto rootfs..."
 		mount --move /dev $ROOTFS_DIR/dev
 		mount --move /proc $ROOTFS_DIR/proc
 		mount --move /sys $ROOTFS_DIR/sys
+		mount --move /run $ROOTFS_DIR/run
 
 		cd $ROOTFS_DIR
 		exec switch_root $ROOTFS_DIR ${bootparam_init:-/sbin/init}
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index a48b77e95e..5dd252219a 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -81,9 +81,11 @@ EFI_DIR=/sys/firmware/efi  # place to store device firmware information
 touch /etc/fstab
 
 # initialize /proc, /sys, /run/lock and /var/lock
-mkdir -p /proc /sys /run/lock /var/lock
+mkdir -p /proc /sys /run /var/lock
 mount -t proc proc /proc
 mount -t sysfs sysfs /sys
+mount -t tmpfs tmpfs /run
+mkdir -p /run/lock
 
 if [ -d $EFI_DIR ];then
 	mount -t efivarfs none /sys/firmware/efi/efivars
-- 
2.34.1


