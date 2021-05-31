Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web08.48387.1622488815285762907
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 12:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ad8OtOcV;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id s15so6529965vsi.4
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 12:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ns7X6upM32fXdGMKA22G52u4LGN+YHENcBY1i8dMfKo=;
        b=Ad8OtOcV9x4rReQ7AVZlWC6CFDTR8h/KjZidK6U0E5BiZxNfZ5M4l3HNzABLR1eIlA
         6myaN9TIz4Q13W20XBaDoJbj1lUW/XnF3DmTnR+VzI7RDFQY9CffEhu3Uhvj8/MZYCCZ
         j+9YGC0x8+SWv5gkAQlD9UlSMZxDrp0gxELYDMctSoL2DiUHwgFn0M07T2N6i99aWkQ0
         jqcDS8EjfFS+wM70l5PHKNrZUT1v0f7zc+Oblwe0mpqUsJoZOeFLd9VoVIrYsMAgvbKx
         DuNIQI4vqsr9Bywy9ATsi66yy0FPHjPlWZLCRbO54NH+trqITi+Gwp+A+iqEIKV+64XH
         F9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ns7X6upM32fXdGMKA22G52u4LGN+YHENcBY1i8dMfKo=;
        b=PdUXZSTBX395GDPDOs6Ymr4Ikucn2UJeCK0h71usMqH4tGkq1kRn9YgcktQV6JnsgT
         cUEagDFiJiLcIidSfm3E349lBy+aNNmhhD5ybA41TdWcQERfhXueCG6VoR+hp6BQ/9NB
         1tldmg/uEdjrGSfwKeD/Ctw5OVcG2kdaoSG032krbP20dN9fZk8BFXdz3ew2lzBFafQB
         vvCtiW/h5v5wSfK6ySeEsPrIdd7b00VWj5fXsSNURp+FK/3AiJa+vM5glm4vqKap/Rn7
         nl81ay+IQ0MYS9Ug5aVFOYYg6FRMg2ogL3tDZMRJXI/kr4mJ+m6gYZhcVQ+D4gskrN2W
         KpQA==
X-Gm-Message-State: AOAM5335BfJcI1v+GGF3KlZdWgj/4/HkfYyYiDitYJDvsh0bN8OACkZ6
	EAx8vVgbuTCqtjl4pbfmoeOWuGXh6E+0jdHC9t8=
X-Google-Smtp-Source: ABdhPJzblAR5Yfjij/x+iNsMa4Zl5ca+aOzEcxshfhEDlhrUQFrABrj3Z2RZroMP/gEDZgoI7ufRUIgRJs7HD2Tkjek=
X-Received: by 2002:a67:c401:: with SMTP id c1mr14958801vsk.51.1622488814406;
 Mon, 31 May 2021 12:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210531191158.964098-1-akuster808@gmail.com>
In-Reply-To: <20210531191158.964098-1-akuster808@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 31 May 2021 21:20:03 +0200
Message-ID: <CANNYZj-X3rLL4d-7ufJUtDPKf=s+494Kcmz_Px-ihzi2dViLkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] RFC???
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006f4f3405c3a51dbd"

--0000000000006f4f3405c3a51dbd
Content-Type: text/plain; charset="UTF-8"

If you attach log.do_rootfs, that would help. It is supposed to contain
full information about the failure, and I would not want to start
special-casing those.

Alex

On Mon, 31 May 2021 at 21:12, Armin Kuster <akuster808@gmail.com> wrote:

> I ran into an issue with a systemd service that had a depend.
> The post init error message was a bit misleading;
>
> ERROR: security-build-image-1.0-r0 do_rootfs: Postinstall scriptlets of
> ['clamav-daemon'] have failed. If the intention is to defer them to first
> boot,
> then please place them into pkg_postinst_ontarget_${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
> Details of the failure are in
> /home/build/builds/master/tmp/work/qemux86_64-poky-linux/security-build-image/1.0-r0/temp/log.do_rootfs.
>
> All I found was a python trace back in the logs. I have provided a version
> of an
> error message that I hope is acceptable. The second patch is for RPM
> adapting
> to use the 'error message' to help provide a bit more info.
>
> The RPM solusion has been tested and before porting this to the other
> package managers, I want to make sure the 'error message' was accepted.
>
>
>
> Armin Kuster (2):
>   systemctl: Stop tracebacks use formated error messages
>   package_manager/rpm: decode systemctl failures
>
>  meta/lib/oe/package_manager/rpm/__init__.py   |  3 +++
>  .../systemd/systemd-systemctl/systemctl       | 24 +++++++++++++++----
>  2 files changed, 22 insertions(+), 5 deletions(-)
>
> --
> 2.25.1
>
>
> 
>
>

--0000000000006f4f3405c3a51dbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If you attach log.do_rootfs, that would help. It is s=
upposed to contain full information about the failure, and I would not want=
 to start special-casing those.</div><div><br></div><div>Alex<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, 31 May 2021 at 21:12, Armin Kuster &lt;<a href=3D"mailto:akuster808@gma=
il.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">I ran into an issue with a systemd service that=
 had a depend.<br>
The post init error message was a bit misleading;<br>
<br>
ERROR: security-build-image-1.0-r0 do_rootfs: Postinstall scriptlets of [&=
#39;clamav-daemon&#39;] have failed. If the intention is to defer them to f=
irst boot,<br>
then please place them into pkg_postinst_ontarget_${PN} ().<br>
Deferring to first boot via &#39;exit 1&#39; is no longer supported.<br>
Details of the failure are in /home/build/builds/master/tmp/work/qemux86_6=
4-poky-linux/security-build-image/1.0-r0/temp/log.do_rootfs.<br>
<br>
All I found was a python trace back in the logs. I have provided a version=
 of an<br>
error message that I hope is acceptable. The second patch is for RPM adapt=
ing<br>
to use the &#39;error message&#39; to help provide a bit more info.<br>
<br>
The RPM solusion has been tested and before porting this to the other<br>
package managers, I want to make sure the &#39;error message&#39; was acce=
pted.<br>
<br>
<br>
<br>
Armin Kuster (2):<br>
=C2=A0 systemctl: Stop tracebacks use formated error messages<br>
=C2=A0 package_manager/rpm: decode systemctl failures<br>
<br>
=C2=A0meta/lib/oe/package_manager/rpm/__init__.py=C2=A0 =C2=A0|=C2=A0 3 ++=
+<br>
=C2=A0.../systemd/systemd-systemctl/systemctl=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
24 +++++++++++++++----<br>
=C2=A02 files changed, 22 insertions(+), 5 deletions(-)<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000006f4f3405c3a51dbd--
