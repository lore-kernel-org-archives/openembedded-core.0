Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68299C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 00:11:03 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.3646.1677111062823767384
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 16:11:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QQU4PpN9;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so1982885pjb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 16:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0liyML45UTAZ24XuffOm5nTJFEf5jpdFoar+xnX7I6o=;
        b=QQU4PpN99ccouDyjFa/ui/VoufhSIwrr2kptO++ZMChyT3io//SrVgBqJhaj3LwYJb
         xZxjA+ZcSdn/gCDUKa9NjSHHgtQFIKkqDdlFeGZbHDN4jBTJlh0HU6fCIi8VNZV8EuSu
         NEMUoADmDVSfIqk6Q62xJg3XbR09vRLwx+e1enXkdj1M3aa/8uUOdPX79TSEgjLczh/Y
         qFLJ3MW84vkiY9yGLdkPD6i3rsykAI19/JLuK/xJXz4tfp7bnjSvqzzWQ34MbbvHTYNp
         iopJIjo/19eh5Obv33eGbU9nJuoL2UKfIMfLXT1VrjgC7cOuC3oZef9JsqOzD76zIeC2
         782g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0liyML45UTAZ24XuffOm5nTJFEf5jpdFoar+xnX7I6o=;
        b=3bdo7b2WxXoOdG2neDclWrdDay7rfF4QTjWn+7wFW6dA6oxWXtqhirGl7w/Y1iKWm6
         nWBA5CrePK7/4D14m9aBzMka5+mBme+9nY15fo2WskvOyK3fc2xVwXsuhAM9Zgae4+lM
         zhxVkRIYIdtlORdMG0RB7uu+0MP1MDAaN5pb0paVzYo0aq/MlVfUOtKYKYkuPWRCEeqU
         QuxnpHjJGV+XoWhi0312bNkXti62YqCtZjl87e6SUBZANRa1CMfPgmRRpErC26vDt+fU
         Gn/661DJIYxOMQw+JuPtjdQ6XvccRj+0/rn3ANqa4KSrLFkMo8faalY5fqzV2iU0FI8V
         e+sg==
X-Gm-Message-State: AO0yUKXnn+MSystbwleqVPcNH5IrJCHvcq24GkxE+F39uUkzjDvMNW0d
	U1NNoyBebV406znMW9wfgjo2f1aHmiOOHv/jkhQwk0mj
X-Google-Smtp-Source: AK7set+MIeqdflAa9DKlIl5KMW7i7B7USqbAvYbex/vIBcHNz/r3PNcqKu/JtwPmSD+uvgENZ/VxBnT011tXSUONYQk=
X-Received: by 2002:a17:90b:4cd0:b0:234:690:cf7c with SMTP id
 nd16-20020a17090b4cd000b002340690cf7cmr2457767pjb.37.1677111062186; Wed, 22
 Feb 2023 16:11:02 -0800 (PST)
MIME-Version: 1.0
References: <17462D99D28A7B3C.10470@lists.openembedded.org>
 <CA+chaQfpOv5J3OFjq2+OEdfth6Nmk34FEq+aPVAj+9wsaYc58g@mail.gmail.com> <CACPK8XeVKuBLLt=_T8akncOMH3UO+HFwmRMxiawuOuhj94w7BQ@mail.gmail.com>
In-Reply-To: <CACPK8XeVKuBLLt=_T8akncOMH3UO+HFwmRMxiawuOuhj94w7BQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 Feb 2023 01:10:49 +0100
Message-ID: <CA+chaQdzHV5kah_SXhTOfLo36tTZ3bW7oaYY2q4faZnEy0H_dg@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2] qemu: Fix building with latest glibc 2.36
To: Joel Stanley <joel@jms.id.au>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001c4ddf05f552d937"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 00:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177593

--0000000000001c4ddf05f552d937
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 23, 2023 at 1:08 AM Joel Stanley <joel@jms.id.au> wrote:

> On Wed, 22 Feb 2023 at 15:28, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > Hi,
> >
> > I've seen this build issue on my gentoo builder today with qemu-native,
> so I've removed the stray cross.patch and sent v2.
> >
> > Then RP had good question how to reproduce this failure and I've checked
> when I've updated glibc in gentoo for last time and it was a month ago (and
> I've rebuilt qemu-native few time since then).
> >
> > So in the end it was linux-libc-headers upgrade to 6.2 from yesterday
> (sys-kernel/linux-headers-6.2 in gentoo) which caused this for me (if I
> downgrade to 6.1 I can build qemu-native again even without this patch).
> >
> > Joel: Should I send v3 with updated commit message or will you do it?
>
> Thanks for picking this one up. Please continue the good work.
>

Can you confirm if it was related to glibc upgrade for you or it might be
kernel headers like for me and it just looked like glibc related?

--0000000000001c4ddf05f552d937
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Feb 23, 2023 at 1:08 AM Joel Stan=
ley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>=
</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, 22 Feb 2023 at 15:28, Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I&#39;ve seen this build issue on my gentoo builder today with qemu-na=
tive, so I&#39;ve removed the stray cross.patch and sent v2.<br>
&gt;<br>
&gt; Then RP had good question how to reproduce this failure and I&#39;ve c=
hecked when I&#39;ve updated glibc in gentoo for last time and it was a mon=
th ago (and I&#39;ve rebuilt qemu-native few time since then).<br>
&gt;<br>
&gt; So in the end it was linux-libc-headers upgrade to 6.2 from yesterday =
(sys-kernel/linux-headers-6.2 in gentoo) which caused this for me (if I dow=
ngrade to 6.1 I can build qemu-native again even without this patch).<br>
&gt;<br>
&gt; Joel: Should I send v3 with updated commit message or will you do it?<=
br>
<br>
Thanks for picking this one up. Please continue the good work.<br></blockqu=
ote><div><br></div><div>Can you confirm if it was related to glibc upgrade =
for you or it might be kernel headers like for me and it just looked like g=
libc related?</div></div></div>

--0000000000001c4ddf05f552d937--

