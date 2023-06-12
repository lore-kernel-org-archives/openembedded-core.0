Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C3BC88CB2
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 14:22:03 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web11.60311.1686579717802618793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 07:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lr7ymbaO;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: samuli.piippo@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-461b6c85a28so1765791e0c.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 07:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686579716; x=1689171716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d+DcV7ws1D540fcedAWjC1IbjjB0p1Dxc7S/Xsdvv+o=;
        b=lr7ymbaOHztWfRkoi8lNVLmr5EG9MIlcZFx/KkRA8iCz/JdbLGzMK9GJYr0fcUFkkT
         Zi/mp3jl74E1p43GiBPm+KsGnpHpcTrtF6Rq0zE35hOlYtEgqg5UFC8c2PuHfoZHLEvL
         /YmUQ6MLmozK8Bzo+Bw1+fvAL4HTXi5Kv6ZpCa31Xsx6PG8zX2KmeY+SSENLUq2Nc5oN
         lB+eCusjlS8coL8KSJtRAzioGCsMBuPGvWI3ZVFpoQpAgN7EbyHnWU8exU8q4NgzKwrg
         fFG53ySFE7kMz2OwHjSW31jXCQYTXBnTpUDehx4FtstvRyQEU2+Z8NdqKpVa9l5OBPrh
         iEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686579717; x=1689171717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+DcV7ws1D540fcedAWjC1IbjjB0p1Dxc7S/Xsdvv+o=;
        b=WoSO7GLt56M8bIl1hG0dtFNYguFlzMc9vuHdiKOdaFN2fiNgcz4WtOJmt19+TE/86T
         Unf3LROErEvWbKONFdbOgGw9r1TFO9LtCerS6YfrtsIba3pYh59DZoEFpinCvprDEVqa
         ypo6MCF05ny18dsfU8GZS6o6/kXJUT8e8UMG9c13RLkTjjEotsTFicrgMqPOEJyjiCso
         clKXQL2NyzPKLzeBSwEJOf12sEz5ALFKRiSZMONH8g6dO1xWVB6nwmemR8O5ayMs02kJ
         wt5A/aEFGyC/ZfxdbKIq+/bVRUlrpJKtYhlZ7+VJsPzLTvRp942NCv8HUWRYkXQ5v16H
         J27w==
X-Gm-Message-State: AC+VfDwsndDIHxKDYqMCGLAV9Jz01E1sfr5P1eJpoOSJyscM3gvIcZ+B
	kX5PR3EuaZyFn2dxilkXXetewOs4KRMavIPE2/6rhn3kajdmeQ==
X-Google-Smtp-Source: ACHHUZ5E6U9ohQYzIVtC5FPl+hUtv2gieopEyOhudU/qwrfIZaDugnM16UWyCNqf2TDg8JkzB7w5KcTvKfsUk4uAZIs=
X-Received: by 2002:a05:6102:c4:b0:43b:3457:5d2c with SMTP id
 u4-20020a05610200c400b0043b34575d2cmr4105744vsp.26.1686579716713; Mon, 12 Jun
 2023 07:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <1766DB271C48CF77.6460@lists.openembedded.org> <20230609030418.540053-1-mingli.yu@eng.windriver.com>
 <CA+chaQetTVmU7oMsQ8RPeJQ4Ou8=U2ua7LjFPe17RMqmGE+G2Q@mail.gmail.com>
In-Reply-To: <CA+chaQetTVmU7oMsQ8RPeJQ4Ou8=U2ua7LjFPe17RMqmGE+G2Q@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Mon, 12 Jun 2023 17:21:45 +0300
Message-ID: <CABXoSoWj1zga+3g4N+oZ-PkbA4D-n5ozLGO8Un108gsqGFPgJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] qemu: Split the qemu package
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e670cb05fdef70e6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 14:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182672

--000000000000e670cb05fdef70e6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm seeing following QA issue after this change:

