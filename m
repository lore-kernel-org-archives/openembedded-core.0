Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1951C001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 12:04:46 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.5871.1690805084622271423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 05:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PchkV+Jq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3174aac120aso4077330f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 05:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690805083; x=1691409883;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xZQp/jzHfQc2TmGAdEdt4fdOqMxm55hG/1l76fdEqvM=;
        b=PchkV+JqtrU4lGd0fO2t6SYx6uVeFv5WXJTeYzcSOzQKFaFxVLZzpPBjcee54F9bdy
         JvbIfLGys03wRIf2L8e6BlyBMT+dv1B1jF+S80ap8PZJLgS7YO8lJ80bSKVk1qlvglNO
         X2F1InzfB9YQd1wV1gQg5KiQehhCajzcT5oEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805083; x=1691409883;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xZQp/jzHfQc2TmGAdEdt4fdOqMxm55hG/1l76fdEqvM=;
        b=CoKxM1NQsKRpGZwa/E1dCUW92mV/OlI2HJ3N7NTOtZNZageh4aZQVuhZziaqMWII8Z
         F/pvqiS+UMbLCWcXDXO3YLpELfYgLhilL7byw/qdWbr5zU2hFp6LETs/jYpVflxAMrZz
         wvHF16xUpfChFXcZ0EzUVceLkhbOZMwf4mIZS90k1FyrWB2C8QUr9iokoxmSYnEgLiWL
         1BUmKX6VMZyGVfc7k3deXWnNy4QGWk7U9wRu5TfW18+Bwt+5IkEYyvxx07JY0uEZX9uz
         EJGJOwOl6efGPASF0bPxplVlO0+dD8uvU2fYYHYjod9mTvVnQgtMDBQF2cb7m85Hc9vy
         +kHg==
X-Gm-Message-State: ABy/qLa71FBclREGQp3abeOvtpQxNeIgRtEBfTC44/s9uU5ObUE52oqR
	0z1SbDzIjD881hV0d/2DoSJkSA==
X-Google-Smtp-Source: APBJJlGSAp3CIXXlNY1tTZIIy/+okiXahVxANUbs9I0WtM39stbDjwf8UjPLR5EuHi4CUGicW7r0lQ==
X-Received: by 2002:a5d:46c3:0:b0:317:9537:d73f with SMTP id g3-20020a5d46c3000000b003179537d73fmr4007916wrs.30.1690805082871;
        Mon, 31 Jul 2023 05:04:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6f93:b696:bedd:c076? ([2001:8b0:aba:5f3c:6f93:b696:bedd:c076])
        by smtp.gmail.com with ESMTPSA id c3-20020a056000104300b003141e629cb6sm12751298wrx.101.2023.07.31.05.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:04:42 -0700 (PDT)
Message-ID: <2039c55f7149d1a362e324751626fc2f032cdec2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-build: add a tool for
 discovering config templates and setting up builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Mon, 31 Jul 2023 13:04:41 +0100
In-Reply-To: <CANNYZj95L_pLLeL_-bUrMLSAVaG0NgSWBSNnpF9KjK5wpXYA-A@mail.gmail.com>
References: <20230510095726.4090311-1-alex@linutronix.de>
	 <20230510095726.4090311-2-alex@linutronix.de>
	 <ea898c7901735eee11dd07ee5ad3ab976cd44b95.camel@rpsys.net>
	 <CANNYZj95L_pLLeL_-bUrMLSAVaG0NgSWBSNnpF9KjK5wpXYA-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 12:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185138

On Mon, 2023-07-31 at 13:31 +0200, Alexander Kanavin wrote:
> On Mon, 31 Jul 2023 at 12:56, Richard Purdie <rpurdie@rpsys.net> wrote:
>=20
> > I've just been looking at this again and I'm still not convinced this
> > is right. In particular, the above output worries me a lot, partly as I
> > barely understand it and I suspect if I struggle, I won't be the only
> > one.
> >=20
> > With this kind of core tool, the "interface" to the user needs to be
> > really clear and the problem here is that it isn't.
> >=20
> > Being more specific, from the above it is listing some commands I could
> > run, but the user is being left to work out what the difference is for
> > themselves. If I print a list like:
> >=20
> > a) poky default
> > b) gizmo config
> > c) gadget config
> >=20
> > then ask the user to select one, it is clear as the user is drawn to
> > the key information. In the above text output, you have to know where
> > to look in the commands to guess the pieces.
> >=20
> > The "/srv/work/alex" string is confusing the output and in many ways
> > even filtering that out would help reduce the "superfluous" text but
> > the issue does run deeper than that.
> >=20
> > As another example, perhaps I shouldn't need the -v to get at least
> > some summary of what each one does?
>=20
> Thanks, I'm glad this wasn't forgotten (or quietly shelved :). I kinda
> announced in my EOSS talk that there should be a nicer way for
> newcomers to set up builds than oe-init-build-env and that we're
> working on it.
>=20
> For no reason at all I was trying to avoid adding an interactive mode
> :), but prompting users to make a selection will make things a lot
> smoother. And each configuration should have a stable and sweet
> shortcut name (at least, within a specific layer checkout), so that
> awkward full paths are completely avoided. Maybe
> {template-directory-name}-{layer-name}. I.e. 'default-meta-poky' or
> 'gizmo-meta-alex'.

Just to be clear I'm not saying it needs to be interactive but that we
need to think carefully about how the information is presented so that
it is easy to understand.

You could think about using the layer name in these contexts as layers
should be defining them at this point?

Yes, getting the layer name means parsing but we can likely handle that
at this point as we're in python.

> Also, content of conf-notes.txt in oe-core/poky should be moved to the
> first-time banner in scripts/oe-setup-builddir, and the files should
> only point out that "This template sets up a default build
> configuration used by Poky reference distribution" or similar.
> Otherwise the tool will print what these files have now, which is not
> helpful.
>=20
> Should we be fine with just conf-notes.txt containing the template
> description as a freeform plaintext, or is there a use case for more
> structured template metadata?

Could/should it be a variable in layer.conf?

Cheers,

Richard





