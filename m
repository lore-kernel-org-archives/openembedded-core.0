Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A90D65C60
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:09:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16745.1765984172370211057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:09:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Kgkjt0TV;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=D0+VK/Jx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKron3048747
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLPEZZE6oOiihUMe+0uSA6y+ll8y7REWrfoLWqr6RFk=; b=Kgkjt0TV6oJvlqE5
	mwHrvcMfGZ6hrYwPx8H850WNpTuimx75I4nGJ3bpCLGNTAaadQVA60M685nbhX0f
	IIQ7cRzCigpGoLlXdMrI9zhneWmfSO5EwbqThOWFXkwZj2tPhXvPCVdgQjcbRpra
	Vh3vZbZnbllVBeX/U3NM0MQ3nEOeRkofBfxnTLWd+j0KsRfLurUhpAxM6rojcLma
	i/FGrQZK/XDwvu5Dr1R6rDFw2Q0WYdue3PJvfFjrvYLnc72bykHYmbhn3jYtnKSp
	cyZahN21+ReW0IbNvoFiSGPOhrEq6zBjOc/bZw3usqTBFB+/nLjLPFVPm/nlJmnT
	TXJVwg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgqad6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:09:31 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55fc5f8498dso11113228e0c.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 07:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765984170; x=1766588970; darn=lists.openembedded.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLPEZZE6oOiihUMe+0uSA6y+ll8y7REWrfoLWqr6RFk=;
        b=D0+VK/JxEhgjQucoJ3i0gdYRReSboN1xloubYRl3q3SeZ0D+dVDPHyVh9EkwcW0kcE
         ZiO7YCe1/dWPP8uslRKZBPg0Vnaxgr4M7CWvd8UdtGm+uzfONRcWve6gdvyadfCjPSWX
         Y/3yggIF6wcy8yEmnUFQrKbga87K4oLdtW44iqFysCa8I6bG7lrob264ihtgCplwGA3W
         A5sYlpKLciUR8iN0nVNjl7p2iGqP67Pc4WACL7qjeBJmJ4mL2OHxPrfH10l6xI2n1kRE
         MneVEwSzPkHNDr07agDAD4ePcnFJ0Fz4Wy3aMLafPzhW/QVPvQkvGSpJkmMZ9G8KhFuS
         YYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765984170; x=1766588970;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FLPEZZE6oOiihUMe+0uSA6y+ll8y7REWrfoLWqr6RFk=;
        b=jUiMJuZC9TJLCrcOUZ3RpLbFjqAk02VvtDrTud8lC95IVrG4lf1HM31lAyv8DOelGh
         K4XIcgvbKWmF5ijEj7m1WsEOlUAHyALzY2NXbF11aeZ+lxhmdTQDPszHc0ZIGQiu3wQ3
         i2elqHk0G18XW5x/fwINouXDffbA0UlnsyVrtD7QQcv9hAFr+d0l5ANMQvhj1gf9gy45
         vlGMsB+pbw32cNdQJ3Mz4n5a1c/LCVsMD7HWF84A0gAB2E+avaWAcP8D8p1P7PykSZoN
         fdqoOUjEBgiOFpg1AwLRTMwRLhr5qZ84qNVA6QpYNlpw1UWMbl4h5Im9A0PqTT3++IYT
         CIyA==
X-Gm-Message-State: AOJu0YxMAC549scBETBAJbi1JrVbLHE3WiDzhS5ZlCZX1j6Yktawdy4w
	u23wlLqBmL4FPz/RMjw/YbmGLhx+4c41+26xxhH8qtG1ekY0usGmv1h5jEd/V2MNEL3qhZZBUO/
	aYZhpBKUxk2HPFrI6Y/FRGMHcCajAwUvUR8moMEBSkBnBNwVQkEiBwLrs39yqM/HKAhQE3WpSHk
	XrOcjKGFI=
X-Gm-Gg: AY/fxX5zZPUPCapBUyLq2eejwfT/m5Wfj1GO9Xv4m1GRxaAEgPN8XQkhloRYoN8W3BK
	hv4V4ub7FcHdYof74VxDIXStxY7thft8NepfpE+idRAf2lw7Uky/TtBfXcXMuwdMbKZ2RufWDU7
	aYOFMAeHrJsFejEtDCv2GTumfVk0trOG77HdHfxbn69VDM7ahrmz+lhCUXwCQugJhfPH1xGopFd
	ch2P6jdywqmqZHTX7PDEAizZH5idQfhTElHn80yKNWNHnEjs9NHubqaTthdlF2M605Fpn05wDcs
	e9nrh/9dDENqc6wJRhYSbsg/OEL6XZI66ML8f/DPVj0IJv5JjkYsSqgWsT/ZndS0JSbPZX8KQXJ
	6wB+Bc1Zxy5ckrfZ4QZj/Zx92k6DVC1nUB0dnQNA9Mn9ewjMorrR0I6n5IIAEykaJfw==
