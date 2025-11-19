Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF34CF58C1
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 17:30:00 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12880.1763573393516774919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 09:29:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d+YbjrGh;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-640c9c85255so7368349d50.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 09:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763573393; x=1764178193; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C+VkkfN6Gn6KoM7FepnNVSYIlxB8y3oEVM57YL8Iv/8=;
        b=d+YbjrGhTWp/LG4WeWcB+pIFdyZNXgSTYg4jVrl27PMJrUdxZFgVLSCDkjsQH7s40o
         HRsezKQOAcMtm0/VoZawR56oREh+ld/2RSnTixr5LFfthm+hi40dpzsF5qwtz08rRbKz
         l8QO/vxGIOW2ZQsk1Elej9yEfXdatj2NCX+xzO2p0Vx/n97VTeEH+IacVBetQsq9QK6D
         Be23IaAIKw0b8UD6NQaztGFqWnUESDHzQDTEM+m34LNkUxvWxLfe2WTFUwOjLP6pp/e7
         Afr0WsnjQFCtbKGW0QfC8SjTSfMem1Pk/ii0v3YI5CmEeWGf8sIfX4keSWB4HG4vwQ7T
         XrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763573393; x=1764178193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+VkkfN6Gn6KoM7FepnNVSYIlxB8y3oEVM57YL8Iv/8=;
        b=f+u4OjECljKGzz4j6E/s/iy4vm1zW9npEjveU/0i1AU7tS20MNL4Q6188GgRO9Mzf1
         m/S96vPJhJ03aLX2bEcnD1rxSta7y/UnSY5o/TkIMf7MTKNb0ajd28Wa97Xpz7YFpZii
         Cozk0N22cxssOUSz1x9pAgUelvfUqYLUpRHKf+usB74oZrXkONgGg9LloOWrWyjOMh6U
         ePJOC/7fUAnGkpLq8lWHsPYaRG2uCPCwiTP/qtJZRxkay7fkN4fMrXZtcowOO0TFJ+2M
         QsPROMKjYhQUdmAXtrBessS/8F/JCRb11JG7whAiIzmXZSCNiW5a0eoeFnhM1S7xO4k+
         CFRA==
X-Gm-Message-State: AOJu0YymvvAg4femH8uGq8oBt6yqF+tHs+S/AaU2e2OaySbagbEeD0tX
	cJJ/nzB1kBn80EaY7zxXn6znOr4UiXnkrlRzgnryNxEyiLVu1pSfZIMRBy8RiOdaSjpNeStPpvs
	UM/FANzH7sFLQUf/SxT2RZhwD5NXDWn4=
X-Gm-Gg: ASbGncumqATEcIIuCPTJZJCxYfNFcaoldzklrRcn/Y8EGhy/ehRvbAIr+dA3fDeBQC/
	nnOwzx9iwow+bcGog7Z57JPxw7a3m+Xm/arLNfquNcPqg7IQzmlpajIO50W559hzsCX+XPlhsxb
	Jr0AeemN0ZiK9FM+HIvcdb5SZNxclQZvItdnpeI4XCBR2NxH/9PwiX5mv9m5WB/xl8uLJidFNlv
	yUkFEn26QZGkBsff5BhYt/Mib9BDieFat1Ktfq816MG2IoNuMtB5cQI3U2G4+ngv7mIuO1qOWHg
	oQtxvExrEaGT6kPyRGqXTd+AcITGKeDjk5TTA2QT3hkCI8fFW0HZP2uH5PIXBPAHKBnPiW45z+6
	ZR50A3cJgOGq20gbAjaoAN8Qe75EYim0E+0HIN32XtAgMqxg/FtS7NBnM
X-Google-Smtp-Source: AGHT+IGtglZgDeftzq3OfFe0VOuJxNPJ+0GSc0Iol8VX1ZGTmEs1a9PV3jwUz1bLYefDStUFx+Qz19hrizBJP3WESN8=
X-Received: by 2002:a05:690e:23d8:b0:63f:99ec:1dd3 with SMTP id
 956f58d0204a3-641e76966a5mr13441322d50.56.1763573392597; Wed, 19 Nov 2025
 09:29:52 -0800 (PST)
MIME-Version: 1.0
References: <20251119101959.2603691-1-skandigraun@gmail.com> <e327cbe3-7980-4806-8a1e-69d3910d3eb4@gmail.com>
In-Reply-To: <e327cbe3-7980-4806-8a1e-69d3910d3eb4@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Nov 2025 09:29:26 -0800
X-Gm-Features: AWmQ_bnWKE7R3YFuMekIrtir3GI9d8IP_r9vYyF3IXzEqZCbva07ldtSeeqfok4
Message-ID: <CAMKF1sr9jnTiyAAue6LeGWT5aGganW3zoSCKapGV_dCcrBL93A@mail.gmail.com>
Subject: Re: [PATCH] bitbake.conf: add canon-prefix-map to DEBUG_PREFIX_MAP
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000099e7b00643f5ed74"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 17:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226574

--00000000000099e7b00643f5ed74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 9:20=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.c=
om>
wrote:

> Hmm, I just noticed that this flag wasn't omitted accidentally at all,
> but because clang doesn't support it.
>
> Please ignore this patch, will try to come up with some conditional
> patch or something like that.
>


Right, the intention was to keep the DEBUG_PREFIX_MAP to be generic
and I was hoping that packages won't need -fcanon-prefix-map but that's
not the case. In any case I think we now have toolchain classes and these
options are compiler specific so we could either move the whole
assignment out of bitbake.conf and into toolchain classes
or define addon variable in gcc.bbclass

DEBUG_PREFIX_MAP_EXTRA =3D "-fcanon-prefix-map"

