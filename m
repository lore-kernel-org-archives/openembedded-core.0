Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA052CCF9E3
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 15:38:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.699.1761838731921256155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 08:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ur9PA5nm;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JNVNZmu1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UFHMEC102840
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 15:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G6YToHEzwuupGCGYpI9Ws7uU
	0WAaIXV2lSO3isH/s7E=; b=Ur9PA5nmss+rE3QgjpQPhxJEIUOomqQutP9ViypD
	XqSPcGNiOmS1ik3VSLnPBtOdFFU0uUifj+8/NrsEiBFHdypD4pUC1Q0jxVYwIpyn
	M6xHpE3NuZnox1AJ+oWqdsnJygwb5VSrFHYAiUGKN42k5AOqbUifGdDbpF0tshva
	5Bu0oeTZKAH3QSTu6nSZfwBglTlZ4f9+BRJU+MjVe8ZTMHQ8jjNTL46zOQXzgej0
	pQGKNsRgZSKU8Yf75ZmTsjbKQQnhcVl1TLCnZeUzlZkhF0rIwNNj2uJQR4dDrZik
	npVOesVT6XwtUGwcFsGqHPOvZ9e6gftc0vYZ3m1HOZuW6w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdg218-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 15:38:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33da1f30fdfso2655586a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761838730; x=1762443530; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G6YToHEzwuupGCGYpI9Ws7uU0WAaIXV2lSO3isH/s7E=;
        b=JNVNZmu1WC2OSMHsfwsdcfPD5XpkM3HSIsZAx9HgneWMXsW390jC5MrctxZ3yCtXsG
         rvC9N78PYcqJcO3lCUxm/3Ph06n8qFYLQbfX8mzABFAekBNLlUxfTWqRHLG4liVNk8TI
         08J/mCuVQqFuDnzHchDQzrGGKd8euK8CcCGzPO9+QyoTU3nbEjlZZPFp96/oOiT1oBTJ
         AH5NSwTeGdx5j/mqHxGRZ3VuEVb4T0D9VQSfXdlSPKtTsXF8WIeQynuy5U61amBTkhX+
         EFLiw3OewVfEbd4yQnMLdD2vxUjRwvx/nvogav1b2T0IDiQec+8m+ErUM2LVyLlJJxA6
         gL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761838730; x=1762443530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6YToHEzwuupGCGYpI9Ws7uU0WAaIXV2lSO3isH/s7E=;
        b=sxaOQxI8hUlVZgODoWvETuEMfD/fCjsNzDeYkr+yftLG67hWupuzN8E6ywyqYmAa+A
         vKY9r/KRZkQfLUz3tXMEUSP6t2dCN7R1uGgfDQQ7HT7dw4F4qOhbrhWBkNeG1J6KXteC
         0h8+cQwlhELDqik9oHQ8Vay3gqsXD1YQ4SmUy4M1UffQqYDmHKGNL3R8iIWMJ9GAt7OY
         EAxFp1s7lN7WOaq7DzXseFtd963VCvlpzf0XIJ6fSHxXEQ9AQTwNXZqfKJI+NInBSr7Z
         /qM5pmUCCxitLOVioOr5ehQOQfzfkEKCumvsoWopr8oXB1c8ClQkKzELXP2yijtZ+FXa
         xDKg==
X-Gm-Message-State: AOJu0YynALkLmZS0rNuZkSFbm+zapcYwqaH+Q/lljCNGZjdSMQcGCg01
	NGE1TuOn7zQAVKUlEnNHLMkvEkdVhiRtw8AUoZN5x+Cs0lkqeK7qTW3/0c4PZwuIuYZd+E1hnnB
	SP+yTTU1wZ6aVUqlkEqiiySpZEW32YDYLb2fkoef9UBI7aDIJHSrfqBA+Aa+jZXe4V5z//ZKp81
	IZByJj4OyXsUYXimdPsXM1Mh9orCP573+HzPCwKzex9M2kGJtNCnKuHwEm8w==
