Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23ED3D3900C
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 18:38:47 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17626.1768415922701308107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 10:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=NZBWSQJI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.180.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EGmZUY3296284
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 18:38:41 GMT
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8t2sv1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 18:38:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c66cb671fso22937a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1768415920; x=1769020720; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnfzAAoPsCLuXiy5Fq82k5UeKi2PcmIN7gnaELyb++w=;
        b=NZBWSQJIooxVt6RzGdiXKyHfsTWQL+YDMFgUpYK18xnFhT8s8ciqsUb8qMtqKBrabR
         ndDwsXWR2Pgnj1tmBZ2CusWVM/gOgwrfiDa3u2nMG7pSHKRpqpJF+N9+VHbazyATyi+m
         VL9HuS+u1FS+gBL8vFuxB+Q4cFsXmjIpmSmpmV5cRRIr22Bm+n1M/zroP1UGjR00vKNG
         6DlSReTmozx0lphmFZ5G+ixWeckWK2BzEfguM8rdAX3Vfntm8iXJRtb9EVTN0JBl/1YS
         fbeEQ+PPrSuSs638CBZfeRqZqCHNR15OAxsqsNuJzJAU19UEOJQO4H4rnMo+2GiWJfQx
         kDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768415920; x=1769020720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tnfzAAoPsCLuXiy5Fq82k5UeKi2PcmIN7gnaELyb++w=;
        b=w4SVM7OaYqeU+b7nmMpsGwV1SaIbJYnWPe99P3MgZ0qGVwDRoGMmUTgQZWH4rQQx1q
         o23FeN1XIHrQ6A9QqD8bilZVYP3sQ8QBknFyT4q7qNWYo0emQnpmITlz50HKf8O3qfyk
         hOLeHF230QI/0t0vjaWHAUoMslVsODeinX/X0HNBhE1/JIAtxer+N8c5IEen+m3N72Y1
         hPpwuihh7+rTVLd/Cgum9SEAm2J7Y8o+zbP6Y0o1wpm7r6eaNL08Oh5wdzhloRuqObQM
         mHue/n9Vdqa1URwJa7g7FKNDyq2Enwr+eF+N8kGnvgrQ4GomoR/BATGSKIGkBQJGz6cZ
         Njhw==
X-Forwarded-Encrypted: i=1; AJvYcCX/ZUa3M4jSREGZTk7WBTp9pE5WWOEoUNkklfkcPM2Wygs6nr1an2pBEWn5Q/jILBDJ51t1XFM3iO+Zn9H8923czQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YySfF5SphWlwHoOhXUgG4UzAicbvHPTwBhVPf9GwD4QmCyq7QPO
	r5TXXuia2pCJ9A5exY+9N+hlmc0hhYGgcl7ZJR4NpNdLDrUkNDSMr7dQugB3sDZ7h5L64h4EN9i
	DHqy1vkEj0MIo+5blzeQzIR7LGdAPs1UN8uWOJLS5mTgVI2gQg76wlfj5yZC2JJr90P22asvKfy
	zYR9zqvJTm57QnUGetpUUuH78AXdBUFbDvWFFJHx2bbdvvYhdCjv7aysFJ
X-Gm-Gg: AY/fxX5/dCI7JQ5x/T5//a2vKaRQOUyU5l5CDUIUmmYZ/8lZWMloss6PLC20+yrc/pJ
	ETLCX/HHsaxroYyTZTWdWfsA2UNddCcNB/GxJGzPylQYNrJbOKFV+iIU8fOfga3AHonBgRHukNM
	J2l2riZJh1KZY6hmdeY3r7mGoS7tXrxbhEaYvCPyPa78xMcfM6xfJMtaq/4k/fod1bqM0=
X-Received: by 2002:a17:90b:1c02:b0:340:d511:e164 with SMTP id 98e67ed59e1d1-3510911a179mr3614757a91.19.1768415920357;
        Wed, 14 Jan 2026 10:38:40 -0800 (PST)
X-Received: by 2002:a17:90b:1c02:b0:340:d511:e164 with SMTP id
 98e67ed59e1d1-3510911a179mr3614726a91.19.1768415919756; Wed, 14 Jan 2026
 10:38:39 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKowQqn-VuqaT1w3cXCWGfBeMtG2rHR9HXBFqxSfttAk4Q@mail.gmail.com>
 <DFOEW0JK0R5M.RI0FHSXWERO2@bootlin.com>
