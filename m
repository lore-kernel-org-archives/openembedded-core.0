Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325CDC5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 13:09:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6489.1787231340013734170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 06:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ZDGOR4gW;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JNLeEs0V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8KiFv1680578
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 13:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QRx++HKDR+zON9OniZGnecfJ
	Sb9J5HSdjI0qQ/Fncm8=; b=ZDGOR4gWb6VNqZBNhJkmaQZ+xMfqsgo0sZSy4xFL
	Q8RNjy71Cbg4B015hs4kdW39L1667A0eJwbVK1RQDQdbXT2GlS3cXHMrDBYUsAFJ
	nm8tFrle9gX3dwxSw84k8rBpcgnbl2P3itmBanIh+B51qQ900oq9vV4wJgizXUwc
	pzl4dqgs9U8Jo6rxAikoOUxkqeLzpPfyXiaAWCGgSMS4ODgPnp8/OlZOd0XR0+yR
	R5WXQDzRafz+exybnDNP4w0uGD3jh0aBwsM+soBoWakz13ES/kcxgKKCg/HNf/9u
	9fQvSpP7i6NJGtvVehYWAg59D3VDLqXsNEbD45bxNn+hsQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05s25e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 13:08:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so45529755ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 06:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787231337; cv=none;
        d=google.com; s=arc-20260327;
        b=JdMTJQASBKeAnmxktBkEXvlW+XQyG9PanmYed3nzxIU2TYUm7CDDbMM7bylMO4hnhV
         hi0GWCAX8MOaeVpkD8KAF9GmjGT4937bCTgwvBPzNwBG7BNvU/vS81+B/B4FX4RoKzvx
         2NJytoof5nu/p1hy1JH93tOv/umDVZQOozhYtUNUCkX2y6BbJSzxQ+WUPlDATxMQ/UQM
         51Dgp075QXdKPZ87klIvwL96wUq5vioiQpS52GrQiGP2EyA0+subTve5bGgcVvcvjIkt
         KnjCZhyD2XT6byvsdsD1EHeC5IebJ/FfQ181sKuzj7lLZHLHjJ4M8sFkkUOEAaeymJYJ
         8EpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QRx++HKDR+zON9OniZGnecfJSb9J5HSdjI0qQ/Fncm8=;
        fh=toEqJZwqRVBtWFdjvbnHcK/jgjDz0NeahqiJS/bEzeo=;
        b=OU8sNKJ21wLLfx80GpcUETXfcqlmWkORIund9E1M6Wh+Knygd9k5a7vbEz++QlnvN1
         tjVg1pWPPHE4UwC4uA5as9ULuiq0VdNGMWkfgqkPxfTLkGA9TC0T4b8pHshP4wX3lk3u
         9nM4CPcnzIzpAaaNl1xglb3/5DfFOKLBxpOO1sQSOJ4zaTfN9hfNxNIW7S0wcdZpbgg0
         ROQq+4dqSgt+0tjuhEPIycZXOE9pj9BnQM1XCeCw47ZuvKRmrFpWimmYrDCnZ1yAEkSf
         ao8ut0HSn8VbF2cqpQObWgmt+queiooc3VUIX4zsnnq+tbG3exMPqnT4YJE5TbYIeNq4
         hsRg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787231337; x=1787836137; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRx++HKDR+zON9OniZGnecfJSb9J5HSdjI0qQ/Fncm8=;
        b=JNLeEs0V7mdR7fvbBVkMM/icwKp0W8fyJJWXZhMwOFwcZhGJC8D1uR9GyQzBMmPY66
         V0qqXzKwgj0qJH3nWXaxJUlO2QIsF/98K+l8QF06XnO8S2gQ47I0qhXKLwsyX3xuTjE2
         JOU+K/AvyVg+Ixag1mtPYy/WUm/6MI8gFbEknnn0nl+fs+52Ex0W01+YvBnrqLD92nXS
         pQW+OWmTXh5XZoxbnpFc6NuYhZXwLukweLR8uyOnGiSZuqaJI0k70912HoQIapZaTBlu
         Wx4UXngqco5ETXRJKnR7cUcxAsKlTlCDnGxaZPouT/mJQbYZbHAPwZ4o6gxpPR9/5lYb
         1h9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787231337; x=1787836137;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QRx++HKDR+zON9OniZGnecfJSb9J5HSdjI0qQ/Fncm8=;
        b=HBxL3qoY3wbAuTFqOmdfWgtBDa7k5frM4Ey1B+71iu8JnN1fpbxTUELvx7mcw3FAZ0
         0CeGH+pXS9u3P8+MsMuQ9Rt6oRnbHgKrKHBYHhl/HmdNWzmKjzXZ3A3YRCp0QhOwHFOH
         pAP7dE6iZjNeG7xx3VIBxDHgVKYUDrJUSI7W0Hqs7usFx9Y1GPxynu0WVb+7YhL8xNAc
         zKcMCUNCJUdt7I298cZeXGL+hXzaR6JHpOxGSuLQakTkmxDbWmpxc9DSS/83UeaPJAvN
         1dKV2uSTpJXjm3Qp9zihjcZyI5TyhxrK+YU83M4/qYX6KaAJiomC45W9279IS/HZAvpA
         nUkw==
