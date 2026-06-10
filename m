Return-Path: <eric.meyers15310@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3256CD98C6
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 15:04:39 +0000 (UTC)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22741.1781103874451891281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 08:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dtxI6npo;
 spf=pass (domain: gmail.com, ip: 209.85.221.196, mailfrom: eric.meyers15310@gmail.com)
Received: by mail-vk1-f196.google.com with SMTP id 71dfb90a1353d-5ab03872a64so3100120e0c.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 08:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781103873; cv=none;
        d=google.com; s=arc-20240605;
        b=DRr71IXLCB3OmbLC0Znl224DsQfg+vs4nkMAM+qPvq/lM4ySTkFkBj0WnsyzguAU+d
         9XHKJ9JU6bwrpLYLmUwEagWzqsuK4zoog5JLNj73GK0u+2tkT4uNtrNRf9AgO1WWSrdM
         ZfCwLSCTQbz96ZLKWz0qGXpIlGxRQaz2ISzS6OnRiIdR/h6WdKVqZUWwi51NPSJNXLf+
         2/8jNX/SFRz1lVRTi0fqjbbivApvOPjkWDkZ9INLkt5uX/23t3/DNCCY/UNr0nU4u6a5
         +vWKuWGLLoXL91gEN0VetNhV1N4l6xBqGs3K4U8nO5Smg5rzVEYmC+I3vcv2K7J0m8DY
         J9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5Zi3oSNqEJUibZRZP6M6ojS3dowMAfwXWyXod0WFJrk=;
        fh=7ylzVGTYYGP1RTShDaYf8a/CkHrufVf5yEpVf+Ple7c=;
        b=E+3bXOLVECPViiBidh6vteaiVjGHeejjHuPnIVmMilWVIXviyrl9PJNquRLCX0sUHQ
         8ODFpdRoCHU0MzBCinWdgO+wmn7EMI9Fzhda3f9irfNup4aii9ftS0+Ua8ZLLJHq0/zj
         2BKvZpGHXZ/Lg3i09wvLG+abs8FymZgwsnEcftM1ocHC1guTe2rnxTNRW3ldyHSlJ9WC
         xkeMlj32vJFqeT+21DEIw6OR3/bCY4m4Te7J1AizQI3/sShWJObMn4VkrGpLhTBNawhA
         P+9ok5CBIw1wABtGz6pPyRlUWuOaMtkWFoMBublF/GjCBbLTnN2zshlhpg8t0RexjhUK
         g+jw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781103873; x=1781708673; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Zi3oSNqEJUibZRZP6M6ojS3dowMAfwXWyXod0WFJrk=;
        b=dtxI6npoOknae0yBNrE4Pu23iADC/WyaUB63dq5BHbJZ8mMrTQoCTGtydxlaMo7KzR
         s8AIykx4+L+9fgKHrQrHtI4sRprporxionDy/fuT++nFpiB/pP8kRyFcpuYwpxXN0wIW
         WGO4I3h/OVrdB13eI8PItRJFMnq33qmp0OrLW6KL0OiFGNA79BA7x9/H+J/qXmSI/HzA
         NiLiwSpOfvGXTqsCnVlT2D3164Qp13c+6lGMYUP6AMI1JnWQINUSa3BUp3j4omPgSq8J
         rsJU64LIWH+fL0gZrVKfW3pL8Fp4RbSdQ/cJVKxC4XmOqlNQ+uD1Ue8dn0Jtjpxgz5U0
         tijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781103873; x=1781708673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Zi3oSNqEJUibZRZP6M6ojS3dowMAfwXWyXod0WFJrk=;
        b=jTKBSsT+HiSvGH9YYYRJOh57Yf9OGnevFjUK+sjW7yzw0aNWSAGlJBtNnDgpphtwxx
         Fsw4ExaIi6FU3huWbycDWqHZC38IAa0OnNaeHlvupSFxYzDfuN25vHexD2Gku07YZLwI
         o4R9pvQvuDINavtcB81jepcZ9ZCm+BM8obYdsvhwsb3KYNaLbdKt5dU7nckyITNEBfdY
         emtkHEJSWv/qdXYUj9IMSDP85wVhHiL/XhmEOzjMhJFiluJUgd15z1N48GpjyBVu70l/
         iCJHKHVNtnzi0p8joIpET6VA2MMfTl6h1B6q5JM4DsrwA89IKTwCUoD2/RkG2N5X2YQh
         H7Iw==
