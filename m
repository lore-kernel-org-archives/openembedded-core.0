Return-Path: <david.zuhn@sonos.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399C8C4707B
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 22:09:16 +0000 (UTC)
Received: from mx0a-0003c201.pphosted.com (mx0a-0003c201.pphosted.com [205.220.171.22])
 by mx.groups.io with SMTP id smtpd.web10.2571.1704751753669835461
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 14:09:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sonos.com header.s=pps1 header.b=LHxEBYzb;
 dkim=pass header.i=@sonos.com header.s=google header.b=GMeohFZJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: sonos.com, ip: 205.220.171.22, mailfrom: prvs=7737ed8f84=david.zuhn@sonos.com)
Received: from pps.filterd (m0299972.ppops.net [127.0.0.1])
	by mx0a-0003c201.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 408H29fw031115
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Jan 2024 14:09:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonos.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pps1; bh=JVEoTV475pZn
	Q3sNrP8GfZIQoOenrnefDRqOhOvPrhw=; b=LHxEBYzbxgVIodt3DUID8xmlQgeY
	VM5cbrKZ8mtUDXg33/r9fhrMkJ3meQRXlnnIOattizb28ZhwdtseATP0ak7JNtzI
	doAoliA0chff2k0wWeV+3KkRuIXHEfTHAQ8D15y77N+9nFUbzAtBkqNS97B1B/ZV
	WZsDo19ZRv4/nF8LX9X1YmF8aJKC/o8Q4BnTFDEbTRlRMJZWcm9esI1oiGmapcyV
	+gDuKNLMuALPl3Qhd3zpgyIkWLnz6aCv9MGmZFrvoKRKfyTOolSXxQv5X9n3DtvI
	fC8yQJaz72G+LPMcLDEbCLbzoMLTEvAVabF3Zqs7y8EoSifojY6LzYy50g==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0003c201.pphosted.com (PPS) with ESMTPS id 3vf3ag29hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 14:09:12 -0800 (PST)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3607b3406e3so20658625ab.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 14:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sonos.com; s=google; t=1704751751; x=1705356551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVEoTV475pZnQ3sNrP8GfZIQoOenrnefDRqOhOvPrhw=;
        b=GMeohFZJWEAZ5odp0bCyUTxEBI/oR0ToUkF/Ivc4TkZJBZhRzNxSdRYEoQYXOT3Dyx
         sfJKpri1aamigKRreSFMPl8XQv6RrmMRmRJ0cWi5hEd45eICBzt7X5YhHi/yKLc4MqBf
         pZUbKQGacf2hqnhvpg7NurVJmD/what5Yh6yaM7ncVdDj31V1rCgbKZF3cMnEdnE2XwT
         liZvqzZmZs4+H9MhtbEeRndn/iTgTX2XnhcComnLEuH1SErUmvkKYDH7N445Bgw/VOV8
         HjbWmMdjCOY0AaOBp+HhhBbIHwsHm25CdF+8jXY5PX/OTiV+Ewf69XIChUcXXCDXHiYZ
         LJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704751751; x=1705356551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JVEoTV475pZnQ3sNrP8GfZIQoOenrnefDRqOhOvPrhw=;
        b=EYUgDQYZWhdHNbzVNimDffbfvy7wQd34DOS8L5PY8b20pBTs9nVjK1yS+IL2E29SMC
         ADwAcu8T084JrwcUe7PuEdQEKnLDASqnLRQ3DdztTTgHigXTmH251xP236vPznLKs4KE
         QSWXN1PMLXfVbnMEPPVlONYyhMOrnFyQwj1Axi2+Brnztj0CRT8fH/x+CoRVT4VLuVwK
         BZk5uCccksCpmciUZG/Iu7PmZWvXDj/Xe/ZsLHSXasg9J7PLAhbYKXaPOIo4WYOrCR3n
         5mUywaOCr3jYuuGta7MwQ6PErrhVc0IcriWakIQvK/ndib+UnGjMH5BFZdTzQNA66Von
         I2lQ==
X-Gm-Message-State: AOJu0YzOZjDy7l85kLb5AD6Hmp/imVPrjR9pSLckiSkM3KIpAw6D6cC5
	sM1OXAYopUlVGXjhRwmZ54DZfDd6dn6Dzz6AMaT4wWsPkNM/1Ut4uPckFWXNlYhi3eHBXI9Iani
	aMClzGKiJtlTCCyeYxP4gpLtsQpDAqvIJQlRts6L2DSyyWwTVY9u7Hr0G
X-Received: by 2002:a05:6e02:1525:b0:35f:b96d:641e with SMTP id i5-20020a056e02152500b0035fb96d641emr5529044ilu.12.1704751751334;
        Mon, 08 Jan 2024 14:09:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZIDbibn17lnaGTheDu5jIFfASa+m+UgSCKEJxiLWobhTdOKZgwNwgdFwnRtycLfu8ta4cEQ==
X-Received: by 2002:a05:6e02:1525:b0:35f:b96d:641e with SMTP id i5-20020a056e02152500b0035fb96d641emr5529037ilu.12.1704751750980;
        Mon, 08 Jan 2024 14:09:10 -0800 (PST)
Received: from roebling.sonos.com (97-116-45-192.mpls.qwest.net. [97.116.45.192])
        by smtp.gmail.com with ESMTPSA id u10-20020a02aa8a000000b0046dda6b83c1sm225803jai.25.2024.01.08.14.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 14:09:10 -0800 (PST)
From: david d zuhn <david.zuhn@sonos.com>
To: openembedded-core@lists.openembedded.org
Cc: david d zuhn <david.zuhn@sonos.com>
Subject: [PATCH 1/1] rng-tools: remove obsolete build time dependency on sysfsutils
Date: Mon,  8 Jan 2024 16:09:03 -0600
Message-Id: <20240108220903.4086110-2-david.zuhn@sonos.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20240108220903.4086110-1-david.zuhn@sonos.com>
References: <20240108220903.4086110-1-david.zuhn@sonos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kVKRXio8MLAEhbpmisxXeTA3ongqPrFf
X-Proofpoint-ORIG-GUID: kVKRXio8MLAEhbpmisxXeTA3ongqPrFf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_27,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=705 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401080181
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 22:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193432

Signed-off-by: david d zuhn <david.zuhn@sonos.com>
---
 meta/recipes-support/rng-tools/rng-tools_6.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
index d23d6be34e..f0aa3ff93f 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nhorman/rng-tools"
 BUGTRACKER = "https://github.com/nhorman/rng-tools/issues"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "sysfsutils openssl libcap"
+DEPENDS = "openssl libcap"
 
 SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
            file://init \
-- 
2.26.2


