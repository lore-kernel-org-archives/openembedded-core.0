Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6676FC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 00:46:07 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.7272.1750121163255900892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 17:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GMoExlS8;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7489dfb7248so1644128b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 17:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750121163; x=1750725963; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=djhp+szI1mzWBXdfm2y8t2dVC4rV04T5V9D2bCUoPgw=;
        b=GMoExlS8LBEzRJUBP7TAB2eqETGNrPXvthsNxeF8Mh5cklHVwJ+PqltnKfyqhmOtx4
         CxbPKDLgO4n4eOOmYxsRaFdXd0RoUTe7eKMjsiCYSAORz0kaCYT0Evp7C7jH7iorCg+r
         Api23jJhICXwfRWjgpjfMzAd0iWBZa3UywBxjampj+0D7E7tc+3Ft2tsQcB3hriB+76H
         YPulkKC2joIWVLrwQGO0xUt5gY7G2Dg6vOUfDQJc8nXYqnaGEAV1ehlpnpxXLofST0Ku
         XimSV3jj8GSAgokohjGNnFWbRzH20N5sG2/9WVfuKReM4qXjkvkZ+cTbjMl0ZsykdmHY
         8PEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750121163; x=1750725963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djhp+szI1mzWBXdfm2y8t2dVC4rV04T5V9D2bCUoPgw=;
        b=oBLnVrqvAvqMnkFVFZnypVN5oUsT8z/svy78XLvDRyI8LW6Uopc1791QZIVqwcicoE
         CFI/SBKW2+b7XCiDEp4K7Nk4AEmXL2BdVSp/pOTvDrtS8Icb0LcS04f39wmSPAdZ8fu9
         RyFLumft2VjLoek+Z9YrhyJCtE9USKreQE3V2gnWGNqpIQRpMzixZTM9ZLpDsauyj0Is
         z5blmVKNSYhSk8/hYqRdJKdzcjmiKolhOma7ypR4fBcUsrwrq5kAQ9OJHuGGsU9aBtDh
         SOHRRb3oORkFAPRCp2gA3aGPsesqidSsWrZxZytF6dGEDC9kukJrzVvHtdWNYt6LEIRH
         bkhw==
X-Gm-Message-State: AOJu0YyQT6M+zxWhoE5JpaqQWcms79LJxT3z0E+rxQ6rr5AIdD/jCyNB
	MBc6z/wHuBQlIAK0q8p9ThfbGvWuVOENpgb7iKS4Aa6JiQccWFmnmsqSE0i2MHn0uiht9cXm+bX
	bugCAJrSfBF7E2Ls31OUVInildokCGdY=
X-Gm-Gg: ASbGncv4kNFOLvj+08TApGuPfo+DhixfL13f+sk/iq4ec2s8+qGCJkvApdy38WEPTgv
	XvxoqWGBCPkouAvY78nxBH38k8dYSb4Hr/98qJ02GWI0B5AUzkWksh17rVwAxiBmRtrsNLvGCGO
	1QrPWCg4l8Jlia7s6CVLUTmYvkariH0DUcxWIMqGjmePer
X-Google-Smtp-Source: AGHT+IEx82cD15enzexrq9CmTzq07twOiKTLKTFiofnctt/CKrT3Aq+Lxt/Ypbogi3tFfxO/9dURMCWWjZcX3r5hmkA=
X-Received: by 2002:a05:6a00:a8e:b0:748:2e7b:3308 with SMTP id
 d2e1a72fcca58-7489ce07d29mr15019038b3a.6.1750121162373; Mon, 16 Jun 2025
 17:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250616183028.87531-1-alexander.sowarka@linaro.org>
 <1849AA7A36399607.11779@lists.openembedded.org> <CADkTA4PcxTMULLpTCwSG90MMi-8b5NqgB6GtwXODsBL7S-bPgQ@mail.gmail.com>
 <CAOx2fPjnxUEVVSRgiNPCpdogFhrqH-rnt5BoM2J11CFASyrZQw@mail.gmail.com>
In-Reply-To: <CAOx2fPjnxUEVVSRgiNPCpdogFhrqH-rnt5BoM2J11CFASyrZQw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Jun 2025 20:45:50 -0400
X-Gm-Features: AX0GCFspcYB_R8NbVcZk2hTbnm4qI6SHpcH5RfiZhOq0r0_C34jQNkz8ntKAqpI
Message-ID: <CADkTA4OddLPrD14Lskgxb4vjXBdimH4-DFSz3NOZf55ePH7ZDg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: Do not use allnoconfig for
 in-tree configs
