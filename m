Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6F1EB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 04:11:52 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.6234.1687666307244886980
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jun 2023 21:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=F8kRyJDw;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: aehs29@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-563396d5e2aso268603eaf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 21:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687666306; x=1690258306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cEU7BzySp1r2OsVuMmoxzCpa/7+De/LZaEOrRfKC+hQ=;
        b=F8kRyJDw1KzBpaWC49HIM0ns/OduX1SvCN8HsG/sJ0/9pj1zfhDPzynSA2I9pHu/bJ
         RGTczOogXhL1i7s4tzDdoO2Nxf0kdqL0AosNlREbHa6TTi75tkwlbGhVTwzn6j2JJbCU
         6d7P7IREqIQujAdPQnAs+NvmJGimkEj9/vci5E2O5WXaN+o+GOBRTtpxyHhJtxEcBzCf
         qI0T+vKr/N+khMr2bshozDVggGsBuzuVs3ZCxcGDdEV40v6YDKq93ExeQGlPpS18mjly
         5zTcJ5t8tPn/ev6QR1l8xaAQ8VIVcmkFxiUk3eUT6F90a1WYdeYfV1LAgkt8mnBtdCUn
         hI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687666306; x=1690258306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEU7BzySp1r2OsVuMmoxzCpa/7+De/LZaEOrRfKC+hQ=;
        b=JyHqdMg265YJRx9BeEtZA+8kexHDsXg1pA1MzJG6lCpD+7KtLpxjFq0cDBi9o78S+c
         Cptw7bAXaRJZK5tVw7dweAWwqvWX2HueOfc8SULj4L/KptVwsf7d9nx7SjEiqCUMueWb
         SvQtsnMtSLObD8hwsJH/G9h+vZy0lQsj/M4+kRBwRIr+9ZW2eL4N+I9fljcHFMzacj2I
         0aPhZC05bFY3nv4z4SwT/a4IjGvzTNM4BIXIvXFrYdVFbfjUwA9dXuWh8RmrEjqQWBPs
         npiNjb4baYs4xaDTQ3L4sSSedat1NBDCrfFGoiWLjb0Qzf+vOg6/2C/2hzpX2lfCn8t3
         SnPg==
X-Gm-Message-State: AC+VfDxZ5zTv0cgSr55mGJNqA4Kga6CP/yZRbcb2HtExpnzSIp+9Ku7G
	JSdFdlR5qGiPs0sam6j7pqt926nu/5HTg5vuSp8=
X-Google-Smtp-Source: ACHHUZ5wRhxxHdl/1aVF+gp2MPv3HrCYV4JQZNe7IoG7r0zOtYiXFWKZpVMGv2DWxV3Hg1SGhnS+h+aPX3kWdMx7scc=
X-Received: by 2002:a4a:d759:0:b0:560:b02c:eb5c with SMTP id
 h25-20020a4ad759000000b00560b02ceb5cmr10523144oot.9.1687666306189; Sat, 24
 Jun 2023 21:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230622170946.10082-1-adrian.freihofer@siemens.com>
 <20230622170946.10082-2-adrian.freihofer@siemens.com> <VI1PR0102MB313661740E953109CED0526EFC23A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
In-Reply-To: <VI1PR0102MB313661740E953109CED0526EFC23A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
From: Alejandro Hernandez <aehs29@gmail.com>
Date: Sat, 24 Jun 2023 22:11:34 -0600
Message-ID: <CAHMutrZqL=DCBpxrz9n_GqOdFbA77OUVhTvXj8QbOOX-q3Ou1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/9] runqemu-ifup: remove uid parameter
To: joerg.sommer@navimatix.de
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000ae0df205feec6e62"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 04:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183365

--000000000000ae0df205feec6e62
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I've already replied on another thread of this patch series, however, I
have discovered this is the patch that is causing the problem.

On Fri, 23 Jun 2023 at 03:31, J=C3=B6rg Sommer via lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> On 22 June 2023 19:01, openembedded-core@lists.openembedded.org wrote:
> > ip tuntap does not need the uid, it was an unused variable/parameter.
> > Backward compatibility should be fine.
> >
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> > scripts/runqemu-ifup | 13 ++++++++-----
> > 1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
> > index 5dc765dee82..26714518020 100755
> > --- a/scripts/runqemu-ifup
> > +++ b/scripts/runqemu-ifup
> > @@ -21,7 +21,7 @@
> > #
> >
> > usage() {
> > -       echo "sudo $(basename $0) <uid> <gid>"
> > +       echo "sudo $(basename $0) <gid>"
> > }
> >
> > if [ $EUID -ne 0 ]; then
> > @@ -29,17 +29,20 @@ if [ $EUID -ne 0 ]; then
> > exit 1
> > fi
> >
>

