Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831EFC7EE2F
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 14:20:03 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web11.60251.1686579599730661793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 07:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AGtfNbRG;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: samuli.piippo@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7872d7b79e1so1547051241.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686579599; x=1689171599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ViBsEEwqJmvojg4tjO8J/de+H+uLVPV7UyjUq32Nhik=;
        b=AGtfNbRGUN6X/Iv/PtbOPoQug5JZ3I8sgy//BZIQuW4/ApPCASARCSm6BJ35D/IkFm
         wAy+pSrHdTKggtqKSTx/AmQwJQqeiGtO9TaG09lkKcvXjzjUAaQhzKUYhUBRpemQu4rT
         u8JbY3d+owTydfyDqjo40D4M7clBNnIfz/+U010iWdoGji/7uuJwNZ8ImWUyb+x62tGe
         twD4Z9aa47qcdAOGuZZD6udAeqPAxplL9YhZ6nOcFEr/L89yiqvEfr3TpGjh5LpAsms3
         hVXGFL2Yut5vgJQ1ObP8hHfX8EHoweaLQg/k/+uD22cog0PQSNOdO9Q2V6XXM60Y1JJ6
         VUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686579599; x=1689171599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViBsEEwqJmvojg4tjO8J/de+H+uLVPV7UyjUq32Nhik=;
        b=WE5GYHYNh30vorN1U6zcfDzcgpJCw7ATtXjBQ8pyj/1p/NVSgB/PRf1OUXCHqbSFhl
         Kb+JdZmElb3ggwx8NgNay3/P3Mz0dwNIOJM31r2LfEPdOMvdUq3fCwzN7FVaqM9HEyLh
         93zE5My2HTjVK6HLWMEFV0z1sDFqeroEe9KSG9kW+K79iL0mdTSEwYFk6XNnnviA4Fko
         vJiqnfrs68IKcFVq865tAB1p9jzmWa47wism9kndsBgRUttlA4wkD+5k0sfkE3LK6gHV
         BRSeJEjFy3ReZo+41bcHRmDtuuumdqfLD9+5dvksYyKRfNWG0b88cIniyFAEO7eU1+Wo
         t4rA==
X-Gm-Message-State: AC+VfDzUUjljxl0k1DzmnuJUDlDjTJ7EJqT9UzpIO2gfOiZAJUSp0KrZ
	YzM2NScH9E2iiLgNXLVUoAu2Qy6zznj3id4q4Wjow9dE
X-Google-Smtp-Source: ACHHUZ6IMRI4lIhOWhoyv8m8FOiIxDRlqvVVmw7N65x85CaJvIyipCvoTv+h/ZE016FEy5nTODwWJIwarxbG6+jx9uU=
X-Received: by 2002:a05:6102:53a:b0:42e:2b9f:f8f0 with SMTP id
 m26-20020a056102053a00b0042e2b9ff8f0mr3554304vsa.30.1686579598585; Mon, 12
 Jun 2023 07:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <1766DB271C48CF77.6460@lists.openembedded.org> <20230609030418.540053-1-mingli.yu@eng.windriver.com>
 <CA+chaQetTVmU7oMsQ8RPeJQ4Ou8=U2ua7LjFPe17RMqmGE+G2Q@mail.gmail.com>
In-Reply-To: <CA+chaQetTVmU7oMsQ8RPeJQ4Ou8=U2ua7LjFPe17RMqmGE+G2Q@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Mon, 12 Jun 2023 17:19:47 +0300
Message-ID: <CABXoSoU5SnciSU_wLPF7tB82WFxQZ0qTAD58jfPK99=MSSb+7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] qemu: Split the qemu package
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dbf1c005fdef6908"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 14:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182671

--000000000000dbf1c005fdef6908
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm seeing following QA issue after this change:


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

--000000000000dbf1c005fdef6908
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m seeing following QA issue after this change:<=
/div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Fri, 9 Jun 2023 at 08:22, Martin Jansa &lt;<a href=
=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div dir=3D"ltr">On Fri, Jun 9, 2023 at 5:04=E2=80=AFAM Yu, Mingli &lt;<a hr=
ef=3D"mailto:mingli.yu@eng.windriver.com" target=3D"_blank">mingli.yu@eng.w=
indriver.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 if userpackages:<br>
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

--000000000000dbf1c005fdef6908--

