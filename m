Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E11C25B4F
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 09:52:22 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.9236.1715334734649718495
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 May 2024 02:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R63wgUbh;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e428242a38so26829711fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 02:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715334733; x=1715939533; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HioVaaTc04ykfMbtWxUEkC20t5Av8Y16j7cpTR+whYg=;
        b=R63wgUbhBEws1ux09gqL9MEW/PGBUCU90FUbHLLE71sa2KRNEJkDl7Hxxzc/f7F9Jl
         qaWR47whX5zQhPbFZgb7yMq4rZU6T+1ZOwxX4nTJtXwvViTB0OSXrHLKK0U1dwQ6Ixcb
         U7hUJb1R+yS/u77yNOGdMoUpkk/y6GgN5ma7aqCUgsprFLp853QZvAAt7H4nYR96BKoj
         cKLWFU5tFp9f+ltcIjF6WiHjhZK32cwusWZyS22b7UeeQRHWyU35ARJNvgWj9OD1PbOw
         qZoEZHcWuOELZQqYwexi+BOagSEIg47s/n/+ttrHKDPF31f444FrLbnAdqOWYDUPUYsN
         Nw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715334733; x=1715939533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HioVaaTc04ykfMbtWxUEkC20t5Av8Y16j7cpTR+whYg=;
        b=hONpfbSSzecFlVOK6jB13E8JalIV5pIboKeb58eUSb+YJxO4JdouS6dIlr69kIHau6
         UI4PVDljcjaEEfKISZhqxN2BxqNoRCT5l2r3DpTPT3OxIC6mkIdcHfVDDgTvDdgCQfOq
         Y/t8rilqt0y+mFoml+cMXBMz61bVBXymY7blTzSFfxWqZdF1vGWtXB+wURxY8hoKdyKc
         B34QowvZRidrW7Sh0LuNJf8xvFbR8F5SbsGt0oUEGMJ3MdkpW9jFnBCbmi79/LXVzhKJ
         9YVYiAy0JdLLG1Yg3MH6tktwsjv3lCe+2Or1l1rEXovIOS1FJ1lICgtjTRC5rs90VHFg
         UrAQ==
X-Gm-Message-State: AOJu0YyzgBlkWkUpmjk5GrwI4fzg2OLmVzJdW45/HyPL2PPqSlxy9xiA
	5ofwKoMYxO8AUAZ7/s3fi5Ly+eUJS0urv7ML3G0Ij8PbW5AoyV2mE4oFKGACa/8eRGm1QyrmUqu
	nTv2hNK23lvimW7hAZovitMQ6nDg=
X-Google-Smtp-Source: AGHT+IEGC5LaQkl3mOiGFkVpMmYwHky+xo1GMxaX3lxQA/wK6O/m4mbZOdYuylzobZlGlYuDH46hOfRo2ludVfX4Gp4=
X-Received: by 2002:a2e:9695:0:b0:2e0:5d7:a3a6 with SMTP id
 38308e7fff4ca-2e51fc3442emr15782171fa.9.1715334732379; Fri, 10 May 2024
 02:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240502103252.1102710-1-alex.kanavin@gmail.com> <C300C299-DA24-4A7D-9B40-B3809E44EDEF@arm.com>
In-Reply-To: <C300C299-DA24-4A7D-9B40-B3809E44EDEF@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 May 2024 11:52:01 +0200
Message-ID: <CANNYZj90WmiHqLYjiMCZ1Q+WnmWehS46pVeZpCX3=-jqct8H9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4 ->
 2.80.0, 1.78.1 -> 1.80.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 09:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199194

On Tue, 7 May 2024 at 17:47, Ross Burton <Ross.Burton@arm.com> wrote:
> packages/cortexa57-poky-linux/glib-2.0/glib-2.0-utils: FILELIST: added "/=
usr/bin/gi-compile-repository /usr/bin/gi-inspect-typelib /usr/bin/gi-decom=
pile-typelib=E2=80=9D
> packages/cortexa57-poky-linux/glib-2.0/glib-2.0-utils: PKGSIZE changed fr=
om 770935 to 1105901 (+43%)
>
> Any image that uses GSettings pulls in this package for the gsettings too=
ls.  Should these normally built-time utilities be moved to glib-2.0-codege=
n instead?

glib-2.0-codegen is meant specifically for that utility. If we need to
trim down space usage, I'd rather put gsettings stuff in its own
package, but it's not clear what is actually needed for it:

alex@Zen2:/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux=
/glib-2.0/2.80.0$
find packages-split/glib-2.0-utils/usr/bin/
packages-split/glib-2.0-utils/usr/bin/
packages-split/glib-2.0-utils/usr/bin/gtester
packages-split/glib-2.0-utils/usr/bin/gobject-query
packages-split/glib-2.0-utils/usr/bin/gio
packages-split/glib-2.0-utils/usr/bin/gresource
packages-split/glib-2.0-utils/usr/bin/glib-compile-schemas
packages-split/glib-2.0-utils/usr/bin/glib-compile-resources
packages-split/glib-2.0-utils/usr/bin/gsettings
packages-split/glib-2.0-utils/usr/bin/gdbus
packages-split/glib-2.0-utils/usr/bin/gapplication
packages-split/glib-2.0-utils/usr/bin/gi-compile-repository
packages-split/glib-2.0-utils/usr/bin/gi-decompile-typelib
packages-split/glib-2.0-utils/usr/bin/gi-inspect-typelib
packages-split/glib-2.0-utils/usr/bin/glib-gettextize
packages-split/glib-2.0-utils/usr/bin/glib-genmarshal
packages-split/glib-2.0-utils/usr/bin/glib-mkenums
packages-split/glib-2.0-utils/usr/bin/gtester-report

Alex

