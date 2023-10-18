Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131E3CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 16:28:28 +0000 (UTC)
Received: from smarthost01b.sbp.mail.zen.net.uk (smarthost01b.sbp.mail.zen.net.uk [212.23.1.3])
 by mx.groups.io with SMTP id smtpd.web11.285776.1697646502551943567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 09:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=kgIPGyh0;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.3, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01b.sbp.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1qt9PA-001h5n-F4;
	Wed, 18 Oct 2023 16:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:To:From:Date:Sender:Reply-To:CC:Content-ID:
	Content-Description; bh=ODLv+MvjQLjvfDRjCsP1zGsiMssjSu/MFkyoPcc5di4=; b=kgIPG
	yh02AenFuglgKy4UDC0xw1clVZa4x++X3xTb0Dmrh0mTBp+K7WnFNwo9EMJqZx/QJ+aC2ebnMp6sZ
	5kRKESMzWUdk6oD5R/aD6vAaN97qFuECiG/NeH4gVT7vMI9xvNCCxQ8Sus3Gy+W5LnbasCbzRtt13
	o/cBdLptj6rt0fEyBh1xT04BRV4f8c09Qqf2q8EkT/j1aWIn5kGBu78w+w6AYxFOIB5+6X/fJeSBG
	tFOFTxzJ434CUrIpsr7EX1+sHN3nDlP+mrG1bq7AjKxzDywgKYK4OXC55YP20apEg5kECnlPSnq3p
	ObQQbuahNe2+aUm0JkzB4Cx0obJOg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1qt9PA-008SNy-0H;
	Wed, 18 Oct 2023 17:28:20 +0100
Date: Wed, 18 Oct 2023 17:28:20 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Using devtool without an absolute path to the
 workspace in bblayers.conf
Message-ID: <ZTAHpJHbH0y9djT8@mcrowe.com>
References: <ZS_r0pnGHqlEg5Ru@mcrowe.com>
 <CAMKF1soLwhB_2oTi3APASkLiHdCkbWFKwASxuSGh2echBcCWJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1soLwhB_2oTi3APASkLiHdCkbWFKwASxuSGh2echBcCWJA@mail.gmail.com>
X-Originating-smarthost01b-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 16:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189412

On Wednesday 18 October 2023 at 09:19:32 -0700, Khem Raj wrote:
> On Wed, Oct 18, 2023 at 7:29 AM Mike Crowe via lists.openembedded.org
> <mac=mcrowe.com@lists.openembedded.org> wrote:
> >
> > I'm trying to work out how we can make use of devtool to make our lives
> > easier during development. In general it seems to work very well, but the
> > way that it modifies bblayers.conf to add an absolute path to the workspace
> > directory to BBLAYERS is incompatible with that file being held in a Git
> > repository and shared by multiple users in multiple trees. There's a high
> > risk that the file will accidentally be committed containing a path that's
> > only meaningful for a single user in a single source tree. All of our other
> > paths in bblayers.conf are relative to a variable that contains the path to
> > the top of the source tree.
> >
> > I can manually add ${TOPDIR}/workspace to BBLAYERS in bblayers.conf and
> > commit that, but unfortunately devtool insists on continuing to add the
> > absolute path since it doesn't know that's the same as ${TOPDIR}/workspace.
> >
> > I can set "workspace_path = workspace" in devtool.conf to use a relative
> > path, and that superficially works until externalsrc.bbclass gets upset
> > that the EXTERNALSRC is not an absolute path.
> >
> > I've tried teaching devtool to prepend ${TOPDIR} if the workspace directory
> > is not absolute when writing bblayers.conf, but it looks like I'd also need
> > to do so in many other places.
> >
> > My current workaround is just to add ${TOPDIR}/workspace to the committed
> > bblayers.conf myself and nobble devtool's _enable_workspace_layer with an
> > early return. This is ugly and we'd have to carry that change around
> > forever.
> >
> > Since I'm clearly swimming against the tide I'm left wondering whether I've
> > missed something. Is there a way to use devtool without having an absolute
> > path to the workspace in bblayers.conf?
> >
> > (At the moment I'm still using dunfell, but I looked at current master and
> > didn't spot anything that looked like it changed this behaviour.)
> 
> Perhaps an enhancement to not add the path if its already part of BBLAYERS
> might do it. You might also print a diagnostics about its pre-existence to make
> sure it's not accidental.

devtool already tries to do that. It doesn't work in this case since the
code compares the absolute path against the paths in bblayers.conf and
isn't in a position to expand variables at that point.

Thanks.

Mike.

