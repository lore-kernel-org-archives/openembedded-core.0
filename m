Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30CED111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 21:17:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3708.1764278252488895357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 13:17:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bIGgpFRz;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=hIT5mE14;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARAQ8Pf288171
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 21:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yx2UTNB5F0FNOem9NsIjtg/y
	q0afHFL4LbKYYltsjVY=; b=bIGgpFRz/G12AwgdZmmrmh6Xu7nDUK9DjxQlXVJR
	ZCDkjD7yHfHZMACmysJzDW3Z1jcBOp4ara6DneXJOFCxFQfK/8hNonC9Aq7VQdN1
	AXlH0NRBPVRcosEoJQbH+W7Cw9eF+4ybF4LLkK/yjPCIAl7zWk403WfO91HMcKAy
	JyyXcPOglxZuglqWdOERjkrjZg0Wh7vODXA3npC8Vcyaqylg+HmkSU6s+bV3FNEK
	rOG5k5zQD62bZgNOWs9GhNHnNgxerHW86QKh4L8go1OEuKD4VrOiKwgkh4qMj6Jm
	ocKwRa/sLvXIZQZ1k0y0Bzl5nkKkKMF6hm+qtdL30aKbaA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmvxhbhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 21:17:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-343725e6243so1497277a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 13:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764278251; x=1764883051; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yx2UTNB5F0FNOem9NsIjtg/yq0afHFL4LbKYYltsjVY=;
        b=hIT5mE14af/gEwXpSrOu+HdWZH52IfJoDMYWXRrsFaJTI58ECjgSKksVD3CxQFnv5n
         3XmjYsaQX9nGQEp9pxKMLqdrXzWSXf/wW+NQttkv8FyGbHB5b5UuCNEzqzf04xh/He6O
         y4BuXPKbdOTUCnbKik8oP5phU6LtkJ7tKIaGv+/L7GlAlZfOb6npNs8kMiSWvUfFnTD4
         3BcAdNA/iHNQdL9ymjIuYyqhHG5TG36NhomPE+Xz1q41L1hVx/dlk0gM1VA7eB1M1O3J
         tiRYk6aIZpDQvAdT+0m4Yaeo9bMCfjnoyImT7X0M5ySJqN7Ud8ydQitLYtCWHtre6q3m
         mYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764278251; x=1764883051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yx2UTNB5F0FNOem9NsIjtg/yq0afHFL4LbKYYltsjVY=;
        b=wKp5J5vLg385Ke+LjwcBEJieI/UXxMeoy8FWZ4q+Sp3e9M1yv55/iB0kJPDwX5L/SB
         VfY7o7v0LnCBBdFMSYYGwHFHdXnZog/6kXvUxDPP7Vxi4aeztRRggdligX/M4NmZQ1wN
         xIDs9RHW5yMBJwBcV/hmziRAPjJrizHXgSYCpwzb3v3T3AR3FyQ0flAHBU7lD+YbTFKk
         nrncH3hLLuvZWGioAe02489buHzBNQ37UK95Q6ZqTBzQSn1NWb3oIetF6xdzO0QLD3aF
         WapJHMe+/uOmxwYyqaxIXY7jN18pX0xJNB/yULcjyGYCoe80QCz+VG0SAIGQqgpLRhBO
         nEow==
X-Gm-Message-State: AOJu0YyJTLdbXWp3hYt1O080rGPZzQoDOf2RxT52XCw9r+sc0EY/0szT
	YSK0GbsDGQWSxco4n7RWjZDjygTiZYGieKcTqd7yx7ZsqC1axQrxWgevoCvIkRfIXosJO8ofb1e
	WJkcqUEFAuu+Bdi2KOHMLG/s5bUi2b/F6NRpcNMfd6v3dU/GRa+v/M+4hnUuJaRAmHciquKziGf
	nORAbtK0SqDQ0QjhK3LLPKLtxOf/zk6tLkpzJ5IXepaV84svK9a47oR7FVBA==
X-Gm-Gg: ASbGncsAsJFAaGaFZ8Tq2MCbRXoc80UEFOAmioCazUeR2bVwmPQcwPFV8l8eOijOo3M
	VNXqH6QDp8YLAxIhRu8jB6obp7zmbiv1czJDaRx2pXNKBhrGojbp8iwkj8B6jZauGk/WmItZxK7
	uAbc0JmisYJ51PFUU6myHnCO8ZLh15u1FN6dvP/ihwXYdgf+GsYcMYH8TXmpF4B26IgwlDRi16G
	DTQJ1PWJkvNrhME5mZmyK1CjIk=
