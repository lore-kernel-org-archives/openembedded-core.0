Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.1726.1623782131214869466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 11:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ir+IXURU;
 spf=pass (domain: konsulko.com, ip: 209.85.222.177, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f177.google.com with SMTP id k11so41417014qkk.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 11:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=GXdiv/VzGA/YKHzWhskFcuHpRiIjUr0Cd4kTOaxIDLs=;
        b=ir+IXURU4O83FxI8exeNYGO1Gna4iQn5bw1QcjCyie1TTUKm5lsse+hTEB57u/PPDp
         VZWdjGQoK/jmkYZezrkQ+RgxkHnpszdSubdzw8QIOGz+0DKQl1/RvJu0MV2hPqK+br/A
         YJMpH+coRbGAfCu6Q3WzLLyVLrCVJ8zaoFZhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=GXdiv/VzGA/YKHzWhskFcuHpRiIjUr0Cd4kTOaxIDLs=;
        b=bNNn4brA1P+02L4q6BTInm5tilywpBA6wYLxbpdkgvEI2Knw22PPlhRgjda9TQrj/c
         vEU2E2o5lsqnh4TOM9JOOLDeuPR9YjnRnjXaNz1J+LxEzVRlD2WQiqSQWHMZg1abjTDL
         tYlxOMaO8ELuGA9hNQqY5+/v7/NvQNUX89eWjW2mWfw8fK1FUzV1vyky4dJyDD5v/VWA
         oqZXOMMb46Gpvn4ZwxAxVwn2nCyYgqhph47jMH8WlG9YLvgOcyAPrkrkv8mH/mAXXm2D
         s4SeoBbmFnoUNUsOUdmgWyYK0zZuZzNxhaPzFCFIniUzjK8QRzxx1vKa1L7+HV7xevyA
         4/JA==
X-Gm-Message-State: AOAM531K513ZxBVQDsRXa6M6w/Kf+nIFBqMeFAx1/ooUHioTH7HJ4Vq5
	4itPYg31KHrSPFH+K1trgBving==
X-Google-Smtp-Source: ABdhPJxIE2/W0t3aC2M4zQyeNj6Jpm+PZGElfDOyAOPpQ0cBX6KoezRhDgl/YQy2o6u+paHFnghbdg==
X-Received: by 2002:a37:a47:: with SMTP id 68mr1048792qkk.432.1623782130207;
        Tue, 15 Jun 2021 11:35:30 -0700 (PDT)
Return-Path: <scott.murray@konsulko.com>
Received: from godzilla (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
        by smtp.gmail.com with ESMTPSA id s20sm8390137qtc.94.2021.06.15.11.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 11:35:29 -0700 (PDT)
Date: Tue, 15 Jun 2021 14:35:15 -0400 (EDT)
From: "Scott Murray" <scott.murray@konsulko.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
cc: Ross Burton <ross@burtonini.com>, 
    Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd-conf: Prevent systemd-network from managing veth interfaces
In-Reply-To: <CADkTA4N_y-LcJj3+FbFgkdYtPZmPExj8qf-FrQ8pzeQy8t0F9g@mail.gmail.com>
Message-ID: <aaedf6cc-3c45-5a92-5fac-c5edde1d1327@spiteful.org>
References: <20210615100200.3325303-1-ross.burton@arm.com> <CADkTA4N_y-LcJj3+FbFgkdYtPZmPExj8qf-FrQ8pzeQy8t0F9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Jun 2021, Bruce Ashfield wrote:

> On Tue, Jun 15, 2021 at 6:02 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > From: Matt Spencer <matt.spencer@arm.com>
> >
> > We need to prevent systemd-network from managing veth interface when
> > using platforms like k3s as they control creation and management of the
> > interfaces.
>
> FWIW, I think this may surprise/break people in other use cases. I had
> mentioned this to matt directly as well.
>
> The situation is not as clear as that commit message implies. networkd
> *can* cause issues with veth devices, but not always.
>
> Not trying to stop the patch, but I wanted my concerns to be archived :D

I second this concern, a default config change like this might bite
systemd-nspawn users, as it has its own options to set up private
networking with veth interfaces.  Maybe adding a drop-in conf file
to do this when k3s or the like is installed would be better?

Scott

> >
> > Signed-off-by: Matt Spencer <matt.spencer@arm.com>
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-core/systemd/systemd-conf/wired.network | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/systemd/systemd-conf/wired.network b/meta/recipes-core/systemd/systemd-conf/wired.network
> > index e7b69970d6..7406287248 100644
> > --- a/meta/recipes-core/systemd/systemd-conf/wired.network
> > +++ b/meta/recipes-core/systemd/systemd-conf/wired.network
> > @@ -1,5 +1,6 @@
> >  [Match]
> >  Type=ether
> > +Name=!veth*
> >  KernelCommandLine=!nfsroot
> >  KernelCommandLine=!ip
> >
> > --
> > 2.25.1
> >
> >
> >
> >
>
>
>
