Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564F0C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 09:34:39 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.4161.1667295272486405745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 02:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WUq3ln5Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id m29-20020a05600c3b1d00b003c6bf423c71so12416296wms.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lODDC6tEgspdOlantSmPel/VPLkzPiGN7IvYGt345As=;
        b=WUq3ln5QSfibsXODh6Y8weDqVS2fUWOSzM9yVq3aimoV2l+VftWUiWYIvNCopjvZhd
         4ecxzOvCWwbPdwUOwZQUgoONEvQZorxmUhLOvk7B4CgeLsDMFDI5t4yATmhN++IioR/q
         sgcNlkSyK/LOc8OgJHVG/Sv5qgDrEyAEaBrOiDPoWWQVJd6ybTupjyJhwVAIVpH02WPH
         5qTAasYBdoKD259ZhTI24lsVwDWPJcyMYQN3r8be4wF2XMkKXbBxZSP1dMjQgxHPd6FT
         Tom1CLQFSVtgSiWLoVa5w5K3O8tDarne1qs0C2yRj73mJHn2DY6qm6sm9PyKiwNLSmO8
         XntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lODDC6tEgspdOlantSmPel/VPLkzPiGN7IvYGt345As=;
        b=Vbm3FvZ1zm380G+M1eyScRAszWtZ/uvKys4sP5hgl7xUYrfASZThfztNAuYdVzjpJ0
         tsbd0FFyhyXpP6DsL9bz2XyDcvcigDqNozjCYAA5nHpOsUxpOekcC6sgQewkHT5lba9Q
         KuEUsEjENi8P+dZJhN1oBG3UB02jj/U0B9lI9j520BxrkCHNH3zfzZY4c2hThBMQyGey
         h4GDN8BtF18rWzV2/b0/pj1rXj1VP3f6Bbf//o4Lz9wddEBvACNBICVOkMJyG6f8rNbK
         avnlxbKp15kq7AAnOJBYv+/eNth5OXAMuuJIUnf+BGsF7oPigKQe38PfhFpVeD0K+ciS
         U3qg==
X-Gm-Message-State: ACrzQf32x5PrNsV4ctePqp1vvsUeqoRiM3hQbdeOOHQ1UDSqCKKpkg0e
	AhbhKRTUFbY56TG6Y4ZcsCAfkqAc0UEDfHO8LZY=
X-Google-Smtp-Source: AMsMyM7jD+tAbLGmGEn8e9XFoPNI5/52ZBmBVZ3Ho4HNLl5R4JjmSjw7TgaN9C8vichKweAFh4tobbsUWj6Y/sy42ek=
X-Received: by 2002:a05:600c:474a:b0:3c7:6df:4493 with SMTP id
 w10-20020a05600c474a00b003c706df4493mr21799085wmo.44.1667295270818; Tue, 01
 Nov 2022 02:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221031210902.169924-1-peter@berginkonsult.se>
 <CANNYZj81UaR6CojRriPNwGbq76mk+0Y+j8khBy2ZTrUqm4R1jA@mail.gmail.com>
 <e95e1314-a709-1f5a-548b-e27b4e5d3362@berginkonsult.se> <CANNYZj_A3cUHCjkys1_7DtasJU5sD5z0ruQv=WjSVCkwGKjbbg@mail.gmail.com>
 <35e2faf3-7cc5-a266-12f3-73ef600be8b7@berginkonsult.se> <CANNYZj-8-Ao5yj=rU7qS9oK=mBASs0Fm0=28sxp849DCOSVw-g@mail.gmail.com>
In-Reply-To: <CANNYZj-8-Ao5yj=rU7qS9oK=mBASs0Fm0=28sxp849DCOSVw-g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 1 Nov 2022 10:34:18 +0100
Message-ID: <CA+chaQePrxtJvdBYOy1drGnvHtCRgKps77wmoc8_wJnAQ88grw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: change syntax for SRC_URI append
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Peter Bergin <peter@berginkonsult.se>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005a59d105ec656e8e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 09:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172355

--0000000000005a59d105ec656e8e
Content-Type: text/plain; charset="UTF-8"

> I do not like bits and pieces of code scattered all over the place and
gathered together by bitbake, that does not help readability.

My experience is opposite, developers tend to copy whole recipes without
explaining why it was copied and what's the important diff they needed
compared to upstream recipes (or .inc file).

It's difficult to untangle when someone few years ago copied newer version
of foo from warrior to thud based build in product repo, then someone else
from different team cherry-picks "Add that feature" commit to dunfell based
build (and now foo is downgraded from version in dunfell to the old version
from warrior and the cherry-picked commit doesn't say why this version was
duplicated). Then when I'm upgrading from dunfell to kirkstone it's really
late to try finding the original warrior commit from which it was copied to
see if there were some intentional changes in packaging during the
"duplication".

e.g. duplication in
https://github.com/shr-project/meta-webosose/commit/1d61ee9739d61c061256077b231eb3fceed68f04
replaced with shorter bbappend in
https://github.com/shr-project/meta-webosose/commit/d333fec00fb0bc57d38375ddcda269780837ce79

Yes developers should write better commit messages and provide useful
comments in imported files, but at least in my experience very few do that
and duplicating more hurts readability, for everything else there is
bitbake -e to see where and how bitbake gathered the pieces.

Having short .bbappend helps them to do only necessary changes. Changing
the version in .bbappend is usually bad (especially when the original _
1.0.bb recipe is versioned and the _1.0.bbappend sets PV = "2.0"), so
reusing as much as possible from .inc file if it exists is the next best
thing to keep the "diff" short.

