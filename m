Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D5CD68BD7
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 03:05:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32649.1766027107145454531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 19:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TUq6OW0p;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=H5a6Hqvh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Yi9o167740
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j0lBhvUFrih
	/OQnI4FXgkECWDQLeEH57QUJZ2bhzHnY=; b=TUq6OW0pOYjlqcJmBgpv8DrAunU
	qTKdWuXLBitElwq1oxCBeAPcHozf9D+VBK8Zvqnj0wCxVgiV4Fg2jtzPo7xiB0/B
	uUkJvGl7hl3rLFNvh4Enw9Et2gWx5wCWfvqRoA9iC9orN56XwDO9SqwGOUqb9N6E
	dYcqW65U8WehCEwGu0si+Cj+w98RuMvtZ9GpKEABzFyZ5taZBRfsfc2yHYnhHafB
	GvGWO3JjutNZWzS8MrN6Fi0Kc4D2Izizn2YibrAFIuKOqPOmxMgyKe0FqbKCrFMA
	TYxwJj0cC+kcnYY2GYPgIlrvMmfkefT6UH2qn6B/7bJbly+DjQDbTO3GpTw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45w50hst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:05:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c1df71b076so503634b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 19:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766027106; x=1766631906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0lBhvUFrih/OQnI4FXgkECWDQLeEH57QUJZ2bhzHnY=;
        b=H5a6HqvhVhziBuLCZq5WvPxcne+7WLltmN4IcG66h/jt+wGviRSWGeQ5ZtMu9v5n1J
         WTM6tyRSyL7TKy5e7Bl8aGXiGzMeWaUQ7yPe14ft25EDdGeb8EmL/YwjqSS2QjDcBlYL
         LdpcrGEuVfg2lEkvGr/zTvBqhPC/puXJR7aU/aQCEgwBuqmq+GbW9Dv6M4Nh5oNG5aL8
         d6dIMCY74H6A9xx3w1SQCuNAXCKEYemaDPfwRIHSVsIbOtY04/LhtJDcajXy4ZxDaZjb
         nxmWuDEpKjZfBnRgwcMgp/U9eRkp3NZtFTezDGo1apVHLaM6ShbSEWGk4x2rYJ0q4UGd
         eblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766027106; x=1766631906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0lBhvUFrih/OQnI4FXgkECWDQLeEH57QUJZ2bhzHnY=;
        b=jYhSZoGkUPK7Nq4lc9kREhPL1nMgPBCqn7Js3o9U5P7yylmTxk7dZOFaSQgrG95usz
         UZUX3vQAkkiXeMu+5/V2gYidWq4u8GpVUflh33PujsWKZje7nTVfL/zqj007FFH8iHmd
         dh1GMVPPvue1wV+Ovq1WchBqKTP/FFKJ03Npg6TPnD0Qc2LFUy0UyzSU/PBP+qdSPMS3
         KObGbGKXtggo+lQuLTWX7HReiPtV4WVUblq4i9fXXIiCBJM6CmK2IaBe73/nJBdr1xUo
         BvV5BKQjv6pltfq/6RXqG/2oLEmwYpwW7kJStXY6Vle2WOJj6CXiEhEbVbeMCnZac69n
         D4MA==
X-Gm-Message-State: AOJu0Yx607r2sqGMFTEbp+cgaUmFS5iOJ8NixkNwP7pSGD6ceeiqnaoX
	JMibj5eAdQu3URtR6HmsKfU+zikkxIoHSEx6fYYdfQLYGloWzRi7sKcov5xdrFWQ9XFnebU4wSp
	oyA8OvQXsyg8uLi+XA9gtWtU7CO3FvfswUzmwC4T5aMPnzKy8J0T2Y6N4l76PMUiLuC7x79M25f
	qPIft83l88hilMtGiH4aev
X-Gm-Gg: AY/fxX5/cbiKyHUEGRl92ZiuMXG43ccMIXh5DLmsLg9Hrg5bxkIK01L/UQv/jf2SC6p
	Yt/YLdmIzEHjUldCj22pMd9yJokS84i+OI2cVnhePP3lbJRuxGJyWANBJCKOS49aW1bncM4eI8x
	ZwFoZO+AoKNqH0O06XjdsOHltQymsJZOeD2IqTZH7VNsyL+PDxfDkFcGn1elm3svsvUdYz5GNKI
	41PPO1tVicvRlAyW+Qdv23iOWSs3e5URA7VbqUGEA62v4xlU0t7sgbuoBiDPTTRQj4goMzPysdF
	5G2s3PuHaLqGRdUHIUmA+ILHNrVvWlVBII/PTn6NyOGalXtF5E4ICta2Z/hNg4UbsdlGe8V3Vfj
	XKeyWrpZtxFP/W48UeRxHBEmlb5dc7+GcErBjvMzKuGeHSMs29+yGywr4tXlmC3dJ1APi
X-Received: by 2002:a05:6a00:bb84:b0:7e8:4433:8fb4 with SMTP id d2e1a72fcca58-7f66a07d2d5mr18061540b3a.60.1766027105641;
        Wed, 17 Dec 2025 19:05:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBGhQ9koxzy4Siu1nlVVMAiHckCF9J4dk94wvRskzEG44If4cSwmYsZ3J+dZwZ0bDQVBH16A==
