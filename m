Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1DCC6FD1C
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 05:15:41 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.4465.1679807734155223506
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 22:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WLmCEBue;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id h25so7275197lfv.6
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 22:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679807732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kU/5G7lCBKBPGCK1cGE6ZWXnpw5bt052udHrf33rizE=;
        b=WLmCEBuePMyKkRcOR8orER8YpFhaO+O3DGcdaULmsUX+CCcHMV699a0qk6xYJZTzkw
         HQzBmSeJlXknB6oECl9Is498TqQLQmCHLTMR6q8jHr4jOZ7/Xp/bvEsAwl+F6LYaUKlm
         aPZ9ZWLL3fAfYqQVaIqhR5vgc45ZwsA5Yno/+qCpRlnp0n33Y6a1LCQd/To8SlxoTtCt
         LS7UTYO2o0ojZBES44/NdummjerougGvwzXSw4NzoWGoZN0Nb7LHp+M4e8cyyEjIHu7c
         53ni+KoFDb12r+2FHnlhQB+1DUtkKFnXtlJZc0P0d8Vaspk2/9SNYkkf7Hzo02Bl1Rpb
         vyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679807732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU/5G7lCBKBPGCK1cGE6ZWXnpw5bt052udHrf33rizE=;
        b=DgHhgu7Opun0JL3I+5DaJSv2khg/6e4NeGj/Cf/uxz6aiKAZZKYtAOZZSQaKUl8K7q
         BXIYLv6Vus4lvAyUnGJUINI/HYanYbCNyvSxvqRvVl0/t8BBNrCRH0my4eRqd7P8TCom
         BeGt4RSK+u/nj2P2yNfxfcAEYTtvE70BeWsZhskmnbUHh6WI/Kz+3WClQKGh9tJiPknn
         +L/G+bW17OLVvwL71kGVtRpidkhSLUxzXsZL8AhNECNBn4iFbpkx0ZuTvrmQSya+MiUd
         +4U4eZV1/23dExONbouNahdrruyKdTpRLLpKyLmAdkgMmDvDnX9neyVHXBi2bIg4MfoO
         s5aA==
X-Gm-Message-State: AAQBX9cI/zzHoxS5r9ANcBKff04df2vRCFJB5i+ujNfErPqaZRux2ZfV
	aO+ykN4CU33ZvNBnvf2pAW1psJSlCsrN2qqjfJM=
X-Google-Smtp-Source: AKy350aWaFx4RjJoZJM43tQ5tegnxVGueD4GhShhmLSU8VnZ2j6u+d+WuV4XCLR8PFL8cES4+6+mRJi86fHfD4yRfeM=
X-Received: by 2002:ac2:519c:0:b0:4e0:822f:9500 with SMTP id
 u28-20020ac2519c000000b004e0822f9500mr2221801lfi.12.1679807731940; Sat, 25
 Mar 2023 22:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <b48dd61e593e57d7673b65a34a44cd304cb7b7b8.1679734210.git.frederic.martinsons@gmail.com>
 <CANNYZj9P1fAvs6kErzVogStEwuPvJOYRLHOWn6Q3PKaNFXu7PQ@mail.gmail.com>
In-Reply-To: <CANNYZj9P1fAvs6kErzVogStEwuPvJOYRLHOWn6Q3PKaNFXu7PQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sun, 26 Mar 2023 07:15:20 +0200
Message-ID: <CA+cAkeqGmQPq5+2HTQBSavTVjPxa=wV5nMeEWeWMrbEg8=0DzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] devtool: add support for multiple git url
 inside a cargo based recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000027430d05f7c6b703"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 05:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179110

--00000000000027430d05f7c6b703
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for making it not clear.

Without this patch, git url that are in the original SRC_URI of the recipe
are simply
remove from the final SRC_URI under devtool and so it prevents
cargo_common_do_patch_paths of cargo_common.bbclass to patch these
component to fetch them locally.



Le sam. 25 mars 2023, 19:55, Alexander Kanavin <alex.kanavin@gmail.com> a
=C3=A9crit :

> On Sat, 25 Mar 2023 at 10:01, Frederic Martinsons
> <frederic.martinsons@gmail.com> wrote:
> > +            if url in cargo_git_deps:
> > +                local_srcuri.append(url)
> >
> >          d.setVar('SRC_URI', ' '.join(local_srcuri))
>
> What actually happens without this patch, and what does the patch
> change? The commit message isn't making it clear.
>
> Adding special cases based on custom variables is also not great; why
> would git:// entries in rust recipes be treated differently than
> git:// entries in other recipes?
>
> Alex
>

--00000000000027430d05f7c6b703
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry for making it not clear.<div><br></div><div>Without =
this patch, git url that are in the original SRC_URI of the recipe are simp=
ly</div><div>remove from the final SRC_URI under devtool and so it prevents=
</div><div>cargo_common_do_patch_paths of cargo_common.bbclass to patch the=
se<br></div><div>component to fetch them locally.</div><div><br></div></div=
><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Le sam. 25 mars 2023, 19:55, Alexander Kanavin &lt;<a=
 href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmai=
l.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Sat, 25 Mar 2023 at 10:01, Frederic Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" rel=3D"noreferrer" tar=
get=3D"_blank">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if url in cargo_git_deps:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local_srcuri.=
append(url)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;SRC_URI&#39;, &#39; &#=
39;.join(local_srcuri))<br>
<br>
What actually happens without this patch, and what does the patch<br>
change? The commit message isn&#39;t making it clear.<br>
<br>
Adding special cases based on custom variables is also not great; why<br>
would git:// entries in rust recipes be treated differently than<br>
git:// entries in other recipes?<br>
<br>
Alex<br>
</blockquote></div></div></div>

--00000000000027430d05f7c6b703--

