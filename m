Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E99C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 23:17:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.6919.1706915840036295206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 15:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I5RWACcV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BD8FFF804;
	Fri,  2 Feb 2024 23:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706915838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9KLYAHASDT0OQDocfIjHLMKFqnMk4RcWS1F1nM/kpS0=;
	b=I5RWACcVGajhMDTD0lc/C4XMosrLKuhSZaQy9XDK1QBb49Qj5Dagnj4VyFb9VkPhjx+kir
	/HTNgTb5IsYWL+44/SMgBW96SO2JVh/xFfFXB2Yyw4DjpDqPHkiDei4qtDFqtjFEmye5Hp
	ry2tCqQi5UcldbdHYetNNAeBS8TqgsmJ9f/pibYSIwchMuf3LqaYTjAjdLKPTbyXdWXPrw
	dMPT8074OTtBuR7MgsJyVnxwKkEqiNFGPKILP8X53ZCPnDqUoUXNaRayzBGaFeLvN+a5e1
	3wMV4CbF+wB7+FnEjWS0Xh0izIodpm1EOV8alooKBDg/1ZN1tIk9xaEcmqqqKA==
Date: Sat, 3 Feb 2024 00:17:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Alex Stewart <alex.stewart@ni.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] package_manager: ipk: add
 OPKG_MAKE_INDEX_EXTRA_PARAMS variable
Message-ID: <202402022317188735e05d@mail.local>
References: <20240202132434.1787053-1-martin.jansa@gmail.com>
 <baca486f-589d-4246-8cbf-d42ee8dcc7ec@ni.com>
 <CA+chaQeksKOt81g0egdANw4r6r7uP9PqVSkVz29ftUL4vmpobw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+chaQeksKOt81g0egdANw4r6r7uP9PqVSkVz29ftUL4vmpobw@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 23:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194820

On 02/02/2024 17:06:12+0100, Martin Jansa wrote:
> Alex: thanks for review
> 
> I'll send v2 shortly, because now while testing without this variable set
> at all it fails with:
> opkg-make-index: error: unrecognized arguments: None
> so will add weak assignment to empty before the use.

Yes, I just hit that one too..

> 
> On Fri, Feb 2, 2024 at 4:40 PM Alex Stewart <alex.stewart@ni.com> wrote:
> 
> > ACK from me.
> >
> > It's a little strange that we wouldn't just have a
> > PACKAGE_FEED_PRESERVE_USER_FIELDS variable. But I understand that
> > wouldn't work as well for how the RPM version of this parameter is defined.
> >
> > On 2/2/24 08:24, Martin Jansa via lists.openembedded.org wrote:
> > > * can be used to pass e.g. -f param to preserve user-defined fields
> > >    in the index as added in:
> > >
> > https://git.yoctoproject.org/opkg-utils/commit/opkg-make-index?id=13f6281d24e17199e0fef6c2984419372ea0f86f
> > >
> > > * otherwise it will show a lot of messages like:
> > >    "Lost field Author <value>"
> > >    for every package in the feed
> > >
> > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > ---
> > >   meta/lib/oe/package_manager/ipk/__init__.py | 5 +++--
> > >   1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/lib/oe/package_manager/ipk/__init__.py
> > b/meta/lib/oe/package_manager/ipk/__init__.py
> > > index 8fcbad56aa..c35c90ce42 100644
> > > --- a/meta/lib/oe/package_manager/ipk/__init__.py
> > > +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> > > @@ -16,6 +16,7 @@ class OpkgIndexer(Indexer):
> > >                        ]
> > >
> > >           opkg_index_cmd = bb.utils.which(os.getenv('PATH'),
> > "opkg-make-index")
> > > +        opkg_index_cmd_extra_params =
> > self.d.getVar('OPKG_MAKE_INDEX_EXTRA_PARAMS')
> > >           if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
> > >               signer = get_signer(self.d,
> > self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
> > >           else:
> > > @@ -41,8 +42,8 @@ class OpkgIndexer(Indexer):
> > >                   if not os.path.exists(pkgs_file):
> > >                       open(pkgs_file, "w").close()
> > >
> > > -                index_cmds.add('%s --checksum md5 --checksum sha256 -r
> > %s -p %s -m %s' %
> > > -                                  (opkg_index_cmd, pkgs_file,
> > pkgs_file, pkgs_dir))
> > > +                index_cmds.add('%s --checksum md5 --checksum sha256 -r
> > %s -p %s -m %s %s' %
> > > +                                  (opkg_index_cmd, pkgs_file,
> > pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))
> > >
> > >                   index_sign_files.add(pkgs_file)
> > >
> > >
> > > 
> > >
> >
> > --
> > Alex Stewart
> > Software Engineer - NI Real-Time OS
> > NI (National Instruments)
> >
> > alex.stewart@ni.com
> >
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194806): https://lists.openembedded.org/g/openembedded-core/message/194806
> Mute This Topic: https://lists.openembedded.org/mt/104118971/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

