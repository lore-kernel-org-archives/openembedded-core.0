Return-Path: <alexander.sowarka@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B640C71159
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 00:39:47 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.7253.1750120778392777393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 17:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ulC7QQoa;
 spf=pass (domain: linaro.org, ip: 209.85.208.51, mailfrom: alexander.sowarka@linaro.org)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso9357370a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 17:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750120777; x=1750725577; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OlJT8gAHQ9fzezbJ6jFtsD5C/iDxf6B+fZSkX3P4eNo=;
        b=ulC7QQoaJcMVNXVJ60chVoeRpDxPoDXcrKSr1qxMGFNGRRWqzgAaEvpJDRgJz5tKJU
         tPJbPcSW/hkv4E0B8y8Xr1LhQacb0Q5ZI6HqUJGZUQFCQK1mKXrL3GlnBCGA5uzmjenm
         XDg/bveLh5ET0VOQXdOQmNn8y2jcPAY0pOsOMVO+T1AkXeL0ccqtxLL8sbMmC4hTnnF6
         y+wbZFuRfWjN4taISzNiWY5LSOlNM7UmIAG+ucZlMr32Ti2NsaV4D0qizRJF3kXsfdfS
         cf6QArwt5sO7Mm+ZGiwqHXU9ZoBy+JSaa3ynNJcMHJi441r9Ud++jDSih9lfA8hU4E09
         YQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750120777; x=1750725577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OlJT8gAHQ9fzezbJ6jFtsD5C/iDxf6B+fZSkX3P4eNo=;
        b=X3cTpjwSsC+OKeUDrPqUI63iVNsOVxuU5oPhl2bMX+UhzBT8QJBupVn+U/JNUxmaKq
         ziuXxltb6PHbVUZB6q5I/enLPIPF6HfCHvuFay29XQfT7S2OMzhl5ptBZ6Wl9PzhcKGj
         1YYVBoxAnmzuGnhJzitlAcEnvVn3XK6YfcaXXaOkaBG2u8jXMkJIW9KqfCwPufXo2n+k
         /s+moAc4O6fCWez3H7eHXgdTtXjivpMu9woApstcyoww+GvwTYnIJ6cS264bP3s1mbKP
         n0HhYswOc/ZRhaO4JXtkhigEDuiqFWsSPh1R/Ef1LMSVDi7GUpI4orMbO2yP+mr6B1dZ
         o19w==
X-Gm-Message-State: AOJu0YzYvQrzbjkw7uAWoqC7HCPtnpK2EuMJxjVRLDad1I8SWflNU+ey
	j4lwd78ymtVT/q77DZrG5yZqt5I79iGANeEwi8O08+DbfjeS1kXRwNNfTKaApQIWRmXWkRdZKsm
	NyO20GX4XnqmF012oa2r/jqCxoJT5v4iktibV28niQg==
X-Gm-Gg: ASbGncs2ccO5m87i0I/Gf3BUFyAKKRo1FnnnNc5LW0RCqA7QjzWYnngWWakJrC2i+d2
	W/Klewu8RjP3dO8lIzdJD3p3hXGvwpHfM2dF7ZaISqSkNBFs2kijaTszcCfRytaww4t3+HLxp7Q
	eGX4Ufq1aVWsvLqE0fikQSms0uvksyROw/8H4JvCBYHT+/Ec5ioSD3TLiw
X-Google-Smtp-Source: AGHT+IF+c/g0bA+kz/y/GfwE9taH75W6q6pAbYPGJKS3zvdO+Hn1NAzHju7Gnv6QdlBj3VQ/uEswgkhdLtiJj1QDbF4=
X-Received: by 2002:a50:d519:0:b0:609:a91:87e with SMTP id 4fb4d7f45d1cf-6090a91097amr4663174a12.1.1750120776602;
 Mon, 16 Jun 2025 17:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250616183028.87531-1-alexander.sowarka@linaro.org>
 <1849AA7A36399607.11779@lists.openembedded.org> <CADkTA4PcxTMULLpTCwSG90MMi-8b5NqgB6GtwXODsBL7S-bPgQ@mail.gmail.com>
In-Reply-To: <CADkTA4PcxTMULLpTCwSG90MMi-8b5NqgB6GtwXODsBL7S-bPgQ@mail.gmail.com>
From: Alexander Sowarka <alexander.sowarka@linaro.org>
Date: Mon, 16 Jun 2025 21:39:25 -0300
X-Gm-Features: AX0GCFtcItcUxq6z6ra-kf3zU5PD7OWOU1OrQYGWuXi-aK63fSemwpizpZ-QNAA
Message-ID: <CAOx2fPjnxUEVVSRgiNPCpdogFhrqH-rnt5BoM2J11CFASyrZQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: Do not use allnoconfig for
 in-tree configs
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003436320637b9bfcc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 00:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218849

--0000000000003436320637b9bfcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just saw that the documentation was already changed recently with commit
https://git.yoctoproject.org/poky/commit/?id=3Dd87b9163a1c2954bedecc01fb08f=
7af5ab1ae63d
Though I would argue that alldefconfig would actually be a sane default for
in-tree configs. I would suggest that I update the
commit message and re-add the paragraph in the documentation. If this
feature is not desired I suggest adding a sentence
to the in-tree defconfig section in common.rst that actually setting
KCONFIG_MODE is required. I had a hard time figuring out why my kernel was
completely broken
without this setting.

Kind regards,
Alexander Sowarka


