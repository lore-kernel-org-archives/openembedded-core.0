Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B328EC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 12:05:41 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91758.1783080334578101172
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 05:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=MlZS7XfS;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OBRpizhkpg/nvrWdbafkvB4tlDypFo7vhjg3MseNs+0=; b=MlZS7XfSjSThNBio9dq+KZkxuV
	DTyYTPCwqzxt/nsBVA6L0GYXOnHaO6vbR9PLpX/QWOxK1JBQUPuA5yFtL5HQ1mPtY35Lv4HtKCkAW
	8SqK0kkxa7OcqCbAU/jTxKuVl+gJS7JUE2g2K6DRk05pl6LuhmVeB2f+9qkGID3xLBLCboShHZBIo
	xTc6hTkun4S17WkEr3uTBazlkIINXKWM4q6ZwWMvv65R8RA8b66NQAS4aJwmtcIvjb7J++j5pdgkj
	EnODJVbEMS5UpLfsPBHQ8izwTDaJT4RbXWiZQunF3PfNRg3VSjTxD4QIy0RERfknGQll1Ers9m3Ng
	OH2DeVrg==;
Received: from bras-base-otwaon0916w-grc-40-70-27-65-4.dsl.bell.ca ([70.27.65.4]:60534 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wfceC-00000006xks-0sQi
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jul 2026 08:05:32 -0400
Date: Fri, 3 Jul 2026 08:05:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: possibly silly question related to addtask and dependencies
Message-ID: <854ffc30-e63b-8a62-56b3-b3bf1930bf0b@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 12:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240107


  poring over kernel-related tasks and i see this snippet in
kernel-yocto.bbclass:

addtask kernel_metadata after do_validate_branches do_unpack before do_patch
do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
do_validate_branches[depends] = "kern-tools-native:do_populate_sysroot"

 both of the kernel_metadata and validate_branches tasks have a
dependency of "kern-tools-native:do_populate_sysroot", but since:

"addtask kernel_metadata after do_validate_branches ..."

is that dependency for kernel_metadata necessary? clearly, it doesn't
hurt but, technically, is it superfluous?

rday

