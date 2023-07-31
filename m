Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9020BC001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 11:06:06 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.4901.1690801565323246117
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 04:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cy2TREps;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso40548425e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 04:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690801563; x=1691406363;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1uT8hn3nzFN/6fAdOX3nKwSP6nyn39KT9J03FuNtUQs=;
        b=cy2TREpsiIcCngGFQEv7iRk0poJ22U54vecObr0Rc2pTSNaVsVX9TRz4cS9x6NylUM
         LkcXXjFtnA87yYA69qVVIzymWO0GKrADtaPWl1uuGO2c8fm2Bj6IbZ5IUEElhaJxWtaH
         W/NLo/iNf/BQw5taYCzOVKZtO7tT9jXNNdCRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801563; x=1691406363;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1uT8hn3nzFN/6fAdOX3nKwSP6nyn39KT9J03FuNtUQs=;
        b=AFYeC4IdbFqikGdb6ygei3XjmfZ+FaiYULRcPVAnh7gn8jLmjULc9pgVsvHiUZtlOq
         crLRQ6Av0TyCrogdfXhKoj4FBPkRQO9FmHwcVnyz2B3+/MWXsxzNF6Yiz5++QmKCqXal
         I6ny5zijR9xjolpGBhoV8fTr36OUfcbcMQdMgvc4HASmrc5OnxTLru26JbTeskNf3BPO
         GkZlbD7o1uQdKku6p1rwKbAcWZ/HAoh58/PEw6+t6RcKGeEi2t2JM9NJVXvVMlx/dQhR
         UMjnmfC9BDn2R1TGVPPP9GmM0FULBAP9r37NHpGnCQeOTHbrf1LDXMnfBIiIO30QFnM1
         9zIQ==
X-Gm-Message-State: ABy/qLbOS6T+aacZ0eyIkqplBiKkejHjr+Gw48h4MkyccX47Qjl3CCs6
	TtKCba37Ky3VDBrBfgydauXWzQ==
X-Google-Smtp-Source: APBJJlHIyMb19cuvG6eU0q+eJXKHgMdYGZej7G7MYMNhz5piskOjX1nU2PbmVgqTTrVPavguSPdtvg==
X-Received: by 2002:a7b:c8c6:0:b0:3fd:2e6b:10c8 with SMTP id f6-20020a7bc8c6000000b003fd2e6b10c8mr6710985wml.23.1690801563555;
        Mon, 31 Jul 2023 04:06:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6f93:b696:bedd:c076? ([2001:8b0:aba:5f3c:6f93:b696:bedd:c076])
        by smtp.gmail.com with ESMTPSA id r6-20020adfce86000000b003179b3fd837sm5528002wrn.33.2023.07.31.04.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 04:06:03 -0700 (PDT)
Message-ID: <aecc7e66bc7cbc16c365c2432d4e850b938bc7e3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] externalsrc: fix dependency chain issues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Suti <peter.suti@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2023 12:06:02 +0100
In-Reply-To: <CACMGZgbCCj9jsTTxjVCZoU=1LPxmca5Gei_tKDgpKhxb+X2wog@mail.gmail.com>
References: <20230731093415.261532-1-peter.suti@streamunlimited.com>
	 <fe958ac3d572d910e9f4eb861b18c4df40381a1e.camel@linuxfoundation.org>
	 <CACMGZgbCCj9jsTTxjVCZoU=1LPxmca5Gei_tKDgpKhxb+X2wog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 11:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185135

On Mon, 2023-07-31 at 12:43 +0200, Peter Suti wrote:
> On Mon, Jul 31, 2023 at 12:15=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Mon, 2023-07-31 at 11:34 +0200, Peter Suti wrote:
> > > Fixes [YOCTO #15164]
> > >=20
> > > Instead of deleting setscene tasks, now SSTATE_SKIP_CREATION is set i=
nstead.
> > >=20
> > > This seems to fix the compile issues where the populate_sysroot task =
was
> > > not run when an externalsrc recipe was built as a dependency.
> > >=20
> > > Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
> > > ---
> > >  meta/classes/externalsrc.bbclass | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> >=20
> > I think this is going to swap one set of issues for another.
> >=20
> > Setting the skip creation option will stop sstate from being generated
> > but it won't stop bitbake reusing existing sstate. In the case of
> > externalsrc, we need to stop it using sstate at all so this patch won't
> > always have the effect we need :(
> >=20
> > Cheers,
> >=20
> > Richard
> >=20
>=20
> Thank you for taking the time to think about this patch!
>=20
> I see your point, but wouldn't inheriting EXTERNALSRC cause enough
> changes that the hash of the old sstate would no longer match?
>=20
> This should in my opinion ensure that sstate is never used because:
> A) old sstate would not be reused because of not matching hash
> B) sstate with matching hash would never be created.
>=20
> Please correct me if I missed something and this logic is wrong.

For some cases, yes, this is definitely true.=C2=A0

Sstate applies to intermediate tasks and you have to keep in mind hash
equivalence though. For example it would be possible for the package
task to generate the same output and hence the sstate hashes of the
package_write_ipk/rpm/deb tasks to be mapped as equivalent so sstate
would then start to match.

For those tasks I mention above in the example it probably doesn't
matter too much in the context of externalsrc but I'm not sure the same
can be said for all tasks which is one of my worries with this.

Cheers,

Richard





