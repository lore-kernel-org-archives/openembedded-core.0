Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web08.2154.1616530329570399709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 13:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=erzhDKrp;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id z8so27249698ljm.12
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 13:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hQzrGApPQ34H6lJ2sSaq5/N/2vBunaUy7+UusNJIb7Y=;
        b=erzhDKrpC128v1W21Qpimj/yx+v3Ek0CqGJQjbrgAVj5SfaAmMF+nMD6Qp+XglkmBc
         RJi6XkbzYXfBszFSjbvpxvExYnylVrTkGmgAe5VdV1OBWl6puoxoBITvPyURon75GMR2
         HtgrqbWg2cnCTVm4AQhUcXoKV6wuyzEdWWU614sQduNvunJ9NsFltJnp18MTlUGGcEtS
         7agjNtpr8hhfp/i0EuzdRymMdEHE6rtuJmDmOyvp6p9J1+eu6mMlob087QBY2uwu1dM6
         jswswQPY2qZnRqmddPyIm7rKP94MI1EhgjuyPpm0amBq76tquo90Jw9pFEFN15xWUioP
         qd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hQzrGApPQ34H6lJ2sSaq5/N/2vBunaUy7+UusNJIb7Y=;
        b=chA2YsSrLUNX/JXdD5FkO1pYjYDwOBa/BywkOI5lTvgDCLx/ghYVusLgfhzOKpvmqv
         AXWlB63QxXhP+m8HJOYUvtPP5/xgUPLWD7t2T2gR/SNBJWY+kr5z7oyjS+REdhhiIOeM
         mEGeYtLNA+iVPpF1o7QcKjdkwtkIhSLGzE/RDQ7Kfrw/PqidKP6CgcLdKjoRmdAsm4NO
         b74tBmh3sfFtPvgAslBSdslE9ChgW/uC5i0HGiyxQD+hgWqRbsKcZkqztYvkmBCOYa4x
         uvCdFD0VhLd7B8VxltTmHmWTzkZJgayisdn3S7M1dUbAUgMu2k5R6NBCYyNxAlDfyqTO
         wZIw==
X-Gm-Message-State: AOAM530Kevebe1hS+efLK9IcqOS9Y++IgR89HFRDxHr/ZGoNnWE81GkP
	7U13+65CnM3UrUArlnpBNFENJBRktM2VusM9Kzk=
X-Google-Smtp-Source: ABdhPJwtBye8Q8WBhqKRtPJiMzVyTXRh43yqWl+4+iKS/Zqkn9AijvJknT2CF/2hdpB9WAXATGKRcCZVI8h6Oi3C5bo=
X-Received: by 2002:a05:651c:3c1:: with SMTP id f1mr4198839ljp.507.1616530327429;
 Tue, 23 Mar 2021 13:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <8763d612-bc5d-1dc6-84d7-88936ca479c6@crashcourse.ca>
In-Reply-To: <8763d612-bc5d-1dc6-84d7-88936ca479c6@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 23 Mar 2021 13:11:55 -0700
Message-ID: <CAJ86T=VZo4htkWs1bAQ07JoFQfCBctQTL3m=iNBj_5zqFxM8Bw@mail.gmail.com>
Subject: Re: [OE-core] proper (vs weird) way to define proprietary licenses
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 23, 2021 at 3:13 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   once again into the code base i'm poring over, and this time, it's
> about defining proprietary licenses for internal recipes.

The typical approach for recipes which build proprietary code is to
set LICENSE to "CLOSED" (and not define LIC_FILES_CHKSUM).

I'm not sure what the advantages are of creating a license text for a
proprietary license (since presumably you won't be sharing the source
or license text with anyone). However, if you do need to do that for
some reason, be sure to double check COPYLEFT_LICENSE_EXCLUDE (e.g.
append your proprietary license to it from your layer.conf) in avoid
someone enabling the archiver class and accidentally including your
proprietary code in a release of the open source code used in a
project.

>   turns out the meta-boundary layer has a nice example of what i'm
> sure is the right way to do this (i've rarely had to do this myself),
> wherein the layer's "layer.conf" file defines where to go get some
> extra licenses:
>
>   LICENSE_PATH += "${LAYERDIR}/licenses"
>
> or possibly some variant like (for ubiquitous acme corp.):
>
>   LICENSE_PATH += "${LAYERDIR}/files/acme-licenses"
>
> to pair up with OE's .../files/common-licenses, you get the idea.
>
>   so i was puzzled when i saw all these clearly proprietary recipes
> that did not define LICENSE or LIC_FILES_CHKSUM values but, instead,
> inherited "acme-license.bbclass", whereupon ... well ...
>
> acme-license.bbclass
> ====================
>
>   HOMEPAGE = "https://acme.com"
>   LICENSE  = "Acme-Corp-License"
>   LIC_FILES_CHKSUM =
>         "file://${THISDIR}/../../files/acme-licenses/${LICENSE};
>         md5=deadbeef..."
>
> *sigh* ... while this might save a couple lines per recipe file, i
> can't believe this is a reasonable approach. has anyone else seen this
> strategy?

Doesn't seem too unreasonable (aside from the comments above about
setting LICENSE to "CLOSED" for proprietary recipes).

>   in any event, i'm adding this to my current list of "stuff you might
> want to avoid doing when using openembedded."
>
> rday
>
> 
>
