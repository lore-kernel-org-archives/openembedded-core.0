Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 16A3A6F84D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 08:19:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2014 01:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,785,1389772800"; d="scan'208";a="513943644"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2014 01:19:26 -0700
Date: Thu, 3 Apr 2014 11:19:25 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20140403081925.GJ29926@lpalcu-linux>
References: <9362603aca1b9e36631265991dc556a5@agner.ch>
	<20140303083846.GA3698@lpalcu-linux>
	<f598c2e47683dab5395d7b1276b4d2b5@agner.ch>
MIME-Version: 1.0
In-Reply-To: <f598c2e47683dab5395d7b1276b4d2b5@agner.ch>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: relocate_sdk.py: Possible bug, /lib64/ld-linux-x86-64.so.2 not relocated
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
X-List-Received-Date: Thu, 03 Apr 2014 08:19:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stefan,

Can you please have a look at the binaries before relocation? Just to
make sure...

So, for that, run the installer with -R option:

./your_toolchain_installer.sh -R

Here, I'm interested which is the default suggested path (see below):

Enter target directory for SDK (default: /opt/poky/1.5+snapshot):

Then, run 'readelf -p ".interp"' on those binaries. They should all start
with the "default" prefix.

laurentiu


On Thu, Apr 03, 2014 at 09:59:34AM +0200, Stefan Agner wrote:
> Hi Laurentiu,
> 
> Am 2014-03-03 09:38, schrieb Laurentiu Palcu:
> > This is the correct behavior. We shouldn't relocate binaries that use
> > host's dynamic loader.
> > 
> >> When I install the SDK with -S (copy the relocate scripts), and
> >> remove the condition around line 95, the binaries work as expected.
> > Can you please run the installer script with "-R" so it doesn't perform
> > any relocation on binaries, and then:
> > 
> > readelf -p ".interp"
> > /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-gcc
> > 
> > It looks like the default dynamic loader path of the toolchain binaries
> > start with /lib* or /usr/lib* which is not quite right... It should be:
> > ${SDKPATH}/sysroots/${SDK_SYS}.
> 
> $ readelf -p ".interp"
> /usr/local/oecore-x86_64-non-reloc/sysroots/x86_64-angstromsdk-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-gcc
> 
> String dump of section '.interp':
>   [     0]  /lib64/ld-linux-x86-64.so.2
> 
> 
> So this looks wrong then, right? 
> 
> I also get the same for python and qmake:
> $ readelf -p ".interp" 
> /usr/local/oecore-x86_64-new/sysroots/x86_64-angstromsdk-linux/usr/bin/python2
> 
> String dump of section '.interp':
>   [     0]  /lib64/ld-linux-x86-64.so.2
> 
> $ readelf -p ".interp" 
> /usr/local/oecore-x86_64-new/sysroots/x86_64-angstromsdk-linux/usr/bin/qmake2
> 
> 
> String dump of section '.interp':
>   [     0]  /lib64/ld-linux-x86-64.so.2
> 
> How can I make sure all those binaries get linked against the SDK link
> loader?
> 
> --
> Stefan

