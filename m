Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ubuq0-0003gV-JN for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 17:39:06 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UbuYR-0004QQ-TT; Mon, 13 May 2013 17:20:48 +0200
Message-ID: <1368458447.6920.30.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Date: Mon, 13 May 2013 16:20:47 +0100
In-Reply-To: <1368449357-3191-2-git-send-email-jukka.rissanen@linux.intel.com>
References: <1368449357-3191-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1368449357-3191-2-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/5] connman: Add VPN support
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
X-List-Received-Date: Mon, 13 May 2013 15:39:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-05-13 at 15:49 +0300, Jukka Rissanen wrote:
> +do_install_append_${PN}-vpn() {
> +	mkdir -p ${D}${libdir}/connman/scripts
> +	mkdir -p ${D}${libdir}/connman/plugins-vpn
> +}
> +

Does that actually do anything useful?

>+bb.note( "Adding rdependency on %s to %s" % ( rdepends, package ) )

I know the existing connman.inc does the same thing, but I don't think
we want to proliferate this sort of debugging chit-chat in new code.

Also, the way that this code (both the existing stuff and the new block
you've added) interacts with do_split_packages() is a bit hokey.  You
have a hook function which basically just adds an entry to a list, and
then a separate loop which iterates over the resulting list and fiddles
with the RDEPENDS.  As far as I can tell there's no reason that the
RDEPENDS tinkering couldn't be done inside the hook function itself,
which would avoid having two copies of essentially the same code.

> -FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
> +FILES_${PN} = "${sbindir}/connmand ${libexecdir}/* ${libdir}/lib*.so.* \
>              ${libdir}/connman/plugins \
> -            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
> -            ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
> -            ${datadir}/dbus-1/system-services/*"
> +            ${sysconfdir}/connman ${sysconfdir}/dbus-1/system.d/connman.conf \
> +            @base_contains('DISTRO_FEATURES','sysvinit','${sysconfdir}/init.d','',d)} \
> +            ${sharedstatedir} ${localstatedir} \
> +            ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* \
> +            ${datadir}/${PN}"

That seems like rather a wide-ranging set of changes.  You prepended
${PN}-vpn to PACKAGES which should mean that it gets first pick of the
FILES.  Are all those changes to FILES_${PN} actually necessary?

p.




