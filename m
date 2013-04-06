Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UOQh1-0004Y9-LK
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 12:49:56 +0200
Received: by mail-ee0-f41.google.com with SMTP id c1so1708139eek.28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2013 03:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=L0D9vZfLIJV3m+Viie9PvGnIzCkXCbkK2N+pUEY1LFg=;
	b=kd10F88akG+dAy8QPCk4qh62i3hAlO7Wszvn/j5Ao87z/mMHaeg71ceglHdZ8Tnq3E
	SiTcD1BlP8SucK7M9txZ+1mjYapQ92oG5MoGywQh7FxJYOnJhcFlUHMGa28YjiqKKe9R
	tz00SQyMVxuxGTXDpXn13BOCrYl9iHkUR+1uhPbhABlBu+FZ5Kxiw6+e61H8caaWOXO9
	mqIVsJrQQQQ/DtZ0zrbOSxfASDj9BzrY7g17h/Cq6XsoJSj3/LzN9njJM1d4MsloInKF
	3hdXP391+dQYzQKisVAG6TcvuGxhd++w6g5U1YBwciMzSwGJcYnTcDjgN6Dnr6vVDKKx
	v5ug==
X-Received: by 10.14.107.69 with SMTP id n45mr6721822eeg.23.1365244360294;
	Sat, 06 Apr 2013 03:32:40 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id a1sm20216339eep.2.2013.04.06.03.32.38
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Apr 2013 03:32:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1365172473.6526.195.camel@ted>
Date: Sat, 6 Apr 2013 12:32:40 +0200
Message-Id: <AB22E165-191E-4930-929D-E6B277A265F4@dominion.thruhere.net>
References: <1365006329-20964-1-git-send-email-radu.moisan@intel.com>
	<1365006329-20964-3-git-send-email-radu.moisan@intel.com>
	<825B3AFA-0F5B-45F2-B4DE-D359A1E4414B@dominion.thruhere.net>
	<515D75D5.4020204@intel.com>
	<1B3FBA45-5658-4BF8-A854-84058F80DCBF@dominion.thruhere.net>
	<515EBCA1.6000502@intel.com>
	<CAL7ttbc2VXkMz79oyHt69E0wsSvEYqndNHSQMLCDO56TF6v=og@mail.gmail.com>
	<1365172473.6526.195.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQlwsTPe8ahG156GvQBja+JNH8ahUa7hA6CDgi5L6AVXu3E3rTJFdv+zVUD9g5IeiJ1ATJGj
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] udev: enable multilib support
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
X-List-Received-Date: Sat, 06 Apr 2013 10:49:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 apr. 2013, om 16:34 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Fri, 2013-04-05 at 16:29 +0300, Alex Damian wrote:
>> On udev-184 they changed the default location from /sbin/
>> to /lib/udev/ and I kept same as the upstream is.
>=20
> Firstly, I know some people did ask me questions offlist about this =
and
> I probably gave misleading answers. I thought this was a problem with
> the location of the rules directory initially. We need to have one =
rules
> directory regardless of multilibs.
>=20
> Binaries however are a very different question. The multilib code we
> have in OE is complex and does make some assumptions about layout, not
> least as we have to interface into several package managers and also
> work with all their assumptions. The situation is that:
>=20
> * library files are expected to go into /libX
> * binaries are expected to go into the usual bin/sbin dirs
> * files in /etc, /usr/share and other similar directories are expected=20=

>  to be identical
> * We have sanity tests which check for these things
>=20
> The package managers are taught to let certain packages "win" in
> bin/sbin and to error if overlapping files outside this are not
> identical.
>=20
> It therefore follows that we would have to start adding exceptions to
> this code if we have potential for both 32 bit and 64 bit /lib/udev/
> binaries. We'd also have to add rules about which one would be =
expected
> to "win" under which circumstances and so on.
>=20
> To me, the simplest solution here is to point libexec dir at /sbin so
> that we have /sbin/udev/ since this then works with the various =
multilib
> rules. It means a user can install the 64 bit and 32 bit multilibs for
> udev in parallel (for libudev for example) and that things should all
> work correctly.
>=20
> I appreciate upstream don't agree with that approach but equally they
> don't have the generic multilib support we have to worry about. =
Hacking
> the multilib code to pieces just to match upstream in this case is =
going
> to be a lot more painful, I appreciate its the not optimal solution
> though.


FWIW, the udev *libraries* (libudev, libgudev, etc) go in $prefix/lib64 =
on 64 bit machines, the udev *binaries* into /lib. So multi*lib* should =
work.=


