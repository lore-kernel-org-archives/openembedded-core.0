Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E819D68BD4
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 03:05:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32646.1766027105028038375
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 19:05:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Hhbu3ca1;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=cv2/60Yk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1ZjwV2016408
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3VSwfngqTGNyhFmj2eAI+PS2Jdx8rdHT2L7
	xUaux+JE=; b=Hhbu3ca124DkCW/ft7HJRbGPci0SeR4c4mcGe7ntGYRXeL9LQ8j
	ccT2iJf50gdd5gQeRCDLM8lnOLUR0LaaK2eXISgCs4GMLX6Jf8tZ/vMM/NjvEgJH
	I6WEPBPy2dg6+ByIxjc02TXvNd7EGkquiQ8ow9EQr0cDheJBqOOqe2YaJ7dCYjDf
	nseS9T9fvMAh3uoLvoMWjX7LuYQ5GSQs2Mm2WRaXesxarP1l4YrF6qvg5LsUYt22
	64qzUuiXOlNENZU32AbfB48gM0lH/cpfSvRwx5EG472WSmuVcDnhIYTztXEzSJkh
	T2v2/NJM+kbAkwbPSMQojbkeWGOQWYnjuhg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e2uye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:05:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7baaf371585so769594b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 19:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766027103; x=1766631903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VSwfngqTGNyhFmj2eAI+PS2Jdx8rdHT2L7xUaux+JE=;
        b=cv2/60YkzopAZfxVBCcoWjtBANRo2xfPNqVIv+28mo3iiLABIMdmKpAGgMd07omt8y
         BrSIFVgTzKuOTP+YjfrznOGfhFX7IZwXbll3zNMIk2/vpVNoDQORZxdjwjMFokaWlrAp
         uFmVqEddubDRIULUzWAS1jCS6QJVebmhP+ysSsmL9YTA6hKhXvYHjYic2DiM1q2DF1u/
         C/9Qpihxt3+PJ38siLjqzeOghQnZIdmyiqBvwlPGDi0TVIJPJuDgh8Vlu+dal63hCbO0
         qSh/p7nAEHCe4O3gkoH0XPvXhiy64GiBCYHbf7KWsK2f+Z0oK+WWqDrwD/xK1Qwd5Dqp
         RpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766027103; x=1766631903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VSwfngqTGNyhFmj2eAI+PS2Jdx8rdHT2L7xUaux+JE=;
        b=YZnFc1Glbn7AiPO4wIqWDaG0g497CIk9Lc3bJhRXW34H2y4fJyxzrxCJmN5rTpl4KQ
         +VTte+RHpHSzWHctYuvnmnne+/1GoEIByiosD7/zJjfM8JY18cvtySOYCUbeMC7fTZ7H
         VeO3tr4z6gmuJrnDmS5/8oRzntGjcF5TLqXUhBOU/EMnRvhfGcPboO9CVqPYXHYiaZKN
         BLGyUvE+4qaDU9huiFssE937zZr6negVKUNWGbWHXG/fen0fNyAn58p4hHq43bs6CQmo
         gffYWi6i8ssZXQkLNxgxQpET7VLUlqCSuH3I69/GQlsB/Qwib+OjKlEcrbHkJU0Py06H
         GN9g==
X-Gm-Message-State: AOJu0YycIQosjU2QbzyFouu/BWGs1KaTCWJjBp5vsvAWKxjS4XRN3mvv
	TZTJg3IMUdhXPPbk+pPZRZnLcsMhfTAXYLyQcSdbaHWY23bE9kxJKvfYSC0zYB0zaLT94gT5mt/
	u3bulH6hGwkkw2YOlKmbL+Wkp7yQ07h4QOhrR0DLgwise6VKcD38hipsNAjdBVNIMvDldrMlfLS
	59eMWsUgINsBw/rKDl+PPU
