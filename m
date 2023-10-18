Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E19CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 14:29:47 +0000 (UTC)
Received: from smarthost01c.ixn.mail.zen.net.uk (smarthost01c.ixn.mail.zen.net.uk [212.23.1.22])
 by mx.groups.io with SMTP id smtpd.web11.282598.1697639380688035111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 07:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=b91+kRvd;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.22, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01c.ixn.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1qt7YJ-000w7t-2J
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Oct 2023 14:29:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=4lNjH4wZ/woJ0iY+seCo7fdivKaZP1udQiHF5GsWgjM=; b=b9
	1+kRvdIDDja3TVqsQa2zEY2V+HrEjko3HwguDcJXekR/BgfB9Y+40i4ZkL0+qX6QCRY5GqItKJdoF
	ovtZW9YnpXeksf2inM6Y9zWKephkoRufpv8LykPM54byfnLJxQP3O19vbSBvy2ZPTHrTBbes5LvaI
	FrRXm11WtlECOQqgsU84RYKDzNFVupQC7I+joLm2n0R6WEeqCNyPoUzz/p8eUp+i3o9Pw3FYvIWuy
	JndkJIAOF6A+PlUO3+y3llK7ufxssk5is91sRdAFoN4xGPH1EXUoXJ2HI3AEqMJ1+GE8Qs1OBOiC2
	NaDkCxy+QIbvP9KH1UN5cJFb7RnzWWpQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1qt7YI-008L1F-2o
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Oct 2023 15:29:38 +0100
Date: Wed, 18 Oct 2023 15:29:38 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Subject: Using devtool without an absolute path to the workspace in
 bblayers.conf
Message-ID: <ZS_r0pnGHqlEg5Ru@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01c-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 14:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189396

I'm trying to work out how we can make use of devtool to make our lives
easier during development. In general it seems to work very well, but the
way that it modifies bblayers.conf to add an absolute path to the workspace
directory to BBLAYERS is incompatible with that file being held in a Git
repository and shared by multiple users in multiple trees. There's a high
risk that the file will accidentally be committed containing a path that's
only meaningful for a single user in a single source tree. All of our other
paths in bblayers.conf are relative to a variable that contains the path to
the top of the source tree.

I can manually add ${TOPDIR}/workspace to BBLAYERS in bblayers.conf and
commit that, but unfortunately devtool insists on continuing to add the
absolute path since it doesn't know that's the same as ${TOPDIR}/workspace.

I can set "workspace_path = workspace" in devtool.conf to use a relative
path, and that superficially works until externalsrc.bbclass gets upset
that the EXTERNALSRC is not an absolute path.

I've tried teaching devtool to prepend ${TOPDIR} if the workspace directory
is not absolute when writing bblayers.conf, but it looks like I'd also need
to do so in many other places.

My current workaround is just to add ${TOPDIR}/workspace to the committed
bblayers.conf myself and nobble devtool's _enable_workspace_layer with an
early return. This is ugly and we'd have to carry that change around
forever.

Since I'm clearly swimming against the tide I'm left wondering whether I've
missed something. Is there a way to use devtool without having an absolute
path to the workspace in bblayers.conf?

(At the moment I'm still using dunfell, but I looked at current master and
didn't spot anything that looked like it changed this behaviour.)

Thanks.

Mike.