In-Reply-To: <DFOEW0JK0R5M.RI0FHSXWERO2@bootlin.com>
From: Daiane Angolini <daiane.angolini@foundries.io>
Date: Wed, 14 Jan 2026 15:38:28 -0300
X-Gm-Features: AZwV_QjQnvz-l2_ynIqtgJdI4CEdjhoWjgwve_yW0tQV9v_R4iYZHVv21Y5SnhY
Message-ID: <CA+HEL7_b1WJRAm+hO_JqZX0X36HhOVtX9w8vkDHvVK+XThcPag@mail.gmail.com>
Subject: Re: [bitbake-devel] [RFC] bitbake-setup: Documentation terminology
 and tooling suggestions
To: antonin.godard@bootlin.com
Cc: otavio.salvador@ossystems.com.br, bitbake-devel@lists.openembedded.org,
        Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YPaSCBGx c=1 sm=1 tr=0 ts=6967e2b1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8
 a=KyzcOz90J4RWwloDR4MA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE1NCBTYWx0ZWRfXyAohQMcmyeLf
 YCzBbPabajuQXKyBkyrx+95cffgtBxRt3qyDdlmLh90gmlmJxKnEGnL8FAsxr9dw7hD8Wwkr0xS
 GLuIkmUGHwKlZY65CDI4ueeqxGzyAApFR5LsNiRCD86D1o/iO+2YzM2PY/1W/LF1k373ZB68WgL
 YWRjoeq3A5nscXM2Kw47x6OZtVzvxoa1b13b4MSdPQ+PY6qSvsGSURLWbe/+RmzsLL4ARS4WhHU
 5BNUKZzn0YxmphZFciYVh1NamoasucPZtMHlDJQkGTXMRc5Tjv9zwraQWFWPBCFmpx+FeVl0X2K
 6I6uFTFWGUOaoUdeQ1Aa7sPphK1qjjkVPILOxVZTu/LM5G7REtp8arQj3vyHw10a/fw3ysVhWMc
 604jWmQ8mCjsjxnDLHx1MUl/DOQBLRWwkp+JHj/1xY0sCcbIrdyFfel64t4Rk7vYqDEMutW3zpg
 O7uEtwFhpxDOPoUKdvw==
X-Proofpoint-GUID: aEo7btKT-Wi_EHySo09V5_eS-EWya-8y
X-Proofpoint-ORIG-GUID: aEo7btKT-Wi_EHySo09V5_eS-EWya-8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 18:38:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229367

On Wed, Jan 14, 2026 at 12:19=E2=80=AFPM Antonin Godard via
lists.openembedded.org
<antonin.godard=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hi,
>
> On Wed Jan 14, 2026 at 1:02 AM CET, Otavio Salvador via lists.openembedde=
d.org wrote:
> [...]
> > 1. Generic Configuration =E2=86=92 BitBake Setup Template
> >
> > The term "Generic Configuration" does not immediately convey that this =
is a
> > reusable template file used as input to create a build environment. The
> > word "generic" can be interpreted as "basic" or "non-specialized" rathe=
r
> > than "reusable template."
> >
> > We suggest *BitBake Setup Template* as an alternative. This clearly
> > communicates that the .conf.json file serves as a template for creating
> > setups.
> > 2. Specific Configuration =E2=86=92 BitBake Setup Instance
> >
> > Similarly, "Specific Configuration" does not clearly indicate that this=
 is
> > the *result* of applying a template with user choices. The relationship
> > between "Generic" and "Specific" is not immediately obvious.
> >
> > We suggest *BitBake Setup Instance* as an alternative. The "Template =
=E2=86=92
> > Instance" pattern is widely understood by developers and immediately
> > conveys the relationship: a template is used to create an instance.
>
> I like the Template/Instance suggestion, but I'm not sure about removing =
the
> word "configuration" out of these terms. We are speaking about the
> _configuration_ of a Setup after all, and "BitBake Setup Instance" could =
be
> misinterpreted as a running bitbake-setup execution.
>
> So maybe:
>
>   Bitbake Setup Configuration Template
>   Bitbake Setup Configuration Instance
>
> or simply:
>
>   Configuration Template
>   Configuration Instance
>
> Would be enough. Having "BitBake Setup" prefixing every occurrence of thi=
s term
> is going to be too much otherwise?
>
> What do you think?

I personally don't like the idea of yet another configuration term.
But my main goal is avoid "generic/specific" so what was decided is ok
for me.

