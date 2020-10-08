Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web11.24.1602194467872034892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 15:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AKT/dbfi;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id h74so1687868vkh.6
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 15:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ktZIwnK92uXlGbrvrSy3B/ZzZlCPdIC63Z0fNwWx5Hs=;
        b=AKT/dbfi6vnXUiHqzjMI+7NR/i+Ji0mm263LZSdiwF0IhfeXx1hqCujkKjqjuO1u2i
         ekzanyM1UHrMCqAU7E01jV+spRXSBKWunt0FNUDgJxdRlWsTd+fVYglimlWYmW4tmnBX
         /yuX4IFjJUVcZIy/bAXkukCG6nQJGieElGuDAVlY5CEYoSZZ+oke8tWgSfegWSJywxs0
         PMUEna0fTQZHN/Mp+fmGnfgHh9JrQZeEV+oSuRhrOPyxBxOUgkwV8MyncY+EYudeTolY
         s0WQAmmDT64gw4TT8BYZJJTVYaUkv3btTMKf+JjrHIHecJTeqrFRLf2GPfHzkHYhdPzr
         5NbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ktZIwnK92uXlGbrvrSy3B/ZzZlCPdIC63Z0fNwWx5Hs=;
        b=iDGFHAbLeecDRvFgQZKXKDgP52UtUvYL1pYrSxjsp+EY9E+JqFa9nrIWhn4uEG2bhx
         WzBbLhWKQT1cfZ2A/ForV57ixOc5yYraQPfdC1+eA3Bqx1Ntsd+9axaIjA+0ssKbOaUF
         yegh7uvgU9dM5j9xaDpUlVqxcptdqelo30QoVpUNbytsgDbi/RCmFRXvY13dYF3tOD5S
         1WP5VXjSI/Dh2X/MlgA3rKdxTYEMVZysfHM4eff6dqyZFMVPXTVppRN9VMfNzx4WMxRH
         FVrVWcEMK4kcMImOop+8P9/SeKmMH5882VWsL5xRs9N+6FBeJBV5LtK7PEO4zrVKaOR9
         B8ug==
X-Gm-Message-State: AOAM531nVcLJ0HCklnabQ2OOGlzaAJsdiAb/bXR0pBFZIj4ciJV++WHT
	jA+vW5TPWyhfustZ5F9D9X2NcURxlap4BxYLpKE=
X-Google-Smtp-Source: ABdhPJwvP441lH8LEFigXxypmePOmInI3cyC57/enFYn4AlGg08+2n/GfETh/Ixm9sOYlT3LbpCc35Hb0/M83ykCDts=
X-Received: by 2002:a1f:a1cb:: with SMTP id k194mr6178258vke.10.1602194466982;
 Thu, 08 Oct 2020 15:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <aNp1.1602154243596831287.CumO@lists.openembedded.org>
 <CANNYZj9oAoE_Se7HPd3y=sce9Mak-6n9zEBqyxikZr8trgJQvw@mail.gmail.com> <DB6PR0801MB203898E9E50E203D01B848C98D0B0@DB6PR0801MB2038.eurprd08.prod.outlook.com>
In-Reply-To: <DB6PR0801MB203898E9E50E203D01B848C98D0B0@DB6PR0801MB2038.eurprd08.prod.outlook.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 9 Oct 2020 00:00:55 +0200
Message-ID: <CANNYZj_RSJHxOYOWk=LGFKqbS3TH937J3HZtTn79drkM-HpgTQ@mail.gmail.com>
Subject: Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM default strengths
To: Brett Warren <Brett.Warren@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000010cde305b12ff8d4"

--00000000000010cde305b12ff8d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you provide a bit more context? Why is that setting desirable to have
in meta-arm's machine definition?

The problem with setting QB_MEM in machine configurations is that differen=
t
images need completely different amounts of memory; for some (such as ptes=
t
images) even 1024 is not enough, for others (core-image-minimal) 256 is
plenty. The right place to set this is in the image recipes, with qemuboot
class providing the smallest possible default.

Alex

On Thu, 8 Oct 2020 at 13:51, Brett Warren <Brett.Warren@arm.com> wrote:

