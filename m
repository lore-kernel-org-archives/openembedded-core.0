Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.21642.1627636132684172820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 02:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uuzJRN40;
 spf=pass (domain: linaro.org, ip: 209.85.218.53, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f53.google.com with SMTP id x11so14636691ejj.8
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 02:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4lq5nxHC/XcCCAUuoEjbp1QoM4DexO3Nsm9xv3V8vI0=;
        b=uuzJRN40wW5nixSVa0x4UbuVqsKHAENry0Fs33DNZYK9FXATBhrGYSlUnE8LcqHPLw
         6LRVlpsQsy5rs4sh51dLO7LaR+kR66ckCdCD1hKF0mzitdb1dzZ+x4Ny3ABNh9XVELs5
         j5AAGeK7RJOuLRtMqdGFpMDaf4erQUP/GDC7HBtezVtLA0N21NqHg0EJ5LQ2GfdNifjm
         9EP0TNFZOaFpWXPTCEu+wJGGJBH5UDIjFtUJmRL9R2+559tHh2qNpaUP4puIBUXEc/cz
         XbLSlgVJHu/bXQRzeOOFyOtIbWZYfapKth6YMf6tiyhp16lmJ4b8C/8/7K4dFNxSNYUE
         RsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4lq5nxHC/XcCCAUuoEjbp1QoM4DexO3Nsm9xv3V8vI0=;
        b=ORV1OthlHN+opbpDL/DgmkCa9ZNQe0FkUO82upa2jFGDCZyKEW9cHjfX65FOCjUHOa
         l7v227BK2UT49ClJNyQQJmuie0F5pysEqXnfvuwGYuw9uV/mKh511qJuGF+zxgFbDRpb
         W6zGQGHsgFoLyqDba3vESWl33lVoxYwzECqKF7SRCTDDX0UQ2fobDoEf0x6PWzvtlL+9
         kmRf9+KDW0LbLw6SKrOF6JgM5lWY2EkjInAh2rxv5gXsNXDPcbnG1wJ8fKoXdWoX35+g
         plgKWyXixHbBDR1YvHuvfB+b+WgDKRoMUp/LZEeZpSRQbllY//nHYNOHMkV9SOLus+eC
         2QWQ==
X-Gm-Message-State: AOAM5301Hy7aE5KFapon0JDoezC3YmLWCOjXiOmdTIPgC0yM5xHGxFMF
	PSArxhyP0bP1DST/HsG6aUm7Lo6NCSVjGqTEoSagcQ==
X-Google-Smtp-Source: ABdhPJxk5DcTbp5ews2F3leE1yZJ5sDatsy2XaaN80T4bJ15VuynRoFv+VD/udtuPO3cLxCiSe6s8Va24x+ys9nbGJE=
X-Received: by 2002:a17:906:3019:: with SMTP id 25mr1574560ejz.91.1627636130988;
 Fri, 30 Jul 2021 02:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org> <33b5d60e01b3995046709b17b8014fd45b0c48e5.camel@linuxfoundation.org>
In-Reply-To: <33b5d60e01b3995046709b17b8014fd45b0c48e5.camel@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 30 Jul 2021 11:08:40 +0200
Message-ID: <CAP71WjxcSk64Snj8Hd0Vy9nJyUH8mE9MjnkfAZC095mPt9bd6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] yocto-check-layer: add support to check for dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: multipart/alternative; boundary="00000000000069616a05c8539123"

--00000000000069616a05c8539123
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 30, 2021 at 10:03 AM Richard Purdie <
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
> >
> > Here is a sample output with these changes:
> >
> > $ yocto-check-layer /work/oe/sources/meta-aws \
> >                     --dependency /work/oe/sources/meta-openembedded/
> >
> > INFO: Summary of results:
> > INFO:
> > INFO: meta-aws ... PASS
> > INFO: meta-python ... PASS
> > INFO: meta-oe ... PASS
> > INFO: meta-networking ... PASS
>
> We merged this but have started seeing:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/166
>
> which seems a little strange and is probably related to this series.
>

yes, it's related.

...
INFO: Adding meta-poky to the list of layers to test, as a dependency
...
INFO: meta-poky ... SKIPPED (Layer under test should not present in
BBLAYERS)

With these changes, we are now adding all dependencies and trying to test
them too. But meta-poky seems to be in bblayers.conf, and yocto-check-layer
won't work since it needs to compute all checksum *without* the layer in
the config first.

It is probably a good idea to make sure bblayers only has oe-core when we
try to perform YP compat. Alternatively, as discussed, we
use --no-auto-dependency on AB..


>
> Cheers,
>
> Richard
>
>
>

--00000000000069616a05c8539123
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 10:03 AM Rich=
ard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richar=
d.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Thu, 2021-07-22 at 14:46 +0200, Nicolas Dech=
esne wrote:<br>
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
&gt; <br>
&gt; Here is a sample output with these changes:<br>
&gt; <br>
&gt; $ yocto-check-layer /work/oe/sources/meta-aws \ <br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--dependency /work/oe/so=
urces/meta-openembedded/ <br>
&gt; <br>
&gt; INFO: Summary of results:<br>
&gt; INFO:<br>
&gt; INFO: meta-aws ... PASS<br>
&gt; INFO: meta-python ... PASS<br>
&gt; INFO: meta-oe ... PASS<br>
&gt; INFO: meta-networking ... PASS<br>
<br>
We merged this but have started seeing:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/121/buil=
ds/166" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/121/builds/166</a><br>
<br>
which seems a little strange and is probably related to this series.<br></b=
lockquote><div><br></div><div>yes, it&#39;s related.</div><div><br></div><d=
iv>...</div><div>INFO: Adding meta-poky to the list of layers to test, as a=
 dependency<br></div><div>...</div>INFO: meta-poky ... SKIPPED (Layer under=
 test should not present in BBLAYERS)</div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">With these changes, we are now adding all d=
ependencies and trying to test them too. But meta-poky seems to be in bblay=
ers.conf, and yocto-check-layer won&#39;t work since it needs to compute al=
l checksum *without* the layer in the config first.=C2=A0</div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">It is probably a good=
 idea to make sure bblayers only has oe-core when we try to perform YP comp=
at. Alternatively, as discussed, we use=C2=A0--no-auto-dependency on AB..=
=C2=A0<br><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div>

--00000000000069616a05c8539123--
