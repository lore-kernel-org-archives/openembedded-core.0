Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407D4CD5BBF
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 01:32:41 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1064.1779499960189711739
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 18:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kUwiI1n5;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7bdc947aa88so64972697b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 18:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779499959; cv=none;
        d=google.com; s=arc-20240605;
        b=lLdf7G99UsiYBbUV3dqmkVEhnwfq2kfqNWVWt7DDeEp1POhiGRHLf3E1bC+TnaDUAi
         /FY8OdLD/GeZLeJ0RKHzf/zN5EUTd2oGls8E1W512WGK5EBGbrPfeMyy1AAlx78ZhciM
         cIma+UNG802sV7QRDLmpZSQcylxcrv4jpCdo+0ulZeLFcRwPlBfSHsJtHGTt8j7/LzxK
         w8rLDrsSwZbTOGVujIzPtT2K9n7NFdXxv7Ckkx2l14qjDIWfSg6XW3Z6nvTLud5f6DnC
         W67OrqAEFWIXBQ4sh5toKyk6foBlGLnVV6Kn76IT8Tki+AHmA/V7ghVXKkO1oMM6u3eu
         f6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UEn8VdSLRwX/MZtepfNm84g/R+Wh3vsZWU4pKGdLYp0=;
        fh=lokdjCdjsyY6KjBfIJktI8BQ5vhRQ0H3tAEZGfjN5Hs=;
        b=Hvs692eLXOJPXyY9Et2F1QBxHmcrLKN/Hp88Qem+j4Mavt5hs3mICy0ItDVSpahKNs
         0Ol0Tl5MSvXKtwyUzR3Zi1HK3UZi6gquIc/vT/IB8Wk1zc+xyp2TFb/CHXL18XzTnzXA
         yhLoxJ3x9Mlo4DUGGCk9uzpGAd3wtubSlYK3EJXk7WGO+yyfzzkwbiYWIUS7oIlYG+M2
         +F2B6ImTgBRN9gwrZCVp1ApACJQlOgUxh52MUh5WLvb5CxDkNzD2vYaXcCwzJ/c1+04T
         ct5S9pA+ISCKgKcra/O4juFmT15sBVdZV5sxp1DxoyxzZKqNjQSkXkHoHYhS4azrpy8n
         92FQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779499959; x=1780104759; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UEn8VdSLRwX/MZtepfNm84g/R+Wh3vsZWU4pKGdLYp0=;
        b=kUwiI1n5dvCbOiFuUb7wwo/4lNfnRcK39ThZn2TDJdH6HAdylwFD/z9gOr1gLgZUDs
         6nQ1bW2Avr9IB36+O2qYvLVffO/ON6/p2QkUR0lmDPVlCCi4Aeru6G18aT6SuHoYpsnI
         b5q8MvDwEzRgSgXMUSmg52p4DwWPmQN5UCuV4HsNDQ+OJ/nFrwrsi0FlLq5ox7qrKO5Y
         LWahB329l/a8V+fTeBT42xG+4WvYjLAjuWqMhx4oNXc/MSgIfh7xJRGNEbV1cI5Ch6vr
         bFB1NPZy2Zuz7nAJV2rtaV9/rbU6qL4BOQjQOtGZRE5fvtidPLwLZJA2HcFBBrFiY7s1
         JLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779499959; x=1780104759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEn8VdSLRwX/MZtepfNm84g/R+Wh3vsZWU4pKGdLYp0=;
        b=h5K/q10MI4sAm/zZLE+iXOoiTN/sUFh5K1zCkGb41/Muuj/nHK2z/KB6w53DxhF0II
         ndfwrBpuTDa02D578fTBztxaJ4S08eEAM9yydJz4dohj+9R/+dBRDvjiQqsEr89IqUYI
         blkU8l9aZcRTtMHNQMziQHBA6V3wcSq41C6cqbW9UF+PBcU8Fuuq+2cAe0AaV2Xh0HFA
         Xl6Z4jcVGgWBkKbMMrFhiqVqlrCqf5fnu3udvQQwDrhM3JIOdmqbSfKh1F0Odn9XTw3P
         g1zDwvXi6A6atq0tUbpDgqA632ZIjRAoD1/UT35l2JZ87DRtMUA4c+4AkkdgDPeFVsx2
         YgmA==
X-Gm-Message-State: AOJu0Yw1awLklH40LJMRvwbd+DC1wBDQUVREsuFj0Kf9wKxEKmCEDPFY
	gc9v5oZuHCnQA0oWLyzo7iTEz+HbD2b3BbNROW8yvrv/EpRTIEYpy0/g0HBiUHSaMi/zOAd4SGL
	+x2PynGVjc5IgzV0Q/b5B4uRQIZZz4WqncA==
