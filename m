Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB743D3E765
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:53:33 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2147.1765389209616704652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:53:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VYeuAtpt;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64471fcdef0so61869d50.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 09:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765389209; x=1765994009; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C83fh9cJwuIydWkqjrN3SMYUrMWfH29xLzeSg6oC2BM=;
        b=VYeuAtpt6ljU7oNBn5/YfvJks3eeAk4XZD1h4L6TJyTzifJrITLXq3d0NOe1I6UGcM
         Z3UnZVbXInWbmsfMeMhSBXui3Gagx/BDD8nTtCRe1P2r+4G9xrP3htigzmrI6bQ42Yud
         grPFxzTjjTsKTeJJkrttSgxooPJE3JrftZiGrkuQ87lyBADd0Zd9g8M9AhE7kGUTL7Q1
         TmUwNOn8/xY+NNcG9Qzxex0z08TOSZAbHAPrutP1yqDOLVismewoA0JcyZRji6xQ7kCV
         Q8LQc+hqnIzXTkw7d86G9CH9aQObM0zeyCm/yLwrR5PFWw2NY33V1tfs6SgA6dFv8vwH
         s3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765389209; x=1765994009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C83fh9cJwuIydWkqjrN3SMYUrMWfH29xLzeSg6oC2BM=;
        b=ffwbf3483O/b+0ZK9xKnyN8rtbKUv2zutbKRrCB6oVWXPjGWlxJ7iKgGPbyPBeYArg
         v7QQW2xUbvaetiUVsSuyPL3beX4X4DowWn/A+BSrdAAruk1xgyzJe33x5Wjmvp/8U0+b
         9V/UqTctYqwrWpw49YPTuRB9i+aKSMNERpWnyChuavF/q4/Ol24WRrjdSNdzWtMDCwi8
         hU0ESxd9KJHXYRWi6oTKWPzHkSeeOUtYCWV6GNLF2uSOXNqKO7pyu5Y3ke9NFUyD+R97
         Ki2GbgznwkM28gNpaEqJYImHG+tu3KM6ijMwmSa+o9y1J36B8IKuHNRsoZA0mPyQjMkc
         ea8g==
X-Forwarded-Encrypted: i=1; AJvYcCWIOEz77GlAt+kJEd5dRiXZkQ/hXVdp0TnwBUgJelnrwyLkItsX5yFoUxppJuYzYk1p33UEiNyFHw5xvC1PiS+/7w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx0kItqV4MLRVoqEG/Vy9PhMqDH/cAveq+cA70VT/iXvX/UrrcM
	EXpsGbBJotiCI3vL1WJlRiSBiQgiHYtcSDuX55jp9vNPw6KGp1LX9QAutxLbms3diUAgXKx0UHg
	yPvQgID+fi1Vr7Bn+ksMeB7juglU8/cA=
X-Gm-Gg: AY/fxX50QaqdXzmfDFeRNGCph+0BA6PjZxd8EadZ9MV4fM9VwwMFs+gZvm58Ch1/qyd
	Hih6Q1TDXKURXOv3BuOaup+UM7Olw1W9amBJ+/57j2sF0mIQPgf6t05bt/b/b37i0kdOUE4fowu
	2KoqtfJtTJC8eigEA/otxOAnKWQ7iY4TvcCv965kTSYfik9vAGB/yuM/bqcccUu6RoSLR2skx4q
	6t/FlaTec9YPMrY7EWU4h9M2j8/jNoLYhrxYS6r1tXzfmLYEd1Q9HGQbwymAXNuJNtiBLAZmDL+
	Hg7puH8mTBKZ3WzQQJW2dzCGIVVmdtd9zVrFzTutnz1C8HT4wG8ugdEM6keYTczcsPWkRtP56ax
	eUJkg+PVuVuYUo6ZmlLIlGpOo7ceCcuQ/gHjAtz7Nh6nELg==
