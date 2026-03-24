Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55E7FEC0F2
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 18:22:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4277.1774376565494681834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 11:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Vq/+9K1t;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Sl2xWFf3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OG1ajd890620
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 18:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HPVhH6cteaxtQBveBR7p5rKe
	t3Ox424A0IdCGBoIqXw=; b=Vq/+9K1tfoUkRmjGWo8NnJq9AWNM++0OcUXwS5Og
	aHdQtXUOBGxPgKWCC0m6OWWhuJzKMPJ52E22oRnW47x1UOmkaMS/ULBHM3wOBHnI
	Du7vjVd30/iP8ZYbVS2fugvO5hjCnestg7cYk6aV/dS8FcjX4UqbVhUnvu2W+r2j
	05MQyC0d7l1iXOQaN8BQUPTSrgd68Y8N4w0SYtvC6n1cA+YTeVjPK8UKiD+uAB7p
	DMkzeQWfk2xO9vgYiGVgUqlPqeUGfyr8y9hzhAzkQ0Es6VzmX15UrhN8e0Zmc2Tt
	Z8h1D1kg5XvLnA8d62VEG1NcZggeFJyqMk1aYoKKCsAgaw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3k1xb8be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 18:22:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899e89bf366so120940396d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774376564; x=1774981364; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HPVhH6cteaxtQBveBR7p5rKet3Ox424A0IdCGBoIqXw=;
        b=Sl2xWFf3v6Djzu8VBEETjHBeNdCeBqnYJGxNS18O+8udprF/LCKOV2Jge/+jRwzJYv
         tKF9I7fmxJjcI/7fKyGWP3o0HoDbd8oWhJIcI9E5SI5nhfcFeLsQauqhmiCXttm+aPN/
         qGnanxvCFJYwkTcCLSFY3qVzAftY7sXlJ7EjDwuw47Cv+K6fbNjgmiEQl/ykLVpXz74u
         Jom083bG73ylLSPBYkn7dI8lc5i82ZGF0UdkMevJ61vMMdxHhifl4rBfx7TPVoMQ3HvV
         8CpvL4ZW3y9a8nGbvomgil3VfvaEzUAnSG8PCEQdTvB6G9nR+4hhcY3EUwzyYv4C0zuM
         r85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376564; x=1774981364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPVhH6cteaxtQBveBR7p5rKet3Ox424A0IdCGBoIqXw=;
        b=BfUt2cO9SHFSxDs1lVXeyhy46EoeU8NWUOlPDqKuuZfTm1NZvXntDfYKqlXV1n59jb
         hndBopGtSDW0WOMXoGCf6RZYm5Gh9qCc1EkgoskiHasUnUvPx/YXF9G/H030n9Ue41tO
         m5VnN0zhSjrHFgU5s7+LeOscBzekCF4gY1i/Ynq+FSkt7mLJGC6LCxfedPWH8uyeb/cd
         38mw3dxOXYSvcLmBOpl7V1BgxDyK8uFvVy/z7lanbdaCNJdWGBij4ZJmUgx/6og9YDnE
         GjeRj+7aYxfoS/JQ9/YDakZx+4Js7M9j5QJD9u6MBSO+0r6ra2hv+nUuiEg0x4rUXWuU
         q+/g==
X-Gm-Message-State: AOJu0YwW5XWTbkp0aaXPgh/b7FpMC4XBSZihjiBWaWnXmyWNx+KsYLVI
	qUWoD0n65vdjwwD9ddGEDpt7Hzxyz+r4vK5FuvXbmog588eVomuAAO7EtHMGVfx+S4vaVWCW0tb
	jx9C2kzFxB5rpCbtMaIJ32Z+PiBEew4YHUiT5tA4GRvCj+MYsImEf4FO3iFyPP1sZQ1eu09SoEK
	wAa4nKKf8=
X-Gm-Gg: ATEYQzxcwtsehQhLSqXxArqdoqBnpSulPCJ1V9FVy/F3NsRuuNmwR8/K2s0iwxOVuTB
	gwzPa+lDEkDDzMJ+g6JHNN2mDTWwO2CLqfw2nP/SnbTvuUCGYuslwVpYu7TTAzQxQgmJz9YzBt2
	GTKgjZFY+gsrI8njzSaNc/4wKHu+pasHq49PidH+vkg9lk2WwcBrSrWyJOeitislxo6fO2PUqkJ
	FuG6/IIN8Z9SGoIV28ZUXBPxJc1yKsTHmRX1qwebX2NLPXMVNMubalQyxqPvoDmblhitm/5ABqC
	paOkyicxRh3fAjPikU6ukK1SI6Au8a2ahX+rGndLkij/+KXLtAlNUm7LNNgp5uOK6PCMfrf7Vsk
	HSSbhLuuNbdjG4eVuBX2Hfp98pJN9PWC9oYplbcmyDmT15HOUy01Eh77anOQls8UpcrkxOgASG6
	Da3+73EuH5QB8n5aVN64gKRcpeUteK9e+oems=
