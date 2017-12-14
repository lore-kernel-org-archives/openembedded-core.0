Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 10F7A787F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 00:04:25 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBE04L4x018768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 14 Dec 2017 00:04:22 GMT
Message-ID: <1513209861.16507.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Thu, 14 Dec 2017 00:04:21 +0000
In-Reply-To: <2df34489-8c8f-bd76-3972-7ab648aeffee@windriver.com>
References: <1513168490.19417.183.camel@linuxfoundation.org>
	<694b540b-1fc8-0388-5419-01c6e3f100c6@windriver.com>
	<1513173904.16507.1.camel@linuxfoundation.org>
	<85f7c521-01c4-7870-0f57-7ca217fce8e3@windriver.com>
	<1513174448.16507.8.camel@linuxfoundation.org>
	<2df34489-8c8f-bd76-3972-7ab648aeffee@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: "Lock, Joshua" <joshua.g.lock@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Fix for the APIC hangs in qemux86-64
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
X-List-Received-Date: Thu, 14 Dec 2017 00:04:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-12-13 at 19:01 -0500, Bruce Ashfield wrote:
> On 2017-12-13 9:14 AM, Richard Purdie wrote:
> > 
> > On Wed, 2017-12-13 at 09:07 -0500, Bruce Ashfield wrote:
> > > 
> > > On 12/13/2017 09:05 AM, Richard Purdie wrote:
> > > > 
> > > > 
> > > > On Wed, 2017-12-13 at 08:38 -0500, Bruce Ashfield wrote:
> > > > > 
> > > > > 
> > > > > On 12/13/2017 07:34 AM, Richard Purdie wrote:
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > Hi Bruce,
> > > > > > 
> > > > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=12301
> > > > > > 
> > > > > > We've root caused the hangs we're seeing in qemux86-64 on
> > > > > > our
> > > > > > autobuilder workers. We've identified a commit on 4.15-rc3
> > > > > > which
> > > > > > fixes
> > > > > > the issue but backporting it to the autobuilder's host
> > > > > > kernels
> > > > > > will
> > > > > > be
> > > > > > a pain.
> > > > > > 
> > > > > > As a workaround I'd like to enable x2apic on qemux86-64.
> > > > > > Since
> > > > > > that
> > > > > > works via MSRs it avoids the problem.
> > > > > > 
> > > > > > Would it be a big issue to set CONFIG_X86_X2APIC=y for
> > > > > > qemux86-
> > > > > > 64?
> > > > > Nope. No big deal at all. I've used the same config i the
> > > > > past
> > > > > when doing work with rt-KVM, so I know it well.
> > > > > 
> > > > > I'll prep a commit, and send it along as part of a rebased
> > > > > set
> > > > > of kernel patches.
> > > > Thanks, much appreciated.
> > > > 
> > > > Did we get to the bottom of the 4.12 selftest failures?
> > > > 
> > > Not yet no. I was distracted for a day, but need to learn how
> > > to run them myself. I was able to log in via serial in my normal
> > > boot flow, so that didn't get me anywhere.
> > > 
> > > Is the selftest HOWO in the yocto docs ? I'll google it up this
> > > morning.
> > No HOWTO but I did give you the command. In a poky checkout run:
> > 
> > oe-selftest -r runqemu.RunqemuTests.test_boot_deploy
> > 
> > which runs a single test that fails (setup DL_DIR/SSTATE_MIRRORS
> > first
> > to speed it up a bit).
> > 
> > It may tell you to clear SANITY_TESTED_DISTROS, I think it auto
> > adds
> > meta-selftest now. You may also need to set DISPLAY to something
> > (e.g.
> > a dummy vncserver).
> > 
> With the cleanup that Ross gave me, I'm now able to see the issue.
> 
> I'll start debugging on Thursday.
> 
> One additional question: what's the right way to find the logs of
> that
> run ?
> 
> I'm getting a bit of noise from:
> 
> ----------------
>       0155:            else:
> Exception: FileNotFoundError: [Errno 2] No such file or directory: 
> '/home/bruce/poky/build/tmp/sysroots-components/x86_64/python3-
> native/usr/lib/python3.5/sqlite3/__pycache__/dump.cpython-35.opt-
> 1.pyc' 
> -> 
> '/home/bruce/poky/build/tmp/work/core2-64-poky-linux/gnu-efi/3.0.6-
> r0/recipe-sysroot-
> native/usr/lib/python3.5/sqlite3/__pycache__/dump.cpython-35.opt-
> 1.pyc'
> 
> ERROR: gnu-efi-3.0.6-r0 do_package: Function failed:
> extend_recipe_sysroot
> ERROR: Logfile of failure stored in: 
> /home/bruce/poky/build/tmp/work/core2-64-poky-linux/gnu-efi/3.0.6-
> r0/temp/log.do_package.10495

You've deleted pyc files from python itself which is bad. I'd
cleansstate python-native and rebuilt it to fix that. Ross meant onto
to run it on the poky meta directory...

Cheers,

Richard



