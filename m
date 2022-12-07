Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E506C63706
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 16:21:22 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.19964.1670430080177605200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 08:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e/R8fuKj;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id l8so21438414ljh.13
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 08:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cDgpqhITvrQkOrxa6gKLjyuHBYjMcQ6ir+WcqqIumvE=;
        b=e/R8fuKj9Sm5Stz0MkXwX9eNr58MI7BukjGqSE4eQbwhaQeQ310Qafcj3tQxsw6Srd
         JOTITtGPzr36FFARTmo7u4xfd9nPWjjc+Nsusp48Td3lygcKX3MnbSCIhryzkbRpKtJk
         eAjAO7i1x+3kHHWUQRVuk42KYDrN2OFK59Zir+yT4DhcIo1GBuVCHoijL1r2aSa5GAVj
         WZfU5tJv/wGwLxJuKj6KPTvf703rFY3Rg3PEkF3NtziYJNKNWsdvfDyf/qjykhBXtrm9
         iwcHSQJhWuHZR6wP0orNPJJnUPs+a0AxhDi3p2s9dkMae0qHi4gstj8B0IoYEyfOd3vg
         aXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDgpqhITvrQkOrxa6gKLjyuHBYjMcQ6ir+WcqqIumvE=;
        b=otk8wVS2rwtPkpnWomZnAmxk2HkQKWGxiy4Y79HVGyFBV3cDJW/wTk4/vXOrE8iobM
         6BuXFM9s8nF4ZXzeZpKORahZ81/hN+nXyFsCpeZl207ptMd6tGdNxJcgn+LTmCvDU5qr
         IQiisT+z9gTkf+lNviKyusorbg7c0paGTsHfqxhgb0RHrp2aMunv5uB180l5D9x/DamH
         W6zndS3m8j2C686fPSsnErhxAP6pmLNYOlmrMmVU8uaZTfljhOQG340jlCVgDdsC/w5/
         7noXbQtuNYOYNGwVk+XkR63FwSGjvU2B6suvVS2r28s5pjvY0rRNwdA/CWuXiRi85Y3t
         b37Q==
X-Gm-Message-State: ANoB5pkla0Zt643nHYwvKxJp4PfZutzuT3Tm0AQJVsBvE9Z/arzNtwUj
	lLbx0d2wbrwz7E6q4NecJHHZo4lYFJEo/nEce2w=
X-Google-Smtp-Source: AA0mqf5oEhaYkf5FMTQbaGyxUNmbJDGHapPqB2WAcxtqZIdW4HTxpcCOkRo5P0WJekx6YaowBnNWjFfJM7VRrHq4WJI=
X-Received: by 2002:a05:651c:1145:b0:277:8759:bf65 with SMTP id
 h5-20020a05651c114500b002778759bf65mr27323092ljo.108.1670430078186; Wed, 07
 Dec 2022 08:21:18 -0800 (PST)
MIME-Version: 1.0
References: <20221031114719.2725967-1-alex@linutronix.de> <167d8dfa-fe50-24ff-d2d2-249df3445ae8@windriver.com>
 <20221207002040.GB1080@xn--80adja5bqm.su> <CANNYZj9_46SdQdVuwFQ-HosVB7X2QpG0PDYNybV+ZL2Xt1FS3Q@mail.gmail.com>
 <96c54599-b4b0-5235-28fd-41c71272c213@weidmueller.com>
In-Reply-To: <96c54599-b4b0-5235-28fd-41c71272c213@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Dec 2022 17:21:07 +0100
Message-ID: <CANNYZj8gX4ab+zOVN974vwL8UkJqO-gqkshxsdYVtPsHZfExfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/13] cargo-update-recipe-crates.bbclass: add a
 class to generate SRC_URI crate lists from Cargo.lock
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Alexander Kanavin <alex@linutronix.de>, Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	Randy MacLeod <randy.macleod@windriver.com>, Sergey Bostandzhyan <jin@mediatomb.cc>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006eba0405ef3f4f5f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 16:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174360

--0000000000006eba0405ef3f4f5f
Content-Type: text/plain; charset="UTF-8"

On Wed 7. Dec 2022 at 16.28, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> Hi Alex,
>
> Am 07.12.2022 um 09:53 schrieb Alexander Kanavin via
> lists.openembedded.org:
> > On Wed, 7 Dec 2022 at 01:21, Sergey Bostandzhyan <jin@mediatomb.cc>
> wrote:
> >> I think this should be documented more prominently, as missing
> information
> >> on how to get going was the biggest obstacle, at least for me. The
> benefit of
> >> this workflow is, that no additional layer is needed and that
> everything seems
> >> to more or less work out of the box within the usual checkout.
> > Thanks for the report, I totally agree that the rust recipe workflow
> > should be documented somewhere in the official manuals, I'm just not
> > sure where. Perhaps the 'common tasks' in
> > https://docs.yoctoproject.org/dev-manual/index.html ?
> >
> > Can you write and propose a patch to the documentation repository?
>
> Is the recipetool obsolete or why we have yust an other tool to create a
> recipe in oe-core?


Which another tool are you referring to? Cargo bitbake is a 3rd party
project, one that I am not recommending to anyone in any way. And having a
class to update or create a list of crates does not preclude its use in
recipetool. Patches welcome.

A bit of politeness would be welcome too, Stefan, seriously. Watch your
tone.

Alex

--0000000000006eba0405ef3f4f5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed 7. Dec 2022 at 16.28, Stefan Herbrechtsmeier &lt;<a href=3D"mai=
lto:stefan.herbrechtsmeier-oss@weidmueller.com">stefan.herbrechtsmeier-oss@=
weidmueller.com</a>&gt; wrote:<br></div><div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)">Hi Alex,<br>
<br>
Am 07.12.2022 um 09:53 schrieb Alexander Kanavin via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a>:<br>
&gt; On Wed, 7 Dec 2022 at 01:21, Sergey Bostandzhyan &lt;<a href=3D"mailto=
:jin@mediatomb.cc" target=3D"_blank">jin@mediatomb.cc</a>&gt; wrote:<br>
&gt;&gt; I think this should be documented more prominently, as missing inf=
ormation<br>
&gt;&gt; on how to get going was the biggest obstacle, at least for me. The=
 benefit of<br>
&gt;&gt; this workflow is, that no additional layer is needed and that ever=
ything seems<br>
&gt;&gt; to more or less work out of the box within the usual checkout.<br>
&gt; Thanks for the report, I totally agree that the rust recipe workflow<b=
r>
&gt; should be documented somewhere in the official manuals, I&#39;m just n=
ot<br>
&gt; sure where. Perhaps the &#39;common tasks&#39; in<br>
&gt; <a href=3D"https://docs.yoctoproject.org/dev-manual/index.html" rel=3D=
"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/dev-manual/ind=
ex.html</a> ?<br>
&gt;<br>
&gt; Can you write and propose a patch to the documentation repository?<br>
<br>
Is the recipetool obsolete or why we have yust an other tool to create a <b=
r>
recipe in oe-core?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto=
">Which another tool are you referring to? Cargo bitbake is a 3rd party pro=
ject, one that I am not recommending to anyone in any way. And having a cla=
ss to update or create a list of crates does not preclude its use in recipe=
tool. Patches welcome.</div><div dir=3D"auto"><br></div><div dir=3D"auto">A=
 bit of politeness would be welcome too, Stefan, seriously. Watch your tone=
.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div></div>=
</div>

--0000000000006eba0405ef3f4f5f--

