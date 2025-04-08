Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094D7C369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 09:39:09 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.70941.1744105140138722019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 02:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LyFPR6pz;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30db2c2c609so55528131fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 02:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105138; x=1744709938; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdtYnjBxgelAkYuAqd2O91+L0vm91BTqKrjp4yjrtRE=;
        b=LyFPR6pzPE1KqSVib/GC9lWqf8uUne3+LmX2NR9RSy0755kAOhFApWXaoC/887q8zH
         Y5J3VGz07y+OSCi4CGx27evS9bB5Ts6LU61e4o2QKZ6TucWpTH7oDYTnL6WkSk+1B9W1
         H2A4Ll1ER2vXSlRdfCqcHlXtPq3YojSUjC6/9s69YtcZLmhfEy50rfh9JBeVDGs/XrXO
         pnMPziVGIkup+95jz5/3U9+iPcfAFQ+pCKZ6voapEFWBLiOV7dsyeq1/FnPx3siD5MSL
         buWG7+Il+3DEZeeSB8q81OYBlLUwOvb5vlcdJ5we4B0lgDvf0JNN6hxT55mo8rSuM3kd
         Q1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105138; x=1744709938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdtYnjBxgelAkYuAqd2O91+L0vm91BTqKrjp4yjrtRE=;
        b=OMT/rjbCwiSkmxFzGJdeJc1gR8+IU/nRcl7RT/rNZzRig9kzhv3oDy6Dad6chEzdur
         r39W8WTJ+UdtibRd4lvzI+qu5q1XeXrUt8gsG1nUmc99gz+vKdQOM2+oEXvwerR+aulC
         Fv+s4WtbQG1K80YYdzA/SxTySOwKY8r13DcJMDHbQgZ1PY9FZ7RMYn/P32Xy8h1VzoMu
         DU8ADHWd9c7gMEeenjucJDjsV9KWtEE2k4Qp/4N331nUfYp8la4TDpZFX0hFA0JssSd3
         QIRiAIrsNVjhpMOFDO7NO7b+l8FIBLDzN4cRw8yPsPSagHGdhF+AG8cGfeyY5FFPH8cu
         YxjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0MLVG7LsWRc/Eb/g0UTvIYSghQ14dwv4eKPk6rYMRRAHO7JOm3kd1setmUWNlyVw5hCuezhTwsntnKK8SwkAt8g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxr9OmvxyEAYo+CFBRgiecwjVohbZ0SC8KuV52B26OSwv4+0hvG
	vICp5d/jZynov4yowAwDxHHgP7o5FsZFpFzSPeyYD9UiYmMm1yu6gNv1Q6161qlNqTATgM9lQYm
	I5lv5Mqe/O4GGWjpvXf3Ls3TXRYs=
X-Gm-Gg: ASbGncshNvxjcgps820R0iHhyyx1kEfaFu374p1Fv6jDnD+dWwMND3vowQXAoqDiNTj
	1D/0txbfObKeYt6YQFq9kkafbZ96PUi1YBH0VkM3HDBfdtrFSRKbxtk4wHxlLZ4/PXhnA0MOzdH
	0SzkJNiIUCmTmW9e50ljBJVKLlwPlP4G8A9+s6R3gmn1FE3APj1J2sycs=
X-Google-Smtp-Source: AGHT+IFBVIsLWB1940OPEBARS3iEO+E9Vhw+8d0sT4U+fuPKe2Si4iJ7ZvuVKE/TnpUisuT8MMJrN9yaL8ux9b52M2o=
X-Received: by 2002:a2e:ab0b:0:b0:30c:719:1145 with SMTP id
 38308e7fff4ca-30f0a12e65cmr49433701fa.17.1744105138041; Tue, 08 Apr 2025
 02:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com> <20250402-connman-v1-4-2e4fbbb7caf9@gmail.com>
 <ebfc8f615d694ab3f0c060ed8d3b5c63b88cb7c8.camel@linuxfoundation.org>
 <CAO5Uq5T3xN9s5J4EqcQ5+SxmGf-pFWY-w9xrcmufbCNWxuM=1Q@mail.gmail.com> <038C7174-D53A-4C2B-AEAE-04F61B93A8C8@arm.com>
In-Reply-To: <038C7174-D53A-4C2B-AEAE-04F61B93A8C8@arm.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 8 Apr 2025 10:38:46 +0100
X-Gm-Features: ATxdqUHfQzv6NQFquxthiFFIMbZ29ePn5CZI63_CD1bOj4KRxj3EQprfOPSrETQ
Message-ID: <CAO5Uq5Qp6z+-NKpMhijY=W+q0WVX38fvWMZ+jYdxKg3MQCXaHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH OE-Core 4/5] connman: Add all build options as PACKAGECONFIG
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 09:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214521

On Fri, Apr 4, 2025 at 1:03=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 2 Apr 2025, at 21:08, Alex Kiernan via lists.openembedded.org <alex.ki=
ernan=3Dgmail.com@lists.openembedded.org> wrote:
> > Argh... thank you. Of course I generated almost the entire list from
> > sed/awk across the configure.ac (and then walked through the deps),
> > but not iptables/nftables :| Will get an update out in the morning.
>
> This answers a question I was going to ask.
>
> Each option we expose is another combination that is ideally tested, but =
is explicitly supported.  Do we really need to expose _every_ option that c=
onnman has?  I much prefer exposing a limited set of options that make sens=
e, over flooding the recipe with every option possible.
>

I guess I like the list everything, because that way you get all the
--disable options explicitly stated and nothing floating. But I don't
think that applies to anything in connman (other than the missing
iptables stuff to autoconf which already got picked up). But I also
get the implicit suggestion that if it's listed, it's supported/tested
- is the right answer really to list all the --disables in
EXTRA_OECONF? Though again, I don't think it's relevant here (there
are yet more options which I didn't expose - you can pass
--enable-...=3Dbuiltin to the plugins to embed them).

Certainly feels like dropping the last two patches is the consensus here.

--=20
Alex Kiernan

