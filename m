Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E310BF419B9
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 17:34:56 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.851.1776274496131226585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 10:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UP4HVays;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-651bf695701so2093413d50.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 10:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776274495; cv=none;
        d=google.com; s=arc-20240605;
        b=MH4+eOvNoQMsM/NoNamcT5em0EjbUioSMzX4uzJ3dRO/XObXbqyiTdaL5anqdsMuuN
         1zkBSVsyTD09GL3lGYP/kI2AEIUD8juq5yEP4aHlwzP3914CGz51CKcfvg9GfxmuS43c
         cH9XZC2hslV0hkGAWNI7kWSJ6JkJ8AjMGUJTosekPt2AcpdITBb10Yx1TEUKfzldJGeX
         1xXz6h1J/XBeJWqw8DBGw4PYbvbOddk0DamwmXaHARC7T13JCohSuk3ZIHYFrPgFEpS0
         k31cQpqoAylXkALSJDNDQq+Hj352SGRynXBSyI8QMQ3ZB8AsZeCPu8z0vgKllKux7OFM
         zLyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=902+3tLyW3HlSn1yn1cICTbOe5oBxfiZpAPpUkgEXC0=;
        fh=VOVZu8FjXojtP/2iv884q8pvwCQeeuFgwI9OY1sYm5U=;
        b=EOaL4UIL4BtUBNh9f1G66GnkNPiZOGjwRw6DVB9XRdFP8F9S5Sscp3s7FP7fx2V5E8
         X+gdSzpdcfwLg2awUdKnvaaMqCQDcA1Enmm+8nlzrIlXfrPfWdJH9eWnQu/LmuUGTz7V
         TSwvVjtN0MNp0jJxBeFdCNxaex8YuCt4MMZECZGEqvgj3p41yTaEFXNM8qO66pO9kC7s
         aNSlTrl6v1XgI1U8HgQHFBz9Kiwv3MPUGTcSK4+cWcPqpUJKeA2wT/T9aodLEVXxTAsi
         NvomQPkEVFRYgHi2PqcqI3PufjMCtIAEqSPKBbbuFiop8ium5Ue+HWaGkaKDRbM8s+T/
         IIfQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776274495; x=1776879295; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=902+3tLyW3HlSn1yn1cICTbOe5oBxfiZpAPpUkgEXC0=;
        b=UP4HVaysrTJk/Midf+Z2xb0EaVYHpbpCKYq4/2JQf4XYvdTxtByNf3p1eDtl8VIJ9s
         0qqNL1586xUp7xyZ4gufqluWuzDrKU8p9vibY52yLUVakMchoL3uuwklkxgDmCIYP9/L
         cN4rUbmB1/HyjqEzlnCX+vl3MpgHyftKnY3S7NzzgnFiQHbSI1Oql5WKJBXBMrm932DP
         C38EKHLMbQE0AKkl4wUPZdvv4xHWWFhto6KIUJoja3+LG4l0fvMGNUoni2m1SEqlgrXA
         CoNbF+7mix23WfDgvXuQT5xtA22o3KbHDcZKRqKg1ww8oEKTynWD1t9cinvNiC4sL9Lr
         iCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776274495; x=1776879295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=902+3tLyW3HlSn1yn1cICTbOe5oBxfiZpAPpUkgEXC0=;
        b=grMqLj0pcMCyBpGi7UfnOKWLL0z19L/ncvPd+/hv7No1Y7R4avFMrqUHnm/+7skV8z
         iLDIUI0Tb6ltpErLkNsdtEcTvWk+9sjHnkZie+2xTyDh7JBhyTBvH70xJXnpG2OFSOBq
         efSHKKtI+kfLIG6K92ysvLnNof19kPsI+I7e/Zt2fD9rpBqmOMmdnvi57bf+NV2ESfRY
         q6zDvOEj9XvwTSj5yaSSYDlSn+gvNsWdZ2pKCatWJ+uDyj0ltGReKQlNFzN/SuwQYoOQ
         RZbIzZhIGHoLLdCh4cx30H/NluIATG82wNkvHijb1As3w8DpHupFlWJQnVc4CLeRl7ek
         ccYA==
X-Gm-Message-State: AOJu0YwAIOm6grVg7w4X8KWyXssl4nUAhKx+9M1V1HDFth6hHP3KCcPH
	2EeFy0VjjIDg0W9CJvjcPLwrx+33JWAgEDj+JxgQZbxnW4DtR++tVz7CwcTGiEtY1XmX/1bsoAU
	tnD3bznFNeE8G+GLNdtuL0s2+jimDZx4=
