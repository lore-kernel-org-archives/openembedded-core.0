Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E68D767F5
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 12:01:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15291.1766145681639547856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 04:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QZrOGSFe;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=E2J0USme;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBxY9Y092107
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LSE5XII/WsP
	q9HajLXxSn2nljiBoGKknadw04bGDYmw=; b=QZrOGSFe8eD5Wwjz+40Q9kyrF3x
	Ty3DSIdn1NatxehQsySq3nBNYXnCEPFcVn05troZRXz3YdimBzYQBgV2XTn/Rt6G
	lF6r442I7DoNQduOS4dKpu1SxrkfMGcBkH6ifaS/DY8X2JNoDgCzov12VXeGUKzK
	6APjmJx1GAs7NzxjWU0fAselwR+VJdMejF8rTmWS3Eyt3T+biUCcA+RouIvPnqel
	gAIR7lChE+x+DchTlchzrw01pCTOyguw2DGjSuwIUBHQSAd67VGhRSj4PSMw8ZpP
	KDY5UHPUX8Bb/aBgiFkRrIP703qe3y6y3X8YcLjtr7gQqt9xXMh+qT7YnZw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eahx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:20 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55b26ece522so962386e0c.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 04:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766145680; x=1766750480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSE5XII/WsPq9HajLXxSn2nljiBoGKknadw04bGDYmw=;
        b=E2J0USmeBcwuq+sje+tax1Eotb0Qn7oBHDdGV2sPrD7wAdScbgF/VFcKseIwBh+8+w
         U7hXUbFW4FpYwv3Iz7aDdgrol1x+lerilP/S3cqpLweGVmZfuWPuBGvu6IPZpbxHNHOi
         ktqJfa47WasB6RzZrjUJxDZptrhpopbkEwjgvQL02HfQxUQan1wwDQ84B/Pao1a/tnLU
         o67+AzaAVmtw1wvvT331ExKFd1tk0Wai7S4Q2riQ74v32JbIMjC/JFYsQemhIYLVjOiL
         i5kctCDCVBJo/WnOnTzM61A8DJpfKwuHALlHR3Or169jr71/ZhI8MljhdZRE8w8s3qh8
         4xRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766145680; x=1766750480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LSE5XII/WsPq9HajLXxSn2nljiBoGKknadw04bGDYmw=;
        b=aiN5i0m2ioOQdrdWVzG2a0freq29QeTUu4NbkHuv1t827rxDUcUdO/zXTXL7dvOj2e
         Lfa4R9sEEkDVG9awoftqHvaMh3T2jcu4ZT0VhOkY1HhXteufCnLiwXSZB0gcRP2pIgzr
         sifQkmV6JGEhinlFz/IHvqXkmWpdu8WN/3tyy0Iuj9fMJ8atSgGhE+YqxmAlrYra0LX1
         +xpDzKbQml12tenTOsdhL9Lq4HsUE4bY6rG70R9XQy/oQMr5wS7LUMc2gUhNmdFiIHdI
         q2QimbHQTViOV1mvbUFyuBW5+AweqYzqvgv9mKXTUcrA1I4r58r28j/ieVlEdl/Gy2zX
         M7LQ==
X-Gm-Message-State: AOJu0YyxsqYp5mVMiJOmZy3rwKyoxXJrLLTbY/xoEdACeoEscrLsrvLV
	yd333wFMjNN0EKc+Qx5XbJ0RvwC+nsQwwJNZFeiAHCLAmWgKt20gjILy5YdxvDh0tGdTtOPVe0l
	wAbbnXxqs7NEVrljtW8HLygIiCnKeGYObssU50RM07qOM3cPUoWzNspIZxKIedHzlu2wl8/oZaW
	eCuBkgSQl9//g1CpWB/g==
