Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDEFC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 09:28:56 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web09.5174.1646386135105339109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 01:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (unknown [81.20.119.6])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 7B64A5FA1D;
	Fri,  4 Mar 2022 10:28:52 +0100 (CET)
Message-ID: <07ec7ffbeea3b92bb84a71024bdccddc327b247f.camel@emlix.com>
Subject: Re: [OE-core][PATCH] copy_buildsystem: allow more layer paths
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: Andrej Valek <andrej.valek@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "richard.purdie@linuxfoundation.org"
 <richard.purdie@linuxfoundation.org>
In-Reply-To: <a6865397ca95fbe80336054fdc8486165a5e35f1.camel@siemens.com>
References: <20220302190554.1953968-1-dwagenknecht@emlix.com>
	 <a6865397ca95fbe80336054fdc8486165a5e35f1.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date: Fri, 04 Mar 2022 10:26:47 +0100
User-Agent: Evolution 3.36.5-0ubuntu1 
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 09:28:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162712

Hello Andrej,

On Thu, 2022-03-03 at 06:35 +0000, Andrej Valek wrote:
> Hi Daniel,
>=20
> Could you please give here the examples how the layer structure looks
> before and after change? I want to see how transformation looks like.

With a directory-structure like

/
=E2=94=9C=E2=94=80=E2=94=80 repo
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 layers
=E2=94=82       =E2=94=94=E2=94=80=E2=94=80 meta-my-layer
=E2=94=94=E2=94=80=E2=94=80 work
    =E2=94=9C=E2=94=80=E2=94=80 build
    =E2=94=94=E2=94=80=E2=94=80 layers
        =E2=94=94=E2=94=80=E2=94=80 external
            =E2=94=9C=E2=94=80=E2=94=80 meta-openembedded
            =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meta-networking
            =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 meta-oe
            =E2=94=94=E2=94=80=E2=94=80 poky
                =E2=94=94=E2=94=80=E2=94=80 meta

and

# Set through bitbake itself
COREBASE =3D "/work/layers/external/poky"
TOPDIR =3D "/work/build"
# Set in bblayers.conf
BBLAYERS =3D " \
    /repo/layers/meta-my-layer \
    /work/layers/external/meta-openembedded/meta-networking \
    /work/layers/external/meta-openembedded/meta-oe \
    /work/layers/external/poky/meta"

The resulting eSDK layers directory will look like this:

.
=E2=94=9C=E2=94=80=E2=94=80 meta-my-layer
=E2=94=9C=E2=94=80=E2=94=80 meta-openembedded
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meta-networking
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 meta-oe
=E2=94=94=E2=94=80=E2=94=80 poky
    =E2=94=94=E2=94=80=E2=94=80 meta

Without this patch the /repo/meta-my-layer layer broke the build:
> > This patch resolves issues like
> >   ERROR: my-image-1.0-r0 do_populate_sdk_ext: Failed to generate
> > filtered task list for extensible SDK:
> >=20
> >   ### Shell environment set up for builds. ###
> >   [...]
> >=20
> >   ERROR: bitbake failed:
> >   ERROR: The following layer directories do not exist:
> >   ERROR:    /build/tmp/work/my-board-linux/my-image/1.0-r0/sdk-
> > ext/image/tmp-renamed-sdk/layers/../../../repo/layers/meta-my-layer
> >   ERROR: Please check BBLAYERS in /build/tmp/work/my-board-linux/my-
> > image/1.0-r0/sdk-ext/image/tmp-renamed-sdk/conf/bblayers.conf
> >   ERROR: Logfile of failure stored in: /build/tmp/work/my-board-
> > linux/my-image/1.0-r0/temp/log.do_populate_sdk_ext.68844
> >=20

Without meta-my-layer this patch should not cause any change.

The alternative
> > Alternative to this patch:
> > Delete the whole else / elseif block. This would lead to a layer
> > structure in
> > the eSDK like
> >   layers/poky/meta
> >   layers/meta-networking
> >   layers/meta-oe
> > thus flattening the layer tree.
would remove the special casing in the implementation (except for COREBAS=
E
sublayers), thus resulting in the following layer structure in the eSDKs =
layers
directory:

.
=E2=94=9C=E2=94=80=E2=94=80 meta-my-layer
=E2=94=9C=E2=94=80=E2=94=80 meta-networking
=E2=94=9C=E2=94=80=E2=94=80 meta-oe
=E2=94=94=E2=94=80=E2=94=80 poky
    =E2=94=94=E2=94=80=E2=94=80 meta

--
Sincerely
Daniel Wagenknecht


