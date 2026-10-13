Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2666CC6B12
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 18:40:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5079.1791916820550174692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 11:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Gsbjdsyw;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JdP22fDq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHurOh1125206
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 18:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yvdUwJgxsolDdFTsodjj8XgMfay7elQBTPj
	smyxhapg=; b=Gsbjdsyw/ERNGtDeZRFlOAxkjtmt2Fbaf7IpZ4HJaI4qfaodQ4H
	oy0ik08LfyjArxZeK/PCT5fR3C5FT0Uu1pwVG/stToxRrYAI+o4uv2RmInW0WsrL
	3ZQiAWAMxd0mJA6WAqL9EbPs93FEZcK3lsFanxfUHBCjlLcPWWV3kW/Dmk57kK1w
	camhD2hq3Bbate64W9eGKrgKU3oJR4l/wGm1URxlCfibKE3hnXX8JbAxP8oryoaw
	oReuaMdDSWVMN2rzD+RDbIxzeDFCJbB+z3nOxv4ekC9+Z7CdZ6xV/PUNxZ78/k5U
	G8yK9A3G7EglfmrKsQJ5n+Vy8aNsgjwwOwA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sg807w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 18:40:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b529a8610so74037116d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 11:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791916818; x=1792521618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yvdUwJgxsolDdFTsodjj8XgMfay7elQBTPjsmyxhapg=;
        b=JdP22fDqC6WfqYbiV7kZaD74Zq1c0ZQhLwIKoks8VClBBtajHcwQQp0P2J78mTbE41
         6slJl4R3YCZsNCR1V0ncZUQyVPD/4ATtK1CxIl5N2YyfkuFPHll+h4NRR51yWreCC1ma
         1piPC+u6xADl0qZlCn63JFssy+0QEqLbQcqKLRn4IuOy58NnhQMcNEmxF7f9Gjws7wtn
         TwGgwHXOL+Hbw1jBSlidaDH2h5+xaRhlE4Zs3cs6bFyVLWrrsNkFbjFOoOcjkgnZESlJ
         sI4Cg+LZeFrUjy5FqsJphbc+UFavknM9nqQku5zMA3NoPgYfmQ8UkGxoCBSDyJ/X5TRa
         PrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916818; x=1792521618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yvdUwJgxsolDdFTsodjj8XgMfay7elQBTPjsmyxhapg=;
        b=GRkZ61y8JJV/rhiFn9OaflDbcwk1EYBSRa47upc8Gj5AxDXKbz+acLXqZV27iJgaE1
         uIfw1xQs2lvAC4HxeAkzcR0REvuGjMfgW0eiWMbh3wF3WlAIwYCyISm9i5KToeUADnNd
         IAX4zoWaqT+/aOmjUXP0BWwgEtY/aYIovL58alNvde1m1fSzQoi4E8aoYEEl/L4LbjVP
         OISU7yNybrSaZswwbpKBlUhZY5uA0KHSxw3xhfQnsxOqYVS6DSOovdQ+hkBcBhtBbpxV
         wYSS2Pa5NktAc+/u8FiOeQITQUZPqGZGADwwyORnYjkDqtZbXMiCGFSZLF8dVYlo1tnS
         hyKg==
X-Gm-Message-State: AFq9FYLsn4CiRuvpcmluJ/OTP/yAv3cI49wuZIRCM6gG2Q5ijoXrVHpN
	HJ3G7/HOmXTV6/+z+YxFmYfZ5NcQdjdWUbYR9ENCfVH3WNV68Hn0h30raVtlepu69inZys6hSlL
	GL4SFsTcJFkXP6XrzvImGYBnlwnkLjAMVsjseT/VQGEkqyCFMSXWWP94jetC0iU7tpVyhGjvS3F
	+2GNtDuNRXbKqIAdk=
X-Gm-Gg: AYBFou0U1GwLintiuPb6yk+m1ExBktmQYfHgEy+VsBvZHZmAtTQIjt/f36AGQwKzUYL
	9JosPtROOhe4Q324sMmg2ietBvh2YK6D4hFnHAp4iaGMugE+gC8diGbZIO+pUfg0/+/iePXG6S1
	4IWz3C+WE6ouMZ5gO5CyL3Kax/FwRzSKLYnqKYDvQVjmKFj5Hd7TEpaCmPjfX4eos5YT0zJ0iEK
	LrPoehIw5wzVg1By8/3Yj8JGqGIUcneF9qE/wMehzCpDx62YzcKhSANiL3VHvDLiS2GSDHQ64Uw
	o0RByqSy7j7MJN4ndd22mf999UlDw3esWRraqUStCZ29SoGT8BvACJsG13Rb4b9YhqYV0hyqUWV
	7+dUXPDaFoJ/1eA==
