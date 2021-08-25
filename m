Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web11.22354.1629928989843903535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 15:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d9xB4n+M;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id d16so581920vsf.12
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 15:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sGWcFVLu4oA2X4C5DPraZsQp2ul14Yyyky8+PUw9q3s=;
        b=d9xB4n+MRKoR/K3KQdExUSYZHEHfKyM2xOcCDSVvnbWQ6hu+zKohpLNsAqa3g2jSHQ
         xO/8F77R3xOzDTg8IpPfjgrsIn0vl9kmyuCWJt1Y3S7aTC2jhSFAEcQo4v1/xc5wZAU8
         +l5G9ob5JAvVOwOvz8pXrfFyG6zu02kGRRgT4HfaelCn7kJpBiYc8+1q+xN/yENxixcV
         QAblplV0+413fHP/Br13Vyck1k0dQgDKj+gQL5NxlVnbOwBgSFuPRtKOVRm+dUN5uVzg
         ptAEX5KIKGBn7VgHP9Jjp5iRQa1TQIhvbzmdxK7mHKucjid/RxL7FonpN1xhDJHqaNsk
         2EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sGWcFVLu4oA2X4C5DPraZsQp2ul14Yyyky8+PUw9q3s=;
        b=KY8CK9c813hpQnFHmgUF7ZeAvYxcH8MSl0tmnGNGgkBKtNMgXZNc4qRPFOq3iskQL1
         LhwnmoOScPxZ3h1F5SboAQ6MONRmJHdYUy3vwMKkhRQKQHhFK/gpflnK+v2wKr1I+9Xi
         Cu4MuV5TI9HOVDgBZyP3O+ejKiHlWqhrNuPRz/2dfJejChaqYMVVtBITSZyCdGq/sGkJ
         Nb4p9fN50sIhcb1LmgjVVin+oAanCoaPHsQVt2lZnUoA9lrngwiJ9ADMAbpyF6usfdkM
         Uwjw4W2CTD++BbaJpOIA6cQCRIRNhQTspUoDu7C1sCcu0z7PTtk0lHhY6W+MRaHRF+nP
         pKog==
X-Gm-Message-State: AOAM532TDGr0N9HcUiQ7a3vsaq4kQy7UpXcLCM6BTG7PCqarKIC7AHY7
	mU7S2kTucd8RnuJZUrOkimlCDi0uY11WUyPjoPc=
X-Google-Smtp-Source: ABdhPJwdGRutkyk4lOoD3Ew43Y2wTjSkj73hU0o3tkvXUZRx7RiOKK/H6dRP+IUz9tWlkAdNu9Nq2VY0NmQr5UoBlE4=
X-Received: by 2002:a67:c792:: with SMTP id t18mr382949vsk.54.1629928988988;
 Wed, 25 Aug 2021 15:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210825163520.Horde.SwfJDAmwq6x_Wn-Vf4FoTSG@crashcourse.ca>
 <CANNYZj-PJQTLydecmn9EpWdci5wWce_9Tkw_QkOGkProY6t_fQ@mail.gmail.com>
 <20210825171222.Horde.pjbNvErvPswYBwDudrNTUaM@crashcourse.ca>
 <3FDCF22A-7038-4B36-B15D-D59C31F61C86@pbcl.net> <20210825175143.Horde.LbItpKT-Y6zl0vjVCim0eFh@crashcourse.ca>
In-Reply-To: <20210825175143.Horde.LbItpKT-Y6zl0vjVCim0eFh@crashcourse.ca>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 26 Aug 2021 00:02:57 +0200
Message-ID: <CANNYZj9risHPrhCMDEb7bpe8xsC_k08istpzp5T+EgZQensUng@mail.gmail.com>
Subject: Re: [OE-core] what means the test 'if [ -z "$D" ]' in a pkg_postinst routine?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Phil Blundell <pb@pbcl.net>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000065d74805ca696a1a"

--00000000000065d74805ca696a1a
Content-Type: text/plain; charset="UTF-8"

