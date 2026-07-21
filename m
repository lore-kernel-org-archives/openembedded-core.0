Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B258C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:14:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23906.1784643247097868775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=BaRa7zQJ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=klnCKFM6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfpsj2962565
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CUhR7jQjDbhRWH0657auzzV8
	FKmsOwuYdxo1m+7CUsk=; b=BaRa7zQJ9bDxToz/TXWL1l/zK1HXr4ddckE2eBG7
	/i5yu/MrvRJ/nujba7eBqajRSL5DOTfQ8u6P7Lkg8HqV0xFa2OHXGjymWiYP1O4L
	10fUo1GgxLByh+qAWKoDSo9L3ATE+EPBiBftmmC9NHcYf/HWMNJ1J7gNLDa47Mzr
	M8mtuKXgtPOFuDXfAFWPzmZfOehDL/E7ouaozYTk9kTJBN6xFMzMjppbULJC26wE
	HlWs2WoJNR3F6jrPuWnH9koC3baGYGQ+t6fxEKjUinyHL3oSa2zmau7SeKsfDNvG
	/0yXQ9YBcLOu7cGsX1b9h5DTOF4A3jCKVI1e6K843z58YA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nss66f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:14:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c12e43b98so221180341cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 07:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784643245; x=1785248045; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUhR7jQjDbhRWH0657auzzV8FKmsOwuYdxo1m+7CUsk=;
        b=klnCKFM6nUTmOLp0jdOdwweycHPCjAH85J+5FALvvriLnlYdUZ0oRxpWcSzT9MV+ID
         vhB98V9YMT9F5mEjRKhmoOYUsUCzoHC+VQu+Cq3EEsf2OWlqKpxKmW8CGY9bWE0TyEQg
         1lGeFg/MdwNvilXbinjIYWWk2mIdLhiVF6mnsUtD3DRFV4ZtJivxMfTsZ5Gjhh92fRTr
         Xl+s47YtHuMPvA0ImqaEOonHSmD4Xmx15kL4vISYesM0sGRbTwH/9FMkLcnBeRkhc4Pr
         jRYEScrfb/qmUR7MLg184foP6dmsWFDhT/n9inZOK4Sujd9MrI+iyxqPlxxX0hKuuPh3
         cNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784643245; x=1785248045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUhR7jQjDbhRWH0657auzzV8FKmsOwuYdxo1m+7CUsk=;
        b=E18eq6K59W4smc1M0D2HVdm/vxlO3034xXnLkgnbpCwWmmAGq6S5o6NQkhm7n+FAfD
         nnvB0YIb+Nj20Syxfk7/5hPZN2eRL/8cWD+f04NTV1Pj2m0yt/kIXcViJNvyDfPnkZTQ
         FAilpFzi2tvqxuytaDxR2QoHqAYDoeT8j29USbXDAMJn11RfS4ZGhdBGgw3iEnXoYBO7
         HPCTEplg2Ue/b6VR+yrhUF3TN5PED6BAM0CehFplIAeltrUOjLpoRPl9EvaJ+gieQtUc
         M34LxaytB2JFLOf5o19QD8wUZGvgnDqEuovVkkNZjEAIYdFT223LhB9KeQ3n0/cNYc13
         gQIA==
X-Gm-Message-State: AOJu0YxR4v4Va1iaFNla0PtRN0S+tMXiNTSG8zpfpZzDwXl9NX61dO5O
	YdmodqBuBWYXioxIlqoxSF9J2F9J90evw2ns16/cpd9upRoIL0NaJ1MXv+j1QeS8axiOxkbigrI
	bQtJ2nPOM+HOxNY9du5cTb4DkedE0Fw65jBveNAXVtjXJNyTk4kx4b2u3sKkZ3LLvs0tjkjPSi+
	8fSk34Z5Q=
X-Gm-Gg: AfdE7cnzbGztnGw7MTHk71Irdupt6ar9VpG3OZnYjhwh+kSSBfxpxMxkGbI8nfIdR1x
	cjcVRJ525zqOWiTAWVHdk3+3QWhsV9D3Vs1PMTVr23GBTtJPMDOwFbM5PM0qMjyeqk1BSrakewi
	8F4t6Lcu/iaSl/Ifoonh8PBreGiZXcXDP/TSzaqT2vaxC+g/Z8g1ZU3U9M7prJwpLZzHm/l//Ex
	w5u88ONRt6qO9b0Nt5rKcPHuborR7DvVr8592kz59JD+IvYq/D1FOIZs5cqgTEx4opoDDSb/H6W
	fIm7E48/kq08O0FkUZntLOftwUeJzdF0nyjt5FWzOWVTQ28QEge6kbhImURdZoE1z2eWpvo2PNa
	eDsESBQS3Hb98Ebghg27t3FdYxsCQn/HsVfzYCk8Jdmv0ruk80VrFmwQuSwT49Q5R2e4+w6JSPo
	Elg/wwiWq10Kg1Uw==
