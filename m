Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SmPKg-0001mo-BL for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 15:09:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q64CwIKj023518
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jul 2012 13:58:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20900-10 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2012 13:58:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q64CwAeV023511
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jul 2012 13:58:12 +0100
Message-ID: <1341406689.3906.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jul 2012 13:58:09 +0100
In-Reply-To: <CAJ2CSBv9amOtH=LdU+37ZoNo0LB0B6uJ-=osARD0d_Chuppu9Q@mail.gmail.com>
References: <CAJ2CSBv9amOtH=LdU+37ZoNo0LB0B6uJ-=osARD0d_Chuppu9Q@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Files not getting into the debug packages
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
X-List-Received-Date: Wed, 04 Jul 2012 13:09:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-04 at 15:19 +0300, Damian, Alexandru wrote:
> Hi guys,
> 
> I'm trying to run a udev package upgrade (See attached patch).
> 
> I get this error, 
> 
> ERROR: QA Issue: non debug package contains .debug directory: udev
> path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/v4l_id
> ERROR: QA Issue: non debug package contains .debug directory: udev
> path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/cdrom_id
> ERROR: QA Issue: non debug package contains .debug directory: udev
> path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/mtd_probe
> ERROR: QA Issue: non debug package contains .debug directory: udev
> path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/accelerometer
> ERROR: QA Issue: non debug package contains .debug directory: udev
> path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/scsi_id
> ERROR: QA Issue: non debug package contains .debug directory: udev
> path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/udevd
> ERROR: QA Issue: non debug package contains .debug directory: udev
> path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/keymap
> ERROR: QA Issue: non debug package contains .debug directory: udev
> path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/collect
> ERROR: QA Issue: non debug package contains .debug directory: udev
> path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/ata_id
> ERROR: QA run found fatal errors. Please consider fixing them.
> 
> 
> although I added the files to the debug package (I think)
> 
>  FILES_${PN}-dbg += "${libexecdir}/.debug"
> +FILES_${PN}-dbg += "${libexecdir}/udev/udev/.debug/"
> +FILES_${PN}-dbg += "${libexecdir}/udev/udev/.debug/*"
>  FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"
> 
> Can somebody please point out what I'm doing wrong ?

The path in question is:

/lib/udev/udev/

and libexecdir is /usr/libexec/ so 

${libexecdir}/udev/udev/.debug/

expands to the wrong thing. You probably want ${base_libdir}/udev/udev/.
The double udev there does look a little odd...

Cheers,

Richard