and prepend it to DEBUG_PREFIX_MAP in bitbake.conf

That will allow it to be overridden cleanly in recipes if needed.

Third option is to keep it as such and add

DEBUG_PREFIX_MAP =3D+ "-fcanon-prefix-map" meta/classes/toolchain/gcc.bbcla=
ss

also keep in mind that this option is only available in gcc-13+
so DEBUG_PREFIX_MAP if used on native recipes might fail for hosts with
gcc < 13


>
> On 11/19/25 11:19, Gyorgy Sarvari wrote:
> > When the debug-prefix-map and macro-prefix-map compiler flags
> > were change to file-prefix-map[1] the -fcanon-prefix-map
> > flag was removed, most likely accidentally.
> >
> > Due to this the file paths were not canonicalized before
> > substituting them, so they did not always match the corresponding keys.
> >
> > E.g. relative pathes were not converted to absolute ones:
> > ../../sources/foo.cpp doesn't match ${S}/foo.cpp, and due to
> > this some debug sources were missed.
> >
> > This patch adds back the -fcanon-prefix-map flag.
> >
> > [1]:
> https://git.openembedded.org/openembedded-core/commit/?id=3Dff73fa7ef7666=
a6dbe34f15515bc3ab6e574c5b0
> >
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 52ceb76bbb..f789b8e326 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -650,7 +650,7 @@ EXTRA_OEMAKE:prepend:task-install =3D
> "${PARALLEL_MAKEINST} "
> >  ##################################################################
> >  TARGET_DBGSRC_DIR ?=3D "/usr/src/debug/${PN}/${PV}"
> >  # Beware: applied last to first
> > -DEBUG_PREFIX_MAP ?=3D "\
> > +DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
> >   -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> >   -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> >   -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \
>
>

--00000000000099e7b00643f5ed74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 19,=
 2025 at 9:20=E2=80=AFAM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@g=
mail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hmm, I just noticed that this flag wasn&#3=
9;t omitted accidentally at all,<br>
but because clang doesn&#39;t support it.<br>
<br>
Please ignore this patch, will try to come up with some conditional<br>
patch or something like that.<br></blockquote><div><br></div><div><br></div=
><div>Right, the intention was to keep the DEBUG_PREFIX_MAP to be generic</=
div><div>and I was hoping that packages won&#39;t=C2=A0need -fcanon-prefix-=
map but that&#39;s</div><div>not the case. In any case I think we now have =
toolchain classes and these</div><div>options are compiler specific=C2=A0so=
 we could either move the whole</div><div>assignment out of bitbake.conf an=
d into toolchain classes</div><div>or define addon variable in gcc.bbclass<=
/div><div><br></div><div>DEBUG_PREFIX_MAP_EXTRA =3D &quot;-fcanon-prefix-ma=
p&quot;</div><div><br></div><div>and prepend it to DEBUG_PREFIX_MAP in bitb=
ake.conf</div><div><br></div><div>That will allow it to be overridden=C2=A0=
cleanly in recipes if needed.</div><div><br></div><div>Third option is to k=
eep it as such and add</div><div><br></div><div>DEBUG_PREFIX_MAP =3D+ &quot=
;-fcanon-prefix-map&quot;=C2=A0meta/classes/toolchain/gcc.bbclass</div><div=
><br></div><div>also keep in mind that this option is only available in gcc=
-13+</div><div>so DEBUG_PREFIX_MAP if used on native recipes might fail for=
 hosts with</div><div>gcc &lt; 13</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
On 11/19/25 11:19, Gyorgy Sarvari wrote:<br>
&gt; When the debug-prefix-map and macro-prefix-map compiler flags<br>
&gt; were change to file-prefix-map[1] the -fcanon-prefix-map<br>
&gt; flag was removed, most likely accidentally.<br>
&gt;<br>
&gt; Due to this the file paths were not canonicalized before<br>
&gt; substituting them, so they did not always match the corresponding keys=
.<br>
&gt;<br>
&gt; E.g. relative pathes were not converted to absolute ones:<br>
&gt; ../../sources/foo.cpp doesn&#39;t match ${S}/foo.cpp, and due to<br>
&gt; this some debug sources were missed.<br>
&gt;<br>
&gt; This patch adds back the -fcanon-prefix-map flag.<br>
&gt;<br>
&gt; [1]: <a href=3D"https://git.openembedded.org/openembedded-core/commit/=
?id=3Dff73fa7ef7666a6dbe34f15515bc3ab6e574c5b0" rel=3D"noreferrer" target=
=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3Dff7=
3fa7ef7666a6dbe34f15515bc3ab6e574c5b0</a><br>
&gt;<br>
&gt; Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k">raj.khem@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.=
com" target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/bitbake.conf | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 52ceb76bbb..f789b8e326 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -650,7 +650,7 @@ EXTRA_OEMAKE:prepend:task-install =3D &quot;${PARA=
LLEL_MAKEINST} &quot;<br>
&gt;=C2=A0 ################################################################=
##<br>
&gt;=C2=A0 TARGET_DBGSRC_DIR ?=3D &quot;/usr/src/debug/${PN}/${PV}&quot;<br=
>
&gt;=C2=A0 # Beware: applied last to first<br>
&gt; -DEBUG_PREFIX_MAP ?=3D &quot;\<br>
&gt; +DEBUG_PREFIX_MAP ?=3D &quot;-fcanon-prefix-map \<br>
&gt;=C2=A0 =C2=A0-ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \<br>
&gt;=C2=A0 =C2=A0-ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \<br>
&gt;=C2=A0 =C2=A0-ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
<br>
</blockquote></div></div>

--00000000000099e7b00643f5ed74--

