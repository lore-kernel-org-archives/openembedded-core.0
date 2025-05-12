Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B75FC3ABCD
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 13:17:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.50273.1747055822191776415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 06:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=IH12VYWE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C90Xt8012804
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 13:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uNpsYexoulW+5uC8w5LOMuGH
	osqJlI363nqfW4kKkgM=; b=IH12VYWEchJvuaRDkytGnn0a9U8rj3S3u6EjI4IU
	1MseczL08V6T1I16Mat2vsWgV/ttoBa8KeOvfxRxM6J5PuGcasZxjofeh5A+snA7
	JjNkcZuJu2S4xbBOhk9Gg2QGh2F2VaP6xdFtJ7IUsfj2k03Qg/012Or6M3b6CU/C
	Ry3SskWiyUflUon788wizxMyfEYXWq+nWrF5O+ce2sX2frsfewD86GOtUPvCL556
	Pk4ZhCAnou+8mtL7grOrw4whPOCPZPNqdSK4ZhCOneDb/ShQXPI7Myg74YtdOmnC
	l5dK5JUG3tq9K9PuMV5zKh74BEyxtmUgl5SshD1eDYqeuw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyjjmcdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 13:17:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f6e7bc2598so55997496d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 06:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747055820; x=1747660620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNpsYexoulW+5uC8w5LOMuGHosqJlI363nqfW4kKkgM=;
        b=npXTkTiQhiYs7zO8twpm7BEPFIy36t5+xGsMV0JTq8FMigyP/XhtEBOGda3K1FDM14
         GsvITRrm4chhAFCN5MeWbMV3ETjb5YNyNDpdaS803nrAstapsp9HcruymhceAd6fvAmd
         7fLxky6epfrs6ak+7unrU8QkwGmyNrGXEUlk5dfD04ZTP/CpopjMABxMNSLmXalTPk/A
         m/EcQ5AJAy45CfHw02XzKv6btlrBDNrocsMu6sLAOtDn234eBBCtaVDPM1cQm0H3sJzW
         DY+Zs6WTNAL1DbXbL+eepndLAkykR3FrhIaBpDMLUuFf/8B7fzSum3kfgkiHIXoO5HPA
         L/3A==
X-Gm-Message-State: AOJu0YzPeILsuW1ey2HA/1Eybz6T2gAZnkTwFxDcS64obsNgvx5HbhEO
	Pxr17c3rVIMt3GPZx4qo9I+wGjFH9/E5aoVyP8agEVNz65eESYnz7bWq1dv+FgQENfenD2dz7jD
	CxlK0tMhNiA7v2owlN4et5OneYi7c0yqMf4wEr8qnZ3nBHUR92HheDOTKyvQ6HvEigKn7outuN4
	IKPwU=
X-Gm-Gg: ASbGncuoKpRNf7xuGtZ65MvxyseuJU8Yy9Siou2adAX/cuvCNLZvi1wZF6PvlvjFloz
	UhaIV0opB0Wd+/TQU3xjLk/heCGc5kjT0iIgqC+LzZLE4T76pXL4BNYn/n+RneFkBY+azp4v7jn
	QRBZqqxs/6CdsgsXseGKgt6BDe8IaS6paqYk+4V9xZZyedRgM6EYB9PTwbL7o9ObOaWwBJbGp+4
	/23+O7Dc/WReNMs8IjeoNGtGqSgeHH3XsCJ/2M+kJjv37rNX0jstTTEVPoEsUly1nxN77bzoxQW
	5DUtkHY+2hxOfzbtT172jxXPE/HG0mRQt9UDAlGaLiOPUeBySAHhpVrw6y0O7BQ4fSgYR08XmrE
	=
X-Received: by 2002:a05:6214:5015:b0:6e8:97d2:9999 with SMTP id 6a1803df08f44-6f6e4809ccfmr252389636d6.28.1747055820365;
        Mon, 12 May 2025 06:17:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IES/zkQkggRcURoGp+f2wHSvXFMcPOYO9n2iZid3anbbkUGKqxop36dQPU3xXOeA6jpXtKASA==
X-Received: by 2002:a05:6214:5015:b0:6e8:97d2:9999 with SMTP id 6a1803df08f44-6f6e4809ccfmr252388836d6.28.1747055819617;
        Mon, 12 May 2025 06:16:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6fe9sm1482514e87.149.2025.05.12.06.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:16:58 -0700 (PDT)
Date: Mon, 12 May 2025 16:16:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: upgrade 20250410 -> 20250509
Message-ID: <3kaex753mg7oxqp27c3fkygnweftsxh2q7zyduq7b57baa5sh7@lz7hxweekkcc>
References: <20250512113615.2112807-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512113615.2112807-1-vpuar@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEzOSBTYWx0ZWRfXxGYtMKU92NLN
 ciTM9+6+mCr7fr4hTgpgApIEcKrWGPgChKkC6XO0RRSG+Sf1vaikGRYNqlGQ98APNWsU9sxAFmY
 oB0p4cO1lct7mpbMDwFo5sMsaW2uHS6NfsOuZ3C0Z96TbiTrjTOJFu5dJlRzyAOwew4vrBWGHhp
 AoNLwN8DX6LWatirKLuGr4xT9j0Vctf8VamsSOjP8vWJkorg33WAt+us/uY8rE76uCTsRb+booN
 AzJyixrqoSl3y9yuZ+vmanI/7/+4E/oLTThmeckQuZUj3fsOm4r2M6mBwRLWjmfUtQ4WRN3AGtQ
 ycaYSNY/7WN8+3swmIvqeibU+blkCaLFX1mcqIU94uiyg5Ve+iqEDs1neGFTlzMaeKnwGaoI11t
 tyxTcOztqWpDN2RyIOGSJwnqI3cY0fF6Ifb1xB7d5tU6EiXUbDB2wjEE9zplchfuTMzKhR4k
X-Proofpoint-GUID: L6aEwEm3feOVbTTkQ20viNb_0TVT-R3n
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=6821f4cd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jCjuw5A81-ZuOIb9eBEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: L6aEwEm3feOVbTTkQ20viNb_0TVT-R3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxlogscore=900 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 13:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216367

On Mon, May 12, 2025 at 05:06:15PM +0530, Vivek Puar wrote:
> Adding QUPv3 firmware for QCS9100 platform
> 
> License-Update: additional files
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...x-firmware_20250410.bb => linux-firmware_20250509.bb} | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250410.bb => linux-firmware_20250509.bb} (99%)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

