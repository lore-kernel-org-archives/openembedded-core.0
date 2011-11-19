Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RRr0L-0004D7-2U
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Nov 2011 20:55:13 +0100
Received: by wwp14 with SMTP id 14so6097000wwp.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2011 11:48:45 -0800 (PST)
Received: by 10.216.153.137 with SMTP id f9mr1191985wek.4.1321732125316;
	Sat, 19 Nov 2011 11:48:45 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l2sm5932064wbn.0.2011.11.19.11.48.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Nov 2011 11:48:44 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAEsOVNf_xbHAv22_drG+oXMMOCQCjLNc7tqpSA-N7yjAGEkxbA@mail.gmail.com>
Date: Sat, 19 Nov 2011 20:48:40 +0100
Message-Id: <486862D8-72D7-49B1-A5C9-1FDE8B65C16E@dominion.thruhere.net>
References: <1321570027-29390-1-git-send-email-msm@freescale.com>
	<CAP9ODKqjGqLg3u-VzFBAqhVSDUBUwG5eFSTtZcv+Zo7mnPLEAQ@mail.gmail.com>
	<CAEsOVNeb2SLwPX74YDcA4-iFJ6TNm7OAkXUw9Fun-nBkVkhaMA@mail.gmail.com>
	<CAP9ODKpA3smbm3MhiXJCOnFqBOZs7DoSRomE1rZP6Ys0bkW2bQ@mail.gmail.com>
	<CAEsOVNcW=g+cjM9w_tECrmpX0pSoDj80ohtu253PK8h2cVpyRw@mail.gmail.com>
	<CAP9ODKqyzY706Z+gpD6X2G2JBf6frki6S07=NabBxFMxB5pojg@mail.gmail.com>
	<CAEsOVNf_xbHAv22_drG+oXMMOCQCjLNc7tqpSA-N7yjAGEkxbA@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] Remove ttyS* from /etc/inittab that are not present
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
X-List-Received-Date: Sat, 19 Nov 2011 19:55:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 nov. 2011, om 19:59 heeft McClintock Matthew-B29882 het volgende =
geschreven:

> On Sat, Nov 19, 2011 at 8:29 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>>> It must be online though in this case?
>>=20
>> The code you add needs to be running on target and doesn't work at
>> rootfs built time. This is bad and adds more complications to
>> read-only-fs support.
>=20
> This works *perfectly* with a read only fs. Each time it boots removes
> the non-working serial ports. One could argue that it does NOT work
> completely as expected with a writable file system.
>=20
>>>> This could be done with a specific package that could mangle the
>>>> image at first boot if really need but doing it by default on =
oe-core
>>>> seems the wrong way.
>>>=20
>>> Isn't that exactly what this is doing?
>>>=20
>>> Easy enough to add this to a separate recipe or bbapends elsewhere =
if
>>> there is disagreement.
>>=20
>> The need to diverge from machine default is the exception and this
>> could be handled on the image being built, as post rootfs hook or an
>> specific package with postinst to be run at target boot to setup it,
>> and not by default.
>=20
> This will not work as a post rootfs hook as I've explained before. Let
> me give you a more concrete example: We have a root file stored in
> flash. We use it to boot from on a system with 4 serial ports. We use
> the same image again to boot several kvm instances each of which only
> have 1 serial port. The kvm instances will have spurious init messages
> about respawning getty.

Or you could just ditch sysvinit and switch to systemd. Systemd will =
only spawn a getty when udev says the device is there. And even better, =
every getty config is a file you can delete to disable it if for some =
reason the kernel reports the serial port to be there and you don't want =
a getty.

regards,

Koen=


