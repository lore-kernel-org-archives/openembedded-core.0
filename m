Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 70A986FF73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 14:14:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBDEE8WY008164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 13 Dec 2017 14:14:09 GMT
Message-ID: <1513174448.16507.8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 13 Dec 2017 14:14:08 +0000
In-Reply-To: <85f7c521-01c4-7870-0f57-7ca217fce8e3@windriver.com>
References: <1513168490.19417.183.camel@linuxfoundation.org>
	<694b540b-1fc8-0388-5419-01c6e3f100c6@windriver.com>
	<1513173904.16507.1.camel@linuxfoundation.org>
	<85f7c521-01c4-7870-0f57-7ca217fce8e3@windriver.com>
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
X-List-Received-Date: Wed, 13 Dec 2017 14:14:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-12-13 at 09:07 -0500, Bruce Ashfield wrote:
> On 12/13/2017 09:05 AM, Richard Purdie wrote:
> > 
> > On Wed, 2017-12-13 at 08:38 -0500, Bruce Ashfield wrote:
> > > 
> > > On 12/13/2017 07:34 AM, Richard Purdie wrote:
> > > > 
> > > > 
> > > > Hi Bruce,
> > > > 
> > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=12301
> > > > 
> > > > We've root caused the hangs we're seeing in qemux86-64 on our
> > > > autobuilder workers. We've identified a commit on 4.15-rc3
> > > > which
> > > > fixes
> > > > the issue but backporting it to the autobuilder's host kernels
> > > > will
> > > > be
> > > > a pain.
> > > > 
> > > > As a workaround I'd like to enable x2apic on qemux86-64. Since
> > > > that
> > > > works via MSRs it avoids the problem.
> > > > 
> > > > Would it be a big issue to set CONFIG_X86_X2APIC=y for qemux86-
> > > > 64?
> > > Nope. No big deal at all. I've used the same config i the past
> > > when doing work with rt-KVM, so I know it well.
> > > 
> > > I'll prep a commit, and send it along as part of a rebased set
> > > of kernel patches.
> > Thanks, much appreciated.
> > 
> > Did we get to the bottom of the 4.12 selftest failures?
> > 
> Not yet no. I was distracted for a day, but need to learn how
> to run them myself. I was able to log in via serial in my normal
> boot flow, so that didn't get me anywhere.
> 
> Is the selftest HOWO in the yocto docs ? I'll google it up this
> morning.

No HOWTO but I did give you the command. In a poky checkout run:

oe-selftest -r runqemu.RunqemuTests.test_boot_deploy

which runs a single test that fails (setup DL_DIR/SSTATE_MIRRORS first
to speed it up a bit).

It may tell you to clear SANITY_TESTED_DISTROS, I think it auto adds
meta-selftest now. You may also need to set DISPLAY to something (e.g.
a dummy vncserver).

Not sure what is different about the serial qemu is using verses your
own tests...

> > We may also need to backport the defconfig change back to the older
> > releases so we don't get the hangs in those builds either...
> Not a problem either. I'll prepare several.> 

Thanks!

Cheers,

Richard
> 

