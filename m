Return-Path: <nicolas.dechesne@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE69FC5936
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 11:37:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68021.1772105854907101528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 03:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nicpF+Dm;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=C9uArr+F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: nicolas.dechesne@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAKi7g906609
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 11:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6BaOKGFXtIlQ3xmWYSXWC3HYTm8lfIMujUoDQRHsU+c=; b=nicpF+DmHtRPsZ/X
	Z0UZc2qfowW6JORvMm19kwpv+H3Unq4Ki8vjjEzKZaiOOCON7KNnK/uGv85nSZjw
	dh5okEpHL+OA18V5GSHL07HCYX1ObjCFyfmHk3Qi/puA2vmIDS2Yce5R2+KFm/s5
	ATCoJxFqMCh3t4pNa2GQNf5v/1Khp2AnXXgU03UUEPBlgeJNqwVBdgjlIcjWLa0H
	pPjWYOSUdxm2mTJyoMf7PrTO7zUx97xDvMlt5/TZ73FcMCzpceOohsYcbJSNpvda
	umCOzsoG80U8REe70x3hThHoDbUuIH9J7W/eqkyooRc4Mp6k4ZKk2tz+kN2qIQ+j
	8SAQyQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v0hdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 11:37:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8950562d351so125529486d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 03:37:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772105853; cv=none;
        d=google.com; s=arc-20240605;
        b=c7nUxkc9qcQXeFEXCWHBnqgIkVMwaY3buDUcuOdu4HNdN1IvrBOv30dZOWjg7lXmuw
         AoK3wGfnS1gwbMceBL0+f8sRtdxNQjL9DGlBhoJtmRjvBTLFUa9aJ6XQNLJPAtmITIsy
         ViLEy9Qh8gn/EQF3Y4nv1d6iV+ME4B9MPotnzap2pYYaLuJ7/zx7cxUKVw+fiZl60j2L
         wn+1bwQNd0yXOaQXktllpXnPRamxuTjTDk6KzGoR/wIwmG5qh0CF22+JqjZcE69uuCCa
         siV5X4/b6cPRnPWUJ7CsoVMiuZ6dmflbv8odIV1PVpfhB85LZYDFuRjP8vWEAQmZJqPu
         an1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6BaOKGFXtIlQ3xmWYSXWC3HYTm8lfIMujUoDQRHsU+c=;
        fh=6FM3dq9qtBTyXEIYu2sY8sSWzABeR5fv8m5UoqLHEBQ=;
        b=VA0JVnvKaM3wDrqIZgYmHVAAx5KQwnuza/VKUWXsAoF4+JSW5U5PmaWB04E0iVZw1u
         L+eGxTIKcGkX5nKFDnz5ZmoGqDWuN8lGPKXMDHPFnbBTnbeKiYdrnmniUDOIhZAV+yx1
         rfoNwNa9OidgEBu2oLfwxf2BabvTmNTtDAaL+aidkUi1PO99Wc+SikJbsK+Nk8D+gXo7
         hclh7JK3c6W1oBAt9afSLi6eosw7mGc2I5lfRercMgMbb5ilB8aS7LWyOuQyWVmiR/++
         Vc//wJuCi9/RTAkpfUDsIfe+blbyZHO6MlBC/jnZQBmYcNzrMp5ZSTD+sMWpbniYK1zu
         Wf+A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772105853; x=1772710653; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BaOKGFXtIlQ3xmWYSXWC3HYTm8lfIMujUoDQRHsU+c=;
        b=C9uArr+F+QVubvfTybLDhfKzuu5qRsxcBTqMmymk5aSx0ZQrIG0Y9YPSJxIsUrbtMz
         RN5OZupotLV84CbrE37jlP1/8M2UhzyuB5O2yCVKEMmKpyCngLOyXtZe9G0fcpwqrRpj
         P2F6uXzdCNfQhrO2M9DgFHP7rxkg2JHuk50CxxST/N4mqu+FGFyBVzdCPfQ56hcUGKnr
         4tBQYyNIA62Sricl40SU9WXTIlukA0ewX2BLX8sZUQIVynx0wKql0X3lIyoXeAvXPg1w
         wSKI1bifXi9yhs0eU+Qi282IwyOfa3wZsHpwuvvFuGHjm/YHsEu0Gr++bl8WOtfXAYP0
         P8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772105853; x=1772710653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6BaOKGFXtIlQ3xmWYSXWC3HYTm8lfIMujUoDQRHsU+c=;
        b=JYMaOO6Hk9hVh2Spsqh3TiuB1O2huawALs4D+OEFum2YiU2xjbxc3lMtNhn8dLAr+D
         hexbPdEZYnMWwXQm8AXB8QdAvPwMULmEdCS7tO/dSgvFf/O/huBaaQAWQN3nG6odt4F8
         IgVhma9/G+bVzoC8/SixUB3lji5AYL203tXjKEJ7j61wvp5t/F3Uy6Vya4E3EbNeXU1U
         Bt14KMV3REwbo116FL9enbVhAMYP90lMIcm3uzAqe7nRTKZYxToYna9ftrAkW1UpAVnf
         7M4DFqVAfDwjfZPuDbYTDWy3FkLP6Tyt255Ji/SVQLFofp7HoNrMFRT5MHZOvON7IBwn
         Ggvg==