X-Received: by 2002:a05:6a00:bb84:b0:7e8:4433:8fb4 with SMTP id d2e1a72fcca58-7f66a07d2d5mr18061503b3a.60.1766027105149;
        Wed, 17 Dec 2025 19:05:05 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe1456c760sm835782b3a.56.2025.12.17.19.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 19:05:04 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alex.kanavin@gmail.com,
        jouni.malinen@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v4 1/2] wpa-supplicant: enable OWE support
Date: Thu, 18 Dec 2025 11:04:47 +0800
Message-Id: <20251218030448.1505377-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218030448.1505377-1-miaoqing.pan@oss.qualcomm.com>
References: <20251218030448.1505377-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Wqw1tZaMzZKJx61JTiCVs1FdjkhYoc5G
X-Authority-Analysis: v=2.4 cv=eKceTXp1 c=1 sm=1 tr=0 ts=69436f62 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yaAG3qJ-AAAA:8 a=EUspDBNiAAAA:8 a=tTbll4gv4TxPgx-dqzAA:9
 a=OpyuDcXvxspvyRM73sMx:22 a=oLVlbjkABFOu4cUI0CGI:22
X-Proofpoint-GUID: Wqw1tZaMzZKJx61JTiCVs1FdjkhYoc5G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAyMyBTYWx0ZWRfX7acESOlbepQw
 Em7sT/QV/OBcrsVT9b/nRBqSf3y7pfuVburVsz0D5FWtvbz3r3h+VQAopROKcw6HPh4Vmr6ZBEc
 mHI8IfecYUTKDRRsT2nIbD58qdEnKZQ1TFOEUeNpq0y9gFL1iBwG3I/cZ18gC4r3/K+3Pxl067X
 klxMx16Q64iLCnxv0SrNVKzDUPHp8i/cwRk9Ztz39Jhk9KTGEItZRQzhM1bGVTCp4rzwILtZbed
 MEkgUerpjuVeQnQJGQPBcfUq8YVRhX/bUYEDkDPjFRuRwkpSPyaz9TwpFp2JK/Kx74bTBD1U1GS
 7xR9V92AXZGA4wGYzFqjU6Ruc7L4aA0mrh4r40QgmxDajofihFgV87AOQ+QL94aqRqLqaBJccqx
 9dRE209iEPtv19GtwWzyi36m/BrFhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228082

Enable Opportunistic Wireless Encryption (OWE) in wpa_supplicant for
easier testing and examples by setting CONFIG_OWE=y in defconfig.

OWE is standardized in IEEE Std 802.11-2024 and specified by RFC
8110 (updated by RFC 9672).

Disable OWE when PACKAGECONFIG selects gnutls to prevent build
failures.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 ...-Opportunistic-Wireless-Encryption-O.patch | 39 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |  4 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch
new file mode 100644
index 0000000000..7311b76b6f
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch
@@ -0,0 +1,39 @@
+From fb043a27324ba81502b8986a31222f38aa414bbf Mon Sep 17 00:00:00 2001
+From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
+Date: Thu, 18 Dec 2025 09:46:03 +0800
+Subject: [PATCH 1/3] defconfig: Update Opportunistic Wireless Encryption (OWE)
+ state
+
+OWE enhances privacy in public and enterprise environments where open
+networks are prevalent. Enabling OWE aligns with modern security best
+practices and supports the testing and development of OWE-capable
+devices.
+
+OWE is now standardized in IEEE Std 802.11-2024 while it was originally
+specified in IETF RFC 8110 (updated by RFC 9672). It is not experimental
+anymore, i.e., there has been significant interoperability testing and
+there are deployed cases.
+
+Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=39db92dcf301793ce45a8ebf85c425f67c670058]
+---
+ wpa_supplicant/defconfig | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/wpa_supplicant/defconfig b/wpa_supplicant/defconfig
+index 52befd8..044604a 100644
+--- a/wpa_supplicant/defconfig
++++ b/wpa_supplicant/defconfig
+@@ -638,8 +638,7 @@ CONFIG_BGSCAN_SIMPLE=y
+ #CONFIG_BGSCAN_LEARN=y
+ 
+ # Opportunistic Wireless Encryption (OWE)
+-# Experimental implementation of draft-harkins-owe-07.txt
+-#CONFIG_OWE=y
++CONFIG_OWE=y
+ 
+ # Device Provisioning Protocol (DPP) (also known as Wi-Fi Easy Connect)
+ CONFIG_DPP=y
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 6ba10a8ca9..50f16e935d 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
            file://0001-macsec_linux-Hardware-offload-requires-Linux-headers.patch \
+           file://0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch \
            file://CVE-2025-24912-01.patch \
            file://CVE-2025-24912-02.patch \
            "
@@ -45,7 +46,8 @@ do_configure () {
 		echo 'CONFIG_TLS=gnutls' >>wpa_supplicant/.config
 		sed -i -e 's/\(^CONFIG_DPP=\)/#\1/' \
 		    -e 's/\(^CONFIG_EAP_PWD=\)/#\1/' \
-		    -e 's/\(^CONFIG_SAE=\)/#\1/' wpa_supplicant/.config
+		    -e 's/\(^CONFIG_SAE=\)/#\1/' \
+		    -e 's/\(^CONFIG_OWE=\)/#\1/' wpa_supplicant/.config
 	fi
 
 	# For rebuild
-- 
2.34.1


