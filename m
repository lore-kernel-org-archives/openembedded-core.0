Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2FEC001DE
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 09:58:19 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.70871.1690711090763450477
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 02:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=StQ7HiMV;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4fe04882c66so5733519e87.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690711089; x=1691315889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dWepdJZQfmjCVrcxLxS3MaWL4KxLvaTfLy1XqF6NzTg=;
        b=StQ7HiMVCXFK+ShkoccNa42H2t+4Mb96bqOQ06+DH5MHpvnUWQRJzN30UmmV+v2eSD
         /jYeVZqbzs7Z/fzuj4gEtWkShIaDMpV8sJdqnE3aBnkY0ng0dWF9Wcz7IDD6eUKaxN3z
         WPGi5/wt3MaB+x9kDSRpBPWUALtlaheq3kvPPV7rm7CGjOM8c714LhzZCmgG2j7B7yKy
         oGk9BqDTmG6A0nfprXa9XWQUq7xbqA2mDcchs13f0ArVVazBHMpdhDgop9DJNArYZUAT
         GG3MzJTU+73sTglYVSFnbTFNqcfucbEfE5MBJ7PpnZUuMAAM/fmkKSd/sO87sJUa3WdQ
         mwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690711089; x=1691315889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWepdJZQfmjCVrcxLxS3MaWL4KxLvaTfLy1XqF6NzTg=;
        b=Np7NESwXhldkJM2qsmhTgrn+hplLfISgTYCx3AHbtC18WTMs0JiH5w5rZc08izdaRm
         kc+Tpe44PyMDIx0X8j2Fdu6VPN7FMKLBxK3uFhKpugl3OwND/GO/xXQrk/qmSx7ETCUM
         3nxqDzKZdZFQP20OUIzLf3SbGOpSiGBlrWREM9HRaMKJfDZyAOhffWLQBzqt62uvB7TM
         4zr/czJYUhOkQW1EPB5K392EsYFpoR8KlvsDZNFrnbZTh9mVSbzTaJoZUUak8VFKtppg
         2A499TZsaFEKsAsa5fGKARr2zD3KFz4gaj+qJdE/EY8qAUmo7LhgzfRld6uI6+OCrHyO
         LWUA==
X-Gm-Message-State: ABy/qLahk5c6AYwe3cbbkQQRLyGkWwwc3ENqyNcTnQziwpmHIKK7QlpP
	WSKdTdqSbncEMNynGduiUpMNhHKIXIPm+BrbDhc=
X-Google-Smtp-Source: APBJJlHPyuU4qXQ2BkPWbfuEmpNth/KOJb3WvaICKc8UiaKn7hrKAsF1Qt9e0j16VukMhZjqo1JsVAhRARpCjzouirE=
X-Received: by 2002:a19:504a:0:b0:4f4:b783:8556 with SMTP id
 z10-20020a19504a000000b004f4b7838556mr3568422lfj.66.1690711088291; Sun, 30
 Jul 2023 02:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <177391A172EF42E0.8989@lists.openembedded.org> <CA+cAkeqxqth7a1oAujjhkdid35rH3gMVx9XByEZcKySt_eMsxw@mail.gmail.com>
In-Reply-To: <CA+cAkeqxqth7a1oAujjhkdid35rH3gMVx9XByEZcKySt_eMsxw@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sun, 30 Jul 2023 11:57:56 +0200
Message-ID: <CA+cAkeoqNJ4KFh2sWJhH2t7fVN_ErC7K4wcQ2PdnCwHVer9zOg@mail.gmail.com>
Subject: Re: [OE-core] About requirements on cross compiling rust package
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000d5e3240601b159c3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 09:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185063

--000000000000d5e3240601b159c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Since I had no answers to this, I'll send a patch series soon (tomorrow?)
targeting what I have in mind, for rust-hello-world, I think I'll send a
specific patch to disable frozen flag for this recipe (until its fate is
known).

Maybe sending code will help to know what it is about and, I hope, make
people interested in rust dev inside yocto give some feedbacks

Le lun. 24 juil. 2023, 11:27, Fr=C3=A9d=C3=A9ric Martinsons <
frederic.martinsons@gmail.com> a =C3=A9crit :

