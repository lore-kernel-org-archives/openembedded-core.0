Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.10499.1628177742562854111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O2PwaBIa;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id m11so4148106qtx.7
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yPTnlMakJu7Ip5yuz3BAgSqHv8jIQwXHFT23UVr/9XQ=;
        b=O2PwaBIaFJXf7oM25JSYIAs3iU33A7TuTDBUG0Q1gjMuvYx6oXk39eTZsTjMshIu8C
         UJTyDe3IPxRaY8Sq6hJKC8L5b8MXKSAhJEXH8W7i3+AtZ72Ci82PIKVBD645Cdt0gmsD
         BiNvpCvm+1H3rN1GqekYWIFMl2Mrpllnik/9pqjny7s3IDReYG0v+lohuzLTLN8zcBG2
         F2RZk50Rq34puqMTZb/OjUqmtoWiRW7JLJoQbh3iZvGJ4SOWafHie85Po10mLX0BvS/m
         2V4GlW6cUut1/AD+y1fLqeotBCoHIlYDbEFznPigfxl9vSAcr1UFNihM21kE5xeJtVWj
         n8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yPTnlMakJu7Ip5yuz3BAgSqHv8jIQwXHFT23UVr/9XQ=;
        b=t5DG7B0Spp/ZF3s95TelWltmXdTcqYtSPyn9u/si+Ue5gLF1aejYoI4T0MkD0w2McM
         HAT723bXmGLKBpcfPGqvV3yf/q1ZNQBh/iQYhndqceNMXrfdzz59iNwFwWu78XEayJVO
         EiQhZenQu9TpP/tbLay8ddM09N3rbzpa9myWB/gz1pStWuN7sKqmsz3+d9HOdvJCD4E6
         64fNiFLFPrPJeAMPtKaQdFhYwSZOz8zorbduOu/HQOYsczpkSEOja+HztaznszE0vICz
         menGP/JfcBht3C4XYk2pafGJ8nVjiTzBlegAJrJDignB58wfEQLi+LUW8brClz9G2K7j
         Tleg==
X-Gm-Message-State: AOAM531SH2nvGm8m/02n0eSzjEaHi691+nx7Mumu8XZU3HgIdmrw7xmQ
	OjZ5qKlVKyNR64trpZqUkR3MFC0Eyo3KReTr20c=
X-Google-Smtp-Source: ABdhPJwgUGm7TgGVmHOyFLpeVI41WT4SFuTTLivY5kAr8w04OpeOsTy3RB2lvimmMJzYiMVtgywhH5AQFRSPgMD75xU=
X-Received: by 2002:ac8:7d48:: with SMTP id h8mr4896203qtb.299.1628177741607;
 Thu, 05 Aug 2021 08:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <d9126d7b-13ed-6a37-1db8-2affecbca83@crashcourse.ca>
In-Reply-To: <d9126d7b-13ed-6a37-1db8-2affecbca83@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 5 Aug 2021 08:35:15 -0700
Message-ID: <CAMKF1sqNGWxUDe6DLC+oqqfv4P194pFhqd7zcPdDaToQC3s6uw@mail.gmail.com>
Subject: Re: [OE-core] should recipes not come with their own systemd/user/group info?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 5, 2021 at 4:01 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   style question here, but i'm perusing an OE/YP (actually wind river,
> but effectively the same thing) layer that was handed to me, and i'm
> puzzled by how the internally-written systemd-controlled services are
> implemented.
>
>   on the one hand, there are reasonable recipes that each represent
> some service to be managed by systemd, and they all install their
> executables in the right places and so on. however, rather than each
> recipe also providing its own service file, there is a totally
> separate recipe (call it "systemd-services.bb") which contains under
> its files/ directory dozens and dozens of service files for all of
> those recipes, and is responsible for installing all of them.
>
>   in short, someone decided that -- for whatever reason -- all of the
> systemd service files should be collected all in one place, and
> installed en masse. is this ... normal? i would have thought that it's
> the responsibility of each recipe to mannage all the content related
> to it, and that would of course include the systemd service file to be
> installed for it. i don't know the rationale for this, and it strikes
> me as a recipe for disaster in trying to keep all these things synced
> up. is there some rationale for doing it this way that i'm unaware
> of?

Usually its better to keep them with recipes/components that helps you
with managing multiple devices which may use different packages better
however in many places component owners are not interested in maintaining
the startup or life cycle management of component and its done by some
central platform team and they may create a single component to manage
the device because it fits there workflow because they don't have to go and
commit these scripts to multiple repos etc, I do not encourage such setup
although there could be some policies which could be implemented via
just systemd scripts and they may live together but if it becomes one place
for all unit files perhaps not ideal.

>
>   and closely related, the same trick was used when defining all the
> new users and groups that would own these services. rather than each
> service looking after itself, there is a recipe file (call it
> "new_users_and_groups.bb") which is hundreds of lines of USERADD_PARAM
> and GROUPADD_PARAM lines that define precisely (numerically) all the
> new user and group accounts to be associated with all sorts of
> services, whereupon i ask the same question -- isn't it more typical
> that each service look after its own user and group info?
>
>   in this second case, it *might* be that all of these values need to
> be hard-coded to be consistent with, i don't know, something else i'm
> unaware of, but it still looks strange.
>
>   thoughts? the above actually works for the time being, but it does
> seem a but unnatural.
>

same logic I would say

> rday
>
> 
>
