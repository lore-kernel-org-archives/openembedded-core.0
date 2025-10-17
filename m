Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10993CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 05:41:48 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.9128.1760679697829634117
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 22:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DdgnNJ2P;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7ED0BC041DA
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 05:41:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D19C606DB;
	Fri, 17 Oct 2025 05:41:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46E05102F2329;
	Fri, 17 Oct 2025 07:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760679695; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9PJ3MC+TL4VkxfsOL1J1m2imYbC2c5lxkewOAinkOtI=;
	b=DdgnNJ2P8cPVTxCWHVf4RrZCYzXToWR0HRAVIgjXYY7WkvADp5Nj67VyrV6WVVW0WT+89P
	G7f4iyMNdrCRHVAbdtm94DckKohqTpINXkAa7rxR+TIC8VoScZ5JTJfU5lDWVDgN3d/Z1B
	P87NpHbLOgrdr9fy5sLJ/KKXxW8NEtXauBnOyoUwWG8TwtvQD1C915ofP7z4gDY4g8wNPj
	Gf2ECqij/duDtm+CFz+IyqCHU4upi+PPf8e2e3uFh+8RKlZz86ZacHXtPigsSDIS93nd7f
	jf/jBHNoyfATwgdMx3d9YUI5PSVapk76CmCepBSkBD37bxTaE98sesMgMoBrgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 07:41:28 +0200
Message-Id: <DDKCUYGEIQSY.1VSVCA6M3O4JZ@bootlin.com>
Subject: Re: [PATCH v2 2/2] libxml2: upgrade 2.14.6 -> 2.15.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Hongxu Jia" <hongxu.jia@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251016074240.2464360-1-hongxu.jia@windriver.com>
 <20251016074240.2464360-2-hongxu.jia@windriver.com>
In-Reply-To: <20251016074240.2464360-2-hongxu.jia@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 05:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224992

On Thu Oct 16, 2025 at 9:42 AM CEST, Hongxu Jia wrote:
> Due to upstream [Remove LZMA support][1], drop option --without-lzma
>
> Due to upstream [disable python bindings by default][2] and are
> planned to be removed in the 2.16 release[3][4]. If we still enable
> python bindings by --with-python=3Dyes, due to upstream [doc: Build docs
> with Doxygen and xsltproc][5], build python binding requires doxygen
> otherwise build will fail, and we do not provide doxygen in oe-core,
> so remove python package directly.
>
> [1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf=
123eb7358690c214b0b
> [2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/fa931566d2f541d3162c7=
b98c8a12e6b2a6ae542
> [3] https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.news
> [4] https://gitlab.gnome.org/GNOME/libxml2/-/issues/891
> [5] https://gitlab.gnome.org/GNOME/libxml2/-/commit/bbe5827c94cc9b0e393ff=
3e6eef6dec2376317e2
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi Hongxu,

Thanks for the v2. It gets better, but now we do have some failing
ptests:

AssertionError:
Failed ptests:
{'libxml2': ['attribs.py',
             'build.py',
             'compareNodes.py',
             'ctxterror.py',
             'cutnpaste.py',
             'dtdvalid.py',
             'error.py',
             'inbuf.py',
             'indexes.py',
             'input_callback.py',
             'nsdel.py',
             'outbuf.py',
             'push.py',
             'pushSAXhtml.py',
             'pushSAX.py',
             'reader2.py',
             'reader3.py',
             'reader4.py',
             'reader5.py',
             'reader6.py',
             'reader7.py',
             'reader8.py',
             'readererr.py',
             'readernext.py',
             'reader.py',
             'regexp.py',
             'relaxng.py',
             'resolver.py',
             'schema.py',
             'serialize.py',
             'setup_test.py',
             'sync.py',
             'thread2.py',
             'tstLastError.py',
             'tstmem.py',
             'tst.py',
             'tstURI.py',
             'tstxpath.py',
             'unicode.py',
             'validate.py',
             'validDTD.py',
             'validRNG.py',
             'validSchemas.py',
             'walker.py',
             'xpathext.py',
             'xpathleak.py',
             'xpathns.py',
             'xpath.py',
             'xpathret.py']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/642
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2458
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2497

Can you have a look at these, please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


