Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A60C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 13:55:27 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.16167.1739368524166587924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 05:55:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I9r0SbqC;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f9f6a2fa8dso9364398a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 05:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739368523; x=1739973323; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JMB5KhFoTyHEsoAeGnlU4wufDl4knE7dVS34FFEOEQg=;
        b=I9r0SbqCRxxnOqoxq99wN9T+NMX2Y7WXM54FfDgNN+8opUbIhd7eFnZZ4Vq+2www+G
         HaYFUYbcKBJKXWn8+ugdRGgc2r39d5JSS0HO1hudyPJWSEHMn5+MZRYK3IJc3QpQWt8U
         a13fq1NYRc0Pm8jh2frnFyT9bapUXS+/6a7My3f4I6OWt/86gdDrvMymmW9CGxSIMK+u
         LqXHtV8ulAfyGJhAZ2Avss0ZTUm2rT/HcwUrGtCWI/ZQaI6242O1sNTGNXjioNlHy3lu
         SeCpTL5K9vQNTIOu0o1LCZbVf4y0uO1N7eqVUg29nF+rtz8oIYr05ydyJugi+GW+04sz
         tO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739368523; x=1739973323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JMB5KhFoTyHEsoAeGnlU4wufDl4knE7dVS34FFEOEQg=;
        b=r0tUSB/nEVK0Pipb+krEe8NTLxfGsZiAO6XsOmB/lNfcXrxwJgMvFo7YFDxMu9FKOf
         UuLqBknUzO0icyE4/eBMSl82Gc/BlqsFSzv7VQG/eN2/cHJ8eEe5BAsMOhU8vis13jfs
         6fEz+rNh1bw8wLkW8iEwrIA8zBmBEaSMqCG/0kIs4eNqGkWoNlFZsHTvzS+eTZoGj83l
         rS2w+p/hDCatAf1PHPrmJz59vjnPeDF6l8zrHRueZPnfYkeEtDoBU39oWLCYU8J5C72Z
         Db5efkXDFY0BG4n7q4yeds2UruU0VVLrEco9Z6SsOP2zbjfVl+marwQTjstuF5rvOazH
         w7Aw==
X-Gm-Message-State: AOJu0YyBgEcHMfuiMBnZdg7w/f3NtVd8zAftAz69NcqcSqkXdCv/xYjG
	f5FtLfCtwPmMRIHfHwzMH3u4Y3xJHIbq9OWzp/C4wwMg2iT/bd7vp0LMCuaz/hrXyj6swtjTXn7
	UFbRdg6XcQweqXbshcn8lwTzo9tE=
X-Gm-Gg: ASbGncsUJ2zHpDdBvT6OuLNZfAelYyeaC/24FqaXigF9r2LgII1O4fdOxUfTUZi/OYw
	2k+UerD1Jp3ACOuxpBFtpBKHQbwytetRnQVXNI0NgoSdBJ8MKqh5UXkhUQXeL8S5VVtrsSV6nfw
	==
X-Google-Smtp-Source: AGHT+IFYb41K4TqHjh+m2baU/xCrzqzjC0EDerbTO/+StBh1ee9rAa9E3O9x5q7a4toumAyoQYv7BNGROaRkm+NFgE8=
X-Received: by 2002:a17:90b:2541:b0:2ee:d024:e4e2 with SMTP id
 98e67ed59e1d1-2fbf5bb93a4mr5149833a91.7.1739368522573; Wed, 12 Feb 2025
 05:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-16-stefan.herbrechtsmeier-oss@weidmueller.com>
 <Z6vQDT6LkF9JMQ+S@gmail.com> <1c055ff2-cf06-4e21-8c8a-a4f09d037d5f@weidmueller.com>
In-Reply-To: <1c055ff2-cf06-4e21-8c8a-a4f09d037d5f@weidmueller.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Feb 2025 08:55:11 -0500
X-Gm-Features: AWEUYZm2gYLepdSUKHnYvpETG89Q2i-5jg0gON8nLkLgZJLBIvJbKtXus5fRf6o
Message-ID: <CADkTA4P31j6diWt_Qa5BjYksQktMGxRhy4KgdX_imdkf0vrY0w@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 15/30] classes: add early fetch, unpack and
 patch support
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000ebefb2062df24ab1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 13:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211232

--000000000000ebefb2062df24ab1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 7:42=E2=80=AFAM Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

