Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15338FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 12:02:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11725.1777377719089199509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 05:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EwCLx8tO;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Opi29FCg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA3vdw3275100
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 12:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WpVwfYF6bF4AlqZhtFD7ZkqW085ZyLuGrIeZt0SyW4o=; b=EwCLx8tOK0IX+1pC
	IMBXZHZ5RF6upguZDJo7Lrl0UeE2gnzWuQOKxEo5yP1UcEWNrR02LMsWDY3MlMm5
	MMnRea31lm/Y5jKwfB4aOX4hZFlYgtr+UXFZBlLWdWPMKDSydB3044eXg1GZtS+b
	cdELNAefmH2zIS7mboteauH37gznRFKxC5YulAu7tqtAp3Tr1EF62ul0qQyFFTDo
	a3I5Cucv2hJuzzpoMneN4BSnSlk4RU559oIjzSDzmwXTqBxPWwLknWjJ/J/V8e2q
	IkoKCCyQ2RDVZ6ia+LKuHCG2VmJ3FVEOk3JqEvqu03k8/bSSzv/zHDbZLx3tVE3Z
	PdZhzQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjgda2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 12:01:57 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-65441e6e52dso12860810d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 05:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777377692; cv=none;
        d=google.com; s=arc-20240605;
        b=IEsBw/QRK5w1iOZ1LQ7GrJ5oRjNAQhhKgkaCzm8EsRYFabWSczLPX6ir1x5kVi3KD+
         e0W0gcSKLhvjgbS+ogGCKkd12iUPBdmiNYYoT7ZT3TcucASdE+VnS/D3rKOdd9o9z9nV
         mEnTWpcGTnNkW21DtoEBg/zvqnDqV4IseipgEdtms78hAy/+h7q4wwm49r3qEdPdKTDc
         RPie6euGBiT3wF0wx2drJ8fBeG6d1hPmTGw7wMJooBloGOrnGO3Vg5adMCUW6PNvlzdt
         hXpZf6/p5eBD/7Gy1Bc5TWaxibkPRa0rctpfWbiq8InVoDoyKZEfFwgOnUI4PRLVkRkh
         WZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WpVwfYF6bF4AlqZhtFD7ZkqW085ZyLuGrIeZt0SyW4o=;
        fh=L8RqbJePcJovjpPWQ0Hajg0yfCjcPevox0x0leoAfqg=;
        b=UowzoEexE/C9cfzRyHNJQ3tZzEzw+yoCDjWTKJWLp7qxhDFDvz5qId+Ta8UL5ek5Nq
         bt+AT5A9y87tj1k4jFXM8od7K+cU7KArsCvz5IuJfAmyv8fnTV5BX8j1N2FkjFPY2dTI
         SOTYMhgSQBXkEjXCXVD0COfDuHigOrBFwKLCOS/oN2nzQJLsIiWQggIBwdj8iJuE/KjH
         eu6aXASB1FvxGOUHRh95G6wVow98AYvDpWevv8s0IU3/U2EmsU/0c8Z5DKAOyB9etviQ
         aMxOv+Yx/esdoizVMf44pRtnyE6WEXqmViRI57Bcy5he2XFVxUCeSvbt9p41cjP6yzaa
         VEDQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777377692; x=1777982492; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpVwfYF6bF4AlqZhtFD7ZkqW085ZyLuGrIeZt0SyW4o=;
        b=Opi29FCgGuANvGysWbn1AwxO1rrgFbfs0+0ozTmu6rd4S2HJ1cao3lfJz8lyy2kGhs
         3J8V+qBlF/rq1VipG7w2tdmTFtqPxrHS3ydljeKZP50vXsd9kif7EURHCYxKcTMHiSFu
         8RNPhpYPxncnLfhAA8kLe84zAcb3HO0DPOunplyF3rGzHg4+KHzJBy1txFvkEDhc4X88
         yzm6txRlUcTfhz7qLCWCGlHRYSuP1byXjHNKF5cNxj4OCaPvFG3DOJ8qMgfs7KhnioRQ
         IWMu9+J8IJ/+k6xfs526/myGgYrAtKymAx4epZ8JClzZnichSPLv1NDZLrbSkq+pIJv3
         yHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777377692; x=1777982492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WpVwfYF6bF4AlqZhtFD7ZkqW085ZyLuGrIeZt0SyW4o=;
        b=NQCIdu0ptorQzsquBdaT9tEdsGvX46q4VNUg58DFug7oSsKUfGA+K3CQ3URI9CBq9g
         +HMFKkV0YqASA+F+iSn5v0PHUlHG5v+xzKMRQhNh3G6cchrozQBADRBLYP6ZKqE9xikL
         iRxmXBsGqM6PXLem6ZJQRGET9Wi2KUED/IDzi/v2TLDWyC9albhr2dCCwp9B0pLSRXTp
         9Fh9U38R9r6Ayr13x2UmtOi15L1vwYmwNbMeEY8ROCh+BoIangrPg3ltkbVopAr6Qjcz
         kxFycgbd2HcEx/vr2UjPjRYOotNSx7KQZAJFzFjKEVwMoOlXdA1GFi4nWDAw+Ck8lSSm
         y07A==
