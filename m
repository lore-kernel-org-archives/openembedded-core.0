Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCu1M-0001cU-9m
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 15:34:12 +0200
Received: by wwb17 with SMTP id 17so1767075wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 06:31:47 -0700 (PDT)
Received: by 10.216.122.10 with SMTP id s10mr2098350weh.34.1303392706861;
	Thu, 21 Apr 2011 06:31:46 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y29sm1197730wbd.4.2011.04.21.06.31.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 06:31:45 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <973393A9-5CAC-4332-9317-D8CFF5AA1C10@dominion.thruhere.net>
Date: Thu, 21 Apr 2011 15:31:43 +0200
Message-Id: <A5B9DAB8-48EC-4172-B368-6DBB530C8043@dominion.thruhere.net>
References: <1303388485-25698-1-git-send-email-koen@dominion.thruhere.net>
	<20110421123115.GB6678@jama.jama.net>
	<973393A9-5CAC-4332-9317-D8CFF5AA1C10@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] librsvg 2.32.1: fix postinst script
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
X-List-Received-Date: Thu, 21 Apr 2011 13:34:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 apr 2011, om 14:43 heeft Koen Kooi het volgende geschreven:

>=20
> Op 21 apr 2011, om 14:31 heeft Martin Jansa het volgende geschreven:
>=20
>> On Thu, Apr 21, 2011 at 02:21:25PM +0200, Koen Kooi wrote:
>>> The symptom:
>>>=20
>>> root@pandaboard-core:~# sh /var/lib/opkg/info/librsvg-2-gtk.postinst
>>> g_module_open() failed for /home/root/--update-cache: =
/home/root/--update-cache.so: cannot open shared object file: No such =
file or directory
>>> root@pandaboard-core:~#
>>>=20
>>> the gdk-pixbuf-query-loaders app doesn't support arguments, only .so =
names, so remove --update-cache
>>=20
>> I can confirm same symptom here
>>=20
>> shouldn't we store output from it as we did in oe.dev to
>> /etc/gtk-2.0/gdk-pixbuf.loaders ?
>=20
> I think we do :) Let's see if other requests come in before I respin =
it.

So Martin and I talked a bit on IRC and we noticed a problem:

root@pandaboard-core:/etc/gtk-2.0# find /usr/lib | grep libpixbufloader
/usr/lib/gtk-2.0/2.10.0/loaders/libpixbufloader-xpm.so
/usr/lib/gtk-2.0/2.10.0/loaders/libpixbufloader-jpeg.so
/usr/lib/gtk-2.0/2.10.0/loaders/libpixbufloader-svg.so
/usr/lib/gtk-2.0/2.10.0/loaders/libpixbufloader-gif.so
/usr/lib/gtk-2.0/2.10.0/loaders/libpixbufloader-png.so
root@pandaboard-core:/etc/gtk-2.0#=20

On Martins system those are in /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders. =
So the postinst script needs to know where to look. Do we want to =
provide backward compatibility for older gtk releases with an extra if =
statement?

regards,

Koen=


