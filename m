Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7903CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 21:18:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3783.1764278288130140686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 13:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SbRYrGtT;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fEJjJRzf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARAVtvM913559
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 21:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P09d6vI0yW4f7HFpABwQMzUf
	+mFXQLQp1E5wTLeTtCk=; b=SbRYrGtTCBhScswgaqqoOYFIeiE6+i66JK/8lrCT
	lgPsVfhQILBBpwk9FEjq4G6cQ3DBKdHXRjBVMUWiftuR3F0Dy20gDRpKzaYCVf9h
	Mhcz02+Z6kKo8kVaUUzbzUSbBsJAPQyfLvQv7UqrfjRekNvatUu9CjeZEbp5y/vX
	GmaPY4zeNfnIPre+8WZw75ESPO9M4Yi7MZNaP55TNEAuSbrnJUP0wRUg06ySBF8Z
	0XUfMI26KahGVv5BAqignlfL8yo9uqsrFbeSudQXXYQBsVjQw+l6WBjvpIyoiaGr
	MA9gJQ6RgkNfeDbcQFA+btubb+Z7kff7DCx4e2n/XYy+og==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmynsbdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 21:18:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34176460924so989060a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 13:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764278287; x=1764883087; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P09d6vI0yW4f7HFpABwQMzUf+mFXQLQp1E5wTLeTtCk=;
        b=fEJjJRzfOJj6S2AYrMvCY1ii27EUGnI5BKwijAV4+R2fVBKATMIr21XhNoA2dDQda8
         5Fsruyngvkv1hUssdbTGTqHmYGK0sTbHb2MZrGWvej8HUTQudGzWvXnxPKYnRfodhvEL
         9nSHyxt7dP3Mch55T6h+njY+la+OQ+etAfGih96vmiV259ha1mBRIne6nenofg9dyU+B
         We8jyhN+wayStX9VJ/DC9NJxqTLInGE9fd585vv4BFaPyogPednERDzCyQKk0rA+swb4
         gbOC7tk4Y0AbEDJhV091wtQRxNDNFVBaUtFSAMQRaJYSjyBrIwtwPnJX4rI89dE7HKTd
         rIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764278287; x=1764883087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P09d6vI0yW4f7HFpABwQMzUf+mFXQLQp1E5wTLeTtCk=;
        b=Bchimndeu04Qom1vQvGcyJ2SmwZTU64gukoCUZSsGUzNQfuTKRovIhyt9xhAEf160e
         KMIqpEsv9uFgW0c54la64EfFdbzDXxme4508TCiyWOCBFF1z2vepCR+cjYnDfIfMshB1
         jz8qrTPZv9OZOYnkWbdTznDYC41yId9HAvFJz6xzuzY+0eQzwUT9iYKCyTF7gy0Gw+ML
         eedBaOqecJWz28lWjiY4VBvaSMC9qL10BKQCp+Ql2AhcXA9MDPirI+yvSQiYHdGXNeHu
         bj2SPecPUW4nQ7Nn/WQdNYuLmBEMu988OLxV5xvzj+Ecgj4c1orOvIrMvXoop/Qwbxh6
         Aijw==
X-Gm-Message-State: AOJu0Yy3N2GDSYJnSnCbY1wjigl2tdjJgVF163qLJaeY98Ijq1HVfJD0
	nMj0FtTeAJh3ZGYxNFwlpoFMrrCs3hzQtIS90uwhT45uPPXxhiBvMienSSr9Q7XXAZhhf69lwA/
	D6qFK9DfsO+Z7BG/cbeqhv1/g3kLRgwR4ujXlV6/XDJ4TTwLPMHk0ReWHQIRKurFHpdv+YLeCvq
	/wV5ntaZo1DmmgLQklsrxBkMzqH1hvxGVkPabRDlkdRycKOOAuy+8b3kowBGBYPXY+TQ==
X-Gm-Gg: ASbGncvLY9G48QIBNJQLavmeC4R2TAt5YkA+Y1TqDJyCc7z8ig5MmzZmugY6iw3h+NF
	X2vF6rnVgHEjyWne6mWD3yD/N/uBVVG3eGiPh5+mS6k002qjApFig2mT3js6I9IuN0uK4bJG3EO
	D0TqT5hw1tsXIvoVMVbHnky7zawstAhILz0Ys7kxHpw0ecCFJp+W5C6SUqc0Y2NMWyGKuVLvwfj
	iIvxlVCjynfQuDxyTx6X5vQZr0=
