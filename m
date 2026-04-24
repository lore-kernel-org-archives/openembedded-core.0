Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9CCFE51E5
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:45:01 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16868.1777020297022808378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 01:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MZQwuxck;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6729c6f0ca7so9027117a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 01:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777020295; cv=none;
        d=google.com; s=arc-20240605;
        b=jZd5joQ85y/2V2bIawp7yM7ELFJUXD+q3tAYfFzbAtzqEBb4xfp3GcBaYJ43GvxIRR
         SiO8UO8zpirYB4AGmMEXNefGsKEkYBrfoHfTS3raLg9aBZ5ByJq8Nm7bqv6XuxOGArk+
         YLzrSyMp9lw+vL53kR2KCL5kIjQ3UIsAvBG26+zvTwIG8qRYwVvCN65GW6jQ+IWrgmLf
         WcOz1EWOgsBorubdyRjpNQ/f9f+Zf+Zid/ZU1tH0ODJZQL2KCcD9yWg1bfLagzU+p1pU
         Hahp+jyAUS/7Kip20iwFoRJh7tYg5gxqhxJ+pcYkiOtvfaoSecrcTa5JF+GKTvhTEK1U
         pmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qF17+Rq3Ao/qPaziNOUnS8zBAdKd7I2drIACZKmCLkc=;
        fh=MON4YVbYFRcBzSKXnURwQ5FxGz4ua+sedovowY7SohU=;
        b=RBmcvczbpk7MFvjqczsLsXHe9gPD0kjQGXrncW13bQQ9Upkn4i74ZqynpWqal2M1y2
         AYY9cwm4ybAjAqPQ8uUrfaQv40agBn8WQqTfwiRP4Zc1R+n/l8PojLaBMWmh92sxVEM8
         FciqrVWpuTlDOw6Dv4zQhtXO1MCsUWIFnOk6V8VOrAXr/W6X5GxViIFqk4GrBQfRypqT
         WCwr482e9R1c66mOB7lYVIFPw4anGpTTD7LsmaOUdvHDjuHHVxEj5v2n3s3IaH8KpIdG
         4evtCKW/gguMduIrtpWO+udrSv+ExEvi3SxB0LWNbZKnJpg6KMLf+ABakx+R5aFFsKrV
         sQNg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777020295; x=1777625095; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qF17+Rq3Ao/qPaziNOUnS8zBAdKd7I2drIACZKmCLkc=;
        b=MZQwuxckO7TmJ67TBxFcj9S0pEJHpLz7zOIZtC9JGGq8ypzHuPAcmo7mwoUgla0t9S
         k2uyR+HBHI7WKX3AuRNxIAgcpYlwkgX6sDg5Q3cJtt+ojBMUnSVtpiL77JNsBKfKp3ym
         EBh9iE3wVQ+I7JpFQgu8az88XFqjOhGp7CQONyTiKDhNAdYpViDu8rYAs3HMWXfqpZqW
         5dx+0oYuksGHuUh0AxrAPgvJhC9Y6QY8UivtdbZRR/tOkSmLkIZX1GdXo6lZMCp/Ci1c
         UQzXfzb3YirDLeshmKAYB1rG6Ao4ul5QZX5jian4jyHdEkyLOnebs95Pn7FMKljqpnvn
         U5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777020295; x=1777625095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qF17+Rq3Ao/qPaziNOUnS8zBAdKd7I2drIACZKmCLkc=;
        b=EZ772KDno+njBBhksu/NK8ui9G60Th3BW5NFIY9TFm2t/7SvnmSFf5b0iwh1DOCYUH
         vTapPElzDKEbh1J+2lO0jvwVNsA+9A7PtjqokgaufYJ4B9cS5XSVXjqIGgpRQ1pPiF4a
         yWDyNWyWnGIT8A3mqehtgCV9eb8eLyDYQcPbJuH4vaTpFRPwL68SgjagsCK/s5Am1ibr
         OC0RQhfoezL56pnJwrpYEXpBJOt0gL2SqeU/aIqCrBLqUEUqoF8YFq2Gq1h/8QSM9Mg1
         TsOpZYqeveioXWbfDu6aotCfKhI7+zktSYa3aR9LTMxBVdGcHJOeKwgO6ltCpZC6P1I4
         ZvfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZmWuXYnRg/GIwCCiRiqnfkXzbBp90ZajJcT4/3GG44s+joVnMjKayThVQCj2YMkcSRduq+5BjLj623EQGAGBfWQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWpxyy1HL19gHk97lE3sw4FojCOg6qdUyx3lrs7SH9wx5PRLdW
	1NrYwDpxKprcy/+GdMlEwdGjZyTcEbT0581d+A/EipYYoskbFpuA95qWkO9LQPtqqnCqBF5BXbg
	7yJ4FuVvaANBme7cmcGqAcjQsqxlPLi5wt/p8
