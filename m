Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9D0E92FC8
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 17:50:24 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48051.1767030620297291843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 09:50:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nwh9NDYb;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6466d8fd383so6859022d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 09:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767030619; x=1767635419; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ATfctlHeJzG9sd47oTfZxffk+2Lo+ejEBNROjrh8sYs=;
        b=Nwh9NDYbpyKQt4+1CxaaNG/WoeOBbIHl0KcfqnuCSIESx3QE9HT1VHduNaUqX7hRaR
         QGMQ9LjjNwr+yPkYLX5otqPAP70SJ0cuIeTpvWFECsyB2P0/xtojmWEneHsl8rUUi4BR
         86lMKJhwy/ru7pN+vKxp/WORa+IhhX2h04pgR9p0L18/tbRSgNih1rHgJV+23Z+XPxlx
         auTjEDezydsmN5koT4Ga/RWgaKr4M3VZqbrWcaJ4pd2TTja+DnrEUpFL3G8Ck0ND0RFE
         II3ruNzZSu6xsxpwHH65/NrsaL1z4njEvMVcnfqf6orR9yqiKHcMvxXcW+Iosw8w7nyi
         VybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767030619; x=1767635419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATfctlHeJzG9sd47oTfZxffk+2Lo+ejEBNROjrh8sYs=;
        b=uwL993U8Fk0qXbVFCjnfz0ILJT85QlVoStFYarWvtbukyhR+npG1V1blnw/uAxXtUo
         as8PA+egzYRe4GKd5ATbEvyjd4BGuSdag/b1JjJcbMCDUU8xlZeU4FbMgzgBUjJMZD+e
         H9BNGuDnW6YGMxZsK9cLjD2TM6kxnzwPYAiVm1X6GOHDoO/JqlSvPHeHzGCya+QawU3Y
         8QhApl7vC1Rlcgv4sSHePplAQ5R1Gn+jgYMCgCwlYw+ek+j8tbYtzllfUfLT1s9Yw1Se
         wH508yVXQkP0Z6x6V1uftUzxV2rczg5FJKVpsQiYefDUCdCbP98MMYOVmQQlWKDu36NM
         TnYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKS/lD17Pjx4eRNGIaxX9lLDQrOA7Z3ETTosQmiP7KCnVKt1P+iit4LXqBC9Vfji8U3F8misxfXkiGlFAUhV0mlQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwiAzY+3D1HI+NoUXEnxP33SrDiaK2O8nSxT6CAWfL0+yoHbHTo
	80xD93bdZGKLqMamaN+W2udFG7rAvLGELJvqMFpHmlBs2qlfV3icqi7XU69oTQJrF/uPNj6Ids6
	NHonMS/UOwTofCj6A2q7YXIPIPDSFeAM=
X-Gm-Gg: AY/fxX6zWXP0LtSXhTPrj1edDOo6Pr5iq1hxlHXfx2I5xGW+AAaVKk9BDS4YIxR1b3W
	TPddQF4dOH+PAtStCZ0OyC0EUjR1fJoffg9Bm/xEEWJEf49nyaRYVRDoCJaAp6Pw1vJQuLrAMYe
	r/mHnYEJBSYuzqwnMQQsP6nulXX0ysm//mki8LH+kNNiFCiSzXDE0fteWB9M+XHWPY/UggotHyR
	Rft4JQEFCicF4W5fs/bdSJaFs6x3QlkAeHLyTcYFhizTAoe7DAdnhnvcSQlAnIEN0vJUbz5qF0T
	5uq5SxjY4nl82XAbhF0wsoc5O/lOdlyCvr+C0i+gdwHyGIlo4G7YA6iZDPzJhYtFmljsNdcOX+2
	mSqlNq3PSqlqW7I+SCTm2kw==
X-Google-Smtp-Source: AGHT+IHKlfRzCP+YuVcmAsmhXC57XbdgfWqmVHxFjlYcN02j97pNYw57UHyXe/94RJ1eQa9uOQGHpUxmbhud2RRTjAw=
X-Received: by 2002:a53:e035:0:b0:644:46c8:b990 with SMTP id
 956f58d0204a3-6466a8a45bcmr19427138d50.32.1767030619141; Mon, 29 Dec 2025
 09:50:19 -0800 (PST)
MIME-Version: 1.0
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
 <20251219032209.960840-6-ankur.tyagi85@gmail.com> <CAOSpxdaU84M9x_HMBeNVG3uJM+0hMXuBUo2QS1VFGFU0X5DHUg@mail.gmail.com>
In-Reply-To: <CAOSpxdaU84M9x_HMBeNVG3uJM+0hMXuBUo2QS1VFGFU0X5DHUg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Dec 2025 09:49:53 -0800
X-Gm-Features: AQt7F2oGEOJ5JqHt6D2W2PVTmjzd9V6Ww3u3hFFz87cOBWdrDFbydZaTFl8STMI
Message-ID: <CAMKF1srgbwSUmPrgXX8MjUzwgKsSv_kGfEaEMH0AYcnxYaw4Eg@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH v2 05/29] spirv-llvm-translator:
 Upgrade to 21.1.2
To: Steve Sakoman <steve@sakoman.com>
Cc: ankur.tyagi85@gmail.com, openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000005c7bbe06471ae01f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 17:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228611

--0000000000005c7bbe06471ae01f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 9:32=E2=80=AFAM Steve Sakoman <steve@sakoman.com> w=
rote:

