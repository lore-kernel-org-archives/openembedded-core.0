Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7F6D11191
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 18:40:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1331.1764182439925604456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 10:40:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ap6z4zUv;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=BBDjYloz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQF4njR1457048
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 18:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fk1jQlaYjCyBSLWCH3yrt8pa
	7Mr3AIw2kYLKn8jC1KU=; b=ap6z4zUvysdXJMAe1EeN8wPlAUD3uIR3igsMcOB7
	WgLSpfd4yazSyrFZeIBT6PFaihYKfBszsPt28+GPwMi1vUII2miITnsbGlD2WrsT
	T40n2WwMH44ZAwJwqGweHyBvk9XiUfsSS2Eo6u7v+7hTMFUg4vaaRHd9RVSNQJwA
	ADDX5enQzZQwWBsQIUka6RjtqpZvUJ9Ek9aS0Vx7ZErZNIxg8bZ4Yi7puZ+J6NK+
	DtaoDVUeX3/d18BsFOES3dQVEtvM+y2Ok4i7XjKXYmMPOITkSoGa5esS+OGu5zvL
	CWpa/4iKBTwhhRx6/xOEBQSjWJJjNvE7XwLBsir3jlkUdw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvj01g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 18:40:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297e5a18652so686365ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 10:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764182438; x=1764787238; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fk1jQlaYjCyBSLWCH3yrt8pa7Mr3AIw2kYLKn8jC1KU=;
        b=BBDjYlozyX+ljfRbxjlvqfOq7TsX0PtjQVdhW1D+sqi0+Qzugwe8XoHiZOiwfzdO/U
         Mtsjq4T7gsGtDPT9Dw5bMs59VwjZEervyo87lEY02tHYPanVDhWsz9WUCAIDv2G6Hpvp
         mj2aiskhv33N8BIGSLDRzJwnMYUA+3gnx4lO3GZ7kQ+TVLVqz6pvnccMiVvRH9+B47yQ
         G4rFEB45rYfpXrau/1It/7V4yuaH0ysrQLYmR8TAn0hFRazGgN0wWILoL9indcnCrAWP
         Tx4/RUz7dlo20h5SkPSWXL0boiFk056hxECbe5oyJnPnRoCH5BBBkTtPePzPu4ZC/k9E
         7/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764182438; x=1764787238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fk1jQlaYjCyBSLWCH3yrt8pa7Mr3AIw2kYLKn8jC1KU=;
        b=HECOMKMYyFeW1lEMTsm5dj8NLByAWHRKsnI5ZJf6lfTgeuQyM6Cvc4ynxuz9UgITGY
         wr/Jy8ZhWdcjYfD+9ilQbiUYDZmZIri+kEVS9F19a1wlZjhb1GkMsbPQWXXLrnlhnnQT
         pX7kFnIeSHATY5sqk0t3BjulnZmb5HimBsdLofCtjyHy3xUAXc+ziYziNIU9T4r7uWrq
         ID9pOQ/dm3I//xzN2T1DuC9RuH6eepDOM9p1DdU8u1/0hZTKIGiIhvQQWfGthcxmwVxJ
         hUaM0b/3Yo31Lv3yfTKnPVAdvg2Jjzu0rxtBy2RAFV2hNZi5MKG1Iy1rMXt/Xy9TaTLl
         9XjQ==
X-Gm-Message-State: AOJu0YxaaEKN3vlat3k0HZHFHMYZWnnPtwPWpqoCQwP7WtJSQM6exhCN
	ZnJvVROgtTKq5GHfhQPY2wfhtEyMZSloo0fQOuuJVXLX99Ni0QmBubBannOLhrrnU5wIQUutpiX
	NEfXzsi7ucBHUdI6/QVCQfAEGa0YvVfCLEDaOhAqMjl3ZRqqK7DbOlIvlyGyMq7NJU0kU/DSEQK
	/ngmMD5LZA1M4Zz7aSubgWRsgKYmDMRufBO7LhFpl8WtbqQYUYflt6ilIWyA==
X-Gm-Gg: ASbGncvhcMFUKbviZ5qtgwZaqfA8kvmGelbZ5ye891s/HVvCAiYGDpwTXDMaUU2qfNN
	D7nhyb3WY4ZtPk0hz5kI/VTzGjVCxXMmWrBc3vto+9eBeFIn8wuwBLsQIFwR7KREPAMwySZRU3y
	ZmZWUXxSwEAHfvK2fqv40Iwik5PJL2b4isGKoujLRUv8OX78XRlQfpwhdVztDvFf5zz7F/zT4qL
	42BfSFx
