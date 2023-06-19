Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F010EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 23:21:07 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.21890.1687216866471852416
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 16:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kLjfCseL;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-62de5392c7bso26449816d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 16:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687216865; x=1689808865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GpvEru6+tWdSHbCGH/1JmeocyJVNbmL2B4TXd62dV6k=;
        b=kLjfCseL/FDZ/1lTlRVNKJuLg2EddQh6S1dp0jPCdRs1fyav740PH+yKD5TE1pAEIn
         VqoarabNJxoVzhzDNvI+4NbLBN+bvYlHTJdeI3UywJndnblEK4QWmaJ2ldYy9aYvbjJN
         sPTAW0GJkcnyotxc8Kw6OT7pHmlgk+yHrKVnzm7trTFFCu+JsunJ4mU1iRnwxL6C17Uw
         VihRVDzNnF/NZcuRNu+pSfars8r8mWsgxd7rjJLcXXkUKNDpQQU1bvSG0Ep48k0FHl6Q
         BHzwprxmLaSUo21NsVVTG30j5pZyo3IcTCyu3unDpzgSSYRQKvW/hlet99LeL1Ugwyb9
         b2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687216865; x=1689808865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GpvEru6+tWdSHbCGH/1JmeocyJVNbmL2B4TXd62dV6k=;
        b=Czx7Jyngko8ziWKBoSw97ZG5Rszc4fJbNzVzkb2QIetSG0XG8KJARaxXQnNXaWHrjy
         PElp0CIbDnBUKMpgTSc6I6b0FgBoKk0uS8QR4to8sCuimLZvbKnHptDcWj7J21vyXr8c
         Eqx+P8BUq3ignf7qUhOFFXq2QZP3T6cmYY6Bhq+sno2Zbyekf+H6r5LCodqkhGPs46pJ
         cDi+4l0wd3VIfL5NqO4bqQI6SemoHFQNM1sC9ufU8DN5Btf7lHYsLRkGqlKmLJRB4KsV
         y8m5bP5kd6x0FwJd+fWEPmYybzrtFck8YjNSZXyh2JrxAve2r0hj8g36WWRdZrA7PZ0s
         u5YA==
X-Gm-Message-State: AC+VfDxDwKjoAEBFwTuTcXNiq7r+Q1cprCcKQb1RWqg/8KxTLls25EFd
	W7++Q0kPtg2KhnWtuaJQETnFdMw7MVyv3ssZsYk=
X-Google-Smtp-Source: ACHHUZ6dVAFw78QQ5DLT2P+z5k4vVDw/AYIoR4RFxtUkewCP5w1TcEXepPu0cYmRCtFOBfqa8+a9fjxSBPnX+pxzyuU=
X-Received: by 2002:a05:6214:1242:b0:626:169e:7700 with SMTP id
 r2-20020a056214124200b00626169e7700mr13393777qvv.9.1687216865480; Mon, 19 Jun
 2023 16:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230215130057.1923450-1-jose.quaresma@foundries.io>
 <CAP9ODKrs24T2V1Ks8yeWbT+_6FLWdc4wy8iybKQpjxPhOhctAw@mail.gmail.com>
 <CANPvuRm+Df-HVCi-KDOUPzKeUJz9VvznSKLVu1vWCK9Fx+YOoA@mail.gmail.com>
 <jwqv8k26mv2.fsf@axis.com> <CANPvuRmKaCc36+7ra0is3RUk_nKJEpwKWD0BzWWxX3e0iGb0-w@mail.gmail.com>
 <DB5PR02MB1021369B7BC87D237D5E6C7FDEFA19@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CANPvuRn7-H+QFWdC5n0e7nf-XWXZsVcAuX=KT7axrNKoSiwM-w@mail.gmail.com> <DB5PR02MB10213359F2E09206BA8420559EF58A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213359F2E09206BA8420559EF58A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 20 Jun 2023 00:20:54 +0100
