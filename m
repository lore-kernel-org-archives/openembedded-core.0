Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFC0C4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 14:07:05 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.12157.1705586820167423112
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 06:07:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ABdufxmF;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gkCiEfABwgZAFMO/+V12An4+MF5lFnoIxAXerh7+Tr8=; b=ABdufxmFIa/rJEFYAi9gh0anMi
	1JwhlNrFtHfnPpi/UP76Yngb4NZ0+m8OVe3WJv18fgKQwFg3ApWuukNCNpLU15pO+j7WqTMQx81wk
	Xxi3aR9/RG7efr4+4rPT8ddxFyxtGdnc6l2oRWvMO5aeVscIivwrI4kDs0z4L4diwKr05Q6QohfPJ
	pAM7hlT20N4r2tWJmCNL2bHYsWf04qqkAy6qMyzgqoi1b1qUVlklyPoM8NT27Rd7kCwMzZDHZiLOl
	nFxe5lm2VOYbYbmuomWgqzVhYiFvvAit1fHb3nsEy22BSGz4GykLKRDUKEK7fFnM38EI8JXj04ks3
	U9alqHYQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:49988 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rQT2m-00GgTE-2s;
	Thu, 18 Jan 2024 09:06:58 -0500
Date: Thu, 18 Jan 2024 09:06:57 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] want to confirm i'm using "externalsrc" and "bin_package"
 efficiently
In-Reply-To: <CANNYZj9aG5qcpe6PksShW4W69uk7EZ+j7yxHb43tgfDrk8ygFQ@mail.gmail.com>
Message-ID: <dcd19ed3-e2c7-d7c8-36f9-1e46c094379a@crashcourse.ca>
References: <dfcf7a4a-81b1-ff26-d14-923bf379025@crashcourse.ca> <CANNYZj9aG5qcpe6PksShW4W69uk7EZ+j7yxHb43tgfDrk8ygFQ@mail.gmail.com>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 14:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193985

On Thu, 18 Jan 2024, Alexander Kanavin wrote:

> Mono-repo seemed like a good idea at the time, I'm sure.
>
> I need to point out that externalsrc disables sstate and always
> rebuilds from scratch. Is that okay?

  just tested a bitbake on recipe after changing nothing:

Sstate summary: Wanted 96 Local 96 Mirrors 0 Missed 0 Current 100
(100% match, 100% complete)      | ETA:  0:00:00
Initialising tasks: 100%
|#########################################################################|
Time: 0:00:01
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 637 tasks of which 637 didn't need to
be rerun and all succeeded.

  then i made a trivial change to a single file in the source
directory and bitbake'd again:

Sstate summary: Wanted 103 Local 96 Mirrors 0 Missed 7 Current 93 (93%
match, 96% complete)        | ETA:  0:00:00
Removing 6 stale sstate objects for arch allarch: 100%
|###########################################| Time: 0:00:00
Removing 1 stale sstate objects for arch qemux86_64: 100%
|########################################| Time: 0:00:00
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 637 tasks of which 627 didn't need to
be rerun and all succeeded.
NOTE: Build completion summary:
NOTE:   do_populate_sysroot: 0.0% sstate reuse(0 setscene, 1 scratch)
NOTE:   do_create_spdx: 0.0% sstate reuse(0 setscene, 1 scratch)
NOTE:   do_create_runtime_spdx: 0.0% sstate reuse(0 setscene, 1
scratch)
NOTE:   do_package_qa: 0.0% sstate reuse(0 setscene, 1 scratch)
NOTE:   do_package: 0.0% sstate reuse(0 setscene, 1 scratch)
NOTE:   do_packagedata: 0.0% sstate reuse(0 setscene, 1 scratch)
NOTE:   do_package_write_rpm: 0.0% sstate reuse(0 setscene, 1 scratch)

  seems to be honouring sstate-cache.

rday

