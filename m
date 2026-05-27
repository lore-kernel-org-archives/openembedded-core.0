Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 875CFCD5BD0
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 13:06:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16440.1779873930073478661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 02:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TUzg555I;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GAyYV3w/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: wei.zhang@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mXBJ879397
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 09:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gXiNhMuSTvne4DyWIktkzq6fvUHh7ShNDCg
	6PBUj0q0=; b=TUzg555IP8S+QLl6d2IcCA4bY6KHwxzxQON8QQIDB2EJXDCdXjW
	kgCjNYkoFq2PrzFArfWdsGnNw/Ud+f8/GZCtjZn8BwPcWYmbjmewHnKbB3106gfp
	JiLe3gYbV/KGw925ZGcWu18zGV3AZDdaa89cC9RrYqmNNupidJngcDuftwoHOpsA
	9oM3vuwEEw3tQO3D+k2csLrJuLnH+A/CBRVmBG0Pf/hzZ13n9Y37xI9DEH5EOFEg
	wEZP0DrgAOHf7jmzJ0RwH3MsQUGZDN+eR0l5Lti/6k4LN1YLe1Yyy48vfcFxXKEi
	P9fawhCAitLF+7oi4QgEs7eNGOufomXkosA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edvvqra85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 09:25:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304950e5901so1581710eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 02:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779873928; x=1780478728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gXiNhMuSTvne4DyWIktkzq6fvUHh7ShNDCg6PBUj0q0=;
        b=GAyYV3w/Dj7pVdYk+1Ol5KcCqd6zVic5Q4PHp2Yeb96FwbQvFPCgk/4qoOxgRT/JFq
         2aDfVR/z0wYRpUomGdYpJKtSPLWYeTPXVfjs40bpWf/PE6EfoFouOpppEAOr8uE8Fpax
         rtRf0fIStq9dSsWKyfO0T1jwR6/j2dvrdjnhH6ce2wbt/JRXYNlrRRomuBbFrpnI0VVS
         H7TXgZNvTwzIj4jTYWG3BTX+nFTR3kMOreKZTZoZcZp1HuwJnmLskmpLtOtWjaAXr/Il
         qWFDsNSyrnBWNZGG7+FQ19V1lHcOoIrYLYxuVWrw68lNpZxKtobr6aTfA/7T0I1WPnlB
         hQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779873928; x=1780478728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXiNhMuSTvne4DyWIktkzq6fvUHh7ShNDCg6PBUj0q0=;
        b=hMppxdTWGmxoRJKAt1pQiNDB6zau8Y/7JIZNIaGVnZcwPRO0CU+lVYzGev0ElnA6Xn
         yZYCTsvdmHOXKv/ylKAmUGX2fQC/6fJaEygQ3ksR9pb3FdMejQD/RYIED93779lA6Jcu
         KzVZpu8OiaR9NVIPVJ12GjxY758CtZ0q7xe21hpd0dNIKOoYups3L9mizrlhTUfhpKNa
         ZSt7p1PKiSt7N+A5CFP0cVgpBnSEKOV5L5I1zkP/4oE3ehSKPzMJtcUVula57mQzV/0A
         if+MF+sUsszt8YSRf3aeC0fqwsNZmJp6NPrYVNi7L5/CrKdQcesBKPNh1PiRRFbmLron
         SgMQ==
X-Gm-Message-State: AOJu0Yw0CkqneFozMyHm7YAoVlbgAMfcytwxG4IrNrcfWkHjDX+1tF52
	NtvZ3Gswpya8iI+ktowzss3fDUDSu7IvJjj5n8uQax7BT5pYCLQIbqCTp83uHlEyRw3daV6eNZy
	IaT8CTl4SMtqIZw4AL83Pw9RrgJz9JYEx0/PZlYufN5yRzrH3KYMBxm/Rq6ZDuz4LFzPWpRYtsS
	kcvBtKbQWXZUkW+pSRLg==
X-Gm-Gg: Acq92OFsseFHPbZrUe/EKeoCK/jf+uhemGoWMGqN8sahGCNMyITUtWUf/m3v5elghQv
	37w2YxyMzSvHhjyA4TBETeEoqr7RbmpVhESw5sFhWalPDioHJAHGAA261obquVFe0bn+VDT10x6
	yFjzo01R1eHc0yoR/musduFbjBXbhKdMQYWDG0gCeeB/EZ4lfYI3Tl+6bgPLZe/jCRqC+fn1Vf0
	anqxqDO0KruDUHYXMsAMixBHvVeUbL1UBu/7Hp/HuE6b99dbw4GkTZ3nnAMSqp2BO1eLDY/l+7g
	zmUIHpB5jpo5Yu8n2L1myXoYd+gDUZxmhaludOjU+KMfEtDJ+jcs04Gcyj8fxB3T4AZbVnVOGdh
	3iikrdVb3ywuzbklAX9OIgUqGe3ljh5CIGAh2dglBYztBl6qsQbta74AISX4OTRDghyD7sl6v/0
	OE2w==
X-Received: by 2002:a05:693c:2c84:b0:2f3:b7b2:cbd3 with SMTP id 5a478bee46e88-3044a41b206mr8637077eec.5.1779873927789;
        Wed, 27 May 2026 02:25:27 -0700 (PDT)
