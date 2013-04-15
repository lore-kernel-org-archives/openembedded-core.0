Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URghh-0001tX-Jo
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:32:14 +0200
Received: by mail-ea0-f173.google.com with SMTP id k11so2066065eaj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=UNNfZb9yj8M4inEMvXaJRkNBgjFCiQ0Ct6p60rCI/pM=;
	b=VxPIXftLZhLxxccHVbeipz1sDNtzy+y9thlHd+GUzZviZXyMbI/dQq+6tQ050z3Qj5
	B98o8JHPOeMGohv9t04aXbL8cpMVLNtvVwZGJ4x7AUFXj/vMRY1qFLHED774kBf4+G9o
	L/mNxeQitmaUuREkkEjXfzy65JBexanrcMixywHH9jBu+RPsBmnVeggeMY/YzsqwG3tF
	T4nJ/nm+JkkJsT6ry0symxL24lX65BMe7jdkkOdUT+PvQKB+N2/FA1uXloiPuCzcDQxb
	4tSPkcC2GzuCfDsO/gdypmoA+aYeDzKS/vV+Odw2HPIZ7Ny9kYbIkTuxIg7d3kf5GVYk
	AsFg==
X-Received: by 10.15.76.132 with SMTP id n4mr60446299eey.16.1366020877163;
	Mon, 15 Apr 2013 03:14:37 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id w51sm2173338eev.13.2013.04.15.03.14.35
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 03:14:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1366020508.2896.16.camel@localhost>
Date: Mon, 15 Apr 2013 12:14:35 +0200
Message-Id: <2414F102-4A91-4B6E-A34C-B1D88E3BBDF5@dominion.thruhere.net>
References: <1365848719.16702.74.camel@ted>
	<1365944532.5651.12.camel@localhost> <1365953596.8670.9.camel@ted>
	<1366020508.2896.16.camel@localhost>
To: Colin Walters <walters@verbum.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmlTL2iJU7yDHOhiKeaq5jbOKqDCQLaYxjCQYTLX0qD2CBjq9lsle/emZZcRuYdtVIHWqED
Cc: mclasen@redhat.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: Fix libpng determinism issues
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
X-List-Received-Date: Mon, 15 Apr 2013 10:32:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 12:08 heeft Colin Walters <walters@verbum.org> het =
volgende geschreven:

> On Sun, 2013-04-14 at 16:33 +0100, Richard Purdie wrote:
>> On Sun, 2013-04-14 at 09:02 -0400, Colin Walters wrote:
>> The more interesting change is:
>>=20
>> =
https://git.gnome.org/browse/gdk-pixbuf/commit/configure.ac?id=3Dd430bc4df=
3314a88cd538474d26ff7764d1f408c
>>=20
>> and following that to the bugzilla 'For this to make sense, I changed
>> the order so that a version specific dep, such as libpng15 or
>> libpng12,
>> is found before just "libpng".'
>>=20
>> I'm not sure I entirely follow that logic.
>=20
> I added Matthias to CC as he touched this last then.
>=20
>> I think the intent of the symlink is to provide the system with a
>> default libpng to use in the absence of a specific version =
requirement.
>> As the code stands today, each time a new libpng comes out, =
gdk-pixbuf
>> will need changes before it will be able to use it.=20
>=20
> Right, we need configure.ac changes, but the rationale behind that is
> that we'd also need *code* changes for each new major version of =
libpng.
> But it sounds like what you're saying is that gdk-pixbuf compiles and
> operates correctly with 1.6?  If that's the case, then the least
> invasive change here is to simply add 1.6.
>=20
> Blah, I tried changing the gnome-ostree build to fetch libpng's v1.6.1
> git tag to test, but it hard requires Automake 1.13.

Only for parallel unit tests, I just sent a patch to update libpng to =
v1.6.1 to oe-core. It doesn't fix the problems I'm having with PNGs in =
weston, so please test it and see if it fixed any of your problems.

regards,

Koen

>=20
> Anyways, if it works (looks like the latest oe-core has it), then
> what about the attached?
>=20
>> In the meantime, it
>> will potentially link against something old, e.g. 1.2, since 1.2 is =
in
>> the LSB 4.X spec so most LSB like systems would have 1.6 and 1.2.
>>=20
>> If we can justify changing this upstream, that would be great :). It =
may
>> be worth adding libpng16 into the list too so everything is covered =
too.
>=20
> At this point I'm hoping the parade of libpng versions will
> settle down, so hopefully no further tweaking of the configure script =
or
> code will be required...
>=20
>=20
> =
<0001-build-We-also-support-libpng16.patch>_______________________________=
________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



