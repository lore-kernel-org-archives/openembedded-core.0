Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SBDOZ-0007Q1-2p
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 23:55:43 +0100
Received: by iaag37 with SMTP id g37so5352303iaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=bO91hxRTJFTPo6L1FyfNKnhadH8bMnq+4C3WjsYTMM4=;
	b=rICX13DCOxs/NZfPHGULRhFZdykyeZGkmqOdv2oaNQGWtdkQzdIJr+W1kL22ZWKKV3
	Y4fr/0sa0oOcWLx2YXYjq1morpkFsB1QqZSdV4YmNelExnshtJuwIfElLSqBXlZoR0PQ
	UcyWErfdauSjUUexhtHaRA+3r5QKNv53jfpr24FuKoAhDUh2G9fSCn4gW3dm/iaS57Sk
	BAHDK3iUA10//vGrIA39xQOV6FPNPt/F+kT8oLdmCyr7hs5JwbkRulb8EUhs+XNCKn3w
	pzgmU9vByDZ/iLhxQXiYAoKcYh2E50uy3BOhkYCyw1bTZ371mmhfzhLiPokc5UiqI1RP
	pslg==
MIME-Version: 1.0
Received: by 10.50.192.228 with SMTP id hj4mr172144igc.65.1332542805915; Fri,
	23 Mar 2012 15:46:45 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Fri, 23 Mar 2012 15:46:45 -0700 (PDT)
In-Reply-To: <1332504745.9740.398.camel@ted>
References: <1332443701-24282-1-git-send-email-schnitzeltony@googlemail.com>
	<1332504745.9740.398.camel@ted>
Date: Fri, 23 Mar 2012 23:46:45 +0100
Message-ID: <CALbNGRT8Wb2gt7un4efD+szwz3kPZ5pns-4G6EusspH5iYYuZA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 23 Mar 2012 22:55:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 1:12 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-03-22 at 20:15 +0100, Andreas M=FCller wrote:
>> * Before this patch every inheritance of this class rebuilt the full ico=
n cache at the first boot.
>> * With this patch the icon cache will only be build once at the first bo=
ot and on pkg installations that require it.
>> * This patch reduces the time needed for the first boot from 96 minutes =
to 5 minutes on the test machine.
>> * Build-tested incremental (BB_SIGNATURE_HANDLER =3D "OEBasicHash") & fr=
om scratch
>> * Run-tested with systemd and opkg
>>
>> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>> ---
>> =A0meta/classes/gtk-icon-cache.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 19 +++++++++-------
>> =A0.../gtk+/gtk-update-icon-cache-runonce.bb =A0 =A0 =A0 =A0 =A0| =A0 23=
 ++++++++++++++++++++
>> =A0.../gtk-update-icon-cache-runonce.in =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 16 +++++++++++++
>> =A03 files changed, 50 insertions(+), 8 deletions(-)
>> =A0create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-runo=
nce.bb
>> =A0create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-runo=
nce/gtk-update-icon-cache-runonce.in
>>
>> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon=
-cache.bbclass
>> index 60e3401..b48aabe 100644
>> --- a/meta/classes/gtk-icon-cache.bbclass
>> +++ b/meta/classes/gtk-icon-cache.bbclass
>> @@ -9,14 +9,16 @@ if [ "x$D" !=3D "x" ]; then
>> =A0 =A0 =A0 =A0 =A0exit 1
>> =A0fi
>>
>> -# Update the pixbuf loaders in case they haven't been registered yet
>> -GDK_PIXBUF_MODULEDIR=3D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixb=
uf-query-loaders --update-cache
>> -
>> -for icondir in /usr/share/icons/* ; do
>> - =A0 =A0if [ -d $icondir ] ; then
>> - =A0 =A0 =A0 =A0gtk-update-icon-cache -fqt =A0$icondir
>> - =A0 =A0fi
>> -done
>> +# do not execute in case a final run-once is waiting
>> +if [ ! -e ${sysconfdir}/init.d/gtk-update-icon-cache-runonce ]; then
>> + =A0 =A0# Update the pixbuf loaders in case they haven't been registere=
d yet
>> + =A0 =A0GDK_PIXBUF_MODULEDIR=3D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders =
gdk-pixbuf-query-loaders --update-cache
>> + =A0 =A0for icondir in /usr/share/icons/* ; do
>> + =A0 =A0 =A0 =A0if [ -d $icondir ] ; then
>> + =A0 =A0 =A0 =A0 =A0 =A0gtk-update-icon-cache -fqt =A0$icondir
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0done
>> +fi
>
>
> Can't we just reduce this to adding a "touch
> ${sysconfdir}/init.d/gtk-update-icon-cache-runonce" to the above code
> and then clear that file at boot time?
>
Maybe it's a misunderstanding on my side but how shall an empty file
cover the three tasks during 1st boot:

1. Preventing all postints of running gtk-update-icon-cache by existing
2. Running gtk-update-icon-cache ( after postinsts )
3. Deleting itself and thereby avoid running during subsequent boots
and ensuring that packages which are installed later do run
gtk-update-icon-cache.

Andreas


