Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B61C001DE
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 12:33:17 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.6380.1690806792029757015
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 05:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BYY7/xTn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fbc244d307so48671875e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690806790; x=1691411590;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qe4zVXahIODMw0tnGtNr3eKlO9owjayKaj3X/nRppi0=;
        b=BYY7/xTnZEqv2ZP53C64dqN0KPThEtZS0Q3S9ZLPP9oUYA5xwh7Y7brPzRwKPS/bzL
         mWQgCYhvETlNJpq2zGdRVBOussmunaZH3V+nSuqfTWWlD03yARYY8fFN7vh63w472Gq5
         18n6lzVTxLajB0SQR97ED1b8qHlWHAfKyqEmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690806790; x=1691411590;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qe4zVXahIODMw0tnGtNr3eKlO9owjayKaj3X/nRppi0=;
        b=G1fKI8ILN2/7YmONunoWOhfWBK2rue34HYLN7aUgj+uosUTvCgv2tkeSiW3bpJpCCd
         Z3XKnFrrkvJ1l0QFbSvC2GMPvDZNdJVaRPAaEkOs7mixKkOAi9s556y1zkHrFzVOoIFr
         aD6YKcb1TYVd6b2qnshiJJH4VvpEUZayagFVbq8Ffyc65BfKdDZiY4ROlt1yiZF2iJll
         BAd9XVh9UuSQwZSRNY4kGHB7BpCPz16Psy0nCRtlSa9e/QaV+NbW44lXprVe8gtCMWKg
         mt9iB5WKz5xPuifvVuwKSLLABOY/VIdtLP4ir6FK//UfnNTlx5207BNsiX60oSMTvJzl
         6I/w==
X-Gm-Message-State: ABy/qLbrglGGpJtmA3syEQeHUkDpEQuHVzWkFKWFcisW89y5N5HyK8Wg
	CrsKciDqjSSZx6qZDgCTwrrFEg==
X-Google-Smtp-Source: APBJJlERmxT3oZAyhDiqQRVtnnr7kAIxSaVwDVw25eObBD1w+OSk1CiBRn1vdxAbWqHNNKob1RwzBw==
X-Received: by 2002:adf:eec7:0:b0:317:6ea5:ab71 with SMTP id a7-20020adfeec7000000b003176ea5ab71mr6741377wrp.30.1690806790075;
        Mon, 31 Jul 2023 05:33:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6f93:b696:bedd:c076? ([2001:8b0:aba:5f3c:6f93:b696:bedd:c076])
        by smtp.gmail.com with ESMTPSA id f21-20020a7bcc15000000b003fd32074e74sm14184397wmh.31.2023.07.31.05.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:33:09 -0700 (PDT)
Message-ID: <fdc2b7c450443e11836df189b5a6c584c6024d54.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] externalsrc: fix dependency chain issues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Suti <peter.suti@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2023 13:33:08 +0100
In-Reply-To: <CACMGZgbYY1HbmjLOq=FO2c-K+vJYb36Yay6sz48PrCtkFUWjmA@mail.gmail.com>
References: <20230731093415.261532-1-peter.suti@streamunlimited.com>
	 <fe958ac3d572d910e9f4eb861b18c4df40381a1e.camel@linuxfoundation.org>
	 <CACMGZgbCCj9jsTTxjVCZoU=1LPxmca5Gei_tKDgpKhxb+X2wog@mail.gmail.com>
	 <aecc7e66bc7cbc16c365c2432d4e850b938bc7e3.camel@linuxfoundation.org>
	 <CACMGZgbYY1HbmjLOq=FO2c-K+vJYb36Yay6sz48PrCtkFUWjmA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 12:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185141

On Mon, 2023-07-31 at 14:08 +0200, Peter Suti wrote:
> On Mon, Jul 31, 2023 at 1:06=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Mon, 2023-07-31 at 12:43 +0200, Peter Suti wrote:
> > > On Mon, Jul 31, 2023 at 12:15=E2=80=AFPM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > On Mon, 2023-07-31 at 11:34 +0200, Peter Suti wrote:
> > > > > Fixes [YOCTO #15164]
> > > > >=20
> > > > > Instead of deleting setscene tasks, now SSTATE_SKIP_CREATION is s=
et instead.
> > > > >=20
> > > > > This seems to fix the compile issues where the populate_sysroot t=
ask was
> > > > > not run when an externalsrc recipe was built as a dependency.
> > > > >=20
> > > > > Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
> > > > > ---
> > > > >  meta/classes/externalsrc.bbclass | 7 +++----
> > > > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > >=20
> > > > I think this is going to swap one set of issues for another.
> > > >=20
> > > > Setting the skip creation option will stop sstate from being genera=
ted
> > > > but it won't stop bitbake reusing existing sstate. In the case of
> > > > externalsrc, we need to stop it using sstate at all so this patch w=
on't
> > > > always have the effect we need :(
> > > >=20
> > > > Cheers,
> > > >=20
> > > > Richard
> > > >=20
> > >=20
> > > Thank you for taking the time to think about this patch!
> > >=20
> > > I see your point, but wouldn't inheriting EXTERNALSRC cause enough
> > > changes that the hash of the old sstate would no longer match?
> > >=20
> > > This should in my opinion ensure that sstate is never used because:
> > > A) old sstate would not be reused because of not matching hash
> > > B) sstate with matching hash would never be created.
> > >=20
> > > Please correct me if I missed something and this logic is wrong.
> >=20
> > For some cases, yes, this is definitely true.
> >=20
> > Sstate applies to intermediate tasks and you have to keep in mind hash
> > equivalence though. For example it would be possible for the package
> > task to generate the same output and hence the sstate hashes of the
> > package_write_ipk/rpm/deb tasks to be mapped as equivalent so sstate
> > would then start to match.
> >=20
> > For those tasks I mention above in the example it probably doesn't
> > matter too much in the context of externalsrc but I'm not sure the same
> > can be said for all tasks which is one of my worries with this.
>
> Thank you very much for this explanation. For us this patch seems to
> do the job and we did not notice any side effects so far. As we can
> reproduce the bug easily, we would be happy to try to implement a
> better solution instead of this patch. Unfortunately we do not have
> enough knowledge to do it without any help. Can you please maybe
> provide us some guidance on how to fix the [YOCTO #15164] in a way
> that would be acceptable for upstream?
>=20

Firstly, commit messages which just refer to bug reports without an
explanation of the issue are a challenge. Commit messages should be
self standing, i.e. not needing to rely on the external source for
information. A link to more information is however very much a good
thing.

I did look at the bug and it sounds like if you clean a recipe, builds
of other recipes which depend upon it then fail?

We need to understand what is happening with both the sstate manifests
and the stamp files to fully understand this bug.

do_prepare_recipe_sysroot of this recipe that depends on the
externalsrc one should trigger it's do_populate_sysroot. The question
is whether the do_clean removed the do_populate_sysroot stamp file for
that recipe or not? It sounds like it did remove the sstate manifest.

The more I look at this, the more I think changing the deltask is just
masking the issue and there is some other problem at play here which we
need to address directly.

Unfortunately it took me half an hour just to be able to read through
the pieces of this and get far enough I could write a coherent answer
to your question. It is a struggle to reply to everything in this level
of detail, much as I'd like to :/.

Cheers,

Richard