.bbappends also stop working from time to time when the upstream recipe
changes, reusing .inc files isn't very different from that.

Cheers,

On Tue, Nov 1, 2022 at 10:11 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Tue, 1 Nov 2022 at 09:12, Peter Bergin <peter@berginkonsult.se> wrote:
> > This opened my eyes for the way systemd recipes are built up in oe-core.
> > It seems a bit the other way around. systemd.inc contains almost only
> > version information. systemd_251.4.bb is huge and contains a lot of
> > thing that I think can be shared among versions. If it had been the
> > other way around it had been easy to have a systemd_git.bb, including
> > systemd.inc, in my local layer (or upstream if desired) that build
> > systemd main branch. What do you think of that? Is is worth working on
> > such a patch? Or are there reasons for that setup?
>
> I prefer the opposite actually. Where possible, I fold the .inc files
> into the main recipe because that makes maintenance easier, and if
> someone needs to change that in non-upstreamable manner, they have to
> perform a full fork in a private layer. I do not like bits and pieces
> of code scattered all over the place and gathered together by bitbake,
> that does not help readability.
>
> For systemd, I think the reason for systemd.inc is that something else
> in the same folder is using it.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172353):
> https://lists.openembedded.org/g/openembedded-core/message/172353
> Mute This Topic: https://lists.openembedded.org/mt/94696056/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000005a59d105ec656e8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&gt; I do not like bits and pieces=C2=A0o=
f code scattered all over the place and gathered together by bitbake,=C2=A0=
that does not help readability.<br><div><br></div><div>My experience is opp=
osite, developers tend to copy whole recipes without explaining why it was =
copied and what&#39;s the important diff they needed compared to upstream r=
ecipes (or .inc file).</div><div><br></div><div>It&#39;s difficult to untan=
gle when someone few years ago copied newer version of foo from warrior to =
thud based build in product repo, then someone else from different team che=
rry-picks &quot;Add that feature&quot; commit to dunfell based build (and n=
ow foo is downgraded from version in dunfell to the old version from warrio=
r and the cherry-picked commit doesn&#39;t say why this version was duplica=
ted). Then when I&#39;m upgrading from dunfell to kirkstone it&#39;s really=
 late to try finding the original warrior commit from which it was copied t=
o see if there were some intentional changes in packaging during the &quot;=
duplication&quot;.=C2=A0</div><div><br></div><div>e.g. duplication in <a hr=
ef=3D"https://github.com/shr-project/meta-webosose/commit/1d61ee9739d61c061=
256077b231eb3fceed68f04">https://github.com/shr-project/meta-webosose/commi=
t/1d61ee9739d61c061256077b231eb3fceed68f04</a> replaced with shorter bbappe=
nd in=C2=A0</div><div><a href=3D"https://github.com/shr-project/meta-weboso=
se/commit/d333fec00fb0bc57d38375ddcda269780837ce79">https://github.com/shr-=
project/meta-webosose/commit/d333fec00fb0bc57d38375ddcda269780837ce79</a><b=
r></div><div><br></div><div>Yes developers should write better commit messa=
ges and provide useful comments in imported files, but at least in my exper=
ience very few do that and duplicating more hurts readability, for everythi=
ng else there is bitbake -e to see where and how bitbake gathered the piece=
s.</div><div><br></div><div>Having short .bbappend helps them to do only ne=
cessary changes. Changing the version in .bbappend is usually bad (especial=
ly when the original _<a href=3D"http://1.0.bb">1.0.bb</a> recipe is versio=
ned and the _1.0.bbappend sets PV =3D &quot;2.0&quot;), so reusing as much =
as possible from .inc file if it exists is the next best thing to keep the =
&quot;diff&quot; short.</div><div><br></div><div>.bbappends also stop worki=
ng from time to time when the upstream recipe changes, reusing .inc files i=
sn&#39;t very different from that.</div><div><br></div><div>Cheers,</div><d=
iv><br></div><div>On Tue, Nov 1, 2022 at 10:11 AM Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote=
:<br></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Tue, 1 Nov 2022 at 09:12, Peter Bergin &lt;<a href=3D=
"mailto:peter@berginkonsult.se" target=3D"_blank">peter@berginkonsult.se</a=
>&gt; wrote:<br>
&gt; This opened my eyes for the way systemd recipes are built up in oe-cor=
e.<br>
&gt; It seems a bit the other way around. systemd.inc contains almost only<=
br>
&gt; version information. <a href=3D"http://systemd_251.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">systemd_251.4.bb</a> is huge and contains a lot of<=
br>
&gt; thing that I think can be shared among versions. If it had been the<br=
>
&gt; other way around it had been easy to have a <a href=3D"http://systemd_=
git.bb" rel=3D"noreferrer" target=3D"_blank">systemd_git.bb</a>, including<=
br>
&gt; systemd.inc, in my local layer (or upstream if desired) that build<br>
&gt; systemd main branch. What do you think of that? Is is worth working on=
<br>
&gt; such a patch? Or are there reasons for that setup?<br>
<br>
I prefer the opposite actually. Where possible, I fold the .inc files<br>
into the main recipe because that makes maintenance easier, and if<br>
someone needs to change that in non-upstreamable manner, they have to<br>
perform a full fork in a private layer. I do not like bits and pieces<br>
of code scattered all over the place and gathered together by bitbake,<br>
that does not help readability.<br>
<br>
For systemd, I think the reason for systemd.inc is that something else<br>
in the same folder is using it.<br>
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172353): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172353" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172353</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94696056/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94696056/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000005a59d105ec656e8e--

