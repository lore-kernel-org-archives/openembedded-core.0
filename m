Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18420C001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 15:28:07 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.20268.1691681283439567152
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 08:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SLtGk+n/;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fe700f9bf7so1601883e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691681281; x=1692286081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x71bOWIAwxct+GsiUeU7fALmJ3z8x9Tr8FyVnrOh0Qw=;
        b=SLtGk+n/osSTSpVfDcwPPn38XOp66rmDlRziVnuDiBSZB0w6j8Dd7cOy+3OG7YkEvz
         LDycIkwc6XU/EH2D9N7JQysKxCBCQ1dUAlAXsqGpiMLnRsj+fKvwLsISPf8tT0VL3Xj9
         oE5cqxHDCqHUo06C+jPy9nSQTHKFWMpbCRztTBCVwFPKoDWtiQZN7OLTglIqW8gPY7zQ
         BH3MmB9Iuh7oXFZEWeDZ5uvhitFZe8omTAwBKVEccX74/HkcD76DQ9jVJWUvy8ufUFGr
         pUPpPnW88P6HuPIXTTdoESnvZPeijMF3ZVsygA5phJ59GMmjtoFgf6YBxw71XVMIotoc
         hnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691681281; x=1692286081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x71bOWIAwxct+GsiUeU7fALmJ3z8x9Tr8FyVnrOh0Qw=;
        b=V0dCdpVg8jAq8rGaJAEWRrBI1QUJrNl04PqAE7mmg/lK7d0gbMVbxMi9WZhEnXRXyT
         3zh2muJTaME+W5crf6TK7saizsNkyX+p9uoy0892F0900PzFdH3X8BpOvETPWW4RE4x0
         5cF1Wdo4WC3hDVByVFZ0bYA5uKj7XBh2Rdx1QTfSrlPxYrTSNUJV7jrQCu5T6AvrNzgk
         kOJhwuKmsN9rQ9G6mH5byWC2OCiGrBOt09N6zVOLr4w36RNwN6KIW4OYssviOirT69h1
         JxnthwnkhwgMo3FNRW5QjwlhogZNJVbGUZ3uYpqvWkh7rBud+6vhniGu7PYTacMx7LWU
         i4kQ==
X-Gm-Message-State: AOJu0Yxp2t6pKcm9MC4DVQL+OKi4ICWLvwT0jv5ZPdH3e/aXOk2iBuFL
	x8lUoohmA5GTQWteDwWU/gI+splWt8hv9oGYm84=
X-Google-Smtp-Source: AGHT+IHQhnoyrKNwq+je+iTCQ+xmlJxMvnoJpLiZVL4wRCCQ9w1a98pGJ74qQn1WBUH8b/yKFuuxKRk6U663/SoVa24=
X-Received: by 2002:a05:6512:32a5:b0:4f8:766f:8dc3 with SMTP id
 q5-20020a05651232a500b004f8766f8dc3mr2186509lfe.32.1691681281277; Thu, 10 Aug
 2023 08:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230810133450.237127-1-richard.purdie@linuxfoundation.org>
 <CANNYZj9AacW-XB2G-6sHQobui1LGBHUMQTxV5EU=7ordJayWQw@mail.gmail.com> <eb94b91c02dbade5945a8883a95ed04d2ee31961.camel@linuxfoundation.org>
In-Reply-To: <eb94b91c02dbade5945a8883a95ed04d2ee31961.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Aug 2023 17:27:49 +0200
Message-ID: <CANNYZj-L2P96Ev=xbr5LWoL7OvyVU6hGkCajksgMgxPNF4ZQ2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] selftest/reproducible: Update config to match
 ongoing changes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d804320602933d60"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 15:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185761

--000000000000d804320602933d60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu 10. Aug 2023 at 17.10, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2023-08-10 at 16:57 +0200, Alexander Kanavin wrote:
> > I don=E2=80=99t follow i am afraid. How would having separate usr expos=
e
> > issues that merged usr would hide?
>
> Most host systems are moving over to merged usr. If host paths to a
> binary were to creep in (e.g. the path to a tool, /usr/bin/xxx), our
> non usrmerge config would be more likely to generate a reproducibility
> mismatch than one with usrmerge enabled.


But then it would creep into both build A and build B since both would come
from the same host or two hosts both with usrmerge, and there would be no
mismatch. No?

Alex

>
>

--000000000000d804320602933d60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu 10. Aug 2023 at 17.10, Richard Purdie &lt;<a href=3D"mailto:ric=
hard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;=
 wrote:<br></div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"au=
to">On Thu, 2023-08-10 at 16:57 +0200, Alexander Kanavin wrote:<br>
&gt; I don=E2=80=99t follow i am afraid. How would having separate usr expo=
se<br>
&gt; issues that merged usr would hide?<br>
<br>
Most host systems are moving over to merged usr. If host paths to a<br>
binary were to creep in (e.g. the path to a tool, /usr/bin/xxx), our<br>
non usrmerge config would be more likely to generate a reproducibility<br>
mismatch than one with usrmerge enabled.</blockquote><div dir=3D"auto"><br>=
</div><div dir=3D"auto">But then it would creep into both build A and build=
 B since both would come from the same host or two hosts both with usrmerge=
, and there would be no mismatch. No?</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Alex</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
</blockquote></div></div>

--000000000000d804320602933d60--

