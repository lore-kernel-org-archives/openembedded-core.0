Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC6ACD5BD2
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 10:19:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32791.1779785607728166576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 01:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nxFuRFVm;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=C5qpI0eR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: wei.zhang@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5PqQt079206
	for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 08:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6f3laXdYFMecQkhqRtmR01FHH/B3JNdPQgg
	c97+ULVQ=; b=nxFuRFVmrNCQluHPRQOHGyJsFOsSBqaV3seGWceeIPlX1MvJZwR
	LRNbf7JO3KxwU3q7MQEhEon0GLk/E4ZbUPQTjhGi/8o/Y7EeVOsLLeUhppcMFCjt
	Ww4iHS0f8PDWHbcrK678WlLaocLF2Y4wK4cz1SGNNuWPIn5KhEupT91mPO7+6PEP
	eVvgPR/6/5QFoOrnbjrTSKSUPcAq36V+rt27yU6p9i+0UEMC70V1Uq79FHm9weoV
	6vhtHJHgymc7Gfw6obGgidOaSSjZ5O9G8zdSYogzRrVQOU4NnZ2451OSJTid1EZS
	byK8oevaDcKM4iUke6oD5SxLx1Rt7rtjzfA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckmabrt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 08:30:59 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-13536592ebeso2910854c88.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 01:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779784259; x=1780389059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6f3laXdYFMecQkhqRtmR01FHH/B3JNdPQggc97+ULVQ=;
        b=C5qpI0eRHki+SiIkjivm3gH8tWtlTPGiEpp2gQsZeLI4ps2UHb6jS5p8AAKiUcC78V
         gF+JEkvQcXg3V+9/nAooLELqWOK4ZcVhezNDlaNUqinR0l58PsqkYN6KEfI3rDk+qqR4
         YWTLua8qBztPzxXcll0Dwy+WsZmVnUWBRYqLJRvti1ZUOgZ92rsBI/gM+wDtXWLUlmMZ
         qfG+nuTJAmZNA/2HoTUgfpkVQkMCjdRHr0oOWmQ9TLWDk+jltk0uUPbvI9o4lAd8xm6H
         2UuHAk/7pV6We8bMPa3SfMuyGVQ1RYBuXcreSrtSdL9y6DxpHewkP7OgvT94LuOvj41j
         e53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779784259; x=1780389059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6f3laXdYFMecQkhqRtmR01FHH/B3JNdPQggc97+ULVQ=;
        b=B57XTWJoqlnZkQZ0EaW+H+bFMVI1yk1u70lLMNQK7Oz2xnZOp0/xsc56s0qHERUt0u
         DukiW6JLsu5++W2Mf4jcIo4jXrzePi/MhHmRm5dBDT8Fyztc53bXRufhHGE0hnccQgDd
         Q6RLjmggmdV8joM1cY4c8dPoX57uWhwbhBgDEHRe7Wz2aLVDU/ZXdT21MK33Bsx6HToC
         nrOll2SbdPl+XhF/CTBrodvm+BjxpY5w0DLCc3qeBJSDQDry8q1gnSAejSJ1eQTSAZu3
         aKCDA5oHWgCjrDZNt1+IGsj4ZfSqSk08GTkevz7TqbCGg6vxgtPEH1tLPnsegOqIWPgw
         9rMQ==
X-Gm-Message-State: AOJu0YweYWmVPEDwk7Lep3O5sOM39rW5fhK251KeFvG9Lo+p86WNyo6a
	oTY+bwLrhXex81X/1si1LcrMP1F3nwjvxUy6L6baWLFRqLNbiOQHT2deKTbyo8s1zMiefbHoTjF
	nD/wb/pCGH16Ein8ViExLhPudE3hLXDgrAOWf/FZivyaSdS2g+9jFEudBOPogbMukjYmtyNqysT
	PT4oE5/JDSp4PqCsc=