X-Gm-Gg: AeBDieu3MyS2IZBST03ZeDPlwc6oThmaoWfovOSYX6E1n1C4oXOb/QxsjLaQz7XVMlo
	4LACfnRpNekMjqb2ZPpImYfTqT+HT/oNlkDLgz+P80u32a2k8GrjVZMpMToll+ec/9kjxDZgeo4
	cDpFCS8TbAqDEPb2vLUmXPUi87cow58pmh388ulx465e6l8Crfl5D2eJvgGbJOT2DI/R9qLMqeU
	AVSyBtEzmMczNGpKY5vUeZItPWxtWPC0gX4LTzmtV//Z9i8/0E2mIirv31ga9igbNXw81Rdn/Iw
	odICr1kBJ3jScg/CAXLb3ZG7DWtophXC8euEyaR9icUhMmJk0RFMjAj/CvcfCrvWys6qChW8F0P
	bpF2yAQ==
X-Received: by 2002:a17:906:6a03:b0:bac:779a:1d5b with SMTP id
 a640c23a62f3a-bac779a1dc1mr357759766b.13.1777020294828; Fri, 24 Apr 2026
 01:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260401-default-features-v3-0-8f4b40401ab7@pbarker.dev>
 <20260401-default-features-v3-2-8f4b40401ab7@pbarker.dev> <18A8B511426C8EDA.1516946@lists.openembedded.org>
 <CANPvuRmjv0YyiPqACX6JuhUfxSTYsiCQfstHxA+kFmE0sny+bg@mail.gmail.com>
 <b44d65517593ec7279aef2618f49e00908eb938c.camel@pbarker.dev> <18A8F319FD743690.2028604@lists.openembedded.org>
In-Reply-To: <18A8F319FD743690.2028604@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 24 Apr 2026 09:44:42 +0100
X-Gm-Features: AQROBzDCh0kMJ9jxJ70hUgApTZw5XO-xtBJF1jYPHc275YWt6-D_KZTEdYFB51k
Message-ID: <CANPvuRk19e3PhcVXxLUJTjaPE9bMXO-04MLytqGNpA0=PEzeeA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/4] meta: Support opting out of any distro features
To: quaresma.jose@gmail.com
Cc: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006e95cb065030c7d3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 08:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235846

--0000000000006e95cb065030c7d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (quinta, 23/04/2026 =C3=A0(s) 10=
:42):

