Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF68C636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 08:29:10 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.79056.1675758544167307733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 00:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ndEJ3FNS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 69323C000A;
	Tue,  7 Feb 2023 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675758541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IwNJuDVlpsl1fyy6X0hddpnRpWwgBxJ7E3VdFUmf8f0=;
	b=ndEJ3FNSLxlTp0b60Ku2WHO/gk2pdjA9ra4cp3uLsyrNKWu2NZbWgDTTF6C3r5tlPTMWXL
	IPcfyCfrcxSftdoD/fsJi74Kb7PRkfyMfEIGTRR2s7so+XGsdLeobh0nCSX0o7QNnz1+I/
	eWsz3VupwF5aFjOuIO/SSKlwcMQwR1uALElIVKQrgzEwrC9gAAkLk/NE/iPxir3SXQf7P9
	UDdiEKPhfWUwBJjLP7FeuUro/zbjKvEniuvL1VtujFiH1GNryk2V3rZTNJNfvxK1bC6SE0
	zXJ+C1+Rb5gSD/566hwSDiUqOaJ1Qk+8T91b6SdJImRWg1PnrX5rwD4JgpkuwA==
Date: Tue, 7 Feb 2023 09:28:59 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "jason.lau" <Haitao.Liu@windriver.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] libgit: add ptest for libgit2
Message-ID: <20230207092859.63f15a0a@booty>
In-Reply-To: <20230206084401.2055798-1-haitao.liu@windriver.com>
References: <20230206084401.2055798-1-haitao.liu@windriver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 08:29:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176804

Hello Jason,

On Mon, 6 Feb 2023 00:44:01 -0800
"jason.lau" <Haitao.Liu@windriver.com> wrote:

> Add ptest for libgit2.
> ALl test passed on a trial run and it took around 21m56s to execute so
> added curl-ptest to PTESTS_SLOW.
> 
> Signed-off-by: Liu Haitao <haitao.liu@windriver.com>

I have run this patch through the autobuilders and it shows a failed
ptest:

{'libgit2': ['submodule::modify::set_relative_url', 'worktree::worktree::path']}

Here are the build logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/4454/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/4651/steps/12/logs/stdio

The ptest log shows:

FAIL: submodule::modify::set_relative_url
    ---
    reason: |
      String mismatch: expected_value != buf.ptr
      '/tmp/libgit2_tests_xhUI5o/relative-url' != '/var/volatile/tmp/libgit2_tests_xhUI5o/relative-url' (at byte 1)
    at:
      file: '/usr/src/debug/libgit2/1.5.0-r0/tests/libgit2/config/config_helpers.c'
      line: 37
      function: 'assert_config_entry_value'
    ---

and:

FAIL: worktree::worktree::path
    ---
    reason: |
      String mismatch: git_worktree_path(wt) != expected_path.ptr
      '/var/volatile/tmp/libgit2_tests_xhUI5o/testrepo-worktree' != '/tmp/libgit2_tests_xhUI5o/testrepo-worktree' (at byte 1)
    at:
      file: '/usr/src/debug/libgit2/1.5.0-r0/tests/libgit2/worktree/worktree.c'
      line: 417
      function: 'test_worktree_worktree__path'
    ---

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

