Return-Path: <nicolas.dechesne@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1890CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 16:50:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2353.1781628606445898876
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 09:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dlis+18d;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Dmv5psj3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: nicolas.dechesne@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFci6r1004540
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jCY8+erPWGuXdZ64+NXGjuyO0kTZc0s8ibd
	CrnRROio=; b=dlis+18dUhKcOYQpcwR4q0IvHosLsdn1Sq8JusaC75x+WTG4mKh
	f3VPmHQglNIEFxDG9YJa/h4DSBFRr0kxgzmRMzx73rdCq1/b3zYHej2fTSCiq3sb
	34zvXwt9kEd+KOA/Gal7TNbHnGzEkbho0u5I5zpwkCpqtH00ncBzMqMWqq681ZrZ
	TWyPWy1paSsn2xoNWuNpm+ObhTX4Z9Frug57dCIFBj3bDbKU10d4mz2DT88Ms0Ko
	BvGY+nWmp2Xh/76ZXzA2bMLubjoK51tRm1nmtrqBGMNe2s8Ah7bkLLgLgPCTvcvF
	uRfeQWoOUU59co1pKkeG174DuGmDAvNemFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xsab9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:50:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9159bc52211so502335985a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 09:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781628605; x=1782233405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jCY8+erPWGuXdZ64+NXGjuyO0kTZc0s8ibdCrnRROio=;
        b=Dmv5psj35/8SBrsyzV6CNIKkYfBtPdyOuNs4jBfCKz1OUDPuqDn1FYX8Z5H+kUiP4R
         cLFTmycrpKbl5DO06Htr8Km2UXfc0FkSe/vwBC4ZNArgy+0WOBJDpQt2lazTyz5+Ls62
         kiOJHpR/9QaBzLwQBcBpkL5SxBVKR7MBKPTJvECxp21915QguZCWC6s6o+rzIx9EH4rI
         LlN+jlGlMm1aX43rqIcbB8FbydWKyoVTyZE9E3YeYiz1TzZU6J3/aLhk+W/IMy518D/2
         TqUj3KY1qpLVSicCjKchdiYe24b5w6gN3E7pvhKkUN1YhQCdYy/OLHW5zhv6MypkjChl
         xTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781628605; x=1782233405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCY8+erPWGuXdZ64+NXGjuyO0kTZc0s8ibdCrnRROio=;
        b=b1hAHpH+UJ6VqOYlC7WK7jVkjWwUltKCpFMdluR94r6/DHMCYEzjnXo0IucOcWlTzA
         zsv9fIo33kPp7J973bb4KYWWjfbukArZMqanZ4LvQL9zvxblPdLaaPceUN96NAqWy1B3
         4jrBA/adANXvnTh+62jkASbq/hRHKFIBtazLS9103KNw1uWewHrhrw/ZzGz4simrQeWu
         GDi3ZPAM1M3cto9mzsYkGSzjm9/woKhrJZfItBQLmwBegK61bMFmnFbFxBVYwi5xPmyW
         X1OkUBEOOgb9YPGTTCO7aFzFwwL0VeV35D/uQmslQ/xYePUZLe1TFlSMCT/VksGswikd
         YacQ==
X-Gm-Message-State: AOJu0YxpdsmQNcqQNqriGD5y6R2x5HbHzVQpfXwDZduR1IodaV3E+QDN
	KtiKHZwoUAD6Dmt0WKVWysUajk1aK8jxoYcQIxScBWcaSqFIJguJBkG5K7Hdf45aAbMTyP3TZkX
	eJL8JTBZauvfLd6yl38VZpsdb/V7dtPDz2HqG8nlGPIl54tqcvd1SIkJDy1oEfPwagTih4ZpyHa
	E/1su5KYjL4/mkXm/3bw==
X-Gm-Gg: Acq92OGBu9nFF9I9t00XZI0EWsEh8b42+lWeLYquoEGgwrD5Twt6UF+q0C0Ok2TmLdj
	zdr1B1fC2FwEoQYfEh94aRgxQvDAwmx9S/iGTWc+m1TKaEkKrwfVIvSe6mTioU3lKRl4D4EAGUm
	Cs865DrNMBTzNal52eCVFCPLGMMmqWoAkQZ6nyjSUg4Pe438nZt8z7/NcCVZKcvM6VkUdXaIKL9
	/Zi/TZGE+zxrEJrUDPeAhOXDWOibzOGj1GmJjQTaOd+WAwvEpl4VonWVYLbhyO9xRtNIM7bZSAO
	7dKTcqRAzxIqQzWLUTHrhON0+dTAFrz+lBardJgj1yuQ7Xjczdx1APj8G1ANe5iKqOkfG+muktY
	d9m1xowIH4psbl+Amtr4+nRLygsL6Gmh/hQVkfAjxHziItZsIKX5PP/EJDQ==
