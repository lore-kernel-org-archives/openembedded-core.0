Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ABFCDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 14:44:41 +0000 (UTC)
Received: from smarthost01c.sbp.mail.zen.net.uk (smarthost01c.sbp.mail.zen.net.uk [212.23.1.5])
 by mx.groups.io with SMTP id smtpd.web11.29540.1697726676445484940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 07:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=ZSKq3a6l;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.5, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01c.sbp.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1qtUGH-002EH7-7e;
	Thu, 19 Oct 2023 14:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=AM8PhW6qZ5yEQLXc8ae1NWIAdsv6m9WN2F+4iCjf7sc=; b=ZSKq3
	a6lacPYX/E4S5rKLbDgP37+lDLylQewuF3PBjX9jjCuUqaQ3mLtdvyJbSPHGzNIVceEZGIdCVar6D
	3h8HCRKoUmOvj46p8N/vsC0MADbOpK97KvRSOeU3on2ZA9MgxnkiNPbTPJSoPGI9Ps2HfEGPkJGPU
	Yh4TkEVG5QX8W8i68RUqsz/sesTlgVlodnnn1ODcoggNb3eXhiaTJDyCwnR5/yK73SFj1NUwa4VuN
	x0m2U+/zhMFpICyzmj2d5QoQajyfU5aL6Jm4Nw91A3Yqs/cVy355KzpfiI1clKEfwpiI1NDczarH9
	r2dZUYV6FQLM9OKnh5AwhDg+b7VXA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1qtUGG-00AdXS-31;
	Thu, 19 Oct 2023 15:44:32 +0100
Date: Thu, 19 Oct 2023 15:44:32 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	Julien Stephan <jstephan@baylibre.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Using devtool without an absolute path to the
 workspace in bblayers.conf
Message-ID: <ZTFA0P4HlE6htl13@mcrowe.com>
References: <ZS_r0pnGHqlEg5Ru@mcrowe.com>
 <CAEHHSvYNpGQAE_jG2u__z9k3RrRLe2oeqXpb-bhZtrK-hG1srQ@mail.gmail.com>
 <ZTEiL700jPSsMuwA@mcrowe.com>
 <CANNYZj8e6Lqkb+D6RKhEtVidaMhRUgE3YKg=Jqa4kP-ghV6C9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8e6Lqkb+D6RKhEtVidaMhRUgE3YKg=Jqa4kP-ghV6C9w@mail.gmail.com>
X-Originating-smarthost01c-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 14:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189466

On Thursday 19 October 2023 at 14:51:56 +0200, Alexander Kanavin wrote:
> On Thu, 19 Oct 2023 at 14:33, Mike Crowe via lists.openembedded.org
> <mac=mcrowe.com@lists.openembedded.org> wrote:
> > We do need to modify bblayers.conf from time to time to add and remove
> > layers.
> >
> > Using templates might be possible, but it would appear that this would
> > force developers to manually incorporate changes (or just wipe their
> > bblayers.conf file) when the template changes. Just keeping bblayers.conf
> > under version control doesn't suffer from that problem.
> 
> Generally content of build/conf/, or anything else in build/ is not
> designed for being under version control. You may be able to get away
> with it by coincidence, but it's neither documented nor tested, and so
> any issues are your own.
> 
> I don't have a quick solution to ensure that templates and
> configurations coming from them are strictly in sync, but welcome to
> suggestions. People modify local.conf and bblayers.conf all the time
> as well for local experiments, you're simply not supposed to lock them
> down.

There's no problem with modifying them for local experiments, even if they
are under version control, but it's clear when those experiments need to be
committed that those files need to be committed too.

However, it's clear that I'm pushing against the tide. I'll stick with the
early-return hack in devtool for the short term to see if we come across
any other reasons to make changes or any other breakage. Once everything is
working I'll investigate our options for not keeping bblayers.conf under
version control.

Thanks for you help.

Mike.

