Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.71.1628615231066677633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 10:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gC8lvY5z;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id y7so31244480eda.5
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 10:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6tNgbt6Jbi94B5uh1PNx0bUG0JaX0vRQn8SHWX574zY=;
        b=gC8lvY5zTUwPh/REAHRLJb7YafFb8W1ZgCag74kSUuidkEhBM2LUuwzttStVz8RT2x
         sP0Gn0o2hFH7T1+4ACp59cpRQ16Mq6eQo/9Trzfhf8K5eT8nmRVmFrkwz1Cdibj07rk+
         fILZOLtrPcsQXx/Xd93rHmTTZj6RXEM1vQzzgl8Ia7UnIJn3w7P7TvFCBaG3c9GfBXTV
         Cc+XsYeOWErkMFgdBGm2maunaB9bpL4dgEzD+Rj8ZAvzlWSoCx653TomFg3FkkctJTAz
         29ikzIaBUoOLKa1SLCqk0uKj4T+SpI/cAMrqeOIUh50VuoKRwBg8vHOH70PgQlcuVz9L
         XdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6tNgbt6Jbi94B5uh1PNx0bUG0JaX0vRQn8SHWX574zY=;
        b=s+BPup5kDZ89IHa6Uk8TGJXWn5kRDMSKLgLXF+Niar5+6K2ZrLW7SKdeYjuBzsI5rf
         a7B+x8cKcKsdQaXlUQb3DnQfSqG4xqcwBcVBDnauvw/WzC4Lk/xfjYbUgtUTByWC7q3P
         9J1vSWV2VYA7ROL3JRAXqVwwtp5x73VwvAmRdT68jZrxOmXsfUbB2d35pL87Ag1M7tZc
         1okGKhVwSSotLwKsu4sVNrFbq4fzCs50EmROWVbnvLS85Elbq0DKNzyS+5RvlkKzMq46
         x3Pm+IxoHn+3+S2vEH/ZZHobBznPygGy48CG0i6jdpqBe9wPmOKPJgkVZYDrz+2WoHu3
         5ogw==
X-Gm-Message-State: AOAM530fCwe+t3HSD2AWtmTxXSUbEzOfThAAPRLWLC03rszgp1YHAF+b
	ntAvZiRBqHjzeFfRf4Nc6kUa/xXEimDkpCSEF5k=
X-Google-Smtp-Source: ABdhPJwAUlHaD2a2oPk/RN9TILVKRlUqzP7/NQFsKntDpgRaH0l2MqwTB9hz/aUFUB0ZaXk4CAnsjnQYTqzgBf2Cl5k=
X-Received: by 2002:a05:6402:1747:: with SMTP id v7mr6264534edx.19.1628615229278;
 Tue, 10 Aug 2021 10:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <e6018e38af78238e5fe278a9e70a6a95c9f0680b.1628613577.git.diego.sueiro@arm.com>
In-Reply-To: <e6018e38af78238e5fe278a9e70a6a95c9f0680b.1628613577.git.diego.sueiro@arm.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 10 Aug 2021 18:06:56 +0100
Message-ID: <CANPvuRm85VZRxaWrG6Zm-sOCzMsTE0zCVkP1akvX5CPdfWhFSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: import errno module in sstate_package function
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Diego,

A fix for this is already on master-next
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=3Dmaster-next&id=
=3D0066f321061ca068a937e44d5b6785b84bafcb98

Diego Sueiro <diego.sueiro@arm.com> escreveu no dia ter=C3=A7a, 10/08/2021
=C3=A0(s) 17:41:
>
> The errno module is missing causing the following error message:
> File: '/<...>/poky/meta/classes/sstate.bbclass', lineno: 708, function: s=
state_package
>      0704:        except PermissionError:
>      0705:            pass
>      0706:        except OSError as e:
>      0707:            # Handle read-only file systems gracefully
>  *** 0708:            if e.errno !=3D errno.EROFS:
>      0709:                raise e
>      0710:
>      0711:    return
>      0712:
> Exception: NameError: name 'errno' is not defined
>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  meta/classes/sstate.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 554e401ee2..187cb04534 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -640,6 +640,7 @@ python sstate_hardcode_path () {
>
>  def sstate_package(ss, d):
>      import oe.path
> +    import errno
>
>      tmpdir =3D d.getVar('TMPDIR')
>
> --
> 2.17.1
>
>
>=20
>


--=20
Best regards,

Jos=C3=A9 Quaresma
