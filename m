Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id F36807881D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 01:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 27F2620B15;
	Tue, 20 Feb 2018 01:20:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JMYOiTifiTxb; Tue, 20 Feb 2018 01:20:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E640320059;
	Tue, 20 Feb 2018 01:20:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7B05A1632C1; Mon, 19 Feb 2018 20:20:01 -0500 (EST)
Date: Mon, 19 Feb 2018 20:20:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20180220012001.GZ2786@denix.org>
References: <1519084455-3915-1-git-send-email-denis@denix.org>
	<CAP9ODKq7YyqaapLxxOrPo6WoNf6dTFpxkvQh1pF+yqJQxGA7jQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKq7YyqaapLxxOrPo6WoNf6dTFpxkvQh1pF+yqJQxGA7jQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: explicitly depend on bison-native for deterministic builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Feb 2018 01:20:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 19, 2018 at 09:36:22PM -0300, Otavio Salvador wrote:
> On Mon, Feb 19, 2018 at 8:54 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Explicitly depend on bison-native for deterministic builds, as it is required
> > for the build:
> >
> > |   HOSTCC  scripts/basic/fixdep
> > |   GEN     ./Makefile
> > |   HOSTCC  scripts/kconfig/conf.o
> > |   YACC    scripts/kconfig/zconf.tab.c
> > | /bin/sh: bison: command not found
> > | scripts/Makefile.lib:217: recipe for target 'scripts/kconfig/zconf.tab.c' failed
> >
> > In most cases, this dependency comes indirectly via toolchain dependencies,
> > specifically binutils-cross, which pulls bison-native. Different setups,
> > such as with external toolchain, would expose this problem, since correct
> > dependency is not marked explicitly.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > I'm seeing this now on 4.16-rc2 with external toolchain.
> 
> I am not against the addition but in fact, it is because 4.16 stopped
> of using pre-generated files and now requires bison to be available.

Ok, good, I was wondering why I didn't see it before 4.16...


> I am unsure it ought to be on kernel.bbclass at this moment.

Why not? Because it's 4.16+ specific?

By default bison-native dependency gets added implicitly when built with the 
toolchain from oe-core, so this doesn't add any extra dependencies, only makes 
it explicit.

-- 
Denys

