Return-Path: <roman@khimov.ru>
Received: from roman.khimov.ru (roman.khimov.ru [82.146.54.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA1C6011C;
	Tue, 24 Nov 2015 18:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=khimov.ru;
	s=mail; 
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:Reply-To:To:From;
	bh=TLIjNZpUu1ydiBxgnYDFNycA1pd1oXV4vF0xlTuJAd4=; 
	b=kXzAs2WtsDeHhtK8zS0twDNWtz0OSEkkQ+HmMxG9PpvxSwPSX/VSdac873wuamgTsctVBmeOj53UJ/Zt1yWAXKlNTn8GLF5L2aiHfO2Cs+uE8Z/8wH1UqtBubZmXcX30vAZgmZfCg65s8x0A/+mmndO2OMs0kn4uAzhbHjz2biZGNUPF1NBtKyZEEcv05tXWQEWK4GoH8JuGG5kzRMJhmdcb6ktWivmIQgE/3TLIKSL/fRcz/8M5pOJ3V7x0jpQ/qEiu/HKdZ2pNJ09GKX6Bx8Ht/gczolSj/SO8w70Q8BbvL8sBZ+krczTzTtFd77To3SybtgLkAuOvvoNPXu5dPA==;
Received: from [93.100.16.104] (helo=masala.hex)
	by roman.khimov.ru with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.84) (envelope-from <roman@khimov.ru>)
	id 1a1HyT-0002L3-Es; Tue, 24 Nov 2015 21:05:54 +0300
From: Roman Khimov <roman@khimov.ru>
To: Mark Hatle <mark.hatle@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Reply-To: roman@khimov.ru
Date: Tue, 24 Nov 2015 21:05:52 +0300
Message-ID: <90526450.BhUWnDVvgQ@masala.hex>
User-Agent: KMail/4.14.10 (Linux/4.1.12-1-default; KDE/4.14.10; x86_64; ; )
In-Reply-To: <56546A7A.6010207@windriver.com>
References: <56538808.5050606@linux.intel.com> <14934048.INuFbpGn5J@bancha.hex>
	<56546A7A.6010207@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] RFC: Reference updater filesystem
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Nov 2015 18:05:57 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 24 =D0=BD=D0=BE=
=D1=8F=D0=B1=D1=80=D1=8F 2015 07:47:38 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=
=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Mark Hatle =D0=BD=D0=B0=D0=BF=D0=
=B8=D1=81=D0=B0=D0=BB:
> On 11/24/15 4:39 AM, Roman Khimov wrote:
> > =D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 23 =D0=BD=D0=
=BE=D1=8F=D0=B1=D1=80=D1=8F 2015 15:41:28 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=
=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Mariano Lopez =D0=BD=D0=B0=D0=
=BF=D0=B8=D1=81=D0=B0=D0=BB:
> >> 1. Use a separate partition for the configuration.
> >>=20
> >>    a. The pro of this method is the partition is not touched durin=
g the
> >>=20
> >> update.
> >>=20
> >>    b. The con of this method is the configuration is not directly =
in
> >>=20
> >> rootfs (example: /etc).
> >=20
> > That's the right solution, although to do it really right (at least=
 IMO)
> > you need to implement the /usr merge [1] (and that's orthogonal to =
using
> > or not using systemd), which can also help you make your /usr read-=
only
> > (because that's just code and static data) with read-write / for us=
er
> > data of various sorts.
>=20
> Why does merging /usr have anything to do with this?  I've read the c=
ase for
> merging /usr and / and still don't understand why it "helps".  The ke=
y is
> that if you have separate partitions for /usr and /, then you need to=

> update both of them in sequence.  Merging these two just seems like a=
 lazy
> solution to people not wanting to deal with early boot being
> self-contained.

It helps in that you can achieve a clear separation of your software an=
d users=20
data (whatever that is, even if that's just some configuration files) a=
nd only=20
update your part (which is /usr).

> So going back to image upgrade.  The key here is that you need a way =
to
> update arbitrary images with arbitrary contents and a mechanisms that=
 is
> smart enough to generate the update (vs a full image flash) to conser=
ve
> bandwidth.

In my experience, size is almost not an issue these days, at least if w=
e're=20
talking about something less than 100 MB, but updating the whole image =
is more=20
reliable and easier to manage.

--=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