X-Gm-Message-State: AOJu0YxdrpNx48ZLz1ou7reQReX2akC9/MsnccHLAsfEHhKAxW3p28+/
	CqzR9tqfd7VN4AGrsSlR5arwcIy95+crOw5Sm095SQljYQKgi/jMBSry0pBBaY4VggY2yVRNpYS
	PE2hbFULC4Kct7BOEUUqSK6e+0SRcj7E=
X-Gm-Gg: Acq92OFHCB3r6Y77Z9Y6ab9d7KbFxfizMVKLlk5BCrU0JYQSXppM3970uIKbgMHe2pV
	GaWLRU5BOkIO3JMTcBtEYkPjIR7E/o8htAOfIMGThyzpbzrlsTSOQ0fLXwABvGaGzff661LJv2Q
	D/Tain3zx27w+K+ETuZm3wWXOWXlgQ+8swjGiX9kNHf1YQSxz/7+ewQhXLfU7hHeubFSWC3CRvT
	IAxf5SpfCyzUK1rAAfnHQzq6fotYcrAsGvg52Xu05NoER2Ht+OWD6ixBgFRPontDuCFjmSLvHUZ
	tRSA6x5KFLPks/b1MPkN17OE6ted
X-Received: by 2002:a05:6122:341a:b0:575:56fe:574d with SMTP id
 71dfb90a1353d-5ac512ab712mr14201672e0c.12.1781103871537; Wed, 10 Jun 2026
 08:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260610133444.29699-1-eric.meyers@arthrex.com> <870e79aa60c3bb8f5872189afc89e74f6e8c283b.camel@linuxfoundation.org>
In-Reply-To: <870e79aa60c3bb8f5872189afc89e74f6e8c283b.camel@linuxfoundation.org>
From: Eric Meyers <eric.meyers15310@gmail.com>
Date: Wed, 10 Jun 2026 10:04:19 -0500
X-Gm-Features: AVVi8CecABuWRqKFbMnlFlEsecW7JguXn9zl2p8etJ2UB67_L2Jz6Kwq86tnxyA
Message-ID: <CA+cKJ+FYgvqQLeYn=KKBVXtL47ZtWHxbQcPY_wioz7v-q1jbbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] npm: Convert to list-based commands for NpmEnvironment.run()
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Eric Meyers <eric.meyers@arthrex.com>
Content-Type: multipart/alternative; boundary="0000000000009236360653e78f5f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238369

--0000000000009236360653e78f5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 9:29=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2026-06-10 at 08:34 -0500, Eric Meyers via lists.openembedded.org
> wrote:
> > This only affects those who have bypassed npm being disabled in
> > bitbake (post commit 355cd226)
>
> I am curious if you plan to help fix/maintain the npm fetcher?
>
> If nobody actually steps up and fixes it, I will remove it. I'm getting
> a bit tired of maintaining things I have no interest in with no help
> from the people who actually use it.
>
> Cheers,
>
> Richard
>


We are using a kas patch to temporarily bypass the disabling of the npm
fetcher as a stopgap until we figure out a solution for how to pull in the
node-related repos. There hasn't been necessarily a need lately due to the
kas patch, but I'm personally in favor of removing it altogether as it
would be a forcing function to come up with a better (probably more secure)
solution.

--0000000000009236360653e78f5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jun 10, 2026 at 9:29=E2=80=AFAM R=
ichard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ric=
hard.purdie@linuxfoundation.org</a>&gt; wrote:</div><div class=3D"gmail_quo=
te gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Wed, 2026-06-10 at 08:34 -0500, Eric Meyers via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a> wrote:<br>
&gt; This only affects those who have bypassed npm being disabled in<br>
&gt; bitbake (post commit 355cd226)<br>
<br>
I am curious if you plan to help fix/maintain the npm fetcher?<br>
<br>
If nobody actually steps up and fixes it, I will remove it. I&#39;m getting=
<br>
a bit tired of maintaining things I have no interest in with no help<br>
from the people who actually use it.<br>
<br>
Cheers,<br>
<br>
Richard<br></blockquote><div><br></div><div><br></div><div>We are using a k=
as patch to temporarily bypass the disabling of the npm fetcher as a stopga=
p until we figure out a solution for how to pull in the node-related repos.=
 There hasn&#39;t been necessarily a need lately due to the kas patch, but =
I&#39;m personally in favor of removing it altogether as it would be a forc=
ing function to come up with a better (probably more secure) solution.=C2=
=A0</div></div></div>

--0000000000009236360653e78f5f--