To: Alexander Sowarka <alexander.sowarka@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000327efe0637b9d6df"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 00:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218850

--000000000000327efe0637b9d6df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 8:39=E2=80=AFPM Alexander Sowarka <
alexander.sowarka@linaro.org> wrote:

> I just saw that the documentation was already changed recently with commi=
t
> https://git.yoctoproject.org/poky/commit/?id=3Dd87b9163a1c2954bedecc01fb0=
8f7af5ab1ae63d
> Though I would argue that alldefconfig would actually be a sane default
> for in-tree configs. I would suggest that I update the
>

It is a sane default now, definitely. It wasn't when I started the
configuration framework.

The Kconfig's didn't have enough selected, and often the defconfigs were
complete .config's,
so we started with everything off,  that way we only got what was
explicitly specified.

That's the history and baseline for why I rescinded my concerns! :)

Bruce



> commit message and re-add the paragraph in the documentation. If this
> feature is not desired I suggest adding a sentence
> to the in-tree defconfig section in common.rst that actually setting
> KCONFIG_MODE is required. I had a hard time figuring out why my kernel wa=
s
> completely broken
> without this setting.
>
> Kind regards,
> Alexander Sowarka
>
>
> On Mon, 16 Jun 2025 at 20:45, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>>
>>
>> On Mon, Jun 16, 2025 at 7:42=E2=80=AFPM Bruce Ashfield via lists.openemb=
edded.org
>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>
>>>
>>>
>>> On Mon, Jun 16, 2025 at 2:30=E2=80=AFPM Alexander Sowarka via
>>> lists.openembedded.org <alexander.sowarka=3D
>>> linaro.org@lists.openembedded.org> wrote:
>>>
>>>> The documentation clearly states that in-tree configs, configured with
>>>> KBUILD_DEFCONFIG will set all missing config flags to their default
>>>> value and specifying KCONFIG_MODE is not required.
>>>> Fix the check for in-tree configs.
>>>>
>>>
>>> The documentation is wrong then. It was written to match the code, not
>>> vice versa.
>>>
>>
>> Actually, what I'd rather suggest is amending the log to not mention the
>> documentation.
>>
>> It is never a reason to change the kernel code (which is what I was
>> stating), since the code came first.
>>
>> We could change this, as the behaviour would still be the same for an
>> out of tree defconfig (which is the real -n case).
>>
>> So with an amended commit log, I withdraw my objection.
>>
>> Bruce
>>
>>
>>> This behaviour should stay at the default, since there's a way to
>>> override it,
>>> and it has been that way for quite some time.
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>
>>>
>>>>
>>>> Signed-off-by: Alexander Sowarka <alexander.sowarka@linaro.org>
>>>> ---
>>>>  meta/classes-recipe/kernel-yocto.bbclass | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
>>>> b/meta/classes-recipe/kernel-yocto.bbclass
>>>> index 9a86616dad..44d09a9b42 100644
>>>> --- a/meta/classes-recipe/kernel-yocto.bbclass
>>>> +++ b/meta/classes-recipe/kernel-yocto.bbclass
>>>> @@ -460,7 +460,7 @@ do_kernel_configme() {
>>>>                         config_flags=3D""
>>>>                         ;;
>>>>                 *)
>>>> -                       if [ -f ${WORKDIR}/defconfig ]; then
>>>> +                       if [ -z ${KBUILD_DEFCONFIG} ] && [ -f
>>>> ${WORKDIR}/defconfig ]; then
>>>>                                 config_flags=3D"-n"
>>>>                         fi
>>>>                         ;;
>>>>
>>>>
>>>>
>>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#218847):
>>> https://lists.openembedded.org/g/openembedded-core/message/218847
>>> Mute This Topic: https://lists.openembedded.org/mt/113676136/1050810
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>>> bruce.ashfield@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000327efe0637b9d6df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 16, 2025 at 8:39=
=E2=80=AFPM Alexander Sowarka &lt;<a href=3D"mailto:alexander.sowarka@linar=
o.org">alexander.sowarka@linaro.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>I just saw that th=
e documentation was already changed recently with commit=C2=A0<a href=3D"ht=
tps://git.yoctoproject.org/poky/commit/?id=3Dd87b9163a1c2954bedecc01fb08f7a=
f5ab1ae63d" target=3D"_blank">https://git.yoctoproject.org/poky/commit/?id=
=3Dd87b9163a1c2954bedecc01fb08f7af5ab1ae63d</a><br>Though I would argue tha=
t alldefconfig would actually be a sane default for in-tree configs. I woul=
d suggest that I update the</div></div></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">It is a sane=C2=A0defau=
lt now, definitely. It wasn&#39;t when I started the configuration framewor=
k.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">The Kconfig&#39;s=C2=
=A0didn&#39;t=C2=A0have enough selected, and often the defconfigs were comp=
lete .config&#39;s,</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">so we started with everything off,=C2=A0 that way we only got what was=
 explicitly=C2=A0specified.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">That&#39;s the history and baseline=C2=A0for why I rescinded=C2=A0my con=
