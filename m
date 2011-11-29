Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RVHqb-0003M3-3L
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 08:11:21 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.213.0;
	Tue, 29 Nov 2011 08:04:41 +0100
Date: Tue, 29 Nov 2011 08:04:44 +0100
From: Anders Darander <anders@chargestorm.se>
To: Saul Wold <sgw@linux.intel.com>, <g@ad.chargestorm.se>
Message-ID: <20111129070444.GA3653@ad.chargestorm.se>
Mail-Followup-To: Saul Wold <sgw@linux.intel.com>, g@ad.chargestorm.se,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321972428.git.anders@chargestorm.se>
	<4ECC07D8.2070104@linux.intel.com>
	<20111123085906.GA16705@ad.chargestorm.se>
	<4ED47205.6050608@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4ED47205.6050608@linux.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 29 Nov 2011 07:11:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Saul Wold <sgw@linux.intel.com> [111129 06:47]:
> On 11/23/2011 12:59 AM, Anders Darander wrote:
> > * Saul Wold<sgw@linux.intel.com>  [111122 21:36]:
> >> On 11/22/2011 06:34 AM, Anders Darander wrote:
> >>> This updates busybox to the latest stable, 1.19.3.

> >>> Among other things, there should be rudimentary support in syslogd for
> >>> systemd, by enabling CONFIG_FEATURE_SYSTEMD.

> >> How much size does this add to busybox by having it enabled by default?

> > Enabling FEATURE_SYSTEMD in busybox costs 192 bytes in my tests in
> > qemux86.

> >> Is it possible to conditional add a config fragment if systemd is
> >> enabled ad the DISTRO/IMAGE_FEATURE level?

> >> More info is required.

Any more comment on this one? Otavio replied earlier that if it was a
small cost, he would prefer to have it on by default. Otherwise, any
suggestions for DISTRO/IMAGE_FEATURE?

> >>> Changes:
> >>> v2: * Checked the new defconfig (removed settings implying CFLAGS and
> >>>       ARCH). The new defconfig should be as close as possible to the old one,
> >>>       with the exception of some new utils/options.
> >> Can you clearly enumerate what new utils and options and what their size
> >> impact on the busybox image is.

I'll remove all features that you didn't OK (see below), unless we get
some more replies/wishes in the next day. (Thus I plan to send a v3 this
week, if times allow it).

Just to clarify it once more, the choice of which new features to enable
was done by trying to judge if they were reasonable, or seemed
helpfull/usefull enough. I'm not normally running with the defconfig
(apart from testing this patch), I'm using a heavily customized and
often minimized defconfig.

> > Apart from the FEATURE_SYSTEMD discussed above, these are the other new
> > options that I kept the new busybox default on (i.e. these are enabled,
> > while I turned of quite a few other options that automatically got
> > enabled). All costs are evaluted using qemux86, and the busybox binary
> > size is checked in the packages-split/busybox/bin directory.

> > I don't mind disabling any of these feature in a v3, if
> > desired/requested. Anyway, I'm running a completely custom config for my
> > normal uses...

> > FEATURE_RTMINMAX, support RTMIN[+n] RTMAX[-n] signals, claimed to cost
> > ~250 bytes

> I can see these being useful

> > FEATURE_REVERSE_SEARCH claimed to cost ~0.5k

> Why is this needed?

Not needed, just nice to have. But I'll remove it in v3.

> > FEATURE_AR_CREATE, enable ar to create files, ~2.5k

> > FEATURE_SEAMLESS_XZ enable xz compression in tar, no measured cost.

> > XZ and UNXZ, enable xz compression, 8k

> This is the one and the ar create above that sticks out, are these 
> needed in the general case or just vfor your config?

Shouldn't be needed. I just left it enabled as all other
FEATURE_SEAMLESS's was enabled. I'll disable these two in v3.

> > FGCONSOLE, print active console number, 128 bytes

> > FEATURE_LOADFONT_PSF2, FEATURE_LOADFONT_RAW, cost 576 bytes

> Seems resonable, but why did we not need this before, what changed?

Not really sure what the change is (normally I'm only working on
headless systems, thus no need for fonts). The two FEATURE_LOADFONT_*
options were not available in the old defconfig. I'll leave these two in
v3, as you thought the seemd reasonable.

> > FEATURE_VI_ASK_TERMINAL, last resort to find terminal size, 352 bytes

> Not sure about this and the FGCONSOLE above.

Sure, I'll remove these two.

> > BLOCKDEV, perform some ioctls with block devices, cost 480 bytes

> Again is this useful in the general case?

Same as previously, an arbitrary choice. I'll remove it in v3.



-- 
Anders Darander
ChargeStorm AB / eStorm AB


