Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0700C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 14:19:24 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web09.10354.1634653164454813444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 07:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=feH1DA1D;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id q13so185239uaq.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 07:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X9ahfWfDQhOmKJNiizLrRNetA2G5KibJzsld/RF0MzM=;
        b=feH1DA1Dd+UxQSONDqwWZH97HW0w+u7zrE9WrGit20T1qB3asHkRXKJ4q9PlGn5I59
         jG1DRlkcDJZCnSlpAuccjW9DF8ep+gMe/owJK2MqKrNAOCIsxF6QfSRBW81h8d0tDZtP
         nDelecPW0bGKM6RyFQr7CC7cbQ7NsfBPZ3eOTtXo26Dx7YgxTsOU5SW1QHxblg5lGpOQ
         IexhOyEwT6TCPcVFZzFPe28YUnIfpZu8S0mrhuwYeXuZkaaHw0/eO0+tqRRsQIDQLL/p
         iL+tCKWvGsnTeDaBOfCPlpklAxBpSN5CYFMppBbUmUS3YSzThOwkTbnrTVnjAWGAxf5O
         jHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X9ahfWfDQhOmKJNiizLrRNetA2G5KibJzsld/RF0MzM=;
        b=J59a1CG2YsEzWirq0iQtvHr0xftPpGSfZp+q1eEl4I3HWnVgLaMljQvQxcow/R8Lt5
         ix87svZpDrNXWh92LaxE1PJWpjp7PHkrscP0D/TieSKHj5VgqQqXPGc9pcq6SzCJeb1N
         O36OADB9ldOuAeUf2nqSGHGx3t3M3v/R4JmaDraH5Vzo1Rm9GI9pYRb1zSAJYgUDwW+X
         roeJWegUByQ29NVRdHTUY2ZLhDp3kM+M4kGn1oYAU5J3h7dYQq+piLSt7/eBwR9giVCd
         hOKnEty+xh1B1zvpAwtWRXxCH4PuSCpM+dj86KXfkAaWV4jrOcz6iCKskZ+WblcllZYC
         4yPA==
X-Gm-Message-State: AOAM5329n9tah2gQcEe4qrP4MTZwO5EF0mna+BYp5ei8IRgF8GY+a+JH
	TO4nCVn+8pmhxUJspw0oDZYlHMF0DSc5kZd7ZU8=
X-Google-Smtp-Source: 
 ABdhPJzxD+74W3oruRr3iR/GSl6oTVVVhozPyJosG26GaFTXQy/4EwnOcMgIBO/qqThBekKNRGwVWeTQ97JM9r+NTm8=
X-Received: by 2002:a67:c11e:: with SMTP id d30mr36189639vsj.1.1634653163639;
 Tue, 19 Oct 2021 07:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
 <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
 <CANNYZj8Fns4xWre3_ajv-5QADpCi0f+WS2wRXCKXezOgj5fhzg@mail.gmail.com>
 <0bddcbc4-cf11-39da-5797-131fc59d7f6f@weidmueller.com>
 <CANNYZj_Xudaobe6W2TTnugjovq3KcHWBYsvZ8kS0kYZaWwkLCw@mail.gmail.com>
 <AM9PR09MB464243B2852B92E67D825612A8AF9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <71df6b93-bdcc-b09f-48c7-3ec822ef3228@weidmueller.com>
 <AM9PR09MB4642A8B32B686649507B9406A8B09@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CANNYZj9eeW4+uJ=-fB1pDZq4Qa0EbgwRCCXXiEjrzuGL-jcq3w@mail.gmail.com>
 <89e69707-d624-865d-f306-00ef8018a8de@weidmueller.com>
In-Reply-To: <89e69707-d624-865d-f306-00ef8018a8de@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Oct 2021 16:19:11 +0200
Message-ID: 
 <CANNYZj8k7YYnOC+Kb_h=t9M_f3WXEiAZRRF_5Y4284AezTDfMw@mail.gmail.com>
Subject: Re: [OE-core] Improve npm support to run build scripts
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Konrad Weihmann <kweihmann@outlook.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
	chuckwolber@gmail.com, oecore.mailinglist@gmail.com
Content-Type: multipart/alternative; boundary="0000000000002654be05ceb55989"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 14:19:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157118

--0000000000002654be05ceb55989
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Oct 2021 at 14:52, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> How should we run build scripts which need native npm packages and how
> should we handle licenses of build and runtime packages?
>
> A simplified node.js flow looks like the following
>
> cd ${S}
> rm -rf node_modules
> npm install --arch=$NPM_BUILD_ARCH --dev
> npm run-script --arch=$NPM_BUILD_ARCH build
> rm -rf node_modules
> npm install --arch=$NPM_TARGET_ARCH --global <OR> cp -r dist/* ${D}
>
> Should we split it into two recipes or should we handle everything in a
> single recipe?
>
> Is it accepted to use the output of a native recipe as source for an
> target recipe?
>

If that output is placed in a reasonable place in sysroot-destdir/ and
pulled in via DEPENDS, then yes, that's fine. But it's also okay to do the
build in two steps like above from a single recipe - there are more than a
few recipes where native helper binaries are built to aid with the target
build, typically the build system itself is able to use BUILD_CC for it, or
a custom task is written where CC is set to BUILD_CC explicitly.

I think you should experiment with both options.

Alex

--0000000000002654be05ceb55989
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 19 Oct 2021 at 14:52, Stefan Herbrechtsmeier &lt;<a href=3D"=
mailto:stefan.herbrechtsmeier-oss@weidmueller.com">stefan.herbrechtsmeier-o=
ss@weidmueller.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
How should we run build scripts which need native npm packages and how <br>
should we handle licenses of build and runtime packages?<br>
<br>
A simplified node.js flow looks like the following<br>
<br>
cd ${S}<br>
rm -rf node_modules<br>
npm install --arch=3D$NPM_BUILD_ARCH --dev<br>
npm run-script --arch=3D$NPM_BUILD_ARCH build<br>
rm -rf node_modules<br>
npm install --arch=3D$NPM_TARGET_ARCH --global &lt;OR&gt; cp -r dist/* ${D}=
<br>
<br>
Should we split it into two recipes or should we handle everything in a <br=
>
single recipe?<br>
<br>
Is it accepted to use the output of a native recipe as source for an <br>
target recipe?<br></blockquote></div><div class=3D"gmail_quote"><br></div><=
div class=3D"gmail_quote">If that output is placed in a reasonable place in=
 sysroot-destdir/ and pulled in via DEPENDS, then yes, that&#39;s fine. But=
 it&#39;s also okay to do the build in two steps like above from a single r=
ecipe - there are more than a few recipes where native helper binaries are =
built to aid with the target build, typically the build system itself is ab=
le to use BUILD_CC for it, or a custom task is written where CC is set to B=
UILD_CC explicitly.</div><div class=3D"gmail_quote"><br></div><div class=3D=
"gmail_quote">I think you should experiment with both options.<br></div><di=
v class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div>=
</div>

--0000000000002654be05ceb55989--

