Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FD2C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 21:59:29 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web09.3530.1635285568674780250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 14:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ahATj7Ed;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id v3so1107111uam.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 14:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5MzBmNIXIH68LZuKwYAuEHTpS0n/IhkqQxTjzCVeDxg=;
        b=ahATj7EdqQ9x925RrjZKgm90PAMaKLgR2IUKiq5mzzoFB+OH+WmlOYBTGNYoHX4cmj
         9GAccXCgfkPd7j5wob0s7m8cTLlSPPLffBA3hZTBwpX9yZSwvoqcCVUJLK2jBtGckhSk
         4zhKsjcqKBQmoryVFNkV54PnJHVeATuuBErS4Idq/PZaPJxp1vi7luTJWfbQZMlwadEf
         VMKfw7sp1eaPcdnADv6NwD80j2K1QK2ZNxqdu4tdl6puxuNQyt7+9eWrRIWOzuR1qBCI
         dND50ZnKTx/0OhS2Nwm6UL9hW/8YUwhurp+wkXPm0hTfhesxUTTFyS72No8uvcwfXfgI
         KzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5MzBmNIXIH68LZuKwYAuEHTpS0n/IhkqQxTjzCVeDxg=;
        b=nvDi5cAglaF+8ev8aavHHXDbkAQRSfyYAvJZSKATXc/O+Pc9lRmfBNpbozz2VkmRT6
         TmhHrQGU0nkgXJp+Ev3tSY+crAgCMRRHEAN0wx7+bddOiKdVrgS6i3H0X2EYR6Slpngz
         Po9U2cYct7p2zhIp8Sm3AQOXEXb3aapZ8fDBebFVekHfwfWLjdFFF4h46hz7StXlsRZu
         0Znft36pYmqP7vA858F5uSBZco14j70EG0PqqOX0OawOWp+ED8tql7E4PoTAZj0loV2c
         Hz2f10wJ9ZjLSPfLiz4rNr+H07MGYcimh9XcmZOaEUU+zjtnYstTX/KAI0SeEBtHdXem
         prAA==
X-Gm-Message-State: AOAM532T9BefOGaqgKqlatrkV1oOl4WQ8VJZD02QCOHWT6fvBrkmwEqm
	Hu0EgKozHpd6STfc39XcmTgG5Jzn740Pcxvg2Wg=
X-Google-Smtp-Source: 
 ABdhPJzhKn9B91iLz2yqZBWo8lIuXBntEKXIojfM9epXoctL2IOzpe1J6nf+/dGFR8WnASUiqkHNRLJyUzjO2ugS4g8=
X-Received: by 2002:a05:6102:a30:: with SMTP id
 16mr6618492vsb.1.1635285567713;
 Tue, 26 Oct 2021 14:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094059.4184654-1-alex@linutronix.de>
 <20211011094059.4184654-24-alex@linutronix.de>
 <CA+chaQc7S7fmdDaWQfqPGv+o6UYrp_hUKgdr08uoegESuDPqew@mail.gmail.com>
 <CANNYZj8NPhV_b9QapAG=SYqhy60Z6cRxqE76Cpxs=qpjQ0F=7g@mail.gmail.com>
 <CA+chaQc13DNKNTFUc4u1EBvOs3ejtNaFiggEVL7rqtfXymq-Bw@mail.gmail.com>
 <CANNYZj9HxF_wLCVECqbfoM-X1uTeN4E=d4=gDkRyz46dV4Di3g@mail.gmail.com>
 <CA+chaQfoto-nsiMhsx=X0MdS5CSoydFecoNRgYxMr1QYot+ZbA@mail.gmail.com>
In-Reply-To: 
 <CA+chaQfoto-nsiMhsx=X0MdS5CSoydFecoNRgYxMr1QYot+ZbA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Oct 2021 23:59:16 +0200
Message-ID: 
 <CANNYZj_-65sa+Am6CaQqT=iHo3fGZozjqNPrUPYVo4ZPji1W_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 24/25] webkitgtk: update 2.32.3 -> 2.34.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005eb78805cf489721"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 21:59:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157456

--0000000000005eb78805cf489721
Content-Type: text/plain; charset="UTF-8"

The only difference to my setup is 'systemd'. I'm testing dropping the
patch on the AB now.

Alex

On Tue, 26 Oct 2021 at 23:51, Martin Jansa <martin.jansa@gmail.com> wrote:

> PACKAGECONFIG="systemd wayland
>  webgl gles2 angle                   opengl-or-es
>  enchant                    libsecret                   "
>
> On Tue, Oct 26, 2021 at 11:35 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Tue, 26 Oct 2021 at 22:40, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>>>
>>> No, this one was with opengl enabled, which was failing in do_configure
>>> do to missing gperf-native, but now when that was fixed it fails in
>>> do_compile.
>>>
>>> Build without opengl still works with works with my patch.
>>>
>>
>> I can no longer see the issue the patch was supposed to be fixing :-/
>> Maybe I had a broken build tree at some point. The patch can probably be
>> dropped, but I need to run it on the AB to be sure.
>>
>> What does 'bitbake-getvar -r webkitgtk PACKAGECONFIG' say on your side? I
>> wonder what combination of options triggers your issue.
>>
>> Alex
>>
>

--0000000000005eb78805cf489721
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The only difference to my setup is &#39;systemd&#39;.=
 I&#39;m testing dropping the patch on the AB now.</div><div><br></div><div=
>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 26 Oct 2021 at 23:51, Martin Jansa &lt;<a href=3D"m=
ailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">PACKAG=
ECONFIG=3D&quot;systemd wayland =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0webgl gles2 angle=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opengl-or-es =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enchant =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libsecret =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021=
 at 11:35 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 26 Oct 2021 at 22:=
40, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_b=
lank">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><br=
><div>No, this one was with opengl enabled, which was failing in do_configu=
re do to missing gperf-native, but now when that was fixed it fails in do_c=
ompile.</div><div><br></div><div>Build without opengl still works with work=
s with my patch.</div></div></div></blockquote><div><br></div><div>I can no=
 longer see the issue the patch was supposed to be fixing :-/ Maybe I had a=
 broken build tree at some point. The patch can probably be dropped, but I =
need to run it on the AB to be sure.<br></div><div><br></div><div>What does=
 &#39;bitbake-getvar -r webkitgtk PACKAGECONFIG&#39; say on your side? I wo=
nder what combination of options triggers your issue.</div><div><br></div><=
div>Alex<br></div></div></div>
</blockquote></div>
</blockquote></div>

--0000000000005eb78805cf489721--