X-Received: by 2002:a05:6122:2495:b0:55b:305b:4e28 with SMTP id 71dfb90a1353d-55fed66bd20mr5549696e0c.20.1765984170622;
        Wed, 17 Dec 2025 07:09:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj26x3o3HNScSCO+TdhBTzDJLbkGmqEmsMHchxY3Z7J7vEma2vksMWdyUb4zbXwhhsfpzPGg==
X-Received: by 2002:a05:6122:2495:b0:55b:305b:4e28 with SMTP id 71dfb90a1353d-55fed66bd20mr5549643e0c.20.1765984170165;
        Wed, 17 Dec 2025 07:09:30 -0800 (PST)
Received: from smtpclient.apple (185-047-135-246.jonaz.nl. [185.47.135.246])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f56354csm2574468a12.17.2025.12.17.07.09.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Dec 2025 07:09:29 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [OE-core] [PATCH v2 1/2] python3-pyzstd: import 0.17.0 from
 meta-python
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <DF0KOAGYU1ZY.399MUHSJMJ1BP@bootlin.com>
Date: Wed, 17 Dec 2025 16:09:09 +0100
Cc: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F86DDF1B-F439-4E6C-9335-8C8EA388F862@oss.qualcomm.com>
References: <20251217093409.914045-1-koen.kooi@oss.qualcomm.com>
 <20251217093409.914045-2-koen.kooi@oss.qualcomm.com>
 <DF0KOAGYU1ZY.399MUHSJMJ1BP@bootlin.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: Apple Mail (2.3864.200.81.1.6)
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=6942c7ab cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=/kpjpRmFdjEkggKB3J9tkg==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=RrKLVKsK1qj-mAyOmC8A:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExOSBTYWx0ZWRfX6OpIASpwmOBp
 O7ftJM3QneVbT5k+GtzNE2etFth6H7nOiDGKSQ63yaF2Dr4D4/nehSYki4dN+ZDWpq11n8KgIYE
 M4RyzTsxvZ2t/YMZC/qdCZTqR6Ni7eFefna0qUFAvDqY6pxJ84igx1JezaQGBYoY2spngXvH/zs
 027IlYfEDh6c0pnpz6H5Ewcg9gxS0c57FEYFJ56kGw83EEKepC8ssetHA7U5HgBiEJZ1j3JBaNW
 amfnWevZTrRHwhakeJBb9Yx0h4HTkEydqZLr5nN+BR8KoifXACKAtPxMSNIwDLV10CLGKzB3k5V
 +uFNfFnwnNS/Y8UNE3hJYsqC6NNpVumOfUGSVxSVhD1Kk3RlkUdH1TPj6UCLKtwJWA6Fk9BTEgv
 MzdJxegEeb/v3QyvCDdov6+Ebdrpiw==
X-Proofpoint-ORIG-GUID: DU_A8ls320PlPPWobYf_Df_F2lvTlZz9
X-Proofpoint-GUID: DU_A8ls320PlPPWobYf_Df_F2lvTlZz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228054



> Op 17 dec 2025, om 15:47 heeft Mathieu Dubois-Briand =
<mathieu.dubois-briand@bootlin.com> het volgende geschreven:
>=20
> On Wed Dec 17, 2025 at 10:34 AM CET, Koen Kooi via =
lists.openembedded.org wrote:
>> =46rom the upstream website:
>> Pyzstd module provides classes and functions for compressing and
>> decompressing data, using Facebook's Zstandard (or zstd as short =
name)
>> algorithm.
>>=20
>> This recipe is being moved over for systemd 258.x, the 'ukify' tool
>> depends on this.
>>=20
>> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
>> ---
>=20
> Hi Koen,
>=20
> Thanks for your patch.
>=20
> It look like this is failing on the autobuilder in various
> configurations, probably only with poky-altcfg:
>=20
> ERROR: python3-pyzstd-0.17.0-r0 do_package_qa: Fatal QA errors were =
found, failing task.
> ...
> ERROR: python3-pyzstd-0.17.0-r0 do_package_qa: QA Issue: supports =
ptests but is not included in oe-core's ptest-packagelists.inc =
[missing-ptest]
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2848
> =
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2837
> =
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2894
> =
https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2848
> =
https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/2829
>=20
> Can you have a look at this issue?

Sure, but I have no way of testing that patch :) V3 is on its way.

regards,

Koen

>=20
> Thanks,
> Mathieu
>=20
> --=20
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>=20


