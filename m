Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283FFD116F9
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 12:46:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14178.1764167958598314257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 06:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=H9L+NYRz;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ixRQP/l3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ9L2BD4048393
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 14:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3P6Pk8Elyju6KTtYglfJ0ixL2nbiqbFwttp
	cig339WU=; b=H9L+NYRz7jF5cGkbIKBb91PH3FlW/s5Q9MTVYd4FO3FsQdLeQbs
	+DASl6VnnZEV6X2eIyd84hYTgQyotcFsJlzC4sOr3F2xChbiEIUHww9z5H1DNMGX
	tonkkWP2aKXZVHTxjaDqrIyrUYFpsXbLYZ3Gtqdf7GbfODlYQgUzatvSs8zTyBJi
	pKxEtmJqLM2R5EVcVmYdyXaiR0g5IGpf4O9fn4EAhtQKL4HXkxl5XfEGEp7iEW7G
	0Tf46n5DGHEtlrebov8kM2DYScfOq5TQF5SjEVKBtfFwCaKIhnYSi8Ny3YGYtfnM
	vBJxY3tJGbacDrTTAGa8uiLJtH/NhEcAIxw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2nj5y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 14:07:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b9208e1976so14078195b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 06:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764166043; x=1764770843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3P6Pk8Elyju6KTtYglfJ0ixL2nbiqbFwttpcig339WU=;
        b=ixRQP/l3UtsYR5VEoIqfGeKOHbMAe9EBj0YcZz+u2LMVq5wDJ5N3Q8KBrqAj4tpQDd
         m3ALwxarp+dsCyqQmbI01Iybm6jlQHiacsanShB5wMiEyYy3yjR99WoiHKzGnoa5/PyL
         aF/CW3WBdy8ouoM/r6OYL0LbdVW7lAGC9T4NnkVvsLxmcKIq9CcCJC+6Zzvr0rTHx6nh
         4wqOUOOR1Qg/hAl6CQHTL+p+paJn/X1q73Utd+40qHm4v0sRiSK3SyAJt0vlv1FESac4
         Ne8V2HBO1uLoq8+jbpo9Fnr4VDRLSoJLQatzJMD6r6mc04DNbJ/GuyPi/By22AzekdRL
         RyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166043; x=1764770843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3P6Pk8Elyju6KTtYglfJ0ixL2nbiqbFwttpcig339WU=;
        b=PkJmsoTkgSzcn58Lzp1/iIr4wCYvO4OoXWAdrSehrTenWiQpcbrxWvXp4f5+VLJH5B
         GYSZO51OnmifT04PZr7tpyl9EzH/lJRXIP0ZMB0jmspfi2vzDc0Xdr1mpZmy8yjSsD97
         XpqjLpa4UexgNG+smNHuJVnKEj2wR9d4DRmUz2/4itzq/6skhs0JoqdjUc/qATe0BG1h
         OFM/bVZIqnE9PSoZ/qefjFwlk24FeeMaCE1h25FI9bLm9jCrc7NKgSLas+NExI+FIBi7
         kzYf2olz0YrTDdF6TF6CCalPzv13npK1NUEonjzVx+WFEjp11Hoz5rDUr10yMNiy+oaa
         V6Sw==
X-Gm-Message-State: AOJu0Yxs1+GvGCavqor9om1CUY/kRKdmG1KHEMNCsTnSU10T1P4+c6Pi
	7xSDLdylhcwsP3bqCsm4rVF/RpFFJHR1+4jn5ouvvwQRddJrC+yTrKInh/A1Qd9bjKu8K5mvOp+
	wsZcTHQi9DAMrx0HGthbAtyTcHqPpTAQ/uONVFJcmn0KaF4I7dRZnPQnMCrEESOR+izO0eR9VjD
	8mK9sN49vV6DGaKEs=
