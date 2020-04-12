Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.8974.1586686938707932426
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2020 03:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WESDVdRJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id c63so6766740qke.2
        for <Openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2020 03:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lt56qrQgIOi/rHhAb7vrRRBRwOA+t6V+WkV+sfGOTEQ=;
        b=WESDVdRJWdMf2OupJ3aIIdKF2vNJzegWIEOBOTRJkodXnm8PHhZQ5dqWyiucLPmeCr
         IqUCToE6wF28YSKzQnJiJB4yYTHZ4HuuhmYDbiVmL9/zREGIHqXRshwXIK3bmSL6fDfD
         KkMP6St2/iAHpHBa1T54c/O9T69CSjUGivdFle3iGJJC9FaEF3HXEVkeS7Ml+RGWgR0J
         fH0QiBgDV0FEGXDHl8SmqteZOXj5kaOrxbE6QQPwu2ebfd3ygF0uiicerCy16xV++UQK
         4ifJbgMfx4/0dDfRbC62u0YqYDzDpjXFpTMXh3SnOjV1lx5mPCdIIIc/C+iJ+6o3kvY8
         QwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lt56qrQgIOi/rHhAb7vrRRBRwOA+t6V+WkV+sfGOTEQ=;
        b=tWQovrTC1gmrxMscgr8+aX1Bup8dgx8IMpMP+wOTh7zWkzw++UGmfZzB22Zv27SrWX
         hS6tlXQ2ZYY7D8cHrM8UN0vtAVbmnGgVMsk07AwyXg48af+llhLHdxu7GclpSOZHvJ72
         v9G+3XqARq44PH6y4/uVty++eT4U3kv6457LskdgmAmZKWc9cZUvEFTGUX4fqfxQ+KcV
         ffc6dpfo+fKFF8WyNbQl7r0ZwuiTbZOHBmNbeDdHs/rQbGl9J2mBvWEnnhwBv+ovVzA4
         WdDJgjDO6AQdg4vlWLaCCykJKd3zRVhgxIb579sjwu2j4lA1heLQ0vgxU3/BqRx2SefF
         GlBA==
X-Gm-Message-State: AGi0PuZ9Fm8ZlhEz9KMR/kcowA0vZC56N9zZbaIoK7UVXlxl6+0D+U15
	dXn7CU0aqlbT2Is3aMYUx+lB+Ql+pvsWFPqwC9oThJNuwwI=
X-Google-Smtp-Source: APiQypJb67cfEfAwPcwFQycf6HF7156vy7VQh/4m01iTCqhMCTq1pUYt9juO1PrAYlsxZp/+o6kolWbHouAQ7ZJtlLQ=
X-Received: by 2002:a37:4bd1:: with SMTP id y200mr12198278qka.205.1586686936753;
 Sun, 12 Apr 2020 03:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcVyxL9c3x0z9cv6EYads+LGeYL4ccwFbnnvyA_gkx9MXg@mail.gmail.com>
 <CANNYZj8uEXS9GwmZj4rONX_FodL1J8Wj0VKcL6v77pco8rEAEA@mail.gmail.com> <16033A51DDD27CA9.6498@lists.openembedded.org>
In-Reply-To: <16033A51DDD27CA9.6498@lists.openembedded.org>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Sun, 12 Apr 2020 15:52:05 +0530
Message-ID: <CANUMPcW49n6eWnOd7AGqcEFhMhnhBaxFd0KS=Ae4iJ_tgVyjFA@mail.gmail.com>
Subject: Re: [OE-core] librsvg-2.46.4 recipe build failure.
To: Openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, rwmacleod@gmail.com, umesh.kalappa0@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi,

FYI, below changes in librsvg_2.46.4 fixes the build failures.

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.46.4.bb
b/meta/recipes-gnome/librsvg/librsvg_2.46.4.bb
index ec0df450bf..1a99a30ccc 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.46.4.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.46.4.bb
@@ -14,13 +14,14 @@ SECTION = "x11/utils"
 DEPENDS = "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
 BBCLASSEXTEND = "native"

-inherit cargo gettext gnomebase gobject-introspection gtk-doc
pixbufcache upstream-version-is-even
+inherit gettext gnomebase gobject-introspection gtk-doc pixbufcache
upstream-version-is-even

 SRC_URI[archive.md5sum] = "aca4001b267de77924b786886a1ad64a"
 SRC_URI[archive.sha256sum] =
"b45b9ee3b64c58baaf800bcdff5fcd04d79930dba4c56e46e0d3b0aead40cc29"
 SRC_URI[archive.sha1sum] = "7ad4b036296a48d3cb043fd1a23644ddf1b90269"
 SRC_URI[archive.sha384sum] =
"0587784fe1b757983df1067cc18e6f7a37654cfae33bf4c5a4e249f22376dd66a756019dc2ba5761359cef782aa8a206"
 SRC_URI[archive.sha512sum] =
"abb4d9eeef62b778092269446987f3c8205cd260c253d5e70a9e3c562b9b23a64c76562d7bb53eadc9c12cca8a1cb52009f9b9d78695cc6970fe7e14b9ba10a0"
+inherit cargo

 CARGO_DISABLE_BITBAKE_VENDORING = "1"

On Mon, Apr 6, 2020 at 5:50 PM Vinay Kumar via lists.openembedded.org
<vinay.m.engg=gmail.com@lists.openembedded.org> wrote:
>
> I confirmed by below steps,
>
> If we consider only  "inherit cargo gettext" in librsvg-2.46.4.bb
> run.do_compile contain "cargo_do_compile".
>
> When we use  gnomebase as  "inherit cargo gettext gnomebase" librsvg
> run.do_compile generated with "autotools_do_compile" in it and it
> comes through autotools.bbclass
>
> Regards,
> Vinay
>
> On Mon, Apr 6, 2020 at 1:58 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > The upstream tree still uses auto tools for the build, so the issue you are seeing is probably caused by something else?
> >
> > Ale
> >
> > On Mon 6. Apr 2020 at 9.00, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >> Regarding, https://github.com/meta-rust/meta-rust/issues/264
> >>
> >> As per my analysis the
> >> "openembedded-core/meta/classes/autotools.bbclass" inherited through
> >> "openembedded-core/meta/classes/gnomebase.bbclass" from  seems to be
> >> overriding the "meta-rust/classes/cargo.bbclass" from meta-rust.
> >>
> >> $cat openembedded-core/meta/classes/gnomebase.bbclass
> >>
> >> GNOMEBASEBUILDCLASS ??= "autotools"
> >> inherit ${GNOMEBASEBUILDCLASS}  pkgconfig
> >>
> >> The "librsvg" configure  and compile  scripts in "temp" directory
> >> contains "autotools_do_compile" with "inherit cargo", it should be
> >> "cargo_do_compile".
> >>
> >> Reference:
> >> "bitbake rust-hello-world" builds without any error ( with "inherit cargo").
> >>
> >> Is there any way to disable "autotools" for "gnomebase.bbclass"
> >> through "librsvg-2.46.4.bb"  ?
> >>
> >> Regards,
> >> Vinay
> >>
> 
