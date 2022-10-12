Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A67C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 22:34:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.962.1665614070551334696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 15:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E6iHL7XP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F37F240002;
	Wed, 12 Oct 2022 22:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665614068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=42XHhksShSkiXuE67tX0YiirL166IRS7EMrfjzVus6I=;
	b=E6iHL7XPjpkthAq+R8rtWyTfTXJqj4JQa2V5FPcnip93/S2HDWg6+HrjMtdcI6lrW2OZ9y
	2by0GfgAEiPtJZ/JOaP6I2v76cRUosqzL1gjjtd0hZc/tMmKBwMWzsIt+lkabv8J7eRkrm
	Pw7lj4A8b+hpZ5IjEpyb3RPEMJR/oAhaxFXmJDZNOAmpEsESYdSuszVXM5zQTY0wUlP5Sy
	FVMEKrAMe9lpHME6bAxrb3W9CPQfu/iUjg1s6UEZdSo07fFjAgiVZftyjwoF8e5tsy9iNu
	I+A4KuIxaTn4lwtt4koHJBzS0XhRmmPwnWEqWl1W3KqZYkclyHVOTLXS6SpYiA==
Date: Thu, 13 Oct 2022 00:34:27 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Liam Beguin <liambeguin@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org,
	peter.kjellerstedt@axis.com
Subject: Re: [OE-core] [PATCH v3] meson: make wrapper options sub-command
 specific
Message-ID: <Y0dA8wsNseUX3BKo@mail.local>
References: <20220929025056.2799287-1-liambeguin@gmail.com>
 <Y0Xl75mvvCkli/9d@shaak>
 <CANNYZj81k8JC1UEGCtujXJjvRgbBw+FBdRYp-qbQSS=i2Xsdtg@mail.gmail.com>
 <Y0c5Ngq/bCoi9KhY@shaak>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0c5Ngq/bCoi9KhY@shaak>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 22:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171677

On 12/10/2022 18:01:26-0400, Liam Beguin wrote:
> Hi Alex,
> 
> On Wed, Oct 12, 2022 at 09:46:46AM +0200, Alexander Kanavin wrote:
> > No one seems to have objections, it's that there is no explicit
> > confirmation that your patch (or anyone's) is in staging branches, and
> > integration is currently on pause for a couple weeks.
> 
> Understood, thanks for taking the time to explain.
> I'll keep monitoring the tree.

It is actually the first oe-core patch we carry in master-next because
it didn't make langdale. It will get applied after the release.

> 
> Cheers,
> Liam
> 
> > Alex
> > 
> > On Tue, 11 Oct 2022 at 23:53, Liam Beguin <liambeguin@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Sep 28, 2022 at 10:50:56PM -0400, Liam Beguin wrote:
> > > > The meson-wrapper adds setup options to facilitate cross-compilation.
> > > > The current options are exclusive to the setup sub-command and might
> > > > cause issues with other sub-commands.
> > > >
> > > > Update the wrapper to make options sub-command specific.
> > > >
> > > > Signed-off-by: Liam Beguin <liambeguin@gmail.com>
> > > > ---
> > > >  .../meson/meson/meson-wrapper                 | 21 +++++++++++++++----
> > > >  1 file changed, 17 insertions(+), 4 deletions(-)
> > >
> > > Any comments on this patch?
> > >
> > > Cheers,
> > > Liam
> > >
> > > > diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
> > > > index c62007f5077e..fca64a569299 100755
> > > > --- a/meta/recipes-devtools/meson/meson/meson-wrapper
> > > > +++ b/meta/recipes-devtools/meson/meson/meson-wrapper
> > > > @@ -5,7 +5,7 @@ if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
> > > >  fi
> > > >
> > > >  if [ -z "$SSL_CERT_DIR" ]; then
> > > > -    export SSL_CERT_DIR="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/"
> > > > +    export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/etc/ssl/certs/"
> > > >  fi
> > > >
> > > >  # If these are set to a cross-compile path, meson will get confused and try to
> > > > @@ -13,7 +13,20 @@ fi
> > > >  # config is already in meson.cross.
> > > >  unset CC CXX CPP LD AR NM STRIP
> > > >
> > > > +for arg in "$@"; do
> > > > +    case "$arg" in
> > > > +    -*) continue ;;
> > > > +    *) SUBCMD="$arg"; break ;;
> > > > +    esac
> > > > +done
> > > > +
> > > > +if [ "$SUBCMD" = "setup" ] || [ -d "$SUBCMD" ]; then
> > > > +    MESON_SUB_OPTS=" \
> > > > +        --cross-file="$OECORE_NATIVE_SYSROOT/usr/share/meson/${TARGET_PREFIX}meson.cross" \
> > > > +        --native-file="$OECORE_NATIVE_SYSROOT/usr/share/meson/meson.native" \
> > > > +        "
> > > > +fi
> > > > +
> > > >  exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
> > > > -     --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
> > > > -     --native-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
> > > > -     "$@"
> > > > +    "$@" \
> > > > +    $MESON_SUB_OPTS
> > > >
> > > > base-commit: a2659cc2bf5d3f1cedf5c52c3b45e0427d40732d
> > > > --
> > > > 2.37.1.223.g6a475b71f8c4
> > > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#171643): https://lists.openembedded.org/g/openembedded-core/message/171643
> > > Mute This Topic: https://lists.openembedded.org/mt/93987385/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

