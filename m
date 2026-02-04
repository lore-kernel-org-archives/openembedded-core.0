Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C1DE8B397
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 18:18:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1725.1770229111567969719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 10:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SSLPn1QJ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bu/53wr/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIZbD111382
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Feb 2026 18:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yECUPsQKCHt2QRob9vpgpNQH4wcf5iFU63PnTGHWSdY=; b=SSLPn1QJS3AuStVv
	PwQ/AS5QFMd76Iai46ShEMtH9qgeaL55LfsB37/50k07mIXSnla7xWVAXzDO0zSC
	2yCrANptN3iA1t5iOpT5x0zrikNJra1Qefhu9QplBNwrBJ8nmOmEj9oQe2gA+I+F
	BAoeYn5i4irBuDco4Pr+e1uFdw+qEX/LSLbM9GXQAngEKKLQIrsQkQWuj3pF26wk
	hymWSX+E68M2AyVUEpL5jnFp9tpsAOodgKc5e/THkZbiQ7+TutXf53x+deMdIP2s
	vnYTn0vLHRVVL2iPCAfga+AFXOjLPtVeD0/oPYkmQdSMp98MjxPLiRjoj0H2igtN
	arSWyQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44xjhd4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 18:18:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6b1b22b134so2603a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 10:18:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770229109; cv=none;
        d=google.com; s=arc-20240605;
        b=HEZ849JAZXPzn83MdY5ZnQAk2hu2lZuqt1NApaQVp9tVkIcE6Nq4FTGi/dtBjx9/MY
         ES1kOUHdXldpXcHTpORVuz5LWr4VVa/ZgbHt3mkQqpXE60x/0YGBecLIMI1mWQg3h4+Q
         BHKZeZzwCbPsNKhEVfO80T1SwwixYaBxMeV51yHE+NridXkDSWNERVwyO+QrxjDMnDwB
         zfMVEWk2TY56sM13Seyi+IsLNcHlUwsYY3Y7QWYzdLq2iXkwDfay/h2MGSXAigqPGcsK
         RFPJ3ZRHngkt5Nlw01Owt+zYKFiREqXiAHPAv+GJKB+G20qbKkm96vcS4eCpWCRfKpoF
         J3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yECUPsQKCHt2QRob9vpgpNQH4wcf5iFU63PnTGHWSdY=;
        fh=iaqNRezZkfPKh8n+cZ/7jFS0vEg6qpgQsGZN7mSnlfI=;
        b=d6EUXgoGj5wvAngUNUrX/ofEHWozTBVh6FdvKIOF1nu3PmXsGr4CbTD9T2em2+uMdS
         UXIJwvRo/CLT589N88yy3vFnMg1fxia7P9EdhFnxrgOEOV1q/DI7uU5AXGLMJmuVJ3U/
         NaWB5hFzAyMhetBmIDZ7EBfTZm0r0ZeAXwiddhcuHSu1pdA0UaMKOksnZjgKf6ggu6cK
         QMrHBPD+U9V7I/5AZr0NIeC1gpyT9aHtptp/bAG/bEHwlg4vl8W9bzCfsjR/92sOYbIf
         ImtATbcYJnZXOk54dZEERXPi7bvt5teweGs9Kyc3QpLgK+2hfrrlno/y1jjmHQ65pYl/
         FDYw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770229109; x=1770833909; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yECUPsQKCHt2QRob9vpgpNQH4wcf5iFU63PnTGHWSdY=;
        b=bu/53wr/cJNdJO1IX0ZWhiVUt7PU8btl//OqqSdkLc2RAqtn2Jl0GTMBKHYINwl0PD
         +WPWvJRVgdS9hJHsSPFOnHelrODHZDVdtdFIsGdR4vsakPn3BmcxFCU5N1cF0WpqSghV
         6+8Wm9Du3AfcbZgTvOBvuVPVkj512CkmuppCSaR+oaD3NfB5BsTxF3EhSKl8xPUCpUCP
         7pU/UJKCTIVqN1YqzenNyiP10W1QhqsO4m5x4LXfRZZT6nmTQqe7YdwOM5c92mwy//ct
         oBi50cc8FT7ndatKUYIjbcsR3O+3BpvGEAqs8a1oAamgfNE2FR5d+VeQuHktsYYexbYK
         NlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770229109; x=1770833909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yECUPsQKCHt2QRob9vpgpNQH4wcf5iFU63PnTGHWSdY=;
        b=Y6l5M+SKFlGYCLRrPcSes6MZbm925NZgEdyLcObNLLw+7nSlwrn4L/vjO6L4Ndqz9s
         XZzyQAEabSvY7QesB6eujHbEuo004GbK5iCk/QEhFrmO6y2FS+CsHiRwDHIlV7oEDj/e
         r8/XmK7sHuDvF+oaElBBK7AQuvpmotJsbEPTiEckqyjLlnYFhF1BLIjyvGp2VNx09rbv
         XX9yb4snro/XU95/xR7na8MiBuMu8Vca1GvlNXzHqcGFYm1ElSrv8S3rRjsmNS4XiyO6
         f8vju/JahcTJL0Pdlu1Vpsq6J5sdaGgzFoJ7vSfxvnTt9S2iahmxJOZnTNeC2EDxsOHP
         ysTA==
