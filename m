Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09D1E7FDCD
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 20:11:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.106.1770063073966726342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 12:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=i7j9Diy0;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fQ+sotoD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B5QYF3459134
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Feb 2026 20:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wc6lbvg1udaUXoNnj0NOS8MQWGhEciYDJXfUVb+bj0E=; b=i7j9Diy03X5XtqIE
	96/nymvmI1SdAiPm5NHlpIjIpQNjJdy4tzlFvFhTH2Wf9U4JWQb1TGHh2gdWjnb+
	ytBoU/KFvK05DyZWYo/pdLV8hPSKhzX6oarYxWsKy/yPSb+WTVwknXZa/ChOU3C6
	aJIUnFRyVax1AGzzUfvuC0kJEVS6dHaxRpsBLy1F7yNaZQVKX6duK1xFiKQazGgx
	Xs/kimtYkDlwwEph3ToU+8741a+p1XDBq6AZvwO11eAAC9LEtG6UdSFzcsiGLjKp
	a49NrAiIL5UzduWE4RmZNc2dG7fB0ADTj87C26LoQP5QpRGCSY82efzF8x3HQeRA
	IH2Z/Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbhmwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 20:11:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so3337211a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 12:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770063071; cv=none;
        d=google.com; s=arc-20240605;
        b=DpEXdLPj4qezmH7FC7rk1t/7/VJUkE65tnTFoXWkHyayJkt1p1kr7oDOdBHg8+Et3H
         vWEUA/Z5169KB2TwpKjRFfHwS1JqP/kOAOBJw7cOkEf4D+7tU6uJALlI8Han334ehdFc
         p9QfDTqSxfm7od4A8ok2BAX50OB7289IeXuypUTB8zYeSKreZAeykL5L5f4J8imM9NEk
         ib4YCFPamWsysyyn2BLW9V6zNtr/bh571je04WC1EdzoMuKr846KwkmW+T/T8l+KVfIp
         60VW/eARUFZv8wWmUvBPU7nITYq/wG1SBJHAnPBlRDm5xb1GFxNO/WMkj6Ky/bcD1ky3
         h1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wc6lbvg1udaUXoNnj0NOS8MQWGhEciYDJXfUVb+bj0E=;
        fh=xjdO2nQpTOiA9mdidtcQZZQKukvoWZUflZYsTikxw2g=;
        b=KuIbeWKH36ujNcXUYJP+Bc13ZW5RQRn0A0mhcp0s1s3f7mo6nglUa8zTX14zpSgbYJ
         0IPlDFYv4T6vvx0lxb7yt4bxuai8wPUJWJKgMm2RimTL8StxRHDQRCbK4uKITQv0zsZM
         QBla/cxYKG/Aj+wj6l6wbs+jbL46k5/lHWMvElGOIBlbNNCsvVzPgW7oM3H/hr7uKnOO
         gpKyo4dZBiZsdiSntfnazrQAL+0Zy1BYj08arXq7w71/3WHHiTcQiT9JmzYAvmGl3eyI
         uLjDqQlfo/f7Po4GKWsNazn2U5OWGyR8IzgtCloN+iYZuJCtWRU0gnG+dyw4uSVYTuMv
         zaYQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770063071; x=1770667871; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wc6lbvg1udaUXoNnj0NOS8MQWGhEciYDJXfUVb+bj0E=;
        b=fQ+sotoDY7Zj3TRZX1ezDGhgJFTSnheIU4SB18znhfCgkKhch0MpQfW9JouUYpth44
         xeb7d+fZMjm/HCg7FS5t/l+i//uwkBdM37iR2FKXYkYHPgFWesgYaTDAQ5lW/rSyJSJq
         gH1M7HmfbfLuZBMjem5bZ+5i5olx9bQhTjka9moyGshLN6yq5n2n+sOdpissBTVBe7ns
         66qAMFAAZBEG6TTnU7zPuTVGPFYCD5GaAw+P5VXGexvE6TKTNebVcu/NDfv8T6UTPmfO
         pOitj4UhPY7UrtdtavD/HdTtTwLX4qbxYueq9IaBxtVN+uPmvAybWHCR3DWX9mPaLLdz
         LmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770063071; x=1770667871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wc6lbvg1udaUXoNnj0NOS8MQWGhEciYDJXfUVb+bj0E=;
        b=BuKkySo6878ybTNjZ9Ct3EpWxJsLNg5cxTPs3+Ezpy2WwX05wPm9ccdajgyNG5vk52
         OeLU3kyCJLJG8xM6mMVhulSGTB6RvjGTLBujQqZCLfxXdVRfIHunnDD71nHKbPYYtjyz
         lMS4Jtm9c9J3gmCI1QoYFNNn+aNO3XzbMDstlO2P31rzmUJSXwVq+NxofjynMUR7tbLU
         oj18FCXZOLLE/11LwIrN4iE5gaqIOVoypW0841sLGnripu+VJ7bZV4noVvKHsDF0QB2A
         4HlsJjSJFo0CXh4+fT6mOnzX1X+QfLlTSthAq08TSZzaVKs4QRsawVgEVtbTBCdAkw8M
         KapA==
