Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4058FC54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 14:39:53 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.53888.1711377592044923537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 07:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=DQImKfiQ;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.170, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-609f3ca61e0so47199917b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 07:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1711377591; x=1711982391; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VlvXnZTZutCpjYfLjjykBvBRQDdPBGe+Cj1EH9tBhJ8=;
        b=DQImKfiQ21ZUOd55svLaFeQzWEc9kIo7AwpdwnMnnTGdjite1NYogVKb2UAZsvP4q1
         56f81zyNfdIX4k3jv9hm4eTWDphsE9+MY52yo1OkQ8bxYg0CQYU4bQKV3OnzE8a/DQQT
         0t5nwqhdxy9rppgXAfiuikgnhGRFzMcLerDEs/lV9WJeZpXaepTTWUfQYX0deVQyJqIb
         w/hE9s2BL2qmO7ZgV6IUWV+6o7UEiBnRdclaIRT2FaL52jQcdPWxmtoLQzlF78dn750y
         /u91EzBM0qCQjVu6rGubJu9cBFBMdOEY74h3z6AF88Jb06JW0YcAMZQ6dMonJO0qAH7u
         H9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711377591; x=1711982391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlvXnZTZutCpjYfLjjykBvBRQDdPBGe+Cj1EH9tBhJ8=;
        b=eihbHPdGMU92epCrsaOrLREA3UXb+lIBf/pZGCXIW9sGWxwiTJfvMoquxUzzH1zDz2
         jqnNIBaGl0Chfbi1aFlKbR1ZeOxyv283djdk+xwbA3cNeCVMUR4pC0Li0Ss2ShoSiJrc
         0ZHnQvRikYlIwRXZ8yQ60K71yx9+QlEWA/nAML+gDifgOg0Czo+FWBFVTtCFNTOMOxHx
         Ap3YxBCRdBDTWwMMinyjlgfp2OBlu3+AJOzEUuW8yZP5H4BF/cy8ZgUaeXaIntRcToIT
         bInmIxyBI7IrTyhKEAO/6uGtAvtQcpJ5rFWmndzfQmd639dC7lBnVVw75VOHnEI0P/1y
         UnPw==
X-Gm-Message-State: AOJu0YzUA6SzMr+qiVDWhGyj++ABJfUE0WYcqcxQJVDCiHYx5eMEWlg1
	u0Wkh+5nXgAT2fu58XvVdqis7ymn51L48IHvc+sQWgBJfSFULRBVIEaJInejlUrT9HnOg/Fhte3
	SQQWtQ8cnA/XktAAvglqg61cIRQkykhtJlCIDEQ==
X-Google-Smtp-Source: AGHT+IFlNQanvcfG1jfY7IAgxmGukvynOleuSLgfdDVIyXjZteb5hxYKYcPj8J2+CzAJAEKGcTLI95yCJe90SeC+zL4=
X-Received: by 2002:a0d:d9cb:0:b0:610:cd34:439e with SMTP id
 b194-20020a0dd9cb000000b00610cd34439emr6110256ywe.49.1711377591138; Mon, 25
 Mar 2024 07:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240323195304.2909926-1-anibal@limonsoftware.com>
 <20240323195304.2909926-2-anibal@limonsoftware.com> <20240325101809ec807440@mail.local>
In-Reply-To: <20240325101809ec807440@mail.local>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Mon, 25 Mar 2024 08:39:39 -0600
Message-ID: <CAOU5ZMvcO4_HWWgNc44P11w=rXh_cXyFhi7P2=D1iDhZjB+xTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] wic: plugins source bootimage/isoimage
 rename to allow be imported
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, ross.burton@arm.com
Content-Type: multipart/alternative; boundary="00000000000065972b06147d259b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 14:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197487

--00000000000065972b06147d259b
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for reporting, I will adapt the tests.

Regards,
Anibal

On Mon, Mar 25, 2024, 04:18 Alexandre Belloni <alexandre.belloni@bootlin.com>
wrote:

