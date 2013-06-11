Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8713C6A9A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 12:43:52 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Jun 2013 05:43:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,845,1363158000"; d="scan'208";a="253461078"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jun 2013 05:43:51 -0700
Date: Tue, 11 Jun 2013 15:43:50 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Tasslehoff Kjappfot <tasskjapp@gmail.com>
Message-ID: <20130611124350.GD7181@lpalcu-linux>
References: <51B6EF5E.1020404@gmail.com>
MIME-Version: 1.0
In-Reply-To: <51B6EF5E.1020404@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SDK relocation issues
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
X-List-Received-Date: Tue, 11 Jun 2013 12:43:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Tasslehoff,

On Tue, Jun 11, 2013 at 11:35:26AM +0200, Tasslehoff Kjappfot wrote:
> I compiled an SDK and extracted/installed it to my source tree
> instead of /usr/local/. I have made /usr/local/oecore-i686 a symlink
> to the actual location. With the latest Dylan this broke.
> 
> Denzil:
> ❯❯❯ ldd arm-angstrom-linux-gnueabi-gcc
>     linux-gate.so.1 =>  (0xf771d000)
>     libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf7544000) /usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/lib/ld-linux.so.2
> => /lib/ld-linux.so.2 (0xf771e000)
> 
> Dylan:
> Original location:
> ❯❯❯ ldd arm-angstrom-linux-gnueabi-gcc
>     linux-gate.so.1 =>  (0xf77c4000)
>     libc.so.6 => /home/tasslehoff/src/pdrepos01/toolchains/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/armv7a-vfp-neon-angstrom-linux-gnueabi/./../../../lib/libc.so.6
> (0xf7610000)
> 
> /home/tasslehoff/src/oe/toolchains/oecore-i686/sysroots/i686-angstromsdk-linux/lib/ld-linux.so.2
> => /lib/ld-linux.so.2 (0xf77c5000)

A few things:
 * Be careful when using ldd with SDK binaries. ldd it's just a wrapper script
   around host's dynamic loader and it might give you wrong paths (usually to
   the host's libraries). Luckily, in this case, the binary is relocatable and
   has the RPATH linked in, hence the libc.so.6 location is correct. However,
   the dynamic loader points to the host's. The correct way to print the
   dependencies for SDK bianaries is this:

   $ readelf -p .interp arm-poky-linux-gnueabi-gcc

   String dump of section '.interp':
     [     0]  /home/test/sdk_tests/sdk/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2

   $ /home/test/sdk_tests/sdk/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2 --list ./arm-poky-linux-gnueabi-gcc
        linux-vdso.so.1 (0x00007fff1a3f4000)
        libc.so.6 => /home/test/sdk_tests/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/armv5te-poky-linux-gnueabi/./../../../lib/libc.so.6 (0x00007fc102465000)
        /home/test/sdk_tests/sdk/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2 (0x00007fc102868000)

 * denzil did not support relocation and you could only install the sdk in /usr/local;
 * AFAIK, the dynamic loader is always shipped with the SDK;

> 
> If I try to run the toolchain from Dylan on a system where /home/tasslehoff/src/oe/toolchains/oecore-i686/sysroots/i686-angstromsdk-linux/lib/ld-linux.so.2
> does not exist, it fails.

Again, the DL should be available in your toolchain sysroot. I'm not aware of
a case when the dynamic loader is not shipped with the toolchain. Did this
happen in your case?

Thanks,
Laurentiu

> 
> Regards,
> Tasslehoff
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