X-Received: by 2002:a05:693c:2c84:b0:2f3:b7b2:cbd3 with SMTP id 5a478bee46e88-3044a41b206mr8637066eec.5.1779873927108;
        Wed, 27 May 2026 02:25:27 -0700 (PDT)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452230dddsm16282747eec.17.2026.05.27.02.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:25:26 -0700 (PDT)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, ross@burtonini.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Wei Zhang <wei.zhang@oss.qualcomm.com>
Subject: [PATCH v2] wpa_supplicant: Handle invalid op_class 255 in BSS Transition candidates
Date: Wed, 27 May 2026 02:25:19 -0700
Message-ID: <20260527092519.1225444-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MCBTYWx0ZWRfX3wTeAKsZoSpm
 BRm6ZTkTjrCg0A8bRqIPVO2iXq0g/zLbLqLPWq833yp5EkQi8qXoRD23zsL9VGOQIfGrTb/+4TZ
 0jNEC2JiPnG/Yrhs7NTdm92Sa3cgJ8FuLyFNCBUcHSeA/+jQlfqhUGOO5bgG6YcRqQ36NbnH7EB
 ZgVSXlfOnQECMZ9K+fGJH/FIttKbJas4r/dxd26OihZvQi+nQvO6qHNf/+wTgOi7KMPrNp+nNGf
 alJEoQnL1xJkmCNc7UJLzXg2BueX2r/M6TqpIE34waZdrTqHL82EKmw8I/leZADZPkhsAWOby1l
 lW4lx6FO3YCirnGsuflg/Ulum7SfFoo27Pw1J+NO5JdpwjC2ohd8Hv1h8QdDxx862zgtEs3jGBr
 pgLvRhuLwim1s118Gu7UzwZ6dDbl/sflX4iyOiF8X7Jk+w7xh+cF1fhUdwP87nz6DV7bsVhiTqR
 3nMwc918MXwWd8t0pkw==
X-Proofpoint-GUID: 56fzfdBc8t3bUrDh-ug5ZrPGIvfb_r9m
X-Proofpoint-ORIG-GUID: 56fzfdBc8t3bUrDh-ug5ZrPGIvfb_r9m
X-Authority-Analysis: v=2.4 cv=fLMJG5ae c=1 sm=1 tr=0 ts=6a16b888 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=yaAG3qJ-AAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Q4UAZ6X0s4pUPLrsseAA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=oLVlbjkABFOu4cUI0CGI:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270090
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237660

Some APs provide invalid operating class (e.g. 255) in BSS Transition
Management Requests. Fall back to deriving the band from the channel
number.

Without this workaround, invalid op_class values may trigger unnecessary
full scans and degrade roaming behavior with non-compliant APs.
Standard-compliant cases remain unchanged.

Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
Changes in v2:
  - Add CC to maintainer and reviewers

 ...r-broken-AP-operating-class-behavior.patch | 39 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch
new file mode 100644
index 0000000000..47fe1b4c9f
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch
@@ -0,0 +1,39 @@
+From 72ac0ee026d9f6f9cd031d7859ea0b343b34e61d Mon Sep 17 00:00:00 2001
+From: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>
+Date: Thu, 1 Aug 2024 18:37:25 +0800
+Subject: [PATCH] WNM: Extend workaround for broken AP operating class behavior
+
+Some APs do not advertise operating classes correctly for BSS Transition
+Management. Try to determine the most likely operating frequency based
+on the channel number (1..14 --> 2.4 GHz; 36..177 --> 5 GHz) if invalid
+op_class == 255 is received in a BSS Transition Management Request. This
+speeds up the following operating by avoiding a full scan due to an
+unknown channel.
+
+This extends the workaround that was added in commit 80ce804e8824 ("WNM:
+Workaround for broken AP operating class behavior") for invalid
+operating class 0 to cover another observed case with invalid operating
+class 255.
+
+Signed-off-by: Yu Zhang(Yuriy) <quic_yuzha@quicinc.com>
+Upstream-Status: Backport [https://w1.fi/cgit/hostap.git/commit/?id=72ac0ee026d9f6f9cd031d7859ea0b343b34e61d]
+---
+ wpa_supplicant/wnm_sta.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wpa_supplicant/wnm_sta.c b/wpa_supplicant/wnm_sta.c
+index 58a124c00..662f6089e 100644
+--- a/wpa_supplicant/wnm_sta.c
++++ b/wpa_supplicant/wnm_sta.c
+@@ -555,7 +555,7 @@ static int wnm_nei_get_chan(struct wpa_supplicant *wpa_s, u8 op_class, u8 chan)
+ 	}
+ 
+ 	freq = ieee80211_chan_to_freq(country, op_class, chan);
+-	if (freq <= 0 && op_class == 0) {
++	if (freq <= 0 && (op_class == 0 || op_class == 255)) {
+ 		/*
+ 		 * Some APs do not advertise correct operating class
+ 		 * information. Try to determine the most likely operating
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 32ecf41406..558065f03a 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch \
            file://0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch \
            file://0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch \
+           file://0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch \
            file://CVE-2025-24912-01.patch \
            file://CVE-2025-24912-02.patch \
            "
-- 
2.34.1


