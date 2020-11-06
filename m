Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web10.6444.1604629964235598727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 18:32:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XcI3B/b2;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id t8so1943692vsr.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 18:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pEV44pMZ2MTcQBHODm+FcMojxoRjbp+GSNZvwiSvPYk=;
        b=XcI3B/b2BkSu8RQtj/hqYekRf5ODX7QLYzyUk+FwTF0/l7wAajb1aN6K1JOssUfg7C
         bS6ZCG1iRu625G4qs3mW5fd+oPl9aG4b0g2gFZqDXo5aRQodQxf7kto8OVvecqnJkwct
         GUuiint3aDxQEqDu8DgG3HJtXSinezpLeikpX5KqcgYE60jJMi68/wvb7zrDMGDnnpOa
         0LgWEPKRgtXriAkQeNPaM1Hq+F3aYLK49we2x3jBK8Pdi6DgwVncuwM1LwLEpuVS/p74
         46sCaZG0fEH3SlbQ6sDR6O5nXkIF8Cs8AI+XkGp5DKKnI0nFLNmvAigN0fx2zD502eB7
         pgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pEV44pMZ2MTcQBHODm+FcMojxoRjbp+GSNZvwiSvPYk=;
        b=TNJUIU5hhK9OYxIRDBgfaKi15YHGFSEqQQtbb4Wd/URHv/gXHVpj52Y+k3ijGkR/kM
         n1zvAIuCwcl0Il9PhoS8hbCo3/+NVtF9JpRcsSh7OcpkXZZ8bNp8oVYyIi6TI263ajvq
         p/r6+AveTBCEVOV95CDJGS4GuqHS8gn7ZhLFTYyoq39j0pxq8ZmJtu4Ccmg3nbnTEpIa
         4i9rs0SY6vgO28iC7g104wbRpKgk6+v5AutXLch18C96CwGpVza4O+TSa6+fBlGFSrHD
         C9vGDImIPhJB8m4a1yS5H359o3TCQk6FBv2eG64A4It6iJQ7ZeX42Uf3NJlxStUG4ZP+
         K76A==
X-Gm-Message-State: AOAM531JKOVT+37Q/5WcVslegXsgINOS8aAWIyeMF/58NOw16FtoybEB
	wUrfzETzkWiWVJhOWOTXRAQ3vL6Yjnck8AVhYXI=
X-Google-Smtp-Source: ABdhPJwNWwsS9GCmGRjFcbVqH4D0yB2JL9G8y0trFuOTMXuK4W7caymJmNsuZ8paQyrNAqWHuEW8XCu6/Dhclz1tnys=
X-Received: by 2002:a67:774c:: with SMTP id s73mr3657448vsc.1.1604629963207;
 Thu, 05 Nov 2020 18:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20201104121217.4013924-1-ross.burton@arm.com> <20201104121217.4013924-3-ross.burton@arm.com>
 <CAJ86T=VuUjZzWwetPZsQYmFMDDJ9VtDqfqP9mbGGx024ktfzoQ@mail.gmail.com> <71c52cf8f79485db66584f8ce85abee7ba3e5c54.camel@linuxfoundation.org>
In-Reply-To: <71c52cf8f79485db66584f8ce85abee7ba3e5c54.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 5 Nov 2020 18:32:32 -0800
Message-ID: <CAJ86T=WNRG0yhBU0APeJ9RxBjmZaztLcQ2p2B4r1sH8hRBZdLw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] setuptools3: use DEPENDS_append instead of +=
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross@burtonini.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 5, 2020 at 3:30 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-11-04 at 11:48 -0800, Andre McCurdy wrote:
> > On Wed, Nov 4, 2020 at 4:12 AM Ross Burton <ross@burtonini.com>
> > wrote:
> > > To help people who inherit setuptools3 and then assign DEPENDS with
> > > =.
> >
> > It looks like there are other classes which could benefit from a
> > similar fix. Maybe it's good to try to standardise and update all of
> > them?
>
> This is kind of like a virus which spreads through the system. If you
> set DEPENDS after an inherit in a recipe it should be "+=".

That's fine too, especially if these kinds of guidelines are both
documented and enforced. We used to have a style guide which covered
this kind of thing, but since it's not enforced it's now mostly
ignored...

> I'd much
> rather classes just did += too and we save appends and so on for where
> they're really needed as they're hard to override.
>
> The alternative is to iterate over the system changing more and more +=
> -> append and end up making += pointless :/.
>
> Cheers,
>
> Richard
>
>
>
