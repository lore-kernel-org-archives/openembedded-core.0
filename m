Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A511BC83F17
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 02:52:54 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.5125.1752202367415053604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 19:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HgHkJF1s;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso1928102a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 19:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752202367; x=1752807167; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fCIBVXlEfE05Ab2rBXi4PyZap6iooiWdKHyMKiIbM9c=;
        b=HgHkJF1sR3i+fc2J0okFTlhjpkuqMgZNBUywqWVYmeqkXiTVr9Jb7ddFNMe6HocwyA
         xWSbAt869q/ZOC1mJeJpwsQQA3A0vaHzrxbUJ0uGksiRFvxm77r8W9R85Ht+LC5O1Wrv
         onLdtxL/6DBw1pA/wiWs4p8ZyyBWBOlqIGc6tWqhz+cvbTCfaFYvN4gzK6tWIeUybDbA
         bY1O8Lm716EDZPaP45CBTupxoh8sijqyh5HO4agZ9ZCO0qzAYREWm+K8jQOFUI3Zn+H6
         xf0/JGb3LXixNg/SgA/h86v0T1jEQGLLz3wic6RpsbAB+aZVTmMIrvFShquMciqPFXvz
         a69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752202367; x=1752807167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCIBVXlEfE05Ab2rBXi4PyZap6iooiWdKHyMKiIbM9c=;
        b=DdzeYMphlZUbRy9ks2u4Qj3vi9RvdhlPrq60E26ErIpKEz6MPkIhN2yw+eHDpWVU3X
         /NTwchoPaZoE0nFEhr3rMsbDXZYMiseuHb1kXlOE6yUQMEIA9+23hcVR3dZ4EyKrU8t1
         wOyPS8Ds4ikkSxuED/N3ZaUnrtYwxRpW0lFRdvAfUjuUcQQ3taiGKy4rzscDcp0SMOU5
         UgvXakdFxERtnMrHrhBtLPaNVaA6ljyPGQcHFSfsdgwrcOOvhViJIJDFwHF8CVtLBcMz
         4MVAJO9yGVITodMK5WNHPfK3jpvv6sf5cZszt5BRXcgKv7Y7rY2fd8gdKzU99qqmqWA4
         aZ7w==
X-Forwarded-Encrypted: i=1; AJvYcCU0vmz20qCWefrpvbMQRUxFCkBWKaDIipbRLoaa2alv9Kk64Zpb0FgpB3SEhP2JaivlSKE5+kzD0AfxA5ZyuoblSA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxcD3s2nYse2hJ5bSyvS6hEWmI3KhPeudll0E0yO8juDwTTqABg
	WQy0ZycK3EbtkjDE0zr6TVZVzAiKE7D6DNBzflASFVC28o31tuy7MeGhr8Sbos4Ja9ooVOlp/t8
	gs4v9GQHHaO2da4opINfwJEQYP82wnH0=
X-Gm-Gg: ASbGnct2a4RnrmFgVdKJtKWjmUq9Rm4tZoqGdRpT6oxTEQJa3TEKuRu7uVLbJqrft1q
	CQU89EknVrIMSg2p6aR1h8prF4KiBzxoAaLIho+BMxO+oTAcnEhCMHOvnRNEUnLzAbJ+z1gSiEw
	E5vmkyqcjl9+OUPjtCbdgEwhVK0kQTx+URfwcacafOtNXXiJclkrJVeSG3ODPKax1zYBahyeUJR
	FwFkNp+
X-Google-Smtp-Source: AGHT+IE3PYlAzPhqHNY6OvKCIRHkgoU+z31ou7gqSjwRlc0eyRQFF/3DQHk1BlTSQCwrvW3tdg7y/F26ebHfosmSjS8=
X-Received: by 2002:a17:90b:558f:b0:312:639:a064 with SMTP id
 98e67ed59e1d1-31c4f5af641mr1333499a91.28.1752202366688; Thu, 10 Jul 2025
 19:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250710153542.1196388-1-bruce.ashfield@gmail.com> <CAMKF1sq4XaRE35UKcpNzR-xwNU7avT9scPru6Lnw6Vs7Q2vqFg@mail.gmail.com>
In-Reply-To: <CAMKF1sq4XaRE35UKcpNzR-xwNU7avT9scPru6Lnw6Vs7Q2vqFg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 Jul 2025 22:52:34 -0400
X-Gm-Features: Ac12FXzSrNZ_i8tL5h4ceunLn_Bhl1aDXqSuSX_Hwd4iPMT9kY1DTsmnPiGfzg4
Message-ID: <CADkTA4PGQbhhTjqP9eSTW17q+u3Kdr0ftv0-qicm_ss_w25xXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libc-headers: update to v6.15
To: Khem Raj <raj.khem@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a421ac06399e67c8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 02:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220134

--000000000000a421ac06399e67c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 6:24=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

>
>
> On Thu, Jul 10, 2025 at 8:35=E2=80=AFAM Bruce Ashfield via lists.openembe=
dded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>> kernel 6.15+ will be our next reference point, so we bump the libc
>> headers to match.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> ---
>>
>> Richard,
>>
>> I'll be following this with our new reference kernel in the next
>> few days. But I was able to build all arches with glibc and muslc
>> with this bump.
>>
>> I didn't see any fallout from packages that normally have to be
>> tweaked when I bump tht headers.
>>
>> If we are lucky, this is a seamless update (one of the few), but
>> either way, it needs some wider AB testing.
>>
>> If I go to 6.16 for the release / reference kernel, I'll bump once
>> more, but again, either way it is good to have some valid points
>> along the way to our final libc-headers version.
>>
>
> Ideally this should go with or after the kernel switch
>

