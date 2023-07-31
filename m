Return-Path: <peter.suti@streamunlimited.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E749AC001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 12:09:16 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.5780.1690805348418856583
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 05:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@streamunlimited.com header.s=google header.b=VkxAdWAg;
 spf=pass (domain: streamunlimited.com, ip: 209.85.218.53, mailfrom: peter.suti@streamunlimited.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-99bc0a20b54so723902066b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 05:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google; t=1690805346; x=1691410146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4svsZtZP1mcJtAVcmQbQw1x1uoub8jvVTbEN9DI4Jc=;
        b=VkxAdWAgd456f0bCpIiKfWWLC4c+RC/81+/3xn3ilCRAYUafi0+0wdgtQUdRYulb23
         y9rQzNPACDnHpeYnbeTNqUkgUFcgQPlNVTZDcKqJhSwIkSKhAtaFI/0J96bbTsAeGYFq
         8ucpa2CEhN7pon9POARs2HESTU+bXmWahZNqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805346; x=1691410146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4svsZtZP1mcJtAVcmQbQw1x1uoub8jvVTbEN9DI4Jc=;
        b=N2WiSdbeT9cJdunUO3YjqNvwQ/qDf9BTaQHceO+OVTzPlP2C1NIZWXagnFrYQe39ae
         CWkucoXaIeLhB1huZcDcVlF+uxfep4YJ6p3jSEcy4G4I2qh7oQYoZGwWBdGhTXa5Fm9i
         1OdVmZDt+x1KZC5c6xrLc/ywwFmFns1iRFpV75zS3JZ82MmwQKCnrOxeMKEljT6kueUd
         n9HsfTWLY4j7bDDFV+kN8HfUswRIO4+zYvK9S2yqRKmD/qOCFk3VE9iQxFCjyqrIbzUt
         Q2DFkKfzInWocxVe17DRIiRM2ME4DgXV6DcpUok7X9HKSeJt5HUDxxeNFghlOAqpnxMT
         Ca9w==
X-Gm-Message-State: ABy/qLZ7vzYoyNWmdXVplM908saZ63cR4oJjWVDZUU7piDbUxL/1Y7ft
	V6mjKtESAT28advy6ijuZ1TsakJIiWajdOzRWW1mOVV1951LJUggTJsl8g==
X-Google-Smtp-Source: APBJJlEvOCVCgbVztsbBZ2QfBKZ/rjwvDmfTVP+gbrk70Kb5z7T+UgJS+KirxkQEQf/Z91rtMxcxM9WwHF3PLXhwau8=
X-Received: by 2002:a17:906:7499:b0:99b:627b:e96d with SMTP id
 e25-20020a170906749900b0099b627be96dmr7378372ejl.44.1690805346322; Mon, 31
 Jul 2023 05:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230731093415.261532-1-peter.suti@streamunlimited.com>
 <fe958ac3d572d910e9f4eb861b18c4df40381a1e.camel@linuxfoundation.org>
 <CACMGZgbCCj9jsTTxjVCZoU=1LPxmca5Gei_tKDgpKhxb+X2wog@mail.gmail.com> <aecc7e66bc7cbc16c365c2432d4e850b938bc7e3.camel@linuxfoundation.org>
In-Reply-To: <aecc7e66bc7cbc16c365c2432d4e850b938bc7e3.camel@linuxfoundation.org>
From: Peter Suti <peter.suti@streamunlimited.com>
Date: Mon, 31 Jul 2023 14:08:55 +0200
Message-ID: <CACMGZgbYY1HbmjLOq=FO2c-K+vJYb36Yay6sz48PrCtkFUWjmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] externalsrc: fix dependency chain issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 12:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185139

On Mon, Jul 31, 2023 at 1:06=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2023-07-31 at 12:43 +0200, Peter Suti wrote:
> > On Mon, Jul 31, 2023 at 12:15=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2023-07-31 at 11:34 +0200, Peter Suti wrote:
> > > > Fixes [YOCTO #15164]
> > > >
> > > > Instead of deleting setscene tasks, now SSTATE_SKIP_CREATION is set=
 instead.
> > > >
> > > > This seems to fix the compile issues where the populate_sysroot tas=
k was
> > > > not run when an externalsrc recipe was built as a dependency.
> > > >
> > > > Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
> > > > ---
> > > >  meta/classes/externalsrc.bbclass | 7 +++----
> > > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > >
> > > I think this is going to swap one set of issues for another.
> > >
> > > Setting the skip creation option will stop sstate from being generate=
d
> > > but it won't stop bitbake reusing existing sstate. In the case of
> > > externalsrc, we need to stop it using sstate at all so this patch won=
't
> > > always have the effect we need :(
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> >
> > Thank you for taking the time to think about this patch!
> >
> > I see your point, but wouldn't inheriting EXTERNALSRC cause enough
> > changes that the hash of the old sstate would no longer match?
> >
> > This should in my opinion ensure that sstate is never used because:
> > A) old sstate would not be reused because of not matching hash
> > B) sstate with matching hash would never be created.
> >
> > Please correct me if I missed something and this logic is wrong.
>
> For some cases, yes, this is definitely true.
>
> Sstate applies to intermediate tasks and you have to keep in mind hash
> equivalence though. For example it would be possible for the package
> task to generate the same output and hence the sstate hashes of the
> package_write_ipk/rpm/deb tasks to be mapped as equivalent so sstate
> would then start to match.
>
> For those tasks I mention above in the example it probably doesn't
> matter too much in the context of externalsrc but I'm not sure the same
> can be said for all tasks which is one of my worries with this.
>
> Cheers,
>
> Richard
>
>
Thank you very much for this explanation. For us this patch seems to
do the job and we did not notice any side effects so far. As we can
reproduce the bug easily, we would be happy to try to implement a
better solution instead of this patch. Unfortunately we do not have
enough knowledge to do it without any help. Can you please maybe
provide us some guidance on how to fix the [YOCTO #15164] in a way
that would be acceptable for upstream?
>
>