X-Gm-Message-State: AFuF++m4U5Eg7B3LpUa+p9HnesAmAVyhDDfnFdv528SiXIF+MNSnqLD+
	dLzBGWmq2KWH1h4TaagpXRayZbiHgc78eRdvzrKZtqJZfeWyWBsHKLiNBK4x6b8wblRkqMRF3Fo
	LSo0XFNbICfd7RWKrtv2K9XJiw0G+rcKJuq1ne7VTXVGXhvfn9dcCKT0QFfGmeWwMvlq+gN8btD
	F1Ec2An8lAQ31LmQCCnkEkTfZeiaJTwwlkDWYXzBOy/Wxt3RT2zD3ablcP3Q==
X-Gm-Gg: AR+sD10agkpKdAToASfRzRbkFjPVNES5TfGkInhk0em5tXqIn2dFZCyP9yuwDQfMrw1
	wgXhflczC9VGOAv0CivNdM3afa7moduMusR0AgYebqGUk0kgjc38NvUjllQzSJ+MgiH7+IlPrEN
	SM5Z2It3VPmkbUyzcotbToAuFKhhnPNthvhM318+wx4dgyD/CLFXu9DuA=
X-Received: by 2002:a17:902:f689:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2d5fe6905acmr219163435ad.14.1787231337421;
        Thu, 20 Aug 2026 06:08:57 -0700 (PDT)
X-Received: by 2002:a17:902:f689:b0:2ca:6eca:492f with SMTP id
 d9443c01a7336-2d5fe6905acmr219162285ad.14.1787231336896; Thu, 20 Aug 2026
 06:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260820002213.2272711-1-dmitry.baryshkov@oss.qualcomm.com> <CANNYZj98f769T2und7rXmwOwjtegdLL5=PkyOwy-OnC-RGVGrQ@mail.gmail.com>
