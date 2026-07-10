Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABACC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 08:23:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8309.1783671831439251580
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 01:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lbb2tZMG;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so3078395e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 01:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783671830; x=1784276630; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ehu9jwDk9J6BVrUAo2BNO8QF/Zqym2NFC8GwnYDoo20=;
        b=lbb2tZMGDe08NmSUqlhnoMLLMnpzN4+unjlgwo9iTZs1nK6gHvlIGhyyTi4OYdKuBE
         o4Ov+x0/uJZ7t18pR/uURVPS5pwtSxE0K6e0tQ/f00WSf4KWugb2LIeD5knxrJfJSXoj
         pl9viMj4v4QhnNSWl0OxTwbj/f9PTcLjP7lPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783671830; x=1784276630;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehu9jwDk9J6BVrUAo2BNO8QF/Zqym2NFC8GwnYDoo20=;
        b=M+MHZ2Ag9sAccNVH6IHb4egjEJMZ2Pmz08x8iRXgmqbL5O5UlIsm8L4YU5/TEMa7Fm
         lHQjscYAPAQXyxKYFrw2rwaa/jLbm0yVmpQDD5zhZgObg75ZP/p3Rss51qpXucgv0PMK
         j8T1L+B4cfq4z0tGFIP3J3ILI8vgFR89aJOEwRWLTeI0dWW8eh1+P8OgLSUzNfD0EC9Z
         F89rIflPkKXde30jULocX3cr6I2eFBBKFsgHseErQIlhi4EFNqHtk/vPwWtjnePMQTa0
         QtSlCHeESeVZoKs8dniN0oDASXv9KIijbm3IdLY+W/ENy7owmSur9x8Pi3K4TtVdZY8E
         HFaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5KPxNB10lshRsCmloIEWQcDXoJmkFg1SXJMiPFP0OWsgmxgkIjhvfYt9BrPcQSEBVMT7r+DhhAZUoTsAhtYcA2g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyU8/CKcoR/FD0qzhJJY7O9Rc8CDF43/22fuwG4mUptZHCHMEKL
	7I/mwK3LOVGg4LymPlgiQyu9OXerrkCSgjz2883qtJJquq3VeVvri5J5b06l4qikuS8=
X-Gm-Gg: AfdE7clcbM4W9gH+O62Z61P+1lgviIwt4Zfm/UwSoqCb94CkVjcjSbE9VT+/I8U0p0Y
	y+lOJQsIENTOTEhUaI/EMqPFBuak+Yg3sHvbMxQ4y6vHOopc+Z6M7HVc/DvWNbc5EfzhcnDXNba
	cTYsiUyPv1IsreSF9WFDRj0MPzXPSahOIaDmTj9XOFdoOujLf54n6YrV749wAVvaRpxE0BMZ2PW
	ogRQmm+788ThOwh7BPTw2+iK3g8ZONvSonkwDLluPX4fC7B575zdGkb+b03lhyE5QXMIlgFWD0q
	nnY6mys+Ma6lvG6WrBGvAaZGvjJlfSsQMHyd7kSHtkEu2MVHDlJUjHVKB/RJDo6z/RrCvhHzow+
	gYQiPsl0xcYC6OnNGFO1OTogxUIlIpvLAeW3bhcE//NMrAXTWgen9g4mfZG5oWELO73sZrUrp/F
	iveFyhk1D+mQLuUhVi4qM0IWPvwOrLDEqSSsunjTlQy/FQP9PFCxyijovkW6OxUVmfDKNM3NV3V
	jf7XQ==
X-Received: by 2002:a05:600c:4fd4:b0:493:bc92:ef45 with SMTP id 5b1f17b1804b1-493e685feecmr108597775e9.24.1783671829631;
        Fri, 10 Jul 2026 01:23:49 -0700 (PDT)
