Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489B3C6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 16:09:38 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.16445.1678982971690108126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 09:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cd8vvaan;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id b10so1820146lfb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 09:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678982969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F7tkG9umsLVmPRlR79Nyqzjmn+2kHb1zKcrJo7DFGi4=;
        b=cd8vvaan9NLaYGmWy8Mn1RMY1xxZlAtvo4YA9kI7JV7s5uuHFhHkSDTRVichCuqls7
         g5+Ah4pPzL5Xdgl0bLnKWdjFdvqSDc2Ktnmkci/hRVxgqZNMqIgmty+R3o7TjJrFByqO
         Aj0h/aC0GCTxwcnUaljcf7JL8U8j7Nfa1Gxg2qc0msKFqj/WoVFzyZT+76mqkUPaZT0U
         alLvC4ZIhVTjOp9V5b7SLz0hPuz7LoDucSsrckmdXiA7qd7F8/YFLSym+XYO7xFKjYgA
         YIn768weawZvrkqJNVKXjnlCQTTV+46EhOT8USEKIti+LdtvnIDVvaoyFUsWOUCCpgHI
         Wrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678982969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7tkG9umsLVmPRlR79Nyqzjmn+2kHb1zKcrJo7DFGi4=;
        b=4aM1rRAZ6An/13eXVTSfCqg4c3z0rwRjtIAYqkF7wACoK58K3WWinNiRTEkeIB/Ytn
         DDNSgwVHpiJlNkgxH3sqU9NqDAZVZRKzMQrIpDozQ7sw5ZKOyM03ZT6mXi215ZXpfvPJ
         UP3jq2KaDZyXL+VvcmVe0KIQYxSn4UVO0+rHpZUDnEnds6etds4Q2pu0eXEpa8ane9pS
         pYbd1A0doh+Sov1bT2x5WtBjj+95nym60j7O3LGL5onGlkEvgMfW0r8yENJWmmBSsgUt
         9jKnwNQdQl4TQls1Xyeuqd8s442JmQEYidYJAFJYKA28uSbwYvXyt3bx0LQwQS2MKkQx
         IdPA==
X-Gm-Message-State: AO0yUKVIDteAnrpKDbEnHYxN3u5DAQHbTQO53KciIqytqoJ9O23NZJgi
	P5559p9unB3FnGYuVdMks43ZavJpjH6WHQKyJpA=
X-Google-Smtp-Source: AK7set/pov6wR22eoDhngFvH+VXU04Sprv3IGUdNULZ0L6TX1REF0gZlzEol8kUA0/2H4FeBq1BT39M3IpZ4l9qh8i8=
X-Received: by 2002:ac2:539b:0:b0:4d5:ca43:7049 with SMTP id
 g27-20020ac2539b000000b004d5ca437049mr3337483lfh.12.1678982969382; Thu, 16
 Mar 2023 09:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeoOSGvNNQOq78-Nh4hqqX-C1nYWjM7uMH_S+ofbHhxEDw@mail.gmail.com>
 <CANNYZj82PHeV-Gp2M4nkD2KniggLr=pSNjS6dMBP_P8PEzEDkw@mail.gmail.com> <CA+cAker9mJbz5seV7OuOqP8AqvzWogrc-oBnvt79XyHDS58nxA@mail.gmail.com>
In-Reply-To: <CA+cAker9mJbz5seV7OuOqP8AqvzWogrc-oBnvt79XyHDS58nxA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 16 Mar 2023 17:09:17 +0100
Message-ID: <CA+cAkepaSYQHCUGikOtjWw9qNn8wzHoX3=ZGTPatd5T3ZiycSA@mail.gmail.com>
Subject: Re: [OE-core] cargo, git dependencies and devtool
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000795bcb05f706afde"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 16:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178708

--000000000000795bcb05f706afde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I managed to get something working with little modification.
I added a new variable in cargo_common.bbclass:

# Contains a list of crate to be found via git protocol
# that are in SRC_URI
# This is useful when devtool'ing the main crate
# and still patch the path of these dependencies
# in cargo config file
CARGO_GIT_DEPENDENCIES ?=3D ""

Inside my recipe, I put my git repos in it and in externalsrc.bbclass
I let those in local_srcuri.

It seems to work for my needs but I still need to test more on poky master.

Do you think such a method would be acceptable for being merged ?

Note that it will not be useful (but harmless) if this patch
<https://patchwork.yoctoproject.org/project/oe-core/patch/20221030173815.10=
212-2-alex.kiernan@gmail.com/>
is
not merged.



