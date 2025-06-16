Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BF4C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 23:45:47 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.6166.1750117541103291429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 16:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kei0Sw04;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7485bcb8b7cso4026467b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750117540; x=1750722340; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KFeEjbs42qRiWohjw30KXwJe6bq5JCS8UqKE5HMtHgE=;
        b=kei0Sw042HOah2AHZ/gQh5ZLXvMHHM/onXhUpaY5FRqEFhWr62GeTJ9ondr3vGPZCw
         59sf4SZmZW9QC+JYSnQ+iUF6viaCyEH488zXrJL9IubJ0FKszRpXfQKtZfbaZTBejjs0
         XIHZmHeFwgcns4eS8tXY+PQLNgOowsyzrtvLOBGaumKfctkxDDeEg2OvExSM/WbC0T2F
         Qsqjsm8nSWjXpRAjLGpp2MU1B6x8viXwF67cTlBOJEBdgZA3emblKE6oykupEAMT7LUD
         V5D2LhaMgoNrG+kQ2y9S2WWWImED3uw85bl3t8QOun2W+07p/+gMlYQCw1q4V9UuIdFT
         JZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750117540; x=1750722340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFeEjbs42qRiWohjw30KXwJe6bq5JCS8UqKE5HMtHgE=;
        b=LoTfKrUFeo/U7H/uBlAF6HpPtwsQmmEv+I+nlMtqit37NNL2Zr1UYK65kWgpcAsYZC
         I86Rsnq2Xe+x90NxDGPe+fwZ3L+ZkifxYVb68Gv5ExHVj15x0t7LR0fGRKIFgaa4aeVy
         AdGinBjovWcSv22ozLif6RftlIqKZR59gv7m3LV1Fy5+HF4CAhaUKoZp4omtJYw8+t26
         QKQz1CDcX1YGVAKbi8gQ9fP48XB61EpEUWReeXCGnAdSx8Y7sNClYgf6XEWmwwL27dLp
         /lfcb5HlSd8UH1jIbLapJ7YdYhjj7+BX8kUdg/AWVPAw8oFgu5UMXjx1sLDv6dTW4e9X
         h9wg==
X-Forwarded-Encrypted: i=1; AJvYcCUn8FLULWKrl4IlgOlG2hYxN4Q7F+pgocsLdeoPY+9o38Oo5bbY3KkGpnxYWM+E/CIcVXNANW22DJxgeyDqnP+q2Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxcreBXHlfBtC05bHX/gVXvWdmMZAQ8Wnq06oCPiIV9LizWed1K
	ClNXAPQn3QVTnDUfCPpx9dU/IfBzMZbH++IW3JJjqhltIhp+7SDYk63P3w64GbzVLpe7kLmumYh
	TaN8nn5RdphzOm0le82EqT1seif+plBU=
X-Gm-Gg: ASbGncsbJXBjccM1Qx7KkcZjQ9ZTeQLYvFGlUf0mvrXX/78McJytbF2cNEsNOWPgK6F
	aBwauVKxutSjBYiE2fWdkxCGQDcrfgTtV5imzqGzaKxMcBkso65txx9VbuvbK9PfOSTOR1TD/Oo
	rF7PXSZt9WkihcKRIxrIyVRdFS+6T6BWj7oWb2PcTwGRw4
X-Google-Smtp-Source: AGHT+IGRSccS46B++i7wC2okXk690fy07Rh9r268WxMF13KfKsL8LNVwXBqiFt42eJj2nrjFO6TnPRRUUyuYXhAYXtQ=
X-Received: by 2002:a05:6a00:13a6:b0:746:2ce5:a491 with SMTP id
 d2e1a72fcca58-7489cf752d5mr12618767b3a.10.1750117540366; Mon, 16 Jun 2025
 16:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250616183028.87531-1-alexander.sowarka@linaro.org> <1849AA7A36399607.11779@lists.openembedded.org>
In-Reply-To: <1849AA7A36399607.11779@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Jun 2025 19:45:28 -0400
X-Gm-Features: AX0GCFv8uCzWAVWYH4mRTRnM1Q_nNqIirR0aoFEwaUSgF2MLhlKGJqyTly0e_fA
Message-ID: <CADkTA4PcxTMULLpTCwSG90MMi-8b5NqgB6GtwXODsBL7S-bPgQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: Do not use allnoconfig for
 in-tree configs
To: bruce.ashfield@gmail.com
Cc: alexander.sowarka@linaro.org, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004f0c570637b8fe34"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 23:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218848

--0000000000004f0c570637b8fe34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 7:42=E2=80=AFPM Bruce Ashfield via lists.openembedd=
ed.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Mon, Jun 16, 2025 at 2:30=E2=80=AFPM Alexander Sowarka via
> lists.openembedded.org <alexander.sowarka=3D
> linaro.org@lists.openembedded.org> wrote:
>
>> The documentation clearly states that in-tree configs, configured with
>> KBUILD_DEFCONFIG will set all missing config flags to their default
>> value and specifying KCONFIG_MODE is not required.
>> Fix the check for in-tree configs.
>>
>
> The documentation is wrong then. It was written to match the code, not
> vice versa.
>

Actually, what I'd rather suggest is amending the log to not mention the
documentation.

It is never a reason to change the kernel code (which is what I was
stating), since the code came first.

We could change this, as the behaviour would still be the same for an
out of tree defconfig (which is the real -n case).

So with an amended commit log, I withdraw my objection.

Bruce


> This behaviour should stay at the default, since there's a way to overrid=
e
> it,
> and it has been that way for quite some time.
>
> Cheers,
>
> Bruce
>
>
>
>>
>> Signed-off-by: Alexander Sowarka <alexander.sowarka@linaro.org>
>> ---
>>  meta/classes-recipe/kernel-yocto.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
>> b/meta/classes-recipe/kernel-yocto.bbclass
>> index 9a86616dad..44d09a9b42 100644
>> --- a/meta/classes-recipe/kernel-yocto.bbclass
>> +++ b/meta/classes-recipe/kernel-yocto.bbclass
>> @@ -460,7 +460,7 @@ do_kernel_configme() {
>>                         config_flags=3D""
>>                         ;;
>>                 *)
>> -                       if [ -f ${WORKDIR}/defconfig ]; then
>> +                       if [ -z ${KBUILD_DEFCONFIG} ] && [ -f
>> ${WORKDIR}/defconfig ]; then
>>                                 config_flags=3D"-n"
>>                         fi
>>                         ;;
>>
>>
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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218847):
> https://lists.openembedded.org/g/openembedded-core/message/218847
> Mute This Topic: https://lists.openembedded.org/mt/113676136/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004f0c570637b8fe34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 16, 2025 at 7:42=
=E2=80=AFPM Bruce Ashfield via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@l=
ists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, Jun 16, 2025 at 2:30=E2=80=AFPM Alexander Sowarka via <a href=3D"http:=
//lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;=
alexander.sowarka=3D<a href=3D"mailto:linaro.org@lists.openembedded.org" ta=
rget=3D"_blank">linaro.org@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">The documentation clearly =
states that in-tree configs, configured with<br>
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

--0000000000004f0c570637b8fe34--

