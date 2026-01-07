Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A70CF6C0E
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 08:44:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.694.1767768904890767195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 22:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=R/zsGrHv;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=cxuSjmg3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: mohammad.rafi.shaik@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60731Foc365091
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jan 2026 06:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7T54Ac6Gss8RpJ4r5Wbwmrvzf/4N35Gp/w4
	yFq0D2JE=; b=R/zsGrHve/SqhGhb5XNqqqAeMWkpe42dV03c8Slvm1nMk4TAdyF
	KMmYw9m1V9ztQZO2qVA8eBkeR4pUwXtGRGHVube5+iUTou4kMpBmxg5gmUqhp5zG
	1w0O3s5jbjwDEmDoGYT20wyS4n0T8B2+hs75JoVKlbtluhCscdtJUMNhW8BxL9/Y
	/GXGV8jqRZGtrcDfRnWk74ZJpdMV8MluIonIEfrlB3EQpIAnil2oZUCP78XyvvTv
	fd4H+YcQ7elqQYynYINTuOAVY9q3/gHIiqn7CGpFg1fFTm79a8Mw+p/3jR6/lJC6
	mmcNcWQ7UC8bo1VvMIZGVQ8+ehO1vUi9URg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh660t4sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 06:36:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so1843221b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 22:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767767784; x=1768372584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7T54Ac6Gss8RpJ4r5Wbwmrvzf/4N35Gp/w4yFq0D2JE=;
        b=cxuSjmg3Iy5LYZiOpJ+ZBTfDZxn9Lbxhbd7bWsUTCBSUZBc2W3k4q6XbO4RkIix/Tn
         65Kt3iGROIUriBjpmwytdHC/rdGMjsMyVihSs4/nUPRO/DX0W7ZiMmi/+EcaRFl4uW3v
         2gjPb/xYbk2Xzo6rypzTqzKYdsUORcMdy7+VqUYJc/5EpxUL29v/oxUCOk01QcOgPwNX
         38IzuaMaSWEozy/QRTGoI3kV2WThLKYmqFBuvoSjzMD0X3aE8FH686gupwVWoXEamtyR
         4RCPXiwMd5lscBxkyPNrzEN4uO/z4bokducXYLf4eBdCzF8HLV9He+jIRD0UfWNmYE6o
         NxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767767784; x=1768372584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T54Ac6Gss8RpJ4r5Wbwmrvzf/4N35Gp/w4yFq0D2JE=;
        b=S9ZoLUy4X9WXOuA4EIW+a8ZiqQ06cxTA1eH3T0NWAQQEywks6BtqyQ4g7BaajXKhvD
         wy0nLKOZZOIltg1Ly73UaGT+NaMnN8xp3aRd++db5DkInkSPH5nYI9ZGjv9FVP5agJuQ
         DcAhDnm/AXdrp+EypTTsJgnSUjEDJVR/J36ZMlALrIBqQgSHH4XtS73WskM0FstY9cNN
         Ng0IzKSh5I86NOsgEFx6SLGRIDJPMx/B8aAMdzG783kaPA1grI4/Uprt5QHCfO8mJ8Yq
         853ouaDgIDvXjgzRaoFCARvTG4uVD6v1nHTH7p2iiFnusa0lfIURWKAv/Knla/MlgUBb
         o7SQ==
X-Gm-Message-State: AOJu0Yxkf/qJZyMhykMURgoz6HtDidszIHq2C7K/xFiOGi4RH3ht+5uB
	rkbl/bTxZsI+laeL1HD0g5x1RsgOtCzkurSIKaZCu6A7pIhPVKw2xcXjsGdJcQrTeVXEQC5O59B
	XCDE2yasoqU8KTxnQ9tR7w7jqYyIPVcoGUGSwz9gy1fUhDX07ZNOCDf7VJ9gKoKunr47vlhsGvn
	BSXB7Hs25CTL7cyEE=
X-Gm-Gg: AY/fxX5ZEMjtp50ScV5yJq2wMmgk2sIyYvJblssNhWfun/JCzgod6ei8krBpvOkVG1W
	sbvrnzMwAZ1cF+kL0mw43Wtr9BeZ90J9XjEmQjcYKgixusxe4oZxqum43BHcHQ7p6Eg3Xx1w+3U
	2S4sSfje66ZXuLYNyjJuszTZNPGf+gQzHf9kwRYWoyqRVnpFsw0BDpKCQwG8dAjDpgkLxabMQLd
	QQT6WiwTvs6rIo5n0WnuB7FnsEaGS3Uv+wDvfBHOESvuoqhNMOf29menPJPcv2FaDLn3DjSO+Ev
	rQWy2EcGjXAkHlhMJABNhaBfdCszs3BKf9+Z55LfR460d65KqwqwbsN3cGucThX3HXoGO8fqBxd
	1iwIWde0jE8ue7Xh+lVXtvk2MUTnZnJUuKVaurhyVVxMFdg==