In-Reply-To: <CANNYZj98f769T2und7rXmwOwjtegdLL5=PkyOwy-OnC-RGVGrQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 18:38:45 +0530
X-Gm-Features: AcwNN1XRfgRDkPNDYB8MuGXT4g9gG55gW6ZYLiSL2jKvTDu53FN3wB4yIhGm0JA
Message-ID: <CAO9ioeW9YMpex+q7NS5RM7iOU8gF7888hTzTX+5ebh+M=TkPWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipe_sanity: accept new renameVar() arguments
 in the monkey-patch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: MZym32nAQjo1lCei-zGr8jLcr7amADoZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5OCBTYWx0ZWRfX7PsHpw46knWk
 h5NZdECykg03SwKF9qCIDoQD8p4PIMFwVsFevgE9ysneu2GaCRjQypvyIl/mkwz6+LLWSPdkbdV
 oiyFQdgh1wqsQri4ks34h611QgAcXLuN5+6KHfagf9jLMNW+xf0RXjyxsUwtTtNMLGI11sTHWap
 kEY+G60Di33b+hPpxz0CdFaOO2u6SpiEtk5n+94Pc7/3AaZcZE5EUvxtTTirhigiLphzeno5hL4
 7ceRBalVkcEtDDKd4+76WXw6zt3wvxaYPMM3O+Cv7VO8HSTsnwHazf4Y/Jl6VThKBPfhPHSzjHd
 nEXIznr2s3maEt364k6y7jyz3NQuVs78ewf4d6SZEJec+UNbr4Ga8rIwTb55EbOq0E4xqlSVZ1B
 YCzm/yya5dG9rZoQsNvHc+b3QXIXiTdzjXr20zMLAB4jczM7rRp+rBfv2hzVROmGWZ0e/A3ReDb
 LROKpvQm5dpfVJKjwFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5OCBTYWx0ZWRfX9O80PT2SNjHJ
 njtNVJczMKEtdDw3yNGRyiZhltK4Szjeds9aIKIj1lb8JeiOEkMiKpoBxnK7vyrv/dFtWn9pGpO
 XtaDCHwKfrXG6DdtgqFOsZn535/6Yug=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a86fc6a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=JHOEAitGfwzhcwFSqN8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: MZym32nAQjo1lCei-zGr8jLcr7amADoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 13:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243858

On Thu, 20 Aug 2026 at 14:10, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> This class is very old and not used anywhere in core or meta-oe. Is it
> still useful? What prompted you to look at it? Should we rather move
> useful checks to actual qa classes/libraries?

We have it enabled in qcom-distro. If you say it's deprecated, we will
consider checking possible alternatives.

>
> Alex
>
> On Thu, 20 Aug 2026 at 02:22, Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > Any build inheriting recipe_sanity fails during base configuration
> > parsing with:
> >
> >   TypeError: recipe_sanity_eh.<locals>.myrename() got an unexpected
> >   keyword argument 'recurse'
> >
> > recipe_sanity_eh() replaces bb.data_smart.DataSmart.renameVar() with its
> > own wrapper in order to record variable renames. The wrapper hardcoded
> > the signature as (self, key, newkey), so it broke as soon as bitbake
> > grew a new parameter: renameVar() gained a 'recurse' argument and
> > bb.data.expandKeys() now passes recurse=False, which the wrapper cannot
> > accept. As expandKeys() is called while hashing the base datastore, this
> > kills the build before a single recipe is parsed.
> >
> > Forward any extra positional and keyword arguments to the original
> > renameVar() instead of enumerating them, so the wrapper stays working
> > across future signature changes as well.
> >
> > Fixes: a3c6a020da9a ("data: Fix expandKeys recursion issue")
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  meta/classes/recipe_sanity.bbclass | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
> > index a5cc4315fb86..cd35ed6a1302 100644
> > --- a/meta/classes/recipe_sanity.bbclass
> > +++ b/meta/classes/recipe_sanity.bbclass
> > @@ -141,9 +141,9 @@ python recipe_sanity_eh () {
> >      # Sick, very sick..
> >      from bb.data_smart import DataSmart
> >      old = DataSmart.renameVar
> > -    def myrename(self, key, newkey):
> > +    def myrename(self, key, newkey, *args, **kwargs):
> >          oldvalue = self.getVar(newkey, 0)
> > -        old(self, key, newkey)
> > +        old(self, key, newkey, *args, **kwargs)
> >          newvalue = self.getVar(newkey, 0)
> >          if oldvalue:
> >              renames = self.getVar("__recipe_sanity_renames", 0) or set()
> > --
> > 2.47.3
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#243799): https://lists.openembedded.org/g/openembedded-core/message/243799
> > Mute This Topic: https://lists.openembedded.org/mt/120839376/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
With best wishes
Dmitry

