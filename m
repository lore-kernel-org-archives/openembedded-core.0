Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E124D3B9A9
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 04:37:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7439.1765341459980306867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 20:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DZl7cZWk;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=W/SrB7Vw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LgOE1253844
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 04:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RiTKTYkL/sq
	OzmkJmxzoGTmt4rLnXwSecZORdmBgU5A=; b=DZl7cZWkeIoHNKu39nBME0JyxAh
	kcej7RoDlVZjOk3Ht1NCKaVS3vIlOkyvWMjPMnES2GXPPiQRaO97FgZ2h1rauNoE
	5J/HhMqeoYEwbun9HqKA1+JjuoFSKIMFkN4Rq/WO6CR2TgrBuRKvAazn5lfmx+Cz
	3mYbfR4Jg7kJ2iNvoIaZOAHj2S196EccBh+CLCYxwkLpRibaFFK0/83ZFw5aC1QQ
	1q/cFNCgQt3iwoDmSJCEDRQ6Kh+lpF0E8qDYWMxxXcSEbMosjZw9pQMYAzjK+hvC
	7hcyjLMMHxbrRGi5Ymm4Z5mvtrveB0/6tPuDI/Jg+Jv3krnt7KfxlJnI/Kg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqqn22em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 04:37:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55fc5f8498dso2475187e0c.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 20:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765341458; x=1765946258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RiTKTYkL/sqOzmkJmxzoGTmt4rLnXwSecZORdmBgU5A=;
        b=W/SrB7Vw/vl/KRdo3nc6j7V4htGF61YQ1aNukFFARaFpetlb7wJPMOnriFz91Q9iKE
         N5jFYUhPqGXVX+zZ950E8JJthvRkJnR9GycuABDfGHbVMJCq621cevxwHIv4Ka0dJScd
         maUIMjChjWaVrh5XhPt0R5IP3Dft0gVOXNS8GAPGibVE2JpQzPPTvyCwgAJk/bcRnYp7
         z5i/ySltAotOX+D48RszHX/EWqmKCSf0JXFcKwun21olOC0W2B2sJZUWpopk88N7K21c
         xXyeJAllTs/8oM1tuxiDDCDxUDOC/9VDyxrja12wg7ETZCYSAZwVCVS12UAilGl5I9Cu
         Hmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765341458; x=1765946258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RiTKTYkL/sqOzmkJmxzoGTmt4rLnXwSecZORdmBgU5A=;
        b=ffAydOF0YTiQEioxXzvmx6yB5DHDE7yF1UupfjiiNlPrwvMF3rvt+4WEjOGBthOpY8
         URbcwqnEpJWmI3rdaUkWLO0yZCfzafnGUlBsiRmPYR+kKKM+6v9I0CNICkt2H8D4sx9i
         t/PasdsQFT/NwjmlkRlO53h0L09sI6YrqVDadErKmMy2DjaTGUH+HR3plJBCTpyIRRe/
         /Dkqo/f/huLOwSolkjEx2f3HbQZSIDHPtXZObKfJovqnvWELiqR3n763clF1e7pyNKBv
         0dD84A2XffEvjJ3+OvsMiTbrITg4j7BUw6C+UCWMhJG/1iyCj4pTzOGqswb7Na+wMzpb
         iHfA==
X-Gm-Message-State: AOJu0Yz6hLne6m/tWpInamBEDZnrc76b5Fqk7vSPpyDSAoRfXtA5VUPI
	pImFit+vPZLnaSOYQNxozmPlTN7QeHDsA+yEuH3WjeTdMWWsvTT3+EDXbl4u2P7GhimdrL+q9xg
	22fxldpFVzW/OW+eNOI1KWluEB2basXb+MdNrmnEPqJrp3NB3dkubFwMbSwxARdH0fs+sB+xRRG
	T847oRyNHKw0nuTqE=
X-Gm-Gg: AY/fxX6CESTdFKodQN7jgBHbbfOyZoYwwsNIwPayDxquVJI3ubcetOD8wxq5a0x38EA
	EdXzJxuws8XP3SC8k0onhUZvyQxdDgOLpiVOe42gh5UrYBef0sDKbI8IFtli+UQTvi/a0euDnwn
	GWJxoLlPBegGBXjoPUnJL2K3Xf9HTZalbqItGUjJ2YM97t3EhKbhg27qU04SeyFnOTGmqsnGdys
	sC6bP+JNjZBFzAapQbVN8QfiLJWO7yXD5VQvCoAkrrtiZ4wcNx4S5hGvU7ClRpKVVHA5Li+MIVg
	YAyfyl+GOWHAG1hr5mGUOOEG+od5YMVvjsxRKCVtb2mg2/giZ0o7Fn5LTE+4r/kBrhcqXgeWv72
	tnSoZ+GCkJFAI/yG7Yi7Gr4ZYJAzlPLM5BlQ8AH3MpIkfdIXlzRZbHFKIwphsNZyAOOSlBn2wRz
	EZTUQ2XMALi1cZjgpfbICVI+U=
X-Received: by 2002:a05:6122:4d84:b0:552:2554:7d69 with SMTP id 71dfb90a1353d-55fcfc24908mr455034e0c.15.1765341457929;
        Tue, 09 Dec 2025 20:37:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvGzigZTyGQE15PFBw3gn6Uj/fDrGumsuiLYkOSiVHa9GG5AoHOoFstgP+BPSphu7Q9ihI6w==
X-Received: by 2002:a05:6122:4d84:b0:552:2554:7d69 with SMTP id 71dfb90a1353d-55fcfc24908mr455026e0c.15.1765341457460;
        Tue, 09 Dec 2025 20:37:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fb5442cf7sm1287461fa.37.2025.12.09.20.37.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 20:37:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/4] mesa: enable hasvk Intel Vulkan driver
Date: Wed, 10 Dec 2025 06:37:27 +0200
Message-ID: <20251210043728.847548-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210043728.847548-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251210043728.847548-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4IrHJ8gHIRZIVNionxprNDIEl4nJkVnd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAzNyBTYWx0ZWRfX8oq/Yc4suREO
 8BS2hYmTSup5FRYQYy7tTFnEy0z3TbvILu4ifW+vZvVU/7xlTn0LBqqKOSTvjy5TugJ+l712etw
 ab0wghi2ItTsMGmBySmmNzSTZEbJ8mGyPAgdng/qpgAEuqPu2fpKDYfdq8U8x+2+obdicLaxNte
 TssnsKihTv0JVJtUMafOSG8lxibxV3AFI4Ad3QTW/gcxsG8F2l9gRInNomPTcWeLl+zgJCKZY+G
 54oAZfk1togzB80bjo2tan2l/zcI5M+7WWhUWnUfrY6HsiLoe/bsO7rD3j0KmbUYipza4mAfkYy
 fhYlVjB6cxcJTi5Pw1v1me5ui4T5Rtkge3HyvCcQNyE9AYj/nY5Jnbnleh7xIz4H7nV75jChoXe
 dyvVWaE5sy4PMHGEE+rPOOVsPFcNZw==
X-Authority-Analysis: v=2.4 cv=A5Jh/qWG c=1 sm=1 tr=0 ts=6938f913 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=2QpHmv8HCqIXTJjfQKYA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 4IrHJ8gHIRZIVNionxprNDIEl4nJkVnd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 04:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227456

Enable the iris_hasvk, Ivy Bridge, Haswell and Broadwell Vulkan driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3a2bb2e57917..c52e61f1ca01 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -131,6 +131,7 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedren
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',gfxstream', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',intel_hasvk', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',virtio', '', d)}"
-- 
2.47.3


