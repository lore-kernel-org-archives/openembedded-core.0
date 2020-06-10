Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.7154.1591782543234536392
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 02:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kdsXwMwi;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id u16so1064496lfl.8
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 02:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F1wWOfgrlR3h3/Q7B++NeOlWh0u6zmOeL5EpMLn6tZE=;
        b=kdsXwMwi6XdUCN9/U88ZOidxwlRUyLfJlH1ypm82HXZRiYacLdNSrqM/vZG8bZ9gyO
         BBxC+xhyEdtI9Eq7pLXfmgaNy4KwPsV4c5u/tV+PS+jjO6ad0f1FL96oSZssQEAgbtcV
         iaE00AKG4wt4awcm35gDydatEqvXD6mUjlttPUrdjRyGNoE90C4WrSAU4Xtg9p2q8x6a
         saJ3GV0HOwTPk4iDK+VcyT9f327bUDERkOPh1MGivzwL247iNt7CVDurOyG9P9mx1LgX
         CpqjnUvEm9uqvumntWJSxcQr/i3+Vtd/WTjiUJM+izS4YiKEFtwH8XuXc/7KoVDYFGG+
         r6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F1wWOfgrlR3h3/Q7B++NeOlWh0u6zmOeL5EpMLn6tZE=;
        b=ihCemw541bY0/+kcNCYY3Xav90No0d0SJ+nGpG/Qz7rUa3vuslHaXAU/KU22XQC/ld
         YTPzpoyCr4JgLrGto9lt0HP3IkRKdmirlEAq1iWmmLEUE/MXz8fK1xJwQW4JHIcsdHdx
         gLw87T3CokBPl3pzdbVYu0y9BisX/UADXlq7Sx2VSxZMcTDwzorHoPWkkawFaY9PIfA3
         XsyowaCpqGOmWt5EcjCrJ7ZDEXl85mogzRbQyLOEBj6Vwa0LwmPVRUIVOVXK5LR2hIP1
         xEgBpXI5/ak3GqNzgiC9DB8VUq5OsWot+M6OlGAbgqpVlt8FE+ha+MSwf8SsAoe0mzjg
         LfDQ==
X-Gm-Message-State: AOAM531bvDyzt/fLpmMbX/neLgwxMWwhPlIYpX5TKBqioLu/a/OhaCHH
	s7hPjurXY0hxG8ynYvOyPSIBDRtQBmdneGUodqg=
X-Google-Smtp-Source: ABdhPJzYrdt/1Aj/+GJgRX6/mprJTGzHQ/0xrIN7e7NWqTa4hY9xf1/49BjSaK3288yj321yGFQNbZSaYmh3wkm3KXI=
X-Received: by 2002:ac2:5094:: with SMTP id f20mr1278007lfm.128.1591782541118;
 Wed, 10 Jun 2020 02:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAPybu_2pgXgLsvdgLhn60emg5Qh8krRQRNKzQbB5LHfec_YUDQ@mail.gmail.com>
 <46a2f1527c6b547df37ed040c30369975c188f90.camel@linuxfoundation.org>
In-Reply-To: <46a2f1527c6b547df37ed040c30369975c188f90.camel@linuxfoundation.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Wed, 10 Jun 2020 11:48:44 +0200
Message-ID: <CAPybu_24rBzPU_wb2+j-G4HkMd_MtCTFNDuK36pefqbm9JeShw@mail.gmail.com>
Subject: Re: [OE-core] devtool and multiconfig: Bug or feature?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Jan Lorenzen <jl@newtec.dk>
Content-Type: text/plain; charset="UTF-8"

Hi Richard
On Tue, Jun 9, 2020 at 11:46 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-06-08 at 16:40 +0200, Ricardo Ribalda wrote:
> > Hi
> >
> > I am trying to use devtool in combination with multiconfig for the
> > first time, so probably I am doing something wrong.
> >
> > I have created a very simple multiconfig
> >
> > cat build/conf/multiconfig/arm.conf
> > MACHINE = "qemuarm"
> >
> > And then I want to modify bash:
> > devtool modify multiconfig:arm:bash
> >
> > If then I try to run:
> > devtool build multiconfig:arm:bash
> > NOTE: Starting bitbake server...
> > ERROR: No recipe named 'multiconfig:arm:bash' in your workspace
> >
> > So I run:
> > devtool build bash
> >
> > But that builds for x86 instead of for arm...
> >
> > Simply patching check_workspace_recipe does not do the trick:
> > @@ -145,6 +145,8 @@ def check_workspace_recipe(workspace, pn,
> > checksrc=True, bbclassextend=False):
> >      is present.
> >      """
> >
> > +    pn = pn.split(":")[-1]
> > +
> >      workspacepn = pn
> >
> >      for recipe, value in workspace.items():
> >
> >
> > Any idea or documentation to follow?
>
> I think this is something which hasn't been tested before. Its a bug
> but nobody has probably tested or fixed devtool to work with
> multiconfig.

I have opened a bug on bugzilla, with a horrible patch that kind of fixes it...
Lets see how it evolves.

>
> Cheers,
>
> Richard
>


-- 
Ricardo Ribalda
