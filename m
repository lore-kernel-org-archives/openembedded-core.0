Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB7DCD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 21:17:36 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18142.1779994739712980975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 11:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Zhg/vECQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: adityags2004@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso7940531e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 11:58:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779994738; cv=none;
        d=google.com; s=arc-20240605;
        b=aLov81JoofNPKn4Dk6VA9v7RjsItRcmLnRH/RTeBSFzMPCo/SjbcqDQ/gsa+swrDYV
         IY2zzrDWtGhM0AMcp/F4P4tNwxGVP/Y/cjVoBkFz25ipbwQulCQ9C6sWfQfquMdt9Y7t
         lZAnru6RPpEcOY1xcViaoYqX565WvYqim7Ynbwlp/G2sAkShJNYVWvdrfA+j2vwCiT4I
         qh8dMORwG6h7nv3aqHlDpC5882IzHYJPubyxQRWqHeptdHhHcabrqboOWbwC5nae5+HA
         pDeRDu5j8f6kBch0wkSUEBLBXk436qvrkNJGcCWG+07jGhe5Qfl2eIpxx4UabWulRwAz
         aCew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i58DFc+muH2a+82zuJLrFQQq5O/ra4YQMcl6GXP5CNY=;
        fh=Ug+utZakG8cDypuyc3isAGmUAtkXdDk5XYoisK59YNI=;
        b=d1e2KARUh/JKyWfF1shJByx/zgzQOtIYYVdFpEiAv13I1DV1ti+Ozj/zBngQ0LLlwt
         y3n92TXiqpkAGuh2RyOFGCCj3CNHY+cxctb2kV0RoCYvvC4myf7Z37Gb1gJ8DeqQkce0
         SxO53TPJfTBmrhjCbT2LTlC6a8DtTKs8t22enHQQooGQv16ijHE2fNxCbaroPq53vC0z
         vV6q30HWjXqZhXgH0pwTtHfJy+nkDgAnLkOwKeVI7RWnl9Z03FkVtPbsdmDfN7VytP3i
         i5AEdEktPlTVx/Kj7gExt1LPbkM3O2zC3jVzM2smHntCnqKsV54B1ZR+0vhQJAVnfuzE
         Z8yA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779994738; x=1780599538; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i58DFc+muH2a+82zuJLrFQQq5O/ra4YQMcl6GXP5CNY=;
        b=Zhg/vECQ5i7P+mhZCNfKIyy4Is5Ky7Rsb1NBGGM1d4kP1e/tki+KY4X89y0H/55RTB
         30XY5l2iJVIOePDErdHSI5bXbi9S9p1eks6jFQBK0ZsJalvEFyTKA4CBGjF02lp98Rmr
         a9scEBsr3ARlSfCCZMJ5Ll+k3hkwIl5YJzMU3SsXBXNVYYMFhT5Fh1E2ey/FaGsO6Eaa
         MVEBz6KtJNlmoS9g41FWZfJcp1ks7zdjqBD8TGxazxaYGInz71RfhUsdgsshGNj9tr8H
         lzRqj8N4M8raLQKi4hWfJE1ARhn70g1N58HWHtRqsGyyQPTpqN4FR1Pp70WYh8lzqSUC
         xkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994738; x=1780599538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i58DFc+muH2a+82zuJLrFQQq5O/ra4YQMcl6GXP5CNY=;
        b=QP97sdDp3TOs4iwfZWZ64AXYxdSGH/IjfN+WXRvkJwpuQKV2qckIqtpu8wnfsQlBPQ
         ++8OElYja8dfyIJZClvh5X6TVEAq4076PZnYbfkdc1HmSVCpEm/YY1lrIQlzSs5KxtqN
         7rdoxnXAqsgbcaY7pI+q65oLEy+ux3/Sju+lWBN1EaEDA/++/B5wKOz+EfL3lRwbcCZ5
         ExIOdDSNpGTz9SEEShpmBMpDNgO4nb4WxSAeLkz0TK2bGD2lZXkOcfT3Nuya7rO45qYl
         GZ2vRZ0pFWPLtX/L8aR9iQirhZZ8FChNSGrInspdgN6/5xEW0OrMZ47QhENMoLlH/A0U
         7/xg==
X-Gm-Message-State: AOJu0YzTUbdMLVDEzJxhf+yXshnSKAQpKV+2yRErkROoOaZbQd3nBVgq
	t7jE5wVKPAPhhm8yikh7IbZDo/vHN3u+agMn2nDsB8YAMgwIVMyBO2hQODNT/aH4ndSipA+jVAN
	g8WAlii+fuMWDCZe3WEBptevk1jFUaCs=