>
>
> Paul Barker <paul@pbarker.dev> escreveu (quinta, 23/04/2026 =C3=A0(s) 10:=
12):
>
>> On Wed, 2026-04-22 at 21:26 +0100, Jose Quaresma wrote:
>> > Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
>> > gmail.com@lists.openembedded.org> escreveu (quarta, 22/04/2026 =C3=A0(=
s)
>> 15:45):
>> >
>> > > Hi Paul,
>> > >
>> > > I think I found a bug that is somehow related to
>> DISTRO_FEATURES_DEFAULTS.
>> > > I don't understand why, but the variables in
>> > > DISTRO_FEATURES_DEFAULTS cannot
>> > > be used in inherit or inherit_defer.
>> > >
>> > > Let's use the following recipe as an example:
>> > >
>> > >
>> ------------------------------------------------------------------------=
-------------------------------------------
>> > > mkdir -p recipes-test/inherit
>> > > cat <<'EOF' >recipes-test/inherit/inherit.bb
>> > >
>> > > LICENSE =3D "MIT"
>> > >
>> > > # FAIL
>> > > PACKAGECONFIG ??=3D " \
>> > >         ${@bb.utils.contains('DISTRO_FEATURES',
>> > > 'gobject-introspection-data', 'ccache', '', d)} \
>> > >         ${@bb.utils.contains('DISTRO_FEATURES',
>> > > 'gobject-introspection-data', 'vala', '', d)} \
>> > > "
>> > >
>> > > # OK
>> > > #PACKAGECONFIG ??=3D " \
>> > > #        ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'ccache'=
,
>> '',
>> > > d)} \
>> > > #        ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'vala',
>> '',
>> > > d)} \
>> > > #"
>> > >
>> > > # get PACKAGECONFIG
>> > > # bitbake-getvar -r inherit PACKAGECONFIG
>> > >
>> > > # get CCACHE_TOP_DIR
>> > > # bitbake-getvar -r inherit CCACHE_TOP_DIR
>> > > inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'ccache', d)}
>> > >
>> > > # get VALADEPENDS
>> > > # bitbake-getvar -r inherit VALADEPENDS
>> > > inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'vala', d)}
>> > > EOF
>> > >
>> > >
>> ------------------------------------------------------------------------=
-------------------------------------------
>> > >
>> >
>> > A clearer way to replicate the problem:
>> >
>> > #
>> >
>> ------------------------------------------------------------------------=
-------------------------------------------
>> > mkdir -p recipes-test/inherit
>> > cat <<'EOF' >recipes-test/inherit/inherit.bb
>> > LICENSE =3D "MIT"
>> >
>> > DISTRO_FEATURES_DEFAULTS +=3D "aaa"
>> > DISTRO_FEATURES +=3D "bbb"
>> >
>> > PACKAGECONFIG =3D " \
>> >         ${@bb.utils.contains('DISTRO_FEATURES', 'aaa', 'ccache', '',
>> d)} \
>> >         ${@bb.utils.contains('DISTRO_FEATURES', 'bbb', 'vala', '', d)}=
 \
>> > "
>> >
>> > inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'ccache', d)}
>> >
>> > inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'vala', d)}
>> > EOF
>> > #
>> >
>> ------------------------------------------------------------------------=
-------------------------------------------
>> > bitbake-getvar --value -r inherit PACKAGECONFIG
>> > bitbake-getvar --value -r inherit CCACHE_TOP_DIR
>> > bitbake-getvar --value -r inherit VALADEPENDS
>> > #
>> >
>> ------------------------------------------------------------------------=
-------------------------------------------
>> >
>> >
>> > The DISTRO_FEATURES is mapped to inherit/inherit_defer as follows:
>> >  'aaa' maps to  'ccache'
>> >  'bbb' maps to  'vala'
>> >
>> > I chose these two classes, but it could be any others. The idea is to
>> see
>> > if they were inherited by looking at the class variables.
>> > The ccache.bbclass was not inherit and so the variable 'CCACHE_TOP_DIR=
'
>> is
>> > not defined.
>> >
>> >
>> > Hence my conclusion that DISTRO_FEATURES_DEFAULTS doesn't work for the=
se
>> > cases, which in my opinion is not expected.
>> >
>> > I encountered this problem while debugging the patch
>> > https://lists.openembedded.org/g/openembedded-devel/topic/118939974.
>> >
>> > Best regards,
>> > Jose
>> >
>>
>> Hi Jose,
>>
>> We can simplify this even further to demonstrate what bitbake is doing:
>>
>>     LICENSE =3D "MIT"
>>
>>     python () {
>>         d.setVar('MAYBE_VALA', 'vala')
>>     }
>>
>>     inherit_defer ${@bb.utils.filter('MAYBE_VALA', 'vala', d)}
>>
>> Looking at the output of `bitbake -e`, MAYBE_VALA is set to "vala" but
>> the vala bbclass is not included.
>>
>> If we simplify the last line to `inherit_defer ${MAYBE_VALA}` we get a
>> parse error. It also doesn't work with plain inherit.
>
>
>> This contadicts the example in the bitbake docs [1], which suggests that
>> a variable assigned in an anonymous Python block can be used with
>> inherit_defer.
>>
>> [1]:
>> https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-us=
er-manual-metadata.html#inherit-defer-directive
>>
>> I will investigate further!
>>
>
> Looks like you found a much simpler way to reproduce.
> Yesterday I spent all afternoon trying to figure out a way to reproduce i=
t
> because at first it didn't make any sense at all.
>
> It seems the problem is somehow related to the python setvar usage.
> Given that some of the values in DISTRO_FEATURES are now set using the
> setvar function,
> like the ones from DISTRO_FEATURES_DEFAULTS, it will suffer from this
> problem.
>
> Thus some of the elements in DISTRO_FEATURES won't be usable in
> inherit/inherit_defer.
> This is a serious bug affecting DISTRO_FEATURES, which is widely used.
>

