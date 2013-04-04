Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UNkRO-0002sv-2M; Thu, 04 Apr 2013 15:43:01 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r34DaN1M013347; Thu, 4 Apr 2013 14:36:23 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1-5EFjzVVNt6; Thu,  4 Apr 2013 14:36:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r34DaHmZ013323
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 4 Apr 2013 14:36:20 +0100
Message-ID: <1365081933.6526.107.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Thu, 04 Apr 2013 14:25:33 +0100
In-Reply-To: <CALbNGRSj7uahrGy1DoSe5zJasciTf2Q7j1xj5N8V-cs_WOW+4g@mail.gmail.com>
References: <CALbNGRSj7uahrGy1DoSe5zJasciTf2Q7j1xj5N8V-cs_WOW+4g@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r34DaN1M013347
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: experiences with images based on current layer heads
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
X-List-Received-Date: Thu, 04 Apr 2013 13:43:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-04-03 at 16:02 +0200, Andreas M=C3=BCller wrote:
> Hi,
>=20
> when migration of systemd to oe-core turned to unbuildable I decided
> to freeze my images and stopped further tests. Now that many issues
> were fixed and we are close to another release I built my standard
> xfce-based image based on latest layer HEADs. With this I face some
> issues which I would like to share:
>=20
> 1. X sessions crash with OOM. This is reproducible by opening
> google-maps with midori and changing to satellite view. In
> Xorg.0.log.old I see only
>=20
> | (EE)
> | (EE) Backtrace:
> | (EE)
> | (EE) Segmentation fault at address 0x9
> | (EE) BUG: triggered 'if (inSignalContext)'
> | (EE) BUG: log.c:502 in LogVMessageVerb()
> | (EE) Warning: attempting to log data in a signal unsafe manner while
> in signal context.
> | Please update to check inSignalContext and/or use
> LogMessageVerbSigSafe() or ErrorFSigSafe().
> | The offending log format message is:
> |
> | Fatal server error:
> |
> | (EE)
> | (EE) Backtrace:
> | (EE)
>=20
> With old images only the process causing OOM were stopped. I did not
> fully cross check but I have the feeling that OOM appears much much
> more often than with old images. Sometimes x- session is closed
> without opening an additional application.
>=20
> 2. Something with udisks/gvfs/thunar-volman seems broken. When
> auto-mounting, the partitions cannot be mounted by label-name. On
> plugging a memory stick I see in kernel log
>=20
> | VFS: could not find a valid V7 on sda.
>=20
> Same kernel works properly with old images.
>=20
> 3. dhclient.service does not start (this has never worked):
>=20
> root@overo:~# systemctl status dhclient.service
> dhclient.service - Dynamic Host Configuration Protocol (DHCP)
>           Loaded: loaded (/lib/systemd/system/dhclient.service; enabled=
)
>           Active: failed (Result: resources) since Sat 2000-01-01
> 00:58:02 UTC; 7min ago
>          Process: 177 ExecStart=3D/sbin/dhclient -cf
> /etc/dhcp/dhclient.conf -q -lf /var/lib/dhcp/dhclient.leases
> $INTERFACES (code=3Dexited, status=3D0/SUCCESS)
>=20
> Jan 01 00:58:01 overo systemd[1]: Starting Dynamic Host Configuration
> Protocol (DHCP)...
> Jan 01 00:58:02 overo systemd[1]: PID file /var/run/dhclient.pid not
> readable (yet?) after start.
>=20
> I wonder what happens to networkmanager once this autostart will work...
>=20
> will test further...

The data is certainly interesting, thanks for sharing. It would
obviously be good to dig into and fix these issues, at least tracking
the ones from OE-Core in the bugzilla might help so people are aware of
the issue and of any progress that is made by anyone looking into it...

Cheers,

Richard