X-Forwarded-Encrypted: i=1; AJvYcCXE4i9h6f18WI0fiJuSIx9hKYXn8RBF4KDg14A8puemgOMYBNF3Nu0GEIg3iqKqG3FWapviOCd2+l+HDgyI30ggDA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5Vv29GxUpK7fSFnQvooVxsRPcqJF8pmwT051CPwwSqE8mChKl
	+57mOtyLcPRq7Onkv+ItmSh4uBCkJrTHwIuuwPl2i9qePQjhznQaFVq55VOeF8oxcU05b3baUSq
	6C8gEUBCjAMchdCJ5t0gx6/3PeRVK8s/Pk16PvMlNVJ36iNQdwZB1GFwa8Bdszp3rKO74DmtytU
	oHGLWBtcMYkI64FcVrjrewm5DbxT4LzTXlsq9jtr8RgHbg2Y6uX8N3OKOHCSj8glO0pg==
X-Gm-Gg: AZuq6aI6fJh7FKMXh9XuLYpajaiPRieRsEo3nrpjnRSN3lOAoaDEyHRFawMS722pYEn
	pueDaYXxWCpQVJ58XPASwIx91HVIDAtugolHDQiiu1NocPb0lxv9zFZolzkA3xiB+dluL7Zx3qJ
	I54Ou9/bJtrV5eTcX8Css/5kCIOoQl8+Re4ENo0sf+LUHej8ZZmbxb+W3/sOCCGyqchDEJ
X-Received: by 2002:a17:90b:5101:b0:340:bb56:79de with SMTP id 98e67ed59e1d1-3543b3b035cmr10305566a91.30.1770063071456;
        Mon, 02 Feb 2026 12:11:11 -0800 (PST)
X-Received: by 2002:a17:90b:5101:b0:340:bb56:79de with SMTP id
 98e67ed59e1d1-3543b3b035cmr10305559a91.30.1770063070980; Mon, 02 Feb 2026
 12:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20260122194959.13457-2-rs@ti.com> <8684a6b5-809b-41e4-a3b0-c99b424a1b2a@windriver.com>
 <0387b4a0-1457-4de6-9571-022b997199e4@cybernetics.com> <DFYTFOYS891P.2A5CKLOKP5KGI@ti.com>
 <117668c8-bc3b-46ea-9d2e-b205e3f2f827@windriver.com> <CAMKF1srfwp+o0FC5r+Y+NfmWV3hFCJr7ifO5rH1C0+Gos-HejQ@mail.gmail.com>
 <DFZIJWAQTT0R.2QPUKVEBUL8K7@ti.com> <CAMKF1spQbv-WCy9XEBxiK-Hzn1v=XZnGW8jWdOkk2axsx7r13A@mail.gmail.com>
 <CAA_5you6j=mVutd7JkF7Pxpsn+rhmg+NazFc0=pFXz8=LFW3Ww@mail.gmail.com>
 <DG1HOGASBF39.XTOA1VCZCPSR@ti.com> <CAA_5yotjKeeJHf+vio5e=KpojE=yOBAPem71SoZmNUwAUNT8xg@mail.gmail.com>
 <DG2EDPK1VQBE.3XAOY279FSGX@ti.com>
