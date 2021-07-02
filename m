Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.9996.1625234240099480637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 06:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JkpjHgvb;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: tolvupostur@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id a15so18226048lfr.6
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 06:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UE7K59VAPptWcFWuA+Fq5rUtS+B1AUFHIUfCtLTRzZE=;
        b=JkpjHgvbvzvP4mVggACMWNkRT77FXUANbUD9HhsaW9rDI1AG/WgdBTORXNwlfDn50U
         UbRuMsGl28WT7K2OwrlOCK3847sZ3OvimgoK4PPPzrGFXR5hIVJe1oURf6uqzDtrmQZE
         J2EFfOsT/EMXJaf2QIuXeRdtS+KtVfraORqbjUKaEb4LCTdpJrYPl0u0RHBjM1iH5ml+
         6RwiEVTBujiQ4tz7IPL3LmpqJGpdwhpq0fc97WsilYfpoOfHRKfp5XaIq62Qw4l0OlLc
         k5RMcFkQHEk+7Zn26jQTVFgaETGElCmUrBOiIiGWGqu8apU7bg5KD9ySNiwaJ4Y1/oGZ
         aCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UE7K59VAPptWcFWuA+Fq5rUtS+B1AUFHIUfCtLTRzZE=;
        b=YV61l9qyIUkSwg2Qf1tyi+9JXQtR4h+/u00c751XTkm/j8E9C2vN2C9/HaCzy94aKt
         H7LtQEAsMSZBNA+UhFkz11t9Bpd5w9j4JFuqyGFcRQDSQor7xSJf/Mv0qUXHA+sqN3Os
         HDR6oGm0Zsvuf2rwyJCWuyZLEy3tkwTR9bPJn47csxfFIVvYQilm92lfDbxobwRBWxa3
         PpFMkalz4nq5ZRFaabSTo+RTZE1jjM9Zg90ZGpz6fd3z8ZoADciI3QnXzUeABFBQTZOe
         ahUSl7fcgIcmn8/9F3fr1Dz7wWgdO8/+lEiHMTRSfbWJvqUuFGrDgYKmR9Z3q2Os06+v
         uylQ==
X-Gm-Message-State: AOAM533OYft13u6fO9z8kb7MqUBZ2/SCS5KcQVx1ub3nyZsHoAJYbfdc
	YRjn4DKy4Lwe/OTrkLICbUAPkqSxuW4CPVwSd44=
X-Google-Smtp-Source: ABdhPJzuwY73poeUiYun+yOpyO780boSzyQYEowSY2GewgK9opKWWuxDZCs+luIeOI0HUMJJ2Lyq1fMM6Zg9E1vR+jQ=
X-Received: by 2002:ac2:4187:: with SMTP id z7mr3897682lfh.574.1625234234025;
 Fri, 02 Jul 2021 06:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <168DFB55CCAE8B91.30759@lists.openembedded.org>
In-Reply-To: <168DFB55CCAE8B91.30759@lists.openembedded.org>
From: "Einar Gunnarsson" <tolvupostur@gmail.com>
Date: Fri, 2 Jul 2021 15:57:03 +0200
Message-ID: <CABhNV22NUYR0EU4Dr4zPKoNPcEK-QcOPZNWaTe8fWsGZrJnKFQ@mail.gmail.com>
Subject: Re: [OE-core] [update-rc.d][PATCH] update-rc.d: Fix enable/disable command
To: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000322e7305c624559a"

--000000000000322e7305c624559a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I forgot the third error in this line:
Links numbered 91 or higher will create a single digit link.

# update-rc.d -v  -n smack disable
rename /etc/rc2.d/S91smack -> /etc/rc2.d/K9smack

I guess this fixes all three:

printf -v newnn "%02d" $((100-${oldnn#0}))

How do I resubmit a patch?


On Fri, 2 Jul 2021 at 15:10, Einar Gunnarsson via lists.openembedded.org
<tolvupostur=3Dgmail.com@lists.openembedded.org> wrote:

> $[] is a bashism and does not work on POSIX shells
>
> enable/disable on links numbered 08 and 09 gives the error:
> 'bash: 100-08: value too great for base (error token is "08")'
>
> Signed-off-by: Einar Gunnarsson <tolvupostur@gmail.com>
> ---
>  update-rc.d | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/update-rc.d b/update-rc.d
> index c9355d7..24ac752 100644
> --- a/update-rc.d
> +++ b/update-rc.d
> @@ -114,7 +114,7 @@ renamelink()
>          # or stop link to start link with a sequence number equal to th=
e
> difference of 100 minus the original sequence number.
>         if ls ${etcd}${lev}.d/${oldstartstop}*${bn} >/dev/null 2>&1; the=
n
>                 oldnn=3D`basename ${etcd}${lev}.d/${oldstartstop}*${bn}|=
cut
> -c2-3`
> -               newnn=3D$[100-$oldnn]
> +               newnn=3D$((100-${oldnn#0}))
>                 [ $verbose -eq 1 ] && echo "rename
> ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn} ->
> ${etcd}${lev}.d/${newstartstop}${newnn}${bn}"
>                 if [ $notreally -eq 0 ];then
>                         mv ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn}
> ${etcd}${lev}.d/${newstartstop}${newnn}${bn}
> --
> 2.17.1
>
>
>=20
>
>

--=20
Regards
Einar J=C3=B3n
+31 610 957234

--000000000000322e7305c624559a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I forgot the third error in this line:<br>Links numbered 9=
1 or higher will create a single digit link.<br><br># update-rc.d -v =C2=A0=
-n smack disable<br>rename /etc/rc2.d/S91smack -&gt; /etc/rc2.d/K9smack<br>=
<br>I guess this fixes all three:<br><br>printf -v newnn &quot;%02d&quot; $=
((100-${oldnn#0}))<br><br>How do I resubmit a patch?<br><br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 2 Jul 2=
021 at 15:10, Einar Gunnarsson via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;tolvupostur=3D<a href=3D"mailto:gmail.com@=
lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">$[] is a bashism an=
d does not work on POSIX shells<br>
<br>
enable/disable on links numbered 08 and 09 gives the error:<br>
&#39;bash: 100-08: value too great for base (error token is &quot;08&quot;=
)&#39;<br>
<br>
Signed-off-by: Einar Gunnarsson &lt;<a href=3D"mailto:tolvupostur@gmail.co=
m" target=3D"_blank">tolvupostur@gmail.com</a>&gt;<br>
---<br>
=C2=A0update-rc.d | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/update-rc.d b/update-rc.d<br>
index c9355d7..24ac752 100644<br>
--- a/update-rc.d<br>
+++ b/update-rc.d<br>
@@ -114,7 +114,7 @@ renamelink()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# or stop link to start link with a sequ=
ence number equal to the difference of 100 minus the original sequence numb=
er.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ls ${etcd}${lev}.d/${oldstartstop}*${bn} &g=
t;/dev/null 2&gt;&amp;1; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oldnn=3D`basename =
${etcd}${lev}.d/${oldstartstop}*${bn}|cut -c2-3`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newnn=3D$[100-$old=
nn]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newnn=3D$((100-${o=
ldnn#0}))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ $verbose -eq 1 ]=
 &amp;&amp; echo &quot;rename ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn} =
-&gt; ${etcd}${lev}.d/${newstartstop}${newnn}${bn}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $notreally -e=
q 0 ];then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mv ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn} ${etcd}${lev}.d=
/${newstartstop}${newnn}${bn}<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">Regards<br>Einar J=C3=B3n<br>+31 610 957234</di=
v>

--000000000000322e7305c624559a--