Received: from localhost (2a01cb001331aa005f82d0ccbe50ecf8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:5f82:d0cc:be50:ecf8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73b161sm108427785e9.9.2026.07.10.01.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 01:23:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 10:23:48 +0200
Message-Id: <DJUQW663FL32.3QHG026ZTF5W9@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <olivier.benjamin@bootlin.com>, <mathieu.dubois-briand@bootlin.com>
To: "Benjamin Robin" <benjamin.robin@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH 3/3] python3: fix CVE-2026-11972
X-Mailer: aerc 0.20.0
References: <20260706-fix-cves-python-wrynose-v1-0-b53e09c2b62a@bootlin.com>
 <20260706-fix-cves-python-wrynose-v1-3-b53e09c2b62a@bootlin.com>
 <DJUCGZSG6Q42.3GE2OCSOP0W3T@smile.fr> <wUbcnbU-TzOO6xOTZQJ9sg@bootlin.com>
In-Reply-To: <wUbcnbU-TzOO6xOTZQJ9sg@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 08:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240616

On Fri Jul 10, 2026 at 9:59 AM CEST, Benjamin Robin wrote:
> On Thursday, July 9, 2026 at 11:05=E2=80=AFPM, Yoann Congal wrote:
>> On Mon Jul 6, 2026 at 1:00 PM CEST, Benjamin Robin via lists.openembedde=
d.org wrote:
>> > When using the "tarfile" module with a file opened in "streaming mode"
>> > (mode=3D"r|") the tarfile module did not properly handle EOF, making a=
rchive
>> > parsing take exponentially longer.
>> >
>> > Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@boo=
tlin.com>
>> > ---
>> >  .../python/python3/CVE-2026-11972.patch            | 59 +++++++++++++=
+++++++++
>> >  meta/recipes-devtools/python/python3_3.14.6.bb     |  1 +
>> >  2 files changed, 60 insertions(+)
>> >
>> > diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch=
 b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
>> > new file mode 100644
>> > index 000000000000..7dc9c6697112
>> > --- /dev/null
>> > +++ b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
>> > @@ -0,0 +1,59 @@
>> > +From 2d256d4bfd654bdcaf2d96733799be73b8ff8f69 Mon Sep 17 00:00:00 200=
1
>> > +From: Petr Viktorin <encukou@gmail.com>
>> > +Date: Tue, 23 Jun 2026 15:13:30 +0200
>> > +Subject: [PATCH 2/2] gh-151981: Make tarfile._Stream.seek break at EO=
F
>> > + (GH-151982)
>> > +
>> > +CVE: CVE-2026-11972
>> > +Upstream-Status: Backport [https://github.com/python/cpython/commit/f=
50bf13566189c8d0ce5a814f33eff3d89951896]
>>=20
>> Hello,
>>=20
>> Upstream patch had a "Co-authored-by: Stan Ulbrych <stan@python.org>"
>> that I readded on my branch. Can you send a patch to master to re-add it=
 there
>> too?
>
> I sent a patch to fix that, same for "glib-2.0: fix CVE-2026-58016".
> I am sorry, this was done due to a lack of knowledge regarding how to han=
dle
> it.
> To summarize, do I just need to include these lines at the end of the com=
mit
> message in the patch, without altering anything else?=20
>  - CVE:=20
>  - Upstream-Status:
>  - My Signed-off-by
>
> In Yocto, what is the rule when backporting a commit which is in master, =
for
> example to Wrynose, regarding the Signed-off-by? I just need to add mine
> without touching anything else? Is there any difference if I am the autho=
r
> of the commit in master or not?
>
> Thanks

There is a nice subtility here:
* If your commit is a trivial cherry-pick (ie not change
  master->wrynose), then I may re-do the cherry-pick myself (per [0])
  and erase your signed-off-by (I try to preserve it but I might miss
  it)
* If this is a more complex backport (with changes related to the
  backporting operation, then, I'll definititely keep your cherry-pick
  as authorship info about the backporting effort.

In the special case of you being the author of the backported master
commit, then I *think* one signed-off-by is enough unless there are
changes during backport. Then you will have:
  Signed-off-by: You
  Signed-off-by: (master maintainers)
  If needed: backport info: (cherry-pick from ...), details, ...
  Signed-off-by: You # for the above work
  Signed-off-by: Stable maintainer # That I would add

[0]: https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Normal_proce=
ss

Regards,
--=20
Yoann Congal
Smile ECS