X-Gm-Gg: ASbGncuum67ulfaUH0iWfbcUmb5R7lO+OfcuHZF8pnNKMGlJFZbYDFRgAnX1zvvBV/u
	GW63EiCAj/yzUiwApBDx7XYHqiRYkUZInJHAeXIqEuoVaiEFXiIijdTJYuuqlT0KzXx1jW9XdZ3
	gIm7fa2L4YFOstkkph36ae7fGiocjxbV4UjVwxZ8JrZBpUDHIS3LC564l2yCCl0gz6S/DfIEalo
	SnFM4Yk1z/kWAzCwrFPXETjbzi/zmmECsOamvtr9P1pYI9Z/LUHWOXJ3TmjV7pLy2vKKcjbsuTM
	8lP4pl+8Nz4Z9AaAIJs/33C2pCsbpMwZnNhQT76xkkUyic5jFS6MSTVvE0IcZr+eaEHhCeloGuQ
	sk8AKtnkQFD2aGL7vlfMLllU25XWVf217Y3hElE+/oQxWTFBXz/QG+T2TT7rLBJgQxvwh
X-Received: by 2002:a05:6a00:2d0a:b0:7ac:3529:afbb with SMTP id d2e1a72fcca58-7c58e60bf78mr19062819b3a.20.1764166042495;
        Wed, 26 Nov 2025 06:07:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGzAPmb7CY9AsbKbJsUxo69R8PFQYUxkoQ+I5upH1c+smt/994zGXST3pVv5/vePf09r0MnA==
X-Received: by 2002:a05:6a00:2d0a:b0:7ac:3529:afbb with SMTP id d2e1a72fcca58-7c58e60bf78mr19062773b3a.20.1764166041870;
        Wed, 26 Nov 2025 06:07:21 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63dbcsm21624961b3a.50.2025.11.26.06.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:07:21 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH 0/4] wpa_supplicant: restore defconfig and enable new features
Date: Wed, 26 Nov 2025 22:07:09 +0800
Message-Id: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=6927099b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gQ8M9uwLrIa9jTmwnTUA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: aJW5KystR60z4jyE6vFzfE1ZMHEidVXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDExNiBTYWx0ZWRfX6rSj9M0YhWmt
 QJvCVpAlMHNKc04fv1bAu1CJnnSpXXT2YjjvMKjcrisMRdxP8ngm37yEmrN7vhWMDmZrV48T0+E
 znI2K6mVqKYXP/WC5oQm5k1zYcQU5jL5IiNxoRD4b+LQeNWtO5kTUEYAvdMqWa2ugqvBaxjEbKr
 /oiNyGap6kM1BXEHYCox6Vp+fULUggfpCJCrxj08hc3maLD/GYBBpGKCfEibK0uiqSBglCn9GIR
 JISAkkkJ7xEXMvfy0pEtfVtZSjcRBSbX0Y2ZpkenOAfftcq7lwNU2ll76RoxoXI9agM9vmYomiZ
 Ef+vZPb83iqMBn1WoLxZkoWXlYDQ3Mq2rLmtAKBMlz5hjr1/0ZZni8al5IUPY3Tx9viQtQv7yZh
 GuGExkGCyWLECVnHsFUcqaZV6ucU1w==
X-Proofpoint-ORIG-GUID: aJW5KystR60z4jyE6vFzfE1ZMHEidVXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260116
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 12:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226841

This series includes:

1. Restore use of packaged defconfig.
2. Fix sed indentation in build scripts.
3. Enable 802.11be (Wi-Fi 7) support.
4. Enable OWE (Opportunistic Wireless Encryption) support.

Miaoqing Pan (4):
  wpa-supplicant: restore use of packaged defconfig
  wpa-supplicant: fix sed indentation
  wpa-supplicant: enable 802.11be support
  wpa-supplicant: enable OWE support

 .../wpa-supplicant/wpa-supplicant/defconfig   | 688 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |  12 +-
 2 files changed, 696 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig


base-commit: f0f7632595792a73ea0a935b924e8bdf9954ec7b
-- 
2.34.1