Ideally, maybe, but there's no reason to hold to that, there are some
really rare
issues this could cause, but none that we've ever seen in practice. As we
all know, we have many instances of our headers being newer than kernels
in our releases.

We've done this several times in the past decade, and it makes less of a
"big
bang" of both userspace and kernel debugging at once. We won't ship like
this, since the next reference will likely be 6.16

Either way, I'll leave it up to Richard.

Bruce



>
>
>> Bruce
>>
>>  .../{linux-libc-headers_6.12.bb =3D> linux-libc-headers_6.15.bb}  | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-kernel/linux-libc-headers/{
>> linux-libc-headers_6.12.bb =3D> linux-libc-headers_6.15.bb} (80%)
>>
>> diff --git a/meta/recipes-kernel/linux-libc-headers/
>> linux-libc-headers_6.12.bb b/meta/recipes-kernel/linux-libc-headers/
>> linux-libc-headers_6.15.bb
>> similarity index 80%
>> rename from meta/recipes-kernel/linux-libc-headers/
>> linux-libc-headers_6.12.bb
>> rename to meta/recipes-kernel/linux-libc-headers/
>> linux-libc-headers_6.15.bb
>> index dd6add38de..70d2fd80ee 100644
>> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb
>> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb
>> @@ -8,5 +8,5 @@ SRC_URI:append:libc-musl =3D "\
>>
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd=
7e46"
>>
>> -SRC_URI[sha256sum] =3D
>> "b1a2562be56e42afb3f8489d4c2a7ac472ac23098f1ef1c1e40da601f54625eb"
>> +SRC_URI[sha256sum] =3D
>> "7586962547803be7ecc4056efc927fb25214548722bd28171172f3599abb9764"
>>
>> --
>> 2.39.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#220125):
>> https://lists.openembedded.org/g/openembedded-core/message/220125
>> Mute This Topic: https://lists.openembedded.org/mt/114084659/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a421ac06399e67c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 10, 2025 at 6:24=
=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, Jul 10, 2025 at 8:35=E2=80=AFAM Bruce Ashfield =
via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.opene=
mbedded.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bruce=
 Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank"=
>bruce.ashfield@gmail.com</a>&gt;<br>
<br>
kernel 6.15+ will be our next reference point, so we bump the libc<br>
headers to match.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
<br>
Richard,<br>
<br>
I&#39;ll be following this with our new reference kernel in the next<br>
few days. But I was able to build all arches with glibc and muslc<br>
with this bump.<br>
<br>
I didn&#39;t see any fallout from packages that normally have to be<br>
tweaked when I bump tht headers.<br>
<br>
If we are lucky, this is a seamless update (one of the few), but<br>
either way, it needs some wider AB testing.<br>
<br>
If I go to 6.16 for the release / reference kernel, I&#39;ll bump once<br>
more, but again, either way it is good to have some valid points<br>
along the way to our final libc-headers version.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ideally this sho=
uld go with or after the kernel switch</div></div></div></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Ideall=
y, maybe, but there&#39;s no reason to hold to that, there are some really =
rare</div><div class=3D"gmail_default" style=3D"font-size:small">issues thi=
s could cause, but none that we&#39;ve ever seen in practice. As we</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">all know, we have many=
 instances of our headers being newer than kernels</div><div class=3D"gmail=
_default" style=3D"font-size:small">in our releases.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">We&#39;ve done this several times in the past d=
ecade, and it makes less of a &quot;big</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">bang&quot; of both userspace=C2=A0and kernel debug=
ging at once. We won&#39;t ship like</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">this, since the next reference will likely be 6.16</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Either way, I&#39;ll leave =
it up to Richard.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</=
div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div><div class=3D"gmail_quote"><div dir=3D"auto"><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>
Bruce<br>
<br>
=C2=A0.../{<a href=3D"http://linux-libc-headers_6.12.bb" rel=3D"noreferrer"=
 target=3D"_blank">linux-libc-headers_6.12.bb</a> =3D&gt; <a href=3D"http:/=
/linux-libc-headers_6.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-lib=
c-headers_6.15.bb</a>}=C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-kernel/linux-libc-headers/{<a href=3D"http://linu=
x-libc-headers_6.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-hea=
ders_6.12.bb</a> =3D&gt; <a href=3D"http://linux-libc-headers_6.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-libc-headers_6.15.bb</a>} (80%)<br>
<br>
diff --git a/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux=
-libc-headers_6.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-head=
ers_6.12.bb</a> b/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://=
linux-libc-headers_6.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc=
-headers_6.15.bb</a><br>
similarity index 80%<br>
rename from meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux-=
libc-headers_6.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-heade=
rs_6.12.bb</a><br>
rename to meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux-li=
bc-headers_6.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers=
_6.15.bb</a><br>
index dd6add38de..70d2fd80ee 100644<br>
--- a/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux-libc-h=
eaders_6.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers_6.1=
2.bb</a><br>
+++ b/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux-libc-h=
eaders_6.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers_6.1=
5.bb</a><br>
@@ -8,5 +8,5 @@ SRC_URI:append:libc-musl =3D &quot;\<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;b1a2562be56e42afb3f8489d4c2a7ac472ac23098f1ef=
1c1e40da601f54625eb&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7586962547803be7ecc4056efc927fb25214548722bd2=
8171172f3599abb9764&quot;<br>
<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#220125): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/220125" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/220125</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114084659/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114084659/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000a421ac06399e67c8--

