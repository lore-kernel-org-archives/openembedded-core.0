Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.221.74.143])
	by mail.openembedded.org (Postfix) with ESMTP id 426716025E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 14:59:23 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id DCC682ADC93
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 09:59:24 -0500 (CDT)
Date: Thu, 14 Sep 2017 09:59:23 -0500
From: Seebs <seebs@seebs.net>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <20170914095923.05ad9f62@seebsdell>
In-Reply-To: <CAJTo0LZr+mFy9_behSGMpfy_=A0PUGOm_9xf2Co05PKqZQ5yOQ@mail.gmail.com>
References: <20170913204659.1919-1-Martin.Jansa@gmail.com>
	<20170913170943.60a3d856@seebsdell>
	<CAJTo0LZr+mFy9_behSGMpfy_=A0PUGOm_9xf2Co05PKqZQ5yOQ@mail.gmail.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [RFC][PATCH] insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
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
X-List-Received-Date: Thu, 14 Sep 2017 14:59:24 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 14 Sep 2017 15:53:09 +0100
"Burton, Ross" <ross.burton@intel.com> wrote:

> Example:
> 
> path mismatch [5 links]: ino 27539515 db
> '/data/poky-tmp/master/build/work/corei7-64-poky-linux/dbus/1.10.20-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.bfd'
> req
> '/data/poky-tmp/master/build/sysroots-components/x86_64/binutils-cross-x86_64/usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld'.
> 
> Looks like this is just warning that there is a symlink, right?

Hard link, not symlink. Symlinks are recorded separately, "links" is
the hard link count in the filesystem, which doesn't include symlinks.

That message is almost always Harmless. Although strictly speaking, it
probably indicates that one of the links was made outside of pseudo,
which in theory shouldn't happen, I think.

At least, I *think* the current intent is to always use an exact match
(both path and inode) if possible, so it shouldn't see a mismatch
unless there's a path that got used but that isn't in the database.

-s

