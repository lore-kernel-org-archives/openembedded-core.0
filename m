Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A58FC3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 16:04:40 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.65003.1722009870972972158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 09:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eRKu3djd;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3db23a608eeso29967b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 09:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722009870; x=1722614670; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nOkkWzwbmca2025+9qGfqYNZO1YkpIUc4TQ7792joz4=;
        b=eRKu3djdq0hjtZIpWfYncsaQUfBfQFgnyiWKAc6bHl8S1gdPdhM/PzvD3DrxM/riBT
         jZjH8m6j7kL+cMAkEt2K69yY4hRZ5XTHPL7VB0gCuNC7lkWmQ5w/xZVLn2iqn79tv2Js
         fcBYbXgaMFdF9OlhE10QEQWrQhidR/Lz4q54I1o1m7o99r7PIGizVaXnPSSptY+JTZAJ
         Ok7rSSShlqO2k6LhuWfDIBPmFTmCu5sp6RSFeduWr2klQDFsCtanyEg0NskqJSvByVss
         DzEHy9Pf/zD3Z930YVNRo+bXy6yDKHImn68POc1QH02ejHzFXQfbK8N4lmHBanB6lmIt
         b5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722009870; x=1722614670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOkkWzwbmca2025+9qGfqYNZO1YkpIUc4TQ7792joz4=;
        b=RgV8Y1pAQYua5n7XK2DHTiFFvsZ3Dt4qdfEVe1r4ghgX5iRh4ehRXbdCJ+6D7IpqIi
         AXuYIiqaALyaC67Mp7ditbfLjSYsnBRi+j3fyvttKYRI3d8IpDv0ncTudqKm8CdEwWIr
         0FDtOX7YuhX6flZogfuRFZd/xPmyaGp7odO9Tu5pnX/FxRO23WQ1PSdhiMeiGdGJelB8
         LA8v+pxNDi7EXr0V+e7if8DsxxkRJ40AeGFaXG1R6UNMUj8NKuv+wRB4tQ6hevuJVQJz
         F12MYHlqnkviCcu+jOkWSi+lxQd3m6nW55gcoHPuDsCJ2EWMLvKbcAGM4LCh5HL+jp1L
         97Ug==
X-Gm-Message-State: AOJu0YxwYuZbvEVNg8EFUC1pS7sJx1NDZK/OZqNhWdGDcxUo2XY0K6Rm
	HBfx7C/Z9LsgGXG6KoAHF96KmdDx0gbx153lmL9PUWeNkIg9sLNqd6w9HP9OB3H2SiciMiXRfTZ
	5gmo1xd1H0e48ehal7TUFgeXHq3oKwCji
X-Google-Smtp-Source: AGHT+IGDeSmppQFp45+m2/8YfoqnEw+Yc3rjhIpJIm4QHcugLUm3BNwoErdVYTu8gttUGeLGrtnQHIbpBuTHx3bXBrY=
X-Received: by 2002:a05:6808:1993:b0:3d9:1f05:845 with SMTP id
 5614622812f47-3db23a69219mr145690b6e.19.1722009869872; Fri, 26 Jul 2024
 09:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <17E51ABD1A5159E6.10920@lists.openembedded.org> <2bebf809-c400-4517-bcae-b4f14e1c1d7d@weidmueller.com>
In-Reply-To: <2bebf809-c400-4517-bcae-b4f14e1c1d7d@weidmueller.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 26 Jul 2024 17:04:18 +0100
Message-ID: <CANPvuRn1M6m3jgP2fGFPmXTzgew=d_udqFFtQ=iLXS8pZyjSmQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] iptables: fix memory corruption when parsing nft rules
To: christian.taedcke-oss@weidmueller.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000097fcad061e28aa39"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 16:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202549

--00000000000097fcad061e28aa39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

Taedcke, Christian via lists.openembedded.org <christian.taedcke-oss=3D
weidmueller.com@lists.openembedded.org> escreveu (sexta, 26/07/2024 =C3=A0(=
s)
13:45):

> Thanks for applying this fix to master.
>
> Should i send another patch for scarthgap or is this automatically
> ported to scarthgap?
>

