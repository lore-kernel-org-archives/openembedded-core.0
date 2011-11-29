Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVGeD-0000ga-E2
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 06:54:29 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Nov 2011 21:47:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,589,1315206000"; d="scan'208";a="80081329"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by azsmga001.ch.intel.com with ESMTP; 28 Nov 2011 21:47:49 -0800
Message-ID: <4ED47205.6050608@linux.intel.com>
Date: Mon, 28 Nov 2011 21:47:49 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321972428.git.anders@chargestorm.se>
	<4ECC07D8.2070104@linux.intel.com>
	<20111123085906.GA16705@ad.chargestorm.se>
In-Reply-To: <20111123085906.GA16705@ad.chargestorm.se>
Subject: Re: [PATCH v2 0/1] busybox: update to 1.19.3
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
X-List-Received-Date: Tue, 29 Nov 2011 05:54:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/2011 12:59 AM, Anders Darander wrote:
> * Saul Wold<sgw@linux.intel.com>  [111122 21:36]:
>> On 11/22/2011 06:34 AM, Anders Darander wrote:
>>> This updates busybox to the latest stable, 1.19.3.
>
>>> Among other things, there should be rudimentary support in syslogd for
>>> systemd, by enabling CONFIG_FEATURE_SYSTEMD.
>
>> How much size does this add to busybox by having it enabled by default?
>
> Enabling FEATURE_SYSTEMD in busybox costs 192 bytes in my tests in
> qemux86.
>
>> Is it possible to conditional add a config fragment if systemd is
>> enabled ad the DISTRO/IMAGE_FEATURE level?
>
>> More info is required.
>
>>> It has been tested and verified on qemux86 and on our local arm-based system.
>
>>> However, the patch busybox-udhcpc-no_deconfig.patch has been modified to
>>> apply, but hasn't really been tested. As we're currently mostly running static
>>> configurations, we've only verified that udhcpc works to the extent that we
>>> get the network up and running, not how it behaves during dhcp renewal.
>>> Thus I'm starting this as an RFC.
>
>>> Changes:
>>> v2: * Checked the new defconfig (removed settings implying CFLAGS and
>>>       ARCH). The new defconfig should be as close as possible to the old one,
>>>       with the exception of some new utils/options.
>> Can you clearly enumerate what new utils and options and what their size
>> impact on the busybox image is.
>
> Apart from the FEATURE_SYSTEMD discussed above, these are the other new
> options that I kept the new busybox default on (i.e. these are enabled,
> while I turned of quite a few other options that automatically got
> enabled). All costs are evaluted using qemux86, and the busybox binary
> size is checked in the packages-split/busybox/bin directory.
>
> I don't mind disabling any of these feature in a v3, if
> desired/requested. Anyway, I'm running a completely custom config for my
> normal uses...
>
> FEATURE_RTMINMAX, support RTMIN[+n] RTMAX[-n] signals, claimed to cost
> ~250 bytes
>
I can see these being useful

> FEATURE_REVERSE_SEARCH claimed to cost ~0.5k
>
Why is this needed?

> FEATURE_SKIP_ROOTFS ignore rootfs entry in mount table (tools like df
> etc will ignore it).
>
OK

> FEATURE_AR_CREATE, enable ar to create files, ~2.5k
>
> FEATURE_SEAMLESS_XZ enable xz compression in tar, no measured cost.
>
> XZ and UNXZ, enable xz compression, 8k
>
This is the one and the ar create above that sticks out, are these 
needed in the general case or just for your config?

> FGCONSOLE, print active console number, 128 bytes
>
> FEATURE_LOADFONT_PSF2, FEATURE_LOADFONT_RAW, cost 576 bytes
>
Seems resonable, but why did we not need this before, what changed?

> FEATURE_VI_ASK_TERMINAL, last resort to find terminal size, 352 bytes
>
Not sure about this and the FGCONSOLE above.

> BLOCKDEV, perform some ioctls with block devices, cost 480 bytes
>
Again is this useful in the general case?

> FDISK_SUPPORT_LARGE_DISKS, is disabled, it no longer wants to play with
> LFS (both were enabled previously).
>
OK

> FEATURE_MOUNT_LOOP_CREATE, create new loopback devices if needed,
> couldn't see any cost
>
OK

> FEATURE_WGET_TIMEOUT, no visible cost
>
OK

> FEATURE_SH_HISTFILESIZE, use $HISTFILESIZE (still max limited by
> config), no visible cost
>
OK

> FEATURE_SYSLOGD_CFG, support syslog.conf, no visible cost
>
OK

> FEATURE_SYSLOGD_READ_BUFFER_SIZE, defines the size of the read buffer,
> not measured
>
OK

> FEATURE_KLOGD_KLOGCTL, let klogd use the klogctl() interface, no visible
> cost
OK

>
> Cheers,
> Anders
>