>
> Am 11.02.2025 um 23:32 schrieb Bruce Ashfield via lists.openembedded.org:
>
> In message: [OE-core] [RFC PATCH 15/30] classes: add early fetch, unpack =
and patch support
> on 11/02/2025 Stefan Herbrechtsmeier via lists.openembedded.org wrote:
>
>
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com> <st=
efan.herbrechtsmeier@weidmueller.com>
>
> Add support for early fetch, unpack and patches task which run before
> normal patch task. This feature is useful to fetch additional
> dependencies based on a patched source before the normal unpack and
> patch tasks. The patch are marked as early via an early=3D1 parameter. An
> example use case is a patch for a package manager lock file (Cargo.lock,
> go.sum, package-lock.json).
>
> I understand why you need to do the above, but there's now multiple
> fetch and patch tasks running throughout the pipeline of the
> build and that's just more complexity to maintain.
>
> The tasks call the same functions and the difference is really low. The
> early task simple use a filtered list of the SRC_URI. At the moment the
> gitsm fetcher is doing the same but without a possibility to patch a
> dependency.
>
> This is what I was asking about in some of my first replies
> to the RFC series. When I've done this in the past, I'd just
> suggest something simpler like the recipe provide a complete
> "lock file" in the layer/recipe-space and have it overlayed
> in the source.
>
> This was already supported by my first patch series. The disadvantage is =
a
> lot of noise during each update.
>
> Of course that means it is in the same fetch task as what
> will be fetching the vendor bits, but coordinating within
> the single task is simpler in my experience (and it can
> be checked on the SRC_URI). I haven't fully thought through
> how to manage it, but wanted to reply to this while it was
> fresh in my mind.
>
> It is simpler because you manual fetch the lock file, remove the
> possibility to patch the file and skip the unpack. But you still need a
> manual fetch, unpack and maybe patch the source and copy the file into th=
e
> meta layer.
>

That's a completely different type of complexity. Richard and I are only
talking
about the complexity after "bitbake <foo>" has been called.

>
> It is also possibility to integrate the early and resolve task into fetch
> task but I'm unsure if this simplify the complexity.
>

Having direct calls to additional routines via conditional is less complex
than
tasks (dealing with timing, scheduling, code maintenance, etc), so that is
preferable from at least my point of view.

Bruce




--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ebefb2062df24ab1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 12, 2025 at 7:42=
=E2=80=AFAM Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsm=
eier-oss@weidmueller.com">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <p><br>
    </p>
    <div>Am 11.02.2025 um 23:32 schrieb Bruce
      Ashfield via <a href=3D"http://lists.openembedded.org" target=3D"_bla=
nk">lists.openembedded.org</a>:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>In message: [OE-core] [RFC PATCH 15/30] classes: add early fetch=
, unpack and patch support
on 11/02/2025 Stefan Herbrechtsmeier via <a href=3D"http://lists.openembedd=
ed.org" target=3D"_blank">lists.openembedded.org</a> wrote:

</pre>
      <blockquote type=3D"cite">
        <pre>From: Stefan Herbrechtsmeier <a href=3D"mailto:stefan.herbrech=
tsmeier@weidmueller.com" target=3D"_blank">&lt;stefan.herbrechtsmeier@weidm=
ueller.com&gt;</a>

Add support for early fetch, unpack and patches task which run before
normal patch task. This feature is useful to fetch additional
dependencies based on a patched source before the normal unpack and
patch tasks. The patch are marked as early via an early=3D1 parameter. An
example use case is a patch for a package manager lock file (Cargo.lock,
go.sum, package-lock.json).
</pre>
      </blockquote>
      <pre>I understand why you need to do the above, but there&#39;s now m=
ultiple
fetch and patch tasks running throughout the pipeline of the
build and that&#39;s just more complexity to maintain.
</pre>
    </blockquote>
    <p>The tasks call the same functions and the difference is really
      low. The early task simple use a filtered list of the SRC_URI. At
      the moment the gitsm fetcher is doing the same but without a
      possibility to patch a dependency.<br>
      <br>
    </p>
    <blockquote type=3D"cite">
      <pre>This is what I was asking about in some of my first replies
to the RFC series. When I&#39;ve done this in the past, I&#39;d just
suggest something simpler like the recipe provide a complete
&quot;lock file&quot; in the layer/recipe-space and have it overlayed
in the source.
</pre>
    </blockquote>
    <p>This was already supported by my first patch series. The
      disadvantage is a lot of noise during each update.<br>
      <br>
    </p>
    <blockquote type=3D"cite">
      <pre>Of course that means it is in the same fetch task as what
will be fetching the vendor bits, but coordinating within
the single task is simpler in my experience (and it can
be checked on the SRC_URI). I haven&#39;t fully thought through
how to manage it, but wanted to reply to this while it was
fresh in my mind.</pre>
    </blockquote>
    <p>It is simpler because you manual fetch the lock file, remove the
      possibility to patch the file and skip the unpack. But you still
      need a manual fetch, unpack and maybe patch the source and copy
      the file into the meta layer.<br></p></div></blockquote><div><br></di=
v><div class=3D"gmail_default">That&#39;s a completely different type of co=
mplexity. Richard and I are only talking</div><div>about the complexity aft=
er &quot;bitbake &lt;foo&gt;&quot; has been called.=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div><p>
      <br>
      It is also possibility to integrate the early and resolve task
      into fetch task but I&#39;m unsure if this simplify the complexity.<b=
r></p></div></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Having direct calls to additional routines via con=
ditional is less complex than</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">tasks (dealing with timing, scheduling, code maintenance, et=
c), so that is</div><div class=3D"gmail_default" style=3D"font-size:small">=
preferable from at least my point of view.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Bruce</div><br></div><div><br></div></div><div><br clear=
=3D"all"></div><div><br></div><span class=3D"gmail_signature_prefix">-- </s=
pan><br><div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follow =
the NULL pointer, for chaos and madness await thee at its end<br>- &quot;Us=
e the force Harry&quot; - Gandalf, Star Trek II<br><br></div></div>

--000000000000ebefb2062df24ab1--