X-Received: by 2002:a05:622a:59c3:b0:508:ff9c:b9b8 with SMTP id d75a77b69052e-50b80af9dc8mr11660431cf.0.1774376563451;
        Tue, 24 Mar 2026 11:22:43 -0700 (PDT)
X-Received: by 2002:a05:622a:59c3:b0:508:ff9c:b9b8 with SMTP id d75a77b69052e-50b80af9dc8mr11659881cf.0.1774376562881;
        Tue, 24 Mar 2026 11:22:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aa200dsm36554111fa.28.2026.03.24.11.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:22:41 -0700 (PDT)
Date: Tue, 24 Mar 2026 20:22:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] default-providers: use Mesa a a default
 provider for OpenCL and Vulkan
Message-ID: <557juevkfprqpnwyaknejeeihtmyywjy5ykx3wypb7zg47z6px@vl2bcnwir4ph>
References: <20260324084454.2971108-1-dmitry.baryshkov@oss.qualcomm.com>
 <20260324084454.2971108-2-dmitry.baryshkov@oss.qualcomm.com>
 <a6b6254789bebfa3bedff02d74074bb519d4578f.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6b6254789bebfa3bedff02d74074bb519d4578f.camel@linuxfoundation.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE0MiBTYWx0ZWRfX4pCS63LHoH7K
 GbmTSMn1uO+z7tQnq97ca5tHIe8SFJcAnpJF/qXjsk79klmiX7FUTvQ2gS7S0Eo3K4Nj+vAd+Sd
 iDrdVbrwCQucFdW5aUz3oEIrASI3q5rbk5xggiSV7t1dyZtUrg4et5evDqFZyEejdw/NeVlVdTA
 Gd2wZl6sR7o4mok4TW0Vu69upa8nl+luWY+Jl4l20WUZ+72ZWcF0YMLfBVjHWmz+qzX4nVw1GrL
 T5SzVN0LF2D8PgnUTc0Z7x5OGmdza9Ipjle7IkDj1MiyjZhnhhkH7BNphxCfhVR+LOUtmKGkUDN
 oqrAZlAoKBXCx1jYn8P6DGpQktecx7VB9JWCPimmEeeBQvkPcFGfcP+SRz0nhC9h2T1L6teTcMs
 8aFa0HA1t70PQBw3lKmXeLpnOMHYvS0ghsGUREDzWvIhf26kaPi6AF8LaytRifN7F06+xoc33jS
 6wzN1zmK+ET3e1E29QA==
X-Proofpoint-ORIG-GUID: Zw0X7zX9uudnv4RFgMnRDTI6_4mqoNOz
X-Authority-Analysis: v=2.4 cv=O880fR9W c=1 sm=1 tr=0 ts=69c2d674 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=Q4-j1AaZAAAA:8
 a=E2ZJQB7fAm1zPW87QtQA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: Zw0X7zX9uudnv4RFgMnRDTI6_4mqoNOz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240142
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 18:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233823

On Tue, Mar 24, 2026 at 11:46:34AM +0000, Richard Purdie wrote:
> On Tue, 2026-03-24 at 10:44 +0200, Dmitry Baryshkov via lists.openembedded.org wrote:
> > Without DEFAULT_RPROVIDERs for the virtual packages OE behaviour is
> > not deterministic, it's not always obvious, which package will be
> > selected to fulfill the dependency.
> 
> Can you be more specific about how it isn't deterministic? We should
> fix that.

I'm sorry for being not explicit. It is not deterministic if the layer
includes other ICD implementations (meta-qcom, meta-freescale, etc.)
You can point out that it's the layer's reposnsibility to handle
providers in this case. However I think that having a predefined default
would be benefitable (and at least would force those layers to override
those providers instead of depending on the undefined behaviour).

In particular, I stumbled upon this in meta-qcom when the package
manager (rpm) was happily selecting the Adreno Vulkan ICD just because
it ended up being the first one.

> Ideally we shouldn't need to set RPROVIDERS, they're a source of issues
> and I'd prefer not to have them at all...

-- 
With best wishes
Dmitry

