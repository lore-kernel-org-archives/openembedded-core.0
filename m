Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AD5C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 09:21:10 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.12233.1749028861194096151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 02:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GP4htran;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so4859775e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 02:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1749028859; x=1749633659; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NgzX5ahRswVPaJlf8tWgUEhmmTme25HLU1w6gjbs6uE=;
        b=GP4htranMuOx/LjC4lz392m2IFAdHZRojy2jSNSltNr3Y+96qN/GhHfF8soAThpgYh
         3g/ZyLJwgInheY8IniiusnANQfOGUCAlZ/6G9iXMuUHqVlpq9NBfRDcDPzd7dhY5p6JK
         4iURkVAfM5VRbn00Pa860SREuyNPSHlTAHnAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028859; x=1749633659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgzX5ahRswVPaJlf8tWgUEhmmTme25HLU1w6gjbs6uE=;
        b=AMxeXN6Ac3kkFiwezjl5u5TprYB4EICmvQyRwhUC335q/oLZsD3/a9suufLOnMN4sT
         P0QaSS34MNyqde7MIqsZjFie3eEv7B7vQaK3HdSJaqlzDMKRPVI5G0tL5qjjXUINq+6i
         t7L935WWHaC1H4o5qbpG+CifP24wMuRPnsj21KK8Qpqx0+IlrTKKrkIQk1w80sTm49QR
         KSUjUNllshWpWonn8Sq0FZCB8Cb3HVYPMeYMc41zFlG/MBvIaXBicKl3x7O2L3HMDxGJ
         rouGDmXBQzpM/3hwEhaUz2IGifHzRupcFOg3brR4OGle6eGiE+cR49SMEdhsMi4kEcx/
         NowQ==
X-Gm-Message-State: AOJu0YycAv7s8CMaodkSa7QSP6taa7Xs7IQxknDBcD2z7BwC7o00trb+
	JepIrfaKjQ+oGs0cdWph+AIePDMdEZonIxAuRSQ6gmQc6GYpKMFl6a+OlyFtlMfW8uKChH0rwM6
	QzWNBg0reldAqIwXbDcMaDwGeGvbfD01o9gW5plZ6Gw==
X-Gm-Gg: ASbGncu7xXWaaMTsilvzIhJO+py9RTMB3JID+nagslp4auFRj72AyYUDUFWVK9l5PhV
	k4kuo8C24FpG06O0/dcUp8X4Wmznv036UyA/Y/e49L4dhL+N2HgTGCUkGl90zdCPWVYL5UEdFPj
	0TinOu9vsbGHIo/boPreRqW1l7ddJyCo9Hpejh3H1iDn3Nf3aAdRxv2YKh/R5H3mJzmjdArynGr
	Ikpkg==
X-Google-Smtp-Source: AGHT+IHQIKM5r3tmzC8YflEcGNv81SUam5b6bwoat9ac0ueA+OPi2H4xlZJjjRSZnmOh5FKPV9pEhMAolI1HVavrKDQ=
X-Received: by 2002:a05:600c:8b6d:b0:43d:fa5f:7d30 with SMTP id
 5b1f17b1804b1-451efed66f4mr18628325e9.16.1749028859467; Wed, 04 Jun 2025
 02:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250603215916.2429422-1-yoann.congal@smile.fr> <AS8PR02MB10201A85472191F69B7F5800DEF6CA@AS8PR02MB10201.eurprd02.prod.outlook.com>
In-Reply-To: <AS8PR02MB10201A85472191F69B7F5800DEF6CA@AS8PR02MB10201.eurprd02.prod.outlook.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 4 Jun 2025 11:20:33 +0200
X-Gm-Features: AX0GCFvcpcDriAKBmPaq7N9bDLHttPlsbVF-1qoprsizpzEWM8J9YY2qIscfna0
Message-ID: <CAMSfU+74KEPn+uBvQH-8L8LGmU3maqixkcSk=NkXr_LW1WkmpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] reproducible: allow each layer to define its
 known non-repro packages
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Content-Type: multipart/alternative; boundary="000000000000deebd10636bb838f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 09:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217895