On Wed, 15 Mar 2023 at 17:08, Fr=C3=A9d=C3=A9ric Martinsons <
frederic.martinsons@gmail.com> wrote:

> On thanks, will keep you posted if I found a working situation setup for
> this.
>
> Le mer. 15 mars 2023, 16:57, Alexander Kanavin <alex.kanavin@gmail.com> a
> =C3=A9crit :
>
>> devtool simply isn't meant for recipes which pull multiple sources in
>> SRC_URI. Also, we do not have a devtool maintainer :-/
>>
>> You can poke around its code to see if it can be addressed
>> (easily-ish), but I suspect you have to write a different recipe for
>> the 'myrepo' item which can then be 'devtool'-ed, and stage the output
>> into sysroot, e.g. classical oe-core 'build dependecy' flow.
>>
>> Alex
>>
>> On Wed, 15 Mar 2023 at 16:53, Frederic Martinsons
>> <frederic.martinsons@gmail.com> wrote:
>> >
>> > Hello again list,
>> >
>> > I continue my investigation on developing a rust project within
>> > openembedded environment. After discussion with some of you, I have a
>> > project (binary) which will use some custom library crates (and so
>> > these rely on other git repositories).
>> >
>> > In order to simply build the project I need to add this patch
>> >
>> https://patchwork.yoctoproject.org/project/oe-core/patch/20221030173815.=
10212-2-alex.kiernan@gmail.com/
>> > (with little modification to support uri like
>> > "git://git@my_repo:7999/myproject.git")
>> >
>> > After that ports, the project was built successfully. Now I want to
>> > develop in it ;) and so I use devtool (like I do for python or C
>> > project) and I have another set issue.
>> > I get back to having cargo trying to clone these git repos during the
>> > build (which is forbidden since no network access is allowed except
>> > during the fetch).
>> >
>> > I search a little and it seems it is the externalsrc.bbclass which
>> > remove the git url in this line:
>> >
>> https://github.com/openembedded/openembedded-core/blob/master/meta/class=
es/externalsrc.bbclass#L76
>> >
>> > I confirm that by issuing bitbake -e on my recipe and looking for
>> > SRC_URI modifications.
>> >
>> > In my recipe I have something like:
>> >
>> > | SRC_URI +=3D " \
>> > |    crate://crates.io/aho-corasick/0.7.20 \
>> > |    crate://crates.io/async-broadcast/0.5.1 \
>> > |    git://git@myserver
>> :7999/myrepo.git;protocol=3Dssh;nobranch=3D1;name=3Dmy-crate;destsuffix=
=3Dmy-crate
>> > | "
>> > |  SRCREV_FORMAT .=3D "_my-crate"
>> > | SRCREV_my-crate =3D "main"
>> >
>> > And after a "devtool modify" , the git dependency disappears ...
>> > looking at the externalsrc class, it seems pretty straightforward to
>> > know why the url_data.type with "git" doesn't end in local_srcuri.
>> >
>> > I would like to have advice on this if possible, if someone has
>> > already encountered this use case in the past ?
>> >
>> > To my opinion, devtool should treat these SRC_URI alike but how can it
>> > make the difference with the primary git repository (the one which
>> > contains the top project) and the other git repositories ?
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#178582):
>> https://lists.openembedded.org/g/openembedded-core/message/178582
>> > Mute This Topic: https://lists.openembedded.org/mt/97630658/1686489
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
>> alex.kanavin@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>

--000000000000795bcb05f706afde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I managed to get something working with little modificatio=
n.<div>I added a new variable in cargo_common.bbclass:</div><div><br></div>=
<div># Contains a list of crate to be found via git protocol <br># that are=
 in SRC_URI<br># This is useful when devtool&#39;ing the main crate<br># an=
d still patch the path of these dependencies<br># in cargo config file<br>C=
ARGO_GIT_DEPENDENCIES ?=3D &quot;&quot;<br></div><div><br></div><div>Inside=
 my recipe, I put my git repos in it and in externalsrc.bbclass</div><div>I=
 let those in local_srcuri.</div><div><br></div><div>It seems to work for m=