X-Gm-Message-State: AOJu0Yw0wjbNJnjK6emYP85dDl4BOvBykEdTr7FEyC6qCPZodIK9o5QR
	y+MnIcgfE0H887iv4Rf7wS3naqgBnI/6pzm0a04y/NzSy+y4T8EqWWA8QBD1b0o057MP1F7C2Ra
	B2xBsIpcH9z4JXoA7pa8lP57RghNY9CP8W8aZCmWC3utlaRVo9hBaK7pQozafnc04FvcrBpuidF
	KNkPfNkI6B/udchXSWOcg35t9wfzKAQ+6FyK1uFE9C/p+uGb8MsVAIEHPlyg==
X-Gm-Gg: AZuq6aIA4A54vYhL8aN7DxrgiRMtMciN20Frgp5hxzbVmHT53tr1wBJuMRpQNRObIZa
	zGyJaPs5WV70YMrsli0j6A8qJAzZx6VYvhXrs5i3Hs6ozHknOlVKLDweZzlxPJSFrSQqFxiUkrP
	Ro5F3Lwc0KO9/PnLS/2EF1hon1jlu3c+uQFxn4C18f0CBxh151qz2EXvdFIo/sXMPJjhRP
X-Received: by 2002:a05:6a21:6e41:b0:32d:a91a:7713 with SMTP id adf61e73a8af0-3937243b857mr4222089637.40.1770229109152;
        Wed, 04 Feb 2026 10:18:29 -0800 (PST)
X-Received: by 2002:a05:6a21:6e41:b0:32d:a91a:7713 with SMTP id
 adf61e73a8af0-3937243b857mr4222068637.40.1770229108677; Wed, 04 Feb 2026
 10:18:28 -0800 (PST)
MIME-Version: 1.0
References: <20260204052638.284617-1-changqing.li@windriver.com>
In-Reply-To: <20260204052638.284617-1-changqing.li@windriver.com>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 15:17:52 -0300
X-Gm-Features: AZwV_QjVWgUQ-ZNiSMzwKHBYca4ZErENlA1jhcvhhTlANF5eK5s7OfNgVsAdxR0
Message-ID: <CAA_5yotUG4nyeAZJ5nx76o+gzXz2xLWHabe1tCaq=DJDxD5otg@mail.gmail.com>
Subject: Re: [PATCH] lto.inc: add DEBUG_PREFIX_MAP back to TARGET_LDFLAGS
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org, rs@ti.com, raj.khem@gmail.com,
        antonin.godard@bootlin.com, richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DtpbOW/+ c=1 sm=1 tr=0 ts=69838d76 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=1Fw7GU1jXRJR5HgP4h4A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1C5kcpCU8-bndN4mJjj2L6xgSuMp-A9j