X-Gm-Gg: Acq92OGcmRk+l622AiiHaM5BrFQNK5LWKhWDHirIA6c5zzeoAPIgzlFKHOwuMn0jWOL
	RRE3rfZiRT8z6zS3Yomnc3dg+0UbFAIl0NxzGq9XZvZ2d84CdBdGfrapHjwnysZCy74OkerCQsA
	X9EazTq6kpgsvsiV650YFop+q1yLd5lwE934rObK32ZqfUWF+zLEWhmCcECAtPBlLpMDftuRI6W
	/fZxV6F2CtyvhGoNlFmlMl/qu59KklTW+i6TduHwFg4nz5lDLEBfk+62kf3+OoXcSBHIByby/qK
	Zc4TVc3Wjrz4zvYrUZEeNW6cb1YsaDJYnhJdeg3xRN4DyXPYsmw7Sjp8IRQ3lCr5rDaAMT8Ezh+
	LCWtAu9SYIqLHkIsWG2waWd1I/onVLqE9PFrqMWCuO4vcOAsuBXJBJJlXVATDa/yLc4Y61z8g1D
	eBFQ==
X-Received: by 2002:a05:7301:9bc8:b0:2be:6f30:f2f9 with SMTP id 5a478bee46e88-30449187ebdmr8694368eec.26.1779784258982;
        Tue, 26 May 2026 01:30:58 -0700 (PDT)
X-Received: by 2002:a05:7301:9bc8:b0:2be:6f30:f2f9 with SMTP id 5a478bee46e88-30449187ebdmr8694356eec.26.1779784258395;
        Tue, 26 May 2026 01:30:58 -0700 (PDT)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452230dddsm12836615eec.17.2026.05.26.01.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:30:57 -0700 (PDT)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: wei.zhang@oss.qualcomm.com
Subject: [PATCH] wpa_supplicant: Handle invalid op_class 255 in BSS Transition candidates
Date: Tue, 26 May 2026 01:30:48 -0700
Message-ID: <20260526083048.4122860-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a155a43 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=yaAG3qJ-AAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Q4UAZ6X0s4pUPLrsseAA:9
 a=vBUdepa8ALXHeOFLBtFW:22 a=oLVlbjkABFOu4cUI0CGI:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MDdD12J2ob71JaHa2wVFy8gXSigzM8VE
X-Proofpoint-GUID: MDdD12J2ob71JaHa2wVFy8gXSigzM8VE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3MyBTYWx0ZWRfX0qpAG71KuGi7
 NfmLBcRUrDyXFqK0hH80dmvvjNud9eY8PAWCV6KF/Uvs26bi2XgWoyTJ4HKmOhsK3UdP6yYIUCB
 yt387HizuxxfwCINogYpWD5OlIfqcBso/rCvLVbl104z5Bp6hAIfvTpqmb+NhQO1JDE6ssuMRb/
 i2Rj9BWZT0VlXGQ+pFNLdbUDVKqk+tgBqcHuRbXtAUQx58iiRsWh1nMm0kxvIUzpDwdWcaxM5wU
 AxH/Ky/ukK/Rj1TxxyhLrlkY7Mq03g6ELAE+vr46I+ZlPtNzErE2m+hQKjZmmJMECtzL1l+243C
 Ah0FgG0sNh1TBCfw7EfS3GaRm7YgsSdVVpUdHJPV9cBWxbPQHrOtD7lFGOGya7OoP3VGsQCad6a
 U3RLQApV/yGJxMuN7kFtdPla1aOemas0DoHJHO54JAHrrdHWAEcOS1lG14AmJIDy6+Y1UtgeYVB
 m+x56g/2CmCLMfL+8Gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260073
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 10:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237596

Some APs provide invalid operating class (e.g. 255) in BSS Transition
Management Requests. Fall back to deriving the band from the channel
number.

Without this workaround, invalid op_class values may trigger unnecessary
full scans and degrade roaming behavior with non-compliant APs.
Standard-compliant cases remain unchanged.

Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
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


