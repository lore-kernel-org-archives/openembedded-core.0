Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009BDE88D88
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 07:27:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12518.1775287638084727474
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 00:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Evf9Tt7O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48374014a77so31839965e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 00:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775287636; x=1775892436; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tgyb1vQCughdgEKemoKUzepK5YhDPRu0Uw5tDrM2AYA=;
        b=Evf9Tt7OdvpZLq/XUtLudRFgTwo/RBh6KuXAt7G0bz97QVWkDqrUKc867YYcFHMYYH
         gp2bizFzXtXuS21JKsiIHo9/+Ir0W3+vhNuQT91rDxFeD3Kr2cUIdrbAbP3/rjFOcEd9
         EB8vBlSrFbu3NXNqDNCdNMVwYP8zzmCn/K3Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775287636; x=1775892436;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tgyb1vQCughdgEKemoKUzepK5YhDPRu0Uw5tDrM2AYA=;
        b=CrLW+/6uE2MIhApynQNHQ468I3RGM3ZK1z+y7GFOxh+4Z2JzIST1GA2UVOnA3g29rh
         dc/3R3yMeMnDS/8J+3H6vMq38nv60Tg7NTy/8nOojNbnEvnxSpIz41TwIUYMJgro8tXx
         cZG4zbcxmBk659SPR+NSqqGJXvF6vd0c8UachlNaBNR7Mty15IG3l8wxp2BrWon7h2GM
         sMysOQTeuCE4CHMBXWUecOs/934hgaCMLj1VsSEiJMbM+E1H7asnOp7j3HGB5549r22+
         AnX1pNPJnRNWn+FvGcHA4+W8nokTd3/0oa1xu6ZsU/05QW/49u+E7sPiuFs5+zJ+javM
         rA/Q==
X-Gm-Message-State: AOJu0YxWHAE1QN60gDJ9tlC3ViEwAWTSjgl68ddq2FmgBU+Lbok73735
	+PA5MdUQ7Rc7yslHURDtNs17h7qX7uF3+EVqQMRCkXch4fz4v2Kts9efTJkmO9r55cM=
X-Gm-Gg: AeBDieuRk1g8NNHtxYShVDEdy0JCCkzN3KelqhWDwXZBhbAYa81YYySFlusT2hqYc9D
	j57EzPfLWh6PB/qk2OYG/igPpSzMbAAnE0HHpR8Q7mwGZLqvH9otaJvMWL8eqBna5yvCZmYVJod
	+W0kDkHD+4uuE7cHRWN4rFKjFIF/mW2O9PMeYhutdDpqRZITBIfqAx3yEZj1VQUyc7jnoe7OXNP
	HD92gL3y1961nMSm7fkA69/chlTVzHxFAuAJn/hq3sX/fOC29Bm43sm+640ZNXw4EgHbGKtyHLZ
	UIsq2XqpyRBx+D5BeQQyA6zCapJBmF7A52HQN5B+6Pra08QkYsgFMyqx0geQ1rljWUvc+opcWBA
	RnTYTIaNFfdLd2ssp9ktqBwHFUVkePYpe2ONs7QWvXhApS5UJrVQGeuoSzjq6QY7cghzrui2bCe
	SiCdIX24mHVPfFgrIJPyz73fnIJT/QNV/jduWDmaDUfEzVxCHAtNc1DDl4xqWWvJ+09v81sjieA
	CR6iXQ4uD/gVoeoS7lcOhfTOBY=