cerns! :)</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div>commit message and re-add the paragraph in the document=
ation. If this feature is not desired I suggest adding a sentence</div><div=
>to the in-tree defconfig section in common.rst that actually setting KCONF=
IG_MODE is required. I had a hard time figuring out why my kernel was compl=
etely broken</div><div>without this setting.</div><div><div dir=3D"ltr" cla=
ss=3D"gmail_signature"><div dir=3D"ltr"><br></div><div dir=3D"ltr">Kind reg=
ards,<div>Alexander Sowarka</div></div></div></div><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 16 Jun 2025 =
at 20:45, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" ta=
rget=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><=
div style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 16, 2025 at 7:42=E2=80=
=AFPM Bruce Ashfield via <a href=3D"http://lists.openembedded.org" target=
=3D"_blank">lists.openembedded.org</a> &lt;bruce.ashfield=3D<a href=3D"mail=
to:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div style=
=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Jun 16, 2025 at 2:30=E2=80=AFPM Alex=
ander Sowarka via <a href=3D"http://lists.openembedded.org" target=3D"_blan=
k">lists.openembedded.org</a> &lt;alexander.sowarka=3D<a href=3D"mailto:lin=
aro.org@lists.openembedded.org" target=3D"_blank">linaro.org@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">The documentation clearly states that in-tree configs, configured w=
ith<br>
KBUILD_DEFCONFIG will set all missing config flags to their default<br>
value and specifying KCONFIG_MODE is not required.<br>
Fix the check for in-tree configs.<br></blockquote><div><br></div><div><div=
 style=3D"font-size:small">The documentation is wrong then. It was written =
to match the code, not</div><div style=3D"font-size:small">vice versa.</div=
></div></div></div></div></blockquote><div><br></div><div style=3D"font-siz=
e:small">Actually, what=C2=A0I&#39;d rather suggest is amending=C2=A0the lo=
g to not mention the</div><div style=3D"font-size:small">documentation.</di=
v><div style=3D"font-size:small"><br></div><div style=3D"font-size:small">I=
t is never a reason to change the kernel code (which is what I was</div><di=
v style=3D"font-size:small">stating), since the code came first.</div><div =
style=3D"font-size:small"><br></div><div style=3D"font-size:small">We could=
 change=C2=A0this, as the behaviour would still be the same for an</div><di=
v style=3D"font-size:small">out of tree defconfig (which is the real -n cas=
e).</div><div style=3D"font-size:small"><br></div><div style=3D"font-size:s=
mall">So with an amended=C2=A0commit log, I withdraw my objection.</div><di=
v style=3D"font-size:small"><br></div><div style=3D"font-size:small">Bruce<=
/div><div style=3D"font-size:small"><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_=
quote"><div><div style=3D"font-size:small"><br></div><div style=3D"font-siz=
e:small">This behaviour should stay at the default, since there&#39;s a way=
 to override it,</div><div style=3D"font-size:small">and it has been that w=
ay for quite some time.</div><div style=3D"font-size:small"><br></div><div =
style=3D"font-size:small">Cheers,</div><div style=3D"font-size:small"><br><=
/div><div style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Alexander Sowarka &lt;<a href=3D"mailto:alexander.sowarka@li=
naro.org" target=3D"_blank">alexander.sowarka@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass<br>
index 9a86616dad..44d09a9b42 100644<br>
--- a/meta/classes-recipe/kernel-yocto.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
@@ -460,7 +460,7 @@ do_kernel_configme() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 config_flags=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -f ${WORKDIR}/defconfig ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -z ${KBUILD_DEFCONFIG} ] &amp;&amp; [ -f ${WORKDIR}/defconfi=
g ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config_flags=3D&quot;-n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ;;<br>
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#218847): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/218847" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/218847</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113676136/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113676136/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</blockquote></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000327efe0637b9d6df--

