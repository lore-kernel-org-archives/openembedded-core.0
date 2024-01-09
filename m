Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636E6C47079
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 18:42:42 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.25216.1704825754709931453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 10:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kkejhe7u;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6dbb8698312so1115932a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 10:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704825754; x=1705430554; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsXmVDkPjPnkD2MwjXBMdWMZIAQHBe+jT3aK0jMND84=;
        b=Kkejhe7u+NVAEfVOAe2kEU+dt4e0vctwDdrvb8/8Z8+J2Xtxs+eFCNLxgMLwhJeR4J
         IXNi7bFK/LRelOLtS+flxqkJLoCt9voSFj780jQZibkC3FvxtTr/j8YUZvw3cihvTglH
         6QUu21AWI05+soSCq/884ZgWLWvYe3a1LK7ee42eFEhn4afmTO8mcffD0KorNfE3m5fi
         SkuJ6q/Mqbh59qcJwqRrs7BphYVfgopgWKZQIoDpRhKo//sng7+NliM5NCZRd2Z9Dizu
         CNbvp6BjcbW/gQ69SNTWu4Llmqf1pD8QPVfetKKk7siuIO2250mduOGHw9cVRWe3Cag9
         a/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704825754; x=1705430554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsXmVDkPjPnkD2MwjXBMdWMZIAQHBe+jT3aK0jMND84=;
        b=DovvgIF+ataNhAAQ8tkOpYfxzeIS/3IjAXHyFNhb5k213ouuppyUVnMKWAGnzR9lsh
         qy2kxsKDWm/CJyB43eQ+ZD9YebqEerx/dYK53xh22UG9aJa4fnwNZ85vgV7gNQNWvRMt
         noGGjlSk9xllzsx+Dir5Mbx1JnW0BmhB/STwiXD6+JkCaJJ7dIRaWjGiLnmrpwRh6xRK
         8zgNMcfM2fkHKYWyt1DZy3bDai36309Y3kteLAnN1ehoJdOKMKhgAxLJyf1GYCEs6Eqr
         VrwwwOjDsuMjucsxXH5GwfjxP7AbAyNzJ/uB1fdEFZrjYOhdITdiLWvFHJ0aWg18ggw2
         9rEw==
X-Gm-Message-State: AOJu0YzCsiv+teSe0xyTb9ehv1/01N+IMuqVvKOIhC1d7Qj/g3kC9TJZ
	CrioCul4jw+OYAqVx5ynX0JFJY2o2U05u3rGapQ=
X-Google-Smtp-Source: AGHT+IEtP5On2i7H8i7CRMRR0jBPniC3zFyH4qFXY5zTUja97ptmOhTZbsu/782erO8Bxsb2WwI7RJqjeG4/QhnM9ds=
X-Received: by 2002:a05:6870:898f:b0:204:4044:55c0 with SMTP id
 f15-20020a056870898f00b00204404455c0mr3120079oaq.98.1704825753862; Tue, 09
 Jan 2024 10:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20240104021052.754030-1-raj.khem@gmail.com> <20240104021052.754030-2-raj.khem@gmail.com>
 <B4F308F7-3C8A-4609-8F98-FB0B374428FA@arm.com>
In-Reply-To: <B4F308F7-3C8A-4609-8F98-FB0B374428FA@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jan 2024 10:42:07 -0800
Message-ID: <CAMKF1sovMVfNm-n2kv32S==9yrrwLKgMcfO20AjNhxd6GKmMEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] quilt,cpio: Create ptest user when ptest is
 enabled in distro features
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 18:42:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193476

lets drop this patch. The issue with chgrp seems to be gone, must have
been transitory as I was narrowing down the opkg-utils bug.

On Tue, Jan 9, 2024 at 8:05=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 4 Jan 2024, at 02:10, Khem Raj via lists.openembedded.org <raj.khem=3D=
gmail.com@lists.openembedded.org> wrote:
> > -# The tests need to run as a non-root user, so pull in the ptest user
> > -DEPENDS:append:class-target =3D "${@bb.utils.contains('PTEST_ENABLED',=
 '1', ' ptest-runner', '', d)}"
> > -PACKAGE_WRITE_DEPS +=3D "ptest-runner"
> > +# The tests need to run as a non-root user
> > +USERADD_PACKAGES =3D "${PN}-ptest"
> > +USERADD_PARAM:${PN}-ptest =3D "--system --home /nonexistent --no-creat=
e-home --user-group ptest=E2=80=9D
>
> The original lines were intended to pull in the ptest user that the ptest=
-runner recipe creates.  Why is that not sufficient?
>
> Ross