X-Received: by 2002:a17:90b:518b:b0:340:d1b5:bfda with SMTP id 98e67ed59e1d1-34733e4cb47mr22949601a91.3.1764278286854;
        Thu, 27 Nov 2025 13:18:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaPFhEZbsSn3qNNmomrNeEjGsUyOrPgFFnyzLODAyxuXjJ8ZZnswfFWotfJ6k5fQmpxV4nzfINyEbLzC0zy5A=
X-Received: by 2002:a17:90b:518b:b0:340:d1b5:bfda with SMTP id
 98e67ed59e1d1-34733e4cb47mr22949579a91.3.1764278286391; Thu, 27 Nov 2025
 13:18:06 -0800 (PST)
MIME-Version: 1.0
References: <20251127030008.1421302-1-miaoqing.pan@oss.qualcomm.com> <20251127030008.1421302-4-miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <20251127030008.1421302-4-miaoqing.pan@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:17:56 +0200
X-Gm-Features: AWmQ_bmIDfFfc9MNINP6BlU47NnxaYOPVPdAqExXCNyZOyIc3OWJNo7OGI-QWQg
Message-ID: <CAO9ioeVLReHHCJjKS7_N1XBmWLduBWVcb5U5+bjj0m+87qg+JQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] wpa-supplicant: enable 802.11be support
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: CcRbzeRnHtvZtZennbbvl7bTwEg62T7Q
X-Authority-Analysis: v=2.4 cv=QOplhwLL c=1 sm=1 tr=0 ts=6928c00f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=uQhBY1hQgnLfB0oW8UkA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDE2MCBTYWx0ZWRfX9LO/ZZGQaxy3
 29comr2VGpdXGfg0reg9sLP1fV8Tts54eBWJVrGfvhosQyPH1Y7W+jC2Awk0zIbtlrJIR8jqqfa
 kP5ybpjLOAcaN8o49/pEDlcAiCoIIO/OJ8/II00ojuJUgESrAYUS83mvdMZntqQnoMtGBzKISuo
 u/t2l+3lVyeEH87bdoKKS8DOKHTQtmRXpC7f7ZQYkOuNjECbTGdqtqnd8DQzV4FKbWhNOIdZXVo
 uHcJM+jm0M3vb5/XEqzCKOdgwbOeGxswW//qtsSpNJetqnWEPPRpGQu/8U6Qy4LlOXVLzBZ2cJY
 A48KycsqaY9aTJ4XGBpc6X/tOm1k0SXG+LBYY8vrU9eLVyj5OdzH9D3UmwMms3dWtLRpyql1pjY
 LYDY/5XFCR09cnNu7Jz+4E3k260dLA==
X-Proofpoint-GUID: CcRbzeRnHtvZtZennbbvl7bTwEg62T7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 21:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226870

On Thu, 27 Nov 2025 at 05:00, Miaoqing Pan
<miaoqing.pan@oss.qualcomm.com> wrote:
>
> wpa_supplicant has supported IEEE 802.11be (Wi-Fi 7) for over three
> years. With growing market demand for Wi-Fi 7, it is now an
> appropriate time to enable IEEE 802.11be Extremely High Throughput
> (EHT) support, mainly for AP mode.
>
> This implementation conforms to IEEE Std 802.11be-2024, which was
> approved by the IEEE SA Standards Board on September 26, 2024 and
> officially published on July 22, 2025.
>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  .../wpa-supplicant/wpa-supplicant/defconfig                     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> index 52befd8f15..e313894ecd 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> @@ -510,7 +510,7 @@ CONFIG_IEEE80211AX=y
>  # Note: This is experimental and work in progress. The definitions are still
>  # subject to change and this should not be expected to interoperate with the
>  # final IEEE 802.11be version.

And this disagrees with the commit message.

> -#CONFIG_IEEE80211BE=y
> +CONFIG_IEEE80211BE=y
>
>  # Wireless Network Management (IEEE Std 802.11v-2011)
>  # Note: This is experimental and not complete implementation.
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