In-Reply-To: <DG2EDPK1VQBE.3XAOY279FSGX@ti.com>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 17:10:34 -0300
X-Gm-Features: AZwV_Qiyk8kyHRziD7CiyryOsEVDzsWdAGbrEwlSXCsCImnHxsLmlzWAyaa7fjQ
Message-ID: <CAA_5yoszcBBMpcJ7iYkCOvUqGw21hbED1o5iK+w=EkDDhjYZAA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from TARGET_LDFLAGS
To: Randolph Sapp <rs@ti.com>
Cc: raj.khem@gmail.com, changqing.li@windriver.com,
        openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: BTBfRPmhuuMPqsdwWCTgdNRfZomUj-zd
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=698104e0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=Q4-j1AaZAAAA:8 a=a3HqtVsjk1ghyO7vQWsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: BTBfRPmhuuMPqsdwWCTgdNRfZomUj-zd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1OCBTYWx0ZWRfX3rGU8l50aQbe
 HFNYm3JCzxveMritQpRqCx9ujY4TKZg/+vP20O3sv/OMe4ps2Z+RBRlTVOWUvalnmbkK2AEz7ZP
 mF39pFZgaWl+s1yyXijftLGZU5lhaywKAsKstZZyUrEPLR2uXOtSOgbO9iB6Qr59OJl9Lppmuga
 OM+GrrDs56qwMtO4zUYKVPVqmDOiH2shzCNJ0ogC+uRB5aOwcMYFMFIrxlNWY64Zxl9gfqg65tt
 tZe9W0MZVkmhj6P2AZYd2XJ/LT/2aVnEhNrmBCN9+TAwV1TMrcXJ4Uj5wyY6QgAOZ2ymrBMfT61
 Y50A5UcaT0DqgXpVMsrW67RB8ynhqwHizjgdXz+UTdv+FI0zGlVYbLfBQAqmF4ndRjiNn1qk2nD
 ROWJOCDBvONfl/XQ9W0OlmEsIoBfSiSTocDf0YALVg6EJy4iCkh9xc16WhgWV6N1OPbWBcl5jf6
 mQHkw95fLl8UaqU1x3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020158
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 20:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230398

On Fri, Jan 30, 2026 at 10:52=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:
> On Fri Jan 30, 2026 at 9:22 AM CST, Ricardo de Araujo (Salveti) wrote:
> > On Thu, Jan 29, 2026 at 9:15=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote=
:
> >> On Thu Jan 29, 2026 at 5:45 PM CST, Ricardo Salveti via lists.openembe=
dded.org wrote:
> >> > On Tue, Jan 27, 2026 at 1:50=E2=80=AFPM Khem Raj via lists.openembed=
ded.org
> >> > <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >> >> On Tue, Jan 27, 2026 at 8:31=E2=80=AFAM Randolph Sapp <rs@ti.com> w=
rote:
> >> >>>
> >> >>> On Tue Jan 27, 2026 at 12:12 AM CST, Khem Raj via lists.openembedd=
ed.org wrote:
> >> >>> > I am seeing some additional diagnostics see
> >> >>> >
> >> >>> > https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/511915=
3/raw_inline
> >> >>> >
> >> >>> > I wonder if this is related.
> >> >>>
> >> >>> Man, the mail clients are having fun with this thread.
> >> >>>
> >> >>> Yeah, I'm able to reproduce that issue locally now. Not sure why i=
t's this
> >> >>> package subset that's acting up, but it is directly related to the=
 LDFLAGS
> >> >>> change unfortunately.
> >> >>
> >> >> I think this is exposing the underlying issue in packages perhaps b=
ecause they are
> >> >> not respecting CFLAGS and when it's gone from LDFLAGS the mapping r=
elated
> >> >> flags go missing. I have a local patch to fix memstat e.g in master=
-next, all failures
> >> >> perhaps need to be looked into one by one and passed cflags from OE=
 env which
> >> >> might have been missed thus far.
> >> >
> >> > Just noticed a similar failure with lxc (meta-virtualization), but
> >> > while the prefix-map options are provided via CFLAGS, it only works
> >> > when provided via LDFLAGS, probably due LTO (enabled by default by
> >> > lxc).
> >> >
> >> > Patch available at
> >> > https://lists.yoctoproject.org/g/meta-virtualization/message/9553
> >> >
> >> > I guess recipes forcing LTO will probably have similar issues.
> >>
> >> Ran a test locally. Looking at the do_compile log there are actually s=
everal
> >> compilation steps that do not have the macro prefixes passed as cc arg=
uments.
> >>
> >> That LTO bug has actually been addressed, it's just as Khem Raj pointe=
d out,
> >> sometimes CFLAGS is ignored and passing the prefixes with LDFLAGS was =
masking
> >> that problem.
> >
> > I did look into one of the binaries and it was built with the right
> > cflags options, but didn't investigate too much.
> >
> > I can also confirm that it works fine after disabling LTO, that is why
> > I think it could be related to it.
>
> Oh boy. Looking into this more today, spending plenty of time trying to m=
ake
> sure it wasn't meson or some other argument combination causing issues, I
> stumbled upon this thread [1]. They report the same issue with debug-pref=
ixes,
> but they also cite potentially package dependent behavior with LTO. There=
 are
> quite a few open threads about LTO behavior in general that are concernin=
g.
>
> Maybe this should be reverted and the alternative solution for cgo binary
> reproducibility should be taken instead [2]? I don't really have the reso=
urces
> to start on compiler development at the moment.

Right, it might be indeed better to revert for now as we will probably
face similar LTO issues with multiple recipes and layers, since the
bug is still valid upstream.

Thanks,

Ricardo

