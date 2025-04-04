Return-Path: <sam@liddicott.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0E5C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 21:00:56 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.7821.1743800445602511419
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 14:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@liddicott-com.20230601.gappssmtp.com header.s=20230601 header.b=NMBz6BjF;
 spf=none, err=SPF record not found (domain: liddicott.com, ip: 209.85.208.50, mailfrom: sam@liddicott.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so4223748a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 14:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=liddicott-com.20230601.gappssmtp.com; s=20230601; t=1743800444; x=1744405244; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FDG3Fan3BcUkhlCRcJ/P3tl7JtzvcgoRN8E6F6AZqIk=;
        b=NMBz6BjFyrLNEhOVgQKN03CSfAZeCYLBt7bDhoaKPkyYPjUrbMvfVjr03Ht75ayZw7
         4oR6So1T+MphxZs6hMZ0DvK76DC5KmJeB+bwsbTFX03ZoGlwNrd+FadcW14OGHe84M62
         8ztS3STxrHAC+LFu4hHlNWpS/7wh0+ytAL9yhZJENyscLrmlEu/xtvIiWfd2GjS1Fe4W
         CDVdeVR8AJyRM3Y9Tz8NFR2lgHqMtfbPyA65UlcwxAtNXqKofbqWxOpYZ2f/SIi9yc9m
         opH+RWPiiGm/uegGVyHwi56xO2bi9I10uLZcI5oVvTngSThLdLnn7XrYAPRv92ydqpmm
         W2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743800444; x=1744405244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDG3Fan3BcUkhlCRcJ/P3tl7JtzvcgoRN8E6F6AZqIk=;
        b=gLiCv8z7fn1BR4JgEsbz1vYQR9PevgevxdZ7a4Gc5I//XNWfvx51m+VnbLFPoitcEE
         XjMjfQ412QTdB/uvBGRutwMDc45LECeXaPC+S6DSOZpf6Cea99i+doUxgPulIYkYwDX8
         79QQK3VUDkeN4iFNVneN8LJB2dDChdIRvctjWEkn9U4d/NlEorgn/ZCwtvQzWM6sU5LR
         /RMua2/xbtPMLQNLR9+JaqEVEDypLMjlDFakH3sbJs/DE5/D0YafCAN3Zpvp9ohXxKTk
         P1lowtwyiCtZoOIq6Kx3UGf/XyOx3q6/ni4kRdJ8xYcnRkoItud+1LOU2mOsCm3Xm71R
         4AMA==
X-Gm-Message-State: AOJu0YzNyRWiLWZ+Dbp5eH1vVUlJEchiBdbA6rrZZcIBC1C0YU76R5rJ
	H8MYf4DKa2DjyQKzr8nEENg5BnIgzF2RZHopOl6EUPrlWamW+QMn2rR14YLhFbjqgwqoV3nwGgw
	mwrFDHWJY570tL/hL8DbBVc/LdjZYPoUB0uaz
X-Gm-Gg: ASbGncuapZsIYO36EdBkoXF6x4ILk622ILDrXh31dScvd0WOvm0l8DRnsIx+E/+2yTs
	nRih8p1sMZanbbcQQtb73LJ7533LbBy9j6nSuw852kt4IWGRP5RxEolDlF6se0ogHmtr8oJYtIV
	BeyyTD5ZzIHezOCdyIqo3ZWCKDvOnwhFKUYLJz0P+yqJrsFRdjatwo+Yz5FHW1wG9H4cXvfA==
X-Google-Smtp-Source: AGHT+IHbIh9ctdSOUZiq+yjI4qI8DiVoU+r+NFZkWVpTD6vE2RmJysd/XZT9PTBCODzjJoy4kwefZhIo9Cpsm6yr9CU=
X-Received: by 2002:a05:6402:510e:b0:5e6:17d7:9a32 with SMTP id
 4fb4d7f45d1cf-5f0b3bc912bmr3070546a12.18.1743800443323; Fri, 04 Apr 2025
 14:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <182E37A83C59199F.9767@lists.openembedded.org> <fb040e65a8a26b619c9215f61fb90d6651df66c2.camel@linuxfoundation.org>
In-Reply-To: <fb040e65a8a26b619c9215f61fb90d6651df66c2.camel@linuxfoundation.org>
From: Sam Liddicott <sam@liddicott.com>
Date: Fri, 4 Apr 2025 22:00:31 +0100
X-Gm-Features: ATxdqUF1usOs3qI5rxtmeGQaQJzZgjrTvb11ZFqEvZgyR1XFbala52CCvhh_cig
Message-ID: <CAOj-5WAJ3ViEfhOAW4xYdDKn0-9LHpfAWGegA-K9xk=Yf72Udg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] breakpseudo: Add demo of breaking pseudo with
 symlink creation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Mark Hatle <mark.hatle@kernel.crashing.org>
Content-Type: multipart/alternative; boundary="000000000000fbe7130631fa2d43"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 21:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214367

--000000000000fbe7130631fa2d43
Content-Type: text/plain; charset="UTF-8"

Thank-you so much for taking the time to explain that.

I had no concept of how complicated it was, truly I am a beginner.

It reminds me of this aphorism: oh what a tangled web we weave, when first
we set out to deceive.

My mind is blown! I will ponder on it.

Maybe unprivileged namespaces with bind mounts and user ID mapping is the
future, but I think it won't be ready for a few years.

Sam

On Fri, 4 Apr 2025, 18:04 Richard Purdie via lists.openembedded.org,
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:

> I think I can conceptually see why pseudo is struggling with
> link/renames.
>
> The reproducer for the problems involves overwriting a given target
> multiple times in parallel, i.e. ln or mv commands in parallel on the
> same target file. At the end there will be one "winner" but while in
> progress, you can't predict which file will eventually win.
>
> Thankfully such scenarios are rare in our builds. They imply build
> races and therefore tend to get fixed. That said, we do really want
> pseudo to be robust against such scenarios.
>
> To understand what is going on you have to understand a bit about
> pseudo's internal state. When the system calls "mv A B", we have to
> contact pseudo and:
>
> a) mark both A and B as "might be deleted" in the database.
> b) call the real system mv/rename function call
> c) see what happened, did it succeed?
> d) if so, tell pseudo B was deleted and A is no longer pending deletion
>    and rename it in the database
> e) if not, mark A and B as no longer pending deletion
>
> We need to know about both pending states since something might try and
> access A or B during these steps and whilst that will give us a hint of
> what is happening, we don't know until the process performing the op
> reports back.
>
> We need to have these pending flags as we have to preserve the extra
> info against a given path/inode and ultimately we need to know which
> permissions/ownership to give the final file.
>
> The challenge is this "pending deletion" flag in pseudo. If the
> operation above completes, it clears the flags against B, even if
> multiple processes have a pending deletion against a path. I think this
> is where the current code breaks down, only one client has a pending
> flag and in reality, multiple processes can.
>
> The second issue is that new files clear any pending deletions against
> a path. We have no guarantee that the new file hasn't actually already
> been overwritten.
>
> I can see two ways to resolve this. The first would be to separate
> deletion out to a separate table, so multiple clients can have
> "deletion" pending against a given path. Deletion is keyed to the
> clients already (by client ID).
>
> The second might be to make some ops block on the server side waiting
> for a second operation to follow up from the same client which would
> allow the situation to resolve before anything else continues.
>
> I'm writing this down so we at least have some record of what I think
> is happening, while I sort of understand it, or at least think I do.
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214364):
> https://lists.openembedded.org/g/openembedded-core/message/214364
> Mute This Topic: https://lists.openembedded.org/mt/111788756/7497305
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> sam@liddicott.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000fbe7130631fa2d43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank-you so much for taking the time to explain that.<di=
v dir=3D"auto"><br></div><div dir=3D"auto">I had no concept of how complica=
ted it was, truly I am a beginner.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">It reminds me of this aphorism: oh what a tangled web we weave, =
when first we set out to deceive.=C2=A0</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">My mind is blown! I will ponder on it.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Maybe unprivileged namespaces with bind moun=
ts and user ID mapping is the future, but I think it won&#39;t be ready for=
 a few years.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Sam</div><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 4 Apr 2025, 18:04 Richard Purdie via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a>, &lt;richard.=
purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.openembedded.org">linu=
xfoundation.org@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">I think I can conceptually see why pseudo is struggling =
with<br>
link/renames.<br>
<br>
The reproducer for the problems involves overwriting a given target<br>
multiple times in parallel, i.e. ln or mv commands in parallel on the<br>
same target file. At the end there will be one &quot;winner&quot; but while=
 in<br>
progress, you can&#39;t predict which file will eventually win.<br>
<br>
Thankfully such scenarios are rare in our builds. They imply build<br>
races and therefore tend to get fixed. That said, we do really want<br>
pseudo to be robust against such scenarios.<br>
<br>
To understand what is going on you have to understand a bit about<br>
pseudo&#39;s internal state. When the system calls &quot;mv A B&quot;, we h=
ave to<br>
contact pseudo and:<br>
<br>
a) mark both A and B as &quot;might be deleted&quot; in the database.<br>
b) call the real system mv/rename function call<br>
c) see what happened, did it succeed?<br>
d) if so, tell pseudo B was deleted and A is no longer pending deletion<br>
=C2=A0 =C2=A0and rename it in the database<br>
e) if not, mark A and B as no longer pending deletion<br>
<br>
We need to know about both pending states since something might try and<br>
access A or B during these steps and whilst that will give us a hint of<br>
what is happening, we don&#39;t know until the process performing the op<br=
>
reports back.<br>
<br>
We need to have these pending flags as we have to preserve the extra<br>
info against a given path/inode and ultimately we need to know which<br>
permissions/ownership to give the final file.<br>
<br>
The challenge is this &quot;pending deletion&quot; flag in pseudo. If the<b=
r>
operation above completes, it clears the flags against B, even if<br>
multiple processes have a pending deletion against a path. I think this<br>
is where the current code breaks down, only one client has a pending<br>
flag and in reality, multiple processes can.<br>
<br>
The second issue is that new files clear any pending deletions against<br>
a path. We have no guarantee that the new file hasn&#39;t actually already<=
br>
been overwritten.<br>
<br>
I can see two ways to resolve this. The first would be to separate<br>
deletion out to a separate table, so multiple clients can have<br>
&quot;deletion&quot; pending against a given path. Deletion is keyed to the=
<br>
clients already (by client ID).<br>
<br>
The second might be to make some ops block on the server side waiting<br>
for a second operation to follow up from the same client which would<br>
allow the situation to resolve before anything else continues.<br>
<br>
I&#39;m writing this down so we at least have some record of what I think<b=
r>
is happening, while I sort of understand it, or at least think I do.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214364): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214364" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/214364</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111788756/749=
7305" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/111788756/7497305</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:sam@liddicott.c=
om" target=3D"_blank" rel=3D"noreferrer">sam@liddicott.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000fbe7130631fa2d43--