> On Thu, Dec 18, 2025 at 7:22=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > [Backport to 21] Implement SPV_INTEL_predicated_io extension (#3370)
> (#3386)
>
> This is a feature addition, thus not eligible for backport
>

That is perhaps fine since we do not bump either libclc or mesa major
versions on releases we technically
will not need this on the release branch.


>
> Steve
>
> > [Backport to 21] Fix incorrect translation for AtomicCmpExchangeWeak
> builtin ptr arg type. (#3390) (#3392)
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
> > (cherry picked from commit a824c087bd3f3af36374efd45ce6fb8838f813b7)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  ...lvm-translator_21.1.1.bb =3D> spirv-llvm-translator_21.1.2.bb} | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-graphics/spir/{spirv-llvm-translator_21.1.1.bb =3D=
>
> spirv-llvm-translator_21.1.2.bb} (94%)
> >
> > diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb
> b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
> > similarity index 94%
> > rename from meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb
> > rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
> > index 503e7df644..763afbd608 100644
> > --- a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb
> > +++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.TXT;md5=3D47e311aa9caedd1b3abf098bd7814d1d"
> >
> >  # pattern: llvm_branch_200, currently there are no minor releases, so,
> no llvm_branch_201
> >  SPIRV_BRANCH =3D "llvm_release_${@oe.utils.trim_version('${PV}',
> 1).replace('.', '')}0"
> > -SRCREV =3D "29758b55816c14abb3e4142d42aca7a95bf46710"
> > +SRCREV =3D "a37544fc0bb90b4e8b8d755580119c018891dfa4"
> >  SRC_URI =3D " \
> >      git://
> github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=3Dhttps;tag=3Dv${P=
V};branch=3D${SPIRV_BRANCH}
> <http://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=3Dhttps;ta=
g=3Dv$%7BPV%7D;branch=3D$%7BSPIRV_BRANCH%7D>
> \
> >  "
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#228173):
> https://lists.openembedded.org/g/openembedded-core/message/228173
> > Mute This Topic: https://lists.openembedded.org/mt/116854360/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000005c7bbe06471ae01f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 29,=
 2025 at 9:32=E2=80=AFAM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.=
com">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Thu, Dec 18, 2025 at 7:22=E2=80=AFPM Ankur Tyagi v=
ia <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_=
blank">lists.openembedded.org</a><br>
&lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt;<br>
&gt; [Backport to 21] Implement SPV_INTEL_predicated_io extension (#3370) (=
#3386)<br>
<br>
This is a feature addition, thus not eligible for backport<br></blockquote>=
<div><br></div><div>That is perhaps fine since we do not bump either libclc=
 or mesa major versions on releases we technically</div><div>will not need =
this on the release branch.=C2=A0</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Steve<br>
<br>
&gt; [Backport to 21] Fix incorrect translation for AtomicCmpExchangeWeak b=
uiltin ptr arg type. (#3390) (#3392)<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dub=
ois-briand@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com=
</a>&gt;<br>
&gt; (cherry picked from commit a824c087bd3f3af36374efd45ce6fb8838f813b7)<b=
r>
&gt; Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.c=
om" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...<a href=3D"http://lvm-translator_21.1.1.bb" rel=3D"noreferrer=
" target=3D"_blank">lvm-translator_21.1.1.bb</a> =3D&gt; <a href=3D"http://=
spirv-llvm-translator_21.1.2.bb" rel=3D"noreferrer" target=3D"_blank">spirv=
-llvm-translator_21.1.2.bb</a>} | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta/recipes-graphics/spir/{<a href=3D"http://spirv-llvm-=
translator_21.1.1.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-trans=
lator_21.1.1.bb</a> =3D&gt; <a href=3D"http://spirv-llvm-translator_21.1.2.=
bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translator_21.1.2.bb</a=
>} (94%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-t=
ranslator_21.1.1.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-transl=
ator_21.1.1.bb</a> b/meta/recipes-graphics/spir/<a href=3D"http://spirv-llv=
m-translator_21.1.2.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-tra=
nslator_21.1.2.bb</a><br>
&gt; similarity index 94%<br>
&gt; rename from meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-tr=
anslator_21.1.1.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-transla=
tor_21.1.1.bb</a><br>
&gt; rename to meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-tran=
slator_21.1.2.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translato=
r_21.1.2.bb</a><br>
&gt; index 503e7df644..763afbd608 100644<br>
&gt; --- a/meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-translat=
or_21.1.1.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translator_21=
.1.1.bb</a><br>
&gt; +++ b/meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-translat=
or_21.1.2.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translator_21=
.1.2.bb</a><br>
&gt; @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.TXT;md5=3D47=
e311aa9caedd1b3abf098bd7814d1d&quot;<br>
&gt;<br>
&gt;=C2=A0 # pattern: llvm_branch_200, currently there are no minor release=
s, so, no llvm_branch_201<br>
&gt;=C2=A0 SPIRV_BRANCH =3D &quot;llvm_release_${@oe.utils.trim_version(&#3=
9;${PV}&#39;, 1).replace(&#39;.&#39;, &#39;&#39;)}0&quot;<br>
&gt; -SRCREV =3D &quot;29758b55816c14abb3e4142d42aca7a95bf46710&quot;<br>
&gt; +SRCREV =3D &quot;a37544fc0bb90b4e8b8d755580119c018891dfa4&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/KhronosGroup/SP=
IRV-LLVM-Translator;protocol=3Dhttps;tag=3Dv$%7BPV%7D;branch=3D$%7BSPIRV_BR=
ANCH%7D" rel=3D"noreferrer" target=3D"_blank">github.com/KhronosGroup/SPIRV=
-LLVM-Translator;protocol=3Dhttps;tag=3Dv${PV};branch=3D${SPIRV_BRANCH}</a>=
 \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#228173): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/228173" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/228173</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11685436=
0/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/116854360/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000005c7bbe06471ae01f--