Specifically, the following change is the one that breaks backwards
compatibility,
since it echoes to stdout a warning, at first sight this seems harmless,
however,
there is an expectation from scripts for the output to be in a certain
format, e.g.:
https://git.yoctoproject.org/poky/tree/scripts/runqemu#n1207

Where the output of:
cmd =3D ('sudo', self.qemuifup, str(uid), str(gid))
            try:
tap =3D subprocess.check_output(cmd).decode('utf-8').strip()

Is parsed and then used, but the "tap" variable now contains the warning
from below,
after this, we try to convert such variable to int() which obviously
becomes an issue.
Now, we can certainly remove the uid argument from the call, which would
provide a
workaround, but, I think we should still change this to avoid changing the
expected
output from a script that is used in automated calls.

I'm also a bit concerned that this slipped the AB automated testing.

Sending a patch to fix this soon

Alejandro


> -if [ $# -ne 2 ]; then
> > +if [ $# -eq 2 ]; then
> > +       echo "Warning: uid parameter is ignored. It is no longer needed=
."
>
> Would it be better to send this message to stderr (use `>&2`)?
>
> Regards
>
> J=C3=B6rg Sommer
>
> Software Developer / Programmierer
> --
>
> Navimatix GmbH
>
> Tatzendpromenade 2
>
> 07745 Jena
>
>
> T: 03641 - 327 99 0
>
> F: 03641 - 526 306
>
> M: joerg.sommer@navimatix.de
>
> www.navimatix.de
>
>
>
>
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
>
> Registergericht: Amtsgericht Jena, HRB 501480
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183312):
> https://lists.openembedded.org/g/openembedded-core/message/183312
> Mute This Topic: https://lists.openembedded.org/mt/99702214/3619605
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alejandro@enedino.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ae0df205feec6e62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><font face=3D"monospace">Hello,</font></div><div class=3D"gma=
il_default" style=3D"font-size:small"><font face=3D"monospace"><br></font><=
/div><div class=3D"gmail_default" style=3D"font-size:small"><font face=3D"m=
onospace">I&#39;ve already replied on another thread of this patch series, =
however, I have discovered this is the patch that is causing the problem.</=
font></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, 23 Jun 2023 at 03:31, J=C3=B6rg Sommer via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;joerg.sommer=3D=
<a href=3D"mailto:navimatix.de@lists.openembedded.org">navimatix.de@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div class=3D"msg7385787146621424229">




<div dir=3D"ltr">
On 22 June 2023 19:01, <a href=3D"mailto:openembedded-core@lists.openembedd=
ed.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a> wrot=
e:
<div>&gt; ip tuntap does not need the uid, it was an unused variable/parame=
ter.</div>
<div>&gt; Backward compatibility should be fine.</div>
<div>&gt; </div>
<div>&gt; Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.frei=
hofer@siemens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;</=
div>
<div>&gt; ---</div>
<div>&gt; scripts/runqemu-ifup | 13 ++++++++-----</div>
<div>&gt; 1 file changed, 8 insertions(+), 5 deletions(-)</div>
<div>&gt; </div>
<div>&gt; diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup</div>
<div>&gt; index 5dc765dee82..26714518020 100755</div>
<div>&gt; --- a/scripts/runqemu-ifup</div>
<div>&gt; +++ b/scripts/runqemu-ifup</div>
<div>&gt; @@ -21,7 +21,7 @@</div>
<div>&gt; #</div>
<div>&gt; </div>
<div>&gt; usage() {</div>
<div>&gt; - =C2=A0 =C2=A0 =C2=A0 echo &quot;sudo $(basename $0) &lt;uid&gt;=
 &lt;gid&gt;&quot;</div>
<div>&gt; + =C2=A0 =C2=A0 =C2=A0 echo &quot;sudo $(basename $0) &lt;gid&gt;=
&quot;</div>
<div>&gt; }</div>
<div>&gt; </div>
<div>&gt; if [ $EUID -ne 0 ]; then</div>
<div>&gt; @@ -29,17 +29,20 @@ if [ $EUID -ne 0 ]; then</div>
<div>&gt; exit 1</div>
<div>&gt; fi</div>
<div>&gt;</div></div></div></blockquote><div><br></div><div><div class=3D"g=
mail_default" style=3D"font-size:small"><font face=3D"monospace">Specifical=
ly, the following change is the one that breaks backwards compatibility,</f=
ont></div><div class=3D"gmail_default" style=3D"font-size:small"><font face=
=3D"monospace">since it echoes to stdout a warning,=C2=A0</font><span style=
=3D"font-family:monospace">at first sight this seems harmless, however,</sp=
an></div><div class=3D"gmail_default" style=3D"font-size:small"><span style=
=3D"font-family:monospace">there is an expectation from scripts for the out=
put to be in a certain format, e.g.:</span></div><font face=3D"monospace"><=
a href=3D"https://git.yoctoproject.org/poky/tree/scripts/runqemu#n1207">htt=
ps://git.yoctoproject.org/poky/tree/scripts/runqemu#n1207</a><br><br>Where =
the output of:<br>cmd =3D (&#39;sudo&#39;, self.qemuifup, str(uid), str(gid=
))<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try: <br>tap =3D subprocess=
.check_output(cmd).decode(&#39;utf-8&#39;).strip()<br><br>Is parsed and the=
n used, but the &quot;tap&quot; variable now contains the warning from belo=
w,</font></div><div><font face=3D"monospace">after this, we try to convert =
such variable to int() which obviously becomes an issue.</font></div><div><=
span style=3D"font-family:arial,sans-serif"><span class=3D"gmail_default" s=
tyle=3D"font-family:arial,sans-serif;font-size:small"></span></span></div><=
div><span class=3D"gmail_default" style=3D"font-size:small"><font face=3D"m=
onospace">Now, we can certainly remove the uid argument from the call, whic=
h would provide a</font></span></div><div><span class=3D"gmail_default" sty=
le=3D"font-size:small"><font face=3D"monospace">workaround,=C2=A0</font></s=
pan><span class=3D"gmail_default"><font face=3D"monospace">but, I think=C2=
=A0</font></span><span class=3D"gmail_default"><font face=3D"monospace">we =
should still change this to avoid changing the expected</font></span></div>=
<div><span class=3D"gmail_default"><font face=3D"monospace">output from=C2=
=A0</font></span><span style=3D"font-family:monospace">a script that is use=
d in automated calls<span class=3D"gmail_default" style=3D"font-family:aria=
l,sans-serif;font-size:small">.</span></span></div><div><span style=3D"font=
-family:monospace"><span class=3D"gmail_default" style=3D"font-family:arial=
,sans-serif;font-size:small"><br></span></span></div><div><span style=3D"fo=
nt-family:monospace"><span class=3D"gmail_default" style=3D"font-family:ari=
al,sans-serif;font-size:small"></span></span><span style=3D"font-family:mon=
ospace">I&#39;m also a bit concerned that<span class=3D"gmail_default" styl=
e=3D"font-family:arial,sans-serif;font-size:small"> </span></span><span sty=
le=3D"font-family:monospace">this slipped<span class=3D"gmail_default" styl=
e=3D"font-family:arial,sans-serif"> </span></span><span class=3D"gmail_defa=
ult"><font face=3D"monospace">the AB automated testing.</font></span></div>=
<div><span class=3D"gmail_default" style=3D"font-family:arial,sans-serif"><=
br></span></div><div><font face=3D"monospace"><span class=3D"gmail_default"=
 style=3D"">Sending a patch to fix this soon</span></font></div><div><br></=
div><div><div class=3D"gmail_default" style=3D"font-size:small"><span style=
=3D"font-family:arial,sans-serif"></span><font face=3D"monospace">Alejandro=
</font><font face=3D"arial, sans-serif"></font></div><br></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg73857=
87146621424229"><div dir=3D"ltr"><div> </div>
<div>&gt; -if [ $# -ne 2 ]; then</div>
<div>&gt; +if [ $# -eq 2 ]; then</div>
<div>&gt; + =C2=A0 =C2=A0 =C2=A0 echo &quot;Warning: uid parameter is ignor=
ed. It is no longer needed.&quot;</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Would it be better to send this message to stderr (use `&gt;&amp;2`)?</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Regards</div>
<div><br>
</div>
<div>J=C3=B6rg Sommer</div>
<div><br>
</div>
<div>Software Developer / Programmierer</div>
<div>--=C2=A0</div>
<div><br>
</div>
<div>Navimatix GmbH</div>
<div><br>
</div>
<div>Tatzendpromenade 2</div>
<div><br>
</div>
<div>07745 Jena</div>
<div><br>
</div>
<div><br>
</div>
<div>T: 03641 - 327 99 0</div>
<div><br>
</div>
<div>F: 03641 - 526 306</div>
<div><br>
</div>
<div>M: <a href=3D"mailto:joerg.sommer@navimatix.de" target=3D"_blank">joer=
g.sommer@navimatix.de</a></div>
<div><br>
</div>
<div><a href=3D"http://www.navimatix.de" target=3D"_blank">www.navimatix.de=
</a></div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div>Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley</div>
<div><br>
</div>
<div>Registergericht: Amtsgericht Jena, HRB 501480</div>
<div><br>
</div>
<div><br>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#183312): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/183312" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/183312</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99702214/3619=
605" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99702214/3619605</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alejandro@enedino.org" tar=
get=3D"_blank">alejandro@enedino.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div></div>

--000000000000ae0df205feec6e62--

