Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2500EC636D6
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 16:53:25 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web11.11506.1676652804077857445
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Feb 2023 08:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cm4HybRq;
 spf=pass (domain: gmail.com, ip: 209.85.221.180, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id o136so1311760vkc.12
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 08:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tlxgal3laE9oEiTn1ipxjtZ/T7QYb81Vh6CDYJhBqRI=;
        b=cm4HybRq4+MKhElX6BtU6JwyaY2wQTPP+telPojr2IoXtWGLZmakUvWoLd6/dM7fbr
         pjobqxlncRASni3G0LNcG5XOUKJIznQJnsTPMhoDVKrEj7rNDbOX4788wHh108OUErc7
         dxBU0GFvjTrezRSwzn1iBdquDr6Vtu/szmh3Ov37EmjDlonq9PxL1tcIVVQFD996Ij1E
         crB2VEqkUftXjSoyhqdzC6bym+fSVeSexUbI4ad4DDdsLtA9VLo5B/uzoDDUjv2DfJW1
         6rXAoElOCxFwfiPSLiB/DQ2rBNA7Nk4mikZ28U7MYlWlRoTfjV/mN0JMZf0eraERluF4
         ++cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tlxgal3laE9oEiTn1ipxjtZ/T7QYb81Vh6CDYJhBqRI=;
        b=CHtDf0p09jgDpmD4iRraIEc6WFiJuE4n/h7YHVysjHpIsPPjzsmuFtnX8P7zfWq37g
         b4gTEct4JlVpfJKU73QPuhEbYQeUtkIrDv854htfB50RP/5nVLBnwUislOQIocxkXCwf
         wOaMoxlpe9AlGA9j6j82YULdVikfFkpc8OrcadYVRR1N+wynIJtA/Byc6MgQj2weUY0X
         J7zGQCf3CKNjoKIOxw7CSo/Be6/YGRr7kaOfXim2bqLmebpOf47EX5vLUz356rcNiZ+X
         rnLOWLjeUA61QfVDLUAaF0HQz5v1wpK4SmaqJpeY8muCTuAlbTI53T/g+dKp1v8FWr3/
         9bdg==
X-Gm-Message-State: AO0yUKVlXmOduhP3MkdWejkc2iGzQIpnmYfqSjD7UDIYF5vdoPffIw9z
	4oBF0NJpwxLRH+GLZNjo2Eoyp0oRw6RxsWqExAs=
X-Google-Smtp-Source: AK7set8a0sKoDznV2VQ39BoOukE6h/lG7rMQFTxi8S+1C5S3hBQjHb2GonfCVvxaEfNlyz5pKCe73cuGM6NPNytbrOs=
X-Received: by 2002:a1f:2a86:0:b0:3b7:5ff7:cfb8 with SMTP id
 q128-20020a1f2a86000000b003b75ff7cfb8mr75041vkq.11.1676652802928; Fri, 17 Feb
 2023 08:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20230215130057.1923450-1-jose.quaresma@foundries.io>
 <CAP9ODKrs24T2V1Ks8yeWbT+_6FLWdc4wy8iybKQpjxPhOhctAw@mail.gmail.com>
 <CANPvuRm+Df-HVCi-KDOUPzKeUJz9VvznSKLVu1vWCK9Fx+YOoA@mail.gmail.com>
 <jwqv8k26mv2.fsf@axis.com> <CANPvuRmKaCc36+7ra0is3RUk_nKJEpwKWD0BzWWxX3e0iGb0-w@mail.gmail.com>
 <DB5PR02MB1021369B7BC87D237D5E6C7FDEFA19@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB1021369B7BC87D237D5E6C7FDEFA19@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 17 Feb 2023 16:53:11 +0000
Message-ID: <CANPvuRn7-H+QFWdC5n0e7nf-XWXZsVcAuX=KT7axrNKoSiwM-w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] kernel-module-split: make autoload and
 probeconf distribution specific
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Ola x Nilsson <Ola.x.Nilsson@axis.com>, 
	Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Jose Quaresma <jose.quaresma@foundries.io>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000baf3af05f4e8265f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 16:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177312

--000000000000baf3af05f4e8265f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia sexta,
17/02/2023 =C3=A0(s) 10:52:

> Wouldn=E2=80=99t the easiest solution be to define two variables:
>
>
>
> modulesloaddir ??=3D "${sysconfdir}/modules-load.d "
>
> modprobedir ??=3D "${sysconfdir}/modprobe.d "
>
>
>
> then in init-manager-systemd.inc you could change them to:
>
>
>
> modulesloaddir ?=3D "${nonarch_libdir}/modules-load.d"
>
> modprobedir ?=3D "${nonarch_base_libdir}/modprobe.d"
>
>
>
> Using a single prefix variable doesn=E2=80=99t really work since they nee=
d
> different paths in the latter case.
>

I was thinking of something similar to what you suggest but only on the
class:

modulesloaddir ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
'${nonarch_libdir}', '${sysconfdir}', d)}"
modprobedir ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
'${nonarch_base_libdir}', '${sysconfdir}', d)}"

