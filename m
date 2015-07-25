Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C062A76248
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 07:29:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 25 Jul 2015 00:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,542,1432623600"; d="scan'208";a="754538251"
Received: from unknown (HELO [10.252.22.224]) ([10.252.22.224])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2015 00:29:34 -0700
Message-ID: <1437809373.11632.22.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Pau Espin Pedrol <pespin.shar@gmail.com>
Date: Sat, 25 Jul 2015 10:29:33 +0300
In-Reply-To: <CAEGpDubFdWgrcje9hzz9CQ56MDB2kfQ5GKOG0Y9qEzsqz63=8A@mail.gmail.com>
References: <1437746580-31696-1-git-send-email-pau.espin@aweurope.be>
	<1437746580-31696-2-git-send-email-pau.espin@aweurope.be>
	<CAEGpDubFdWgrcje9hzz9CQ56MDB2kfQ5GKOG0Y9qEzsqz63=8A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] systemd.bbclass: Use systemd_system_unitdir
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
X-List-Received-Date: Sat, 25 Jul 2015 07:29:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-07-24 at 17:10 +0200, Pau Espin Pedrol wrote:
> Hi,
> 
> actually this breaks build of systemd.bb itself, because it installs
> its system recipes using paths from Makefile.am:
>         userunitdir=$(prefix)/lib/systemd/user
>         systemunitdir=$(rootprefix)/lib/systemd/system
> 
> And in the recipe for systemd_219.bb we have:
>         # Helper variables to clarify locations.  This mirrors the
>         logic in systemd's
>         # build system.
>         rootprefix ?= "${base_prefix}"
>         rootlibdir ?= "${base_libdir}"
>         rootlibexecdir = "${rootprefix}/lib"
> 
> 
> So, that means it installs its own services into /lib, not /usr/lib.
> The changes done in systemd.bbclass in this patch remove the search
> path of /lib, allowing only ${system_system_unitdir} which is
> "/usr/lib/systemd/system".
> 
> 
> I tried changing rootprefix to use "${prefix}" but then I get other
> problems:
>         ERROR: QA Issue: systemd: Files/directories were installed but
>         not shipped
>           /usr/bin/udevadm
>           /usr/bin/journalctl
>           /usr/bin/loginctl
>           /usr/bin/machinectl
>           /usr/bin/systemctl
>           /usr/lib/udev/.debug
>           /usr/lib/udev/.debug/cdrom_id
>           /usr/lib/udev/.debug/collect
>           /usr/lib/udev/.debug/ata_id
>           /usr/lib/udev/.debug/v4l_id
>           /usr/lib/udev/.debug/mtd_probe
>           /usr/lib/udev/.debug/scsi_id
>           /usr/lib/udev/.debug/accelerometer
>           /usr/lib/udev/rules.d/70-uaccess.rules
>           /usr/lib/udev/rules.d/73-seat-late.rules
>           /usr/lib/udev/rules.d/71-seat.rules
>           /usr/lib/udev/rules.d/99-systemd.rules
> 
> 
> Which at the end makes me think... is it really a good idea to set
> systemd_unitdir and system_system_unitdir to use "${nonarch_libdir}"?
> I think we should be better using ${nonarch_base_libdir} for those, as
> systemd guys themselves make distinction between both (prefix vs
> rootprefix).

I agree. ${nonarch_base_libdir} seems to be definitely the right place
to put system service files. This may change if some day nobody will
have a separate /usr partition any more (which is what the systemd
developers are pushing for, AFAIK), but as long as we have to deal with
systems with a separate /usr partition, I think using /lib is the only
safe choice.

-- 
Tanu



