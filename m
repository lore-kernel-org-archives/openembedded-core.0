Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SB3Uj-0000of-Si for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 13:21:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NCCURK026410
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:12:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26101-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:12:26 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NCCMAx026403
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:12:23 GMT
Message-ID: <1332504745.9740.398.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Mar 2012 12:12:25 +0000
In-Reply-To: <1332443701-24282-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332443701-24282-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q2NCCURK026410
Subject: Re: [PATCH] gtk-icon-cache.bbclass: Fix multiple rebuilds of the icon cache on first boot
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
X-List-Received-Date: Fri, 23 Mar 2012 12:21:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-03-22 at 20:15 +0100, Andreas M=C3=BCller wrote:
> * Before this patch every inheritance of this class rebuilt the full ic=
on cache at the first boot.
> * With this patch the icon cache will only be build once at the first b=
oot and on pkg installations that require it.
> * This patch reduces the time needed for the first boot from 96 minutes=
 to 5 minutes on the test machine.
> * Build-tested incremental (BB_SIGNATURE_HANDLER =3D "OEBasicHash") & f=
rom scratch
> * Run-tested with systemd and opkg
>=20
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/classes/gtk-icon-cache.bbclass                |   19 +++++++++---=
----
>  .../gtk+/gtk-update-icon-cache-runonce.bb          |   23 ++++++++++++=
++++++++
>  .../gtk-update-icon-cache-runonce.in               |   16 ++++++++++++=
+
>  3 files changed, 50 insertions(+), 8 deletions(-)
>  create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-runon=
ce.bb
>  create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-runon=
ce/gtk-update-icon-cache-runonce.in
>=20
> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-ico=
n-cache.bbclass
> index 60e3401..b48aabe 100644
> --- a/meta/classes/gtk-icon-cache.bbclass
> +++ b/meta/classes/gtk-icon-cache.bbclass
> @@ -9,14 +9,16 @@ if [ "x$D" !=3D "x" ]; then
>          exit 1
>  fi
> =20
> -# Update the pixbuf loaders in case they haven't been registered yet
> -GDK_PIXBUF_MODULEDIR=3D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pix=
buf-query-loaders --update-cache
> -
> -for icondir in /usr/share/icons/* ; do
> -    if [ -d $icondir ] ; then
> -        gtk-update-icon-cache -fqt  $icondir
> -    fi
> -done
> +# do not execute in case a final run-once is waiting
> +if [ ! -e ${sysconfdir}/init.d/gtk-update-icon-cache-runonce ]; then
> +    # Update the pixbuf loaders in case they haven't been registered y=
et
> +    GDK_PIXBUF_MODULEDIR=3D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk=
-pixbuf-query-loaders --update-cache
> +    for icondir in /usr/share/icons/* ; do
> +        if [ -d $icondir ] ; then
> +            gtk-update-icon-cache -fqt  $icondir
> +        fi
> +    done
> +fi


Can't we just reduce this to adding a "touch
${sysconfdir}/init.d/gtk-update-icon-cache-runonce" to the above code
and then clear that file at boot time?

Cheers,

Richard



