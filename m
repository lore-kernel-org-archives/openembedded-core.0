Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 7F41378836
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 16:28:21 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id F19652E8928;
	Fri, 23 Mar 2018 11:28:21 -0500 (CDT)
Date: Fri, 23 Mar 2018 11:28:20 -0500
From: Seebs <seebs@seebs.net>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20180323112820.12bc94a4@seebsdell>
In-Reply-To: <lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Fri, 23 Mar 2018 16:28:21 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Mar 2018 17:10:35 +0100
Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:

> I think, 'mv' is the culprit.  It calls 'renameat2()' directly over
> 'syscall()':
> 
> | $ ltrace mv foo bar
> | ...
> | syscall(316, 0xffffff9c, 0x7fff1564a341,
> 0xffffff9c)                                            = 0
> 
> 
> Perhaps, 'pseudo' does not catch this?

Yeah.

And so far as I know, it's not actually *possible* to in the general
case. I really don't think it's safe to try to catch syscall().

I was afraid someone would do this. (It also breaks most Go programs,
for similar reasons; no libc calls.)

I have no idea why they're doing that; it seems distinctly unsafe.

-s

