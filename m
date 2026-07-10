Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E72C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:02:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1142.1783699367339014369
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=X9yIaDC9;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=TDjIkJ9o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEcUke1076564
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0wzi2t96iSOP6TtoFrW4MvCCYKfJRfGBLqB
	8z8LcxWI=; b=X9yIaDC9WgE46q6syciYOVYOUNqT8vpMYGtJn3JM/zS03iAQvTo
	bdYSIIw1WyTRK8PNU3KhdwlZMUcqRiJFLgODiekqBgSjgZzEH3Gm3Et/IPZAz3F3
	sFMctKXTzAquuvn/8Z0rxHFlajjUZQcszzjupvwXPeygnRhTHo2eZi/Zr/OsC338
	VcE3zynvztD9Mv9iIWNILEuKbJbDM0+eiDK2Q93oE4/RQm96M4a/MgitnEmkCFu2
	1Klfgce7jcLd6QBKcN5ha4vq9T60boAS/+OpJOcX/0tfsalPqwUSAMxoGzdXezmc
	1/E/LFT90S49wOVGbiyhInuhZYVOapRC+tA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg97tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:02:46 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-495f68a7973so752534b6e.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783699365; x=1784304165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0wzi2t96iSOP6TtoFrW4MvCCYKfJRfGBLqB8z8LcxWI=;
        b=TDjIkJ9oijRjaWKBLqzLHWis/h64ikQqSqf2fzELxPBT4Qckiko5vaAz2PPbJzhkjl
         moUoDkI56YZK0RpyGAlK2uRYKMRIMd8gB+TpTCvlHJpCZFyAjdjJxepzV42DFPpF+wKG
         F6HWrvDzNwGCBJjWPGQAzERk0Qkfl4sRTTIlmzoGbX+J/pxBnfuc/hCGn0ZuwXOB95bH
         pT4AtfdazLG5zpPxctBo+I1D/KMrrBGf2RzAzQ0Cik0KATtgz9wlGD/ado3nZmHZG1RA
         7tSW6+boLyMmRc9p6kUO9bmQkFeXPLyrEtKAN6OJ5HLfD5Zq4MH15K0P2ftfC9BDhAqU
         a6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699365; x=1784304165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0wzi2t96iSOP6TtoFrW4MvCCYKfJRfGBLqB8z8LcxWI=;
        b=Zhd2vgBzb8R3MlLn8HWT2OffWbduBBGE7aDBsgHuSxVvOEfTvk9A9sMsYjuAlYYuZf
         ZeR0Kg/GclFOcNDhFNh/2C06uGv7EV40sKE7F3ea2AQLWA3HGwX6njanq3OXR61QhuJ9
         vxc7WFZHeSy4D4SnvsAGj5zNcS16JKNktLoWK2kmCAwg69QCkL/bANocd/kyyF8BOVaM
         jnzFK1bUuqQAHIQM4Y1elRPBa0N3VC6XTYBglslhZZizHv+2bkMlrcQ3NQcAbvnYbBnu
         j0phP/PRo14+fq1e8x+bZin91IZtfUUA0uQ/58Pq8rG/uPnHHNIkhvH0UHwQKhM1JUuv
         GjTA==
X-Gm-Message-State: AOJu0YxT3rZvFpjJ4Vh2BV8qZakPZ95xOA/QShs37n20NN+VLjKZ94h+
	ITxbsGrCcIAgDPnJCar+t0A4RbDwVbphgXNvaI7ikWtvMvDtR/1KPP0P3rFRHPKw9zaAvYdUKXd
	zl3S4QmdpysF+KGw7bn7pILFCMZuy6FGqpcJACmidwks6Rkc7e6JS2rXudd/8bW5xKOu+gwpI1g
	KnlMrawzsgb7hAzhw=
