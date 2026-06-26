Return-Path: <wei.deng@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B9DCDE013
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 06:42:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30040.1782456159978914812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 23:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NR/qoW4F;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=LkFdOFnj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: wei.deng@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VL7H1680018
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZlZhR+CLLL8iD6f6OmQ8+WnvlXkOSy7c5E4
	8elE3FQI=; b=NR/qoW4FYKG8SOLD13ekUhF47CuLMAGgljsQ6+sPJ9PV4oky2i/
	1nV1nYYNxoQFQIBLLhTMBQni7yH4WiPZFwtnsbIAIVOHwx3jt74xTfAuUymCppnr
	zqx+2oRT79U4aTu/NhFtF5NwPjDf222AbWUM5/Bc6i1BycXOIjXIxldwPw/jRjF8
	jUNlmKJcWfVrfWDEUEKC+3tVO0xzvy476dF3+5v4I11VKnhMlWbHOQCQYUDif9a0
	q4LUfzW4CpO5uzvW8kfvE8EoUUmSKjYxfOlCrIreIZjJqFKnWeI9pD2WQwRmt0gC
	XNkz/szY6AlvZASSobwfVbjQKJC17oxzvZQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgc15dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c58d35c0aso166546eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 23:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782456159; x=1783060959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZlZhR+CLLL8iD6f6OmQ8+WnvlXkOSy7c5E48elE3FQI=;
        b=LkFdOFnjnQlawc/75YRk2zYINoaWNk0H0encY2HqcqlMVGfMYK5OYFjK2iTBNkwhjs
         1Ww7mEgEyM+D7r1S9yVKoj44HIhYixXcLMzkZkBQCUo5nMv08W9deGZSqH0nGXdJXus9
         qpSMykod6DQKIhheUL2Pfkyevx/dv7unLw3MCsEvqrHEOB5Wq/Sc5AplsvvXgWeR7c7v
         40HG9C3ID27rQ6fAPXwUejQvdb3lBjfMbcMq488IhXx2+ZJu9Yss58jQpfuKhkEyFSaY
         1GKH5W/VrzoZd8lb5dZ6NMtdbkg2Rp1rrixcOtQGmB1XpFyCqZXo9AkvEwaTJvbF1A27
         C3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782456159; x=1783060959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlZhR+CLLL8iD6f6OmQ8+WnvlXkOSy7c5E48elE3FQI=;
        b=Hb+PN4yn+f3l0zvwMY9chmtU37OLW5EFrU7v+8jhWbWPAJe9+ysd+OUCbCvuecNMaf
         KgImmHpYlg3k02Co1V5GFzm5+UJtNwSbslGKqVTy4w8e1CnEbfA7IqXieHggDCrBS/rv
         vPe0N54fch6pSL9lRip/4SzphZijOCF7WQgHAyPoXdKw4mS/O4mAmYAc4lVDzsnL+Xe9
         Hlcbv6TpP5o9644VGo1yoW/LkLQ+fe7e0KEZaPKlU/0dR1J8B0odLEhAYA/iG6nsU5XU
         9B2apWgG2xMgJtbeBCW6OjfghgA/lGBSOgE8+h5LrL+ICM603O20bC6EO/3edTYuTQrR
         QJbg==
X-Gm-Message-State: AOJu0YyUJln4uDsBj37U4y5geLVGO/s8m6j58qHSVYYio9VAnY68vmGK
	mNqA7kEByyH3zV2oy3WBcWta+oOmVS4Qs7n8nVYpuSxsRjnj/4JiWMlHeyl9J10/gDSj8aKZRWf
	8/tBTQGzOrjowP2JmPIxq/02vAkyVLJz2UvurEGbOcSR7zX8Uum17ETM21oPt4Og7au2DwjXBpi
	MuQ1Ebjan92pWFYtINhw==
X-Gm-Gg: AfdE7cnSJnqkTB1EJRf5QXpksQyjIV8Z6uO6SEmRGNqisInxfq8Qr2lkaXxZwyI8ljE
	WbzYzDp89d9wC1eQhFmo6mzD3xXE5zGdfbUpAcHZJxtY9za6WjWNKCnXPKXFxMGoRtJ7lu6uNwC
	U4uxL0Oj9ZcH4/yeco2QbSGOwDNB8z9o4P92427WWJCsT37pDGOlPTsGIMoT227zkrSb1YLKxn0
	xBwjoNaXm0ikXo6tWgTlVPhSv85LPYbWTJz+Wl7Ioo+p2QkS5L+UnyXQQsBIFFJVZlyLukM9CVD
	LxKCcPlZ1fcW3sef8GH0ZeDz6Qp6IWDKKrcKRpp1+tqhlFqb4tLtzYZddMfxe5QJfqWmzLUmcWR
	Og/0YrP3GqQgyY77BLziza3cTHWQXSHZQWPE5uQqqu/nLVnoHkJW4uHi7LsE7/A==
