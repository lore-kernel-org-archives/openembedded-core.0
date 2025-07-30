Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB269C83F26
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 14:12:31 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.36431.1753884742721870607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 07:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FLH9SKlW;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55b733911b3so2700403e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 07:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753884741; x=1754489541; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VAAGIwOAI4bKdaeB4j3/mtCOKmZWqwdrTwL6Uypbj7I=;
        b=FLH9SKlWYBqhheNW1XTzSRCpqReiFLi/K99VftvC8bJZXYmhCA8Lh+4//URnulUKox
         nWBklNAu2OAKqdIDHLeNz+OJOVYxg3p21yvhDy1t4tpkZU1RQAYjAHLxRWPbCOC5E4Z1
         ZPFdhtO82f4m2CJsbPFZsu3u+X0bF0bH4GC0Zeu+TLHJF7iQNz9ppBQCwuUoxJr1fjMc
         TDdD0xKWeVSGWQNa6c5f5s0GBs1h5Fv/2n50/k2I5wAOMbTLv+8bMmNELz7VPee0kj73
         Pb4k1JAdUWlCWwO4FXiaY7lOguR8SVuy3fYiqXb70OnlD0FK9yapYObfY/CATSAmQsos
         F3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753884741; x=1754489541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAAGIwOAI4bKdaeB4j3/mtCOKmZWqwdrTwL6Uypbj7I=;
        b=MI98NlezSjxWhWr+llIVMBwOK9pWr5THh70hiHfepjUB4mddRxtc9v2q+SfJOCX1VV
         jb/5NxqhgVXxy5fi/xcdHKkchzFcHyl/Zciga452BXb8dfQpuiEOd3HE2q2qg7RAjAva
         9LD4OBLtNYdTcoLsNFJcxJ80LlErAFSmVgQf+RFwe5n/Z2VEaB6xBy8lnsOc1UZgbAnh
         RHbrHEhlaXUEjia6MdfgvlhZU7+EfHCXJr6ituaAT34HHklQTSkunBAoB2oFfPg8fzeS
         6goJwsZpfRR2d/JAp1osedudHEsjT13BM3gpEPi9MG0leyvO4JjZ71PFNNS9y76HLsM1
         UoKg==
X-Gm-Message-State: AOJu0YyHVupA+HzlDrJG1HtdVOwwkznnvRMy5nmf/l2MLSrWOvtTC6SH
	xXs11zWne5AHKqyVTBHIleco69enMsvW47PKt3CrjRh1NiaR3n9grCkKPUYoTj6JV3H50OBi5gh
	xrsRXBg6p3fpF07OV4uryel2TKLREc1g=
X-Gm-Gg: ASbGncs34fO4oSSID+B7uz8o/vq8Vg0lfjlpMgMlRyvKghIJYdZHuTfXh5Diu+tXEmu
	Kf+oUQJcw73E3gZ2Uh25kBmnhEyEBjL4AfLQfcc0DzUydoiWRA/w7UV8YvYH1TLMbelIzRR3sv6
	1HUXi612mv+LyVOfchSzZWtzA+OFbZc82PCwLOGs1N4OgzqeWnWU7w+7wILT/wNL5N4PyByWd5a
	fAy3lwXhmaU68MLytx9q3WRnkqhtr4n
X-Google-Smtp-Source: AGHT+IEAUxb7TEiFdSZFbGa7R2VCBoAO9//H1f7axc+Z56H0AWSSBD04Vabkkh7DQHK02IUdHJuXT4TgW9nzu5wmWIE=
X-Received: by 2002:a19:5e0b:0:b0:553:a9af:9e43 with SMTP id
 2adb3069b0e04-55b7c0a7b8cmr772698e87.53.1753884740353; Wed, 30 Jul 2025
 07:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250625222916.11663-1-JPEWhacker@gmail.com> <CAJdd5GaM-WUiRkssxh-WXWmUhSZnTnay1qp50qH4s-1Rd8iB7g@mail.gmail.com>
 <DBPAU0F861HS.1KAH0JN9LXQIM@bootlin.com>
In-Reply-To: <DBPAU0F861HS.1KAH0JN9LXQIM@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 30 Jul 2025 08:12:05 -0600
X-Gm-Features: Ac12FXyn0zGEV_wpluBRYSEVWLCCi1B_xbbZdXT0L99Agls_hM3w99k3FHkcMac
Message-ID: <CAJdd5GZLvsuq7rvPfHmaRZ12ymdam4qgfNXEGJfyoohVhOUsBQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] spdx30_tasks: Change recipe license to declared
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ed02d7063b261c0d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221117

--000000000000ed02d7063b261c0d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, OK. I was just being silly and missed the _other_ place it needed to be
changed

On Wed, Jul 30, 2025, 3:57=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Tue Jul 29, 2025 at 9:34 PM CEST, Joshua Watt via
> lists.openembedded.org wrote:
> > Looks like this might have gotten missed?
> >
> > On Wed, Jun 25, 2025 at 4:29=E2=80=AFPM Joshua Watt <jpewhacker@gmail.c=
om>
> wrote:
> >
>
> I see it merged:
> https://git.openembedded.org/openembedded-core/commit/?id=3D561447c7cc14
>

--000000000000ed02d7063b261c0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ah, OK. I was just being silly and missed the _other_=
 place it needed to be changed</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 30, 2025, 3:57=E2=80=AFAM M=
athieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin.co=
m" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue Jul 29, 2025 a=
t 9:34 PM CEST, Joshua Watt via <a href=3D"http://lists.openembedded.org" r=
el=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> w=
rote:<br>
&gt; Looks like this might have gotten missed?<br>
&gt;<br>
&gt; On Wed, Jun 25, 2025 at 4:29=E2=80=AFPM Joshua Watt &lt;<a href=3D"mai=
lto:jpewhacker@gmail.com" rel=3D"noreferrer" target=3D"_blank">jpewhacker@g=
mail.com</a>&gt; wrote:<br>
&gt;<br>
<br>
I see it merged: <a href=3D"https://git.openembedded.org/openembedded-core/=
commit/?id=3D561447c7cc14" rel=3D"noreferrer noreferrer" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/commit/?id=3D561447c7cc14</a=
><br>
</blockquote></div>

--000000000000ed02d7063b261c0d--