X-Received: by 2002:a05:600c:c8f:b0:485:3cf3:1010 with SMTP id 5b1f17b1804b1-488996d23femr78088895e9.2.1775287636409;
        Sat, 04 Apr 2026 00:27:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3181:d9a0:79d5:affd? ([2001:8b0:aba:5f3c:3181:d9a0:79d5:affd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm409136585e9.0.2026.04.04.00.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 00:27:14 -0700 (PDT)
Message-ID: <c15be3d11d7381e0be75e56340dc985628ba513a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v9 4/5] wic: move canned *wks files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, Mark Hatle <mark.hatle@kernel.crashing.org>
Date: Sat, 04 Apr 2026 08:27:13 +0100
In-Reply-To: <adA94CgwRzIvBl1R@localhost.localdomain>
References: <20260403183541.2631883-1-twoerner@gmail.com>
	 <20260403183541.2631883-5-twoerner@gmail.com>
	 <59476a47af44f95f70e14869226d336e90c009a4.camel@linuxfoundation.org>
	 <adA94CgwRzIvBl1R@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 07:27:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234608

On Fri, 2026-04-03 at 18:23 -0400, Trevor Woerner wrote:
> On Fri 2026-04-03 @ 10:13:00 PM, Richard Purdie wrote:
> > On Fri, 2026-04-03 at 14:35 -0400, Trevor Woerner via lists.openembedde=
d.org wrote:
> > > When "wic create ..." is invoked with a bare *wks name (i.e. without =
the
> > > `.wks` extension), wic calls engine.py:find_canned_images() to find t=
he
> > > fully qualified *wks file. This function searches every directory for=
med by:
> > > =C2=A0=C2=A0=C2=A0 - permutating all BBLAYERS with `/wic`
> > > =C2=A0=C2=A0=C2=A0 - permutating all BBLAYERS with `/scripts/lib/wic/=
canned-wks`
> > > =C2=A0=C2=A0=C2=A0 - checking `<scripts_path>/lib/wic/canned-wks`
> > > Where `<scripts_path>` is the directory containing the wic program.
> >=20
> > It doesn't. I just looked at the code and it uses BBPATH. That can be
> > similar to BBLAYERS but it is different and the commit messages really
> > should refer to BBPATH.
>=20
> In the oe-selftest wic tests, most of the "wic create ..." commands
> are called with bare *wks files (i.e. *wks files without the `.wks`
> extension). When this happens, as "wic create..." is called, it starts
> by running the code found here:
>=20
> 	https://git.openembedded.org/openembedded-core/tree/scripts/wic#n206
>=20
> which calls:
>=20
> 	https://git.openembedded.org/openembedded-core/tree/scripts/lib/wic/engi=
ne.py#n46
>=20
> which follows the algorithm that I have described above.
>=20
> So for the oe-selftests to pass I wanted to move them.

You are right, it is using BBLAYERS. This is very confusing since the
wks files are using BBPATH, which is similar but subtly different.=20

Is there any reason it can't use BBPATH to match?

I agree the files need to move but I'd like them to end up in
meta/files/wic, not meta/wic. Whilst it complicates the migration a
little, I think it would be best to move them once and get them into
the right place.

The questions are then firstly, how to do that simply, then secondly,
how to clean up the rest of this (and when to do that).

Adding files/wic into the search path is trivial. Deprecating the
existing search paths with appropriate warnings is a bit trickier and
there is the question of when we should do that, before or after the
current release. "after" would seem more obvious, but it will mean two
different behaviours before and after release and with a standalone
tool, this does become harder.

> > I don't understand why these need to move given WKS_SEARCH_PATH remains
> > unchanged, unless wic is going to ignore WKS_SEARCH_PATH going forward?
>=20
> As an independent tool, these *wks files are rather oe-core-specific,
> so I thought they should stay with the oe-core/meta layer, the same way
> that, say, raspberry pi-specific *wks files stay in the raspberry pi
> layer.
>=20
> My first thought was to remove them from the standalone wic repository
> altogether, but then decided I could keep them as examples.
>=20
> I thought it would be dangerous to leave them in the wic source
> tree where the above algorithm could find them. If I leave them in
> src/wic/canned-wks, someone uses the tool and creates a *wks file with a
> similar name to one of the canned-wks files, but they have a typo and
> the canned one gets used instead of theirs...
>=20
> ...maybe I'm overthinking it?

It is definitely dangerous to leave them in the search paths so I agree
with that. The files do belong in OE-Core too. It is still a little
dangerous having files lying around which have the same names as the
ones in core since this kind of duplication still can confuse people
when they edit the wrong file. We have bigger issues I guess but some
renaming of the examples might help.

Cheers,

Richard