X-Gm-Gg: AfdE7cn17aY5jQPkV4EAbZJ1kRFxFtEGpGPSEgLDHlOhb0noQR3acwzLo9eWJ/cbfR1
	n9OGDS6du+/tD1oFDe+jSeNAQMz1aACJ9so6W0nBbZQfMI7+1t0y5dUzUXexiVXG5FqZd5EW297
	b4ltRleL3ownw/NrW03TTzYQmYm8oVjyiPFtPcvuMWH/fgLPq3EIinGIjLg30emGzIo/UNxBtx7
	hIziBB6ml6RR2Vhdhxb7k79vrVnCNjbM9zjfcay+3lt83OXWcAosbQnmbiz9BbaplAzqCBmYRMZ
	lAGL2UkPkGFPU0tOdEeS8a90L+Tg0qVAMkeYMbApDoovCRj6zL+Jv5ItinYDXy3BktfuCbzs6pH
	RT7CLRB3cTW7oG7n5WlmaDVrHBw==
X-Received: by 2002:a05:6820:4dc6:b0:6a3:c14:c985 with SMTP id 006d021491bc7-6a36da6566dmr7945575eaf.72.1783699364135;
        Fri, 10 Jul 2026 09:02:44 -0700 (PDT)
X-Received: by 2002:a05:6820:4dc6:b0:6a3:c14:c985 with SMTP id 006d021491bc7-6a36da6566dmr7945471eaf.72.1783699363293;
        Fri, 10 Jul 2026 09:02:43 -0700 (PDT)
Received: from toster.lan ([185.228.162.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2dad65fsm45500675e9.1.2026.07.10.09.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:02:42 -0700 (PDT)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH] oe/spdx30_tasks: fix image deploy dir
Date: Fri, 10 Jul 2026 17:02:38 +0100
Message-ID: <20260710160238.214808-1-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dWygdE7ktVOduxiAnLP7gj02gCo2eYJt
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a5117a6 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=YIx/k7VQn7/pPcQ+xNwIKQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2lvCpwR0DOZn5_26uVoA:9 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE1OSBTYWx0ZWRfXxbBWlgls31Mc
 rbn6uGQ0HhF0Mpk7l7rEGUxo2Tqkpax2DiNTMSVBU8TzHoILY/Ys2+uIeZs6Jzue1Hc6c7Lp22W
 jtyM9O96XZFevogv30n+EbQ2nL67pME=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE1OSBTYWx0ZWRfXwRLk+8q3H1hG
 tENhaAthrdsNiHAPDwkuwkWFDS9rI0SpgFloFQUE7r4e4osZsa+rKu6MQPoOJynzj4JqZORUWGA
 aEeHeicaYKMDrFcbNTjJ9+/va2600NCHdyRQ1Y28FdzwN9rvY1+8xxuUiou81ZpM+BS1Opgt7PA
 vwlmIV1bGSSpPU5ztgokokVFkCO134PUyuY2VA21DwdtzcYyDVDGAq6Vvbbs6MW7c7kwmwp1bhQ
 YKNfs5JII0iGFk3pLw3eDl/FNgck1e2NN9sRkw285afoI/C9sATRijybXXzWIxNVWjo1BUIYuvt
 WAmVoh52Y+1eQOiu6XEydPJHUY9yYbiDonl027DSvKJuik7Fp0OOIbAgq58yMyOJ2Pn1q8hkFPs
 slrRCDmMqreaR1N7GZksbN00u7o7PuPsCQ5ZVfFSJoZOw2WxicMk2Uc2Cn/l/VrxcPh0Ag3K7sn
 V4xZj2T304/zXUE0Uxw==
X-Proofpoint-GUID: dWygdE7ktVOduxiAnLP7gj02gCo2eYJt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240660

IMGDEPLOYDIR is not populated when the artifacts comes from sstate-cache.

Instead of the task input, we should use the output because the input is
not guaranteed to remain in the file system. For example, `rm_work`
also deletes the IMGDEPLOYDIR file.

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 79e18db11d..52255108a6 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1435,7 +1435,7 @@ def create_rootfs_spdx(d):
 def create_image_spdx(d):
     import oe.sbom30
 
-    image_deploy_dir = Path(d.getVar("IMGDEPLOYDIR"))
+    image_deploy_dir = Path(d.getVar("DEPLOY_DIR_IMAGE"))
     manifest_path = Path(d.getVar("IMAGE_OUTPUT_MANIFEST"))
     spdx_work_dir = Path(d.getVar("SPDXIMAGEWORK"))
 
-- 
2.55.0