--000000000000deebd10636bb838f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 4 juin 2025 =C3=A0 11:14, Peter Kjellerstedt <peter.kjellerstedt@ax=
is.com>
a =C3=A9crit :

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Yoann Congal via
> lists.openembedded.org
> > Sent: den 3 juni 2025 23:59
> > To: openembedded-core@lists.openembedded.org
> > Cc: Yoann Congal <yoann.congal@smile.fr>; Guillaume Swaenepoel <
> guillaume.swaenepoel@smile.fr>
> > Subject: [OE-core] [PATCH] reproducible: allow each layer to define its
> known non-repro packages
> >
> > From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> >
> > With this change, layers can use a conf/include/known_non_repro.inc fil=
e
> > to extend the KNOWN_NON_REPRO_PACKAGES_LIST variable with its own known
> > non-reproducible packages to make them automatically excluded from the
> > reproducible test.
> >
> > Example of usage, in conf/include/known_non_repro.inc:
> >   KNOWN_NON_REPRO_PACKAGES_LIST +=3D " \
> >         this-package-is-not-reproducible \
> >   "
> >
> > This uses the new "include_all" in the reproducible test and will move
> > the maintenance burden from AB config[0] to the layers themselves.
> >
> > Fixes [YOCTO #15699]
> >
> > [0]:
> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n3=
43
> >
> > Co-Developed-by: Yoann Congal <yoann.congal@smile.fr>
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > Signed-off-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> > ---
> >  meta/lib/oeqa/selftest/cases/reproducible.py | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py
> b/meta/lib/oeqa/selftest/cases/reproducible.py
> > index f06027cb03..e2c3a10f06 100644
> > --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> > +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> > @@ -14,6 +14,7 @@ import shutil
> >  import stat
> >  import os
> >  import datetime
> > +import oeqa.utils.ftools as ftools
> >
> >  exclude_packages =3D [
> >       ]
> > @@ -158,6 +159,12 @@ class ReproducibleTests(OESelftestTestCase):
> >      # reproducible, disable this in your derived test class
> >      build_from_sstate =3D True
> >
> > +    @classmethod
> > +    def setUpClass(cls):
> > +        super().setUpClass()
> > +        ftools.append_file(os.path.join(cls.builddir,
> "conf/local.conf"), \
> > +             "\ninclude_all conf/include/known_non_repro.inc\n")
> > +
> >      def setUpLocal(self):
> >          super().setUpLocal()
> >          needed_vars =3D [
> > @@ -170,6 +177,7 @@ class ReproducibleTests(OESelftestTestCase):
> >              'OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS',
> >              'OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES',
> >              'OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS',
> > +            'KNOWN_NON_REPRO_PACKAGES_LIST',
>
> Why do you need a new variable? Isn't this what
> OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES is used for?
>

The idea was at some point to de-couple the two to allow to run the test
without the exclusion coming automatically from the layer files.
I may have over-thought this one.


> >          ]
> >          bb_vars =3D get_bb_vars(needed_vars)
> >          for v in needed_vars:
> > @@ -189,6 +197,10 @@ class ReproducibleTests(OESelftestTestCase):
> >              for leaf_recipe in
> bb_vars['OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS'].split():
> >                  self.sstate_targets.extend(get_bb_var('DEPENDS',
> leaf_recipe).split())
> >
> > +        # Apply exclusion from layers (conf/include/known_non_repro.in=
c
> files)
> > +        if bb_vars['KNOWN_NON_REPRO_PACKAGES_LIST']:
> > +            self.oeqa_reproducible_excluded_packages =3D
> (self.oeqa_reproducible_excluded_packages or "") +
> bb_vars['KNOWN_NON_REPRO_PACKAGES_LIST']
> > +
> >          self.extraresults =3D {}
> >          self.extraresults.setdefault('reproducible',
> {}).setdefault('files', {})
> >
>
> //Peter
>
>

--=20
Yoann Congal
Smile ECS

--000000000000deebd10636bb838f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 4 =
juin 2025 =C3=A0=C2=A011:14, Peter Kjellerstedt &lt;<a href=3D"mailto:peter=
.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; -----O=
riginal Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt; On Behalf Of Yoann Congal via <a hr=
ef=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">l=
ists.openembedded.org</a><br>
&gt; Sent: den 3 juni 2025 23:59<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank">yoann.congal@smile.fr</a>&gt;; Guillaume Swaenepoel &lt;<a href=
=3D"mailto:guillaume.swaenepoel@smile.fr" target=3D"_blank">guillaume.swaen=
epoel@smile.fr</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH] reproducible: allow each layer to define it=
s known non-repro packages<br>
&gt; <br>
&gt; From: Guillaume Swaenepoel &lt;<a href=3D"mailto:guillaume.swaenepoel@=
smile.fr" target=3D"_blank">guillaume.swaenepoel@smile.fr</a>&gt;<br>
&gt; <br>
&gt; With this change, layers can use a conf/include/known_non_repro.inc fi=
le<br>
&gt; to extend the KNOWN_NON_REPRO_PACKAGES_LIST variable with its own know=
n<br>
&gt; non-reproducible packages to make them automatically excluded from the=
<br>
&gt; reproducible test.<br>
&gt; <br>
&gt; Example of usage, in conf/include/known_non_repro.inc:<br>
&gt;=C2=A0 =C2=A0KNOWN_NON_REPRO_PACKAGES_LIST +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this-package-is-not-reproducible \<br=
>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt; <br>
&gt; This uses the new &quot;include_all&quot; in the reproducible test and=
 will move<br>
