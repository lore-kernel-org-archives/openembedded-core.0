Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RaN9w-0006Ep-FN
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 08:52:20 +0100
Received: by eekb15 with SMTP id b15so2899286eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2011 23:45:22 -0800 (PST)
Received: by 10.14.35.163 with SMTP id u35mr2379213eea.195.1323762321822;
	Mon, 12 Dec 2011 23:45:21 -0800 (PST)
Received: from [212.238.50.153] (ip212-238-50-153.hotspotsvankpn.com.
	[212.238.50.153])
	by mx.google.com with ESMTPS id 17sm85937018eej.3.2011.12.12.23.45.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 23:45:20 -0800 (PST)
References: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>
	<1323759539-23945-1-git-send-email-lauri.hintsala@bluegiga.com>
In-Reply-To: <1323759539-23945-1-git-send-email-lauri.hintsala@bluegiga.com>
Mime-Version: 1.0 (1.0)
Message-Id: <CCC5D6B0-34D4-445E-A0A6-FED2FEF1CF7A@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (9A405)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 13 Dec 2011 08:45:29 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] initscripts: fix timestamp check at bootmisc.sh
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
X-List-Received-Date: Tue, 13 Dec 2011 07:52:20 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 13 dec. 2011 om 07:58 heeft Lauri Hintsala <lauri.hintsala@bluegiga.com> h=
et volgende geschreven:

> Timestamp checking has been broken by the commit
> 2078af333d704fd894a2dedbc19cef5775cdadbb. Fix timestamp checking
> and clean the code.
>=20
> cc: sgw@linux.intel.com
> cc: gary@mlbassoc.com
>=20
> Signed-off-by: Lauri Hintsala <lauri.hintsala@bluegiga.com>
> ---
> .../initscripts/initscripts-1.0/bootmisc.sh        |   12 ++++++------
> 1 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/m=
eta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> index 03fd67c..6d68b35 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> @@ -62,16 +62,16 @@ then
> fi
>=20
> # Set the system clock from hardware clock
> -# If the timestamp is 1 day or more recent than the current time,
> +# If the timestamp is more recent than the current time,
> # use the timestamp instead.
> /etc/init.d/hwclock.sh start
> if test -e /etc/timestamp
> then
> -    SYSTEMDATE=3D`date  -u +%2m%2d%2H%2M%4Y`
> -    read TIMESTAMP < /etc/timestamp
> -        NEEDUPDATE=3D`expr \( $TIMESTAMP \> $SYSTEMDATE + 10000 \)`
> -        if [ $NEEDUPDATE -eq 1 ]; then=20
> -        date -u $TIMESTAMP
> +    SYSTEMDATE=3D`date -u +%4Y%2m%2d`
> +    TIMESTAMP=3D`cat /etc/timestamp | awk '{ print substr($0,9,4) substr(=
$0,1,4); }'`
> +    NEEDUPDATE=3D`expr \( $TIMESTAMP \> $SYSTEMDATE \)`
> +    if [ $NEEDUPDATE -eq 1 ]; then
> +        date -u `cat /etc/timestamp`
>        /etc/init.d/hwclock.sh stop
>    fi
> fi

This changes the format of timestamp, which breaks the code in image.bbclass=
.

Have a look at http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-an=
gstrom/commit/?id=3De003be8cba3d387f44a502fdbebf58e774afd677 for backwards c=
ompatible Logic=20




> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


