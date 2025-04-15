Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8A7C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 19:22:37 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.2688.1744744953304525940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 12:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=euiFocvS;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso56683941fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744744951; x=1745349751; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/hN0MZpXQgE0T0wsIhqqL1HUaKoKJTkjVdunlfFKBA=;
        b=euiFocvScQdudkowZ21YchbFfg6faC4A6ZfLZYw3K85zjRdXi4DCN/9/cxByLZ6CNG
         cOq8UrhiWA3qGXG86t341RskyWMdqqQ3On6GgEU30yizAYn0Sgt+h7hn2QnImESeOfUn
         x6mAzssU6cVkCnOV2dLPdCCn+6xofyZTQ4e9prxlZZHCHVaLoiPqbvEgaYAErK0gLZ3Z
         7GG2+y7JyOfdfGhJtwNcnJ6Yw7rOcGsDsyhPgTcaLP4PLipg5gc7uDT8Xxv8hdWDp1tn
         ZvCNURvYduX/VWgWMm9CMGyl7/70hL/QbPTfPTFD0GvIV5+hRo5ckJKA6EQ/FmYLtv1w
         2nsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744951; x=1745349751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/hN0MZpXQgE0T0wsIhqqL1HUaKoKJTkjVdunlfFKBA=;
        b=hhTTEMraIbhM6q1da1Nmo6Mis2pfP3Ko30Rcw3LpQBegIf6VWRu63aXyBvVJGLkDQt
         qCY0QA0ce062iZjq5pwWH8eE6rcNdIsA5DQDuFm46wL+SAp3fhaFz4Lefs01uTQiwPnV
         O27pU7H1RC5S1Tw25aGCev7V90A37enmu6DF+1SZ3+LdQzRWzCbSD28sdJ3MkQyqqr3G
         e76OTn8sfUHGB7YC/uvUS1KcBdbLIbOlKnTqwW5/Uiof1lkWhMU3wim3rXFs+kID9Bez
         CjkTEy90cZ67nAE6OSWxJEwnW239jtiFpDJexzuJOg/LJ5LNNoq5dp1HkNvtlmmxab+U
         riBg==
X-Forwarded-Encrypted: i=1; AJvYcCUUZOryL4BvezDEI8GH2HKJOI/F/Skl3QRT6sKm6TejYcAcpuN3LMUmvR1yYkCEavCRADKx983jIYkNYO9DuYQjKg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyslqrYB+4LmZjx/uHa4LFOA1PqxJgoE7yVTJ+EeE0FmgHCfwMr
	OOkb+KGjL8jC6IkUrn7hlg2rO8Wi8+R5RArAXYHOAUKVA1YjJL4zqPGO2o/oINeTwy3q07wXWhU
	tKBmVcwSlmOtUdgyviTdzB+w8wPw=
X-Gm-Gg: ASbGncvRxXOUOCnDI/7jmAzkL29GXfwNGd32LfyeiHtMoXSwuhM4wfFyb4ANxX19set
	LMXj36EMJbIyp/iuzLQYmvCatXq2HbLhjSkRMAYcdiL93IDpAmuzjH7um4OiN4czA5mFZtO19uE
	7dgrmkqaU5S/SzprwbmoIEvyedai6ciJGLPEI=
X-Google-Smtp-Source: AGHT+IGBgaYXkCX3SrSqvY2ZRIyVzN0E5RAPTbtolyKoj/0CErPoDmUKMtdT/z8245alhulMVGflyDQ6gqpidgJGfdA=
X-Received: by 2002:a2e:a817:0:b0:30b:a8c2:cbd3 with SMTP id
 38308e7fff4ca-3107c345d78mr730901fa.28.1744744951099; Tue, 15 Apr 2025
 12:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <CA+chaQcpXOTbbePCjusXgrcR-Y9fk02JOnecFsR2e5B+==x7Eg@mail.gmail.com>
 <CABXoSoVs_O7At3c+=nM6w=fwgULniKACzu_8AwhZR9iat59UYQ@mail.gmail.com> <70DCE40B-AEC3-4139-AD20-69C7C0AA8C0E@arm.com>