The problem was solved by Richard [1] and the inherit is now working again
as expected.

Thank you for your effort and record-time resolution! I would never have
been able to solve this problem myself.

[1]
https://git.openembedded.org/openembedded-core/commit/?id=3D6b553a5042b9d58=
28a9da675ede16e10f06dae90

Jose


>
> I will continue my analysis as well, but I doubt I will find any solution=
.
>
> Thanks
>
> Jose
>
>
>> Best regards,
>>
>> --
>> Paul Barker
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235753):
> https://lists.openembedded.org/g/openembedded-core/message/235753
> Mute This Topic: https://lists.openembedded.org/mt/118620443/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000006e95cb065030c7d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.=
com@lists.openembedded.org</a>&gt; escreveu (quinta, 23/04/2026 =C3=A0(s) 1=
0:42):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Paul Barker &lt;<a href=3D"mailto:paul@pbarke=
r.dev" target=3D"_blank">paul@pbarker.dev</a>&gt; escreveu (quinta, 23/04/2=
026 =C3=A0(s) 10:12):<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, 2026-04-22 at 21:26 +0100, Jose Quaresma wrote:<br>
&gt; Jose Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a> &lt;quaresma.jose=3D<=
br>
&gt; <a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">=
gmail.com@lists.openembedded.org</a>&gt; escreveu (quarta, 22/04/2026 =C3=
=A0(s) 15:45):<br>
&gt; <br>
&gt; &gt; Hi Paul,<br>
&gt; &gt; <br>
&gt; &gt; I think I found a bug that is somehow related to DISTRO_FEATURES_=
DEFAULTS.<br>
&gt; &gt; I don&#39;t understand why, but the variables in<br>
&gt; &gt; DISTRO_FEATURES_DEFAULTS cannot<br>
&gt; &gt; be used in inherit or inherit_defer.<br>
&gt; &gt; <br>
&gt; &gt; Let&#39;s use the following recipe as an example:<br>
&gt; &gt; <br>
&gt; &gt; -----------------------------------------------------------------=
--------------------------------------------------<br>
&gt; &gt; mkdir -p recipes-test/inherit<br>
&gt; &gt; cat &lt;&lt;&#39;EOF&#39; &gt;recipes-test/inherit/<a href=3D"htt=
p://inherit.bb" rel=3D"noreferrer" target=3D"_blank">inherit.bb</a><br>
&gt; &gt; <br>
&gt; &gt; LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt; <br>
&gt; &gt; # FAIL<br>
&gt; &gt; PACKAGECONFIG ??=3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO=
_FEATURES&#39;,<br>
&gt; &gt; &#39;gobject-introspection-data&#39;, &#39;ccache&#39;, &#39;&#39=
;, d)} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO=
_FEATURES&#39;,<br>
&gt; &gt; &#39;gobject-introspection-data&#39;, &#39;vala&#39;, &#39;&#39;,=
 d)} \<br>
