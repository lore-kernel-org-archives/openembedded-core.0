Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFABDCAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 15:42:32 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.web11.1258.1759160545658498761
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 08:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VNNHW6nZ;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6348447d5easo3685612d50.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759160545; x=1759765345; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2mF9GDAJVYtvYgvwn8VWBjX/cA3hoQAPdZJDZK0zZU=;
        b=VNNHW6nZql2MD8t0emw5eD34oLML0btqArXbeEBshyQ3qvPgGZ9rwwmxZYlMiG49GH
         kCHneYfHQPfPtaOIsQZrp/dstYYvnN8g+MwgIxGErEOq4A4neGqCihnGs2ZX8gii2egP
         ZG2smotkGp8tV7dK64qvnpe7UaugmWYDv4HlYbqtNWRqRu6wT6ekA7zQZbEtEfuu2Vr/
         D5eWXS2qxWiXxr9EXdcawIoChXmEK57vop/9E5IYpoGvxBypQe6tlgZylmX6nPtKjohF
         heQCTBTHywQkGJDEF83cdi5eDmIEnfFsLvG75TpHmbUTL3Cr6xYGvXlIbdZmiYdQjJAz
         aZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759160545; x=1759765345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2mF9GDAJVYtvYgvwn8VWBjX/cA3hoQAPdZJDZK0zZU=;
        b=UcgyUZ8zL5eY6XEOaBr0Spg+YQ76Rq8f8Sne28BqM8/F2vXvyqDRZUMdaPlfYlIrlW
         u52nyJ6jpLfoCWs6elrpkcgGGAO4vrSapeoAilxFvFXoydJV5AmW1eURhcPjzR9U5Uug
         MwjHxf/MXPAdbKU2SFQrJHdJEjATBNIBsaKIOJgA5Nv95HqEXCL73/DHuzgD+vfjkqYd
         6VDU6kATB4RBJw0pwisNpRzA6PgCWIxsTcgg8dDKO1S0PJvuq6ieNfp1key0//wXuPf/
         VL7FrEjk1kjj3+K4tHeBxvSukxGVA1ibBpbqej+GaHpr0yxLuiLa4CKAWT7ny/oyp7dE
         apgA==
X-Gm-Message-State: AOJu0YxvB2OV4fFH7SzVvY9/gHZg7iV4jh5at7g6fUVduTZeSYcRqgnI
	FQYf5LteEtaYkkT5bJ/m+H2fX7r/s/BkQHs5Fnnt7iErorC8hhDYYJX+ae6mZEtZipU2PFHf52B
	nZ3r4t01UteS6SzHUEUIZ0gIdr7CX+dueONJl
X-Gm-Gg: ASbGnctgtGBYTJuTa8FLy2zX/oLYXwJzMpZzwCwIDpZqgCsrCUpVsafXi2EXKXXBrH7
	buyTeXg6oxUd0OwEw1vYyitMD7bzKCNJk99g+xuAFN49tgShQcvdQ+FznZ7QyQaCvNPMu7QCw3Y
	aFgEsz5WxcHAEXT9+rhQA/Vm/wrDh3yxE6gyiRwmrt+gZdoD6QOGY8nsaY60/Ioy29Iug9MX0J5
	OnGtdwaUpavebeyhWeOt9FaQi1h79bElWaDps0xDj496ZXTITFj9zeBJiUHL1ZqaiHwggM4NBW0
	mBc40FHKqhfZkSIo78HLjdxVltXIEu16mJgptWM4yb6sSrkJJPRMqOYkXIdLrjvPAy/K
X-Google-Smtp-Source: AGHT+IGxle0Pugye4rent2lMIcPwZ47wsaBbMX1BhsVHHkmUBRn0FfDSOtBkQoRNMI4zIxQIDeMqgy6ha0Ymhly1skE=
X-Received: by 2002:a53:b549:0:b0:624:555c:a835 with SMTP id
 956f58d0204a3-6361a8023b9mr14677532d50.26.1759160544631; Mon, 29 Sep 2025
 08:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250927054916.363249-1-raj.khem@gmail.com> <DD58OIBLT47Z.3P8U5S8JBWJGF@bootlin.com>
In-Reply-To: <DD58OIBLT47Z.3P8U5S8JBWJGF@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Sep 2025 08:41:57 -0700
X-Gm-Features: AS18NWCe-ijZdes0pySb9vOq2RSiX5qwsGhzZGT8gqhsvLRfeEVoaE80sA8lVr0
Message-ID: <CAMKF1srYnsuqBaa8bB8RE6SnvqenOvT9HxhvXH6eryVuL1xm-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gn: Add recipe
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 15:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224151

On Mon, Sep 29, 2025 at 4:15=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Sat Sep 27, 2025 at 7:49 AM CEST, Khem Raj via lists.openembedded.org =
wrote:
> > gn is a commonly used build tool to generate ninja files, used
> > in a lot of recipes e.g. chromium, qtwebengine, perfetto, hafnium etc.
> > these recipes come from different layers e.g. meta-qt6/meta-arm/meta-oe
> >
> > since not all layers depend on meta-oe ( meta-arm does not ), its not
> > a possible option.
> >
> > Given the usecases, putting it in core will benefit the ecosystem
> > and reduce some duplication. This recipe is taken from meta-arm
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
>
> Hi Khem,
>
> It looks like the build is failing on some x86 builds:
>
> ERROR: gn-0+git-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/=
musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/gn/0+git/tem=
p/run.do_compile.3308486' failed with exit code 1
> ...
> | cc1plus: error: '-Wformat-security' ignored without '-Wformat' [-Werror=
=3Dformat-security]
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2524
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2489
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2307
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2467
>

yeah, please checkout v3, I sent earlier today

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

