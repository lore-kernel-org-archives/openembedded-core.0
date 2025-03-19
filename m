Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA04C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 13:01:01 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.7189.1742389259248443887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 06:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lWQHmopb;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff797f8f1bso7004733a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 06:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742389259; x=1742994059; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZRdpvuee7kwQiT1Km8EMZQIUpciv7UpF2d1qb9ZVLI=;
        b=lWQHmopbAUW85FTVOmNkziK49/RKpJIIJcnNcn3EO5JZi02xVXRCPWUB8A36NWj1Zh
         EaV5S5ujmpsWC5qJpFT8Z30l+0lJ6tPPEOztEb0HXFH3nx8hyPLSGI1trJff3V8D/ZzR
         DHZV7EtUFdYMsWHImgycuRp7hDjrkPlyCdjqz8gz8xOHwkS1VWpNHx7aqxyGJPCaBapJ
         y1CbqvHxipsi50H8ssY8IQJkTnxcuCvT8RTJj66diT9ORcNjB6sw+638sMYBOgHai66Z
         3X7aPxGMzdICS7a0b0DFBv8g4brdkPEGZTlzl/y1VU02AUkPRZLTZ8+fOGXb82xjE8bi
         bJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742389259; x=1742994059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZRdpvuee7kwQiT1Km8EMZQIUpciv7UpF2d1qb9ZVLI=;
        b=tPCM696OKmvRawcLsW6e1Jr8w9kB7ZZ+yLW9TC83j5sJFCZFpGt0E2YYusoSVd8OEy
         DA/HCed7yVpTrB6s1dPpsdvLZMAA9/4v+XxS0rZanH+dbrM1XhKf/X2bp9m/i8xOYCqz
         RDE2YI+Wrl/dj2kDeOOvGMu1II5l9Pxa4SgpasAbD0wEeBahVrN6CQwOI19a8pAsGBFQ
         C+A2i/C/rnEeviUfZBgjGfjMozuAuL4LZbtD4dxxOaodMLLodJ9lVImiXmFio5r59T5C
         TrQMzfWdHUR56DpkmnhkluTu4RTJ2tUOoxJ61KLbOO4obr7fBo02P0l31Vmg0TeXxNKK
         d87A==
X-Gm-Message-State: AOJu0YyQQ6H3i1QC4ScBtQApX2qfSC5+FQlW/CRRTDrmYaLqzL1AIuRx
	c79EL6d1w3NLCn2bmST+rYnCSXgNIUYNaqwOrVZVDrOu/rZoc+TvhduI59gdiJrWGlNMHjwPFqQ
	rpXKgD8rcXhq6SwqhrcEdSI843/ySjUMU
X-Gm-Gg: ASbGncsd2tfHoY/Np5iC6DlqKVp8rhopcYC3ox1fWso47lMaZnU5r/UCuFSueIc0YwW
	qL0AZHXx8Zhcr4ukzGC7ok4it4qdWHHatrEY/aeSYT3ewELW+2RuIwfJCChniX+bIE0GRMCck10
	11NsI57Wqmu5MDJUHtOU1Ye29rmPM=
X-Google-Smtp-Source: AGHT+IEfANlGAU3vBnHjFfxoXivcXe3AyFOa1xoGHCHpv73HiWcmif+lqQoEeIhsa0sVPUJFFANppfgPXqFURj3rYYU=
X-Received: by 2002:a17:90b:5343:b0:2ff:4bac:6fa2 with SMTP id
 98e67ed59e1d1-301bde739d7mr4712068a91.16.1742389258303; Wed, 19 Mar 2025
 06:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250317142422.GA20712@localhost> <12461.1742370016392631451@lists.openembedded.org>