>
> > 3. Nested "configurations" =E2=86=92 Variant
> >
> > Within a BitBake Setup Template, there are nested "configurations" (e.g=
.,
> > poky, poky-with-sstate) that represent predefined bundles of fragments =
and
> > settings. Using "configuration" here creates confusion since the term i=
s
> > already heavily overloaded in the Yocto ecosystem.
> >
> > We suggest *Variant* as an alternative. This conveys that these are
> > different flavors or variations of the same base template, similar to h=
ow
> > distributions have variants or flavors.
>
> That sounds good to me, but would you also define a Variant as its own te=
rm (in
> the glossary)?

It all started in my mind when I decided to list all the elements of a
`.conf.json` and realized one of the pieces had no name. Then I
realized it could be called "bitbake configuration" if we look in the
`bitbake-setup init` output.

So yes, I think a new entry in the glossary would be helpful.

And I think a section with the what are the 4 elements of a
`.conf.json` is also missing (we currently have kind of it, but the
name "variant" is not clear enough for me)

And I don't understand why the "sources" element is shown as optional
as if you try to use a `.conf.json` with no source it does not fail,
but it produces nothing? (nothing I could find at least)

>
> [...]
> > 2. Allow Empty Variants in Templates
> >
> > Currently, bitbake-setup init requires the user to select a variant whe=
n
> > one is defined in the template. There is no option to skip this selecti=
on.
>
> I believe this is already achievable with the --skip-selection option?

This is the very first time my human eyes see "--skip-selection", I'm
sorry I completely missed it from the `--help`output

from the `bitbake-setup init --help` output

```
  --skip-selection SKIP_SELECTION
                        Do not select and set an option/fragment from
available choices; the resulting bitbake configuration may be
incomplete.
```

It makes me think that we want to always provide the list of variants,
but sometimes we want to avoid choosing. But I only copied the output
to highlight that the variant term is needed (in my opinion), as once
you read you know what we are not selecting.

On my local tests, if I create a `.conf.json` without the variants
element, I face an error message.

>
> > Allowing templates without variants (or making variant selection option=
al)
> > would reduce the number of questions during setup, making the process
> > faster and more approachable for newcomers.
>
> Instead of no variants, maybe we just want to instruct the user to run:
>
>   bitbake-setup init --non-interactive choice1 choice2 ...
>
> Another idea would be to make it possible to define default choices
> in an existing template? The documentation would then instruct the user t=
o
> simply execute:
>
>   bitbake-setup init --non-interactive
>
> which, with no choices passed on the command-line, would provide the user=
 with
> the default variant (the Poky Setup). The default choices would still hav=
e to be
> printed on the console to make it clear to the user what was selected.
>

We were trying to find the "equivalent set of commands" to pair with:

git clone <poky> -b LTS
source oe-init-build-env
bitbake <image>

and the equivalent would be using the `--non-interactive` so we played
around that to try to offer a minimum default for the reader.

But I - today - am still not completely convinced that making all the
choices at first is the best for the document flow. And using the
interactive way highlights too many "pokys" that the newcomer will not
understand

Anyway, if the community decided the default is not choosing for the
user, and let them choose, we (as tech writers) can only follow the
same.

We always knew bitbake-setup is in early stages, and there is a long
way until 6.0/may, that's why we started this conversation by asking
the basic questions: What is the expected list of features of
bitbake-setup by the next LTS and if bitbake-setup python package was
expected to be part of the LTS bundle before even start talking about
terminology. My goal (and I think I can say our goal and include
Otavio here) is more likely to be understanding where the community is
heading than making demands.

I appreciate all the attention,
Daiane

> [...]
> > 5. Fragment Discovery on OpenEmbedded Layer Index
> >
> > The OpenEmbedded Layer Index (https://layers.openembedded.org) is an
> > excellent resource for discovering layers. However, there is no equival=
ent
> > discovery mechanism for configuration fragments.
> >
> > Adding a tab or section for fragments would help users discover availab=
le
> > fragments and understand what problems they solve.
>
> Good idea IMO, as we already have machines and distros there, fragments w=
ould be
> a nice addition.
>
> Thanks for looking into this!
>
> Regards,
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18755): https://lists.openembedded.org/g/bitbake-deve=
l/message/18755
> Mute This Topic: https://lists.openembedded.org/mt/117253653/5992125
> Group Owner: bitbake-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/bitbake-devel/unsub [daiane=
.angolini@foundries.io]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

