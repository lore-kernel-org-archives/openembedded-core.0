Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TAShS-000380-PO
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 23:36:22 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TASVR-00077n-LZ
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 23:23:57 +0200
Message-ID: <1347139311.4396.253.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 08 Sep 2012 22:21:51 +0100
In-Reply-To: <2e7dddfce4a40a56f671116a2001b13c57667c70.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
	<2e7dddfce4a40a56f671116a2001b13c57667c70.1344892361.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
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
X-List-Received-Date: Sat, 08 Sep 2012 21:36:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-13 at 14:14 -0700, Scott Garman wrote:
> +pkg_postinst_${PN} () {
> +# run this on the target
> +if [ "x$D" == "x" ]; then
> +	tmp="${SERIAL_CONSOLES_CHECK}"
> +	for i in $tmp
> +	do
> +		j=`echo ${i} | sed s/^.*\;//g`
> +		if [ -z "`cat /proc/consoles | grep ${j}`" ]; then
> +			sed -i /^.*${j}$/d /etc/inittab
> +		fi
> +	done
> +	kill -HUP 1
> +else
> +	exit 1
> +fi
> +}

This makes the package uninstallable, even if SERIAL_CONSOLES_CHECK is
empty, on a READ_ONLY_ROOTFS.

p.