In-Reply-To: <70DCE40B-AEC3-4139-AD20-69C7C0AA8C0E@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 15 Apr 2025 21:22:18 +0200
X-Gm-Features: ATxdqUEaczGgvvofA4fDiWJBZVK-XLUyeramWgLGF3kixOZveVDayo-bYLDT8RI
Message-ID: <CA+chaQfhjz-61PdpgTAzsRJDhqUPMh_J_8-YLead3+5J=b9-Yg@mail.gmail.com>
Subject: Re: [OE-core] meta-qt6 on layerindex
To: Ross Burton <Ross.Burton@arm.com>
Cc: Samuli Piippo <samuli.piippo@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Samuli Piippo <samuli.piippo@qt.io>, Tim Orling <ticotimo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 19:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214965

On Tue, Apr 15, 2025 at 2:42=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 2 Apr 2025, at 08:37, Samuli Piippo <samuli.piippo@gmail.com> wrote:
> >
> > It would be great if I were able to, as the layer maintainer, add the n=
eeded branch mappings to the layerindex.
> > So far, Tim has been the one to update those.
> >
> > scarthgap -> 6.8
> > styhead -> 6.9
> >
> > If Tim or other admin could add these branch mappings, that would be gr=
eat.
> > The mapping can be added from admin view: Layer branches =E2=80=BA Add =
layer branch
> > AFAIK, only Branch and Actual Branch values need to be set up.Once ther=
e is a layer branch set up, it appears, I also have access rights to modify=
 it.
>
> I=E2=80=99ve just added scarthgap and styhead branches for meta-qt6.  Sor=
ry for the delay in this!

Thank you!

now when luneos and webosose layers are getting parsed I'll work on
some issues it detected, sending one fix for buildcfg shortly.

If there is someone with permission to delete the invalid layer-branch
mappings, then please delete the backports layers from:
https://layers.openembedded.org/layerindex/updates/42834/

ERROR: Subdirectory for layer meta-luneos-backports-4.3 does not exist
on branch master - if this is legitimate, the layer branch record
should be deleted
ERROR: Failed to get last revision for layer meta-luneos-backports-4.3
on branch master
ERROR: Subdirectory for layer meta-webos-backports-4.2 does not exist
on branch master - if this is legitimate, the layer branch record
should be deleted
ERROR: Subdirectory for layer meta-webos-backports-4.3 does not exist
on branch master - if this is legitimate, the layer branch record
should be deleted
ERROR: Subdirectory for layer meta-luneos-backports-5.1 does not exist
on branch master - if this is legitimate, the layer branch record
should be deleted
ERROR: Failed to get last revision for layer meta-luneos-backports-5.1
on branch master
ERROR: Subdirectory for layer meta-webos-backports-5.0 does not exist
on branch master - if this is legitimate, the layer branch record
should be deleted
ERROR: Subdirectory for layer meta-luneos-backports-5.1 does not exist
on branch kirkstone - if this is legitimate, the layer branch record
should be deleted
ERROR: Failed to get last revision for layer meta-luneos-backports-5.1
on branch kirkstone

These combinations of release/branch are indeed invalid and should be
deleted, but I don't have a permission to do so.
e.g. meta-luneos-backports-5.1 only makes sense for scarthgap and
older, shouldn't be in styhead or master release
I guess it exists in master release, because about a years ago the
layer was introduced in master branch, but later removed once we
upgraded to styhead.

Similarly with meta-webos-backports-{4.2,4.3,4,5.0} which were used
when master branch was used for kirkstone release, but were removed
when master moved to scarthgap.

I've asked meta-satobox maintainer in:
https://github.com/embetrix/meta-satobox/commit/a15d062f1e8e223290f738062c7=
453807f67aa27
to edit his layer to add integrity dependency, hopefully to fix:

ERROR: Issues found on branch master:
    meta-satobox: Failed to add since LAYERDEPENDS [integrity ...] is
not satisfied
ERROR: Issues found on branch scarthgap:
    meta-satobox: Failed to add since LAYERDEPENDS [integrity ...] is
not satisfied

And I've added scarthgap-rust-mixin dependency for scarthgap release
of meta-chromium to fix:
ERROR: Issues found on branch scarthgap:
    meta-chromium: Failed to add since LAYERDEPENDS
[scarthgap-rust-mixin ...] is not satisfied

I didn't fix meta-chromium for kirkstone, because lts-ruts-mixin
doesn't seem to be on layerindex at all:
ERROR: Issues found on branch kirkstone:
    meta-chromium: Failed to add since LAYERDEPENDS [lts-rust-mixin
...] is not satisfied
    meta-zenoh: Failed to add since LAYERDEPENDS [rust-layer ...] is
not satisfied

Cheers,