X-Received: by 2002:a17:90b:534e:b0:343:89cc:6f23 with SMTP id 98e67ed59e1d1-347298c0cb6mr29062603a91.14.1764278251169;
        Thu, 27 Nov 2025 13:17:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPomWTot5qGc3Mvf3fcnFZuusfTxTk+U1KhxJsC3yKA2WHwXiMGtTaRuqDVsXBDCJV6EMfPFJB4h6IRwP+QrM=
X-Received: by 2002:a17:90b:534e:b0:343:89cc:6f23 with SMTP id
 98e67ed59e1d1-347298c0cb6mr29062587a91.14.1764278250662; Thu, 27 Nov 2025
 13:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20251127030008.1421302-1-miaoqing.pan@oss.qualcomm.com> <20251127030008.1421302-5-miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <20251127030008.1421302-5-miaoqing.pan@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:17:20 +0200
X-Gm-Features: AWmQ_bmXZ24jUTmj4rIL5VUFPfZQZZfB65rjlc4bXKm8nGDNg0HZXHktSvdOPmU
Message-ID: <CAO9ioeUNNg9WWvVz747E256VD62ERSXAOq9G0mQ=y2BHwcgsBQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] wpa-supplicant: enable OWE support
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=6928bfeb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=HzPf44zMgwTnIHrpvYcA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 5YSs9Q3DoLT4Bm0d9NNC8022GXlre8O6
X-Proofpoint-ORIG-GUID: 5YSs9Q3DoLT4Bm0d9NNC8022GXlre8O6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDE2MCBTYWx0ZWRfX9MEWzlWTDdYK
 XlNwTOmJmXs//RtbKk+gOuWriKqQtytqvPpInvGL+zEOfj32rdNsfOjhKx8BeuqHo8CIlKD/SnC
 /eowaCTc5HzAK4diRtBEXKjakK+1Wt93pJAHJzw2OR2QlxtvBrspNu0JnQX07/+ZK23iK+hFR/H
 odoV9Tcx4p3OY04EypG0AUs+GbIIKrXs13SLlfuYwPU5h1Bd2+CVLjyEqB09p7fXDmnMbpz8FEe
 OKkyXqov4SkT5ijfRfaaz6gurbFhBrTGSzAZSVjj0QjcqGoFoVSKj1pzXno3J+E8ji7gYidbDbF
 d1LZyXamAonkobcHWtCd93z2SeRenBhgGXxLmyk7naK72Vy0+Ytidi7Pd/WnfbMa6WYeZy876bK
 h8TZhKw4paRIOuPP+kZ3S8zJyv8i9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 21:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226869

On Thu, 27 Nov 2025 at 05:00, Miaoqing Pan
<miaoqing.pan@oss.qualcomm.com> wrote:
>
> Enable Opportunistic Wireless Encryption (OWE) in wpa_supplicant for
> easier testing and examples by setting CONFIG_OWE=y in defconfig.
>
> OWE is standardized in IEEE Std 802.11-2024 and specified by RFC
> 8110 (updated by RFC 9672).
>
> Disable OWE when PACKAGECONFIG selects gnutls to prevent build
> failures.
>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  .../wpa-supplicant/wpa-supplicant/defconfig                     | 2 +-
>  meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> index e313894ecd..8a68d56ffd 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> @@ -639,7 +639,7 @@ CONFIG_BGSCAN_SIMPLE=y
>
>  # Opportunistic Wireless Encryption (OWE)
>  # Experimental implementation of draft-harkins-owe-07.txt

This didn't get better, it still talks about experimental
implementation of an outdated draft.

> -#CONFIG_OWE=y
> +CONFIG_OWE=y
>
>  # Device Provisioning Protocol (DPP) (also known as Wi-Fi Easy Connect)
>  CONFIG_DPP=y
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> index 4a8ee1423f..971e55150d 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> @@ -48,6 +48,7 @@ do_configure () {
>                 echo 'CONFIG_TLS=gnutls' >>wpa_supplicant/.config
>                 sed -i -e 's/\(^CONFIG_DPP=\)/#\1/' \
>                     -e 's/\(^CONFIG_EAP_PWD=\)/#\1/' \
> +                   -e 's/\(^CONFIG_OWE=\)/#\1/' \
>                     -e 's/\(^CONFIG_SAE=\)/#\1/' wpa_supplicant/.config
>         fi
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