X-Received: by 2002:a05:622a:a591:b0:51c:9224:398 with SMTP id d75a77b69052e-5213e67b7c6mr170282971cf.60.1784643244258;
        Tue, 21 Jul 2026 07:14:04 -0700 (PDT)
X-Received: by 2002:a05:622a:a591:b0:51c:9224:398 with SMTP id d75a77b69052e-5213e67b7c6mr170282501cf.60.1784643243815;
        Tue, 21 Jul 2026 07:14:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e0e93csm2969680e87.44.2026.07.21.07.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:14:02 -0700 (PDT)
Date: Tue, 21 Jul 2026 17:14:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com,
        richard.purdie@linuxfoundation.org, yogesh.tyagi@intel.com
Subject: Re: [PATCH v3] llvm/mesa/rust: simplify llvm-config handling
Message-ID: <iykx2dad5o3umibniolur5otluacebwsdfdnwl2gbb6di66syd@65hems7nf5vw>
References: <20260612034643.3215188-1-Deepesh.Varatharajan@windriver.com>
 <ua5eetd6y7i3ss5kn3qzpo3lpjzj7drk4pvnn2iuosijy5buny@mbcoibimaaxi>
 <90de438b-e79e-4599-b3dd-343c84361a73@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90de438b-e79e-4599-b3dd-343c84361a73@windriver.com>
X-Proofpoint-GUID: 80GIuy3_EephJ9TZyrgS1IoJgWrwE67h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MCBTYWx0ZWRfX4KIxhfCqOBeF
 FYpkg1/ZtBmnJ/Qr9liSowKcPKNQxkCsnGaG3D1CgfmnmkUYtmKsuvtBeso4an58gHOUdR5dIJ8
 wRZW44L8fIVCAAJ6x9ZOdua6CzWbUkk=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f7eae cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Q4-j1AaZAAAA:8
 a=1KakBFEXkdAjE09Iea8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 80GIuy3_EephJ9TZyrgS1IoJgWrwE67h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MCBTYWx0ZWRfX6Pop1DtxpvDe
 Uai7pnConRMg5/KyePWxkLsL6MMGve4IqwuMVfYCfACrXvTLv9+TzsqMl5bVAbSGibL1t0WZg8u
 iYcxHXMa8MBY8euaoMpOE2dRTtg92KQj67bhKJlsUwENrx8kEZQEtxPFPmGx2JB1/zTjyGj1R0C
 OMlp/e/5kJkjGX4krhUcEi4g0y7ObIYkRdY3BlkK1wGOsydI6hIESGvlmZree2UXe0BQMr4tp+I
 XTMqBmY7434AcyeOGkw9TqqjzJ5ibJmtW4nYnOUVdU1jQRGSkRiuymxZilOm4AK9cFNgXugu6td
 4Vc884YciBmrUSYTHHgUsCyYtfQOTZ0n9/IEYQjhe02RI3miWeKR6Beg0yecy6JofK8A7T3ZEzq
 qHE1dME5PUsYV8eKvipvkMh/6W5ciy1asdjyeIjSnhmaqlLT5iiHNyHcbwBWIOBaYx095+zSH35
 XDzIrYwqvSkSaxfY+Lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241534

On Mon, Jul 13, 2026 at 02:20:11PM +0530, Deepesh Varatharajan wrote:
> Hi Dmitry,
> 
> Yogesh has already posted a potential fix for this issue, and it is
> currently available in Mathieu's master-next branch.
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=mathieu/master-next&id=2e8ada1cb07d6dce8a0894b427b18b2bc585a2c8
> 
> I tested it locally, and it appears to resolve the issue. Could you please
> give it a try on your side and let us know if it
> fixes the problem for you?

Yes, commit 7ea79279820a ("bindgen-cli: set CLANG_PATH in native and
nativesdk wrappers to matching clang") fixed the issue for me.


-- 
With best wishes
Dmitry

