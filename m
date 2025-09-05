Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BA5CA1010
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 14:34:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.341.1757082892642685537
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 07:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DzUE6twx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856LKiC004616
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Sep 2025 14:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6LmbborIon4xWVurZdHD076A
	4JvnhuqnJOC9l23k4gY=; b=DzUE6twxcWIjm32BNwt6vWrbcEtwjvizBy2GAKK9
	CKQnnXpLoGBP7wKLxv/s8mdQIeI8O0J/DPiaZLg6hVisZb7ErP1AqtbAB6uDvs2c
	tpdOI+cxLS4AMU9Ta4KwjsI3sMCtVFqDz7MfpVwgQSRBBEWD6QXHLRyFONW+GN3H
	HgxVC7VKELME1N2wT/mK1VSN6CR6ge3p/gA1Q3jKPXfPXuf+Kav3furV2zyMCa2q
	2lIbNyICPSeCePgxaltCNqy91Yqt1n2Ff80jb8JZZNQRfiMmsUe4nUZDoLXKdseZ
	u6ir3aOMvYbwo2ZZ1w0wZBShv98QiER6cFQUDl2FmQeLFw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8sbh9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 14:34:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5eb7b2c05so20068251cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 07:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082891; x=1757687691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LmbborIon4xWVurZdHD076A4JvnhuqnJOC9l23k4gY=;
        b=MHppsP0Q5+UIZXWmJvfFUGRZ6UuNwwVlpN7KSBeOld2ZTe3egQKhQZifbFqEJW+qQ6
         1mWgECup9Bq5C2gVj0r3K4gJGHr0ol5apjPmWCsOCsFmAP+N1OknSYV+87hF9/TCxvnA
         90SJpRUpFdAG2UF308UQJOiSAWQ5GYlOyLajU+Vn5e7XQug+nOFEks12YjkS74Ao+CP0
         Oq4FDgziQfGfKtjjKIwPbYF9BdztQ370UfsRhxZgSf97Zeu4ZcuIYWj5R4ZtXl7MRU9k
         BkTApVtqpXRlSy6y2Zggdw4+/L6QE3aznSnswUf/Bj0coft+Ra6JE+A9bn5p6l67BpDF
         F4lw==
X-Forwarded-Encrypted: i=1; AJvYcCVE10PQg0bAgbq6ikWl+6u/EdmCsMjEudUS6OMY4vx8Kfvy7J4MeD4HOhGeXzB3XkWiYz5igyrgSiZo7XNolG80vQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1+x5m9ftwgzbsvroA8lsmB6r5b+OMhbZ3l1kGLmAjY3v5uRVv
	UlqMMurFYcDeag7S5nP3OGMEID0XSDE54y+8JMy5Uq/HHBSiZJlzkEBPBKgLvtxJM5fopfcpBO3
	aQFbqbRE133iP+InK394Ym4JtCXQZ9DIDqeC5KXlGfE4qBgz9aTpYxbE/atfVo2JBXutROTgwqZ
	BUx3wX844=
X-Gm-Gg: ASbGncuwrM3vCDO9yBaJKaWXXDSMav9TDzf6vkXCWI1B8Vvsgj3y9nkhjR4hGg9tml3
	rSt+4eD7rJCr+6RQaG9/WcE7SwIJZyuicKyfM3AF6WiDOC+5DkZl7jthCJvum7omv4rC0vcAq0r
	JZeGoZ8vGaaVeLFgQBWkN+Av8JE0sTCEd0cWOa4aDuvazOQsm5uGPdxDJr3VJdQ2/POPz/KUIvA
	qsxTgX4pW/1ee/D3PXLk61MoCTK6YXzdYXnt/8SbO0cLG+qopi7vi4qLo1rmpDZhQKSZZXTZF4G
	HXmdkvrtusAV27DzxLynnHWzv0TojfQnuRUXNxGOelolEL0+7WxU3BTPuFiJRTwNH7/knQzsXrn
	88ipk9I0r2+SHacEWtE1+meGMUjxb9VqxIUohDZaH8PW/VEuMjmkL
X-Received: by 2002:a05:622a:91:b0:4b5:e807:75c2 with SMTP id d75a77b69052e-4b5e80786d9mr40955571cf.44.1757082890433;
        Fri, 05 Sep 2025 07:34:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0PhyimM6Ylmr6sdavOl8tnLHYA2YXyMHyckDDhCJXlbK20bMxwefZ9V7wczxr2xJwAFG5Gw==
X-Received: by 2002:a05:622a:91:b0:4b5:e807:75c2 with SMTP id d75a77b69052e-4b5e80786d9mr40954361cf.44.1757082888740;
        Fri, 05 Sep 2025 07:34:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c4ffd5sm19212011fa.14.2025.09.05.07.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:34:47 -0700 (PDT)
Date: Fri, 5 Sep 2025 17:34:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: patchtest@automation.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>,
        openembedded-core@lists.openembedded.org
Subject: Re: Patchtest results for [PATCH v7 02/13] mesa-gl: use
 bb.utils.filter to improve readability
Message-ID: <nqy2hnwz7a2deg2az7idufpr3mk2lyahqryuq34pyem2rgtpfw@kbczocn7fsoo>
References: <20250904-mesa-libclc-panfrost-v7-2-e921a65412f7@cherry.de>
 <010101991519be3e-1fa3007d-eafc-408a-8cf5-54f5c43b272a-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010101991519be3e-1fa3007d-eafc-408a-8cf5-54f5c43b272a-000000@us-west-2.amazonses.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX1epm7RGFFpJ6
 Mgwl4ZWS4ZGKV+oqqAIjlsrVni3QE2HRMURTLyJLI12sboVFUhFGQzeKSYNvXHQdU8bbA8qoC1e
 3qqeNgZLfTNcAm5sTOlSkQN0qDKR3MTvylnbRNKalATIELvPU1RtoJenCBUXnY6OpfufE8tdSXN
 7sIfNE70kMAuhj1v8jFyYarvlmgs4gPndi7jAV81Asb+ZlhqGafXaTp1KsxZ+8pxn1hN4z8dN5P
 rNdRnMb1JMc6ivkssKgMZBmieOUsccjnH8lXlEikHwPTeRwqmmNdnwnBaWsMhXpL0Mj/QCh1olI
 6KkSEHA7PgwVtcMGFjk5fKC3W7rnnA8GImbGwex+u/o+v81/oK9+1obDue8wvb7kcPk8BI7q4nz
 2Wuwczh+
X-Proofpoint-GUID: 6ZGkbe-Ifgn5qJK4Sp7kqQoWsR6Fq1iJ
X-Proofpoint-ORIG-GUID: 6ZGkbe-Ifgn5qJK4Sp7kqQoWsR6Fq1iJ
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68baf50c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=rEk7-Gf4SfJmXMzybwQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 14:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223008

On Thu, Sep 04, 2025 at 02:20:32PM +0000, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
> 
> ---
> Testing patch /home/patchtest/share/mboxes/v7-02-13-mesa-gl-use-bb.utils.filter-to-improve-readability.patch
> 
> FAIL: test commit message user tags: Mbox includes one or more GitHub-style username tags. Ensure that any "@" symbols are stripped out of usernames (test_mbox.TestMbox.test_commit_message_user_tags)

I think we need to improve the test to skip "${@bb.foo"


-- 
With best wishes
Dmitry