> Hello I make some advance on this and there is a drawback that I didn't
> foreseen, in case of patched
> git url (those set up by cargo_common_do_patch_path), the Cargo.lock file
> must be modified
> to remove source entry , hence not compatible with --frozen.
>
> I put more info in comment YOCTO #15104
> <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15104> for those
> interested but for the moment, I cleaned
> the Cargo.lock by myself before freezing it for the next build steps.
>
> There is still the question about the fate of "rust-hello-world" recipe
> too (which cannot
> be built with --frozen flag without having a Cargo.lock file), I don't
> know if I can suppress it
> or if I need to create a Cargo.lock for it.
>
> On Thu, 20 Jul 2023 at 14:00, Frederic Martinsons via
> lists.openembedded.org <frederic.martinsons=3D
> gmail.com@lists.openembedded.org> wrote:
>
>> Hello list,
>>
>> In the course of YOCTO #15104
>> <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15104>  , I finally
>> found the issue was due to a missing Cargo.lock file at the root of the
>> project (which is pretty usual for a Rust project from git since Cargo.l=
ock
>> is only required when publishing on the crates registry).
>>
>> With a Cargo.lock correctly placed, the patch process made by
>> cargo_common.bbclass works perfectly fine even with a virtual manifest.
>>
>> I often encountered issues that were in the end due to a missing
>> Cargo.lock and I think we all agree on this list (I didn't crawl the mai=
l
>> archives, I talked from my memory) that this file is absolutely required
>> when building a rust project under yocto.
>> (especially for reproducible build)
>>
>> I'm currently testing a patch which will replace --offline cargo build
>> flags with --frozen (which supersedes --offline mode since it prevents
>> network access but also Cargo.lock to be present and up to date).
>>
>> I have two questions though:
>>   1) rust-hello-world doesn't embed a Cargo.lock (and doesn't need to
>> since it had zero dependencies) , considering that we now have a more
>> "real" recipe (zvariant) that is used within selftest, would it be
>> acceptable to suppress rust-hello-world ?
>>   2) below is kind of message we will have when using --frozen with an
>> absent Cargo.lock:
>>
>> | error: failed to get `glib` as a dependency of package `zvariant
>> v3.12.0
>> (/home/fmartinsons/TAPOS_build/build-tapos/tmp/work/corei7-64-tapos-linu=
x/zbus/3.11.0-r0/git/zvariant)`
>> |
>> | Caused by:
>> |   failed to load source for dependency `glib`
>> |
>> | Caused by:
>> |   Unable to update https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0
>> |
>> | Caused by:
>> |   failed to fetch into:
>> /home/fmartinsons/TAPOS_build/build-tapos/tmp/work/corei7-64-tapos-linux=
/zbus/3.11.0-r0/cargo_home/git/db/glib-928cf7b282977403
>> |
>> | Caused by:
>> |   attempting to update a git repository, but --frozen was specified
>>
>> I think it is not very clear that the root cause is a missing Cargo.lock
>> , so I'm wondering if a specific bitbake ops (do_compile_prepend) would =
not
>> be  better to check for Cargo.lock and output an explicit message (it
>> doesn't prevent to keep --frozen anyway). What do you think ?
>>
>> PS: I copied Randy as the maintainer of rust-hello-world but also  the
>> ticket assignee.
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184635):
>> https://lists.openembedded.org/g/openembedded-core/message/184635
>> Mute This Topic: https://lists.openembedded.org/mt/100254129/6213388
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> frederic.martinsons@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000d5e3240601b159c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Since I had no answers to this, I&#39;ll send a patch ser=
ies soon (tomorrow?) targeting what I have in mind, for rust-hello-world, I=
 think I&#39;ll send a specific patch to disable frozen flag for this recip=
