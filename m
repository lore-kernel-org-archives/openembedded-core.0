Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121601112245
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 00:01:18 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5222.1775088073287122861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 17:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Meiq7F/R;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d7ebe11bffso309923a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 17:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775088072; cv=none;
        d=google.com; s=arc-20240605;
        b=VSKuiVtt3/V713BmotIZHO1/B0kr93mk21ez1qqCwKy5Y/QPcnlO8UMmH5eSw6HDJg
         qTqJT29HNLSj/0nwxAoHt5sR04G7dLV1Jx0/vak/bmhFft7W6PLOOOAjmcPKxhszgrJk
         cNs4y+GYldFOv8qwUR9zGF3sjAxzFa1l8YepHnUJvo5CzvRli9S6XuTEFPOdqBF8Rt4d
         K3rr0ROz//2ccxz0RX2ri1ez2ZsPswhvWGuRZo+Ajg7DdRCsIN9S8fJAU4dxDH9rKzxd
         N7UHY9aoQswhPS5tMjk2ECw2wdRv5GfqO0fiwC8sKQ0BSMauiNSJ0QWyx6v9JE+RXmOj
         orTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bB1rotER+t3Pt6wWiCyEJ4jAOyz/f4KQ0UzM5he9oWQ=;
        fh=ipws0wG+k0OA3kXqbycnQoCJAD8PbitcTEukBC/jmQo=;
        b=ZF2pNhsfu0HxykTTXLPdSKM5hyPi041dZtluef0eKQ+EVuGcaC6tNWzjOKaIhUIYjJ
         swTFcayBkfs9Czkg5w05uIF7sgVAEJVaAB6N3xOA6HYswY72ctWW35h8POItDauCOZZB
         hfDosqN14YGNkhLi9gB4hOXqvKfowRl7EpWW/ZZbG0QhLfoSJKTIIC0irltIMhGRJKeX
         WXMObZFGVGpb1NQmL+EVsb1D6t2uSwqTCJHqDws7651FBWOWkW5HVS8jE9oVr1Q8VnmR
         vqdm4Rx6Ei8bjOOIVBoDTsZgyocEZQWqfs+yGPJmNPVC9kDYGyTcSKGgr9xL85iIbwYu
         Bz3w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775088072; x=1775692872; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bB1rotER+t3Pt6wWiCyEJ4jAOyz/f4KQ0UzM5he9oWQ=;
        b=Meiq7F/RlOomIXJZCjYfRD4wTGLyByuLZ3VGAAe/b1GrGPBo0sPhW6kiIF2azXd/8l
         HnD9/tAeku0Yd49VRev1AGk5EmguasoqqTLhTzpd/L/b5TtVqHwchYOfNlAQNCmXRrcq
         3DJQLflBoInFI+7XLS8PdFufApNL/oLTIUBFPQCNoaiM/tbx0TDsKM2EQhj/+6CxxZfW
         v31u/5wiiHLUEQXmYCo5nkEf5OsDvH+uT+YaTGmDcDrSW3yHi/BT6rsVDKSBRBtqpG9e
         JByfDJjftdWWsSHaJH4Xq+yo3O1fWL9+Yuk3jHhs4iBiQZm35Bt6MaJiDw0s5az5noJe
         dOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775088072; x=1775692872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bB1rotER+t3Pt6wWiCyEJ4jAOyz/f4KQ0UzM5he9oWQ=;
        b=KRQe3Q6OHuCPIfzEFyS2i7lMR5YdI36YGSZ9YCd/ZtyitB0TmgvhP55lHCB5Su1nAh
         GlrQ9GTYbiX3H0rU0RAMeQpF7XGNGrV4qH3xM8z1P9WEJx76UKa+spTUhARiT0Xn12VK
         rgB+JaV930qQkkDKBKBiL3HvlpaiDyqpdNybcgYLRKmNpUH4O6YXS+0+HcMsNerxu/77
         oEjx2yYmiIsgGGxhahFccGDpnjpdavfEgUU86qaqd7TQjkF3I0+irvgcIFz9Uynw4ZqI
         bBdOea0/baPcoKlBHz6yZu3/BDMT6H+OG1ncxTcVFOT94wnFgxyZHv6ZsZUYlQtuZZ2V
         v9zw==
