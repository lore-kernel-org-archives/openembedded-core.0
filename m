Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D42E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 20:39:01 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.66852.1734381539266695159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 12:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V36YkiMD;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so4093286a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 12:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734381539; x=1734986339; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IByCx0yypb7p/T9rTvAESIdef+J0//sEKBjl9qtRSBk=;
        b=V36YkiMDIqr53aaTftL0CiACmPX1itFmqTSy+cxp5lhDKa4nTIxyN28dyWI8Ik9j5N
         GWxI+5VBI8URHXZWSn2+IynqvQTwxUjc5rVkNLDpfxgKgPvnZIvZCeuY0Y5rh0/A5diD
         K+5LOIp+734kzYuTW8mGr73NODLrnKwN7XJtySUbbvp281efQd36D3/mYSfDkEEpB/Eq
         bKSbWsxWt5K5LXSmwyLsr/MtERus7UqDkN7MiJR2JULVmWFg4D/2r16BEysV65HKLc96
         AsqHcLaaEz2Y9YnZ9eJ3GY8iCbNumIGI/vrFvqpTqdyx+d5zdTiCBzhOsA/8Mfjgmb/a
         SyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734381539; x=1734986339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IByCx0yypb7p/T9rTvAESIdef+J0//sEKBjl9qtRSBk=;
        b=J5ILPHloMbHKeqD6wLLWw6o4+m+MqWO/J1unv4aeM/ojFOgdVX7ALaxyiO1yuryQOJ
         GCH0zXKcAegZ6IngvYeaX/boykq012nZgoupEVk264PP5myWzzbaE5BYicNIaLB41Q6e
         4ONrcYzxyFCzfF1qNaiD2wDnNAJPN8sYhWK2Zj8zH4fnox2ezqvmlAk6duF9kXYDpPcd
         s4O1seQWs4c0aGmXahcv7npfZjJfnLee9on7QvFl66U97toUC6weyvx/tNqHb0V4D79H
         iWgGg58rohz0HgNRezjVhWwe2e4MvBoVn53GehWT1EuNyhsF5l5CIYBLJWez5i2qIXnH
         UMCw==
X-Gm-Message-State: AOJu0YyRGtKs6XK82bU1a/UgSo+vdd/jhCsQnJOSBxQJxp3zCyCax000
	Afsjogaw/tiuKx92rSSlQLSH90juAQcsMIRpOBmaOU5KHTWEk8uGgIcg8HcPJ4frXqtbCAXgMHa
	3ZzBpHGVH/UwP8ZGvc834wPL8MXw=
X-Gm-Gg: ASbGncuEyC3U4KxckrfuckiivFi4HWuv0kiAAiaywrTQ7Mj8IO3EfBXvMZPtJ2TgK7x
	7KXIYDjmxnFNLIGCOpN3v9YQrW63SkRihLdbAlJ1fTp8fGMALY3NYjvz/ewLoUYK/EKKR9FU=
X-Google-Smtp-Source: AGHT+IFdAlfiVcM5NXgbhxGPY4R7xDzkCL2JY88PwAG+pOWaYq45liUwKPh/pDkM2Tvztl0KBEQCSBkB2K55rYwMH+0=
X-Received: by 2002:a17:90b:2e48:b0:2ee:6736:8512 with SMTP id
 98e67ed59e1d1-2f28fb6f983mr26559029a91.12.1734381538624; Mon, 16 Dec 2024
 12:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20241212065435.15582-1-marta.rybczynska@ygreky.com>
 <B9D4F85A-EFEB-4D83-8090-01753565B29F@arm.com> <94803B52-5DE1-4695-96C7-0C4C9B227AFA@arm.com>
In-Reply-To: <94803B52-5DE1-4695-96C7-0C4C9B227AFA@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 16 Dec 2024 21:38:47 +0100
Message-ID: <CAApg2=SJULdbbfxNRVjfSb+8aYWemob7vBO6GvJ868_axQ=zAA@mail.gmail.com>
Subject: Re: [OE-core] [RFC v2 0/4] Allow choosing the NVD feed
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Marta Rybczynska <marta.rybczynska@ygreky.com>
Content-Type: multipart/alternative; boundary="00000000000083ce6d0629692b0b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 20:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208792

--00000000000083ce6d0629692b0b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Dec 2024, 16:01 Ross Burton, <Ross.Burton@arm.com> wrote:

