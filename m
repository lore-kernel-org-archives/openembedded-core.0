Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1TzqqP-0003R9-73 for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 16:42:01 +0100
Received: from cpc14-cmbg17-2-0-cust423.5-4.cable.virginmedia.com
	([86.14.229.168] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1TzqBq-0001qz-6D; Mon, 28 Jan 2013 16:00:06 +0100
Message-ID: <1359385200.7131.11.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 28 Jan 2013 15:00:00 +0000
In-Reply-To: <ly622hl5r0.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
	<1359377661.22371.54.camel@ted>
	<lypq0pl8ee.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4710226.v3bfS80rgU@helios>
	<ly622hl5r0.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base: make feature backfilling happen earlier
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 15:42:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-28 at 15:52 +0100, Enrico Scholz wrote:
> There are some implicit relations between features (e.g. when selecting
> 'usbhost' I *usually* want 'vfat' or 'ext2' support too). So I have
> 
>   DISTRO_FEATURES_BACKFILL = "\
>     largefile nfsroot modules ld-is-gold ${PROJECT_FEATURES} \
>     ${DISTRO_FEATURES_INITMAN} \
>     ${@base_contains('PROJECT_FEATURES', 'alsa', 'sound', '', d)} \
>     ${@base_contains('PROJECT_FEATURES', 'directfb', 'screen', '', d)} \
>     ${@base_contains('PROJECT_FEATURES', 'fb', 'screen', '', d)} \
>     ${@base_contains('PROJECT_FEATURES', 'mmc', 'ext2 vfat', '', d)} \
>     ${@base_contains('PROJECT_FEATURES', 'touchscreen', 'screen', '', d)} \
>     ${@base_contains('PROJECT_FEATURES', 'ubifs', 'mtd', '', d)} \
>     ${@base_contains('PROJECT_FEATURES', 'jffs2', 'mtd', '', d)} \
>     ${@base_contains('PROJECT_FEATURES', 'usbclient', 'usb usbgadget', '', d)} \
>     ${@base_contains('PROJECT_FEATURES', 'usbgadget', 'usb usbclient', '', d)} \
>     ${@base_contains('PROJECT_FEATURES', 'usbhost', 'ext2 vfat', '', d)} \
>     ${@base_contains('PROJECT_FEATURES', 'usbhost', 'usb', '', d)} \
>     ${@base_contains('PROJECT_FEATURES', 'x11', 'screen', '', d)} \
>   "
>   
>   DISTRO_FEATURES_BACKFILL_CONSIDERED = "${NO_PROJECT_FEATURES}"
> 
> in my distro configuration (I knew; some are machine but no distro
> features but this does not matter for me) and want to allow projects to
> add new features and to remove default ones.

This does seem rather like an abuse of DISTRO_FEATURES_BACKFILL.  Can
you explain why you are doing it this way rather than just setting
DISTRO_FEATURES directly to what you wanted?

p.