X-Gm-Gg: Acq92OEucteTmpXeX0nue+7xdMvCypXczjLZ0DH9d5W2FlGakDZfVVssLsP4WSF4xjq
	160h1HnAYayMQdHJvBMXowPQv8Ta62d08Ek8Jzj2y7hbIx0FAIHnrZB9c/559EH36o4ZBuE/ER4
	w3XUnE2Sxf9ynv6OjOgg1Po9dZbyUD0QlJEsuCIUqWFatwLDSBmypTplmhZyFI7e9C5Kbqi3DKP
	ncIjk7i3vRem+QMf3rIDim24VtML8lImjIY/LBJKIKbSPefUBQ73fv2mbE6/xtkSAo+tBCnkqwR
	abRpqXLeawCOs9gg6B8xDrJJ5mq/rXQ=
X-Received: by 2002:a05:6512:800c:10b0:5aa:5230:d534 with SMTP id
 2adb3069b0e04-5aa57e47848mr84785e87.40.1779994737592; Thu, 28 May 2026
 11:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260528184427.517-1-adityags2004@gmail.com> <CANNYZj_6N=Dmzq5nb_BFYRwzserLQJSSge_n2m8DJiO-YOchiQ@mail.gmail.com>
In-Reply-To: <CANNYZj_6N=Dmzq5nb_BFYRwzserLQJSSge_n2m8DJiO-YOchiQ@mail.gmail.com>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Fri, 29 May 2026 00:28:45 +0530
X-Gm-Features: AVHnY4LtcTX_lK_xGoAffP_pyGCxvwRTc_h0LpoPHBV3m1bxl4OHZlyw8jSpkr4
Message-ID: <CAHaUZZCmkKAabwZRUhT43DVBWu1LNTGzJVYYzWZxxfN42ECE2Q@mail.gmail.com>
Subject: Re: [PATCH] gawk: backport randtest stability fix
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="000000000000094c600652e55293"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 21:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237727

--000000000000094c600652e55293
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for catching that.

You're right I had updated the files but missed staging them before
amending the commit. I've now corrected that and included all the requested
changes.

I'll resend the updated patch shortly.

Thanks,
Aditya

On Fri, May 29, 2026, 12:23=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> On Thu, 28 May 2026 at 20:44, Aditya GS <adityags2004@gmail.com> wrote:
> > +Upstream-Status: Backport [f2250f4bc864913437619af7a9834a1c24915acd]
>
> This still has the commit id instead of the link.
>
> > @@ -19,6 +19,7 @@ SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
> >             file://0001-m4-readline-add-missing-includes.patch \
> >             file://run-ptest \
> >             "
> > +SRC_URI +=3D "file://randtest-fix.patch"
>
> This also hasn't changed since the first version of the patch.
>
> Did you forget to run 'git add' before 'git commit --amend' ?
> (another option is to use 'git commit -a --amend' which auto-adds
> everything that's already known by git)
>
> Alex
>

--000000000000094c600652e55293
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex,<div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks for catching that.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Y=
ou&#39;re right I had updated the files but missed staging them before amen=
ding the commit. I&#39;ve now corrected that and included all the requested=
 changes.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll resen=
d the updated patch shortly.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Thanks,</div><div dir=3D"auto">Aditya</div></div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, May 29, 2026, 12:23=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:a=
lex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Thu, 28 May 2026 at 20:44, Aditya GS &lt;<a hr=
ef=3D"mailto:adityags2004@gmail.com" target=3D"_blank" rel=3D"noreferrer">a=
dityags2004@gmail.com</a>&gt; wrote:<br>
&gt; +Upstream-Status: Backport [f2250f4bc864913437619af7a9834a1c24915acd]<=
br>
<br>
This still has the commit id instead of the link.<br>
<br>
&gt; @@ -19,6 +19,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.=
gz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-m4-readline=
-add-missing-includes.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +SRC_URI +=3D &quot;file://randtest-fix.patch&quot;<br>
<br>
This also hasn&#39;t changed since the first version of the patch.<br>
<br>
Did you forget to run &#39;git add&#39; before &#39;git commit --amend&#39;=
 ?<br>
(another option is to use &#39;git commit -a --amend&#39; which auto-adds<b=
r>
everything that&#39;s already known by git)<br>
<br>
Alex<br>
</blockquote></div>

--000000000000094c600652e55293--