y needs but I still need to test more on poky master.</div><div><br></div><=
div>Do you think such a method would be acceptable for being merged ?</div>=
<div><br></div><div>Note that it will not be useful=C2=A0(but harmless) if=
=C2=A0<a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/2=
0221030173815.10212-2-alex.kiernan@gmail.com/">this patch</a>=C2=A0is not m=
erged.</div><div>=C2=A0</div><div><br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 15 Mar 2023 at 17:08, F=
r=C3=A9d=C3=A9ric Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gmai=
l.com">frederic.martinsons@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">On thanks, will keep =
you posted if I found a working situation setup for this.=C2=A0</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le mer. 15 m=
ars 2023, 16:57, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">devtool simply i=
sn&#39;t meant for recipes which pull multiple sources in<br>
SRC_URI. Also, we do not have a devtool maintainer :-/<br>
<br>
You can poke around its code to see if it can be addressed<br>
(easily-ish), but I suspect you have to write a different recipe for<br>
the &#39;myrepo&#39; item which can then be &#39;devtool&#39;-ed, and stage=
 the output<br>
into sysroot, e.g. classical oe-core &#39;build dependecy&#39; flow.<br>
<br>
Alex<br>
<br>
On Wed, 15 Mar 2023 at 16:53, Frederic Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" rel=3D"noreferrer" tar=
get=3D"_blank">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello again list,<br>
&gt;<br>
&gt; I continue my investigation on developing a rust project within<br>
&gt; openembedded environment. After discussion with some of you, I have a<=
br>
&gt; project (binary) which will use some custom library crates (and so<br>
&gt; these rely on other git repositories).<br>
&gt;<br>
&gt; In order to simply build the project I need to add this patch<br>
&gt; <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/20=
221030173815.10212-2-alex.kiernan@gmail.com/" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://patchwork.yoctoproject.org/project/oe-core/patch=
/20221030173815.10212-2-alex.kiernan@gmail.com/</a><br>
&gt; (with little modification to support uri like<br>
&gt; &quot;git://git@my_repo:7999/myproject.git&quot;)<br>
&gt;<br>
&gt; After that ports, the project was built successfully. Now I want to<br=
>
&gt; develop in it ;) and so I use devtool (like I do for python or C<br>
&gt; project) and I have another set issue.<br>
&gt; I get back to having cargo trying to clone these git repos during the<=
br>
&gt; build (which is forbidden since no network access is allowed except<br=
>
&gt; during the fetch).<br>
&gt;<br>
&gt; I search a little and it seems it is the externalsrc.bbclass which<br>
&gt; remove the git url in this line:<br>
&gt; <a href=3D"https://github.com/openembedded/openembedded-core/blob/mast=
er/meta/classes/externalsrc.bbclass#L76" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://github.com/openembedded/openembedded-core/blob/master=
/meta/classes/externalsrc.bbclass#L76</a><br>
&gt;<br>
&gt; I confirm that by issuing bitbake -e on my recipe and looking for<br>
&gt; SRC_URI modifications.<br>
&gt;<br>
&gt; In my recipe I have something like:<br>
&gt;<br>
&gt; | SRC_URI +=3D &quot; \<br>
&gt; |=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aho-corasick/0.7.20=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/aho-corasick/0.=
7.20</a> \<br>
&gt; |=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-broadcast/0.5=
.1" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/async-broadca=
st/0.5.1</a> \<br>
&gt; |=C2=A0 =C2=A0 git://git@myserver:7999/myrepo.git;protocol=3Dssh;nobra=
nch=3D1;name=3Dmy-crate;destsuffix=3Dmy-crate<br>
&gt; | &quot;<br>
&gt; |=C2=A0 SRCREV_FORMAT .=3D &quot;_my-crate&quot;<br>
&gt; | SRCREV_my-crate =3D &quot;main&quot;<br>
&gt;<br>
&gt; And after a &quot;devtool modify&quot; , the git dependency disappears=
 ...<br>
&gt; looking at the externalsrc class, it seems pretty straightforward to<b=
r>
&gt; know why the url_data.type with &quot;git&quot; doesn&#39;t end in loc=
al_srcuri.<br>
&gt;<br>
&gt; I would like to have advice on this if possible, if someone has<br>
&gt; already encountered this use case in the past ?<br>
&gt;<br>
&gt; To my opinion, devtool should treat these SRC_URI alike but how can it=
<br>
&gt; make the difference with the primary git repository (the one which<br>
&gt; contains the top project) and the other git repositories ?<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#178582): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/178582" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1785=
82</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97630658=
/1686489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/97630658/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanav=
in@gmail.com" rel=3D"noreferrer" target=3D"_blank">alex.kanavin@gmail.com</=
a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>
</blockquote></div>

--000000000000795bcb05f706afde--