It used to be that 'exit 1' was the way to defer to boot time, but that was
changed long time ago to not be ambiguous like that and cause a real
failure at build time. Deferring to first boot needs to be explicitly
requested with _ontarget() (you can read the definition for it to see what
really happens, how $D is used and how request to defer is made).

Alex

On Wed, 25 Aug 2021 at 23:51, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
> Quoting Phil Blundell <pb@pbcl.net>:
>
> > That's testing for offline installation. If $D is not set, it's
> > running on the target.
> >
> > p.
>
>    one last query before i head off for dinner ... so what about
> pkg_postinst() routines that do double duty, like this one from
> dbus_1.12.20.bb:
>
>
> PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES','systemd
> sysvinit','systemd-systemctl-native','',d)}"
> pkg_postinst:dbus() {
>          # If both systemd and sysvinit are enabled, mask the dbus-1
> init script
>          if ${@bb.utils.contains('DISTRO_FEATURES','systemd
> sysvinit','true','false',d)}; then
>                  if [ -n "$D" ]; then
>                          OPTS="--root=$D"
>                  fi
>                  systemctl $OPTS mask dbus-1.service
>          fi
>
>          if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
>                  /etc/init.d/populate-volatile.sh update
>          fi
> }
>
>
> note how that routine checks its context and, as i recall (but
> it's not documented in the docs i'm looking at), i'd swear that
> i read somewhere that if a pkg_postinst() routine fails at image
> creation time, it was deferred until boot time, which would
> explain the above routine checking its runtime context.
>
>    anyway, off for food.
>
> rday
>
>
> 
>
>

--00000000000065d74805ca696a1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It used to be that &#39;exit 1&#39; was the way to de=
fer to boot time, but that was changed long time ago to not be ambiguous li=
ke that and cause a real failure at build time. Deferring to first boot nee=
ds to be explicitly requested with _ontarget() (you can read the definition=
 for it to see what really happens, how $D is used and how request to defer=
 is made).<br></div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 25 Aug 2021 =
at 23:51, Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca" tar=
get=3D"_blank">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><br>
Quoting Phil Blundell &lt;<a href=3D"mailto:pb@pbcl.net" target=3D"_blank">=
pb@pbcl.net</a>&gt;:<br>
<br>
&gt; That&#39;s testing for offline installation. If $D is not set, it&#39;=
s=C2=A0 <br>
&gt; running on the target.<br>
&gt;<br>
&gt; p.<br>
<br>
=C2=A0 =C2=A0one last query before i head off for dinner ... so what about<=
br>
pkg_postinst() routines that do double duty, like this one from<br>
<a href=3D"http://dbus_1.12.20.bb" rel=3D"noreferrer" target=3D"_blank">dbu=
s_1.12.20.bb</a>:<br>
<br>
<br>
PACKAGE_WRITE_DEPS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;,&#39;systemd=C2=A0 <br>
sysvinit&#39;,&#39;systemd-systemctl-native&#39;,&#39;&#39;,d)}&quot;<br>
pkg_postinst:dbus() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If both systemd and sysvinit are enable=
d, mask the dbus-1=C2=A0 <br>
init script<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_FEATU=
RES&#39;,&#39;systemd=C2=A0 <br>
sysvinit&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot=
;$D&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0OPTS=3D&quot;--root=3D$D&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl $OP=
TS mask dbus-1.service<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$D&quot; ] &amp;&amp; [ -e =
/etc/init.d/populate-volatile.sh ] ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/etc/init.d/p=
opulate-volatile.sh update<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
}<br>
<br>
<br>
note how that routine checks its context and, as i recall (but<br>
it&#39;s not documented in the docs i&#39;m looking at), i&#39;d swear that=
<br>
i read somewhere that if a pkg_postinst() routine fails at image<br>
creation time, it was deferred until boot time, which would<br>
explain the above routine checking its runtime context.<br>
<br>
=C2=A0 =C2=A0anyway, off for food.<br>
<br>
rday<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000065d74805ca696a1a--
