Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CE9D1F9D5
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 12:34:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42419.1764851668744011519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 04:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nMRAvqOO;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ROWxi4TP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AEuZh1087119
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 12:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g2o4G7T7H40kJgt07wtzrB59
	GMlTTIFWE3xy++HwOD0=; b=nMRAvqOOtbiO7xpruWYjWxDf4SBI9uopUi9zOk3j
	z3Gp3nwliNvMejvoGU0s7IrSEW6h5XtxG254Tf2UeecxA/JsLR6rtmZTDOAYYfCv
	d98GoB7XNS0XQxvJ0B9v2fWPao862yDxKYq8DzSOVVkPcUQteAIaFDd24k8JvgNH
	WTVugY+da8ism4wkqYQpGZoZ5xUz5uQgoN+EdlGS4TTOuVVIs4jHiNqxB5UDiy2U
	77JrCWD5OuYL1KcjKDUzeD2YLXH5m8Yyr2DjOPrul+mTon4C8iL2gooWAHXNknro
	+BmBxfgPDMEjsKoRME20k129OU7NYScGVdbw66ncOxprZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmdc22b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 12:34:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29d7b9e7150so9400245ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764851667; x=1765456467; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g2o4G7T7H40kJgt07wtzrB59GMlTTIFWE3xy++HwOD0=;
        b=ROWxi4TPFHpHztec14LAdNF607AwRVawv9dGaYchtZzTw6wJpdY/4DYVFq7G7xkkW1
         RTRlADiyB/5bjZayCyAlNgDUYpxtJOmZJeKm5YcvjuerdU01raQhY1X/0EgcZSCYf3Cg
         kdcWwdTq7Ll+T3GyzbuLX8wlQlEQAGFsInmILqobxcliqtgdBoGrJg8TcV/Is0QFfw3C
         IsUidbN+U5lfV6BxVYjUDk1IEfVXCrwRrUBLOjnKCQzZolTiYtTcAUV4nwLGiGfPYvTS
         EM8NZpU6fCamcKP57dgcx4Dt7fsZ7RCL721xg6ETFUwDAtcHTZuI0aU7SSs0HIm1LXxg
         2OUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764851667; x=1765456467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2o4G7T7H40kJgt07wtzrB59GMlTTIFWE3xy++HwOD0=;
        b=djfgflhT1cfEOxzN4v1KS1FOELus7jfr7VTzjOctzQwlmrCHa34njMFCzAp5NxZenD
         3STlbKyGr+PDSqXCbvEDuZBvrndIBaS4G+zG8oeZzCesl2IRTk67EtSEbA/5mROycz67
         oGmcOzomNT+7Le6N8dwFL00IJpEixCf1q0UNqly/GjuAYT/xLPFDYM6zuNKtafV5bbAO
         4qvxq+2qlfDu3lJIxlD1AaI1geQrDD9n3luVNaXsq2SmtgcGPT/rLtv8fifimaZCS4U3
         V8TRcyA9Rhl3DCHvflyio1Bh/WxoUC48SDL9JWb1WkALXc2zzha+VlAzV1a1b/FJvuMz
         fF/A==
X-Gm-Message-State: AOJu0YwFksXjG+1nInuNTbhLgWh0Juyo/GZNEBJEqQjfuZHByHVC0InJ
	6hiYci8s112NpawZ1itj0lcc152Tk8071fUcEgQfLqHa6/lpVPL8eS9WNmKxYGRmggEPU1Ybms6
	6N4bPN+SSJNcdeiHpD2422zQZtFc4MKVQ3KoRPxB3avwwuqO/4jTfJzgWlIll/akIozqWTXFW+p
	sgC4ttINida4rUbHC9mAFK8Jy4aj0cyfqFsr2hlIeWb2NrAnRbn9HEHfqDSg==
X-Gm-Gg: ASbGncszB1G88NCnCoWedcW2PXiAbETkk3t95GGqSzkF8oH5T9ymm21UkLdvwMS29dt
	8CWqfNpfrFMwQ94vWyHvOxPpgr7bRyf8NmlbMyek6NukR1KqvscA2udb0HI5ZlaUle4o8xPaAqg
	wWlt5JWcrFFYTXotQzyDmLHZgRVZtQf3MwdgEYOp+ysvwTGr+s3a4x/t9TWfbMhlDLmNzj26sXB
	S4qClm0
X-Received: by 2002:a17:902:d510:b0:299:dd98:fac2 with SMTP id d9443c01a7336-29d683e6c35mr69262705ad.54.1764851666440;
        Thu, 04 Dec 2025 04:34:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2anoIwY4aUDRN/blwEQzcNvIkkkH1sRSAITa4wq8czWK6hIB9nLJc0d1u5alYF1kTvSqXHuKh6t466fTDCQE=
X-Received: by 2002:a17:902:d510:b0:299:dd98:fac2 with SMTP id
 d9443c01a7336-29d683e6c35mr69262495ad.54.1764851665879; Thu, 04 Dec 2025
 04:34:25 -0800 (PST)
MIME-Version: 1.0
References: <20251204104814.3255908-1-dmitry.baryshkov@oss.qualcomm.com> <87049290-600b-48ba-9902-71fecc75c247@cherry.de>
In-Reply-To: <87049290-600b-48ba-9902-71fecc75c247@cherry.de>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 14:34:14 +0200
X-Gm-Features: AWmQ_bm52MbppqvvgWAlMsnQdkEVrBM7vy6mmIgh2kxyhKUgBmZ2l4WKroevM_U
Message-ID: <CAO9ioeXTJDO+D7AZu=ZQJq1Zur-ucxik62MMGDXSLrTFhBEVwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: upgrade 25.2.5 -> 25.2.7
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: WcR5QedUX7Er5MbKLor97ynp2bC2Z4HY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwMiBTYWx0ZWRfX8I+5HtxMp4vw
 WwCfQUsN36wWpCTEesvZQxpo6czSKdLJgTSPPyswKWQPFGFclUAhjTplw3pGfk8ZSSFv4R5LvOM
 SXTqp43rt84llfrLvDz/YDMlU7CYcTj2/ltoU/z2jVic/N6RXS9Cuk9ueo9XzQDMcV/MZBPYMZq
 VPKZsLjtdL+9Hw183hGJlq3/l9mSmMJ66PMu2RgQc8ws3WLvw5+zbbBu8Laev6X/8Tgg9xPlzsH
 ByPox2ro9h83QcZcV7kxFPrcTCbSaKGSTQXkxJYUFtbERUa2H5yOe+dk2FWQoqdaOA9u8ls2/ls
 UYQ48L4Z6devXMEF55X13cIuWGu7dzqCgg3gG85984E43KI4Rz/vXZhp6Lp3SOOpT3u47FuXBRj
 Q21Xx3dPR7Gc1Up3iN8jDkzxAm2pAg==
X-Proofpoint-ORIG-GUID: WcR5QedUX7Er5MbKLor97ynp2bC2Z4HY
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=69317fd3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8
 a=RRJxdOYJ1T-Bji4RQ04A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 12:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227289

On Thu, 4 Dec 2025 at 14:15, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> Hi Dmitry,
>
> On 12/4/25 11:48 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> > Pick up the release from 25.2 branch, fixing several issues with the
> > drivers.
> >
>
> The last release for 25.2 branch, 25.2.8, just got out, maybe we should
> update to that as well?
>
> Went through the log, nothing should require changes aside from the PV
> and checksum like in this patch.

Yep, I'll send it out soon.


-- 
With best wishes
Dmitry