Anyway your approach looks good to me too so i'll use yours, hope I can
test it next week.

Jose


>
>
> //Peter
>
>
>
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> *On Behalf Of *Jose Quaresma
> *Sent:* den 16 februari 2023 12:08
> *To:* Ola x Nilsson <Ola.x.Nilsson@axis.com>
> *Cc:* Otavio Salvador <otavio.salvador@ossystems.com.br>; Jose Quaresma <
> jose.quaresma@foundries.io>; openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core][PATCH 1/2] kernel-module-split: make autoload
> and probeconf distribution specific
>
>
>
>
>
> Ola x Nilsson <ola.x.nilsson@axis.com> escreveu no dia quinta, 16/02/2023
> =C3=A0(s) 08:22:
>
>
> On Wed, Feb 15 2023, Jose Quaresma wrote:
>
> > Hi Octavio,
> >
> > Otavio Salvador <otavio.salvador@ossystems.com.br<mailto:
> otavio.salvador@ossystems.com.br>> escreveu no dia quarta, 15/02/2023
> =C3=A0(s) 13:25:
> > Em qua., 15 de fev. de 2023 =C3=A0s 10:01, Jose Quaresma
> > <quaresma.jose@gmail.com<mailto:quaresma.jose@gmail.com>> escreveu:
> >>
> >> The modules-load.d [1] - Configure kernel modules to load at boot
> >> should install their configuration files in /usr/lib/modules-load.d.
> >>
> >> The modprobe.d [2] - Configuration directory for modprobe
> >> should install their configuration files in /lib/modprobe.d
> >>
> >> [1]
> https://www.freedesktop.org/software/systemd/man/modules-load.d.html
> >> [2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html
> <https://www.man7.org/linux/man-pages/man5/modprobe.d.5.html>
> >>
> >> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io<mailto:
> jose.quaresma@foundries.io>>
> >
> >
> > Did you validate this using busybox only? Using sysv and busybox need
> > to be validated as well.
> >
> > Please drop this patch series because it doesn work with busybox.
> >
> > Looks like busybox don't support other path than /etc:
> >
> https://git.busybox.net/busybox/tree/modutils/modprobe.c?id=3D669c40ed8eb=
f480c95ce36135104e474e361a7e6#n658
> >
> > So I need to implement this in another way, maybe relocating the files
> from /etc only when systemd is enabled.
> >
> > Thanks for raising the issue.
> >
> > Jose
> >
>
> Hi,
>
> Please consider https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12212
> as well.
>
> --
> Ola x Nilsson
>
>
> Hi Ola,
>
> We use usermerge too but I think the weird issue here is we need to have
> this distribution specified only for systemd
>
> excluding busybox and sysint as pointed out by Octavio.
>
> The other solution is adding support on busybox and sysint if needed.
>
> My idea is add a prefix variable with path "/etc" by default but
> conditioned by systemd DISTRO_FEATURES
>
> Thanks for the bug hint.
>
> --
>
> Best regards,
>
>
> Jos=C3=A9 Quaresma
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000baf3af05f4e8265f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Peter Kjellerstedt &lt;<a href=3D"mailto:pet=
er.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; escreveu no d=
ia sexta, 17/02/2023 =C3=A0(s) 10:52:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div class=3D"msg-2277121170819939049">





<div lang=3D"SV" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-2277121170819939049WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
Wouldn=E2=80=99t the easiest solution be to define two variables:<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;c=
olor:rgb(148,54,52)">modulesloaddir ??=3D &quot;${sysconfdir}/modules-load.=
d &quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;c=
olor:rgb(148,54,52)">modprobedir ??=3D &quot;${sysconfdir}/modprobe.d &quot=
;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
then in
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:rgb(148,54,=
52)">init-manager-systemd.inc</span><span lang=3D"EN-US" style=3D"color:rgb=
(148,54,52)"> you could change them to:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;c=
olor:rgb(148,54,52)">modulesloaddir ?=3D &quot;${nonarch_libdir}/modules-lo=
ad.d&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;c=
olor:rgb(148,54,52)">modprobedir ?=3D &quot;${nonarch_base_libdir}/modprobe=
.d&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;c=
olor:rgb(148,54,52)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
Using a single prefix variable doesn=E2=80=99t really work since they need =
different paths in the latter case.</span></p></div></div></div></blockquot=
e><div><br>I was thinking of something=C2=A0similar to what you suggest but=
 only on the class:<br><br>modulesloaddir ??=3D &quot;${@bb.utils.contains(=
&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;${nonarch_libdir}&#39;, =
&#39;${sysconfdir}&#39;, d)}&quot;<br>modprobedir ??=3D &quot;${@bb.utils.c=
ontains(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;${nonarch_base_l=
ibdir}&#39;, &#39;${sysconfdir}&#39;, d)}&quot;</div><div><br></div><div>An=
yway your approach looks good to me too so i&#39;ll use yours, hope I can t=
est it next week.</div><div><br></div><div>Jose</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-227712117081=
9939049"><div lang=3D"SV" style=3D"overflow-wrap: break-word;"><div class=
=3D"m_-2277121170819939049WordSection1"><p class=3D"MsoNormal"><span lang=
=3D"EN-US" style=3D"color:rgb(148,54,52)"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
//Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
<u></u>=C2=A0<u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"=
mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembe=
dded-core@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>Jose Quaresma<br>
<b>Sent:</b> den 16 februari 2023 12:08<br>
<b>To:</b> Ola x Nilsson &lt;<a href=3D"mailto:Ola.x.Nilsson@axis.com" targ=
et=3D"_blank">Ola.x.Nilsson@axis.com</a>&gt;<br>
<b>Cc:</b> Otavio Salvador &lt;<a href=3D"mailto:otavio.salvador@ossystems.=
com.br" target=3D"_blank">otavio.salvador@ossystems.com.br</a>&gt;; Jose Qu=
aresma &lt;<a href=3D"mailto:jose.quaresma@foundries.io" target=3D"_blank">=
jose.quaresma@foundries.io</a>&gt;; <a href=3D"mailto:openembedded-core@lis=
ts.openembedded.org" target=3D"_blank">openembedded-core@lists.openembedded=
.org</a><br>
<b>Subject:</b> Re: [OE-core][PATCH 1/2] kernel-module-split: make autoload=
 and probeconf distribution specific<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">Ola x Nilsson &lt;<a href=3D"mailto:ola.x.nilsson@ax=
is.com" target=3D"_blank">ola.x.nilsson@axis.com</a>&gt; escreveu no dia qu=
inta, 16/02/2023 =C3=A0(s) 08:22:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal"><br>
On Wed, Feb 15 2023, Jose Quaresma wrote:<br>
<br>
&gt; Hi Octavio,<br>
&gt;<br>
&gt; Otavio Salvador &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br=
" target=3D"_blank">otavio.salvador@ossystems.com.br</a>&lt;mailto:<a href=
=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salva=
dor@ossystems.com.br</a>&gt;&gt; escreveu no dia quarta,
 15/02/2023 =C3=A0(s) 13:25:<br>
&gt; Em qua., 15 de fev. de 2023 =C3=A0s 10:01, Jose Quaresma<br>
&gt; &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quare=
sma.jose@gmail.com</a>&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt; escreveu:<br>
&gt;&gt;<br>
&gt;&gt; The modules-load.d [1] - Configure kernel modules to load at boot<=
br>
&gt;&gt; should install their configuration files in /usr/lib/modules-load.=
d.<br>
&gt;&gt;<br>
&gt;&gt; The modprobe.d [2] - Configuration directory for modprobe<br>
&gt;&gt; should install their configuration files in /lib/modprobe.d<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://www.freedesktop.org/software/systemd/man/mo=
dules-load.d.html" target=3D"_blank">
https://www.freedesktop.org/software/systemd/man/modules-load.d.html</a><br=
>
&gt;&gt; [2] <a href=3D"https://www.man7.org/linux/man-pages/man5/modprobe.=
d.5.html" target=3D"_blank">
https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@f=
oundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&lt;mailto:<a =
href=3D"mailto:jose.quaresma@foundries.io" target=3D"_blank">jose.quaresma@=
foundries.io</a>&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; Did you validate this using busybox only? Using sysv and busybox need<=
br>
&gt; to be validated as well.<br>
&gt;<br>
&gt; Please drop this patch series because it doesn work with busybox.<br>
&gt;<br>
&gt; Looks like busybox don&#39;t support other path than /etc:<br>
&gt; <a href=3D"https://git.busybox.net/busybox/tree/modutils/modprobe.c?id=
=3D669c40ed8ebf480c95ce36135104e474e361a7e6#n658" target=3D"_blank">
https://git.busybox.net/busybox/tree/modutils/modprobe.c?id=3D669c40ed8ebf4=
80c95ce36135104e474e361a7e6#n658</a><br>
&gt;<br>
&gt; So I need to implement this in another way, maybe relocating the files=
 from /etc only when systemd is enabled.<br>
&gt;<br>
&gt; Thanks for raising the issue.<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
<br>
Hi,<br>
<br>
Please consider <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?i=
d=3D12212" target=3D"_blank">
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12212</a><br>
as well.<br>
<br>
-- <br>
Ola x Nilsson<u></u><u></u></p>
</blockquote>
</div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">Hi Ola,<br>
<br>
We use usermerge too but I think the weird issue here is we need to have th=
is distribution=C2=A0specified only for systemd<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">excluding busybox and sysint as pointed out by Octav=
io.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">The other solution is a=
dding support on busybox and sysint if needed.<br>
<br>
My idea is add a prefix variable with path &quot;/etc&quot; by default but =
conditioned=C2=A0by systemd=C2=A0DISTRO_FEATURES<br>
<br>
Thanks for the bug hint.<u></u><u></u></p>
</div>
<p class=3D"MsoNormal">-- <u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Best regards,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><br>
Jos=C3=A9 Quaresma<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>J=
os=C3=A9 Quaresma</div></div></div></div>

--000000000000baf3af05f4e8265f--

