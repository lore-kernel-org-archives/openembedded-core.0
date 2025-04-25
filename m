Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8E0C369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 08:33:47 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.2294.1745570024161848729
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 01:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZrPvsG4C;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476b89782c3so24192641cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745570023; x=1746174823; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RtlXgoJCpjG3jg5YGLEcKusaVMXvBaEotNnCwpKO91U=;
        b=ZrPvsG4Cq2rItXSB0zvQ5ww5KZvzuzH3D+wirR1RGtO6kHxmQZcN/UEW/+kpRZei+l
         mtjC8VUG2YK4JcqNCWQaHtl3lLvo68q1rK+pTExH1I1rnRIrGI8un+s0g8bzywiJ4PYb
         FRrZ76wBzcqpdB7Yot0M8+nUmHc/sESFxf3U59o0YwGoYr58PWMm4fvN9b9P+LETd8Sp
         JmLPrycgDq7AzS+fXPz8qjFPpy7MZL5NRr9YO9wubo6VkcCDE6nt8HggkjAIwjG4VQXU
         EEeXotmvrdMFTmPTO+R+QkKqarV3JZRWb0G3OsIjVEZr1VPm8t5X8gq/szY98NUqtSdT
         nTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745570023; x=1746174823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtlXgoJCpjG3jg5YGLEcKusaVMXvBaEotNnCwpKO91U=;
        b=KbI/83l9se5sf3OdfhRlrNHa6UBoR1lldvbDklcRTS5GPWxiKLN24zcH1aqG3O1PnK
         Q7QdD1Ym7Jj5Eq0syIFIuJDOQWVTj7BUe6MIqkGmWovazBg7cAvEmUKpX9jMUsdCqBVY
         fwTV1hkOW4EsKyc3nSsMark2gQVD02nsf8gKH5oLcFVLn+lcaaBcBYc0Tn9KHudO1pzV
         CbUnvvAnuUM3nB9XOtPemhMgKwMtgTY/XFTc3qzpGV2TFGoxJ1Zm+PmaPxlnzfepQfr7
         0ZUICGQQ9N0IlA9/jKYIta9i1loQwBCaG9VvATxAF9kZpUVXssK7V3vmxj3N1IsJ60TG
         yZsw==
X-Gm-Message-State: AOJu0YwH3pMa6AaQYomRWuN9zjfRjpxaMUbwNP88UhYllNzdegBEeTsD
	OvrxxWMkLscyKn9KjBD/QNat5iyC9QROzqlQ8ZcDpCo+ci/lpsTNnPVjxHU7tP7OtRV0qM5gU5d
	LR1tgz/aVDN/rnZbg820lR1BsAME=
X-Gm-Gg: ASbGncs4SC8qWoN2GyDtcQzAHfsXSYe89afwViGBBE9vC+Eu+8plWfdT8bnfFuxaAqM
	D9hgLpKS01yQMteeSEPcljW/En4B2pIaoMNQmqQeY/Zes9PJIx2SvqJpXDFvBjGNM/7l3ps43r0
	jUEL99qiBSlbaZurC+aCJa6LiunzuGlddflTiQDVhvJUPV0ZiELFIQi2Fz
X-Google-Smtp-Source: AGHT+IH5i5W7aRg4heJEJgUXIMhqcHDwAHnzitC7oy7jPlsRjJz9nsUg9bQ27F//vH61VTI9CF9KGkAb2lX5hsImn5g=
X-Received: by 2002:a05:6214:1bc7:b0:6e8:fe16:4d44 with SMTP id
 6a1803df08f44-6f4cbd309ddmr23575646d6.31.1745570022971; Fri, 25 Apr 2025
 01:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
 <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
 <CANNYZj9hiQ41Boji0OH5ecRbktL-5nH3q3o0=k4+XxRZ=nu2ZQ@mail.gmail.com>
 <18394019E7982924.8448@lists.openembedded.org> <64802f57b85b524ef1bab88b07a116e5af228d5c.camel@linuxfoundation.org>
 <CANNYZj8eA1vnm6hO-AAn=xNEyMxrBGf48GTtiQOzW7w3yCqHKA@mail.gmail.com>
 <655a8640b7d8f528851f187558d19f8285e111e8.camel@linuxfoundation.org>
 <CANNYZj_j9TnJGEsfQ9fuivKQ0KcZgSyCc-OXbyXvzOuy2=S68g@mail.gmail.com> <db5f670164880a45133b2133b3957214b3ff0880.camel@linuxfoundation.org>
In-Reply-To: <db5f670164880a45133b2133b3957214b3ff0880.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Apr 2025 10:33:31 +0200
X-Gm-Features: ATxdqUGWMClWborxtmBZNaQ9dsUViaKIBHPmhVxCkGOwBymKuJSTO42lg-sWCsU
Message-ID: <CANNYZj8ooWqS1OXO7M+S4wgX8sVkWG3wTiCb5s-bnZhE9CxZRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] devtool: account for sources in UNPACKDIR
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215442

On Thu, 24 Apr 2025 at 22:34, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Why can't it set UNPACKDIR to the the workspace path and then just run
> it to directly unpack to where it wants it?
>
> It can then redefine UNPACKDIR to point at the workspace path and
> things should "just work"?

It can. But it will fundamentally change what users are going to get
under workspace/sources/${PN} and not necessarily for the better:

1. Right now, if you 'cd workspace/sources/${PN}', you'll see a source
tree that matches upstream repository (or tarball) exactly, for the
unpacked item that contains ${S} in it. It's obvious what to do: you
can modify files, run bitbake with these modifications, make commits
and devtool will pick them up and integrate into the recipe.

Yes, technically there can be more than one upstream item listed in
SRC_URI (I'm not sure what devtool is going to do when it sees them),
but the vast majority of recipes have just one item, and this keeps
things simple and straightforward for the users (and tools). The cost
of it: devtool is a convoluted mess (and to make matters worse,
without a maintainer); I don't argue with that.

2. What happens if workspace/sources/${PN} becomes UNPACKDIR? When you
go there, you'll see something named 'git/'. Is that where the actual
source is? If the recipe is fetching a tarball, there's no git/, but
rather ${PN}-${PV}/. So there's an extra, potentially confusing step
to get to the source code. It becomes more ambiguous and less
consistent for the users.

3. This will also break all the tools that assume the current
structure, and another reason this change shouldn't be taken lightly.

4. Maybe there's something I missed that could be done, and won't
break the current layout? For example, we can set UNPACKDIR to
workspace/unpack/${PN}, and then use devtool 'logic' to provide a
hardlink into it from workspace/sources/${PN} ? But it would be the
same logic as now with the patch: take original values of WORKDIR,
UNPACKDIR and S, and figure out where in the new UNPACKDIR to point
to.

Alex