X-Gm-Gg: AY/fxX6M82EBi5I7OU39QL1Hx2GFhyCdoKwGtF8lttVFvH+PbIRTXUv2OGH8MpRiahA
	EtCpBQAR3T+MYIjVzf9XzYVdKKDHadIrNuniWxrrqNycXE5Q+UOMy16Buk+UpE6LXMLH6XywSaZ
	qfZPnU6XKV75roybAcKTK+p3K3gxbRI3Im4NgTkUzNlVHKCsvalCaJ0iPpg5NuzuYc7V3Ks+/dP
	OA2FwJbDLRNdrzdypq5K7MUVDySxY1aZVv235m6Lh/OpSTQc08UxJGZNtAU1ULklqyF6jihhVSP
	HfBEoWjxJTRBTVQVIgQDBaGzW+XOTFs4orAf5N+XpogotkqRXUIx+GPHyrBekwowevxcLpkHEAn
	MZX1coruUeSwJA0L4M7+5RRHJN5exJBS377rPJEJSdAEpiRoGQKRYYU8GfpdY9JFlfte4
X-Received: by 2002:a05:6a21:33a5:b0:368:9449:8364 with SMTP id adf61e73a8af0-37552ca4478mr1432782637.9.1766027103354;
        Wed, 17 Dec 2025 19:05:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqvNODJqUvAvBbjxcAN9+h3lhulO3BAGtGYge/3I/1whdDi5hDQ34rsjAewZuDkaYKy/hxpQ==
X-Received: by 2002:a05:6a21:33a5:b0:368:9449:8364 with SMTP id adf61e73a8af0-37552ca4478mr1432763637.9.1766027102819;
        Wed, 17 Dec 2025 19:05:02 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe1456c760sm835782b3a.56.2025.12.17.19.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 19:05:02 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alex.kanavin@gmail.com,
        jouni.malinen@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v4 0/2] wpa_supplicant: enable OWE and 802.11be
Date: Thu, 18 Dec 2025 11:04:46 +0800
Message-Id: <20251218030448.1505377-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAyMyBTYWx0ZWRfX1cVQwe7OLGqz
 DdwWMJ0edNuQ1dWktVBi/PX2+PH5BxtyhBBrA+qBBpfnHqocDK9dAxKhmbDNvWyI7KQwKJzVxJV
 jnc02beVQ+hJVk4wRUZAn750a2rlgEt+tmgShonq6MRPwxZkISaXq+NI3T0spXwuK04cYYLD61b
 8iy9splHEIMYH3fZ2Jz4y3WARYO0UxdWtYxD6YqK8060iPQFl2CXSaLZnmLu/Y/G0IgnCcF1U2+
 +KJLJ7BqGbBsHPVLurFxsBAVxeJMhfBi+e5f3e0J7lJrHx8Y2CMJAbHc02V+3Z5GuHg/aMVpeoU
 MmG04XH4e3dABWYsEuuVwiDs8OiluRnrshpTUlLjjA2YATX9pyahUABXnEtmXvvQWCeWObdvrwr
 HSqjWWEyy8dFMS6fjPf5jj7QroUpHA==
X-Proofpoint-GUID: LNyumnxhMhzh_yQ3W9ljHmluOzhQerBv
X-Proofpoint-ORIG-GUID: LNyumnxhMhzh_yQ3W9ljHmluOzhQerBv
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=69436f60 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=B1kE_lF1mUeZC7TXkE0A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228081

This series includes:

1. Enable 802.11be (Wi-Fi 7) support.
2. Enable OWE (Opportunistic Wireless Encryption) support.

--
v2: Updated commit messages.
v3: Remove outdated comments in defconfig.
v4: Drop restoring the packaged defconfig; Upstream configuration instead.
--

Miaoqing Pan (2):
  wpa-supplicant: enable OWE support
  wpa-supplicant: enable 802.11be support

 ...-Opportunistic-Wireless-Encryption-O.patch | 39 +++++++++++++++++++
 ...nt-IEEE-802.11be-as-a-published-amen.patch | 34 ++++++++++++++++
 ...onfig-Uncomment-CONFIG_IEEE80211BE-y.patch | 32 +++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |  6 ++-
 4 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch


base-commit: f63622bbec1cfaca6d0b3e05e11466e4c10fa86e
-- 
2.34.1


