Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9B7C27C65
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 14:51:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.21582.1718031105370854500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 07:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LCQWAMB7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4217136a74dso23007975e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718031104; x=1718635904; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S4yFCQUUgtHF8LI/i/bokviTAi33OVu7uRS/Qk1r190=;
        b=LCQWAMB76lA1CDV6i0G7QPv7PwTUjX5uLOooTNj28CMxfEFtBZ01YDJXTWKirw9lKK
         YH4RA4a46+6w7WwdVXrCrt81NgRzu+bDAz//TdXOx8y6FIoejM2hu/R0HOs3oD7Zgqbz
         w4JsF1orl0LiSnqabGGUAUQ1S+yYsy3+yOrO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718031104; x=1718635904;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S4yFCQUUgtHF8LI/i/bokviTAi33OVu7uRS/Qk1r190=;
        b=nTb1CYks0FfzHvo7ktsVG3FLm67BwfFqKK0wvs7XYiAfqe+dyIFQkfYobb3hV9ld8I
         NAA8JGdFh5DfeouJMe7pQ2/ttk/FHNIFEqu+WE2f7mYjyIC9eaW7Hicj3tW2AOwxvHCt
         SJqXdw6PUnlfuNKaLx8LUshQjLinMicQ6ctV56MpyWdrudscX5JscbDYOQrNoKk6igrP
         n7Be3Uc4OCayiE2zbe7FrkL9uqHkU8qeCQXE8WOzhrrrQJ2x8oM9B9O4o5SlPwQExuoY
         ouvoind6oUPwkvEUPlk6qhiN1Dbw2NL3b181/BsFnL16oFiDt46J7mpP0BRfkQUtb9ks
         n1uQ==
X-Gm-Message-State: AOJu0Yy9vNLvvKmiEw1ufCU9R6n+xdjbttNiD2XtZ4DV7lmct5/g5rXQ
	5RRkooPsanQPN4joNkPC7HLEg3/NtT9fu+g9vTsZO1q0grRLUnsd+Dc2FJr3pro=
X-Google-Smtp-Source: AGHT+IH3T6NnwppEQ0BNEQ43JhYnHOSLzWfjtnFpB9sm4uPbX+uw2atbZ6sbe1cGaKYEczYP3ZIT0w==
X-Received: by 2002:adf:ee41:0:b0:35f:1427:f242 with SMTP id ffacd0b85a97d-35f1427f4c1mr3726347f8f.17.1718031103613;
        Mon, 10 Jun 2024 07:51:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fc3b:77d4:176b:a54? ([2001:8b0:aba:5f3c:fc3b:77d4:176b:a54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1e4075d6sm4667658f8f.18.2024.06.10.07.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 07:51:43 -0700 (PDT)
Message-ID: <43d73fb614b0d43974169a0f01f8837e08afcf5d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake-config-build: add a plugin for config
 fragments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Mon, 10 Jun 2024 15:51:42 +0100
In-Reply-To: <CANNYZj9Y=TjdofvxL32rWqPVZ9xLyryA9ic=FFeq+XveJcx7mg@mail.gmail.com>
References: <20240509160843.3283186-1-alex.kanavin@gmail.com>
	 <39d85fcd4e6a1b4bd439fdd7654b64ff69d4e646.camel@linuxfoundation.org>
	 <CANNYZj9Y=TjdofvxL32rWqPVZ9xLyryA9ic=FFeq+XveJcx7mg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 14:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200475

On Mon, 2024-06-10 at 12:58 +0200, Alexander Kanavin wrote:
> On Mon, 10 Jun 2024 at 12:08, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > b) The code adding/removing require lines from local.conf seems a
> > little fragile. I did wonder if we wanted a higher level bitbake
> > API to
> > this, for example a BB_CONF_FRAGMENTS variable which basically
> > tagges a
> > set of config files onto the end of the base configuration parsing?
> > This wouldn't be hard to implement in bitbake and would then make
> > the
> > tooling easier and less fragile.
>=20
> I don't quite follow. If BB_CONF_FRAGMENTS value is a space separated
> list of fragments, then how would the tooling
>=20
> - add to it?
> - remove from it?

bb.utils.edit_metadata()/bb.utils.edit_metadata_file() ?

> It would still need to look for an assignment to that variable in a
> 'standard location' (e.g. conf/local.conf), and then rewrite the file
> with the new assignment. That doesn't seem any easier to me than just
> using 'require path/to/fragment'.

I can see this both ways but we do have the helper functions above that
can do this (as used in recipetool/devtool).

> On the other hand, there could be qa checks for presence of a certain
> fragment(s) in that variable. E.g. a layer could stop a build if it
> detects that something is not there.

I'm wondering about whether having a variable makes it easier to users
to understand/edit.

I meant to also mention that I'm a bit concerned about using local.conf
specifically in the tool, I'd prefer not to require a specific conf
file.

> Another option is to copy/symlink the fragments into
> build/conf/fragments/ and have bitbake pick them up with a glob.

I don't like the copy idea, the symlink approach is interesting. The
main downside there is capturing the give config and ordering.

> > c) Do we want to have the config fragment name as a
> > "<layername>/<fragementname>" pair and have the fragments live
> > directly
> > in conf/fragments in a layer?
>=20
> The idea is to allow deep slash-separated hierarchies here to be used
> as categories, and map their names directly to file paths (stripping
> the conf/fragments/ prefix and .inc suffix in the tooling UI). Think
> of something like
> meta-yocto-bsp/conf/fragments/machines/arm/beaglebone.inc that would
> be presented as 'machines/arm/beaglebone' in the UI. Conversely, what
> layer it's in is not relevant in the tooling UI. If someone wants to
> enable systemd, they wouldn't care which layer would give them that.

That seems reasonable but I wanted to avoid every layer needing to nest
by a directory level to make it clear where the fragments come from. I
think some kind of naming standard might ultimately make things clearer
to the user?

Requiring the first entry be a layer name doesn't preclude the rest...


> This would come particularly handy in interactive UIs (e.g. something
> curses-driven and mimicking buildroot).
>=20
> > d) How do you control ordering between the fragments? Do we need
> > dependencies? How does layer ordering or dependencies affect
> > anything?
> > Can fragments conflict?
>=20
> I deliberately kept all of this out of scope to avoid going crazy
> with thought experiments and resulting over-engineering. I feel we
> need to start using the fragments in practice, particularly eat our
> own dog food on the autobuilder with them, and then problems and
> answers to them will arise from that practice.

I ask the questions since we have been trapped by choices in the past
and it since these are likely things which will arise, we might want to
at least consider them now.

> > e) You've used comments at the start of the files as
> > summary/description. Should we use some kind of more variable like
> > syntax which allows for other information in the future?
>=20
> I'm open to proposals, but this was by far the easiest and most
> straightforward and obvious to anyone reading the fragment. Python
> has no support for 'metadata in comments' that we can reuse. If
> there's need for other metadata about fragments we can invent special
> syntax for it, but summary/description pair can stay as #-comments.

We do have our parser which can easily handle:

CONFFRAG[summary] =3D "some summary"
CONFFRAG[description] =3D "Longer description with \
    multiple \
    lines \
"

or

CONFFRAGS +=3D "myfragment_name"

myfragment_name[summary] =3D "some summary"
myfragment_name[description] =3D "Longer description with \
    multiple \
    lines \
"

both of which have some pros and cons. I'm not sold on either of the
above but I wanted to give some examples.

For examples on handling such files see lib/bb/tests/parse.py,
basically call bb.parse.handle(f.name, self.d)[''].

Cheers,

Richard

