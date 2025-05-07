Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C17C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 22:05:38 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.1771.1746655532353921171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 15:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=j9z6scLQ;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a0b308856fso243730f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 15:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746655530; x=1747260330; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C5ZLwKNbb8oaHVhpgwj0+8MXdKZqCwxTyEJGQiwwUDk=;
        b=j9z6scLQkZQtNfZ2rsXdg2yAkwsLvoiDtqFwTBiXNMVapX/JEKD2ofoFViaqWeAzci
         RW8FmjzPAaZc5evgckmtBB2KAdww4BCWQuAtfBGD9AH+tT3gPwZmaXWaBA8DbCxo+8U1
         +ZANbjq76EyHnEZiPMDzQfTudE93o3rGhThSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746655530; x=1747260330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5ZLwKNbb8oaHVhpgwj0+8MXdKZqCwxTyEJGQiwwUDk=;
        b=nnJgm6uCPja6QEdB2PEiP1G9PwzXTmkttnxByAhjl4PaxWIYpP1pU8/XKiqGJMXDIc
         yYW53ZxtbaPGZNGnPlItkOAjZmpjHkjM0A82tKrHerTdgEJLEDURDLrgtpm88DqI6YTm
         JqatA4IGN/Ceoabz/vc7bbPKAfHeCi+WA0DAHRbs9Hy0bHT1IM8es4jj3pqSI1Oa7uJj
         83DCGZeDSLufZ6x5uf3r8/lmXYVWrc1/3eSxqgq89YiQTR+9SZJOwnJAvHWDNCM8EW0o
         SCIU4wvPqVs+tEqYTBhPKQj3KBhwYhMH4T+SAmiXtniJnC9xzx3kID0OT3WSTscdJA1j
         MOTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcmUBkFOWWhHlAet5wai6JeLOFzmUhaI4tKqlrSJX6LbNqptG0tCeBkGia0w1OWbEZVMLaIuTzS/TUqZ8zQfFWPg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyk5P2iOgkUAQpa3nqzACzTqHxQAf9vzPuTSj5Wm739tN+V4C0C
	izcAB4Mt6o7khLr5S2T+ATjO88HBl56tbVuhXl1M57VOP50oYfnN1piI+nXqeneSOQ2JdwafLfC
	bfUCnsEZ8nBr5FVZ0PdiKJlHPU7MqGStbGqjkzA==
X-Gm-Gg: ASbGnctsvN11U2zsouQhHZ9TGDAPpiGlFAXZz7R2GxLfdejTZDBs3kO3QBAYa09YGZS
	Qtqcgith94E5ZVSTHtoMIZgpRNyikgDmP5T3G3EZZ/PK05Zp9wPh4bMuE00JfMIvnsN2Ar16VJ7
	zsqK7p4HP/sDLUGvO2xaS+elGlDyMOPGkNDltcXzsrOcpy/Zt2H+CT37Ka
X-Google-Smtp-Source: AGHT+IFENbQHuzymPsOgV/MS5765MDxOdvI30YQB7AHYPdAAjSmBUUvz031tmPEcRljIJn2p75WbrKdPwF4vdgQXGQE=
X-Received: by 2002:a05:6000:184f:b0:391:41c9:7a8d with SMTP id
 ffacd0b85a97d-3a0ba103534mr509167f8f.54.1746655530519; Wed, 07 May 2025
 15:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250505101642.9255-2-ines.kchelfi@smile.fr> <CANNYZj9u7=F533yq-KEiYY3jVmm3DWh3VjLaoMhYV6=EZW20Pg@mail.gmail.com>
In-Reply-To: <CANNYZj9u7=F533yq-KEiYY3jVmm3DWh3VjLaoMhYV6=EZW20Pg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 8 May 2025 00:05:04 +0200
X-Gm-Features: ATxdqUHN9Oq5qt47Z06-RkFybPHD0MP6MyuQS0c-gDwiR9uCqsnmbANUksYwM2o
Message-ID: <CAMSfU+7SjsrUvCG-zs0NjDvxUMHfoajYC3tdwqF=4F5v6OJquQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm-sequoia: add ptest
To: alex.kanavin@gmail.com
Cc: ines.kchelfi@smile.fr, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000711fd3063492ee12"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 22:05:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216135

--000000000000711fd3063492ee12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 5 mai 2025 =C3=A0 18:51, Alexander Kanavin via lists.openembedded.o=
rg
<alex.kanavin=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> On Mon, 5 May 2025 at 12:17, ines.kchelfi via lists.openembedded.org
> <ines.kchelfi=3Dsmile.fr@lists.openembedded.org> wrote:
> > Also patch the libray name to match what is installed.
> > +Subject: [PATCH] Force the use of librpm_sequoia.so.1 instead of
> librpm_sequoia.so
> > +-        lib.push("librpm_sequoia.so");
> > ++        lib.push("librpm_sequoia.so.1");
>
> Rather than do this, how about making -ptest package RDEPEND on -dev
> package (which contains the unversioned symlink to the library)?
>

We tried that at some point but changed to this patch because it forces the
recipe to use:
  INSANE_SKIP:${PN}-ptest +=3D "dev-deps"
That feels less "clean" but a lot more maintainable.
We will send a v2 with that.

Thanks!


> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216016):
> https://lists.openembedded.org/g/openembedded-core/message/216016
> Mute This Topic: https://lists.openembedded.org/mt/112626601/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000711fd3063492ee12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 5 =
mai 2025 =C3=A0=C2=A018:51, Alexander Kanavin via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon, 5 May 2025 at 12:17, ines.kchelfi via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembe=
dded.org</a><br>
&lt;ines.kchelfi=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" targe=
t=3D"_blank">smile.fr@lists.openembedded.org</a>&gt; wrote:<br>
&gt; Also patch the libray name to match what is installed.<br>
&gt; +Subject: [PATCH] Force the use of librpm_sequoia.so.1 instead of libr=
pm_sequoia.so<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib.push(&quot;librpm_sequoia.so&quot;);=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib.push(&quot;librpm_sequoia.so.1&quot;=
);<br>
<br>
Rather than do this, how about making -ptest package RDEPEND on -dev<br>
package (which contains the unversioned symlink to the library)?<br></block=
quote><div><br></div><div>We tried that at some point but changed to this p=
atch because it forces the recipe to use:</div><div>=C2=A0 INSANE_SKIP:${PN=
}-ptest +=3D &quot;dev-deps&quot;</div><div>That feels less &quot;clean&quo=
t; but a lot more maintainable.</div><div>We will send a v2 with that.</div=
><div><br></div><div>Thanks!</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#216016): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/216016" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/216016</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112626601/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112626601/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000711fd3063492ee12--