> Do you mean instead of the machine configuration changing QB_MEM, it
> should be done via another image recipe?
>
> For context, I'm trying to enable the following line in qemuarm.confv
> (meta-arm):
>
> QB_MEM =3D "-m 1024"
>
> This is prevented by core-image-sato.bb overriding it instead.
>
> Brett
> ------------------------------
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* 08 October 2020 12:36
> *To:* Brett Warren <Brett.Warren@arm.com>
> *Cc:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM
> default strengths
>
> Isn=E2=80=99t it better to just make a custom image recipe instead?
>
> Alex
>
> On Thu 8. Oct 2020 at 12.53, Brett Warren <brett.warren@arm.com> wrote:
>
> Previously, to satisfy opengl's requirement for at least 512MB
> of memory, QB_MEM was overriden by core-image-sato. This made it
> impossible for machine configurations to specify their own values,
> so this was changed to a default asssignment. To accomodate this,
> qemuboot's default assignment of QB_MEM was changed to the week
> variant.
>
> Signed-off-by: Brett Warren <brett.warren@arm.com>
> ---
>  meta/classes/qemuboot.bbclass               | 2 +-
>  meta/recipes-sato/images/core-image-sato.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbcla=
ss
> index d8f62ef6ea..8e4ee9e49b 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -73,7 +73,7 @@
>  # IMAGE_CLASSES +=3D "qemuboot"
>  # See "runqemu help" for more info
>
> -QB_MEM ?=3D "-m 256"
> +QB_MEM ??=3D "-m 256"
>  QB_SERIAL_OPT ?=3D "-serial mon:stdio -serial null"
>  QB_DEFAULT_KERNEL ?=3D "${KERNEL_IMAGETYPE}"
>  QB_DEFAULT_FSTYPE ?=3D "ext4"
> diff --git a/meta/recipes-sato/images/core-image-sato.bb
> b/meta/recipes-sato/images/core-image-sato.bb
> index 673106eb6d..ec5e2e20fc 100644
> --- a/meta/recipes-sato/images/core-image-sato.bb
> +++ b/meta/recipes-sato/images/core-image-sato.bb
> @@ -11,5 +11,5 @@ inherit core-image
>  TOOLCHAIN_HOST_TASK_append =3D " nativesdk-intltool nativesdk-glib-2.0"
>  TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext =3D " nativesdk-intlto=
ol
> nativesdk-glib-2.0"
>
> -QB_MEM =3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512",=
 "-m
> 256", d)}'
> +QB_MEM ?=3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512"=
,
> "-m 256", d)}'
>  QB_MEM_qemumips =3D "-m 256"
> --
> 2.17.1
>=20
>
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy t=
he
> information in any medium. Thank you.
>

--00000000000010cde305b12ff8d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you provide a bit more context? Why is that setti=
ng desirable to have in meta-arm&#39;s machine definition?<br></div><div><b=
r></div><div>The problem with setting QB_MEM in machine configurations is t=
hat different images need completely different amounts of memory; for some =
(such as ptest images) even 1024 is not enough, for others (core-image-mini=
mal) 256 is plenty. The right place to set this is in the image recipes, wi=
th qemuboot class providing the smallest possible default.</div><div><br></=
div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, 8 Oct 2020 at 13:51, Brett Warren &lt;<a hre=
f=3D"mailto:Brett.Warren@arm.com">Brett.Warren@arm.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
Do you mean instead of the machine configuration changing QB_MEM, it shoul=
d be done via another image recipe?</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
For context, I&#39;m trying to enable the following line in qemuarm.confv =
(meta-arm):</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
QB_MEM =3D &quot;-m 1024&quot;</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
This is prevented by <a href=3D"http://core-image-sato.bb" target=3D"_blan=
k">core-image-sato.bb</a> overriding it instead.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
Brett<br>
</div>
<div id=3D"gmail-m_6381717516290056119appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_6381717516290056119divRplyFwdMsg" dir=3D"ltr"><font sty=
le=3D"font-size:11pt" face=3D"Calibri, sans-serif" color=3D"#000000"><b>Fro=
m:</b> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
<b>Sent:</b> 08 October 2020 12:36<br>
<b>To:</b> Brett Warren &lt;<a href=3D"mailto:Brett.Warren@arm.com" target=
=
=3D"_blank">Brett.Warren@arm.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"=
mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembe=
dded-core@lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM d=
efault strengths</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"auto">Isn=E2=80=99t it better to just make a custom image reci=
pe instead?</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Alex</div>
<div><br>
<div>
<div dir=3D"ltr">On Thu 8. Oct 2020 at 12.53, Brett Warren &lt;<a href=3D"=
mailto:brett.warren@arm.com" target=3D"_blank">brett.warren@arm.com</a>&gt;=
 wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
