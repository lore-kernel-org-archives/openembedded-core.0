Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web12.57.1623430021969362987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 09:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BDi2RYG3;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id x8so4105402vso.5
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 09:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SJrLYqpA7Rjj9PtXjVw8acARSSxiLWyDiklsvZ5yAmg=;
        b=BDi2RYG3f1eHfW+APMCu9QFazKalB7S4RvHLwf4JkofAYwFD/hwmLF1wlwHtfL1GDr
         RXcMc91VhaekTprBt1br+dKMz94pVYw917E44MPIRCFSZynSRMAcNOrvRRKkBqD3L8dM
         3ip4cHPz3JwMP6xF0wwqeklhHd0OrHckjSc97APd7tEez9g+0Mh4BkNBskzsl2BZpKy1
         M/aVr2iTKcpv2a8QdC6nWDowOOKTLOKkVIik7/7QoydRRC22c+CVGCQ8tSe7JvDt9zD6
         pJS5YHW4bQsj7VrqOyd0EoP/06gJH0o8JA4/yw6c5jmXYsFZwxS4N/TDczk/ih0n2c3J
         ilAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SJrLYqpA7Rjj9PtXjVw8acARSSxiLWyDiklsvZ5yAmg=;
        b=F5+4/1zbEwRV+s3ZP7h2+VW3hZ26mok+pgVHgk6mgpqu1VbFjogm3kiGpR8uEtbqdR
         Tc0jgwqdH0jiX9e+wNv1n6W7s1j2Hjgziw3SoUjW3MhT5cMyyPoCByKKJev+VIWbrg5m
         4Q5p17XWYDkIHeYwSyPutPlgXRtOoMRNL44nec7LGlQfddKHFr/kLM7a6TAr4BMF8jum
         diJFULANUc8d/ANHVaEWismBH6DWnkwx7jRvMcrYru0QwaI8hHfPIGKHaync8eaV8uGV
         FWewP6wrhchXU5Vg6BoMdzSDueDEdh83YbzEy7ckDxUEMFlsdYFxW2BkHp2cVmhgiX1N
         9MBw==
X-Gm-Message-State: AOAM532WABYQr/wl8+BP33Yu71CAy0hkQlJUYJGqPJbouO4v5Bu8wXDx
	UA4ncXjgSf4DO9YUTAqiQ4ryRJcKE3lyuxbBdCo=
X-Google-Smtp-Source: ABdhPJxfEMrNI7nE5ZIE7X6FdZ+PMyzQmZlJl3zZmzYZlN5kNXxrbg7eExry6ASIFGYujoapLJXezO+xkCqO45pKXdE=
X-Received: by 2002:a67:f4cb:: with SMTP id s11mr1398150vsn.20.1623430021104;
 Fri, 11 Jun 2021 09:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200925070535.59518-1-hongxu.jia@windriver.com>
 <20200925070535.59518-2-hongxu.jia@windriver.com> <b50d160f-c94d-0616-3845-d93bbc45851a@windriver.com>
In-Reply-To: <b50d160f-c94d-0616-3845-d93bbc45851a@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 11 Jun 2021 18:46:49 +0200
Message-ID: <CANNYZj8b_iC-5toQG4X7gPV7xGcT9pYMZTq-cQZvGeDPYPy6WQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/4] initramfs-framework/udev: umount /run/media/XXX
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: hongxu <hongxu.jia@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000b9c8d005c4804127"

--000000000000b9c8d005c4804127
Content-Type: text/plain; charset="UTF-8"

At this point it's probably better to rebase and resend?

Alex

On Fri, 11 Jun 2021 at 09:30, Yu, Mingli <mingli.yu@windriver.com> wrote:

> Ping.
>
> Thanks,
>
> On 9/25/20 3:05 PM, hongxu wrote:
> > In initramfs-framework, udev (initramfs-module-udev) calls hook mount.sh
> to
> > mount /run/media/XXX which is used by setup-live
> (initramfs-module-setup-live).
> > The setup-live calls install-XXX.sh and use /run/media/XXX to do
> installation
> >
> > The side effect is while setup-live is not used, after it switches to
> rootfs,
> > and the mounted disk could not be released
> >
> > Release the mounted disk before switch root and after kill udev
> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >   meta/recipes-core/initrdscripts/initramfs-framework/udev | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev
> b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> > index 4898b89246..8b62080c68 100644
> > --- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
> > +++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> > @@ -8,6 +8,11 @@ udev_shutdown_hook_handler() {
> >       if [ "$status" = "pre" ] && [ "$module" = "finish" ]; then
> >               udevadm settle
> >               killall `basename $_UDEV_DAEMON` 2>/dev/null
> > +
> > +             # Umount other media which is mounted by udev
> > +             for dir in `awk '/\/dev.* \/run\/media/{print $2}'
> /proc/mounts`; do
> > +                     umount $dir
> > +             done
> >       fi
> >   }
> >
> >
> >
> >
> >
> >
>
> 
>
>

--000000000000b9c8d005c4804127
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>At this point it&#39;s probably better to rebase and =
resend?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 11 Jun 2021 at 09:30=
, Yu, Mingli &lt;<a href=3D"mailto:mingli.yu@windriver.com">mingli.yu@windr=
iver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Ping.<br>
<br>
Thanks,<br>
<br>
On 9/25/20 3:05 PM, hongxu wrote:<br>
&gt; In initramfs-framework, udev (initramfs-module-udev) calls hook mount=
.sh to<br>
&gt; mount /run/media/XXX which is used by setup-live (initramfs-module-se=
tup-live).<br>
&gt; The setup-live calls install-XXX.sh and use /run/media/XXX to do inst=
allation<br>
&gt; <br>
&gt; The side effect is while setup-live is not used, after it switches to=
 rootfs,<br>
&gt; and the mounted disk could not be released<br>
&gt; <br>
&gt; Release the mounted disk before switch root and after kill udev<br>
&gt; <br>
&gt; Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.=
com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-core/initrdscripts/initramfs-framework/udev =
| 5 +++++<br>
&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev=
 b/meta/recipes-core/initrdscripts/initramfs-framework/udev<br>
&gt; index 4898b89246..8b62080c68 100644<br>
&gt; --- a/meta/recipes-core/initrdscripts/initramfs-framework/udev<br>
&gt; +++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev<br>
&gt; @@ -8,6 +8,11 @@ udev_shutdown_hook_handler() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; =3D &quot;pre&quot=
; ] &amp;&amp; [ &quot;$module&quot; =3D &quot;finish&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udevadm settle<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0killall `basena=
me $_UDEV_DAEMON` 2&gt;/dev/null<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Umount other media=
 which is mounted by udev<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dir in `awk &#39=
;/\/dev.* \/run\/media/{print $2}&#39; /proc/mounts`; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0umount $dir<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div>

--000000000000b9c8d005c4804127--
