Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AC9CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 13:44:36 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.17045.1757684672830508678
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 06:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gAa1/rUs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fEGv001295
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 13:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PsY5gDx1GDj
	zQe8rSql67KXAU07rcMoOFeStRSzS+rQ=; b=gAa1/rUsMpC+gQdWQ5j9nKx2fly
	TgItJKkOeHcQcS6L1dTpxIIDKBJpdJC64GW8TgcjpOpN9artHR42fgqN0NFk3MfP
	so1WuUbZliPX7E4sLmtdE1jUY6gzcfLCQPfyYShNqGuEnQy7trCDyMSXjJ3y1cKS
	isTctGbirEZY3ZenY13MasH6vMzrmWFLaDEp/Sy9qXYpebXP00kOwK/QBxT+pPNc
	AsWVWqWtn79vuud8Y2Q+q3c2p+8etHyMunX4sYVpFI0WbzNb/+f1ELNzJ+fV1+XL
	1J8mGXg3liAd1nDdFKFQFNpjXOZcpcXQVzfm0bLqP8fsguHYLE+EaWYCSMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h6t1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 13:44:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8078f1bc588so431856185a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 06:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757684671; x=1758289471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PsY5gDx1GDjzQe8rSql67KXAU07rcMoOFeStRSzS+rQ=;
        b=kxCrHCgwoJP+F1EABrtmMgCVjo8M7NqW9m5nooznGOoswB4wWF3PW3aed9sxAkGoAo
         fgSe9v3lNKOl+lmVmV4IQIcI3H/g0npzPkwQ8llyKfEbCq23VV5tjesjn6QkNnYomezb
         VhWf+sJ1P8XTScvAAvvRCkH9Ry8Dkw+pQa0IRpTa2pVc1IbofbPmbqqBWV7ChN7MwtUt
         1z2TzXBl4YrMesO+ereCyqYlTnLrc+cKyOH9G9hKdM31axtQVc5a16kmteI4tJ+JmL8b
         I+gkOTC+wx8mcUtu00wn/8mX7YtYqZAPaVerS5rzUgi+PQCecA2wG4k4mKkikrz3oeFh
         mMuw==
X-Gm-Message-State: AOJu0YxTdo6NgbNH7w32My6Ny0rj6WCBFd9v6RL1gyKEZ+UWo8P6r02H
	DCc1M08T5sv/ddnggRu8FgGElHx2koa+hT8KLYzoAGnX40oTmC+kbFYIvv/GzRxovZOjaFO+VNr
	YJ6swDINYVhHwlIenMbq2wli/Pe+kPewDTiMlg+G6w0i7qr9sBGilJwwYQ8OaZYHW2DSMDZywEX
	y/B8P03WP79xCGedg=
X-Gm-Gg: ASbGncvkN8LWEM7YaumkOfkeC1HeXVc+90AaiVJ+qFGO8vkuUK4Z2Kg/kRsPNBcdXR4
	RKd/+IHH0BHwdSvQ+CmlIgb3sCGFwdB10C1MNv8aq0gcExPaF6bWt4onA4X6AfkjGCZSTAoFlrC
	ZWPoWf0AvXTl63YlTd5jZJYpRNcRqHLqYMMwc+VGuMC29icAqlkitVzCc5mknZgXazTN/3cKRMT
	ZN2HXt9d9irbT23Q1RQgSMXz4XKkDeR86ccHQSNW97RTN0rmJQ2sqrs5YqyCDjZUK1aqrV1Bcla
	ClDGYCdC+5Xd49LVXGwiTLSA+aT7YF8aLfrXpmG3wuFxgzPlYwnq9c0Lzy84ytmU7/cFuWJ5omd
	A7CD+kYa7hXedyXXE8g4mWTgHCgmm1YcwckWt61ht8ZkO1bDDedLF
X-Received: by 2002:ad4:5d64:0:b0:765:5211:db46 with SMTP id 6a1803df08f44-767bb87f26emr37423096d6.2.1757684670722;
        Fri, 12 Sep 2025 06:44:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLtZzf49jTzzDP+95JKy+kMrGOkpUkhgiZ708VehAJuTypjvU83UVjYH4scPBIcC45sns2Dw==
X-Received: by 2002:ad4:5d64:0:b0:765:5211:db46 with SMTP id 6a1803df08f44-767bb87f26emr37422516d6.2.1757684670296;
        Fri, 12 Sep 2025 06:44:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-571a547ad9asm198049e87.65.2025.09.12.06.44.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 06:44:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] vulkan-loader: depend on the Vulkan ICD package
Date: Fri, 12 Sep 2025 16:44:27 +0300
Message-ID: <20250912134427.1763047-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912134427.1763047-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250912134427.1763047-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JuPJAhQ3VvcsT5RmlGpqzEtAO1Gl1MKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX2Yn3qbKrHRfL
 qrF1n+5nOdy5zEP4LTmvTYU9sbTIMDVUa9auL2rleX+BOnu6C2z1Pc/UzmJHMvF1e6joMWlz37B
 dfCTTvTO+BG433K1UKzpR4uUsTaGBn7J8XEec0lI5tE7qoI3pIPHnr1+tBRvDx4Mq5RGoNWLUMX
 /7pcqgWFrk7KYQogCoGwpGzjpxCjLphJnFC23MTNqZIGwu6stKQcgLUrK00kl4DMEiGjJP4ck9J
 KHFRIY7BhuSCcGUESvC9gHvBw5nlGiahSICDkwei5D8abTBwq+6Ca9bdKOaEAS7TnK0T1rUY1Af
 V1+J2+53WEjdLxO96lZx8uvnrz6ZQ9x5ZNMdEcxKCBQl6+7jKYonY8s8RE50tILC19Ob9zabgfP
 RaXOb6Ep
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c423c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=kl_ScBXZD0_wtlcJHykA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: JuPJAhQ3VvcsT5RmlGpqzEtAO1Gl1MKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 13:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223310

Instead of pulling Mesa Vulkan drivers via RRECOMMENDS, make use of the
new virtual-vulkan-icd package name, letting BSP layers specify a
differnt preferred Vulkan driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
index 772705dff756..31e6e43a3287 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
 PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
 PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
 
-RRECOMMENDS:${PN} = "mesa-vulkan-drivers"
+RDEPENDS:${PN} = "virtual-vulkan-icd"
 
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools,
-- 
2.47.3


