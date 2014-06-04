Return-Path: <sledz@dresearch-fe.de>
X-Greylist: delayed 355 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Jun 2014 08:12:48 UTC
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id 00E056B7AC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 08:12:48 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 4F180E0061;
	Wed,  4 Jun 2014 10:06:53 +0200 (CEST)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by fensuse.internal.dresearch-fe.de (Postfix) with ESMTP id 0A1697012B5;
	Wed,  4 Jun 2014 10:06:52 +0200 (CEST)
Message-ID: <538ED39B.2090204@dresearch-fe.de>
Date: Wed, 04 Jun 2014 10:06:51 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.6
Subject: ^{} what is it good for? (bitbake problem)
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
X-List-Received-Date: Wed, 04 Jun 2014 08:12:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We're are currently switching to daisy (incl. bitbake 1.22). There we hit the following problem.

We've a bbappend for linux-yocto-3.10 containing

--------------> snip <-----------------
SRC_URI +=  " \
    git://github.com/DFE/darmok.git;destsuffix=darmok;type=not-kmeta;tag=darmok_v0.10 \
"
--------------> snap <-----------------

This results in

--------------> snip <-----------------
NOTE: Error during finalise of /pm/sledz/hipos-dfe/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.10.bb
ERROR: ExpansionError during parsing /pm/sledz/hipos-dfe/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.10.bb: Failure expanding variable do_patch: ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetcher failure for URL: 'git://github.com/DFE/darmok.git;destsuffix=darmok;type=not-kmeta;tag=darmok_v0.10'. The command git ls-remote git://github.com/DFE/darmok.git refs/heads/darmok_v0.10 refs/tags/darmok_v0.10^{} gave empty output unexpectedly
--------------> snap <-----------------

And here's the output from some tests on the command line.

--------------> snip <-----------------
sledz@fensuse:/pm/sledz/hipos-dfe> git ls-remote git://github.com/DFE/darmok.git refs/heads/darmok_v0.10 refs/tags/darmok_v0.10^{}
sledz@fensuse:/pm/sledz/hipos-dfe> git ls-remote git://github.com/DFE/darmok.git refs/heads/darmok_v0.10 refs/tags/darmok_v0.10
f7f9073ea0c0c9a95808c9f65a29dcee9657226a        refs/tags/darmok_v0.10
--------------> snap <-----------------

They confirm the empty output if the command contains this magic ^{} at the end. The command works well if i remove this.

So what is this ^{} which comes from lib/bb/fetch2/git.py good for?
Or is this a remnant from a typo?

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