e (until its fate is known).<div dir=3D"auto"><br></div><div dir=3D"auto">M=
aybe sending code will help to know what it is about and, I hope, make peop=
le interested in rust dev inside yocto give some feedbacks=C2=A0</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le lu=
n. 24 juil. 2023, 11:27, Fr=C3=A9d=C3=A9ric Martinsons &lt;<a href=3D"mailt=
o:frederic.martinsons@gmail.com">frederic.martinsons@gmail.com</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
Hello I make some advance on this and there is a drawback that I didn&#39;t=
 foreseen, in case of patched<div>git url (those set up by cargo_common_do_=
patch_path), the Cargo.lock file must be modified</div><div>to remove sourc=
e entry , hence not compatible=C2=A0with --frozen.</div><div><br></div><div=
>I put more info in comment=C2=A0<a href=3D"https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D15104" target=3D"_blank" rel=3D"noreferrer">YOCTO #151=
04</a>=C2=A0for those interested=C2=A0but for the moment, I cleaned</div><d=
iv>the Cargo.lock by myself before freezing it for the next build steps.</d=
iv><div><br></div><div>There is still the question about the fate of &quot;=
rust-hello-world&quot; recipe too (which cannot=C2=A0</div><div>be built wi=
th --frozen flag without having a Cargo.lock file), I don&#39;t know if I c=
an suppress it</div><div>or if I need to create a Cargo.lock for it.</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Thu, 20 Jul 2023 at 14:00, Frederic Martinsons via <a href=3D"http://list=
s.openembedded.org" target=3D"_blank" rel=3D"noreferrer">lists.openembedded=
.org</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr">Hello list,<div><br></div><div>In the course=C2=A0of=
=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15104"=
 target=3D"_blank" rel=3D"noreferrer">YOCTO #15104</a>=C2=A0 , I finally fo=
und the issue was due to a missing Cargo.lock file at the root of the proje=
ct (which is pretty usual for a Rust project from git since Cargo.lock is o=
nly required when publishing on the crates registry).=C2=A0</div><div><br><=
/div><div>With a Cargo.lock correctly placed, the patch process made by car=
go_common.bbclass works perfectly fine even with a virtual manifest.</div><=
div><br></div><div>I often encountered issues that were in the end due to a=
 missing Cargo.lock and I think we all agree on this list (I didn&#39;t cra=
wl the mail archives, I talked from my memory) that this file is absolutely=
 required when building a rust project under yocto.</div><div>(especially f=
or reproducible build)</div><div><br></div><div>I&#39;m currently testing a=
 patch which will replace --offline cargo build flags with --frozen (which =
supersedes=C2=A0--offline mode since it prevents network access but also Ca=
rgo.lock to be present and up to date).</div><div><br></div><div>I have two=
 questions though:</div><div>=C2=A0 1) rust-hello-world doesn&#39;t embed a=
 Cargo.lock (and doesn&#39;t need to since it had zero dependencies) , cons=
idering that we now have a more &quot;real&quot; recipe (zvariant) that is =
used within selftest, would it be acceptable to suppress rust-hello-world ?=
</div><div>=C2=A0 2) below is kind of message we will have when using --fro=
zen with an absent Cargo.lock:</div><div><br></div><div>| error: failed to =
get `glib` as a dependency of package `zvariant v3.12.0 (/home/fmartinsons/=
TAPOS_build/build-tapos/tmp/work/corei7-64-tapos-linux/zbus/3.11.0-r0/git/z=
variant)`<br>| <br>| Caused by:<br>| =C2=A0 failed to load source for depen=
dency `glib`<br>| <br>| Caused by:<br>| =C2=A0 Unable to update <a href=3D"=
https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0" target=3D"_blank" rel=3D"=
noreferrer">https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0</a><br>| <br>|=
 Caused by:<br>| =C2=A0 failed to fetch into: /home/fmartinsons/TAPOS_build=
/build-tapos/tmp/work/corei7-64-tapos-linux/zbus/3.11.0-r0/cargo_home/git/d=
b/glib-928cf7b282977403<br>| <br>| Caused by:<br>| =C2=A0 attempting to upd=
ate a git repository, but --frozen was specified<br></div><div><br></div><d=
iv>I think it is not very clear that the root cause is a missing Cargo.lock=
 , so I&#39;m wondering if a specific bitbake ops (do_compile_prepend) woul=
d not be=C2=A0 better to check for Cargo.lock and output an explicit messag=
e (it doesn&#39;t prevent to keep --frozen anyway). What do you think ?</di=
v><div><br></div><div>PS: I copied Randy as the maintainer of rust-hello-wo=
rld but also=C2=A0 the ticket assignee.</div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184635): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184635" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/184635</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100254129/621=
3388" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/100254129/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martin=
sons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gm=
ail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000d5e3240601b159c3--

