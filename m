Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83A5E9A051
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 16:48:35 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18582.1771519709696448302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 08:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OfJLXJN6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-480706554beso13248745e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 08:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771519708; x=1772124508; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pKqocHQESWMbIPDBmfrR3+bZ1lu2YwWEG3E+9uUlrw=;
        b=OfJLXJN6LOUmOkW41Ge8EdTJrsLVqBc2nXwdxwm0QDZ8rpmlNGO0qb/vecEUdyt+7J
         eOySqVIq0CPou2lWcIi3+U6lnWJErn1uvCKbaePVKxKYaNXyuFva1SnItX44V7zKMck/
         quwJG/593X0RNryzL3ItM/emcgFmm6eVOgZVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771519708; x=1772124508;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4pKqocHQESWMbIPDBmfrR3+bZ1lu2YwWEG3E+9uUlrw=;
        b=hcdF00KXnAVIZpBUahmbjkShXRP2nEb4x4J9B3/rXPvq9PeQMb2pXF/cqIn9N8r0eM
         /IuL/mATZGz9QW7E52elursgsd9uZNi7U+2tffQi8Fm+Ar4dwx5T2ocwuNaQtn7gM1Sm
         yiWr4PEE1GdbJie+AmblVt6h7MvzbJ7lKQ+/tvw9K2fzSwOmtvUSW8CK6y8xrPNt6CpZ
         SvTrUaVlWJBVoR341oajZZBdqnH1SDZc33fBjZVJWR8D4LsGSMPRq72FiRJri6W8WYyc
         InahZGZ3odUzyhc8R5pWaVAAWdL+UlpSNPYNBO0CFdXesIw71+r5/UC7HwHkXnXfGjo7
         rSYw==
X-Forwarded-Encrypted: i=1; AJvYcCXW8Gr74ipvOvot8OPzAeCSbw0W3huixX5eLss4P1QS9iddUa5hdCgE+8UyVBLBhejiQGA1DlqNP25IBCesmAe9rw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwWlZg3OFRj3UYYvsCWRgWDuk+ui9RLGKvy2Ya2CxDH7xzS5+ns
	ZYNw5mHlsbBwc0dsmlwnX/mU5ZcotSqcTaDyL436CulIsSD0uayOWTbFi+Og2pYu8W0=
X-Gm-Gg: AZuq6aIOJfaxMbVz6VFLcpseecf6W3ISUIVRjCWQNsWv3S9vpocK+vQSYkTwyUw+8jx
	wPE4+8iTTGkKpwBiTS6zo3nqFVrhtrkmPagE+SRth3w9cVFvSfvj0jHd8oMqaO0p1y4xxnxvnNx
	ahkzdiQOvzYl0zLBPjXrDjRiUlBji8Np+yp9Rm2fT5uLkqfTWqKr9cRwRfxvMXEWT0BuTqfY6pS
	GzHb2ShmWHLy8LoFwaCkQ0nRbS0PNjVv9YGyujAWCaIz/0YQnku5uPHe7nvuML11YiF6C8KiS2i
	Wjxpak9uEqDVkmJji1FrKzsdK95QW5a2u1dJ+7ExJ701gnln9cKx60NdJnuXqPg6QCx4kyctzgY
	bU1WEFYrDAhqWPRLe5AjBPYmoWMx8DQt+8NkYSrK2eTmVRLFCzF9ruU073Az+5ObrfGhceyIoHq
	zGztKPNDBH6cq67ALx1f+4Dl2S16w4p9e+Yco51OeCZeoaY6AyIhOAtaqMd7wZeEVJreAotGN8y
	CauM5AUVIVBis4=
X-Received: by 2002:a05:600c:6309:b0:479:2a3c:f31a with SMTP id 5b1f17b1804b1-48379b93364mr298982625e9.1.1771519707985;
        Thu, 19 Feb 2026 08:48:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:da95:be37:6ded:ea39? ([2001:8b0:aba:5f3c:da95:be37:6ded:ea39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6a5e5sm47373909f8f.9.2026.02.19.08.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:48:27 -0800 (PST)
Message-ID: <a596849c8996fc137330ec6940cc993c44e2d9df.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][RESEND] sstate.bbclass: Always show a
 progress bar if an sstate summary is wanted
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2026 16:48:26 +0000
In-Reply-To: <20260219162117.2565725-1-pkj@axis.com>
References: <20260219162117.2565725-1-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 16:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231435

On Thu, 2026-02-19 at 17:21 +0100, Peter Kjellerstedt via lists.openembedde=
d.org wrote:
> In case sstate_checkhashes() is expected to show an sstate summary, then
> always show the process progress bar regardless of how long the task
> list is. Without this, the sstate summary could unintentionally
> overwrite another active progress bar.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> =C2=A0meta/classes-global/sstate.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sst=
ate.bbclass
> index 2fd29d7323..6f72490065 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -1048,7 +1048,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,=
 currentcount=3D0, summary=3DTrue,
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
## thread-safe counter
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
cnt_tasks_done =3D itertools.count(start =3D 1)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 progr=
ess =3D len(tasklist) >=3D 100
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 progr=
ess =3D summary or len(tasklist) >=3D 100
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if progress:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 msg =3D "Checking sstate mirror object availabilit=
y"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 bb.event.fire(bb.event.ProcessStarted(msg, len(tas=
klist)), d)

This has sat in the review queue for a while since I haven't found the
time to reply. I suspect you're going to disagree with me and I really
haven't had the time to have a discussion on it.

For reference, whilst the patch was removed from master-next, it is
still in the review queue here:

https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dmaster-back=
log

(and mentioned in the status report about review call changes)

Since you're now forcing me to reply about this, I'm confused by what
"unintentionally overwrite" means in the commit message since it would
seemingly only do that if it shows progress and you're making it always
show progress. That would be in theory worse, but consistent.

The intent behind the "100" limit was to only show the progress bar if
there is a decent chunk of work to be done, rather than flash it onto
the screen then off again. I think that reasoning is still valid,
showing progress bars for things which happen more quickly than the
progress is useful for is a bit pointless.

So at the very least we need to be clear what the commit message means
but I'm not keen on the removal of the 100 limit.

There were other fixes around the progress bar handling and I am also
wondering if this issue was still relevant too.

Cheers,

Richard




