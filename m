Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.15472.1629900025205467310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 07:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ejGbNC50;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id lc21so19422361ejc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=C0Pwt7HdLAmAGR3l0AqEAbclnN/LVCOeDqDKT+0tJ6Y=;
        b=ejGbNC506gnePxDgU2rNUE422eJ3eWdhJunKx7hOzJRv4BG+W6A36WVKD4TQ3xEsSx
         L1Jta/119XdCBs1QDKNvMLNbvOhE/BwHqa6y0u5DbmDt/u7UmSXhbjbCxaScY8DeBFxL
         GQHO9/nKmrlHL2eBIuFloEvl3ADbAe2pek6DcQNw2SgVZ0C9QKzsU2dsp08R9SI+2T59
         PGBfZzs9Rm4WmbYMeYYygCvIxqMfsLNfK/AZnS8SlfLje/KEyyQDBSf/QscbSjwQ/u2R
         FtgET1oGjX4+Fe2KoytU9ZuuWPSSqvju0y1qExHAq1f9dAXe5H+8YNwRRKfjlf/TMnQp
         /gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C0Pwt7HdLAmAGR3l0AqEAbclnN/LVCOeDqDKT+0tJ6Y=;
        b=UMxjxYkVzsGXdhkhJSUudorIO4PnhyYymoAgFSsBvbbGr/k+4i/YOlca1rkR68L03s
         RrZrbMzMjEyrQ+fTDaMmwKNwtoZZg6t7688N6nVXFkHcy1bYZoI2/hRGn7+JAYqJySQA
         jMd62fJXwbeYw7W4LO9zfHVYJKGq67g7eMuKdYAautIfcaXNgU+Ga+7GFqIWiVSZBaWK
         4S4R+eTuXTaKLF1k4TlSpkZe5B9qNYO/jNt5UEJ1+HcyxA+int4ZPBG/cWBX/Zw/Mv1I
         dC9kQCNPQQBN9ByvFnjAIlGe4mh+TXmXl9FEdYJ3GeGjKWxAnMF/MwcXHXPdrU5MYMOY
         tuCw==
X-Gm-Message-State: AOAM5306lPSALL5nS5tTFA9vtACZetCdp46hO5FJTQdD9+5H3MwKcSoY
	1MTBCHh/vJi8uWYPgHSCVszmyMlWhXOj6OopeRE=
X-Google-Smtp-Source: ABdhPJwiOxGYXaMP8vqK611jWDMzb3YrXsZvbSSTeND4lkJfA+A8Biu0TJTohi2hipnwwGLjQ8jyc2cDTGiaXF+Gnr4=
X-Received: by 2002:a17:906:eb53:: with SMTP id mc19mr46330141ejb.22.1629900023590;
 Wed, 25 Aug 2021 07:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <68ca10644e1b4a59b4888b72feb571d8@axis.com>
In-Reply-To: <68ca10644e1b4a59b4888b72feb571d8@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 25 Aug 2021 10:00:12 -0400
Message-ID: <CADkTA4NuTDYNy_N-ua=G67QTVfb7SXnYBaNcegoqPUj4-XAJDg@mail.gmail.com>
Subject: Re: [OE-core] How to build a devupstream variant of a recipe?
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "OE Core (openembedded-core@lists.openembedded.org)" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 25, 2021 at 9:51 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> As I was recently looking at lttng-modules, which supports devupstream, I=
 wanted to try to build the devupstream variant. However, neither the infor=
mation in devupstream.bbclass nor the documentation in the manual were of a=
ny help. Since it uses the BBCLASSEXTEND mechanism, I thought it would be a=
s simple as doing `bitbake lttng-modules-devupstream`, but that did not wor=
k. So what is the correct way to build a devupstream variant of a recipe?

Assuming that the devupstream variant/override doesn't modify PN (like
we do in linux-yocto_5.13.bb), then it is selected by setting the
preferred version to match the devupstream version.

i.e. I have this in my local.conf for when I'm working on lttng devupstream=
:

# this picks the devupstream version
#PREFERRED_VERSION_lttng-modules =3D "2.13.0-rc2+git%"

(and adjust the version to suit).

Bruce

>
> //Peter
>
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
