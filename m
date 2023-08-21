Return-Path: <Markus.Niebel@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF6DEE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 10:26:23 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.7900.1692613573172384022
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 03:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=nvHlr/LJ;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: markus.niebel@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1692613573; x=1724149573;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GBwlyRO2rFrkLp49JjEneEv8hiHlM9uH64LU8jnst7M=;
  b=nvHlr/LJ/goBgpZmVOBUvK6pmeoTPiH9AwmHQ3yDtrBGqXI3oSCMh+KF
   JdDPEKtJnbOw6utG1rcqDgZr8ifsvtVhHRZ3aL2TIBmQr98CYmNdvQ+sV
   eGmUhvmssVTq/OkKaYxaKZAGdc4o+RSgY6vT5jWLKmhg550OBlL65MQ+Q
   KIt7p1/eOsaS06n2AU5K/8CWOrlYtqj4oDQSKInUrtNm1twPtFw35CmKj
   Zg1EQGQrbEvSE29TR3t/hUggzO9w2jKQ2qAp1gai6ya8xK8zzQgHj278b
   FGF0poJC88/2YXkhVQudvHc1a7NPjhI9g3xvqJWpR0x79ZDpvykt3t1hm
   w==;
X-IronPort-AV: E=Sophos;i="6.01,189,1684792800"; 
   d="scan'208";a="32538003"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Aug 2023 12:26:11 +0200
Received: from NIEBEL-W3.tq-net.de (NIEBEL-W3.tq-net.de [10.123.53.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8C645280075;
	Mon, 21 Aug 2023 12:26:11 +0200 (CEST)
Message-ID: <d61668104287bd42d63aa28b8ef75ef946dde1a7.camel@ew.tq-group.com>
Subject: Re: Re: [OE-core] [PATCH] wic: fix wrong attempt to create file
 system in upartitioned regions
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "oss@ew.tq-group.com"
	 <oss@ew.tq-group.com>
Date: Mon, 21 Aug 2023 12:26:11 +0200
In-Reply-To: <CANNYZj8_T6g2Y891K3Qm0s2H5rkhaZV6ewh=m57HRDpT6W3uzg@mail.gmail.com>
References: <20230818114413.3236712-1-Markus.Niebel@ew.tq-group.com>
	 <CANNYZj8_T6g2Y891K3Qm0s2H5rkhaZV6ewh=m57HRDpT6W3uzg@mail.gmail.com>
Organization: TQ Systems GmbH
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 10:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186428


Hello Alexander,

Am Freitag, dem 18.08.2023 um 11:52 +0000 schrieb Alexander Kanavin:
> 
> Does this mean there is a missing test for wic? Can you add one?
> 

sorry for being not an expert. I hope the basic test I will send with
v2 of the patch is usable as a starting point.

> Alex
> 

Markus

> On Fri, 18 Aug 2023 at 13:44, Markus Niebel
> <Markus.Niebel@ew.tq-group.com> wrote:
> > The kickstart parser defaults fstype to "vfat". This leads to an
> > attempt
> > to create an empty file system even for regions configured with "
> > --no-table"
> > if used without fstype when no --sourceparams given.
> > 
> > The fix tests for fstype "none" or no_table in Partition prepare
> > method.
> > This will omit the file system creation an the potential error for
> > small
> > region with --no-table option.
> > 
> > Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > ---
> >  scripts/lib/wic/partition.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/lib/wic/partition.py
> > b/scripts/lib/wic/partition.py
> > index bda4aef1b4..f11c393df5 100644
> > --- a/scripts/lib/wic/partition.py
> > +++ b/scripts/lib/wic/partition.py
> > @@ -134,7 +134,7 @@ class Partition():
> >              self.update_fstab_in_rootfs = True
> > 
> >          if not self.source:
> > -            if self.fstype == "none":
> > +            if self.fstype == "none" or self.no_table:
> >                  return
> >              if not self.size and not self.fixed_size:
> >                  raise WicError("The %s partition has a size of
> > zero. Please "
> > --
> > 2.25.1
> > 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