ERROR: nativesdk-qemu-8.0.0-r0 do_package_qa: QA Issue:
nativesdk-qemu-user-mips rdepends on nativesdk-bash, but it isn't a build
dependency, missing nativesdk-bash in DEPENDS or PACKAGECONFIG? [build-deps=
]
ERROR: nativesdk-qemu-8.0.0-r0 do_package_qa: Fatal QA errors were found,
failing task.

On Fri, 9 Jun 2023 at 08:22, Martin Jansa <Martin.Jansa@gmail.com> wrote:

> On Fri, Jun 9, 2023 at 5:04=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windrive=
r.com>
> wrote:
>
>> +    if userpackages:
>> +        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', '
>> '.join(userpackages))
>> +    mipspackage =3D d.getVar('PN') + "-user-mips"
>> +    if mipspackage in ' '.join(userpackages):
>> +        d.appendVar('RDEPENDS:' + mipspackage, ' ' +
>> d.getVar("MLPREFIX") + 'bash')
>>
>
> This is just a style question, you don't need to update.
>
> Is it worth making this conditional on ${PN}-user-mips existence? I would
> just use
>
> RDEPENDS:${PN}-user-mips =3D "bash"
>
> outside this function and I don't think you would even need to explicitly
> use ${MLPREFIX}. Nothing will break when ${PN}-user-mips doesn't exist
> (e.g. when splitting is disabled) and it's a bit easier to read than
> corresponding 3 lines in python.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182530):
> https://lists.openembedded.org/g/openembedded-core/message/182530
> Mute This Topic: https://lists.openembedded.org/mt/99421260/3617605
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> samuli.piippo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e670cb05fdef70e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-im"><div>I&#39;m seeing following QA =
issue after this change:</div><div><br></div><div>ERROR: nativesdk-qemu-8.0=
.0-r0 do_package_qa: QA Issue: nativesdk-qemu-user-mips rdepends on natives=
dk-bash, but it isn&#39;t a build dependency, missing nativesdk-bash in DEP=
ENDS or PACKAGECONFIG? [build-deps]<br>ERROR: nativesdk-qemu-8.0.0-r0 do_pa=
ckage_qa: Fatal QA errors were found, failing task.</div></span></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 9 J=
un 2023 at 08:22, Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com=
">Martin.Jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Fri, Jun 9, 20=
23 at 5:04=E2=80=AFAM Yu, Mingli &lt;<a href=3D"mailto:mingli.yu@eng.windri=
ver.com" target=3D"_blank">mingli.yu@eng.windriver.com</a>&gt; wrote:<br></=
div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">+=C2=A0 =C2=A0 if userpackages:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;RDEPENDS:&#39; + d.getVar(&#39;P=
N&#39;) + &#39;-user-all&#39;, &#39; &#39;.join(userpackages))<br>
+=C2=A0 =C2=A0 mipspackage =3D d.getVar(&#39;PN&#39;) + &quot;-user-mips&qu=
ot;<br>
+=C2=A0 =C2=A0 if mipspackage in &#39; &#39;.join(userpackages):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS:&#39; + mipspackage,=
 &#39; &#39; + d.getVar(&quot;MLPREFIX&quot;) + &#39;bash&#39;)<br></blockq=
uote><div><br></div><div>This is just a style question, you don&#39;t need =
to update.</div><div><br></div><div>Is it worth making this conditional on =
${PN}-user-mips existence? I would just use</div><div><br></div><div>RDEPEN=
DS:${PN}-user-mips =3D &quot;bash&quot;=C2=A0</div><div><br></div><div>outs=
ide this function and I don&#39;t think you would even need to explicitly u=
se ${MLPREFIX}. Nothing will break when ${PN}-user-mips doesn&#39;t exist (=
e.g. when splitting is disabled) and it&#39;s a bit easier to read than cor=
responding 3 lines in python.</div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#182530): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/182530" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/182530</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99421260/3617=
605" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99421260/3617605</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:samuli.piippo@gmail.com" t=
arget=3D"_blank">samuli.piippo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e670cb05fdef70e6--

