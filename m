Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.679.1626803901556728040
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 10:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IxYFp5HS;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id b26so37111396lfo.4
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jul 2021 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BiqXeXOWrtwybhsr2qBgOAjp/KxD5/1c0QCV5tqD8BU=;
        b=IxYFp5HSGxx8XgoEzD1+o0FH3+Y7UTKiAd1Slfe8PpkOzY6g+beEtsqn5gn6pKBI15
         QDNltQ9XZ1XE5yxC+Da9V/xOg4DzCp7prZKcm732Ul8yNBnYdwybjXr0y0OesUCClOh1
         SbqnNeps1EByfVhUiKOaIbRKzzYr/P4VhTjglveESF/O6EStR2m2YI38BvdGQx2xBQ++
         te3zDYrqo0kQAJEo/6IhA1AACEkbZlb7hSTt2MtPRRY2ONnAnxStw8U73NJI4l3wkN2s
         QtIlSbdKkG0HiPosHPiAuMGJJmGc6e2wGsDtKLQjqO8GJOq23MOOakFSeT8YCGbQq8zs
         Aw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BiqXeXOWrtwybhsr2qBgOAjp/KxD5/1c0QCV5tqD8BU=;
        b=taqHPX91tPOIjZiIR7KEhXcbbE0zaSd3WlQZJZr/hLijTmWQVloyrHCTrKXHE968pz
         Dlclq2sNP9INgO0p/Kp06jfNWNdLJfgaj3jBwGx2SB97NwCZ5posQ+OgfIZeTWtYGy0O
         GD0Hn/Ty9ytInvfDikWF1A6f0gkIdJaSNAi4IvlNQsSpC974S1iWqqCjwdibXRosxE54
         VsGjrZZBP1zlhZ+cC2s+wUlrbn11QNzOKwAa8Edku49O9U//umiLicx1E6TaXwRbsmLi
         Zn1PeFrzPzCd3hV59c/BNsbCH2udTtEbYoYIwVOOBuQdpzOM1lBO1VgvrA74dRLIATds
         +3pA==
X-Gm-Message-State: AOAM530lXI4/7WmKAXJL0aTHbE+le/mkYOqCblGR6R3zxIUUlCe1M1tl
	4x3yNEBehrqttm7aT35j3FQHAxlltrLBKmMabIU=
X-Google-Smtp-Source: ABdhPJwQ/EIU4sw51ar0zKFzPrtieXXcY+RPpoEEnUepB2Hwrby30OSN3GzMkmXLTI+RuvFXgIDxvJaiJPZTN3kvUGs=
X-Received: by 2002:ac2:4195:: with SMTP id z21mr22093320lfh.230.1626803899648;
 Tue, 20 Jul 2021 10:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <6d41368-58fa-56e-63c5-7d445550a928@crashcourse.ca> <CAAnfSTv+ig=Fzi6hWXGHV7vOFsAB7wX8bnAjTJvPr15z+6zkPw@mail.gmail.com>
In-Reply-To: <CAAnfSTv+ig=Fzi6hWXGHV7vOFsAB7wX8bnAjTJvPr15z+6zkPw@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 20 Jul 2021 10:58:12 -0700
Message-ID: <CAJ86T=VZd=7eNTBR0aX2BGKtRBae6MFayMDrjdHAtqkUK8MXrw@mail.gmail.com>
Subject: Re: [OE-core] how to configure an image with *full* debugging info in the libs and binaries?
To: Ross Burton <ross@burtonini.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 5:06 PM Ross Burton <ross@burtonini.com> wrote:
> On Fri, 16 Jul 2021 at 20:10, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >   colleague just asked me what it would take to generate an image
> > where the executables and libraries contain all the gdb-related
> > debugging info in the same files (that is, not broken out in the
> > .debug directories).
> >
> >   i pointed out that this would increase the size of the installable
> > target image substantially but, apparently, that is of no concern.
>
> This is where I have to ask "why?".  All known debugging tools can
> handle split-out debuginfo, and getting them all installed into an
> image is as simple as IMAGE_FEATURES += dbg-pkgs, as Khem says.

Why is an interesting side discussion. Getting back to the original
question though, either OE officially supports creating unstripped
binaries or it doesn't. The documentation should perhaps be updated to
make that clear (and if there's legacy support for creating unstripped
binaries still lurking in the code but we don't want anyone to use it,
then maybe it should be removed...).