On Mon, 16 Jun 2025 at 20:45, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Mon, Jun 16, 2025 at 7:42=E2=80=AFPM Bruce Ashfield via lists.openembe=
dded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
>>
>>
>> On Mon, Jun 16, 2025 at 2:30=E2=80=AFPM Alexander Sowarka via
>> lists.openembedded.org <alexander.sowarka=3D
>> linaro.org@lists.openembedded.org> wrote:
>>
>>> The documentation clearly states that in-tree configs, configured with
>>> KBUILD_DEFCONFIG will set all missing config flags to their default
>>> value and specifying KCONFIG_MODE is not required.
>>> Fix the check for in-tree configs.
>>>
>>
>> The documentation is wrong then. It was written to match the code, not
>> vice versa.
>>
>
> Actually, what I'd rather suggest is amending the log to not mention the
> documentation.
>
> It is never a reason to change the kernel code (which is what I was
> stating), since the code came first.
>
> We could change this, as the behaviour would still be the same for an
> out of tree defconfig (which is the real -n case).
>
> So with an amended commit log, I withdraw my objection.
>
> Bruce
>
>
>> This behaviour should stay at the default, since there's a way to
>> override it,
>> and it has been that way for quite some time.
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>
>>>
>>> Signed-off-by: Alexander Sowarka <alexander.sowarka@linaro.org>
>>> ---
>>>  meta/classes-recipe/kernel-yocto.bbclass | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
>>> b/meta/classes-recipe/kernel-yocto.bbclass
>>> index 9a86616dad..44d09a9b42 100644
>>> --- a/meta/classes-recipe/kernel-yocto.bbclass
>>> +++ b/meta/classes-recipe/kernel-yocto.bbclass
>>> @@ -460,7 +460,7 @@ do_kernel_configme() {
>>>                         config_flags=3D""
>>>                         ;;
>>>                 *)
>>> -                       if [ -f ${WORKDIR}/defconfig ]; then
>>> +                       if [ -z ${KBUILD_DEFCONFIG} ] && [ -f
>>> ${WORKDIR}/defconfig ]; then
>>>                                 config_flags=3D"-n"
>>>                         fi
>>>                         ;;
>>>
>>>
>>>
>>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#218847):
>> https://lists.openembedded.org/g/openembedded-core/message/218847
>> Mute This Topic: https://lists.openembedded.org/mt/113676136/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--0000000000003436320637b9bfcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I just saw that the documentation was already changed=
 recently with commit=C2=A0<a href=3D"https://git.yoctoproject.org/poky/com=
mit/?id=3Dd87b9163a1c2954bedecc01fb08f7af5ab1ae63d">https://git.yoctoprojec=
t.org/poky/commit/?id=3Dd87b9163a1c2954bedecc01fb08f7af5ab1ae63d</a><br>Tho=
ugh I would argue that alldefconfig would actually be a sane default for in=
-tree configs. I would suggest that I update the</div><div>commit message a=
nd re-add the paragraph in the documentation. If this feature is not desire=
d I suggest adding a sentence</div><div>to the in-tree defconfig section in=
 common.rst that actually setting KCONFIG_MODE is required. I had a hard ti=
me figuring out why my kernel was completely broken</div><div>without this =
setting.</div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmai=
l=3D"gmail_signature"><div dir=3D"ltr"><br></div><div dir=3D"ltr">Kind rega=
rds,<div>Alexander Sowarka</div></div></div></div><br></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, 16 Jun 2025 at 20:45, Bruce Ashfield &lt;<a href=3D"mailto:bruce.=
ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"lt=
r"><div class=3D"gmail_default" style=3D"font-size:small"><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Jun 16, 2025 at 7:42=E2=80=AFPM Bruce Ashfield via <a href=3D"http://lists=
.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;bruce.a=
shfield=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_bl=
ank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 16, 2025=
 at 2:30=E2=80=AFPM Alexander Sowarka via <a href=3D"http://lists.openembed=
ded.org" target=3D"_blank">lists.openembedded.org</a> &lt;alexander.sowarka=
=3D<a href=3D"mailto:linaro.org@lists.openembedded.org" target=3D"_blank">l=
inaro.org@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">The documentation clearly states that in-t=
ree configs, configured with<br>
KBUILD_DEFCONFIG will set all missing config flags to their default<br>
value and specifying KCONFIG_MODE is not required.<br>
Fix the check for in-tree configs.<br></blockquote><div><br></div><div><div=
 style=3D"font-size:small">The documentation is wrong then. It was written =
to match the code, not</div><div style=3D"font-size:small">vice versa.</div=
></div></div></div></div></blockquote><div><br></div><div class=3D"gmail_de=
fault" style=3D"font-size:small">Actually, what=C2=A0I&#39;d rather suggest=
 is amending=C2=A0the log to not mention the</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">documentation.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">It is never a reason to change the kernel code (which =
is what I was</div><div class=3D"gmail_default" style=3D"font-size:small">s=
tating), since the code came first.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">We could change=C2=A0this, as the behaviour would still be the s=
ame for an</div><div class=3D"gmail_default" style=3D"font-size:small">out =
of tree defconfig (which is the real -n case).</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">So with an amended=C2=A0commit log, I withdraw my obj=
ection.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote"><div><div style=3D"font-size:small"><br></div><div styl=
e=3D"font-size:small">This behaviour should stay at the default, since ther=
e&#39;s a way to override it,</div><div style=3D"font-size:small">and it ha=
s been that way for quite some time.</div><div style=3D"font-size:small"><b=
r></div><div style=3D"font-size:small">Cheers,</div><div style=3D"font-size=
:small"><br></div><div style=3D"font-size:small">Bruce</div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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

--0000000000003436320637b9bfcc--