X-Received: by 2002:a17:902:ef08:b0:298:60d5:d272 with SMTP id d9443c01a7336-29b6c3e42c8mr226237835ad.17.1764182437660;
        Wed, 26 Nov 2025 10:40:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3GdZAOEBNFyLeSh7KzGzPdlEXYAGx3fCF6G8YVKGncN9+wFp+1BXBinYQnic/OD2NJYqwsAB8vac024GTS/U=
X-Received: by 2002:a17:902:ef08:b0:298:60d5:d272 with SMTP id
 d9443c01a7336-29b6c3e42c8mr226237475ad.17.1764182437058; Wed, 26 Nov 2025
 10:40:37 -0800 (PST)
MIME-Version: 1.0
References: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com> <20251126140713.1414484-2-miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <20251126140713.1414484-2-miaoqing.pan@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 20:40:26 +0200
X-Gm-Features: AWmQ_bmZeUx-MyUYL2rcNfSIAVdmft6cq6twJlvKxYugm9mm9Z8w1zrVPixfUSM
Message-ID: <CAO9ioeVtdprhvDaORnLmpQu0Jet-TofiTkV4ZRnFMnHuj8K73g@mail.gmail.com>
Subject: Re: [PATCH 1/4] wpa-supplicant: restore use of packaged defconfig
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MiBTYWx0ZWRfX+ApGibeoAYCA
 VDF/OEyUpONF15vSBatpytm6fDj//bK/b4v8dirGbdJgJvqWX64/wMcn6I1v8j7P0ea7/dQR/ne
 IgspFUUDiRjaNUC8UymX5AhnSYLJsZpm6SRChX96WJ1XZTEg1JPPUCDaAkQLgzWwwF8pmij/HCN
 OxKB9dvSDcqqXNfM/hcYpfNZNmfZIEdAq74tdNN2pICihyIwmU6j8Dil8fE/SU1pnG3RqFYCcmj
 lJsBN8JqGOEpbO1jdazw2f7bTdav0u9t8m0k38Ml9lAUeKyIpm+dCNYyvmKmnWvT9pU8cDFcxxr
 u8yhA6C+X1QXVFGErlaPZT1gnrz0mTtS95/W302yefuucVtk9aPHOgXABubZo2+H6g11rIlAObk
 39CwoQxU/SHo2Cn/1FJZxm7U3LKyuw==
X-Proofpoint-GUID: JYzsBD6FYPSq0zNlJrBV0Eln40HOYPRf
X-Proofpoint-ORIG-GUID: JYzsBD6FYPSq0zNlJrBV0Eln40HOYPRf
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=692749a6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ddjcHIbyFrjq3EGa9ZAA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 18:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226809

On Wed, 26 Nov 2025 at 16:07, Miaoqing Pan
<miaoqing.pan@oss.qualcomm.com> wrote:

The patches didn't hit the mailing list. Most likely you need to be
subscribed (you can disable delivery of emails to your inbox).

> commit d97bedd8bdcc ("wpa-supplicant: Use upstream defconfig") switched
> to using the upstream defconfig, which made it cumbersome to enable new
> CONFIG options because the upstream file does not include our custom
> defaults.

No, it's not about it being cumbersome (in fact it's easier to patch
the defconfig rather than the out-of-tree config).
It's about the feedback which you got from one of wpa-supplicant
developers that the defconfig from the source tree is an example and
isn't supposed to be used for builds (because it can change or not
reflect anything).

>
> This patch restores the use of the packaged defconfig from version 2.11

Imperative language, please.

> to simplify enabling additional options while keeping our baseline
> configuration consistent.
>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  .../wpa-supplicant/wpa-supplicant/defconfig   | 688 ++++++++++++++++++
>  .../wpa-supplicant/wpa-supplicant_2.11.bb     |   5 +-
>  2 files changed, 692 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> new file mode 100644
> index 0000000000..52befd8f15
> --- /dev/null
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> @@ -0,0 +1,688 @@
> +# Example wpa_supplicant build time configuration
> +#


-- 
With best wishes
Dmitry

