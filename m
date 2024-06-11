Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BBCC27C5E
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 10:56:46 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.6578.1718103400577994392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 03:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZOil+sSk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42172ed3597so23744755e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 03:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718103399; x=1718708199; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KXLSTz2BjrCXq3EiOTj+wzoCRy8Im9s7ZXRcC7azlY8=;
        b=ZOil+sSk5KhS01cHKnj3GY3xeuE4E8zMPncV+Bj3IvTM4VCeLviXASt6rW/9AfyzJF
         iNTkkOWZllxkmM6Jnv4HvrwfiacUEkGBnE77zwjy2N/o9vW03aMM+5bnmx+0DnRe/J+U
         nCKkmSqdqNHfHeCZ7ZXY/rUcdoKk83O4pFuSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718103399; x=1718708199;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXLSTz2BjrCXq3EiOTj+wzoCRy8Im9s7ZXRcC7azlY8=;
        b=VDY2FTMNErJb7PonXK0VUr3wjEEmYnunNpaFhcIfukglBBM+uXm4N3XbVd2sva9E5f
         BS2u4yHHDe16dbv2CUFb/2NA0XZL08EBQzyNKiJemefg7I6kGvNwmWkNhUlUgQBvDC7y
         MounQqb924Tb7WGynZ9DNFcGQh8GbcyA+b/LP0EMG0B89e/bNDsZcnrplkJHLSgnk+97
         G48EUv3FwdlR8i5MnFZoPGtEts8inwKf7StZBNL/3VRRHheVvpz/8L7rUNTY3FOsgVGQ
         r8dfc6gbRaOy9/cTLX7zH3DfNrfyU7Nxi0MJ1VlshqHupzNCjTeMFZRucl4nqXPXqTNj
         5GLA==
X-Gm-Message-State: AOJu0Yw3MqazkMMCygd6b+pOgL4C35XtzqlJsMrgBWqQYLLVbq5YojHD
	IjNX81axP8OO9EOOMegqxSnhtEKJrjH5i1Ji4iuESIXuy3NWPrLmifl/9VgNHIs=
