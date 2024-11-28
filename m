Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B57D69116
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 15:23:38 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.96931.1732807410221750067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 07:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S1vlMyvV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 277C2E0004;
	Thu, 28 Nov 2024 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732807408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=equj9RQ0Bmmh5PklF3AWGiEmYBQgMnV5fLZfsusQLFM=;
	b=S1vlMyvVIJkm+8AWLlSXDp0Hly1BEd/FbRqA3HuSxuGH4pJv6cTdg/w78IU+fSc3UgR0jb
	ogJC3b/FsETUhJmVQjVndMIOkPwidyz+7f/bSwkcG3ZkD3AmoVV4c/tUwS9ND8G7yBAsmE
	PvSw0i/3nwSfAt10gLiRWaE9f1lCXOQZ5BCippDW/M+sqq1TbezQLQLyLgz60+qU5r/k/0
	zt4IegoTK3a3U4CSYqFu5Co6ELTb1P6s7nbSfgnQRulblrLGBH0LUG1tyNgft4uUWwWl2b
	zXgDk67a2tCmz7G+FrSLKwHJb1wWHXZ//vaorJc9mjNEmafee6OdvCOM9miGfQ==
Date: Thu, 28 Nov 2024 16:23:26 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/4] gnupg: upgrade 2.5.0 -> 2.5.1
Message-ID: <Z0iK7kmJ1PpkGXJf@bootlin-mathieu>
Mail-Followup-To: hongxu.jia@eng.windriver.com,
	openembedded-core@lists.openembedded.org
References: <20241127233600.4124020-1-hongxu.jia@windriver.com>
 <20241127233600.4124020-2-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127233600.4124020-2-hongxu.jia@windriver.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 15:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207992

On Wed, Nov 27, 2024 at 03:35:58PM -0800, hongxu via lists.openembedded.org wrote:
> Due to upstream [build: Remove configure option --enable-gpg-is-gpg2][1],
> drop option --enable-gpg-is-gpg2 and remove gpg2 installation
> 
> Due to upsream [doc: Remove included yat2m and build HTML versions of
> the man pages.][2], it used standard detection on yat2m other than build
> it from source. Because no native recipe provide yat2m in Yocto,
> explicitly disable doc via option --disable-doc
> 
> [1] https://github.com/gpg/gnupg/commit/2125f228d36c0882a87bce433a18253154653d50
> [2] https://github.com/gpg/gnupg/commit/60c541f5880e8c603ca9372d3ca8b7ad68b97018
> 

Hi,

I believe this patch is the source of some errors we get on the
autobuilder:

AssertionError: Command 'gpgconf --list-dirs --homedir /tmp/oeqa-feed-sign-pnrdr5tx; gpg -v --batch --homedir /tmp/oeqa-feed-sign-pnrdr5tx --import
/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2070984/meta-selftest/files/signing/key.secret' returned non-zero exit status 2:
sysconfdir:/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/gnupg-native/2.5.1/recipe-sysroot-native/etc/gnupg
bindir:/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2070984/tmp/work/x86_64-linux/gnupg-native/2.5.1/recipe-sysroot-native/usr/bin/../../usr/bin
libexecdir:/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/gnupg-native/2.5.1/recipe-sysroot-native/usr/libexec
libdir:/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/gnupg-native/2.5.1/recipe-sysroot-native/usr/lib/gnupg
datadir:/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/gnupg-native/2.5.1/recipe-sysroot-native/usr/share/gnupg
localedir:/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/gnupg-native/2.5.1/recipe-sysroot-native/usr/share/locale
socketdir:/run/user/6000/gnupg/d.3hczswacngxo5d1e9ddydbj1
dirmngr-socket:/run/user/6000/gnupg/d.3hczswacngxo5d1e9ddydbj1/S.dirmngr
keyboxd-socket:/run/user/6000/gnupg/d.3hczswacngxo5d1e9ddydbj1/S.keyboxd
agent-ssh-socket:/run/user/6000/gnupg/d.3hczswacngxo5d1e9ddydbj1/S.gpg-agent.ssh
agent-extra-socket:/run/user/6000/gnupg/d.3hczswacngxo5d1e9ddydbj1/S.gpg-agent.extra
agent-browser-socket:/run/user/6000/gnupg/d.3hczswacngxo5d1e9ddydbj1/S.gpg-agent.browser
agent-socket:/run/user/6000/gnupg/d.3hczswacngxo5d1e9ddydbj1/S.gpg-agent.yocto-native
homedir:/tmp/oeqa-feed-sign-pnrdr5tx
gpg: enabled compatibility flags:
gpg: keybox '/tmp/oeqa-feed-sign-pnrdr5tx/pubring.kbx' created
gpg: armor header: Version: GnuPG v1
gpg: sec  rsa2048/7B31316B5D64AD52 2015-10-14  testuser (nocomment) <testuser@testemail.com>
gpg: /tmp/oeqa-feed-sign-pnrdr5tx/trustdb.gpg: trustdb created
gpg: using pgp trust model
gpg: key 7B31316B5D64AD52: public key "testuser (nocomment) <testuser@testemail.com>" imported
gpg: no running gpg-agent - starting '/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/gnupg-native/2.5.1/recipe-sysroot-native/usr/bin/gpg-agent'
gpg: waiting for the agent to come up ... (5s)
gpg: waiting for the agent to come up ... (4s)
gpg: waiting for the agent to come up ... (3s)
gpg: waiting for the agent to come up ... (2s)
gpg: waiting for the agent to come up ... (1s)
gpg: can't connect to the gpg-agent: IPC connect call failed
gpg: no running gpg-agent - starting '/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/gnupg-native/2.5.1/recipe-sysroot-native/usr/bin/gpg-agent'
gpg: waiting for the agent to come up ... (5s)
gpg: waiting for the agent to come up ... (4s)
gpg: waiting for the agent to come up ... (3s)
gpg: waiting for the agent to come up ... (2s)
gpg: waiting for the agent to come up ... (1s)
gpg: can't connect to the gpg-agent: IPC connect call failed
gpg: error getting the KEK: No agent running
gpg: error reading '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2070984/meta-selftest/files/signing/key.secret': No agent running
gpg: import from '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2070984/meta-selftest/files/signing/key.secret' failed: No agent running
gpg: Total number processed: 0
gpg:               imported: 1
gpg:       secret keys read: 1


https://valkyrie.yoctoproject.org/#/builders/48/builds/464/steps/14/logs/stdio

Can you have a look at this error, please ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

