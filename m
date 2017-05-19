Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 9EDB0780C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 18:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EFF7820B49;
	Fri, 19 May 2017 18:07:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id x4XITbKwyets; Fri, 19 May 2017 18:07:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CD23B20756;
	Fri, 19 May 2017 18:07:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5ACC71624C8; Fri, 19 May 2017 14:07:20 -0400 (EDT)
Date: Fri, 19 May 2017 14:07:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20170519180720.GW28053@denix.org>
References: <20170518173423.28994-1-enrico.scholz@sigma-chemnitz.de>
	<20170518181957.GU28053@denix.org>
	<lyinkxrb1k.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <lyinkxrb1k.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tzcode-native: quote ${CC}
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
X-List-Received-Date: Fri, 19 May 2017 18:07:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 19, 2017 at 01:37:59AM +0200, Enrico Scholz wrote:
> Denys Dmytriyenko <denis@denix.org> writes:
> 
> >> -EXTRA_OEMAKE += "cc=${CC}"
> >> +EXTRA_OEMAKE += "cc='${CC}'"
> >
> > Should these be double-quotes around ${CC}?
> 
> I wrote it in this way:
> 
> - to 60%, because '' is more correct than "" in this context (see below)
> 
> - to 40%, because "" would clutter code too much and I can not say
>   whether it must be quoted as \", \\" or whether perhaps plain " works
>   too

FWIW, bitbake handles nested quotes properly, no escaping needed:

+EXTRA_OEMAKE += "cc="${CC}""


> A yet more correct solution would be
> 
> | export cc = "${CC}"
> 
> in the recipe (outside of do_*()) and perhaps adding '-e' to EXTRA_OEMAKE.
> 
> 
> This handles additionally the case when 'CC' contains a single quote
> (which causes misbehavior in my patch).
> 
> Double quotes are much more worse because CC must not contain '$', '`'
> or '\\' (which is not uncommon in flags like '-DFOO()=\"bar\"').  In OE,
> it is not expected that these characters are interpreted directly by the
> shell (${CC} is passed properly quoted in the environment).
> 
> But all this does not matter... correct quoting is neglactted in OE and
> bitbake; when you are lucky, commands are written as "foo '%s'" % path.
> But nobody uses functions like 'pipes.quote()' or a non-shell variants
> like subprocess.call(['foo', path]).
> 
> So, you can assume that '${FOO}' expands to the same value like "${FOO}".

Yes, bitbake variables will be expanded properly regardles of the quotes. 
Passing a shell variable may cause problems, but may not be a good practice 
in general.

-- 
Denys