X-Received: by 2002:a05:620a:290e:b0:915:c7ad:8bcb with SMTP id af79cd13be357-91d8d0b9a06mr68155885a.30.1781628604881;
        Tue, 16 Jun 2026 09:50:04 -0700 (PDT)
X-Received: by 2002:a05:620a:290e:b0:915:c7ad:8bcb with SMTP id af79cd13be357-91d8d0b9a06mr68149485a.30.1781628604322;
        Tue, 16 Jun 2026 09:50:04 -0700 (PDT)
Received: from hu-ndechesn-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b54asm5456495a12.3.2026.06.16.09.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:50:03 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
Subject: [OE-core][PATCH 0/2] alsa-ucm-conf: upgrade to 1.2.16.1 and cleanup
Date: Tue, 16 Jun 2026 18:49:57 +0200
Message-Id: <20260616164959.3399737-1-nicolas.dechesne@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jrfb2yKJV06_U0HXGG8l2QFrY-6ZSQjI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE3MyBTYWx0ZWRfX7N0h+Tg4OmmH
 u97lldybpbPduC8/vgbG8fB9Db1TK/F98u8jXOLVh9wP/9wJ6W/x3pdWmaQ0ygmOR4vaXZi0qPG
 i94c6qqi3DW0HgOrGoeiaS8mQ2DDdyOzjkEJCT9a+gv7spoa9jKWnHHZac9xEG2KE4oO2e2qgvb
 uQ1HaDQntkBs0xjDYiUjz10RdTudibpvj6KMB+eKnQXOsQo8C+2eaWEGYQebPbTt5Az3Skdzir4
 8gmi/bqoX3FMu3Idof+0lPzsYWO8yZkWGMKRxb83A4we0iDBp4UPKA+HNO7AVB5RbhOOMO/al+d
 vvclCv4HeDzzbs4axDn+2OCsBbVDl36z5U0XhHbeAeKkqUwPP4uf++HgEWuxTlfgRjZAaEujaRD
 JNNmiLc9OBKUtF4miHQVzBPSkekxDtTy5IIAUD5uxBdgCr/RWQJ2Q0ISDDCdWJqjkbHepSJK9Ih
 qUp4qVIzDqfDxCKQvVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE3MyBTYWx0ZWRfX8I6q4TQqgxD9
 o4LMDZnD98oKgkhCLzE497R1z8q8UN86yRkfUQmtOLt07XcnO+CyVQ2RyIKzcPXEkZ8SrVNwXsd
 4UzptmEN5HPTmetvtIcXqodetTW18us=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a317ebd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=o1bLzqqXV-JypJ_HqhkA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: jrfb2yKJV06_U0HXGG8l2QFrY-6ZSQjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:50:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238919

This small series upgrades alsa-ucm-conf to the latest upstream release
and does a minor cleanup.

Patch 1 upgrades 1.2.15.3 -> 1.2.16.1. All five local patches were
Upstream-Status: Backport and are now part of the 1.2.16.1 release, so
they are dropped.

Patch 2 removes a stale comment that has been carried forward since the
1.2.4 -> 1.2.5 upgrade in 2021 and is no longer relevant.

Nicolas Dechesne (2):
  alsa-ucm-conf: upgrade 1.2.15.3 -> 1.2.16.1
  alsa-ucm-conf: remove stale comment

 ...mm-glymur-Add-GLYMUR-CRD-HiFi-config.patch | 104 ------------------
 ...Remove-JackControl-from-TALOS-EVK-Hi.patch |  43 --------
 ...8775p-Remove-Fixed-channel-setting-f.patch |  32 ------
 ...ADC-switch-in-HeadphoneMic2-sequence.patch |  47 --------
 ...s8300-Remove-Fixed-channel-setting-f.patch |  32 ------
 ..._1.2.15.3.bb => alsa-ucm-conf_1.2.16.1.bb} |   8 +-
 6 files changed, 1 insertion(+), 265 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-glymur-Add-GLYMUR-CRD-HiFi-config.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-qcs615-Remove-JackControl-from-TALOS-EVK-Hi.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-da7213-Add-ADC-switch-in-HeadphoneMic2-sequence.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.15.3.bb => alsa-ucm-conf_1.2.16.1.bb} (56%)

-- 
2.34.1

