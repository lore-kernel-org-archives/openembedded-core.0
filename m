Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A3D5D60C02
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 22:44:48 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s34MiXm0002626; Fri, 4 Apr 2014 23:44:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3PGn9LVXfb_J; Fri,  4 Apr 2014 23:44:33 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s34MiRUZ002618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 4 Apr 2014 23:44:29 +0100
Message-ID: <1396651461.13862.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 04 Apr 2014 23:44:21 +0100
In-Reply-To: <CAJTo0LYdmV9bTdttrO_kkjXRGuH3xC9c_h_EnGEo6=dcbxuBdg@mail.gmail.com>
References: <CALbNGRR3cOLUR+HBKkfSqLMRL75sn7uzEace23KJLYy43F1Vtg@mail.gmail.com>
	<CALbNGRShXafNdCYR62h3tpQ4RLTXyZTgvrs0xBOhsn_Z57=sdg@mail.gmail.com>
	<533EE97D.90207@windriver.com>
	<CAJTo0LYdmV9bTdttrO_kkjXRGuH3xC9c_h_EnGEo6=dcbxuBdg@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: util-macros.do_package failed Re: Build failure
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
X-List-Received-Date: Fri, 04 Apr 2014 22:44:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-04-04 at 21:01 +0100, Burton, Ross wrote:
> On 4 April 2014 18:18, Robert Yang <liezhi.yang@windriver.com> wrote:
> > Maybe we can let the do_package depend on base-passwd:do_populate_sysroot
> > to fix the problem.
> 
> I keep on thinking that we need to effectively have a readers/writer
> lock on the sysroot, so that e.g. do_compile() takes a read lock and
> do_populate_sysroot() takes a write lock.  This way very slim races
> such as this (and aclocal disappearing, and binaries being re-written
> whilst being executed, etc) just can't happen.  By having a
> readers/writer lock the stalls for the actual populate of the sysroot
> shouldn't have too great an impact, and would let us remove other
> workarounds we've added (such as the baroque aclocal-copy).

We've tried this before and "shouldn't" doesn't work out too well in
practice.

The aclocal-copy business is actually now an improvement since it only
accesses things it depends upon which is a good thing as far as I'm
concerned. Other ways we could possibly improve:

a) Atomically moves files into the sysroot (and I guess move and delete
for atomic removal). This means they can't "half" be there.

b) Move libs in before binaries. This way a binary can't get run before
its dependencies are there.

This all continues to hack around the fact its a shared area though and
I'd imagine regardless of what tricks you play and even if you add in
locks, there will still be determinism issues.

The conclusion you then reach is that the only way you can ultimately
solve things is a sysroot per build item. You could do something that
would perform moderately well with a directory per sysroot item, then
hardlink these into individual sysroots per workdir.

In many ways, the aclocal-copy change is an experiment for that, we
should now have the pieces where we could implement such a thing...

Cheers,

Richard