&gt; &gt; &quot;<br>
&gt; &gt; <br>
&gt; &gt; # OK<br>
&gt; &gt; #PACKAGECONFIG ??=3D &quot; \<br>
&gt; &gt; #=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;, &#39;systemd&#39;, &#39;ccache&#39;, &#39;&#39;,<br>
&gt; &gt; d)} \<br>
&gt; &gt; #=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;, &#39;systemd&#39;, &#39;vala&#39;, &#39;&#39;,<br>
&gt; &gt; d)} \<br>
&gt; &gt; #&quot;<br>
&gt; &gt; <br>
&gt; &gt; # get PACKAGECONFIG<br>
&gt; &gt; # bitbake-getvar -r inherit PACKAGECONFIG<br>
&gt; &gt; <br>
&gt; &gt; # get CCACHE_TOP_DIR<br>
&gt; &gt; # bitbake-getvar -r inherit CCACHE_TOP_DIR<br>
&gt; &gt; inherit_defer ${@bb.utils.filter(&#39;PACKAGECONFIG&#39;, &#39;cc=
ache&#39;, d)}<br>
&gt; &gt; <br>
&gt; &gt; # get VALADEPENDS<br>
&gt; &gt; # bitbake-getvar -r inherit VALADEPENDS<br>
&gt; &gt; inherit_defer ${@bb.utils.filter(&#39;PACKAGECONFIG&#39;, &#39;va=
la&#39;, d)}<br>
&gt; &gt; EOF<br>
&gt; &gt; <br>
&gt; &gt; -----------------------------------------------------------------=
--------------------------------------------------<br>
&gt; &gt; <br>
&gt; <br>
&gt; A clearer way to replicate the problem:<br>
&gt; <br>
&gt; #<br>
&gt; ----------------------------------------------------------------------=
---------------------------------------------<br>
&gt; mkdir -p recipes-test/inherit<br>
&gt; cat &lt;&lt;&#39;EOF&#39; &gt;recipes-test/inherit/<a href=3D"http://i=
nherit.bb" rel=3D"noreferrer" target=3D"_blank">inherit.bb</a><br>
&gt; LICENSE =3D &quot;MIT&quot;<br>
&gt; <br>
&gt; DISTRO_FEATURES_DEFAULTS +=3D &quot;aaa&quot;<br>
&gt; DISTRO_FEATURES +=3D &quot;bbb&quot;<br>
&gt; <br>
&gt; PACKAGECONFIG =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;, &#39;aaa&#39;, &#39;ccache&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;, &#39;bbb&#39;, &#39;vala&#39;, &#39;&#39;, d)} \<br>
&gt; &quot;<br>
&gt; <br>
&gt; inherit_defer ${@bb.utils.filter(&#39;PACKAGECONFIG&#39;, &#39;ccache&=
#39;, d)}<br>
&gt; <br>
&gt; inherit_defer ${@bb.utils.filter(&#39;PACKAGECONFIG&#39;, &#39;vala&#3=
9;, d)}<br>
&gt; EOF<br>
&gt; #<br>
&gt; ----------------------------------------------------------------------=
---------------------------------------------<br>
&gt; bitbake-getvar --value -r inherit PACKAGECONFIG<br>
&gt; bitbake-getvar --value -r inherit CCACHE_TOP_DIR<br>
&gt; bitbake-getvar --value -r inherit VALADEPENDS<br>
&gt; #<br>
&gt; ----------------------------------------------------------------------=
---------------------------------------------<br>
&gt; <br>
&gt; <br>
&gt; The DISTRO_FEATURES is mapped to inherit/inherit_defer as follows:<br>
&gt;=C2=A0 &#39;aaa&#39; maps to=C2=A0 &#39;ccache&#39;<br>
&gt;=C2=A0 &#39;bbb&#39; maps to=C2=A0 &#39;vala&#39;<br>
&gt; <br>
&gt; I chose these two classes, but it could be any others. The idea is to =
see<br>
&gt; if they were inherited by looking at the class variables.<br>
&gt; The ccache.bbclass was not inherit and so the variable &#39;CCACHE_TOP=
_DIR&#39; is<br>
&gt; not defined.<br>
&gt; <br>
&gt; <br>
&gt; Hence my conclusion that DISTRO_FEATURES_DEFAULTS doesn&#39;t work for=
 these<br>
&gt; cases, which in my opinion is not expected.<br>
&gt; <br>
&gt; I encountered this problem while debugging the patch<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/topic/1=
18939974" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/g/openembedded-devel/topic/118939974</a>.<br>
&gt; <br>
&gt; Best regards,<br>
&gt; Jose<br>
&gt; <br>
<br>
Hi Jose,<br>
<br>
We can simplify this even further to demonstrate what bitbake is doing:<br>
<br>
=C2=A0 =C2=A0 LICENSE =3D &quot;MIT&quot;<br>
<br>
=C2=A0 =C2=A0 python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;MAYBE_VALA&#39;, &#39;vala&#39;)<=
br>
=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 inherit_defer ${@bb.utils.filter(&#39;MAYBE_VALA&#39;, &#39;v=
ala&#39;, d)}<br>
<br>
Looking at the output of `bitbake -e`, MAYBE_VALA is set to &quot;vala&quot=
; but<br>
the vala bbclass is not included.<br>
<br>
If we simplify the last line to `inherit_defer ${MAYBE_VALA}` we get a<br>
parse error. It also doesn&#39;t work with plain inherit.</blockquote><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
This contadicts the example in the bitbake docs [1], which suggests that<br=
>
a variable assigned in an anonymous Python block can be used with<br>
inherit_defer.<br>
<br>
[1]: <a href=3D"https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manu=
al/bitbake-user-manual-metadata.html#inherit-defer-directive" rel=3D"norefe=
rrer" target=3D"_blank">https://docs.yoctoproject.org/bitbake/dev/bitbake-u=
ser-manual/bitbake-user-manual-metadata.html#inherit-defer-directive</a><br=
>
<br>
I will investigate further!<br></blockquote><div><br></div><div>Looks like =
you found a much simpler way to reproduce.</div><div>Yesterday I spent all =
afternoon trying to figure out a way to reproduce it because at first it di=
dn&#39;t make any sense at all.<br><br>It seems the problem is somehow rela=
ted to the python setvar usage.<br>Given that some of the values in DISTRO_=
FEATURES=C2=A0are now set using the setvar=C2=A0function,</div><div>like th=
e ones from=C2=A0DISTRO_FEATURES_DEFAULTS, it will suffer from this problem=
.</div><div><br></div><div>Thus some of the elements in DISTRO_FEATURES won=
&#39;t be usable in inherit/inherit_defer.<br>This is a serious bug affecti=
ng DISTRO_FEATURES, which is widely used.</div></div></div></blockquote><di=
v><br></div><div>The problem was solved by=C2=A0<span style=3D"color:rgb(51=
,51,51);font-family:sans-serif;font-size:13.3333px">Richard</span>=C2=A0[1]=
 and the inherit=C2=A0is now working again as expected.<br><br></div><div>T=
hank you for your effort and record-time resolution! I would never have bee=
n able to solve this problem myself.</div><div><br></div><div>[1] <a href=
=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D6b553a5042b=
9d5828a9da675ede16e10f06dae90">https://git.openembedded.org/openembedded-co=
re/commit/?id=3D6b553a5042b9d5828a9da675ede16e10f06dae90</a></div><div><br>=
</div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><di=
v>I will continue my analysis as well, but I doubt I will find any solution=
.</div><div><br></div><div>Thanks</div><div><br></div><div>Jose</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#235753): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/235753" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/235753</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118620443/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118620443/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000006e95cb065030c7d3--

