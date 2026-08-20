Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56870C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 00:22:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3353.1787185339507080055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 17:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TRBKjPz2;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=DFq43Hoy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL8ahY232432
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 00:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MUHZz+T++T2wJxwMYTubwfItmBhsTnQN0o7
	5oWlZZSQ=; b=TRBKjPz2NcNaCI110GJA4rpq9mMnLBuYv1Qt5vTeGQpwYASwzCQ
	VD/k7jNOho9JhR/cI13upm0uO+bgOdtJleq58MBZCjkxbb/T0RspzN6x3equ8YPe
	gpGoJDiJDrhLTMcV96CBg2QLn3TvBN5jov7zyoCw+ASdrJUnU66BxeRzI4fpWsxm
	W/VDnLOJrMp+x4MK4RJB4MPE8YSydl8cwWhL3CyqVSludGWWQ6/l8/axvFCjW7Cx
	QXUW++MeJw6n+2nUxFM08yv025vY4LHX0xovLSxMvgAfMUzLl0itrNIACUFlt9DG
	odlIfim5sdw/i8HnIdXuNANhys7CaMKtIcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esata2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 00:22:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ef13b61bcso243232085a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 17:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787185337; x=1787790137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MUHZz+T++T2wJxwMYTubwfItmBhsTnQN0o75oWlZZSQ=;
        b=DFq43Hoy+zVGI48oKDNzAl/0WSmpXQYMdfysfPOFoYen1C6402ZRYQVZBoqutmE/kP
         Ms8K0eK4d5ymrLm5YtNK23HETbUDOjQM+y7qQ7Xnl/gsLTgWgGQh/BClGfUju2OBe0/L
         lNNpUSGFpPKtNLfZkVe6gLaMVXnHX746maDoDkx/WRVh5AcXI4syyV6vzBy+mq1/HAnn
         jozC/bIKxH09rFwSWwaWK0SVdXhIsuCPjYwZBn18ysdvMTpjBMG61e/f+UVp1cbv7XJU
         AwIIXCla+p19jqySN9fo0vceEfvp7QrEzNzXww360tpgQbB4qx0JkAa5O9Ug1AWBljab
         Xt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787185337; x=1787790137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MUHZz+T++T2wJxwMYTubwfItmBhsTnQN0o75oWlZZSQ=;
        b=iAqfzTmEZwdnLJfTFku2WytSe3g3wGfoPpJTdFTKZx7vqhxhAK1GwUchCFoZFU0kGY
         FiKRD0C3KHaEDTL4EVyhFVc/u0HsU64ikPoGvabgEfIvjDDJA9RC6YnBZ4KtAE0vON5F
         zTcS+WSd4Za23rS/jCQX2KHaVWpEqI7Va1b9266prj/uhYv+smxDOWu+IWEMWsBKrwRe
         9roAysNj6BTc5S8Pt8DiLcrK+GNZixysBBl/vk7KU72ic6BM9/gEUuffzPlX4QlMBhpC
         PYCmBVMblh2wMrYQuK3iGaQsCCKm1YYvFqA2OvYoDz7x4/NAuP7hPr2+sZ2cPbj2YpzT
         56Cg==
X-Gm-Message-State: AOJu0YxnL5T4XKKOktV3WxiIHLFZmHz0o+sh3mEtoJKIB5XajOK70oIC
	2QEPSIAsdxs5c7CecpH8VXsysUGEroFQ79izqk8x/T9TNP2uPilWbQzZZKBJieSoTPwVmgs81Nc
	CjrJuiaGtYU1N+dOOQAO5BhngLKPMV6yBV6ym0tlwh2rDt+TxENF4BkjX3wCxgUZuCf//aUd9m6
	Yccmbx2dYomeRLSbJQypud
X-Gm-Gg: AR+sD124P6SPy7TNsbklKsBbTc4KbGQUjahC36pZ3jORgvAaiQXgBp7ka8MSDOHbuNH
	avd2+PGgJMiK7f9AVGtPaZLlfU0YX6PFMSKKXqYz8FWHjL+S43Iwc6poqYj9Oucny/JxwQ6QWxD
	JV9GAq4l87mvae1ls1HSZcsJk5GBDlWl6JXwV/QQAoYFxMgvRdmBg+cVSipaqkpRusnsT1YFqvF
	7G/pPeDEjq8l2egwLgcyXV1+sWeh3BrPZRP9Yge88llBvFZNpwLZ5bKUOehqG2viqhkIFhE9i3T
	EbwlYd0KznAXKVoYTqDiIT5hS7UZwC2wIKfoHrmyzaHeQ5lg4Ujj/4IH7So0j+y2p1IoCO2BsLV
	jg+GZ/pl9iqn673nv/G2I+bIbtwOjFwj0+qz2Pb2Ud9txcYQg75ai43u/SzfgDXHLO4DOZaD5cO
	Ccc6cICjNI6T08