In-Reply-To: <12461.1742370016392631451@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Mar 2025 09:00:46 -0400
X-Gm-Features: AQ5f1JpKseiz_fHuzOzkKDFLbPuR8CtYLFeoOu_IavF4Ao3Womca8FqkasN7QcI
Message-ID: <CADkTA4NNDzv-HJhr7cgQP4Dr2Q165Bp2dGW-r0iVjHGBMp=4fQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-module-split: fix conf file generation
 when KERNEL_SPLIT_MODULES=0
To: dixitparmar19@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cd42aa0630b19c90"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 13:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213330

--000000000000cd42aa0630b19c90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 3:40=E2=80=AFAM Dixit Parmar via lists.openembedded=
.org
<dixitparmar19=3Dgmail.com@lists.openembedded.org> wrote:

> On Mon, Mar 17, 2025 at 07:54 PM, Trevor Woerner wrote:
>
> On Sun 2025-03-16 @ 01:16:47 AM, Dixit Parmar via lists.openembedded.org
> wrote:
>
> Can you show the conf files for the same kernel configuration
> with and without the kernel_split_modules enabled ? That way
> we know there's no change in existing behaviour.
>
> I have confirmed that in my testing. Can you suggest how I can
>
> share that information here?
>
> What data are you expecting to find, and where are you expecting to find
> it, that prompted this fix? I assume that in one case there will be
> information/files populated in the image's /etc/modprobe.d and in the oth=
er
> case (the buggy case) that isn't happening? Or is there something else?
>
> Can you provide complete instructions and/or your configuration
> demonstrating
> the problem occurring before your fix, and the problem being solved by yo=
ur
> fix? Simply enabling KERNEL_SPLIT_MODULES by itself won't show anything
> unless
> the user is trying to enable some module(s) too.
>
> I found that I had to go read the bugzilla report to better understand th=
e
> issue and potentially how to show it occurring. Keep the reference to the
> bugzilla, but ideally the commit message would have all the necessary
> information to understand and reproduce the issue.
>
> Yeah. I shall add the issue reproduction configuration, and overview of
> the fix in the next patchset v2. Do you see any other code changes that a=
re
> required? so I can take it in the next set of changes.
>
>
Hold on the next version for a day or so.

I've been traveling and haven't had time to reply to your other questions,
but will
get time either today or tomorrow.

Bruce



> We also should make a test for this in the OE selftests. We
> are adding conditional code paths, so they should be tested
> to ensure no regressions in either in the future.
>
> Never done that before. May be I can do it given some direction
>
> as separate patch.
> I'm curious about the above line. It is unclear to me why we'd
> only have this postinst be relevant if none was previously set.
>
> Reverted.
>
> Is there really a scenario where the directory won't exist ? Isn't
> this just running in our own install phase ? So all prerequisites
> and directories should be in place.
>
> Ideally no, we kept it for safer side, I have added log warning.
>
> The walking and sorting seems quite heavy.  Isn't this called from
> do_split_packages indirectly ?
> Do we really need to walk and gather the information ? Is this mainly for
> the case of no-split
> on the kernel modules ? If that is the case, isn't there a way to short
> circuit the processing
> on the split-package case ?
>
> Litterally I could not think of anything else here and not sure of there
>
> are any short-circuit options. I have limited knowledge in this. I am ope=
n
> to suggestions
> if this is not the best solution at the moment.
>
> It is customary that quoted text have the start-of-line ">" symbols (the
> more
> symbols, the further back in history the comment) and that replies not ha=
ve
> any start-of-line character, as I'm doing here. Your email program should
> have
> an option to do this automatically.
>
> As you might have rightly assumed, I am a newbie so figuring out this
> stuff, I hope you understand.
>
> ~Dixit
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213266):
> https://lists.openembedded.org/g/openembedded-core/message/213266
> Mute This Topic: https://lists.openembedded.org/mt/111322503/1050810
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