&gt; the maintenance burden from AB config[0] to the layers themselves.<br>
&gt; <br>
&gt; Fixes [YOCTO #15699]<br>
&gt; <br>
&gt; [0]: <a href=3D"https://git.yoctoproject.org/yocto-autobuilder-helper/=
tree/config.json#n343" rel=3D"noreferrer" target=3D"_blank">https://git.yoc=
toproject.org/yocto-autobuilder-helper/tree/config.json#n343</a><br>
&gt; <br>
&gt; Co-Developed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile=
.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; Signed-off-by: Guillaume Swaenepoel &lt;<a href=3D"mailto:guillaume.sw=
aenepoel@smile.fr" target=3D"_blank">guillaume.swaenepoel@smile.fr</a>&gt;<=
br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/reproducible.py | 12 ++++++++++++<b=
r>
&gt;=C2=A0 1 file changed, 12 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/o=
eqa/selftest/cases/reproducible.py<br>
&gt; index f06027cb03..e2c3a10f06 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/reproducible.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/reproducible.py<br>
&gt; @@ -14,6 +14,7 @@ import shutil<br>
&gt;=C2=A0 import stat<br>
&gt;=C2=A0 import os<br>
&gt;=C2=A0 import datetime<br>
&gt; +import oeqa.utils.ftools as ftools<br>
&gt; <br>
&gt;=C2=A0 exclude_packages =3D [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
&gt; @@ -158,6 +159,12 @@ class ReproducibleTests(OESelftestTestCase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # reproducible, disable this in your derived test =
class<br>
&gt;=C2=A0 =C2=A0 =C2=A0 build_from_sstate =3D True<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 @classmethod<br>
&gt; +=C2=A0 =C2=A0 def setUpClass(cls):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().setUpClass()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ftools.append_file(os.path.join(cls.build=
dir, &quot;conf/local.conf&quot;), \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\ninclude_all c=
onf/include/known_non_repro.inc\n&quot;)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def setUpLocal(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super().setUpLocal()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 needed_vars =3D [<br>
&gt; @@ -170,6 +177,7 @@ class ReproducibleTests(OESelftestTestCase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;OEQA_REPRODUCIBLE=
_TEST_SSTATE_TARGETS&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;OEQA_REPRODUCIBLE=
_EXCLUDED_PACKAGES&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;OEQA_REPRODUCIBLE=
_TEST_LEAF_TARGETS&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;KNOWN_NON_REPRO_PACKAG=
ES_LIST&#39;,<br>
<br>
Why do you need a new variable? Isn&#39;t this what <br>
OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES is used for?<br></blockquote><div><br><=
/div><div>The idea was at some point to de-couple the two to allow to run t=
he test without the exclusion coming automatically from the layer files.</d=
iv><div>I may have over-thought this one.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_vars =3D get_bb_vars(needed_vars)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for v in needed_vars:<br>
&gt; @@ -189,6 +197,10 @@ class ReproducibleTests(OESelftestTestCase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for leaf_recipe in bb_=
vars[&#39;OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS&#39;].split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sst=
ate_targets.extend(get_bb_var(&#39;DEPENDS&#39;, leaf_recipe).split())<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Apply exclusion from layers (conf/inclu=
de/known_non_repro.inc files)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb_vars[&#39;KNOWN_NON_REPRO_PACKAGES_=
LIST&#39;]:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.oeqa_reproducible_excl=
uded_packages =3D (self.oeqa_reproducible_excluded_packages or &quot;&quot;=
) + bb_vars[&#39;KNOWN_NON_REPRO_PACKAGES_LIST&#39;]<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.extraresults =3D {}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.extraresults.setdefault(&#39;re=
producible&#39;, {}).setdefault(&#39;files&#39;, {})<br>
&gt; <br>
<br>
//Peter<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000deebd10636bb838f--