> On 16 Dec 2024, at 14:59, Ross Burton <Ross.Burton@arm.com> wrote:
> >
> > On 12 Dec 2024, at 06:54, Marta Rybczynska via lists.openembedded.org
> <rybczynska=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> This series is allowing choice of the NVD feed to use, you can
> >> configure them using the NVD_DB_VERSION variable in local.conf
> >>
> >> Available feeds:
> >> - NVD2 (default) - the current NVD API v2 feed
> >> - NVD1 - the old NVD feed (deprecated, but still working)
> >> - FKIE - the NVD feed restoration from FKIE-CAD
> >>
> >> Marta Rybczynska (4):
> >> cve-update-db-native: restore
> >> cve-update-db-native: update structure
> >> cve-update-db-native: add the fkie source
> >> cve-check: allow feed choice
> >
> > If I select FKIE this fails to fetch:
> >
> > File: '/home/rosbur01/Yocto/poky/meta/recipes-core/meta/
> cve-update-db-native.bb', lineno: 301, function: update_db_nvdjson
> >     0297:    import json
> >     0298:    bb.warn(str(jsondata)[:1000])
> >     0299:    root =3D json.loads(jsondata)
> >     0300:
> > *** 0301:    for elt in root['CVE_Items']:
> >     0302:        if not elt['impact']:
> >     0303:            continue
> >     0304:
> >     0305:        accessVector =3D None
> > Exception: KeyError: 'CVE_Items'
> >
> > Adding a dump of the JSON shows that the keys are lowercase, which the
> parser is not expecting:
> >
> > WARNING: cve-update-db-native-1.0-r0 do_fetch: b'{\n  "timestamp":
> "2024-12-16T01:00:10+00:00",\n  "cve_count": 2392,\n  "feed_name":
> "CVE-2002",\n  "source": "fkie-cad/nvd-json-data-feeds",\n  "cve_items=E2=
=80=9D:
>
> Nope I=E2=80=99m wrong, the correct bug is "if you typo the NVD_DB_VERSIO=
N then
> weird things happen=E2=80=9D.  I suggest either validating it early, or a=
lways
> checking for equality instead of using else.  I accidentally put KFIE and
> it fell into a bad combination of cases.
>

Thanks for testing Ross! I'm fixing that.

Kind regards,
Marta

>

--00000000000083ce6d0629692b0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br><br><div class=3D"gmail_quote gmail_quote_container" =
dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 16 Dec 2024, 16:=
01 Ross Burton, &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 16 Dec 2024, =
at 14:59, Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" target=3D"=
_blank" rel=3D"noreferrer">Ross.Burton@arm.com</a>&gt; wrote:<br>
&gt; <br>
&gt; On 12 Dec 2024, at 06:54, Marta Rybczynska via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.op=
enembedded.org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.opene=
mbedded.org" target=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembed=
ded.org</a>&gt; wrote:<br>
&gt;&gt; <br>
&gt;&gt; This series is allowing choice of the NVD feed to use, you can<br>
&gt;&gt; configure them using the NVD_DB_VERSION variable in local.conf<br>
&gt;&gt; <br>
&gt;&gt; Available feeds:<br>
&gt;&gt; - NVD2 (default) - the current NVD API v2 feed<br>
&gt;&gt; - NVD1 - the old NVD feed (deprecated, but still working)<br>
&gt;&gt; - FKIE - the NVD feed restoration from FKIE-CAD<br>
&gt;&gt; <br>
&gt;&gt; Marta Rybczynska (4):<br>
&gt;&gt; cve-update-db-native: restore<br>
&gt;&gt; cve-update-db-native: update structure<br>
&gt;&gt; cve-update-db-native: add the fkie source<br>
&gt;&gt; cve-check: allow feed choice<br>
&gt; <br>
&gt; If I select FKIE this fails to fetch:<br>
&gt; <br>
&gt; File: &#39;/home/rosbur01/Yocto/poky/meta/recipes-core/meta/<a href=3D=
"http://cve-update-db-native.bb" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">cve-update-db-native.bb</a>&#39;, lineno: 301, function: update_db_nv=
djson<br>
&gt;=C2=A0 =C2=A0 =C2=A00297:=C2=A0 =C2=A0 import json<br>
&gt;=C2=A0 =C2=A0 =C2=A00298:=C2=A0 =C2=A0 bb.warn(str(jsondata)[:1000])<br=
>
&gt;=C2=A0 =C2=A0 =C2=A00299:=C2=A0 =C2=A0 root =3D json.loads(jsondata)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A00300:<br>
&gt; *** 0301:=C2=A0 =C2=A0 for elt in root[&#39;CVE_Items&#39;]:<br>
&gt;=C2=A0 =C2=A0 =C2=A00302:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not elt[&#39;im=
pact&#39;]:<br>
&gt;=C2=A0 =C2=A0 =C2=A00303:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
&gt;=C2=A0 =C2=A0 =C2=A00304:<br>
&gt;=C2=A0 =C2=A0 =C2=A00305:=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D N=
one<br>
&gt; Exception: KeyError: &#39;CVE_Items&#39;<br>
&gt; <br>
&gt; Adding a dump of the JSON shows that the keys are lowercase, which the=
 parser is not expecting:<br>
&gt; <br>
&gt; WARNING: cve-update-db-native-1.0-r0 do_fetch: b&#39;{\n=C2=A0 &quot;t=
imestamp&quot;: &quot;2024-12-16T01:00:10+00:00&quot;,\n=C2=A0 &quot;cve_co=
unt&quot;: 2392,\n=C2=A0 &quot;feed_name&quot;: &quot;CVE-2002&quot;,\n=C2=
=A0 &quot;source&quot;: &quot;fkie-cad/nvd-json-data-feeds&quot;,\n=C2=A0 &=
quot;cve_items=E2=80=9D:<br>
<br>
Nope I=E2=80=99m wrong, the correct bug is &quot;if you typo the NVD_DB_VER=
SION then weird things happen=E2=80=9D.=C2=A0 I suggest either validating i=
t early, or always checking for equality instead of using else.=C2=A0 I acc=
identally put KFIE and it fell into a bad combination of cases.<br></blockq=
uote></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for testing=
 Ross! I&#39;m fixing that.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Kind regards,</div><div dir=3D"auto">Marta</div><div class=3D"gmail_quo=
te gmail_quote_container" dir=3D"auto"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blo=
ckquote></div></div>

--00000000000083ce6d0629692b0b--