--000000000000cd42aa0630b19c90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 19, 2025 at 3:40=
=E2=80=AFAM Dixit Parmar via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;dixitparmar19=3D<a href=3D"mailto:gmail.com@list=
s.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div>On Mon, Mar 17, 20=
25 at 07:54 PM, Trevor Woerner wrote:</div>
<div>
<blockquote>On Sun 2025-03-16 @ 01:16:47 AM, Dixit Parmar via <a href=3D"ht=
tp://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> w=
rote:<br>
<blockquote>Can you show the conf files for the same kernel configuration<b=
r>with and without the kernel_split_modules enabled ? That way<br>we know t=
here&#39;s no change in existing behaviour.<br>
<blockquote>I have confirmed that in my testing. Can you suggest how I can<=
/blockquote>
share that information here?</blockquote>
What data are you expecting to find, and where are you expecting to find<br=
>it, that prompted this fix? I assume that in one case there will be<br>inf=
ormation/files populated in the image&#39;s /etc/modprobe.d and in the othe=
r<br>case (the buggy case) that isn&#39;t happening? Or is there something =
else?<br><br>Can you provide complete instructions and/or your configuratio=
n demonstrating<br>the problem occurring before your fix, and the problem b=
eing solved by your<br>fix? Simply enabling KERNEL_SPLIT_MODULES by itself =
won&#39;t show anything unless<br>the user is trying to enable some module(=
s) too.<br><br>I found that I had to go read the bugzilla report to better =
understand the<br>issue and potentially how to show it occurring. Keep the =
reference to the<br>bugzilla, but ideally the commit message would have all=
 the necessary<br>information to understand and reproduce the issue.</block=
quote>
</div>
<div>Yeah. I shall add the issue reproduction configuration, and overview o=
f the fix in the next patchset v2. Do you see any other code changes that a=
re required? so I can take it in the next set of changes.=C2=A0</div>
<div><br></div></blockquote><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">Hold on the next version for a day or so.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">I&#39;ve been traveling and ha=
ven&#39;t had time to reply to your other questions, but will</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">get time either today or tom=
orrow.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
<blockquote>
<blockquote>We also should make a test for this in the OE selftests. We<br>=
are adding conditional code paths, so they should be tested<br>to ensure no=
 regressions in either in the future.<br>
<blockquote>Never done that before. May be I can do it given some direction=
</blockquote>
as separate patch.<br>I&#39;m curious about the above line. It is unclear t=
o me why we&#39;d<br>only have this postinst be relevant if none was previo=
usly set.<br>
<blockquote>Reverted.</blockquote>
Is there really a scenario where the directory won&#39;t exist ? Isn&#39;t<=
br>this just running in our own install phase ? So all prerequisites<br>and=
 directories should be in place.<br>
<blockquote>Ideally no, we kept it for safer side, I have added log warning=
.</blockquote>
The walking and sorting seems quite heavy.=C2=A0 Isn&#39;t this called from=
 do_split_packages indirectly ?<br>Do we really need to walk and gather the=
 information ? Is this mainly for the case of no-split<br>on the kernel mod=
ules ? If that is the case, isn&#39;t there a way to short circuit the proc=
essing<br>on the split-package case ?<br>
<blockquote>Litterally I could not think of anything else here and not sure=
 of there</blockquote>
are any short-circuit options. I have limited knowledge in this. I am open =
to suggestions<br>if this is not the best solution at the moment.</blockquo=
te>
It is customary that quoted text have the start-of-line &quot;&gt;&quot; sy=
mbols (the more<br>symbols, the further back in history the comment) and th=
at replies not have<br>any start-of-line character, as I&#39;m doing here. =
Your email program should have<br>an option to do this automatically.</bloc=
kquote>
</div>
<div>As you might have rightly assumed, I am a newbie so figuring out this =
stuff, I hope you understand.</div>
<div>=C2=A0</div>
<div>~Dixit</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#213266): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/213266" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/213266</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111322503/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111322503/1050810</a><br>
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

--000000000000cd42aa0630b19c90--