X-Received: by 2002:a05:620a:6884:b0:92e:b289:8cca with SMTP id af79cd13be357-9371e637291mr949435085a.44.1787185337425;
        Wed, 19 Aug 2026 17:22:17 -0700 (PDT)
X-Received: by 2002:a05:620a:6884:b0:92e:b289:8cca with SMTP id af79cd13be357-9371e637291mr949430085a.44.1787185336852;
        Wed, 19 Aug 2026 17:22:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b47885b164sm899534e87.27.2026.08.19.17.22.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 17:22:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipe_sanity: accept new renameVar() arguments in the monkey-patch
Date: Thu, 20 Aug 2026 03:22:13 +0300
Message-ID: <20260820002213.2272711-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDAwMCBTYWx0ZWRfXwmCWZ155LDSZ
 D/JUzT4XVQev2iiYzOzXnJ+NUbq9pbMclNFc75dyTWjZ5LPuCWdfXWCP1pEDs54XJ9TfGVuw8Pd
 qOxBOf3rnItPBuh1Hsy6M+2rnKbThrI=
X-Authority-Analysis: v=2.4 cv=fKcJG5ae c=1 sm=1 tr=0 ts=6a8648ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=4iPf2CZGfaW2_5hFtWIA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: YykclvWsCa2PyFVC-UtcAI8qFLaXnvY9
X-Proofpoint-GUID: YykclvWsCa2PyFVC-UtcAI8qFLaXnvY9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDAwMCBTYWx0ZWRfXysp5Wv7NQyb9
 LwQhvXpTroT9UN0SXj+w6SNa8OP3k1gbhyN61MMtqW7EEkJWA/xsSrbmfwFtuxqLJx+JZjOOwhr
 /SKzObdQXu+AiSV4Q+HMJmlGu6m6O8pB4z0l1SJX16DPBTYqQYnqi0fJ7kNS40Xjykidk6z+73n
 qCCI17EpQrRq+AcAC8UZH6Covn4O4lTj0iTzmjQzqW+RTCCP1IaE5qHDLwb0fZbHs0HEsFqUfL1
 FcS9A1WucZqN84dMQuTnEaW2rkbe5mdFWyAvhzUTOiYLDNFPvw4E8oohPG8BTclstbPuGu3iRoK
 uRlpyQuw3WuDYdl2my7Tut9GyxFuQjadk+4EtBOgej7rHCaBPqc+J3Vq2y/pW+sOXdT7RYbiGY7
 pCiopY/Cr10ziTokdpcdS6RoxeUU+AKcZENGINY85xode+u1SZltMsynOXK7fgoLAKta1V/kBCx
 dYncbAhmA3eN8vN4ugA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 00:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243799

Any build inheriting recipe_sanity fails during base configuration
parsing with:

  TypeError: recipe_sanity_eh.<locals>.myrename() got an unexpected
  keyword argument 'recurse'

recipe_sanity_eh() replaces bb.data_smart.DataSmart.renameVar() with its
own wrapper in order to record variable renames. The wrapper hardcoded
the signature as (self, key, newkey), so it broke as soon as bitbake
grew a new parameter: renameVar() gained a 'recurse' argument and
bb.data.expandKeys() now passes recurse=False, which the wrapper cannot
accept. As expandKeys() is called while hashing the base datastore, this
kills the build before a single recipe is parsed.

Forward any extra positional and keyword arguments to the original
renameVar() instead of enumerating them, so the wrapper stays working
across future signature changes as well.

Fixes: a3c6a020da9a ("data: Fix expandKeys recursion issue")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/classes/recipe_sanity.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index a5cc4315fb86..cd35ed6a1302 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -141,9 +141,9 @@ python recipe_sanity_eh () {
     # Sick, very sick..
     from bb.data_smart import DataSmart
     old = DataSmart.renameVar
-    def myrename(self, key, newkey):
+    def myrename(self, key, newkey, *args, **kwargs):
         oldvalue = self.getVar(newkey, 0)
-        old(self, key, newkey)
+        old(self, key, newkey, *args, **kwargs)
         newvalue = self.getVar(newkey, 0)
         if oldvalue:
             renames = self.getVar("__recipe_sanity_renames", 0) or set()
-- 
2.47.3