Previously, to satisfy opengl&#39;s requirement for at least 512MB<br>
of memory, QB_MEM was overriden by core-image-sato. This made it<br>
impossible for machine configurations to specify their own values,<br>
so this was changed to a default asssignment. To accomodate this,<br>
qemuboot&#39;s default assignment of QB_MEM was changed to the week<br>
variant.<br>
<br>
Signed-off-by: Brett Warren &lt;<a href=3D"mailto:brett.warren@arm.com" ta=
rget=3D"_blank">brett.warren@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/qemuboot.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-<br>
=C2=A0meta/recipes-sato/images/<a href=3D"http://core-image-sato.bb" targe=
t=3D"_blank">core-image-sato.bb</a> | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass=
<br>
index d8f62ef6ea..8e4ee9e49b 100644<br>
--- a/meta/classes/qemuboot.bbclass<br>
+++ b/meta/classes/qemuboot.bbclass<br>
@@ -73,7 +73,7 @@<br>
=C2=A0# IMAGE_CLASSES +=3D &quot;qemuboot&quot;<br>
=C2=A0# See &quot;runqemu help&quot; for more info<br>
=C2=A0<br>
-QB_MEM ?=3D &quot;-m 256&quot;<br>
+QB_MEM ??=3D &quot;-m 256&quot;<br>
=C2=A0QB_SERIAL_OPT ?=3D &quot;-serial mon:stdio -serial null&quot;<br>
=C2=A0QB_DEFAULT_KERNEL ?=3D &quot;${KERNEL_IMAGETYPE}&quot;<br>
=C2=A0QB_DEFAULT_FSTYPE ?=3D &quot;ext4&quot;<br>
diff --git a/meta/recipes-sato/images/<a href=3D"http://core-image-sato.bb=
" target=3D"_blank">core-image-sato.bb</a> b/meta/recipes-sato/images/<a hr=
ef=3D"http://core-image-sato.bb" target=3D"_blank">core-image-sato.bb</a><b=
r>
index 673106eb6d..ec5e2e20fc 100644<br>
--- a/meta/recipes-sato/images/<a href=3D"http://core-image-sato.bb" targe=
t=3D"_blank">core-image-sato.bb</a><br>
+++ b/meta/recipes-sato/images/<a href=3D"http://core-image-sato.bb" targe=
t=3D"_blank">core-image-sato.bb</a><br>
@@ -11,5 +11,5 @@ inherit core-image<br>
=C2=A0TOOLCHAIN_HOST_TASK_append =3D &quot; nativesdk-intltool nativesdk-g=
lib-2.0&quot;<br>
=C2=A0TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext =3D &quot; nativesd=
k-intltool nativesdk-glib-2.0&quot;<br>
=C2=A0<br>
-QB_MEM =3D &#39;${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;o=
pengl&quot;, &quot;-m 512&quot;, &quot;-m 256&quot;, d)}&#39;<br>
+QB_MEM ?=3D &#39;${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;=
opengl&quot;, &quot;-m 512&quot;, &quot;-m 256&quot;, d)}&#39;<br>
=C2=A0QB_MEM_qemumips =3D &quot;-m 256&quot;<br>
-- <br>
2.17.1 <br>
<br>
<br>
</blockquote>
</div>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</div>

</blockquote></div>

--00000000000010cde305b12ff8d4--