X-Gm-Gg: Acq92OGLD6tuXIkjFyKrItslaxqNybUY3Ts6zYO1bV99S7kEYd04lqY5fGSDajXf/vR
	4jAtqBXuHGA8uyu1WP2vIF2ODSz69Sc+UXUfhXv2CdBk47WS1R3CAxAFe3IxU98EJbNBh5n0p6I
	LXak/58K8BX3AL82osszjb+CUOEIJ6o5afHyJA+moMoE9zkM93JO48Q9lk/uAuiaR1ccpG+fFqO
	9Xe91MTGJxzmUZtyUXa8NADTeABRDpxpgCxUG8STm6AQn7F8C6YwK0MXzcdkS7eLS4D9ip6x/ap
	vhpwF1WNrA45smrk3b/azilCKfAly5yuxr7QGjRlJ8I/yaiayGWST0xK7hopSn89wags9GQbzSR
	Z94U35mPzvXNpKPgIfQxyVF0xuW5qnOQ7KPpDTg9HNhQUFKwnBsrCwiCwAVD0XhupllsQnunsbj
	zKDTyO
X-Received: by 2002:a05:690c:48c7:b0:7d0:1583:4cd2 with SMTP id
 00721157ae682-7d3339e48acmr63640117b3.9.1779499959166; Fri, 22 May 2026
 18:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com> <20260519072534.24588-4-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260519072534.24588-4-Hemanth.KumarMD@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 May 2026 18:32:13 -0700
X-Gm-Features: AVHnY4JR9WgnYukuYvcLJ8YaiyTqSmYuAkGIf9Pw4mMEdzjWrSmUwigCkZGygMU
Message-ID: <CAMKF1srHDEKUZ40644GCYRyfCQAVocziGrBRk1TPtAvVnqnh7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 03/12] glibc: disable automatic libatomic linking
To: Hemanth.KumarMD@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com, 
	Randy.MacLeod@windriver.com
Content-Type: multipart/alternative; boundary="000000000000f1ad6a0652721ef7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 May 2026 01:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237558

--000000000000f1ad6a0652721ef7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 12:25=E2=80=AFAM Hemanth Kumar M D via
lists.openembedded.org <Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.=
org>
wrote:

> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> GCC 16 introduced -flink-libatomic which automatically injects
> -latomic_asneeded into link commands via LINK_LIBATOMIC_SPEC.
> When glibc is built with a GCC 16 cross-compiler, the compiler
> would attempt to link against libatomic which does not exist yet
> at this stage.(libatomic is built later as part of gcc-runtime)
>
> Link:
> https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40fa=
ca10ea2e
>
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/glibc/glibc.inc
> b/meta/recipes-core/glibc/glibc.inc
> index dae087d53f..751cc0c572 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -46,6 +46,9 @@ EXTRA_OEMAKE +=3D "SHELL=3D/bin/bash"
>  # bash but it can be configured by setting KSHELL Makefile variable
>  EXTRA_OEMAKE +=3D "KSHELL=3D/bin/sh"
>
> +TARGET_CC_ARCH +=3D "-fno-link-libatomic"
> +SDK_CC_ARCH +=3D "-fno-link-libatomic"
>

This might be better controlled with toolchain-gcc override.


> +
>  do_configure:prepend() {
>         sed -e "s#/bin/bash#/bin/sh#" -i ${S}/elf/ldd.bash.in
>  }
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237276):
> https://lists.openembedded.org/g/openembedded-core/message/237276
> Mute This Topic: https://lists.openembedded.org/mt/119387074/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f1ad6a0652721ef7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 19,=
 2026 at 12:25=E2=80=AFAM Hemanth Kumar M D via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;Hemanth.KumarMD=3D<a href=3D"=
mailto:windriver.com@lists.openembedded.org">windriver.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.KumarMD@windriv=
er.com" target=3D"_blank">Hemanth.KumarMD@windriver.com</a>&gt;<br>
<br>
GCC 16 introduced -flink-libatomic which automatically injects<br>
-latomic_asneeded into link commands via LINK_LIBATOMIC_SPEC.<br>
When glibc is built with a GCC 16 cross-compiler, the compiler<br>
would attempt to link against libatomic which does not exist yet<br>
at this stage.(libatomic is built later as part of gcc-runtime)<br>
<br>
Link: <a href=3D"https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7d=
de1bf499d3d40faca10ea2e" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e</a><br=
>
<br>
Signed-off-by: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.KumarMD@wind=
river.com" target=3D"_blank">Hemanth.KumarMD@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc.inc | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/gl=
ibc.inc<br>
index dae087d53f..751cc0c572 100644<br>
--- a/meta/recipes-core/glibc/glibc.inc<br>
+++ b/meta/recipes-core/glibc/glibc.inc<br>
@@ -46,6 +46,9 @@ EXTRA_OEMAKE +=3D &quot;SHELL=3D/bin/bash&quot;<br>
=C2=A0# bash but it can be configured by setting KSHELL Makefile variable<b=
r>
=C2=A0EXTRA_OEMAKE +=3D &quot;KSHELL=3D/bin/sh&quot;<br>
<br>
+TARGET_CC_ARCH +=3D &quot;-fno-link-libatomic&quot;<br>
+SDK_CC_ARCH +=3D &quot;-fno-link-libatomic&quot;<br></blockquote><div><br>=
</div><div>This might be better controlled with toolchain-gcc override.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &quot;s#/bin/bash#/bin/sh#&quot; -i ${S}=
/elf/<a href=3D"http://ldd.bash.in" rel=3D"noreferrer" target=3D"_blank">ld=
d.bash.in</a><br>
=C2=A0}<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#237276): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/237276" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/237276</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119387074/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119387074/1997914</a><br>
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

--000000000000f1ad6a0652721ef7--