X-Proofpoint-ORIG-GUID: 1C5kcpCU8-bndN4mJjj2L6xgSuMp-A9j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDE0MCBTYWx0ZWRfX68KDNsWpjL4p
 NDF6c2BwyPE48yy9zsks13oFAGNrP8bqv9v9HJWs/GBKRd3O1XgSfKun5d15VBt5Tf+O+93HV3c
 ewlaxDTZN5cIIRRjTVUi3B+T58wZxFjlFv0YXlZq+C6IhbzjCCrZIzxu21WX98ah3wpG7DcSJ9k
 VQItlNEsqxiF2w+fJOUL/vOTdEilRJ6IdkTQEiRp0CTgOKmzat0tfDoc+LxrfTd/5IS00jPY2e/
 KwN3p4ekqHZqbBb6M6wmhCNn8o3ENzRllHjDcGsgTMufliRQSx6mIEsZMYZ+7u+hfD7mzFyWyvI
 71rQ6JhdfNAHbU8NrrkLd/mgG6PIpsfN5NLHAHUFFyfcWEme2x78ZOYslt46c4kSbLtMSeB/tQU
 2FoVXg144pOi05UsuVkcw3uVLayjjEOKR5liHVaVr0j/QCjja992I/wsHo1aHeeZhjTEbovh1Z6
 vWUNXGdIdCWgo03Lkhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 18:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230560

On Wed, Feb 4, 2026 at 2:26=E2=80=AFAM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> DEBUG_PREFIX_MAP is appended to TARGET_LDFLAGS in commit [1] for fixing
> reproducible issue when LTO is enabled. It is removed in comit [2] since
> this commit causes cgo binary not reproducible. But actually, we still
> need this DEBUG_PREFIX_MAP in LDFLAGS when LTO enabled. So, only appened
> it when LTO is enabled. Refer [3] for the history, with this patch,
> patch [4] is also needed for cgo + lto enabled.
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=3Dfddaecc88=
979967d0e00e2fafdbaaabec030da9f
> [2] https://git.openembedded.org/openembedded-core/commit/?id=3D1797741aa=
d02b8bf429fac4b81e30cdda64b5448
> [3] https://lists.openembedded.org/g/openembedded-core/topic/patch_bitbak=
e_conf_remove/117408334
> [4] https://lists.openembedded.org/g/openembedded-core/message/230059
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/conf/distro/include/lto.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/=
lto.inc
> index 227f0c5c2a..cef92901e3 100644
> --- a/meta/conf/distro/include/lto.inc
> +++ b/meta/conf/distro/include/lto.inc
> @@ -49,5 +49,6 @@ LTO:toolchain-clang =3D "${@bb.utils.contains('DISTRO_F=
EATURES', 'thin-lto', '-flt
>
>  SELECTED_OPTIMIZATION:append =3D "${@bb.utils.contains('DISTRO_FEATURES'=
, 'lto', ' ${LTO}', '', d)}"
>  TARGET_LDFLAGS:append:class-target =3D "${@bb.utils.contains('DISTRO_FEA=
TURES', 'lto', ' ${LTO}', '', d)}"
> +TARGET_LDFLAGS:append:class-target =3D "${@bb.utils.contains('DISTRO_FEA=
TURES', 'lto', ' ${DEBUG_PREFIX_MAP}', '', d)}"
>
>  SELECTED_OPTIMIZATION[vardeps] +=3D "LTO LTOEXTRA"

As raised by Randolph in the previous thread
(https://lists.openembedded.org/g/openembedded-core/message/230469),
this will only fix the build for users that are enabling LTO in OE,
but we still have quite a few recipes enabling LTO as part of the
project meson/make/etc files (e.g. lxc) even when lto.inc is not used.

Thanks,

Ricardo