X-Google-Smtp-Source: AGHT+IFOTC+kYOG8tKcp49adaHB/zHpv0Mlm/LI6lq4C9ZnwPjYSK3swf3HfI71t2UQJT2wSfKV6gw==
X-Received: by 2002:a05:600c:4ec7:b0:421:392b:7e13 with SMTP id 5b1f17b1804b1-4223c3cbdbdmr22162765e9.4.1718103398953;
        Tue, 11 Jun 2024 03:56:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d58d:9b4d:d265:3c2e? ([2001:8b0:aba:5f3c:d58d:9b4d:d265:3c2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158149008sm206339885e9.29.2024.06.11.03.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 03:56:38 -0700 (PDT)
Message-ID: <2fe6e65a146a3ac281fdaae030c943342f7262ef.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake-config-build: add a plugin for config
 fragments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Tue, 11 Jun 2024 11:56:37 +0100
In-Reply-To: <CANNYZj-Qfaw6OPSoxLqv2HKa3ZTNozcfNnTfqyDqwtz0Epgh5g@mail.gmail.com>
References: <20240509160843.3283186-1-alex.kanavin@gmail.com>
	 <39d85fcd4e6a1b4bd439fdd7654b64ff69d4e646.camel@linuxfoundation.org>
	 <CANNYZj9Y=TjdofvxL32rWqPVZ9xLyryA9ic=FFeq+XveJcx7mg@mail.gmail.com>
	 <43d73fb614b0d43974169a0f01f8837e08afcf5d.camel@linuxfoundation.org>
	 <CANNYZj-Qfaw6OPSoxLqv2HKa3ZTNozcfNnTfqyDqwtz0Epgh5g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 10:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200507

On Tue, 2024-06-11 at 12:45 +0200, Alexander Kanavin wrote:
> On Mon, 10 Jun 2024 at 16:51, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > I don't quite follow. If BB_CONF_FRAGMENTS value is a space separated
> > > list of fragments, then how would the tooling
> > >=20
> > > - add to it?
> > > - remove from it?
> >=20
> > bb.utils.edit_metadata()/bb.utils.edit_metadata_file() ?
>=20
> Right, I had no idea this exists :)
>=20
> > I'm wondering about whether having a variable makes it easier to users
> > to understand/edit.
>=20
> I think there's benefit in having a variable that makes it separate
> and distinct from regular 'require' statements, but I can't form a
> clear preference for either option. Should this be taken to some kind
> of decision forum, e.g. oe-architecture or TSC?

oe-arch is the right place to discuss with the OE TSC being the
ultimate decision maker if needed.

> > I meant to also mention that I'm a bit concerned about using local.conf
> > specifically in the tool, I'd prefer not to require a specific conf
> > file.
>=20
> I agree that local.conf should be left alone. It's something coming
> from templates and I would rather never touch it with tools after the
> fact.
>=20
> But either the 'require' statements or the variable containing the
> fragment list has to be written into something that bitbake can see.
> Should they go to build/conf/fragments.conf ?

I'd wondered about a dedicated file, yes. Perhaps with locked sigs also
becoming a dedicated conf file for similar reasons.

> > > Another option is to copy/symlink the fragments into
> > > build/conf/fragments/ and have bitbake pick them up with a glob.
> >=20
> > I don't like the copy idea, the symlink approach is interesting. The
> > main downside there is capturing the give config and ordering.
>=20
> 'give config'?

Sorry, it was meant to read "given config".

>=20
> > That seems reasonable but I wanted to avoid every layer needing to nest
> > by a directory level to make it clear where the fragments come from. I
> > think some kind of naming standard might ultimately make things clearer
> > to the user?
> >=20
> > Requiring the first entry be a layer name doesn't preclude the rest...
>=20
> Okay, I'll rework to include the layer name upfront.
>=20
> > I ask the questions since we have been trapped by choices in the past
> > and it since these are likely things which will arise, we might want to
> > at least consider them now.
>=20
> Hopefully the current code makes no choices for these things. It just
> adds/removes requested fragments, nothing else. But it can be extended
> to read fragment metadata, and armed with that (and the list of
> fragments already enabled) make decisions about what the new list
> should be, or whether the request should be declined.

I'd like to explore these issues a little bit further now before we
lock in on a format as I think their need is probably inevitable.

>=20
> > We do have our parser which can easily handle:
> >=20
> > CONFFRAG[summary] =3D "some summary"
> > CONFFRAG[description] =3D "Longer description with \
> > =C2=A0=C2=A0=C2=A0 multiple \
> > =C2=A0=C2=A0=C2=A0 lines \
> > "
>=20
> I must be missing something here. If this is defined in two different
> fragments and both are included, how would one not step on the other
> with these assignments?

They would overwrite each other but you can still parse the data from
each file in turn. layer.conf files did give bitbake a similar
challenge. It gives more readability at the cost of not being able to
store all the data in the same data store.

> > or
> >=20
> > CONFFRAGS +=3D "myfragment_name"
> >=20
> > myfragment_name[summary] =3D "some summary"
> > myfragment_name[description] =3D "Longer description with \
> > =C2=A0=C2=A0=C2=A0 multiple \
> > =C2=A0=C2=A0=C2=A0 lines \
> > "
>=20
> Okay, this one in my opinion is a big readability (and write-ability)
> regression compared to #-comments. For extended metadata (such as
> dependencies/conflicts) something like this would be needed, but I'd
> rather not use it for summary/description.

I'm not happy with the above either but I do think we should fine a
format which is parsable as I really dislike 'magic' comments
(similarly in machine conf files too). They don't scale and have
machine readability issues.

I'm open to other other ideas. I'd even consider some kind of new
syntax if needed and we can't make the existing syntax work.

Cheers,

Richard