X-Received: by 2002:a05:620a:3720:b0:93c:6417:f9c8 with SMTP id af79cd13be357-93ebd1b739cmr2510279685a.29.1791916818300;
        Tue, 13 Oct 2026 11:40:18 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93c:6417:f9c8 with SMTP id af79cd13be357-93ebd1b739cmr2510275285a.29.1791916817783;
        Tue, 13 Oct 2026 11:40:17 -0700 (PDT)
Received: from toster.lan ([185.228.162.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac4fd7sm6769877f8f.40.2026.10.13.11.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:40:14 -0700 (PDT)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH v2] testimage: add TESTIMAGE_AUTO_SKIP_IMAGES
Date: Tue, 13 Oct 2026 19:37:09 +0100
Message-ID: <20261013183708.66012-2-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tN8wbiHC7WmEdknjJcpXHOCK54zoiwgL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NCBTYWx0ZWRfX9eSgJ2rU6BW2
 nHnkQkiYAxs79XGQ7sVWVU0RMamzGfnRLMaLIkhOxG1sjSN7KKkOWmzsXk6T54B0amXtxcM/ydQ
 dEmD7EAI3N6VuhKgHbCnuwkTCYFvsdM=
X-Proofpoint-ORIG-GUID: tN8wbiHC7WmEdknjJcpXHOCK54zoiwgL
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6ace7b13 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=YIx/k7VQn7/pPcQ+xNwIKQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oK8KoGpllTIW5qSxSF8A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NCBTYWx0ZWRfX+9QoHBFHvD5P
 G65wTSvCOsNAeFdag/tWkZcKcJ1gnib5uqoV+tG4my7Kvc9ACFN8Ru+I7hHHQZkLg2dMWuCesCZ
 ULcReOaXYDFfSoU6MMb1vyUuCaPBudHAaffGyq7TKqa8qUjUEKhZQUEfqJIF/wZ61alpMZ0zd2j
 j3b73RzxqirC2PvGmzxrgxDdjMYTyVMng0y8Ma6QVKHQ9Ct82vGr8QQOo+IUo13Go7ElXMgNrFx
 BO+gtnGr+vraDIrlrPjoCeb0vkEsHI/zxD0umnZPaqL6k3cUakIKvVyFSqJJ2mSo/GLUsmXGuM+
 s4HQwzVATTC4w3rdTfoVQ2bVVhVxXh35yi5GOMkjttxK7I16wETh+Gf/wyWkKSXj+hTJGINNSb3
 5tgHgbiY4jbHPIKz9HB2LVsqDWiUdPC4vbt/mSX3gg9ziPQAtjetYwhNIklJXMYwo7UloQ/5kf8
 +upPPzRCUdx6A7zw9Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 18:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247736

When TESTIMAGE_AUTO is enabled, the testimage task is automatically
executed for all images. However, this is not the desired behavior
for initramfs images.

This TESTIMAGE_AUTO_SKIP_IMAGES variable excludes a list of images
to be automatically executed. The default INITRAMFS_IMAGE are excluded.

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---

V2: add new variable to skip selected images
V1: https://lore.kernel.org/openembedded-core/20261009200155.1040688-1-jose.quaresma@oss.qualcomm.com/#r

 meta/classes-recipe/testimage.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 419ad6dcb0..9909c928cd 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -18,6 +18,9 @@ inherit image-artifact-names
 
 TESTIMAGE_AUTO ??= "0"
 
+# Skip the default initramfs image in auto
+TESTIMAGE_AUTO_SKIP_IMAGES ??= "${INITRAMFS_IMAGE}"
+
 # When any test fails, TESTIMAGE_FAILED_QA ARTIFACTS will be parsed and for
 # each entry in it, if artifact pointed by path description exists on target,
 # it will be retrieved onto host
@@ -520,6 +523,7 @@ def package_extraction(d, test_suites):
 testimage_main[vardepsexclude] += "BB_ORIGENV DATETIME"
 
 python () {
-    if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False"):
+    if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False") and \
+      d.getVar("PN") not in d.getVar("TESTIMAGE_AUTO_SKIP_IMAGES").split():
         bb.build.addtask("testimage", "do_build", "do_image_complete", d)
 }
-- 
2.56.0