X-Gm-Gg: AeBDiesnDO9mqbY35ZiA2WQ4wcHcPombPU0svbECCmxPMjUgktfRY6yZRdaT2hw8k6S
	yTuzoYQ+XsSc08YBM2wc3DhiMMpFp1p29bbYaQu8vQZ0cCUJjwXUxemOAiKGF1gzztCCyCTIJi/
	t7HQb9vxf9mGHh2WIlxEO7p+GLEM2GzifCLW3ykWCK6Y0tVe+pGtRbGjclYOhxPJWc/7l8XKWcE
	pRYHLxTfjbzmpmDanakC5c80YI10HTuPfrXe9+8pcy2+oS9B4PDpXK8BSqjwuF07I+YzER1k462
	DROGmDgOxhN0cK4VdPHlBBDCaGeAk59Arvj8rMCpA65NJREgBD6DMZw0wtgu0vHAnf3f2usCoDc
	ehkJKN1UGmprV+AREjXzrCCrqGQ8zUpxzztnbqdNFsZIFQhbsZSzK0F3rgKA3+Sm4gIRVWRhtIO
	nGQyKz3/lPmetr3yp7Mw==
X-Received: by 2002:a53:ba84:0:b0:650:1960:c8b4 with SMTP id
 956f58d0204a3-65198b47153mr16313109d50.42.1776274494109; Wed, 15 Apr 2026
 10:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260412035757.134385-1-khem.raj@oss.qualcomm.com> <E0CF1B73-5076-498B-8FF1-26E0F519FF01@arm.com>
In-Reply-To: <E0CF1B73-5076-498B-8FF1-26E0F519FF01@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Apr 2026 10:34:27 -0700
X-Gm-Features: AQROBzAc5hV0ic0UXbnixpP00D3gADUqK0jhLYiX8capa_TBBln4iNfTBx-TELs
Message-ID: <CAMKF1sqBvD5CZ1O6yqZ6FYFeQLUaTS1i0HaBNjNqN5YK9-wCew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] u-boot-tools: Add dependency on libyaml for
 dtschema validation
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003ebcb3064f83228a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 17:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235313

--0000000000003ebcb3064f83228a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 8:33=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> Is this specific to the 2026.04 upgrade or does it apply to 2026.01 too?
>

I think 2026.01 does not need it.


>
> Ross
>
> > On 12 Apr 2026, at 04:57, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > yamltree host tool, used to emit YAML from the DT, is now
> > built as part of the normal u-boot-tools build to support
> > the schema infrastructure
> >
> > Fixes link errors like
> >
> > | /usr/bin/ld: scripts/dtc/yamltree.o: in function `dt_to_yaml':
> > | yamltree.c:(.text+0x91b): undefined reference to
> `yaml_emitter_initialize'
> > | /usr/bin/ld: yamltree.c:(.text+0x926): undefined reference to
> `yaml_emitter_set_output_file'
> > | /usr/bin/ld: yamltree.c:(.text+0x933): undefined reference to
> `yaml_stream_start_event_initialize'
> > | /usr/bin/ld: yamltree.c:(.text+0x93e): undefined reference to
> `yaml_emitter_emit'
> > | /usr/bin/ld: yamltree.c:(.text+0x957): undefined reference to
> `yaml_document_start_event_initialize'
> > | /usr/bin/ld: yamltree.c:(.text+0x962): undefined reference to
> `yaml_emitter_emit'
> > | /usr/bin/ld: yamltree.c:(.text+0x983): undefined reference to
> `yaml_sequence_start_event_initialize'
> > | /usr/bin/ld: yamltree.c:(.text+0x98e): undefined reference to
> `yaml_emitter_emit'
> > | /usr/bin/ld: yamltree.c:(.text+0x9ab): undefined reference to
> `yaml_sequence_end_event_initialize'
> > | /usr/bin/ld: yamltree.c:(.text+0x9b6): undefined reference to
> `yaml_emitter_emit'
> > | /usr/bin/ld: yamltree.c:(.text+0x9c8): undefined reference to
> `yaml_document_end_event_initialize'
> > | /usr/bin/ld: yamltree.c:(.text+0x9d3): undefined reference to
> `yaml_emitter_emit'
> > | /usr/bin/ld: yamltree.c:(.text+0x9e3): undefined reference to
> `yaml_stream_end_event_initialize'
> > | /usr/bin/ld: yamltree.c:(.text+0x9ee): undefined reference to
> `yaml_emitter_emit'
> > | /usr/bin/ld: yamltree.c:(.text+0x9fa): undefined reference to
> `yaml_emitter_delete'
> >
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > ---
> > v2: Add dep on native libyalm alone
> >
> > meta/recipes-bsp/u-boot/u-boot-tools.inc | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc
> b/meta/recipes-bsp/u-boot/u-boot-tools.inc
> > index 4e4f7fa092..a055409c2c 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
> > @@ -1,5 +1,5 @@
> > SUMMARY =3D "U-Boot bootloader tools"
> > -DEPENDS +=3D "gnutls openssl util-linux swig-native"
> > +DEPENDS +=3D "gnutls openssl util-linux swig-native libyaml-native"
> >
> > inherit python3native
> > export STAGING_INCDIR =3D "${STAGING_INCDIR_NATIVE}"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#235052):
> https://lists.openembedded.org/g/openembedded-core/message/235052
> > Mute This Topic: https://lists.openembedded.org/mt/118784443/6875888
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--0000000000003ebcb3064f83228a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 15,=
 2026 at 8:33=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.=
