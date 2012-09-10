Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TB7WG-00031f-Ma
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 19:11:32 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TB7KD-0008MG-3t; Mon, 10 Sep 2012 18:59:05 +0200
From: Phil Blundell <philb@gnu.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Mon, 10 Sep 2012 17:59:04 +0100
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6696DB@039-SN1MPN1-001.039d.mgd.msft.net>
References: <cover.1344892361.git.scott.a.garman@intel.com>
	<2e7dddfce4a40a56f671116a2001b13c57667c70.1344892361.git.scott.a.garman@intel.com>
	<1347139311.4396.253.camel@x121e.pbcl.net>
	<70CC66F5C30A414DADDA6973E4CA391A6696DB@039-SN1MPN1-001.039d.mgd.msft.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1347296345.2673.258.camel@phil-desktop>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/32] sysvinit-inittab_2.88dsf.bb: Allow multiple serial port consoles to be defined
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
X-List-Received-Date: Mon, 10 Sep 2012 17:11:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-10 at 16:56 +0000, McClintock Matthew-B29882 wrote:
> On Sat, Sep 8, 2012 at 4:21 PM, Phil Blundell <philb@gnu.org> wrote:
> > On Mon, 2012-08-13 at 14:14 -0700, Scott Garman wrote:
> >> +pkg_postinst_${PN} () {
> >> +# run this on the target
> >> +if [ "x$D" == "x" ]; then
> >> +     tmp="${SERIAL_CONSOLES_CHECK}"
> >> +     for i in $tmp
> >> +     do
> >> +             j=`echo ${i} | sed s/^.*\;//g`
> >> +             if [ -z "`cat /proc/consoles | grep ${j}`" ]; then
> >> +                     sed -i /^.*${j}$/d /etc/inittab
> >> +             fi
> >> +     done
> >> +     kill -HUP 1
> >> +else
> >> +     exit 1
> >> +fi
> >> +}
> >
> > This makes the package uninstallable, even if SERIAL_CONSOLES_CHECK is
> > empty, on a READ_ONLY_ROOTFS.
> 
> What do you mean uninstallable? I could see this generating an error
> message at each boot, but not sure what you mean about uninstallable.

rootfs_ipk will refuse to generate a rootfs containing unconfigured
packages if IMAGE_FEATURES says that it should be read-only.

p.




