Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A7FCD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:53:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16873.1779875634029238606
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 02:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SAiwHwzz;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=PllU0+Kw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R9qxBW195641
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 09:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0RyMnRzpjssW/mFLu9AoWc0e
	d8vVdjZasZ2aVjxkI64=; b=SAiwHwzz6YZ2bU2IREaRY5prpwiVXVIX1l2P5N/k
	5YbU+e+seI+g2fJnaiAcOiFuu9priSapSM1ZC59E0UtSVHnWLPTBLnQnDmk89Nna
	1mS2gbM0J7ick3vOiw8r0kNs+Lb/tsV2T7PbZApj33yHyg3ZUzOsrWNNcXDZMs6x
	8UPXRvP4IZ+BiRGSRjms+mMN6GSHdgHHjMuTtKau/BvQG+1B5rEGKwY1qtQ37ukg
	02ALREPVPawFuTTneJ8+la6N1ubxQaeC07gYxC+5uDmhTkHXX+FcUqnRH85R+mF7
	UZKG2twPBK7/DFMPfwLZkwrL1CrMu7ZinkS6FE70m7GMMg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxce8047-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 09:53:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3403e99so64056391cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 02:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875632; x=1780480432; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0RyMnRzpjssW/mFLu9AoWc0ed8vVdjZasZ2aVjxkI64=;
        b=PllU0+Kwnjx7+OysJxLegQW7MWkVO/TP9YMadKCbacg3XfySAk9REnk9SGexSMcekr
         7NehaqR9/VGPdS5VQIzqv+FHZathSWaqYeQjED5wjwK7de5aQaR30PQKPnRgy8kX7NuU
         qCCYgkefAQDPcmuzBHYGdALM52unS6qw60+4CLCQrHvqcBxp2JDIlaGv0sFb3zBXK07v
         AIR9+UUd1/xiUxkTJjC7pS/dGY6Gwms6e6U9WooFe3Wln3xqKDilyhFeGBtkVj+Z2ORh
         5ZkbtjqU2JPoRCDrHp/U4NVaVn5XIWaeyet1PBmXGCnBPfuyJqABX6OlTTR7liT7of2U
         Lhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875632; x=1780480432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RyMnRzpjssW/mFLu9AoWc0ed8vVdjZasZ2aVjxkI64=;
        b=Q/qNM0oF2stmYXAQXrCtjoI0rj8g+MMsFpbSTPvfv8plgcT4wLJtq/uON0o0DAU9jp
         FLzEPW4e32s17ihdmhWjqy9kphjCQdd/MaAw2PMF6GUYV9WHXMQh5qSjrYZMHCBUOako
         uoFbqyOC6pcNxFYJDbdP12mpmiXRxyqAlFc4HrTGUUDNweYzcPV5tl23OsbaTZV1LZNb
         FM1CBug+ND0sRyuFS+czv7zBnH4x4/H4sTYQ5593kItj7C1b+4S5UEUN2bGFSpGyAhP1
         SVpDDVmS25XcrnvIgyVH3Y16bvUb0zZRAGwdqtwTSDhp0ohjj05JNwJBsgrNrs0oZBpz
         2P8w==
X-Gm-Message-State: AOJu0YysLBqT8e8N1JrwmJbVj0Yqs6zc7SdvxONkmNIhrtnXtdriPR/w
	fYw9BL+vICBumNrvC0JIroLmbrSzRtnBbPuvuaelLM4znk6Uc5RNHsi2cIEwNWshQO/GdyCUNBy
	7B56QfCa1IyBvSTT+OrV1nmBYM743pKNM6Arrb1SiP0AQGQWhrIUxw9EjkNWtHwUMbwfJwzLGn2
	8FIj0zFdlqSdrjPFFi3A==
