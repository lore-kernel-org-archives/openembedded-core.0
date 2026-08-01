Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F2FC55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 20:08:12 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12283.1785614887982450442
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 13:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=P9D5O8XV;
 spf=pass (domain: konsulko.com, ip: 74.125.224.54, mailfrom: tim.orling@konsulko.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-668296d0ff3so2923805d50.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 13:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785614887; cv=none;
        d=google.com; s=arc-20260327;
        b=kAI7JXNMKAqhFrNO2FIDigjcwrmS7Ynaf9IuWvCoh1CRalvxYZfc9z8dvQVfrnzLcu
         91bGIHafriIEOV/GFliX+r5kyYXRp9TgzXoCC6aaDrx8Xo4kexVdhC/Z9U+ds77XzwAN
         NvJ+CDEMthb9//BufYGUGAOVqT1vwPZfhmKIe9zLm3RIic32za5RV5xZ7JbuQJLlsQeu
         iyXAXgPEODE7EcoLbwJUBhNwN1/wbQP1lE8wOC9oOzqcFjeQRhmY5fTmHFu++Lt3tVG+
         4D4FJTu98MgOTTTYIPA3BveTJjNsxjlG+Gof/ipMG65leNSztnugBp3GCaOk9xp7qK3q
         kJSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J88yqey35zjJybuOYfv8s/ZsXKVM+3SYL80s8YL9Tk4=;
        fh=7/xi+DningzU+q+bkhIch0ABgAHzDdLghn0xrgXHwYw=;
        b=b6s1sgOD811K+FmpQ63EodGP57bYsy+WUUIDWTlTE65nE+qMzpm89lAGmfIrZkjpGh
         4pZAhPvVKuRSYuAUEyGEtla+EYWD+z1z4+jdI3RNKSuhJ+TXtEgvBHvTv1hQrSkTmhX7
         LGh2qv9B5z6wYrgajMjBcGc0GH4kWJzFKoJNyoOCohYd3HCZaE9C4woA09SKcfNr31BY
         dJz0eWjcukNyZFa5pzmaN+Thpl2/gl8gxB1zWXK2akQvhQTGMo1V6vV/rUSqA7pZfWGG
         3Cuhw3hHDTKET3wD6GOjMzaHOnJTMV0SE+nAyoTZrXfRxEuwNhtWQtPfIX05RUBSc+SV
         iCSg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785614887; x=1786219687; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J88yqey35zjJybuOYfv8s/ZsXKVM+3SYL80s8YL9Tk4=;
        b=P9D5O8XVSU9bvG5FNGFEOH4dBF2L5PyzUNd79y93DcK6YpxiUFsxi6QjSZaxXHpf5c
         xlHphGiSfsm1ixmo8R4v63dbJj2fF12rt8tL0GClXbhisfpl0kWO8pHu8q9vMbYACOti
         K30CVlqC/SDdaYRLkr2IKCkAhAB2yM5CsLyP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785614887; x=1786219687;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J88yqey35zjJybuOYfv8s/ZsXKVM+3SYL80s8YL9Tk4=;
        b=fuNykSPCs7ynsJ2nxGePbhBor+QKutdrXZBANdUG9ucyrn/COvhsDRCFzX6tlVviOJ
         /MIVJ0lfefCz8nK8tfK28vCV6ziImaO9YDQPZLdzxC+KvDhR8pCOmJcGn8ts0ezXNSCJ
         AxSxLtNi/uyhFTGdwPqr/oOq5zuha21LEld4zlxi+p6ndcT0p00+uVa7l2kkuxcC9mHg
         scz1L5r9Bhkxhi8kbr9SPCKDXk4td7Sdf+lOEkmJy9HJxX8gdHPXmx/BZ4FD9uLXK0+c
         nqA9XAcxAMcuuJLfulJay/JgmsGPEO1JpI5bpNeJxJYiU0dICXZ3prCIog/HzJHX7eCX
         Mr8Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro6bVWjruzFzaz6vMN9A1cMHJ7PkNir3iZKNSRMGpEHkeyCIixJ3q0APK+eCMsxrJw3CCI3+3HmLQxJfpwT/rG1Ng==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwThjvduVBp8duLKpGE2QKKhR5nz3UlMk5dNe5TOEnhuf7ZgtuV
	5HNwVeTcyZyilsP4tZqAx8U8GSZ478vjg+vuu7jgmc+VW1fkG1ur2TAJmSImvPY2t9MlwDiUn7U
	bXNr/VTIPXf57mUTtX+exQg6glRah7VFkyj/ogoendg==
X-Gm-Gg: AR+sD13ujGU/KS23T1DKEM0HRIEnDcZZslkXvRLpXECvGefZC9Cv74CQYHDlpGewobe
	+HJEEFH8mk+In0CUkG6ieoSUnNKHzJLKkpBs56FZcTCumKXHwVNDXvIWdLqPRLheoEbmmlFVj84
	aZy1qTo7ofzqsExtp2PNTism1g1+PP2vR94w46FjTBKErytMo+hifyUsEFFLpOS01CUjIDOBgTt
	ZplykApUA/74tj9uix1wlYCdk0WhrqIcD7qpjJGsULRede4DbFK4vNo9dAUTCKgd0E6vQ2/XLWi
	S6P/CPqmi5D5nFZLY8y3CsaEZPEGcp+avmJQ/47SbE71
X-Received: by 2002:a05:690e:458a:10b0:667:bc08:e995 with SMTP id
 956f58d0204a3-6694f2ab3aemr4700876d50.50.1785614886903; Sat, 01 Aug 2026
 13:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <0101019fb18e1918-6e60db78-fa07-43d5-8bb5-0f1a3bf1758a-000000@us-west-2.amazonses.com>
 <040de8e5eb3f8b57f00cfa691c8d5889103b7e50.camel@linuxfoundation.org>
In-Reply-To: <040de8e5eb3f8b57f00cfa691c8d5889103b7e50.camel@linuxfoundation.org>
From: Tim Orling <tim.orling@konsulko.com>
Date: Sat, 1 Aug 2026 13:07:55 -0700
X-Gm-Features: AUfX_mwKUpJBhEmMDcvgj9G8-G_1Jl9AcxyNXNjKrKypxi0y43nUJIi84CqgWl4
Message-ID: <CAOyo-84CvS6-hHAdU4T2+8PRs1U-N1-bwmrc-kbm-D-E+hf0hg@mail.gmail.com>
Subject: Re: [OE-core] [AUH] python3-websockets: upgrading to 17.0 SUCCEEDED
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: auh@yoctoproject.org, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000a30ed065801dd20"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 20:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242498

--0000000000000a30ed065801dd20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 11:14=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2026-07-30 at 05:45 +0000, Auto Upgrade Helper via
> lists.openembedded.org wrote:
> > Hello,
> >
> > this email is a notification from the Auto Upgrade Helper
> > that the automatic attempt to upgrade the recipe(s) *python3-websockets=
*
> to *17.0* has Succeeded.
> >
> > Next steps:
> >     - apply the patch: git am
> 0001-python3-websockets-upgrade-16.1.1-17.0.patch
> >     - check the changes to upstream patches and summarize them in the
> commit message,
> >     - compile an image that contains the package
> >     - perform some basic sanity tests
> >     - amend the patch and sign it off: git commit -s --reset-author
> --amend
> >     - send it to the appropriate mailing list
> >
> > Alternatively, if you believe the recipe should not be upgraded at this
> time,
> > you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> > automatic upgrades would no longer be attempted.
> >
> > Please review the attached files for further information and
> build/update failures.
> > Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Upd=
ate%20Handler
> >
> > Regards,
> > The Upgrade Helper
>
> This creates ptest failures. I note a new point release in AUH today too.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2047
>
>
This upgrade was already "on my list", so I will follow up on the ptest
failures next week. Thank you for the feedback and the link.


> Cheers,
>
> Richard
>

--0000000000000a30ed065801dd20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 31,=
 2026 at 11:14=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2026-07-3=
0 at 05:45 +0000, Auto Upgrade Helper via <a href=3D"http://lists.openembed=
ded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; this email is a notification from the Auto Upgrade Helper<br>
&gt; that the automatic attempt to upgrade the recipe(s) *python3-websocket=
s* to *17.0* has Succeeded.<br>
&gt; <br>
&gt; Next steps:<br>
&gt; =C2=A0=C2=A0=C2=A0 - apply the patch: git am 0001-python3-websockets-u=
pgrade-16.1.1-17.0.patch<br>
&gt; =C2=A0=C2=A0=C2=A0 - check the changes to upstream patches and summari=
ze them in the commit message,<br>
&gt; =C2=A0=C2=A0=C2=A0 - compile an image that contains the package<br>
&gt; =C2=A0=C2=A0=C2=A0 - perform some basic sanity tests<br>
&gt; =C2=A0=C2=A0=C2=A0 - amend the patch and sign it off: git commit -s --=
reset-author --amend<br>
&gt; =C2=A0=C2=A0=C2=A0 - send it to the appropriate mailing list<br>
&gt; <br>
&gt; Alternatively, if you believe the recipe should not be upgraded at thi=
s time,<br>
&gt; you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that=
<br>
&gt; automatic upgrades would no longer be attempted.<br>
&gt; <br>
&gt; Please review the attached files for further information and build/upd=
ate failures.<br>
&gt; Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproj=
ect.org/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"norefe=
rrer" target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?pro=
duct=3DAutomated%20Update%20Handler</a><br>
&gt; <br>
&gt; Regards,<br>
&gt; The Upgrade Helper<br>
<br>
This creates ptest failures. I note a new point release in AUH today too.<b=
r>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/buil=
ds/2047" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/56/builds/2047</a><br>
<br></blockquote><div><br></div><div>This upgrade was already &quot;on my l=
ist&quot;, so I will follow up on the ptest failures next week. Thank you f=
or the feedback and the link.</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000000a30ed065801dd20--