X-Received: by 2002:a05:6a00:e13:b0:7f7:6229:fbb5 with SMTP id d2e1a72fcca58-81b7dd5f1edmr1448061b3a.25.1767767783863;
        Tue, 06 Jan 2026 22:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzmg9Lvq6MZb5zVLXhIxrHmofjTVijxESMF9smTXM3V/oEu5Pug8T6EPWc3Nu88LR7eUxaTw==
X-Received: by 2002:a05:6a00:e13:b0:7f7:6229:fbb5 with SMTP id d2e1a72fcca58-81b7dd5f1edmr1448035b3a.25.1767767783275;
        Tue, 06 Jan 2026 22:36:23 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e826asm3905005b3a.54.2026.01.06.22.36.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 22:36:22 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v1] alsa-utils: Include upstream fix for unsupported bit format
Date: Wed,  7 Jan 2026 12:06:05 +0530
Message-Id: <20260107063605.3838495-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=695dfee8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=foHCeV_ZAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=wlxHRF5IQzyHM0QNl6cA:9 a=2VI0MkxyNR6bbpdq8BZq:22 a=h8a9FgHX5U4dIE3jaWyr:22
X-Proofpoint-ORIG-GUID: ZUw2aQvaw_G6NvKhdx1U5SsLclu61df5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA1MiBTYWx0ZWRfX0SsL7qKyHqkK
 cxpQYUpWOMFIXPo4/aFwWxPzqrfF76ACyoscieulgUpk67h/n5+ryY37wTqyc4fA4BMy/P/u+14
 XX/IDjRXE92FkmnLfohDkEi6uxLfcGaGxzpGSJPrjasXZ7F1lyr3pP6IDSPPOdGVR/RWp+TKXqk
 tBsY1uhWtUOHKRzDh5X5OLVg4onaWd5tKonS47MKrKPZgMV9QDEJFsF7D+5jrvywOE+kC9H+KTG
 FFZSZyF+YrOd5x3ozIOb6Zy9O444abRGPKOzrcLK3ulTQ1AjwyA9K7jWh2oyxB0uzfgQB7JXjy4
 5REiBl1JYof3qqOiu9UJnMaVGze3klabA6racuQw1HUy9RT74vKXhePXHFWXF77gfNqZtIp8VsY
 UzsIRr+hn6Mlozdc4aY5t4CIxzQu+62hU+GAxpmXVB9b6ypVpv+fIX4PCn1PMJB/G3GA8QA8pQ4
 dAqUAf/ke5AoDwb9ueQ==
X-Proofpoint-GUID: ZUw2aQvaw_G6NvKhdx1U5SsLclu61df5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070052
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 08:44:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228960

Include upstream patch addressing the unsupported bit format issue
in arecord/aplay.

Commit:
https://github.com/alsa-project/alsa-utils/commit/a12ec83fa93e16a76f5c57f128f819dfe332f96c

Upstream change log:
https://www.alsa-project.org/wiki/Changes_v1.2.15_v1.2.15.1#aplay/arecord

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 ...issing-break-before-the-default-case.patch | 32 +++++++++++++++++++
 .../alsa/alsa-utils_1.2.15.bb                 |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-aplay-add-missing-break-before-the-default-case.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-aplay-add-missing-break-before-the-default-case.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-aplay-add-missing-break-before-the-default-case.patch
new file mode 100644
index 0000000000..53366e6f61
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-aplay-add-missing-break-before-the-default-case.patch
@@ -0,0 +1,32 @@
+From a12ec83fa93e16a76f5c57f128f819dfe332f96c Mon Sep 17 00:00:00 2001
+From: Bard Liao <yung-chuan.liao@linux.intel.com>
+Date: Tue, 16 Dec 2025 21:55:54 +0800
+Subject: [PATCH] aplay: add missing break before the default case
+
+Add the break before the default case back. Otherwise, all cases will
+fall into the default/error case.
+
+Closes: https://github.com/alsa-project/alsa-utils/pull/315
+Fixes: e78583ab7cde ("aplay: reorganize format handling in begin_wave()")
+Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+Upstream-Status: Backport [a12ec83fa93e16a76f5c57f128f819dfe332f96c]
+---
+ aplay/aplay.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/aplay/aplay.c b/aplay/aplay.c
+index 63a5214..737d087 100644
+--- a/aplay/aplay.c
++++ b/aplay/aplay.c
+@@ -2731,6 +2731,7 @@ static void begin_wave(int fd, size_t cnt)
+ 	case SND_PCM_FORMAT_S32_LE:
+ 	case SND_PCM_FORMAT_FLOAT_LE:
+ 	case SND_PCM_FORMAT_S24_3LE:
++		break;
+ 	default:
+ _format:
+ 		error(_("Wave doesn't support %s format..."), snd_pcm_format_name(hwparams.format));
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
index 09b3de81f4..144e9dfad3 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
@@ -25,7 +25,8 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
-	   file://0001-alsactl-fix-build-when-in-subdirectory.patch"
+	   file://0001-alsactl-fix-build-when-in-subdirectory.patch \
+	   file://0001-aplay-add-missing-break-before-the-default-case.patch"
 SRC_URI[sha256sum] = "d3183d2ed2d69e9143c5beb97036267c3fdabfe8bfbea8bc6863f17b1f0b568e"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
-- 
2.34.1


