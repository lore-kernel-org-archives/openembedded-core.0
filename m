Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950ACC4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 22:26:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.4297.1669069605272512837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 14:26:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QnzHyTF2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 20C3E240003;
	Mon, 21 Nov 2022 22:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669069603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vDNbqJZXa0eBN7uW6bi68L8PP29oyH8M68iohMHU1i0=;
	b=QnzHyTF2C0e5RPXq+nVn6DwjBjp/KwPzAFYr6xxKAzwGO8B1afHynghJbfXEwFwN4l1akI
	IZ4Mjbhut5X8Qq7FnE/8uRTYmeFY3YM6jo/O/HGnIQrylL2r67CoRgcNrbCGl2fl+WOyNQ
	KlUu9ZT/ub/vOvC58r3iDKMv4sYhAFRrbX9+1FIhoB+TGaVtlEDgvM+e70vSMv6VPhwNd1
	Xb/WZRKU1MpmIVEA3bamlZXFwbO3ZFODjhTM3ysQHxN2sLRQx3jQeQwRTM+/iLtVrIj/BW
	9HD8qimGPmrIBrUaeDuF6yhR09jZhZhiP+27gxUWtAp7RuFjbb4O+cyIESb5fg==
Date: Mon, 21 Nov 2022 23:26:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv2] python3: add ${bindir}/python symlink
Message-ID: <Y3v7IhPY6N3KMvM7@mail.local>
References: <20221120181041.351136-1-f_l_k@t-online.de>
 <Y3toaqE7jvGlerH2@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3toaqE7jvGlerH2@mail.local>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 22:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173662

On 21/11/2022 13:00:43+0100, Alexandre Belloni wrote:
> Hello,
> 
> On 20/11/2022 19:10:41+0100, Markus Volk wrote:
> > Currently /usr/bin/python is provided by the python2 package. If python2
> > is not installed, the built image lacks a provider for it.
> > This results in failed scripts when using '/usr/bin/python' shebang.
> > 
> > This patch adds a /usr/bin/python symlink for python3 to fix this issue.
> 
> I think this is the cause of the following error:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/5098/steps/11/logs/stdio

Actually not, this error needs more investigation

> 
> > 
> > The link is created with relative path because using an absolute path would fail
> > for native and nativesdk.
> > 
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
> >  meta/recipes-devtools/python/python3_3.11.0.bb             | 4 ++++
> >  2 files changed, 5 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> > index 64203cf0fc..7b6f509a45 100644
> > --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> > +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> > @@ -203,6 +203,7 @@
> >          "files": [
> >              "${bindir}/python${PYTHON_MAJMIN}",
> >              "${bindir}/python${PYTHON_MAJMIN}.real",
> > +            "${bindir}/python",
> >              "${bindir}/python3",
> >              "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
> >              "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
> > diff --git a/meta/recipes-devtools/python/python3_3.11.0.bb b/meta/recipes-devtools/python/python3_3.11.0.bb
> > index 92a1f69320..fec6705105 100644
> > --- a/meta/recipes-devtools/python/python3_3.11.0.bb
> > +++ b/meta/recipes-devtools/python/python3_3.11.0.bb
> > @@ -144,6 +144,7 @@ do_install:prepend() {
> >  
> >  do_install:append:class-target() {
> >          oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
> > +        ln -sf ./python3 ${D}${bindir}/python
> >  }
> >  
> >  do_install:append:class-native() {
> > @@ -156,6 +157,7 @@ do_install:append:class-native() {
> >          # (these often end up too long for the #! parser in the kernel as the
> >          # buffer is 128 bytes long).
> >          ln -s python3-native/python3 ${D}${bindir}/nativepython3
> > +        ln -sf ./python3-native/python3 ${D}${bindir}/nativepython
> >  
> >          # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000 of them
> >          # and the overhead in each recipe-sysroot-native isn't worth it, particularly
> > @@ -213,6 +215,7 @@ do_install:append() {
> >  }
> >  
> >  do_install:append:class-nativesdk () {
> > +    ln -sf ./python3 ${D}${bindir}/python
> >      # Make sure we use /usr/bin/env python
> >      for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
> >           sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> > @@ -376,6 +379,7 @@ RRECOMMENDS:${PN}-crypt:append:class-nativesdk = " ${MLPREFIX}openssl ${MLPREFIX
> >  
> >  # For historical reasons PN is empty and provided by python3-modules
> >  FILES:${PN} = ""
> > +RPROVIDES:${PN} = "${bindir}/python"
> >  RPROVIDES:${PN}-modules = "${PN}"
> >  
> >  FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
> > -- 
> > 2.34.1
> > 
> 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#173641): https://lists.openembedded.org/g/openembedded-core/message/173641
> > Mute This Topic: https://lists.openembedded.org/mt/95156519/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