> This breaks some selftests and meta-virtualization:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6573/steps/14/logs/stdio
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3005/steps/12/logs/stdio
>
>
> On 23/03/2024 13:53:04-0600, Anibal Limon wrote:
> > Python not support importing modules with - so change to _.
> >
> > Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> > ---
> >  .../source/{bootimg-biosplusefi.py => bootimg_biosplusefi.py}     | 0
> >  scripts/lib/wic/plugins/source/{bootimg-efi.py => bootimg_efi.py} | 0
> >  .../plugins/source/{bootimg-partition.py => bootimg_partition.py} | 0
> >  .../wic/plugins/source/{bootimg-pcbios.py => bootimg_pcbios.py}   | 0
> >  .../source/{isoimage-isohybrid.py => isoimage_isohybrid.py}       | 0
> >  5 files changed, 0 insertions(+), 0 deletions(-)
> >  rename scripts/lib/wic/plugins/source/{bootimg-biosplusefi.py =>
> bootimg_biosplusefi.py} (100%)
> >  rename scripts/lib/wic/plugins/source/{bootimg-efi.py =>
> bootimg_efi.py} (100%)
> >  rename scripts/lib/wic/plugins/source/{bootimg-partition.py =>
> bootimg_partition.py} (100%)
> >  rename scripts/lib/wic/plugins/source/{bootimg-pcbios.py =>
> bootimg_pcbios.py} (100%)
> >  rename scripts/lib/wic/plugins/source/{isoimage-isohybrid.py =>
> isoimage_isohybrid.py} (100%)
> >
> > diff --git a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
> b/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
> > similarity index 100%
> > rename from scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
> > rename to scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
> > diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py
> b/scripts/lib/wic/plugins/source/bootimg_efi.py
> > similarity index 100%
> > rename from scripts/lib/wic/plugins/source/bootimg-efi.py
> > rename to scripts/lib/wic/plugins/source/bootimg_efi.py
> > diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py
> b/scripts/lib/wic/plugins/source/bootimg_partition.py
> > similarity index 100%
> > rename from scripts/lib/wic/plugins/source/bootimg-partition.py
> > rename to scripts/lib/wic/plugins/source/bootimg_partition.py
> > diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
> b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> > similarity index 100%
> > rename from scripts/lib/wic/plugins/source/bootimg-pcbios.py
> > rename to scripts/lib/wic/plugins/source/bootimg_pcbios.py
> > diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> > similarity index 100%
> > rename from scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > rename to scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> > --
> > 2.43.0
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#197471):
> https://lists.openembedded.org/g/openembedded-core/message/197471
> > Mute This Topic: https://lists.openembedded.org/mt/105108998/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000065972b06147d259b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">Thanks f=
or reporting, I will adapt the tests.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Regards,</div><div dir=3D"auto">Anibal</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 25, 2=
024, 04:18 Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootli=
n.com">alexandre.belloni@bootlin.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">This breaks some selftests and meta-virtualization:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/build=
s/6573/steps/14/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6573/ste=
ps/14/logs/stdio</a><br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/128/buil=
ds/3005/steps/12/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3005/s=
teps/12/logs/stdio</a><br>
<br>
<br>
On 23/03/2024 13:53:04-0600, Anibal Limon wrote:<br>
&gt; Python not support importing modules with - so change to _.<br>
&gt; <br>
&gt; Signed-off-by: Anibal Limon &lt;<a href=3D"mailto:anibal@limonsoftware=
.com" target=3D"_blank" rel=3D"noreferrer">anibal@limonsoftware.com</a>&gt;=
<br>
&gt; ---<br>
&gt;=C2=A0 .../source/{bootimg-biosplusefi.py =3D&gt; bootimg_biosplusefi.p=
y}=C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 scripts/lib/wic/plugins/source/{bootimg-efi.py =3D&gt; bootimg_e=
fi.py} | 0<br>
&gt;=C2=A0 .../plugins/source/{bootimg-partition.py =3D&gt; bootimg_partiti=
on.py} | 0<br>
&gt;=C2=A0 .../wic/plugins/source/{bootimg-pcbios.py =3D&gt; bootimg_pcbios=
.py}=C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 .../source/{isoimage-isohybrid.py =3D&gt; isoimage_isohybrid.py}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 5 files changed, 0 insertions(+), 0 deletions(-)<br>
&gt;=C2=A0 rename scripts/lib/wic/plugins/source/{bootimg-biosplusefi.py =
=3D&gt; bootimg_biosplusefi.py} (100%)<br>
&gt;=C2=A0 rename scripts/lib/wic/plugins/source/{bootimg-efi.py =3D&gt; bo=
otimg_efi.py} (100%)<br>
&gt;=C2=A0 rename scripts/lib/wic/plugins/source/{bootimg-partition.py =3D&=
gt; bootimg_partition.py} (100%)<br>
&gt;=C2=A0 rename scripts/lib/wic/plugins/source/{bootimg-pcbios.py =3D&gt;=
 bootimg_pcbios.py} (100%)<br>
&gt;=C2=A0 rename scripts/lib/wic/plugins/source/{isoimage-isohybrid.py =3D=
&gt; isoimage_isohybrid.py} (100%)<br>
&gt; <br>
&gt; diff --git a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py b/s=
cripts/lib/wic/plugins/source/bootimg_biosplusefi.py<br>
&gt; similarity index 100%<br>
&gt; rename from scripts/lib/wic/plugins/source/bootimg-biosplusefi.py<br>
&gt; rename to scripts/lib/wic/plugins/source/bootimg_biosplusefi.py<br>
&gt; diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/l=
ib/wic/plugins/source/bootimg_efi.py<br>
&gt; similarity index 100%<br>
&gt; rename from scripts/lib/wic/plugins/source/bootimg-efi.py<br>
&gt; rename to scripts/lib/wic/plugins/source/bootimg_efi.py<br>
&gt; diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scr=
ipts/lib/wic/plugins/source/bootimg_partition.py<br>
&gt; similarity index 100%<br>
&gt; rename from scripts/lib/wic/plugins/source/bootimg-partition.py<br>
&gt; rename to scripts/lib/wic/plugins/source/bootimg_partition.py<br>
&gt; diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/script=
s/lib/wic/plugins/source/bootimg_pcbios.py<br>
&gt; similarity index 100%<br>
&gt; rename from scripts/lib/wic/plugins/source/bootimg-pcbios.py<br>
&gt; rename to scripts/lib/wic/plugins/source/bootimg_pcbios.py<br>
&gt; diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/sc=
ripts/lib/wic/plugins/source/isoimage_isohybrid.py<br>
&gt; similarity index 100%<br>
&gt; rename from scripts/lib/wic/plugins/source/isoimage-isohybrid.py<br>
&gt; rename to scripts/lib/wic/plugins/source/isoimage_isohybrid.py<br>
&gt; -- <br>
&gt; 2.43.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#197471): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/197471" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1974=
71</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10510899=
8/3617179" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/105108998/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.=
belloni@bootlin.com" target=3D"_blank" rel=3D"noreferrer">alexandre.belloni=
@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div>

--00000000000065972b06147d259b--