X-Received: by 2002:a05:7300:ec01:b0:2f0:ddce:8468 with SMTP id 5a478bee46e88-30c84e49cafmr2274217eec.8.1782456158480;
        Thu, 25 Jun 2026 23:42:38 -0700 (PDT)
X-Received: by 2002:a05:7300:ec01:b0:2f0:ddce:8468 with SMTP id 5a478bee46e88-30c84e49cafmr2274202eec.8.1782456157956;
        Thu, 25 Jun 2026 23:42:37 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7cac87dcsm16628270eec.31.2026.06.25.23.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:42:37 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
Subject: [PATCH 0/4] bluez5: backport fixes from master to wrynose
Date: Fri, 26 Jun 2026 12:12:29 +0530
Message-Id: <20260626064233.704350-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA1MCBTYWx0ZWRfX4S5VyJ5iMnpp
 nDi84oq0ESSueT2HbjbRAw/u4m6yz3LqG0BMoMIfNmD33ExgXdy9dbgqwAQYaSlDA3p4fxgH6iO
 HY4ckesiuHfubqqBfhI++mTmUuNbO3Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA1MCBTYWx0ZWRfXwaoc7TrKTZOv
 46dNJCjNS/t8TrecZ5bVKiB2Dcw+PAcik/EYiVvyOGyStqEIzisTL/BlHjgZ7IA2QR+C6VBPlvB
 /8G0m633XXdZEn1RpnhJcCO+OjnwRkR61sZZagopzYWbSUhusWYwgzPtaW06InyBeVDDwWYrmMM
 blzmhUxd5V98fuyIEsYDkcBcuEdyept1djXIB1laluvxIfYQ7KzFL85EH1EBGPDB3yHV6UcpghT
 Wka9I4DPifCwHK29uJLMJyhb7PiEDdd/arBrclTmEvQzOVC7f5xKa7w/qIgSYtTTz6hjxXPlJ4U
 usPbC/NkA3sQEFDiPuRnK8Jnolj3rbJBDXdAPHyMAWJOjKL443oNh+tNkgly59JSbJGRx/4ckJn
 3ZxONKPP8p7T0JB5yy4ULYf4N1lpfZWULkhFejonHttVSgO8Xu8DCvVgAS05OXcrHh9A35Intc3
 QLkezR9FT9TxB4VFiGg==
X-Authority-Analysis: v=2.4 cv=O4oJeh9W c=1 sm=1 tr=0 ts=6a3e1f5f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Lfcuv_E3_B0PUYBQQ1AA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Co57y7pDMfDOuTJo-oIkmySHpFE3x7lT
X-Proofpoint-GUID: Co57y7pDMfDOuTJo-oIkmySHpFE3x7lT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239603

These four patches are backports of fixes already merged in OE-core master
that are missing from wrynose. The first three patches (fixes from Jinwang,
Xiuzhuo and Mengshi) shift the SRC_URI context in bluez5.inc such that the
fourth patch (OBEX IMTU fix) cannot be cherry-picked cleanly onto wrynose
without them.

Please add to the wrynose review series.

Jinwang Li (1):
  bluez5: fix set volume failure

Mengshi Wu (1):
  bluez5: fix gatt cache sync issue

Wei Deng (1):
  bluez5: set L2CAP IMTU for OBEX profile listeners

xiuzhuo.shang@oss.qualcomm.com (1):
  bluez5: Fix sending extra bytes with MGMT_OP_ADD_EXT_ADV_DATA

 meta/recipes-connectivity/bluez5/bluez5.inc   |   4 +
 ...sending-extra-bytes-with-MGMT_OP_ADD.patch |  33 +++++
 ...2CAP-IMTU-for-OBEX-profile-listeners.patch | 118 ++++++++++++++++++
 ...x-stored-gatt-cache-DB-Hash-value-no.patch |  84 +++++++++++++
 ...t-volume-failure-with-invalid-device.patch |  46 +++++++
 5 files changed, 285 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch

-- 
2.34.1