X-Google-Smtp-Source: AGHT+IGq3Ktaimlg2R3K+AbxjagM0PMbqDPLBE14Q8SdVdvnKrVgIpH/gGs/xPq8mPG4UgVHCb8aXBu0cmp1CcQc0GM=
X-Received: by 2002:a05:690c:3508:b0:788:989:fdae with SMTP id
 00721157ae682-78c95a96269mr52819917b3.28.1765389208580; Wed, 10 Dec 2025
 09:53:28 -0800 (PST)
MIME-Version: 1.0
References: <20251210110340.3631065-1-adam.duskett@amarulasolutions.com>
 <20251210110340.3631065-5-adam.duskett@amarulasolutions.com>
 <b1e90355-721c-4942-aaca-209e43e29096@gmail.com> <CANNYZj8CrX4M+0ye2Pe9ov1D0PCNXCrC2Ni0jKqYe8PBa7vMKw@mail.gmail.com>
In-Reply-To: <CANNYZj8CrX4M+0ye2Pe9ov1D0PCNXCrC2Ni0jKqYe8PBa7vMKw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Dec 2025 09:53:02 -0800
X-Gm-Features: AQt7F2pwgdq35N1OHY-jZMT_-tWEpIKgN-W8D7XQtcTNC7LWjVm75uSsfOALANg
Message-ID: <CAMKF1sqivLDvdxuJMv0S2cP1nYQkog4mztm7TY=MeNPjP37iTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] dnf5: bump to 5.3.0.0
To: alex.kanavin@gmail.com
Cc: skandigraun@gmail.com, adam.duskett@amarulasolutions.com, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000aaf62206459cb4cf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227488

--000000000000aaf62206459cb4cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 6:41=E2=80=AFAM Alexander Kanavin via lists.openemb=
edded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> On Wed, 10 Dec 2025 at 15:27, Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> wrote:
> > > +PACKAGECONFIG[plugin-manifest] =3D
> "-DWITH_PLUGIN_MANIFEST=3DON,-DWITH_PLUGIN_MANIFEST=3DOFF,sdbus-c++
> libpkgmanifest"
> >
> > In which layer is libpkgmanifest? I couldn't find it the layer index.
>
> It is okay to have packageconfigs for features that are off by default
> and require components for which no one has yet written a recipe. If
> someone wants the feature, they'll make the needed recipe and find a
> layer for it.
>

it's perhaps ok for a recipe that we know exists in another layer we have
accepted such patches or a user ensures that it's possible to
test this packageconfig. I am a bit on the fence when packageconfig is
added which has a dependency
on a non-existent recipe.


>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227479):
> https://lists.openembedded.org/g/openembedded-core/message/227479
> Mute This Topic: https://lists.openembedded.org/mt/116710030/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000aaf62206459cb4cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 10,=
 2025 at 6:41=E2=80=AFAM Alexander Kanavin via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mail=
to:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed=
, 10 Dec 2025 at 15:27, Gyorgy Sarvari via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.or=
g</a>&gt;<br>
wrote:<br>
&gt; &gt; +PACKAGECONFIG[plugin-manifest] =3D &quot;-DWITH_PLUGIN_MANIFEST=
=3DON,-DWITH_PLUGIN_MANIFEST=3DOFF,sdbus-c++ libpkgmanifest&quot;<br>
&gt;<br>
&gt; In which layer is libpkgmanifest? I couldn&#39;t find it the layer ind=
ex.<br>
<br>
It is okay to have packageconfigs for features that are off by default<br>
and require components for which no one has yet written a recipe. If<br>
someone wants the feature, they&#39;ll make the needed recipe and find a<br=
>
layer for it.<br></blockquote><div><br></div><div>it&#39;s perhaps ok for a=
 recipe that we know exists in another layer we have accepted such patches =
or a user ensures that it&#39;s possible to</div><div>test this packageconf=
ig. I am a bit on the fence when packageconfig is added which has a depende=
ncy</div><div>on a non-existent recipe.=C2=A0</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#227479): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/227479" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/227479</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116710030/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116710030/1997914</a><br>
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

--000000000000aaf62206459cb4cf--