You can always send the patch with:

git cherry-pick -x -s ...
git send-email --subject-prefix=3D"OE-core][BRANCH][PATCH" ...

This makes the maintainer's life a little easier.

Jose


> Regards,
> Christian
>
> On 24.07.2024 11:03, Taedcke, Christian via lists.openembedded.org wrote:
> > From: Christian Taedcke <christian.taedcke@weidmueller.com>
> >
> > This commit fixes a memory corruption issue when iptables (with
> > enabled PACKAGECONFIG libnftnl) is used to access rules created by
> > nft.
> >
> > To reproduce the issue:
> > nft add chain ip filter TESTCHAIN { meta mark set 123 \;}
> > iptables -t filter -n -L TESTCHAIN
> >
> > This produced the following output:
> > Chain TESTCHAIN (0 references)
> > target prot opt source     destination
> > MARK   0    --  0.0.0.0/0  0.0.0.0/0     MARK set 0x7b
> > malloc(): corrupted top size
> > Aborted (core dumped)
> >
> > This commit fixes this issue.
> >
> > Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
> > ---
> >   ...se-Add-missing-braces-around-ternary.patch | 37 ++++++++++++++++++=
+
> >   .../iptables/iptables_1.8.10.bb               |  1 +
> >   2 files changed, 38 insertions(+)
> >   create mode 100644
> meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-br=
aces-around-ternary.patch
> >
> > diff --git
> a/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-=
braces-around-ternary.patch
> b/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-=
braces-around-ternary.patch
> > new file mode 100644
> > index 0000000000..4cbc8bdaf4
> > --- /dev/null
> > +++
> b/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-=
braces-around-ternary.patch
> > @@ -0,0 +1,37 @@
> > +From 2026b08bce7fe87b5964f7912e1eef30f04922c1 Mon Sep 17 00:00:00 2001
> > +From: Phil Sutter <phil@nwl.cc>
> > +Date: Fri, 26 Jan 2024 18:43:10 +0100
> > +Subject: [PATCH] nft: ruleparse: Add missing braces around ternary
> > +
> > +The expression evaluated the sum before the ternay, consequently not
> > +adding target->size if tgsize was zero.
> > +
> > +Identified by ASAN for a simple rule using standard target:
> > +| # ebtables -A INPUT -s de:ad:be:ef:0:00 -j RETURN
> > +| # ebtables -D INPUT -s de:ad:be:ef:0:00 -j RETURN
> > +| =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +| =3D=3D18925=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on ad=
dress
> 0x603000000120 at pc 0x7f627a4c75c5 bp 0x7ffe882b5180 sp 0x7ffe882b4928
> > +| READ of size 8 at 0x603000000120 thread T0
> > +| [...]
> > +
> > +Upstream-Status: Backport [2026b08bce7fe87b5964f7912e1eef30f04922c1]
> > +
> > +Fixes: 2a6eee89083c8 ("nft-ruleparse: Introduce nft_create_target()")
> > +Signed-off-by: Phil Sutter <phil@nwl.cc>
> > +---
> > + iptables/nft-ruleparse.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/iptables/nft-ruleparse.c b/iptables/nft-ruleparse.c
> > +index 0bbdf44faf..3b1cbe4fa1 100644
> > +--- a/iptables/nft-ruleparse.c
> > ++++ b/iptables/nft-ruleparse.c
> > +@@ -94,7 +94,7 @@ __nft_create_target(struct nft_xt_ctx *ctx, const
> char *name, size_t tgsize)
> > +     if (!target)
> > +             return NULL;
> > +
> > +-    size =3D XT_ALIGN(sizeof(*target->t)) + tgsize ?: target->size;
> > ++    size =3D XT_ALIGN(sizeof(*target->t)) + (tgsize ?: target->size);
> > +
> > +     target->t =3D xtables_calloc(1, size);
> > +     target->t->u.target_size =3D size;
> > diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb
> b/meta/recipes-extended/iptables/iptables_1.8.10.bb
> > index 81eba6c967..a94e4749ae 100644
> > --- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
> > +++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
> > @@ -14,6 +14,7 @@ SRC_URI =3D "
> http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
> >              file://ip6tables.service \
> >              file://ip6tables.rules \
> >
> file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
> > +
>  file://0002-nft-ruleparse-Add-missing-braces-around-ternary.patch \
> >              "
> >   SRC_URI[sha256sum] =3D
> "5cc255c189356e317d070755ce9371eb63a1b783c34498fb8c30264f3cc59c9c"
> >
> >
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202536):
> https://lists.openembedded.org/g/openembedded-core/message/202536
> Mute This Topic: https://lists.openembedded.org/mt/107520169/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000097fcad061e28aa39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Christian,</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Taedcke, Christian via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;christian.taedcke-o=
ss=3D<a href=3D"mailto:weidmueller.com@lists.openembedded.org">weidmueller.=
com@lists.openembedded.org</a>&gt; escreveu (sexta, 26/07/2024 =C3=A0(s) 13=
:45):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks for=
 applying this fix to master.<br>