X-Forwarded-Encrypted: i=1; AJvYcCVe0PYDdlIBz/vmINN466o66/ZxY1X3mfJ5bVeTmBQQIfKVRDIIfwyBlq+2/ExuOgfEeSB7dqsrFrJCK+B1ykjhQQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz/T9/Aj++23kzaYKVXZgJ6sdaRujhoIL8RKRwCyx+r2xCrFMty
	K/XSMqWAd1ZK0Qa299WP3s3mnzeAdh8465gOeSEXgIfu+F5uBk9l9fDgGyJe6CqdJkrMzeGF/oG
	dQVebEVU8F4gQReMLWIwNOa8U9S+9wEzsIG2L7B07mQm00+KnfQ3HK26EewFwBpm/ckZf0jjFlC
	hm8Ng0LJ8rBc1zGi6wZmB4vRRrW+4liQld2rZd4UMkcWZSlA7vG+qs0WxOvw==
X-Gm-Gg: ATEYQzyVc4SLvvK8rYi9OrV/9flIft2JDmDwDmVzM9aagl+22f12j2l96n4vHY8sgE/
	Z04FauquXXThmd8XkenABcXX1ya0mvlxWy37oZQlUXs8F2Xicm+MMdJlu7QoLfELUvWX6+TelaM
	JHBFMPvIPV1a9SWo9xz7ASO6XEz5MgbsaTNOfa5e5fGK30VEMxTEkLp+E+ZyXzDJVZIcM18vlWX
	flmcRYE
X-Received: by 2002:a05:6214:2a86:b0:880:51b9:e8b2 with SMTP id 6a1803df08f44-899c1e8b9a6mr54748106d6.48.1772105853286;
        Thu, 26 Feb 2026 03:37:33 -0800 (PST)
X-Received: by 2002:a05:6214:2a86:b0:880:51b9:e8b2 with SMTP id
 6a1803df08f44-899c1e8b9a6mr54747786d6.48.1772105852877; Thu, 26 Feb 2026
 03:37:32 -0800 (PST)
MIME-Version: 1.0
References: <1e6175f982bbd141fcc156113aa6e798a3120bdc.camel@pbarker.dev>
In-Reply-To: <1e6175f982bbd141fcc156113aa6e798a3120bdc.camel@pbarker.dev>
From: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 12:37:20 +0100
X-Gm-Features: AaiRm50WFmf3tYUSj09eg2qq5DgKOSjnR2UdjbSnRav_Rl4EFCxIoUJFpOlbuq0
Message-ID: <CABWbsgD=OF0G4kXyGCDCSByVrd0u4jnxHQipFjdLueoiv-99yA@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Recipes which should always be
 upgraded on stable branches
To: Paul Barker <paul@pbarker.dev>
Cc: Yoann Congal <yoann.congal@smile.fr>,
        "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
        "openembedded-architecture@lists.openembedded.org" <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: K80lwu8CPqr1EN1ICKygJu_9TDrN8hQs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEwNSBTYWx0ZWRfX49WROQYKVk9D
 7/Us+dmFJCOFWtlNzNksFD3HbgSvp1uacBoNkTm2Z1FxGSWIHVL7NM1snYw9XPkl20QAJEJliC2
 ekoR/6UjTBnQy0ygRXcBY2FsFRaP54PwCCnGaMAMuoT6E+alTDlXn8FUma4obCXrRVHPRtnFUoV
 e/89XyzjTIT1zaIGbdpGmHu3VanB1tR0u6s4Yy+UAXU1xDetON/XbXSP1GV0gTp/+5XKQ4zg+Vr
 xuFkcffO/9SUoTQzEAtV0ttt/tMj6Tk+ccpWKQ4OnNxKO5G1UPQxtNzPlM0RI+quNR7Kf6T2iUb
 7X2+mbpBUkI/roi/zjitDja8HZe2Vl4opaIJ80HNdZWaltjRRMpmzRw8y3wl0Rj9WxtlVdIepbE
 BbfHEzKFGgtOar3XD5A9mqREXBBVXYr11npwTNuAR8Hp8zLZSDq9kLL/kWBweTEebJx4jTA7O39
 6/kiwN/FWn6MUlSr0wQ==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a0307e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=xNf9USuDAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=ZaVHlC4H7SijyP7Q7z4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: K80lwu8CPqr1EN1ICKygJu_9TDrN8hQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 11:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232002

On Wed, Feb 25, 2026 at 6:44=E2=80=AFPM Paul Barker <paul@pbarker.dev> wrot=
e:
>
> Hi all,
>
> I've been briefly discussing stable branch update policy with Yoann.
> There's a few recipes in openembedded-core which I would like to propose
> that we always update to the latest version on LTS and stable branches.
> These are recipes typically providing data that is expected to change
> over time, with little or no code.
>
> You could say ca-certificates is already covered by the fact that
> security fixes are acceptable for example, but a clearer policy would be
> better.
>
> Any policy change will go to the TSC for approval, the goal here is to
> get some review and input so that a concrete proposal can be put
> forward.
>
> The recipes that come to my mind are:
>
> - ca-certificates: To allow access to HTTPS resources we need to keep
>   these up-to-date.
>
>     - Keeping this up-to-date is common practice in other distros.
>
> - tzdata: To stay up to date with timezone or daylight savings changes.
>
>     - Debian takes upgrades to this on stable branches
>       (see https://tracker.debian.org/pkg/tzdata).
>
> - mobile-broadband-provider-info: To stay up to date with provider
>   changes.
>
>     - The README file for this project says "The Package contains only
>       informational files so it's safe for distributions to grab updates
>       even during feature freeze and maintenance stages."
>
> What opinions do other folks have?
>
> Are there any other recipes we should include in this list?

I know this is going to be controversial.. what can we do to keep
linux-firmware a bit more up-to-date? the recipe in scarthgap has not
been updated since it was released. Other distros deal with
linux-firmware in various ways..

>
> Best regards,
>
> --
> Paul Barker
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2275): https://lists.openembedded.org/g/openembedded-=
architecture/message/2275
> Mute This Topic: https://lists.openembedded.org/mt/117998481/9005974
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture/u=
nsub [nicolas.dechesne@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

