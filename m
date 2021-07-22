Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.7262.1626958813226501926
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 06:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OPPAsBTr;
 spf=pass (domain: linaro.org, ip: 209.85.218.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f42.google.com with SMTP id bu12so8333441ejb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2uv/PccrrgGtlHb8ie/Terzt/foawW7y727NYZl1FVs=;
        b=OPPAsBTr5uhHO0MpOl7jTHJtOyNvawK7Tm5wYHG4AU1+N7z7wJKRBZJDir4fvWmSZY
         U/NVdWNywu8axll9wXAIgiTXuVB5vYJrnAJP42+9+AfcPC9D6E1vow52+5bfNG/DOPDw
         mARok/DeuwQ65862YWk+MdiaQ9kuXXUBmS2VIhLmzjOBRs0ml4uPNcGViM1NjoxdmH0A
         hL2MJykM7JJ4ZIFSJOP/pCxjd92GTYac5OtflZJcvOZgOVPov4ZC/om8DPnSuTytGbO5
         ob1bILL1PsRrtbfPjingXWmk5OMtJ33M/plui527cy7eHmo3QFyCilAym7L0wsuHk0qH
         HwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2uv/PccrrgGtlHb8ie/Terzt/foawW7y727NYZl1FVs=;
        b=K5y8rLk+xpE8BzVIF+H1JYRaAgefvB3FVuHjh95MM9pvOk/9lU2EVU/6CMRELbZbpj
         LLQNSDwY6c92MEDxopJvkBX1Blm/vnXEMU1fFir3htZ55ME97R/SefEYm/KAg1pkHQBE
         aPEg7BwUJyfAGOueBiy8OzcxYwDsDyYOg1Gd/lY1yrdcBv1VFRShU710SBY4qhJkFMCY
         85X1IE/SaOFDCoGBCGpu6wmYsspBYylR4kUt6Ir8aYkY+YW6jknWmQvOVBmCFeRfis0V
         tRbMbr66wvFEZ/6OOVt6F3SY3hAjHF+fSe6YX6roOBHciwU/vXFMzjRMuuQixhc0holR
         eiDg==
X-Gm-Message-State: AOAM532BXqiNpHajrQ9SyktfToA0cCYPAs8bEzEOONmZ1iClI4Awx3zO
	YpWoYZDsfDV6OiRCD6Ao73YbWIHZm4dcqcAsQT/47Q==
X-Google-Smtp-Source: ABdhPJwLJZoNuSz5OBHqoSryelh/R/R6H812MbuKfTN7FJRmxXrEtnpKAjjEA0I57P0PT6i47bo0umX6kELqOPPQ5i4=
X-Received: by 2002:a17:906:c110:: with SMTP id do16mr7880442ejc.347.1626958810819;
 Thu, 22 Jul 2021 06:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org> <103451053486f29a5fee270e987f9016f5572467.camel@linuxfoundation.org>
In-Reply-To: <103451053486f29a5fee270e987f9016f5572467.camel@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 22 Jul 2021 15:00:00 +0200
Message-ID: <CAP71Wjzo4wWGdKp=PJWhRFBEgq1E1hdPvZokfpdGfhaL-RC_8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] yocto-check-layer: add support to check for dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fc193b05c7b5dd7f"

--000000000000fc193b05c7b5dd7f
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 22, 2021 at 2:51 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2021-07-22 at 14:46 +0200, Nicolas Dechesne wrote:
> > It has been recentely mentioned to me by the YP TSC that a layer must
> > not only pass the yocto-check-layer script, but also all its
> > dependencies. These patches add support for testing dependencies
> > automatically.
> >
> > Patch #1 and #3 are not much related, but improvements I made along
> > the lines.
> >
> > Patch #2 split the internal function into 2 parts, so that we can get
> > the list of dependencies from the main script.
> >
> > Patch #4 is where the processing of the dependencies is done. I chose
> > to enable checking the dependencies by default, and use
> > '--no-auto-dependency' to disable it, we could decide the other way
> > around. For any dependency of the 'layers under test' we will simply
> > add them to the list of layers to test unless they are already there.
>
> I'm fine with the changes, thanks for doing it. I think we'll need to add
> this option to the yocto-autobuilder-helper config.json entries else
> the current testing will take much longer. We're safe there to
> assume that dependencies are tested separately.
>

Right. This is a good point. Let's review the patches first and make sure
they work well! I really prefer if it's enabled by default, so that it's
more obvious to layers' maintainers if/when there is a problem.


>
> Cheers,
>
> Richard
>
>

--000000000000fc193b05c7b5dd7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 22, 2021 at 2:51 PM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Thu, 2021-07-22 at 14:46 +0200, Nicolas Deche=
sne wrote:<br>
&gt; It has been recentely mentioned to me by the YP TSC that a layer must<=
br>
&gt; not only pass the yocto-check-layer script, but also all its<br>
&gt; dependencies. These patches add support for testing dependencies<br>
&gt; automatically.<br>
&gt; <br>
&gt; Patch #1 and #3 are not much related, but improvements I made along<br=
>
&gt; the lines. <br>
&gt; <br>
&gt; Patch #2 split the internal function into 2 parts, so that we can get<=
br>
&gt; the list of dependencies from the main script. <br>
&gt; <br>
&gt; Patch #4 is where the processing of the dependencies is done. I chose<=
br>
&gt; to enable checking the dependencies by default, and use<br>
&gt; &#39;--no-auto-dependency&#39; to disable it, we could decide the othe=
r way<br>
&gt; around. For any dependency of the &#39;layers under test&#39; we will =
simply<br>
&gt; add them to the list of layers to test unless they are already there.<=
br>
<br>
I&#39;m fine with the changes, thanks for doing it. I think we&#39;ll need =
to add<br>
this option to the yocto-autobuilder-helper config.json entries else<br>
the current testing will take much longer. We&#39;re safe there to<br>
assume that dependencies are tested separately.<br></blockquote><div><br></=
div><div>Right. This is a good point. Let&#39;s review the patches first an=
d make sure they work well! I really prefer if it&#39;s enabled by default,=
 so that it&#39;s more obvious to layers&#39; maintainers if/when there is =
a problem.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000fc193b05c7b5dd7f--
