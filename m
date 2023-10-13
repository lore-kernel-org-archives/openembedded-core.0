Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795BDCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 16:33:21 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.43447.1697214792743650456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 09:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jze876If;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-457bafdc467so588270137.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697214792; x=1697819592; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WL8ijXfuULRXyTPKbCLh0x7jEe5elnyxjSo3E1gmXSE=;
        b=jze876If7xRYQYsaxZvkkOudaN5qoqCSh3DYKf8/ZULwkP1dQX6gGrjEeUmc3U1R8C
         BqdId5NyyPoev60hqZU/LbDGiXokVzaWGmhhwkuaTLvNy8PdaTScuA0vYZC6BlXHOgTR
         Lp2uqhsp1jdPrMLcwG4lE69Ujj8Oo9pO8vqowrqkhsxXvmDk8HtNQfiJfywtRxTYbtz7
         Qn+9NBQQQoyEB+6pZNeTPb87EaZUeTe9gblAdjXVbBwB5oSGsViT/QKNIcdSxGvzCr+u
         5bJaRPj19aLrbmtDWsNTiBARiMu1qqlJf6HVTnWz4pw+fMHzsp5WvAOV5UMnbijp0P57
         W4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697214792; x=1697819592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WL8ijXfuULRXyTPKbCLh0x7jEe5elnyxjSo3E1gmXSE=;
        b=kNKc1wi/Sx/UAOehtVkkELhewY3YfQwCxo5CIHRaeoRbq8MLt21BglcZetvpOBmbdG
         W8ujzqXrFrm+GmAengMZxyoYPsOpYEU24AmxbP6ICjMO4VSIC3EMPFpRxwOpbgdwzLpp
         2fK6jqm/Wj5VOXilYLEFR/Hfx0KGcIr7Bb7X/1bJ9B+FtwXjo9y519YZ3NmsXN1Kevty
         MUlgejbFPowPFkKsQDxqWMNlo36rGRqOqEWTILx+lxP6eEaKIZsdTTp+zwFkgsQVlH7A
         uORh/EtEBOlHzkuyuNbGUSVg4CAoB16KBZXulGs6VIU6CJcSYJHG2FWuh9qubLC3uFCA
         xtZA==
X-Gm-Message-State: AOJu0YySO8s/y6lsn5c90yOX4Yg3MQSosxn1Qaq7CEKC/ckkLiI+8+Ci
	gCw3vpP1zw49i+nnpZhhkw05CBtlLhaLVLjsLKU=
X-Google-Smtp-Source: AGHT+IHfap2BlhfeCR9wQscm+qEKhrH8n/GDGD1eYU/X5uqFlqTKeuaHQ7ojbWSyoGDxygU9Z+dpv5Eoo1WCBx0AnoI=
X-Received: by 2002:a67:c311:0:b0:457:c2ff:ad98 with SMTP id
 r17-20020a67c311000000b00457c2ffad98mr2672933vsj.13.1697214791747; Fri, 13
 Oct 2023 09:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231013154214.2233184-1-jose.quaresma@foundries.io> <CAJdd5GYinqs0YBjc+DqF+0GQ8ijnY9MOaHN1U7Zu-wkqCGBv_w@mail.gmail.com>
In-Reply-To: <CAJdd5GYinqs0YBjc+DqF+0GQ8ijnY9MOaHN1U7Zu-wkqCGBv_w@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 13 Oct 2023 17:33:00 +0100
Message-ID: <CANPvuRn60YFeB6VeTjX-W=S8OMqRzCNvuMsoZJqpN_aFvZOo=A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] create-spdx: fix do_create_spdx cannot find any
 SPDX file for recipe
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000c5146c06079b9cd9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 16:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189075

--000000000000c5146c06079b9cd9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can try to reproduce this issue again with just-oe-core and some bsp
layer
that have multiconfig machines. I have only see this when using meta-ti
and after they switch to barematel [1].
This commit fixes the issue in my meta-lmp layer distro but this can also
be fixed
if we build the failing dependencies one by one.

https://git.yoctoproject.org/meta-ti/commit/?id=3D811c87bbbd324d4f176332b9e=
5f7c3699310cb06

Next week I will try to do the same with poky.
Thanks for your help.

Joshua Watt <jpewhacker@gmail.com> escreveu no dia sexta, 13/10/2023 =C3=A0=
(s)
17:20:

> The dependency chain here is a little weird, because do_create_spdx()
> depends on do_collect_spdx_deps(), and the do_collect_spdx_deps has a
> deptask on do_create_sdpx to get the dependencies from upstream
> recipes (read the comment in there for why that is). We avoided
> recrdeptask because we _should_ only be pulling in SPDX documents from
> direct dependencies, so the "recursive" part _should_ not be necessary
> (which is why we use deptask instead of recrdeptask).
>
> That being said, there is a bug here somewhere and I can't quite
> figure out what it might be and I'm having a really hard time
> reproducing it; but I'm not sure this is the fix.
>
> I don't think
>
> On Fri, Oct 13, 2023 at 9:42=E2=80=AFAM Jose Quaresma <quaresma.jose@gmai=
l.com>
> wrote:
> >
> > Given that we need some SPDX files produced in other recipes by
> do_create_spdx task,
> > we need to ensure that any of this other do_create_spdx build-time
> dependencies
> > runs first to produce the artidacts we need in the do_create_spdx of th=
e
> current recipe.
> >
> > Fix the following which especially affects multiconfig machines:
> >
> > | ERROR: flex-native-2.6.4-r0 do_create_spdx: Cannot find any SPDX file
> for recipe autoconf-native, True
> sstate:autoconf-native:x86_64-linux:2.72c:r0:x86_64:11:
> sstate:autoconf-native::2.72c:r0::11:
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/classes/create-spdx-2.2.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/classes/create-spdx-2.2.bbclass
> b/meta/classes/create-spdx-2.2.bbclass
> > index b0aef80db1..a37245bdba 100644
> > --- a/meta/classes/create-spdx-2.2.bbclass
> > +++ b/meta/classes/create-spdx-2.2.bbclass
> > @@ -709,6 +709,7 @@ addtask do_create_spdx_setscene
> >  do_create_spdx[dirs] =3D "${SPDXWORK}"
> >  do_create_spdx[cleandirs] =3D "${SPDXDEPLOY} ${SPDXWORK}"
> >  do_create_spdx[depends] +=3D "${PATCHDEPENDENCY}"
> > +do_create_spdx[recrdeptask] +=3D "do_create_spdx"
> >
> >  def collect_package_providers(d):
> >      from pathlib import Path
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#189071):
> https://lists.openembedded.org/g/openembedded-core/message/189071
> > Mute This Topic: https://lists.openembedded.org/mt/101942902/3616693
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c5146c06079b9cd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I can try to reproduce this issue again with just-oe-=
core and some bsp layer=C2=A0</div><div>that have multiconfig machines. I h=
ave only see this when using meta-ti</div><div>and after they switch to bar=
ematel=C2=A0[1].</div><div>This commit fixes the issue in my meta-lmp layer=
 distro but this can also be fixed<br>if we build the failing dependencies=
=C2=A0one by one.</div><div><br><a href=3D"https://git.yoctoproject.org/met=
a-ti/commit/?id=3D811c87bbbd324d4f176332b9e5f7c3699310cb06">https://git.yoc=
toproject.org/meta-ti/commit/?id=3D811c87bbbd324d4f176332b9e5f7c3699310cb06=
</a><br></div><div><br></div><div>Next week I will try to do the same with =
poky.<br>Thanks for your help.</div><div><br></div><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Joshua Watt &lt;<a href=3D"mailto:=
jpewhacker@gmail.com">jpewhacker@gmail.com</a>&gt; escreveu no dia sexta, 1=
3/10/2023 =C3=A0(s) 17:20:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The dependency chain here is a little weird, because do_create_s=
pdx()<br>
depends on do_collect_spdx_deps(), and the do_collect_spdx_deps has a<br>
deptask on do_create_sdpx to get the dependencies from upstream<br>
recipes (read the comment in there for why that is). We avoided<br>
recrdeptask because we _should_ only be pulling in SPDX documents from<br>
direct dependencies, so the &quot;recursive&quot; part _should_ not be nece=
ssary<br>
(which is why we use deptask instead of recrdeptask).<br>
<br>
That being said, there is a bug here somewhere and I can&#39;t quite<br>
figure out what it might be and I&#39;m having a really hard time<br>
reproducing it; but I&#39;m not sure this is the fix.<br>
<br>
I don&#39;t think<br>
<br>
On Fri, Oct 13, 2023 at 9:42=E2=80=AFAM Jose Quaresma &lt;<a href=3D"mailto=
:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; Given that we need some SPDX files produced in other recipes by do_cre=
ate_spdx task,<br>
&gt; we need to ensure that any of this other do_create_spdx build-time dep=
endencies<br>
&gt; runs first to produce the artidacts we need in the do_create_spdx of t=
he current recipe.<br>
&gt;<br>
&gt; Fix the following which especially affects multiconfig machines:<br>
&gt;<br>
&gt; | ERROR: flex-native-2.6.4-r0 do_create_spdx: Cannot find any SPDX fil=
e for recipe autoconf-native, True sstate:autoconf-native:x86_64-linux:2.72=
c:r0:x86_64:11: sstate:autoconf-native::2.72c:r0::11:<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/create-spdx-2.2.bbclass | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/creat=
e-spdx-2.2.bbclass<br>
&gt; index b0aef80db1..a37245bdba 100644<br>
&gt; --- a/meta/classes/create-spdx-2.2.bbclass<br>
&gt; +++ b/meta/classes/create-spdx-2.2.bbclass<br>
&gt; @@ -709,6 +709,7 @@ addtask do_create_spdx_setscene<br>
&gt;=C2=A0 do_create_spdx[dirs] =3D &quot;${SPDXWORK}&quot;<br>
&gt;=C2=A0 do_create_spdx[cleandirs] =3D &quot;${SPDXDEPLOY} ${SPDXWORK}&qu=
ot;<br>
&gt;=C2=A0 do_create_spdx[depends] +=3D &quot;${PATCHDEPENDENCY}&quot;<br>
&gt; +do_create_spdx[recrdeptask] +=3D &quot;do_create_spdx&quot;<br>
&gt;<br>
&gt;=C2=A0 def collect_package_providers(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 from pathlib import Path<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#189071): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/189071" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/189071</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10194290=
2/3616693" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/101942902/3616693</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank">JPEWhacker@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000c5146c06079b9cd9--

