Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D539C54E71
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 08:00:23 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.3304.1748073616505001346
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 01:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=jEai2KaE;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x4M9VtRA+AdPdiyYBPrE/6nyp3pHJ9n9lxb4kHcy7I4=; b=jEai2KaE2gcnwtcMfZpxbhRKw/
	kLEhOAatPsH+gXwCwD7RDY62tQ/ncUh+O7C8CCrjkyR7FfbCfU+krEsg8pQuwdRU9deqx0C+m++RI
	dApGL8KVP+YRm8oPnS4VWIA16VUcCsp7q8oEvAxLRPgOtdr6CfZRY4NsYZwMJxlQVSuLk4sgIpiSR
	v2fv17fRWOTws8BHn7i5cTxeIlZ6Z00Af4/3UleXGRCsMeNdachZngHK4cEJ5gsNHlclfAachbOtn
	JWLxL5ypeXyRTUqHvs1BXWLgPUNsVkn3tHLgd4TgZ1XP8dmRg8TzdythMFbl+gNXD18K0URBP+O9V
	Sr62dvFw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:44476 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uIjne-00000002ZQA-1ay7
	for openembedded-core@lists.openembedded.org;
	Sat, 24 May 2025 04:00:14 -0400
Date: Sat, 24 May 2025 04:00:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Getting lots of "undefined reference" building gcc for qemuarm64 on
 Ubuntu 24.04
Message-ID: <49771c03-6f7e-84dd-91ca-6d15ba81b097@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 08:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217223


  Apologies if this is a well-known and resolved issue -- it's been a
while since I did a generic OE build (been working with Wind River
lately).

  On a fairly freshly-installed and fully-updated Ubuntu 24.04 laptop,
I wanted to do a demo of building a qemuarm64 core-image-minimal, so I
did all the regular steps, the build was chugging along, and failed
building gcc-15.1.0 with a pile of "undefined reference" errors like
this from the log.do_compile file:


/home/rpjday/oe/builds/qemuarm64/tmp/work/cortexa57-poky-linux/gcc/15.1.0/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/15.1.0/ld:
c/c-decl.o: in function `diagnose_mismatched_decls(tree_node*,
tree_node*, tree_node**, tree_node**) [clone .constprop.0]':
/usr/src/debug/gcc/15.1.0/gcc/../../../../../../../work-shared/gcc-15.1.0-r0/gcc-15.1.0/gcc/c/c-decl.cc:2292:(.text+0x33fc):
undefined reference to `c_addr_space_name(unsigned char)'

I'm sure it's something stupid on my part, I'm used to generic
core-image-minimal builds just working. This is using the master
branch of poky -- should I dial it back to a fixed release?

rday