X-Gm-Gg: AY/fxX7OqZkjujWsdA5AxaOAMJo2ieOVaCPSyDxEFHI4jJMOfbt8jMB4HP3dLcNvNm/
	IFGXW1WdoUYnUOYvRpyK7Alwgxq4gQ5rQ2turZmO6tULAC6iodAGurA3OyLSFa/QADRN9bIhNOq
	OB+P0/6N+sda2No/2y4xsLG5vv8iBDjuD0GDQLciB65r3LcmkuAACyt3/lyBwji0efTjaDnOGQE
	xYQYaIGY0v405nXXW9Lt4dzdWpsMTj1u3pYcQwaz+6FaclaLIkPNeYo5kGxg4pbH81XOdmDIAs3
	N+6j59hD8l4MNSJCi8rljCOaebTH1ry1O0hBzNsFB+bsN2ZlM3jc5krRXDaNpGK1MrzMqs+idk2
	ujQrNk5xkmpsZhQgpNLQ2pamqwsCRO0wg
X-Received: by 2002:a05:6122:792:b0:55a:2b12:8022 with SMTP id 71dfb90a1353d-5615bcd52a6mr744382e0c.2.1766145679238;
        Fri, 19 Dec 2025 04:01:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7aHzDUyBMo9J3XS0UDd2Om2xoZP0DEnsgZ4B0A8eJHLQErUhpY9TumZh9ApTwCyaQbUFChQ==
X-Received: by 2002:a05:6122:792:b0:55a:2b12:8022 with SMTP id 71dfb90a1353d-5615bcd52a6mr744285e0c.2.1766145678479;
        Fri, 19 Dec 2025 04:01:18 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494c03sm2002120a12.18.2025.12.19.04.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:01:17 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH v4 4/4] maintainers.inc: add myself as maintainer for python3-pyzstd
Date: Fri, 19 Dec 2025 13:01:09 +0100
Message-Id: <20251219120109.1967755-5-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219120109.1967755-1-koen.kooi@oss.qualcomm.com>
References: <20251219120109.1967755-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5OSBTYWx0ZWRfX8SgumNVDe8Dd
 I1lxQZ0JA7Y61Shphh8G3dVjzppwYPSuu003yCvdy/f/OS2Oi+iu4Pm0j1QEQLteafYS5+kBpB9
 mVMcjnj8x22Jh75WelK9+FfyNrthbSWOUQiNgBeRu9r7yutnzf9XBL4XIg/KeEUm0xLkZV/TNbM
 Qyn1rrtaSBEoVX37nSGXlXqs72zWW+50UmGuqDj/dh77YxVeiVQCYAtrkg0xl6dL8NmGouZduqb
 s2m5wRCAL6UYp8/uoo4d2C3TP401XPNnc24kjMBAD9dgrzSxU/ZXg4GKiU+MQ7gkbQCBxPt98Mg
 zGdPme+bILiTTrr5/LyJWXkuUJiSU+ABU4/tiQWyLCBARAPWcvCOok/JLWMfv3cmZAL0VrgKMvJ
 ua7YkA9rwcOKl+z4DC/VHkkWtruzciXSBZcviy2XKHzXexog1aW/azmW5Lq1p2Rs6Lhc5tPhCPY
 tRquFlKSxEx4CyEnNpg==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69453e90 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IpJZQVW2AAAA:8 a=k-42gJp3AAAA:8 a=omOdbC7AAAAA:8
 a=-4FgASVYGS30Kai7mKUA:9 a=tNoRWFLymzeba-QzToBc:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-ORIG-GUID: cjNA5lXjIzn0t0NRgAbTGc4xErKwnCht
X-Proofpoint-GUID: cjNA5lXjIzn0t0NRgAbTGc4xErKwnCht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228225

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---

First added in v4

 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 523ac09b53..b5a961555b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -704,6 +704,7 @@ RECIPE_MAINTAINER:pn-python3-pytest = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pytest-subtests = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pytz = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyyaml = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-pyzstd = "Koen Kooi <koen.kooi@oss.qualcomm.com>"
 RECIPE_MAINTAINER:pn-python3-rdflib = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-referencing = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-requests = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.34.1


