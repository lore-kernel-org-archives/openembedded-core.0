Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0480FCCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 15:08:12 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.20424.1760281689521840333
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 08:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Xe6HDECO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59C8tlK1017958
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 15:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IbJQDUjuuc6NrZDzSH+3CTY0nDSn4Hn5Erw
	RkE/yBTI=; b=Xe6HDECOthSWmlxDYz5gYNBu0NY1QjH7QNuEj8RI7wuxQllGJpl
	pvVEYBrrrOA/I6KTyifZXab57INzBE/Mg5j1V2siDUdRGi1js0KMbrKpMbTW5GYB
	e1K2AIV8Yj0OWhbu1qs+ZRBsN/b+rD/UCibW4Ddsw9HLauA+gLNmRxz+kyzZrZoz
	7vnBRYFKbn62F18RQFsvVARUK9OygBt2+DXrQYaJbfSRSHrhu4mNqIx8ogny19mf
	ZV7FpYQvq/3dQu93fk1DQXQk7Mm3d14YDApfiF9THqK55ZOFBrNRTFU8vWl/2Wx5
	AcNq6N3vRnvoNz2tYw8uE0W3iCDBB3BRXuA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa826ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 15:08:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-86df46fa013so2420444285a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 08:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760281687; x=1760886487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbJQDUjuuc6NrZDzSH+3CTY0nDSn4Hn5ErwRkE/yBTI=;
        b=v99JK5UX4nNkL8UuDOMpZYtThmE0kk2Ei2W8SxlTrSGB8EOx6SPzVxX1C7qNWyQEsl
         yO1aX70mtdEEiXU4YiZ4v75zuYCh+8y1005GChNTA/nQS1E4m2Ow1SNqBIfaWmfaQrHz
         xGzJMZRr1vMUt6AjZFje/561uq3HNpCphsrX/eWE/gsnLoJ2JZYZXZ988PQa7rgu5s8W
         /4Q8FjzESrHXsBZtRsEY2Y/6jhUv01gFd28UkjGHenTPZWjLZA+5YlO22VF0NGS+FsRq
         0wHtJ+M1rIXc0TTmfWLtSU/KEU1jHXwCLOjhPUgpB6gTJhd00rD3T5Ukpoj0Wc1U9FzX
         vhiA==
X-Gm-Message-State: AOJu0YyOCU5ZjyMGmQP5joBmkue1R6kLfoH1igq6RBTnwsmhO40v+h2Y
	gUOYsiJbnlwo0229oLStFfzvxRmJCY+ugK/ScYy8kvSdpUmyiKQD+mWBnlAh8C4uJ89Wgeq2mhy
	ZZvGjUoyWqx8h1+UzKe55XO2Je4lLpzlPCRz/6VzVowOqXneiG6H9BP+bxxbBRnvXRmctup01sy
	91S829OANrJfKORtQ=
X-Gm-Gg: ASbGncttMr4t7IWSMt5+ATKRyPkRp3aofq1pBwHgbhw/+qeneBIy6ry5Y3v5UN2pzbH
	xrn018OclXlxr+9c2nefgS3yu/5Y1QM7pCZ45A0eSLDUShKyccuKC2TL7yhLWVMRyzSznMd5a2Q
	bDmCMajYNqbtszc2k8DOCmSG3L7WQFFvBRaDSyyP8OuSbqeeIiliKiVmMEH15uLwl5qgVl/HTho
	Z9As9gGy/kTjFVIKHSHXKYyqNnYqHlfC8Kmaxrd9CSJRcvyQOY7h1kySVfkkau6O6VPGN7A/KmN
	p5wlDNnYgEX57A0jbVnSjZ2iqLjJFuAegxeGmYOAfoR9qG0r10uxh17bAGcEUZnqiXHkH9ueXHA
	UQxQlWXGR4BlzNWQmblNJCBqIkmsaZomFg176kaK1Sf4kqqpxA5/Y
X-Received: by 2002:ac8:5793:0:b0:4dd:b403:5cb8 with SMTP id d75a77b69052e-4e6ead03341mr225248191cf.33.1760281687312;
        Sun, 12 Oct 2025 08:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0fFg3lFeLie6xGeG4nZx2dKxUJxI0H2T9tn6RcyviV7ZtOkc4bNwCBSHyj7NOV6NTDxggqw==
X-Received: by 2002:ac8:5793:0:b0:4dd:b403:5cb8 with SMTP id d75a77b69052e-4e6ead03341mr225247801cf.33.1760281686767;
        Sun, 12 Oct 2025 08:08:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088577f2csm3080553e87.107.2025.10.12.08.08.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 08:08:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] x264: switch to PACKAGECONFIG
