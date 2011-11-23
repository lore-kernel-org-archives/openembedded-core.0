Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RT8m2-0005v1-BV
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 10:05:46 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.83.0;
	Wed, 23 Nov 2011 09:59:05 +0100
Date: Wed, 23 Nov 2011 09:59:07 +0100
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111123085906.GA16705@ad.chargestorm.se>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321972428.git.anders@chargestorm.se>
	<4ECC07D8.2070104@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4ECC07D8.2070104@linux.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
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
X-List-Received-Date: Wed, 23 Nov 2011 09:05:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Saul Wold <sgw@linux.intel.com> [111122 21:36]:
> On 11/22/2011 06:34 AM, Anders Darander wrote:
> > This updates busybox to the latest stable, 1.19.3.

> > Among other things, there should be rudimentary support in syslogd for
> > systemd, by enabling CONFIG_FEATURE_SYSTEMD.

> How much size does this add to busybox by having it enabled by default?

Enabling FEATURE_SYSTEMD in busybox costs 192 bytes in my tests in
qemux86.

> Is it possible to conditional add a config fragment if systemd is 
> enabled ad the DISTRO/IMAGE_FEATURE level?

> More info is required.

> > It has been tested and verified on qemux86 and on our local arm-based system.

> > However, the patch busybox-udhcpc-no_deconfig.patch has been modified to
> > apply, but hasn't really been tested. As we're currently mostly running static
> > configurations, we've only verified that udhcpc works to the extent that we
> > get the network up and running, not how it behaves during dhcp renewal.
> > Thus I'm starting this as an RFC.

> > Changes:
> > v2: * Checked the new defconfig (removed settings implying CFLAGS and
> >      ARCH). The new defconfig should be as close as possible to the old one,
> >      with the exception of some new utils/options.
> Can you clearly enumerate what new utils and options and what their size 
> impact on the busybox image is.

Apart from the FEATURE_SYSTEMD discussed above, these are the other new
options that I kept the new busybox default on (i.e. these are enabled,
while I turned of quite a few other options that automatically got
enabled). All costs are evaluted using qemux86, and the busybox binary
size is checked in the packages-split/busybox/bin directory.

I don't mind disabling any of these feature in a v3, if
desired/requested. Anyway, I'm running a completely custom config for my
normal uses...

FEATURE_RTMINMAX, support RTMIN[+n] RTMAX[-n] signals, claimed to cost
~250 bytes

FEATURE_REVERSE_SEARCH claimed to cost ~0.5k

FEATURE_SKIP_ROOTFS ignore rootfs entry in mount table (tools like df
etc will ignore it).

FEATURE_AR_CREATE, enable ar to create files, ~2.5k

FEATURE_SEAMLESS_XZ enable xz compression in tar, no measured cost.

XZ and UNXZ, enable xz compression, 8k

FGCONSOLE, print active console number, 128 bytes

FEATURE_LOADFONT_PSF2, FEATURE_LOADFONT_RAW, cost 576 bytes

FEATURE_VI_ASK_TERMINAL, last resort to find terminal size, 352 bytes

BLOCKDEV, perform some ioctls with block devices, cost 480 bytes

FDISK_SUPPORT_LARGE_DISKS, is disabled, it no longer wants to play with
LFS (both were enabled previously).

FEATURE_MOUNT_LOOP_CREATE, create new loopback devices if needed,
couldn't see any cost

FEATURE_WGET_TIMEOUT, no visible cost

FEATURE_SH_HISTFILESIZE, use $HISTFILESIZE (still max limited by
config), no visible cost

FEATURE_SYSLOGD_CFG, support syslog.conf, no visible cost

FEATURE_SYSLOGD_READ_BUFFER_SIZE, defines the size of the read buffer,
not measured

FEATURE_KLOGD_KLOGCTL, let klogd use the klogctl() interface, no visible
cost

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


