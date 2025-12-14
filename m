Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE229D59D99
	for <webhook@archiver.kernel.org>; Sun, 14 Dec 2025 17:57:18 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29868.1765735031391888037
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Dec 2025 09:57:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JgbScrD/;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: adam.blank.g@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4510974a6bbso760519b6e.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Dec 2025 09:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765735030; x=1766339830; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q2XW3x4Ml8uaKbQUddX8T/y/nMXqbFxvKNK9feFo+cU=;
        b=JgbScrD/27UBgRRwK/f9CrBI4E4kX3Htao+UVpa/YLo/RE2kuIslFqxU5vdcfb+nUT
         apLHumoTAvKy+ukuasMJItTcCdKsj5yhcf0z0FIj8+gte2IZMekzIFg6k9H8QtQRTPS2
         bas6Sd51plHBOy70Buyv79FU/FMEC69ykoUMoQr/dA/i9Sg2iQ9SrQZ1X7UbG9zjdi6C
         gE/GEoDCqT++19iE1mgzA+R0GSPXLlvkj3PYy3Nki8B7I9dY6dB7d96Az/04vvHZBhW1
         eOSsCJ8J6YTjPDOsm4rOENdJJmRjIg8eugahZtv1GlnY8Rtd9NfAyGbeVPq9ijjXSbmi
         5dWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765735030; x=1766339830;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q2XW3x4Ml8uaKbQUddX8T/y/nMXqbFxvKNK9feFo+cU=;
        b=lyTJ5CRtHmoqCzxeVg9Rq7eS8DC2H6kW9wzn7P+7A80p+pNS1Z5DN1alqG1Ss4eI5j
         pCIBgNY7GOCKvDjodSCx4HaCJorCiK/gcS4ln8IIbZD6g8ThcbaKwj9XIxlhH6wSxV1u
         EpId/aSAxVD+hGa0PGfu8oiEx6RTcQ5o5lPB9TACxYcXc1zqu1Wd+5tcnTeFmOoPPfid
         WUMev6NM6VYslKwq/VW/XGLKcrL/++cybfgQvVvubBV2VDVABb+LjFqvikFaqL/mifNl
         PibvgCDRK/Xrz7bwnUqdipco9EsPy+vqcukF6OuGjPbTSKRVThM3Qx0JlQj0/snqj4D+
         4Acg==
X-Gm-Message-State: AOJu0YxAPNzaCMuCczSfDV47VEl6CkdoNsbLTfKHDnSbOTPX3hsOHqmI
	dpkLghcHoikNgdcPvfFmwBwqA97D4hEzWs2ojUvM5BElgRl6cReHsLJPKONuyDxtdBCak5l1mZc
	SXXVmuDOGT5rDISR3w6G9gd83b79GFvk0Yw==
X-Gm-Gg: AY/fxX6LA1gG+ydf092FkriOQT9w/+SfxQffPHsXsigFCk1n//TCPb7pZP8Ex1ZJvGd
	whBBpyuilalHrFyzK2VeS4U8ziAJPePgYjkFjBafRqKUHbylBLfqJpDWN271y4tLgKKPIqfoxJg
	1KhgpOnY+QHHFzX4Dik+ikP680Dc/ieQY1FCCXNNMLbEbWPX7x92bt3D8q2vGJxrUaHPXO6aErD
	Lgvi9PYgqpDBf7+J7wuM4bqU4Gtsi/zTgdWX046CX47V++S4jHq+BhCQbRt6TFnm2+dEz2FWxtj
	dhZ0bucxryn6vtz7jL+KEe7ej8naJw==
X-Google-Smtp-Source: AGHT+IGglLWfcla3Urv6KL+SH4ve74mDPd0IAJPM6EEchdc8DhDOEF7b/cINm9ApGOghAxy8SFch4VvizTX5IyEvHMw=
X-Received: by 2002:a05:6808:6f90:b0:450:adcf:9b3e with SMTP id
 5614622812f47-455ac966011mr3358972b6e.50.1765735030437; Sun, 14 Dec 2025
 09:57:10 -0800 (PST)
MIME-Version: 1.0
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sun, 14 Dec 2025 18:56:58 +0100
X-Gm-Features: AQt7F2ogijiRW0oiZpu0hiGzYqRpvkUL2cCNsMnhSG7bL9kAdCfv2iD5amfnX5s
Message-ID: <CAFAffzy_4x6VYuFvjqavkhZ746xKaRC6Yf1fZ=Lkrv2bvQP=XA@mail.gmail.com>
Subject: [RFC] RPROVIDES and buildhistory
To: openembedded-core@lists.openembedded.org
Cc: openembedded-architecture@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000041bc640645ed3918"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Dec 2025 17:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227696

--00000000000041bc640645ed3918
Content-Type: text/plain; charset="UTF-8"

I've recently come across a problem, which has apparently been around for a
long time, and yet has somehow remained unnoticed.

Facts:
- bash and busybox recipes conditionally (based on usrmerge in the
DISTRO_FEATURES) declare some RPROVIDES
- what they declare in RPROVIDES are actually file paths - e.g. '/bin/sh',
'/bin/ash' or '/bin/bash'
- resulting entries in their packagedata are "correct" - i.e. 'RPROVIDES =
/bin/sh /bin/bash'
- resulting entries in their buildhistory are mangled - i.e. 'RPROVIDES =
bib bin bash sh'

Thesis:
- such entries in RPROVIDES (or any other package namespace related
variable) are an error (at least looking at what insane.bbclass deems an
acceptable package name)
- buildhistory should be consistent in its processing of package names with
packagedata

I'd like to ask for your comments as to what would be the best way to
approach this. My view would be to fix the recipes, the
buildhistory.bbclass but also make sure that all package related variables
are guarded in equal degree in all relevant stages (e.g. in the
insane.bbclass).

Thanks,
Adam

--00000000000041bc640645ed3918
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I&#=
39;ve recently come across a problem, which has apparently been around for =
a long time, and yet has somehow remained unnoticed.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Facts:</div><div class=3D"gmail_default" style=
=3D"font-size:small">- bash and busybox recipes conditionally (based on usr=
merge in the DISTRO_FEATURES) declare some RPROVIDES</div><div class=3D"gma=
il_default" style=3D"font-size:small">- what they declare in RPROVIDES are =
actually file paths - e.g. &#39;/bin/sh&#39;, &#39;/bin/ash&#39; or &#39;/b=
in/bash&#39;</div><div class=3D"gmail_default" style=3D"font-size:small">- =
resulting entries in their packagedata are &quot;correct&quot; - i.e. &#39;=
RPROVIDES =3D /bin/sh /bin/bash&#39;</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">- resulting entries in their buildhistory are mangled=
 - i.e. &#39;RPROVIDES =3D bib bin bash sh&#39;=C2=A0</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Thesis:</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">- such entries in RPROVIDES (or any other package nam=
espace related variable) are an error (at least looking at what insane.bbcl=
ass deems an acceptable package name)</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">- buildhistory should be consistent in its processin=
g of package names with packagedata</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">I&#39;d like to ask for your comments as to what would be the be=
st way to approach this. My view would be to fix the recipes, the buildhist=
ory.bbclass but also make sure that all package related variables are guard=
ed in equal degree in all relevant stages (e.g. in the insane.bbclass).</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Thanks,</div><div class=3D"g=
mail_default" style=3D"font-size:small">Adam</div></div>

--00000000000041bc640645ed3918--