<br>
Should i send another patch for scarthgap or is this automatically <br>
ported to scarthgap?<br></blockquote><div><br></div><div>You can always sen=
d the patch=C2=A0with: <br><br>git cherry-pick -x -s ...<br>git send-email =
--subject-prefix=3D&quot;OE-core][BRANCH][PATCH&quot;=C2=A0...</div><div><b=
r>This makes the maintainer&#39;s life a little easier.<br></div><div><br>J=
ose</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Christian<br>
<br>
On 24.07.2024 11:03, Taedcke, Christian via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> =
wrote:<br>
&gt; From: Christian Taedcke &lt;<a href=3D"mailto:christian.taedcke@weidmu=
eller.com" target=3D"_blank">christian.taedcke@weidmueller.com</a>&gt;<br>
&gt; <br>
&gt; This commit fixes a memory corruption issue when iptables (with<br>
&gt; enabled PACKAGECONFIG libnftnl) is used to access rules created by<br>
&gt; nft.<br>
&gt; <br>
&gt; To reproduce the issue:<br>
&gt; nft add chain ip filter TESTCHAIN { meta mark set 123 \;}<br>
&gt; iptables -t filter -n -L TESTCHAIN<br>
&gt; <br>
&gt; This produced the following output:<br>
&gt; Chain TESTCHAIN (0 references)<br>
&gt; target prot opt source=C2=A0 =C2=A0 =C2=A0destination<br>
&gt; MARK=C2=A0 =C2=A00=C2=A0 =C2=A0 --=C2=A0 <a href=3D"http://0.0.0.0/0" =
rel=3D"noreferrer" target=3D"_blank">0.0.0.0/0</a>=C2=A0 <a href=3D"http://=
0.0.0.0/0" rel=3D"noreferrer" target=3D"_blank">0.0.0.0/0</a>=C2=A0 =C2=A0 =
=C2=A0MARK set 0x7b<br>
&gt; malloc(): corrupted top size<br>
&gt; Aborted (core dumped)<br>
&gt; <br>
&gt; This commit fixes this issue.<br>
&gt; <br>
&gt; Signed-off-by: Christian Taedcke &lt;<a href=3D"mailto:christian.taedc=
ke@weidmueller.com" target=3D"_blank">christian.taedcke@weidmueller.com</a>=
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...se-Add-missing-braces-around-ternary.patch | 37 +++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0.../iptables/<a href=3D"http://iptables_1.8.10.bb" rel=3D"=
noreferrer" target=3D"_blank">iptables_1.8.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A02 files changed, 38 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-extended/iptables/iptables=
/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/iptables/iptables/0002-nft-rulepars=
e-Add-missing-braces-around-ternary.patch b/meta/recipes-extended/iptables/=
iptables/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..4cbc8bdaf4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-m=
issing-braces-around-ternary.patch<br>
&gt; @@ -0,0 +1,37 @@<br>
&gt; +From 2026b08bce7fe87b5964f7912e1eef30f04922c1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Phil Sutter &lt;<a href=3D"mailto:phil@nwl.cc" target=3D"_blank=
">phil@nwl.cc</a>&gt;<br>
&gt; +Date: Fri, 26 Jan 2024 18:43:10 +0100<br>
&gt; +Subject: [PATCH] nft: ruleparse: Add missing braces around ternary<br=
>
&gt; +<br>
&gt; +The expression evaluated the sum before the ternay, consequently not<=
br>
&gt; +adding target-&gt;size if tgsize was zero.<br>
&gt; +<br>
&gt; +Identified by ASAN for a simple rule using standard target:<br>
&gt; +| # ebtables -A INPUT -s de:ad:be:ef:0:00 -j RETURN<br>
&gt; +| # ebtables -D INPUT -s de:ad:be:ef:0:00 -j RETURN<br>
&gt; +| =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +| =3D=3D18925=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on a=
ddress 0x603000000120 at pc 0x7f627a4c75c5 bp 0x7ffe882b5180 sp 0x7ffe882b4=
928<br>
&gt; +| READ of size 8 at 0x603000000120 thread T0<br>
&gt; +| [...]<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [2026b08bce7fe87b5964f7912e1eef30f04922c1]<=
br>
&gt; +<br>
&gt; +Fixes: 2a6eee89083c8 (&quot;nft-ruleparse: Introduce nft_create_targe=
t()&quot;)<br>
&gt; +Signed-off-by: Phil Sutter &lt;<a href=3D"mailto:phil@nwl.cc" target=
=3D"_blank">phil@nwl.cc</a>&gt;<br>
&gt; +---<br>
&gt; + iptables/nft-ruleparse.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/iptables/nft-ruleparse.c b/iptables/nft-ruleparse.c<br>
&gt; +index 0bbdf44faf..3b1cbe4fa1 100644<br>
&gt; +--- a/iptables/nft-ruleparse.c<br>
&gt; ++++ b/iptables/nft-ruleparse.c<br>
&gt; +@@ -94,7 +94,7 @@ __nft_create_target(struct nft_xt_ctx *ctx, const c=
har *name, size_t tgsize)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!target)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 size =3D XT_ALIGN(sizeof(*target-&gt;t)) + tgsize ?: t=
arget-&gt;size;<br>
&gt; ++=C2=A0 =C2=A0 size =3D XT_ALIGN(sizeof(*target-&gt;t)) + (tgsize ?: =
target-&gt;size);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0target-&gt;t =3D xtables_calloc(1, size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0target-&gt;t-&gt;u.target_size =3D size;<br>
&gt; diff --git a/meta/recipes-extended/iptables/<a href=3D"http://iptables=
_1.8.10.bb" rel=3D"noreferrer" target=3D"_blank">iptables_1.8.10.bb</a> b/m=
eta/recipes-extended/iptables/<a href=3D"http://iptables_1.8.10.bb" rel=3D"=
noreferrer" target=3D"_blank">iptables_1.8.10.bb</a><br>
&gt; index 81eba6c967..a94e4749ae 100644<br>
&gt; --- a/meta/recipes-extended/iptables/<a href=3D"http://iptables_1.8.10=
.bb" rel=3D"noreferrer" target=3D"_blank">iptables_1.8.10.bb</a><br>
&gt; +++ b/meta/recipes-extended/iptables/<a href=3D"http://iptables_1.8.10=
.bb" rel=3D"noreferrer" target=3D"_blank">iptables_1.8.10.bb</a><br>
&gt; @@ -14,6 +14,7 @@ SRC_URI =3D &quot;<a href=3D"http://netfilter.org/pr=
ojects/iptables/files/iptables-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">http://netfilter.org/projects/iptables/files/iptables-${PV}.tar=
.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ip6tables.servi=
ce \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ip6tables.rules=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure-=
Add-option-to-enable-disable-libnfnetlink.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-nft-ruleparse-Ad=
d-missing-braces-around-ternary.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D &quot;5cc255c189356e317d070755ce937=
1eb63a1b783c34498fb8c30264f3cc59c9c&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#202536): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/202536" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/202536</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107520169/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107520169/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000097fcad061e28aa39--