Message-ID: <CANPvuRkjQdZGDTMdzPqwJR3a5_st-tQeA5rg1CWM5Rc8U7suLg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] kernel-module-split: make autoload and
 probeconf distribution specific
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Ola x Nilsson <Ola.x.Nilsson@axis.com>, 
	Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Jose Quaresma <jose.quaresma@foundries.io>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ed14bd05fe83c9f7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 23:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183124

--000000000000ed14bd05fe83c9f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia sexta,
16/06/2023 =C3=A0(s) 17:03:

> Did anything ever become of this? This is a change that at least we would
> appreciate.
>

Hi Pete,

V2 send with your suggestions:
https://lists.openembedded.org/g/openembedded-core/message/183123

Thanks for the remainder

Jose


>
>
> //Peter
>
>
>
> *From:* Jose Quaresma <quaresma.jose@gmail.com>
> *Sent:* den 17 februari 2023 17:53
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* Ola x Nilsson <Ola.x.Nilsson@axis.com>; Otavio Salvador <
> otavio.salvador@ossystems.com.br>; Jose Quaresma <
> jose.quaresma@foundries.io>; openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core][PATCH 1/2] kernel-module-split: make autoload
> and probeconf distribution specific
>
>
>
> Hi Peter,
>
>
>
> Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia sexta,
> 17/02/2023 =C3=A0(s) 10:52:
>
> Wouldn=E2=80=99t the easiest solution be to define two variables:
>
> modulesloaddir ??=3D "${sysconfdir}/modules-load.d "
> modprobedir ??=3D "${sysconfdir}/modprobe.d "
>
> then in init-manager-systemd.inc you could change them to:
>
> modulesloaddir ?=3D "${nonarch_libdir}/modules-load.d"
> modprobedir ?=3D "${nonarch_base_libdir}/modprobe.d"
>
> Using a single prefix variable doesn=E2=80=99t really work since they nee=
d
> different paths in the latter case.
>
>
> I was thinking of something similar to what you suggest but only on the
> class:
>
> modulesloaddir ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '${nonarch_libdir}', '${sysconfdir}', d)}"
> modprobedir ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '${nonarch_base_libdir}', '${sysconfdir}', d)}"
>
>
>
> Anyway your approach looks good to me too so i'll use yours, hope I can
> test it next week.
>
>
>
> Jose
>
>
>
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
>
>
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

--000000000000ed14bd05fe83c9f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Peter Kjellerstedt &lt;<a href=3D"mai=
lto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; escrev=
eu no dia sexta, 16/06/2023 =C3=A0(s) 17:03:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div class=3D"msg7403212755073492290">





<div lang=3D"SV" style=3D"overflow-wrap: break-word;">
<div class=3D"m_7403212755073492290WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
Did anything ever become of this? This is a change that at least we would a=
ppreciate.</span></p></div></div></div></blockquote><div><br>Hi Pete,</div>=
<div><br></div><div>V2 send with your=C2=A0suggestions:<br></div><div><a hr=
ef=3D"https://lists.openembedded.org/g/openembedded-core/message/183123">ht=
tps://lists.openembedded.org/g/openembedded-core/message/183123</a><br><br>=
<div>Thanks=C2=A0for the remainder</div><div><br></div>Jose</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"ms=
g7403212755073492290"><div lang=3D"SV" style=3D"overflow-wrap: break-word;"=
><div class=3D"m_7403212755073492290WordSection1"><p class=3D"MsoNormal"><s=
pan lang=3D"EN-US" style=3D"color:rgb(148,54,52)"><u></u><u></u></span></p>
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
=3D"EN-US"> Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt;
<br>
<b>Sent:</b> den 17 februari 2023 17:53<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
<b>Cc:</b> Ola x Nilsson &lt;<a href=3D"mailto:Ola.x.Nilsson@axis.com" targ=
et=3D"_blank">Ola.x.Nilsson@axis.com</a>&gt;; Otavio Salvador &lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salva=
dor@ossystems.com.br</a>&gt;; Jose Quaresma &lt;<a href=3D"mailto:jose.quar=
esma@foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;; <a=
 href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank"=
>openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core][PATCH 1/2] kernel-module-split: make autoload=
 and probeconf distribution specific<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Hi Peter,<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjell=
erstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt; esc=
reveu no dia sexta, 17/02/2023 =C3=A0(s) 10:52:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
Wouldn=E2=80=99t the easiest solution be to define two variables:</span><u>=
</u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;c=
olor:rgb(148,54,52)">modulesloaddir ??=3D &quot;${sysconfdir}/modules-load.=
d &quot;</span><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"><br>
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:rgb(148,54,=
52)">modprobedir ??=3D &quot;${sysconfdir}/modprobe.d &quot;</span><span la=
ng=3D"EN-US" style=3D"color:rgb(148,54,52)"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
then in
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:rgb(148,54,=
52)">init-manager-systemd.inc</span><span lang=3D"EN-US" style=3D"color:rgb=
(148,54,52)"> you could change them to:</span><span lang=3D"EN-US"><u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;c=
olor:rgb(148,54,52)">modulesloaddir ?=3D &quot;${nonarch_libdir}/modules-lo=
ad.d&quot;<br>
modprobedir ?=3D &quot;${nonarch_base_libdir}/modprobe.d&quot;<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
Using a single prefix variable doesn=E2=80=99t really work since they need =
different paths in the latter case.</span><span lang=3D"EN-US"><u></u><u></=
u></span></p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
</span>I was thinking of something=C2=A0similar to what you suggest but onl=
y on the class:<br>
<br>
modulesloaddir ??=3D &quot;<a href=3D"mailto:$%7b@bb.utils.contains(&#39;DI=
STRO_FEATURES&#39;,%20&#39;systemd&#39;,%20&#39;$%7bnonarch_libdir%7d&#39;,=
%20&#39;$%7bsysconfdir%7d&#39;,%20d)%7d" target=3D"_blank">${@bb.utils.cont=
ains(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;${nonarch_libdir}&#=
39;, &#39;${sysconfdir}&#39;, d)}</a>&quot;<br>
modprobedir ??=3D &quot;<a href=3D"mailto:$%7b@bb.utils.contains(&#39;DISTR=
O_FEATURES&#39;,%20&#39;systemd&#39;,%20&#39;$%7bnonarch_base_libdir%7d&#39=
;,%20&#39;$%7bsysconfdir%7d&#39;,%20d)%7d" target=3D"_blank">${@bb.utils.co=
ntains(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;${nonarch_base_li=
bdir}&#39;, &#39;${sysconfdir}&#39;, d)}</a>&quot;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Anyway your approach looks good to me too so i&#39;l=
l use yours, hope I can test it next week.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Jose<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
//Peter</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
=C2=A0</span><u></u><u></u></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US">
<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blan=
k">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:opene=
mbedded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@li=
sts.openembedded.org</a>&gt;
<b>On Behalf Of </b>Jose Quaresma<br>
<b>Sent:</b> den 16 februari 2023 12:08<br>
<b>To:</b> Ola x Nilsson &lt;<a href=3D"mailto:Ola.x.Nilsson@axis.com" targ=
et=3D"_blank">Ola.x.Nilsson@axis.com</a>&gt;<br>
<b>Cc:</b> Otavio Salvador &lt;<a href=3D"mailto:otavio.salvador@ossystems.=
com.br" target=3D"_blank">otavio.salvador@ossystems.com.br</a>&gt;; Jose Qu=
aresma &lt;<a href=3D"mailto:jose.quaresma@foundries.io" target=3D"_blank">=
jose.quaresma@foundries.io</a>&gt;;
<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blan=
k">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core][PATCH 1/2] kernel-module-split: make autoload=
 and probeconf distribution specific</span><u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">Ola x Nilsson &lt;<a href=3D"mailto:ola.x.nilsson@ax=
is.com" target=3D"_blank">ola.x.nilsson@axis.com</a>&gt; escreveu no dia qu=
inta, 16/02/2023 =C3=A0(s) 08:22:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
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
<p class=3D"MsoNormal">--
<u></u><u></u></p>
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
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
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

</div></blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></=
div></div>

--000000000000ed14bd05fe83c9f7--