com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Is this specific to the 2026.04 upgrade or does it =
apply to 2026.01 too?<br></blockquote><div><br></div><div>I think 2026.01 d=
oes not need it.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
Ross<br>
<br>
&gt; On 12 Apr 2026, at 04:57, Khem Raj via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> =
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; yamltree host tool, used to emit YAML from the DT, is now<br>
&gt; built as part of the normal u-boot-tools build to support<br>
&gt; the schema infrastructure<br>
&gt; <br>
&gt; Fixes link errors like<br>
&gt; <br>
&gt; | /usr/bin/ld: scripts/dtc/yamltree.o: in function `dt_to_yaml&#39;:<b=
r>
&gt; | yamltree.c:(.text+0x91b): undefined reference to `yaml_emitter_initi=
alize&#39;<br>
&gt; | /usr/bin/ld: yamltree.c:(.text+0x926): undefined reference to `yaml_=
emitter_set_output_file&#39;<br>
&gt; | /usr/bin/ld: yamltree.c:(.text+0x933): undefined reference to `yaml_=
stream_start_event_initialize&#39;<br>
&gt; | /usr/bin/ld: yamltree.c:(.text+0x93e): undefined reference to `yaml_=
emitter_emit&#39;<br>
&gt; | /usr/bin/ld: yamltree.c:(.text+0x957): undefined reference to `yaml_=
document_start_event_initialize&#39;<br>
&gt; | /usr/bin/ld: yamltree.c:(.text+0x962): undefined reference to `yaml_=
emitter_emit&#39;<br>
&gt; | /usr/bin/ld: yamltree.c:(.text+0x983): undefined reference to `yaml_=
sequence_start_event_initialize&#39;<br>
&gt; | /usr/bin/ld: yamltree.c:(.text+0x98e): undefined reference to `yaml_=
emitter_emit&#39;<br>
&gt; | /usr/bin/ld: yamltree.c:(.text+0x9ab): undefined reference to `yaml_=
sequence_end_event_initialize&#39;<br>
&gt; | /usr/bin/ld: yamltree.c:(.text+0x9b6): undefined reference to `yaml_=
emitter_emit&#39;<br>
&gt; | /usr/bin/ld: yamltree.c:(.text+0x9c8): undefined reference to `yaml_=
document_end_event_initialize&#39;<br>
&gt; | /usr/bin/ld: yamltree.c:(.text+0x9d3): undefined reference to `yaml_=
emitter_emit&#39;<br>
&gt; | /usr/bin/ld: yamltree.c:(.text+0x9e3): undefined reference to `yaml_=
stream_end_event_initialize&#39;<br>
&gt; | /usr/bin/ld: yamltree.c:(.text+0x9ee): undefined reference to `yaml_=
emitter_emit&#39;<br>
&gt; | /usr/bin/ld: yamltree.c:(.text+0x9fa): undefined reference to `yaml_=
emitter_delete&#39;<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.co=
m" target=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: Add dep on native libyalm alone<br>
&gt; <br>
&gt; meta/recipes-bsp/u-boot/u-boot-tools.inc | 2 +-<br>
&gt; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-b=
sp/u-boot/u-boot-tools.inc<br>
&gt; index 4e4f7fa092..a055409c2c 100644<br>
&gt; --- a/meta/recipes-bsp/u-boot/u-boot-tools.inc<br>
&gt; +++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt; SUMMARY =3D &quot;U-Boot bootloader tools&quot;<br>
&gt; -DEPENDS +=3D &quot;gnutls openssl util-linux swig-native&quot;<br>
&gt; +DEPENDS +=3D &quot;gnutls openssl util-linux swig-native libyaml-nati=
ve&quot;<br>
&gt; <br>
&gt; inherit python3native<br>
&gt; export STAGING_INCDIR =3D &quot;${STAGING_INCDIR_NATIVE}&quot;<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#235052): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/235052" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/235052</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11878444=
3/6875888" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/118784443/6875888</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000003ebcb3064f83228a--