X-Gm-Message-State: AOJu0Yz/5/vTWzFKMmz4zojstaEtFWr8gDDhJhrZOSqeNzvOU0fWUmZU
	cD+0yXwFzyS7D1xfENWMzznAV+ILxfFepszK+k3iDa+OuhYnkRpE8TgLc7QjTbK3/2i2nwgsNiM
	to6SWK5C4dnzQLAhYK3loKZ2+EBP9uDpDxQ==
X-Gm-Gg: ATEYQzw7a7cp2cg6lGoSAcuogBNspVi5/xcVWiFe90qyQ14NZRnQA+/MWsnoeaoglYU
	1Vow9JPOznzL02wFlKiGxIQbvMpZ8e+m3avIULkGLoLBdKwRH7aeDUPHYRedUgXR5CV13VHUJEO
	SpQGDBD0miFcYbQYucza51wbYMhrC4GK0b5zi1oAjw5L3EuXmlOOvxvbtknxnX62eo/9S3TdyNF
	1GvPZllacQqEP2PhE1nm4Dm6h2J+GlCijeY78LL8cnfS5ejPVHTr6wHXdbwQLwSRfXawPVX8ext
	ygKTD7bo
X-Received: by 2002:a05:6820:a287:20b0:67f:c458:2b7e with SMTP id
 006d021491bc7-67fc45837d3mr1641074eaf.53.1775088072294; Wed, 01 Apr 2026
 17:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
 <20260325021856.4053666-12-ankur.tyagi85@gmail.com> <DHHX5HYC3V4J.2G66IHM8JCKNT@smile.fr>
In-Reply-To: <DHHX5HYC3V4J.2G66IHM8JCKNT@smile.fr>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 2 Apr 2026 13:01:01 +1300
X-Gm-Features: AQROBzCErl8M_cnUpo3w6wW8APvf4aKfz8qY1NBmh_r-odqVQxSVsb1kdkB8Hjw
Message-ID: <CADySD0Gm+erC0+UL1-K3oHnEiNmBjSTku+xzqq=YU6jUPp6NVw@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 12/12] libinput: upgrade 1.29.1 -> 1.29.2
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 00:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234466

On Thu, Apr 2, 2026 at 4:21=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr>=
 wrote:
>
> On Wed Mar 25, 2026 at 3:18 AM CET, Ankur Tyagi via lists.openembedded.or=
g wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Release Notes:
> > https://gitlab.freedesktop.org/libinput/libinput/-/releases/1.29.2
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 4cd78e63cbf4edaeac1fc9f46fb737e1356e3f1b)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
>
> Hello,
>
> I'm sorry but this upgrade contains feature change and, because of that
> is not eligible for stable merge:
> * All those added/removed/reverted quirks
> * libinput: Add libinput_event_gesture forward declaration
>

Understood, thanks for the review

> Regards,
>
>
> >  .../wayland/{libinput_1.29.1.bb =3D> libinput_1.29.2.bb}          | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-graphics/wayland/{libinput_1.29.1.bb =3D> libinput=
_1.29.2.bb} (97%)
> >
> > diff --git a/meta/recipes-graphics/wayland/libinput_1.29.1.bb b/meta/re=
cipes-graphics/wayland/libinput_1.29.2.bb
> > similarity index 97%
> > rename from meta/recipes-graphics/wayland/libinput_1.29.1.bb
> > rename to meta/recipes-graphics/wayland/libinput_1.29.2.bb
> > index 809c291e23..f771085388 100644
> > --- a/meta/recipes-graphics/wayland/libinput_1.29.1.bb
> > +++ b/meta/recipes-graphics/wayland/libinput_1.29.2.bb
> > @@ -15,7 +15,7 @@ DEPENDS =3D "libevdev udev mtdev"
> >  SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libinput.git;protoc=
ol=3Dhttps;branch=3D1.29-branch;tag=3D${PV} \
> >             file://run-ptest \
> >             "
> > -SRCREV =3D "dc2c1ad181be88e1487468f7ca6f9d320981f133"
> > +SRCREV =3D "917783150a5bab7d55eedc5714f1b49b192426ac"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> >
>
>
> --
> Yoann Congal
> Smile ECS
>

