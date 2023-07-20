Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CE1EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 16:42:19 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.2070.1689871333410871964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 09:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZEHNvW9U;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b700e85950so14550041fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 09:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689871331; x=1690476131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AM7vo87ypnz97du0Skw0cPfMWqBwOj+W7PH9ygX2xXI=;
        b=ZEHNvW9U8T6HOvJ8pVZLIL6nwk/a5Lt6JCfeSfF9IlZfX//pjXtn42C4GA3iQZqG8D
         x53WF2V3ZkSMLfU3mVLDg6Xjbvh6B9yTiMc851Tcxa69l1tw+jVOiZyNqNggqTO1iA1r
         tKH/QSrlP5goeUBIVxLbUnLBnKjY17HRB6DX8ecMNnRtF4yRNrWXLi/F/w4F1Tc1KSz6
         Di/l4v2D7Oe3Jzi8qEYFkarqGjrk61icYwhadafLKA8oUu52dYzO+EJECtw5SfSpRyJt
         vvbO5h3XB4WnafU7NILtjNjB6yHd3AiRCUlT38ZmMi339zlaqNV3w24DOqCroEUdwfWR
         N3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689871331; x=1690476131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AM7vo87ypnz97du0Skw0cPfMWqBwOj+W7PH9ygX2xXI=;
        b=gDqqHHZRDCqezbn3DHMD1xZgHQ8XKOhAPSuqNt8CMM/ZbigtO1yxkzTsg5jeHjXune
         SK4qHviW+KiqOO6XMeSMOsMoXy3+2E541CAefbk/P0wjS7/Ro2TYN8qak4PlnE0oEX/6
         V5KeMsx6nvbCzV9x9c+hAY1mALsyeRCT04KHCwC4Vwra7ybRL84LSvrLskMw5/jHoJ8b
         YnVvOEHTCl0BbBSvk89fS/7ZjHR1vyaln9WIM5WBVXxkVEI+Yy93rTVDHABg/0YlFUxG
         GKWC3QXfULqqdCuQaQVW6LeZDd+r3mzeJ0EcnIyzPH3qBBsR8RetUgbsZoRIg65G1pyZ
         34fw==
X-Gm-Message-State: ABy/qLZpZoeR77DOJOG9+5AlbBOaoLmMoSCDEvA4FVNHiX/nfhXr5JvA
	ySKGFSePGAP7MognOdrpcfjvo7fUhXohKvnlFCI=
X-Google-Smtp-Source: APBJJlEksARB1BO0hRbwn1eANRZY4ft8qEK7BSSnSjnNClJS+1fuISdlgWhOMxBaXcXfpF6qoHnxqM8+RZwGaenw+FA=
X-Received: by 2002:a2e:9e96:0:b0:2b6:cb55:72bc with SMTP id
 f22-20020a2e9e96000000b002b6cb5572bcmr2848064ljk.1.1689871331370; Thu, 20 Jul
 2023 09:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230519081850.82586-1-andrej.valek@siemens.com>
 <20230623111459.97933-2-andrej.valek@siemens.com> <38950e1b3bd475c131e7e4b5db03d9d170c8d690.camel@siemens.com>
 <ca87e264250af926f1cf3a2463e3213436c515bd.camel@linuxfoundation.org>
 <1B3C5AD0-9492-4319-9409-DFB59F587E9F@arm.com> <af1666bc975eeb52cfe4058b40e331c73c87421b.camel@siemens.com>
In-Reply-To: <af1666bc975eeb52cfe4058b40e331c73c87421b.camel@siemens.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 20 Jul 2023 18:41:59 +0200
Message-ID: <CAApg2=S3xTa7cmwJmHNRY_dcy_CaU80a_npeWzCLgY=yMWhR_Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH v9 0/3] CVE-check handling
To: andrej.valek@siemens.com
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Ross.Burton@arm.com" <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006c2ceb0600edd44d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 16:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184650

--0000000000006c2ceb0600edd44d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 2:03=E2=80=AFPM Andrej Valek via lists.openembedded=
.org
<andrej.valek=3Dsiemens.com@lists.openembedded.org> wrote:

> Even better,
>
> So I will make one more rebase, just for "[OE-core][PATCH v9 3/3]
> cve_check:
> convert CVE_CHECK_IGNORE to CVE_STATUS"
>
>
This version looks best from all I've seen. Let's get it in in this
version. I'll have a pachset to fix a few issues after we get multiple
fetchers in. I *think* I will be able to use it with multi-fetchers.

Kind regards,
Marta

--0000000000006c2ceb0600edd44d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 19, 2023 at 2:03=E2=80=AF=
PM Andrej Valek via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;andrej.valek=3D<a href=3D"mailto:siemens.com@lists.openem=
bedded.org">siemens.com@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Even better,<br>
<br>
So I will make one more rebase, just for &quot;[OE-core][PATCH v9 3/3] cve_=
check:<br>
convert CVE_CHECK_IGNORE to CVE_STATUS&quot;<br>
<br></blockquote><div><br></div><div>This version looks best from all I&#39=
;ve seen. Let&#39;s get <span class=3D"ng" style=3D"background:rgba(0,0,0,0=
) none repeat scroll 0% 0%!important">it in in</span> this version. I&#39;l=
l have a <span class=3D"ng" style=3D"background:rgba(0,0,0,0) none repeat s=
croll 0% 0%!important">pachset</span> to fix a few issues after we get mult=
iple fetchers in. I *think* I will be able to use it with multi-fetchers.<b=
r></div><div><br></div><div>Kind regards,</div><div>Marta <br></div></div><=
/div>

--0000000000006c2ceb0600edd44d--