X-Gm-Gg: Acq92OHDQ7pLGAUa0te9q+PQztEp1cFAjxqAgRlP6nohPnsMeLM5rWtKmVdFMDXgYTM
	yAfqD+az+hhxsIyGzSQWxFEMmusVuOCXD/cWdWyuxw8cJJtrqDNAcR/TVP3ex8AuKrTPOuBdwe/
	zbWeU++61CRVkb9+hwfoNEgjIXkV/Pa2+1+jpZdtbE+Y4Pk7EjBDg97Ejw99iTH7K7F4onXkQcJ
	gP2YbInwFxu3pEFpD/7YB6CZ8aLUOGoJa/RsK9ANxu6UDU6rHL0fYRBBlJ281F+I7Ps2fX8DTZA
	Lc8mueg0nux4WrN5pqxsmSOQvNvxt3mtin9WVvYexG2/TJ/5tIwpVlm76XavHubsOHby3J4Q6qT
	VQobsxxIiECrgRMV6aZGTcsKOKrSE/JC9aVHVbCtNcw5ZWDn9qlMawfeVSdYF6urYGjcWO3fHXD
	DZsUVbdAfbGCIAHQ41SMLzsYDhlXhr7udwH4zv+dIwByoduA==
X-Received: by 2002:a05:622a:134f:b0:50d:6b06:a453 with SMTP id d75a77b69052e-516d445ee68mr306779341cf.18.1779875632664;
        Wed, 27 May 2026 02:53:52 -0700 (PDT)
X-Received: by 2002:a05:622a:134f:b0:50d:6b06:a453 with SMTP id d75a77b69052e-516d445ee68mr306779061cf.18.1779875632194;
        Wed, 27 May 2026 02:53:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2c6e3sm35932491fa.30.2026.05.27.02.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:53:51 -0700 (PDT)
Date: Wed, 27 May 2026 12:53:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Zhang <wei.zhang@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wpa_supplicant: Handle invalid op_class 255 in BSS
 Transition candidates
Message-ID: <qvdfgutqr7wpdkycvhkvexjl6nbkdaqtyyv5zdkor2ylivvewo@4aoqgsynvgca>
References: <20260526083048.4122860-1-wei.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526083048.4122860-1-wei.zhang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uQpJmbmmqflWUyhgPAz2GYg6nYyEgZXx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5NSBTYWx0ZWRfX/CHnbWMpblih
 ha55yG7syL54BgkL+7vCmrsiGpyhuKOXQY5q4OGNWCydX9d5QIVHq2SeGBAUWoYH3y25FTqLP0N
 7ozYhYuRRrpYcLxFWT/L4YatAu7OslCCTf/5jssRN3Bmv9M/JrrybIB2Asq+UxaB/nGwvRawKL8
 h7+Ve9aZ6GdeBVVr6e5hhmrehE5bKJ56iSFJ6B5A1v+JXMCA2PxFSqPc/vYQuLU/PYas4A//+EG
 vsjbR6pX6H+h1AzXgKXKI5f2qCSvZgcD49Y73HhTCPvHNATgAi5hqeVPG6ZEcTiSb9WCs3n0Jux
 NMhgUXbqEAGiUETBwIweWsP73f1WFIuPGSq9XkUdi6pV2BnjFynZWqUsIMbI7iq1OaYMyUnqREX
 20Xq2KgzvuwpITua6gdoSBizfyMsIZqql3/7qjHhtw9DtAUX/UoEuIXWYqlrncEKC48uWGWfU9j
 DNBTTfsDbI/JWPaXkrg==
X-Proofpoint-GUID: uQpJmbmmqflWUyhgPAz2GYg6nYyEgZXx
X-Authority-Analysis: v=2.4 cv=SIpykuvH c=1 sm=1 tr=0 ts=6a16bf31 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=4UIGuFfXKTCrLKAPk8QA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 09:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237635

On Tue, May 26, 2026 at 01:30:48AM -0700, Wei Zhang wrote:
> Some APs provide invalid operating class (e.g. 255) in BSS Transition
> Management Requests. Fall back to deriving the band from the channel
> number.
> 
> Without this workaround, invalid op_class values may trigger unnecessary
> full scans and degrade roaming behavior with non-compliant APs.
> Standard-compliant cases remain unchanged.
> 
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
> ---
>  ...r-broken-AP-operating-class-behavior.patch | 39 +++++++++++++++++++
>  .../wpa-supplicant/wpa-supplicant_2.11.bb     |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-WNM-Extend-workaround-for-broken-AP-operating-class-behavior.patch
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

The same question. Which branches does it need to be backported to?

-- 
With best wishes
Dmitry