X-Forwarded-Encrypted: i=1; AFNElJ/0SnDULLCdrrA4cxwGsCssL86yC106zoixKgeGoq/GcmcO5dkZ4UveA5VPveoImwMUxcUcsVep5IKCgFgF6HjFcQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywgqm3dM48h2rcheOFbvgOTRtKFykAVsJB3RQ7YXbN3CnCYwc8v
	y09ac28CwyJs1MBWNIN/L53yjMCyYV7E26PzjKFlwLdzqUW6q2Ay3Mie48DME19oyuO/n63B3qE
	2iVU7kfteB/7/l+QS04YbU1pko1YlGfL4MfQWu/Vw9R+PgkKWzEImGFGH5566BRouZ2rFcSdlJ6
	QuMZlDxiHSSxXCjTLp7Vit2jRmrAbwxOpOSUkfsVmktAJvUQamvWzHkwebpw==
X-Gm-Gg: AeBDiesY8A7m8JdlBd1FBB5nmCp9m9+1wgzKYDS7N21CeEOpjmS9X230SHQIHFyWpMM
	9EFXSpKHPb2ECY76wiBp13OD3FWpTJvAFQ/PKkYlOoxh/QYyEFxyNjIv400+xawXlXOy0bf3bN5
	jkKw+b+SWxDQeO/1BtjhA+Oiq23mm7bETIuZ5idMudSLv9oheiyTrZafeL7yNZ/jZDOMgmVcUk0
	N++CUxm0LMOiLjrPqDyFgPkz+gsvcA4ASBv0BT4Nqd81q6ZRnw=
X-Received: by 2002:a05:690e:dc6:b0:656:25e6:e127 with SMTP id 956f58d0204a3-65beed1c388mr2312764d50.11.1777377692237;
        Tue, 28 Apr 2026 05:01:32 -0700 (PDT)
X-Received: by 2002:a05:690e:dc6:b0:656:25e6:e127 with SMTP id
 956f58d0204a3-65beed1c388mr2312671d50.11.1777377691534; Tue, 28 Apr 2026
 05:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260427103040.1519121-1-viswanath.kraleti@oss.qualcomm.com>
 <DI3WQFOXA6GG.23KER0QY230XL@bootlin.com> <18AA3C050EE61D30.2188217@lists.openembedded.org>
 <CANPvuRkVsWWCmUtt=O821j0YH0mCirsCytTywEx7YD=Qu4TMog@mail.gmail.com> <b9c4ddd5ae72ae21ee0b6e12fb1a1f63661c685c.camel@linuxfoundation.org>
