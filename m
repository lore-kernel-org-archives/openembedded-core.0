Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2F5EB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 07:40:43 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.5942.1686728439428357471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 00:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SUbywcH8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686728436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6MpPWVVaY4v9Wx6rU9+asY0ONbGqb69AgLum2UCb6I=;
	b=SUbywcH8y+UPig/BJi+sgtun2qCIlAY872Lvhu7rYKATNIEtrIzR9uvofd7zhgVshAk7O/
	b9Aqd5/g+gWGEh9weGikkVk+nWLXSiE98IYad0j32UaQnw+foEwjdRjJOngvyImFBF+Kru
	RRAtnqolzWb9DquZblC0O1pFVQdudWG5xGGLvxbEH9QPDgaDhgf8wKqW6fw+ssWBJvl9lv
	vw5JO5xtKpCJV6xuj45SMglihwpHgKe5qhIEToUErgByjNe3zPPnO9DKP7F9FFYR4Q3pm0
	7MoQb5wLF2eUYV/GoJqVx4k26PVF5Mjhpd572pWZdfNiikdmW4HAaZjL9gIGDw==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DA8C240003;
	Wed, 14 Jun 2023 07:40:36 +0000 (UTC)
Date: Wed, 14 Jun 2023 09:40:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] parted: Add missing libuuid to linker cmdline
 for libparted-fs-resize.so
Message-ID: <20230614074036d340992b@mail.local>
References: <20230612181054.674846-1-raj.khem@gmail.com>
 <A617FA16-34E1-4971-90D8-E696887211D0@arm.com>
 <CAMKF1spAoEU6V6RRnDpFQgAFSuR1t=Qk9d0kM4=KvzZU7Kg8bQ@mail.gmail.com>
 <CAMKF1spO=6ocVscwnbX4qAMCJkySbDWjjJ5M+2CjXZW0ECExpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1spO=6ocVscwnbX4qAMCJkySbDWjjJ5M+2CjXZW0ECExpQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 07:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182737

On 13/06/2023 08:16:48-0700, Khem Raj wrote:
> On Tue, Jun 13, 2023 at 6:55 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Exactly I can rebase and send v2
> >
> 
> I think Alex already did it on his master-next branch here
> https://git.yoctoproject.org/poky-contrib/commit/?h=abelloni/master-next&id=9a266798a4f4a9aacc80297af689c0ce254e09f1
> 

Yeah, let me know if I didn't do the correct thing.

> > On Tue, Jun 13, 2023 at 3:30 AM Ross Burton <Ross.Burton@arm.com> wrote:
> >>
> >> On 12 Jun 2023, at 19:10, Khem Raj via lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> wrote:
> >> >
> >> > diff --git a/meta/recipes-extended/parted/parted_3.5.bb b/meta/recipes-extended/parted/parted_3.5.bb
> >> > index f403840d3c2..b269c143b41 100644
> >> > --- a/meta/recipes-extended/parted/parted_3.5.bb
> >> > +++ b/meta/recipes-extended/parted/parted_3.5.bb
> >> > @@ -9,6 +9,7 @@ DEPENDS = "ncurses util-linux virtual/libiconv"
> >> > SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
> >> >            file://fix-doc-mandir.patch \
> >> >            file://autoconf-2.73.patch \
> >>   ^^^^
> >>
> >> Doesn’t apply cleanly as this patch doesn’t exist in master.  I guess these build on top of a series testing the new autoconf?
> >>
> >> Ross

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182719): https://lists.openembedded.org/g/openembedded-core/message/182719
> Mute This Topic: https://lists.openembedded.org/mt/99489278/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

