Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.3158.1602178144364635605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 10:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PadOTSAu;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id e2so7347992wme.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 10:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xgfismOSrk+MUVsUIWMNLz7O3uTaPbz4jg3sgmcGg4M=;
        b=PadOTSAunjkFMixJWy7Pv+5nP50bEbhMAnt5Y76EPejh2+YV+mbCf9DeUknGwUGp4t
         JUGEqMPlUqfrRk4nGEdhIDkxG7vjhNYu2AgQQJqWLtORylwzex1HKFxjcNjmXnIZEB0g
         45M9M38vilSK1ZyFTHP1MFcJGxllEmp+I6IMMQVqYinKozHjPoKLjfjrJiNUExLK0qVM
         EqGOCH/oEFJhpWDmhFbQZ4XnpTQ885VXtrfQ5Ve1Jxkv1E6SkLAX1rfdPAzdDwBQ9oI0
         2s5SuWTwdOZFQlIsqraDqXb3T6DUQUPB0IVrKXWa0mMKBYdkb4ZuFaPb8ayPr0Wb3OGY
         ynYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xgfismOSrk+MUVsUIWMNLz7O3uTaPbz4jg3sgmcGg4M=;
        b=EYomdDdx7cQ0yWOPn+R8O09hS3kaMdNl8B2npC2P8oktCG3Bhfz6QFUptHFHOH7T8e
         JO2mL3wH0WY8hqRS8qMEbLbID/8e6o6zOODEavk8WvyKlT0XtIn2U/BvzniVZnY88Yj4
         jurNg+fknhXZxv80JPIzct5xYVnH9+t3hEuRKPDDaQF59YRDskcje1pekxW3OEZKxqWO
         4fsZQHIl3U7Ehxo7dVxoizGSGzYn4Z0UOxHPUDuxPHJp9eOEYSBnc8kZ5hMQbreEyIXT
         rK2B0KCIh12LlLU3ylBufAfgAkh0CjSlyMwLub4nvxkrVpT3ZQA21iaHg67FL8vwdnOI
         iZXA==
X-Gm-Message-State: AOAM5325N6GpqGAk4HemltMw2sRUHGAQozgtf51W75Np1zsJIXXRYq9M
	7lxgdg9EoOJaGFCeZMWnlPg1MLhcRPxFCGaWBg8=
X-Google-Smtp-Source: ABdhPJwP1GDFr3cAA7REE4IRvRCeEDpge1kbSRqZ1GrgDXrlboX3Yi4gKixFlhE2BJl2D4l8qf2IyWko9juntVgW0UU=
X-Received: by 2002:a7b:c307:: with SMTP id k7mr10418325wmj.31.1602178142694;
 Thu, 08 Oct 2020 10:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164534.123373-1-chris.laplante@agilent.com>
 <15be7caa-aa27-1776-6f41-6ef0bd64a9fb@gmail.com> <SN1PR12MB2480E9CCDB9E862AA6A3700E8B0B0@SN1PR12MB2480.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB2480E9CCDB9E862AA6A3700E8B0B0@SN1PR12MB2480.namprd12.prod.outlook.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Thu, 8 Oct 2020 12:28:51 -0500
Message-ID: <CAJdd5GZ1q4RaoJeU=omX5kJ2f5OTgJZ3D6Y24aGY+94XMt-8-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson: ensure out-of-tree build when under externalsrc/devtool
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2020 at 12:22 PM chris.laplante@agilent.com
<chris.laplante@agilent.com> wrote:
>
> > +CLASSOVERRIDE .=3D ":class-meson"
> > +EXTERNALSRC_BUILD_class-meson =3D "${WORKDIR}/build"
> > +
> > Why is devtool telling the recipe to do an in-tree build? It seems like=
 it should
> > be consistent with externalsrc.bbclass, which works fine for meson beca=
use
> > it always does an out-of-tree build. FWIW, this would *also* be a probl=
em
> > when using waf.bbclass, but I suspect no one cares too much about that =
:)
>
> I have no idea why devtool does it (in general), but it does (see poky/sc=
ripts/lib/devtool/__init__.py, the "use_external_build" method). Granted I'=
m using zeus, but my experience is not the same as yours so far - my meson =
recipe tries to build in the source directory.

Ah, sorry. I wasn't quite clear in what I was asking :) Yes, what you
are seeing is the expected behavior because devotol is setting
EXTERNALSRC_BUILD for the recipe. My question is why devtool is doing
that at all? The default behavior in externalsrc.bbclass (and thus,
what you would get if devtool *didn't* set EXTERNALSRC_BUILD), is to
force an out of tree build by setting B to a subdirectory of
${WORKDIR}. It seems more and more like out-of-tree builds are the
norm, so instead of changing everywhere (waf, meson, et al.) to work
around devtool doing an in-tree build, can we remove devtool setting
EXTERNALSRC_BUILD so that it defaults to an out-of-tree build?

>
> Chris