Date: Sun, 12 Oct 2025 18:08:04 +0300
Message-ID: <20251012150805.536603-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: amH1AhaZHbqk-p0TS6uo3dU_7TutVgHX
X-Proofpoint-ORIG-GUID: amH1AhaZHbqk-p0TS6uo3dU_7TutVgHX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX9MqNVgxJb6gZ
 Hl/GN1Vq+b+O/rNQM5VFHFSB+u9g4zWDjppxfv4zpxlBF7Z9P8A/rG7fwop8uX1GRIlkJgmcM96
 fGbo9st+bjSRvbW0U6edH0fL37lhjLguR2TorlA+1MCejHiHjNAyTWie9tjqN8LZbONXtO72l3k
 0J/PFJs3W6vcH/rsYd0y5ZWBU7lnsHRuR9a/Utm0ozuhoB5oXV7qiyqamH6b6V6Ow4HRybX/kq9
 uDxHYHo3W4vHjvUFq36wauOYN4XDM8UqG9lDcQHaPRwzERJFLVWgFnVfcjm3BJi+Hk7tCfilYKr
 gAHFXe8jg1+Pj0QN4hYIzvDsYiZwR/TGQ7LUZamWtw+u5x6DIrXWorGCT75/uIwDpe8m2m8laFv
 vB1oG597JooiAgxE1VZ8Q6oCIA1QaA==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ebc458 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NIfUrUhfAAAA:8 a=EUspDBNiAAAA:8 a=JjDiQtWF4Mm85DaTTbAA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 15:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224738

Switch to PACKAGECONFIG in order to make x264 options configurable.
Enable FFmpeg (by default) and OpenCL (if enabled by the distro). Pick
up the patch to fix building with the latest FFmpeg.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...b801191522961102d4bea292cdb61068d0dd.patch | 39 +++++++++++++++++++
 meta/recipes-multimedia/x264/x264_git.bb      | 11 ++++--
 2 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/x264/x264/32c3b801191522961102d4bea292cdb61068d0dd.patch

diff --git a/meta/recipes-multimedia/x264/x264/32c3b801191522961102d4bea292cdb61068d0dd.patch b/meta/recipes-multimedia/x264/x264/32c3b801191522961102d4bea292cdb61068d0dd.patch
new file mode 100644
index 000000000000..fb0f313cdb60
--- /dev/null
+++ b/meta/recipes-multimedia/x264/x264/32c3b801191522961102d4bea292cdb61068d0dd.patch
@@ -0,0 +1,39 @@
+From 32c3b801191522961102d4bea292cdb61068d0dd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Martin=20Storsj=C3=B6?= <martin@martin.st>
+Date: Fri, 4 Apr 2025 16:59:34 +0300
+Subject: [PATCH] lavf: Update the code to work with the latest libavutil API
+
+Upstream-Status: Backport [https://code.videolan.org/videolan/x264/-/commit/32c3b801191522961102d4bea292cdb61068d0dd]
+---
+ input/lavf.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/input/lavf.c b/input/lavf.c
+index 90f4cec5..e2489963 100644
+--- a/input/lavf.c
++++ b/input/lavf.c
+@@ -33,6 +33,7 @@
+ #include <libavutil/error.h>
+ #include <libavutil/mem.h>
+ #include <libavutil/pixdesc.h>
++#include <libavutil/version.h>
+ 
+ #define FAIL_IF_ERROR( cond, ... ) FAIL_IF_ERR( cond, "lavf", __VA_ARGS__ )
+ 
+@@ -141,8 +142,13 @@ static int read_frame_internal( cli_pic_t *p_pic, lavf_hnd_t *h, int i_frame, vi
+     if( info )
+     {
+         info->fullrange  = is_fullrange;
++#if LIBAVUTIL_VERSION_MAJOR < 60
+         info->interlaced = h->frame->interlaced_frame;
+         info->tff        = h->frame->top_field_first;
++#else
++        info->interlaced = !!(h->frame->flags & AV_FRAME_FLAG_INTERLACED);
++        info->tff        = !!(h->frame->flags & AV_FRAME_FLAG_TOP_FIELD_FIRST);
++#endif
+     }
+ 
+     if( h->vfr_input )
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 3cc339259381..eb72ba006a04 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "nasm-native"
 
 SRC_URI = "git://code.videolan.org/videolan/x264.git;branch=stable;protocol=https \
+    file://32c3b801191522961102d4bea292cdb61068d0dd.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
@@ -25,6 +26,13 @@ X264_DISABLE_ASM:armv5 = "--disable-asm"
 X264_DISABLE_ASM:powerpc = "${@bb.utils.contains("TUNE_FEATURES", "spe", "--disable-asm", "", d)}"
 X264_DISABLE_ASM:mipsarch = "${@bb.utils.contains("TUNE_FEATURES", "r6", "", "--disable-asm", d)}"
 
+PACKAGECONFIG ?= " \
+    ffmpeg \
+    ${@bb.utils.filter("DISTRO_FEATURES", "opencl", d)} \
+"
+PACKAGECONFIG[ffmpeg] = "--enable-lavf --enable-swscale,--disable-lavf --disable-swscale,ffmpeg"
+PACKAGECONFIG[opencl] = "--enable-opencl,--disable-opencl,"
+
 EXTRA_OECONF = '--prefix=${prefix} \
                 --host=${HOST_SYS} \
                 --libdir=${libdir} \
@@ -32,9 +40,6 @@ EXTRA_OECONF = '--prefix=${prefix} \
                 --sysroot=${STAGING_DIR_TARGET} \
                 --enable-shared \
                 --enable-static \
-                --disable-lavf \
-                --disable-swscale \
-                --disable-opencl \
                 --enable-pic \
                 ${X264_DISABLE_ASM} \
                 --extra-cflags="${TUNE_CCARGS}" \
-- 
2.47.3