In-Reply-To: <b9c4ddd5ae72ae21ee0b6e12fb1a1f63661c685c.camel@linuxfoundation.org>
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 17:31:20 +0530
X-Gm-Features: AVHnY4KjTHpyAcusCPt5s-2QsHf_XrL6aF2oj6y-bQrdfUKXhYTihE8gpwfXI3M
Message-ID: <CAHyS93p8V+XudSUFToKGyOCARH2HrnQLhZbFdsGr1GciCy4cHw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] mirrors: switch Yocto Project mirrors to HTTPS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: quaresma.jose@gmail.com, antonin.godard@bootlin.com,
        openembedded-core@lists.openembedded.org,
        Michael Halstead <mhalstead@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExMSBTYWx0ZWRfXxzUnHOmsDrGe
 ydaR6nBSscfOsrrafsHL0rEjawarhNr5tLxjb0qqsJCoX5DgyDsk07jj+JHh6FeHP16wMhr7ZrP
 mvCOBGTye+dNhH9x4u/3m2a3cA+w1MVMqxD0nZbrraa1qt5PpAeuLjHyJ+daXmVsLO2138ybXU5
 74kRQv5P0bhAV7wllTCMAzNMkznU/9ZabvQ6Cmuip5X1NXAI+1F+zrpl/5J00LnKq12N0HaWD/D
 UZ9MMnyhhujB0aonkrKozPcMP14jdqrOa9ks5846Em1/DWa7AyXzhBei47yIXCqWFrfxAwoh1Rn
 LKQRuoPIxC5xP0RMa6iMUjPoqeMtPFiU5dIh8kQ1GHNEKAh3kmAdn3cwXpJCaFZAy9Lnfm7JpY+
 cerCO96YR4tHiuB96N5qjyxetoCkOoUi5fe8IFQzZJZkgIwyVRVaQjtqWf1c2fa1NRSTIUblueh
 aIhlY+ydVbXULb79Csg==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f0a1b5 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=Q4-j1AaZAAAA:8 a=ag1SF4gXAAAA:8
 a=wii0R7aNo8ADza2i2-kA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: dcZsnQI47oaA393STmbVZXoXB9-hdJ_T
X-Proofpoint-ORIG-GUID: dcZsnQI47oaA393STmbVZXoXB9-hdJ_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 12:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236057

On Tue, Apr 28, 2026 at 4:53=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2026-04-28 at 11:46 +0100, Jose Quaresma via lists.openembedded.o=
rg wrote:
> >
> >
> > Jose Quaresma via lists.openembedded.org <quaresma.jose=3Dgmail.com@lis=
ts.openembedded.org> escreveu (segunda, 27/04/2026 =C3=A0(s) 15:09):
> > >
> > >
> > > Antonin Godard via lists.openembedded.org <antonin.godard=3Dbootlin.c=
om@lists.openembedded.org> escreveu (segunda, 27/04/2026 =C3=A0(s) 12:40):
> > > > On Mon Apr 27, 2026 at 12:30 PM CEST, Viswanath Kraleti via lists.o=
penembedded.org wrote:
> > > > [...]
> > > > >   svn://.*/.*     http://sources.openembedded.org/ \
> > > > >   git://.*/.*     http://sources.openembedded.org/ \
> > > > >   gitsm://.*/.*   http://sources.openembedded.org/ \
> > > >
> > > > On a related note, it seems that http://sources.openembedded.org/ i=
s no longer
> > > > active. Could we remove it?
> > > >
> > >
> > >
> > > I also noticed that when I tried it, but I was unsure if it was inter=
mittent or if it didn't even exist.
> > > Add Michael in cc and perhaps he can confirm.
> > >
> >
> >
> > It's not intermittent, because the address still can't be resolved toda=
y.
> > I think it's safe to remove this addresses in a subsequent commit,
> > and if there are any complaints, we can revert the commit.
>
> I know a bit of the history there and agree we should remove them.
>

Thanks for the confirmation. I'll drop them.

> Cheers,
>
> Richard

