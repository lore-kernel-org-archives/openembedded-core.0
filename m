Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmnB3-0005Rh-3W
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 15:32:33 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qmn6w-0003tK-Fd
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 15:28:18 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jul 2011 14:28:17 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311946098.30326.489.camel@phil-desktop>
Mime-Version: 1.0
Subject: arm tune files status summary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jul 2011 13:32:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There are quite a lot of different sub-threads going on at the moment
regarding the various breakages associated with the recent arm tuning
file patch.  Here's a summary of what I think are all the current issues
and their status.

1. bogus PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} in bitbake.conf causing
rootfs construction to fail.

Paul and Koen both posted (essentially identical) patches for this and
it looks as though Paul's has been applied.  So, the original breakage
should be resolved but it isn't entirely clear what this line in
bitbake.conf was trying to accomplish in the first place.  I think
someone still needs to conduct an audit to establish whether there are
any circumstances where PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} does
need setting to ${TARGET_ARCH} and, if so, make that happen.

2. endianness confusion in armv5/armv6 tune files.

I posted a patch for this.  It doesn't look like it's been applied yet
but it's in the archives for anybody who wants it.  Only big-endian
configs would be affected anyway and I think those are something of a
fringe pursuit.

3. eglibc unbuildable on qemuarm

This is happening because qemuarm selects arm926ejs tuning, which in
turn selects armv5te, and the current arrangement of tune files forces
Thumb-state on if you ask to tune for a T-variant architecture.  The old
"ARM_INSTRUCTION_SET" variable which used to override the ISA selection
seems not to be respected anymore.  This is unfortunate because there is
assembler code in eglibc which isn't Thumb-1 aware and hence can't be
built under -mthumb.

A short-term workaround would be to hack tune-arm926ejs.inc to select
the TUNE_FEATURES for armv5e rather than armv5te.  But this is clearly
not a good solution in general and, other than changing the underlying
policy of inferring ISA choice from architecture name, it's not obvious
what the right way of solving it is.

This particular issue causes sufficiently gross breakage that I would
have expected it to show up on the Yocto autobuilder run before the
patch was merged.  I'm not quite sure why it apparently didn't fail
there but maybe the autobuilder doesn't actually test qemuarm at
present.

4. can't build ARM-state code for ARMv4T architecture.

This is another facet of the above; there is currently no way to say
that you want to select -march=armv4t without also enabling -mthumb.
This makes it impossible to build interworking-capable ARM-state code
for v4T.

5. cortex tuning not working

Various of the cortex files had a spelling mistake which would cause the
TUNE_FEATURES never to actually match anything.  This is a trivial fix
and I sent a patch for it yesterday.  I don't think it's been merged
yet.

6. distros no longer able to select ARM vs Thumb state either globally
or per package

This is really another manifestation of the issue in #3.  But the point
here isn't so much that builds are failing, rather that we seem to have
lost the ability to have a single switch that the DISTRO can flip to
build the entire world (or individual packages) as Thumb rather than
ARM.  For Thumb-1 in particular the tradeoffs are sufficiently
complicated that I don't think there is ever going to be a globally
"right" answer.

I think that's all I know of.

p.