X-Gm-Gg: ASbGncvuJE/jhN2lRzfOFV2uEY8JKxuIFE1IuU2qyMUZZ3q6F3GBlIuK0qdYGz9iptX
	XhZKWGVz86bRvdvbdhOwuATnNWhu+ajtYhj99EKj7Utgp2AOZkr2hFFsrL0Vr2ep5Es+iYI104d
	k5MyPm/sLhlVMy98J3/7+UZZc0zHfGQ/+6qHbAIekiLPM103GKZODM/kI=
X-Received: by 2002:a17:90b:4d05:b0:33f:ee05:56e1 with SMTP id 98e67ed59e1d1-34082fc42d9mr211344a91.2.1761838730393;
        Thu, 30 Oct 2025 08:38:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfMML66dXl6XM2LbAirTnFx3rpVClOM+xpdTOonB7bszrRPPTTfaqFxn+ebKZ7IdfELc97ypan0Kzqhj/Q18Q=
X-Received: by 2002:a17:90b:4d05:b0:33f:ee05:56e1 with SMTP id
 98e67ed59e1d1-34082fc42d9mr211299a91.2.1761838729739; Thu, 30 Oct 2025
 08:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251030115415.2566247-1-dmitry.baryshkov@oss.qualcomm.com> <DDVROVJXILSI.2PL0JU2W5JJ54@bootlin.com>
In-Reply-To: <DDVROVJXILSI.2PL0JU2W5JJ54@bootlin.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 17:38:38 +0200
X-Gm-Features: AWmQ_bkWJjw8Fu2v4ooIMxX4DYpAL3oZSQa4G0r65OChZbZTnJ1lk4Z3PrPj7no
Message-ID: <CAO9ioeUJoRdajhSzu0EWsQgbOhwnpCYwkOAKo78Qgmt3r7Y0rA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 1/2] libconfig: import recipe from meta-oe
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEyOCBTYWx0ZWRfX3IcpR42dxYJj
 qMifBsCuMuFZVNKQG1r7A6iKGFGuqMjiAYJL2KYjA8yIlzonAqOVIaUE3IrTcZIZV0hMvBkWVgH
 z86nrvcOFBYyaRhzzMBjUN9WQ0p7e9qGDENZYRo7nCK29OPCsqEovJsgbXRe2h68Ib9uueaewUO
 C/8fNzVHBA716b+et2qDESbk+bt+HqzkHDhfb349v4rqLpMVoqe3GhwZrsR0SQsY6CS0OEHyKDQ
 c0RxCR51wZkCvmeQ3il2+NP7CNXEhOfJrPT5mpt+fWReDUqb8bRkQLRUpZr37x3EMknVO/v7fkl
 kDK8j7l+U1kMJjwNjyvigaSHPvsTou0ItivqJROAn2CExgmIPi9ihYjMaVYOmMwddLVElkm2A+H
 dCZUjd62HRrhGb9bPFp4vZc1aWYCiQ==
X-Proofpoint-GUID: u8NU9dIjRnG_x0QTsNS6J8y47unlrGkT
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6903868b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=qV75J9b7nUGU_A8_7eQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: u8NU9dIjRnG_x0QTsNS6J8y47unlrGkT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 15:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225500

On Thu, 30 Oct 2025 at 17:38, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Thu Oct 30, 2025 at 12:54 PM CET, Dmitry Baryshkov via lists.openembedded.org wrote:
> > One of the freedreno tools in the Mesa package depends on libconfig.
> > Recipes from other layers also depend on libconfig. It makes sense to
> > move libconfig to OE-Core in order to reduce inter-layer dependencies.
> >
> > Changes between meta-oe and this recipe:
> > - Upgraded to 1.8.1
> > - Switched to UPSTREAM_CHECK_GITTAGREGEX
> > - Switched from autotools-brokensep to autotools
> > - Added a patch fixing reproducibility issues
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
>
> Hi Dmitry,
>
> I still have to launch a full test session, but on the reproducibility
> side, it looks correct now:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2806

Great, thanks!

-- 
With best wishes
Dmitry

