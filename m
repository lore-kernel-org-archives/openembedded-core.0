Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SaNwo-00047d-7J
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 11:15:06 +0200
Received: by eaal1 with SMTP id l1so430102eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 02:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=vUHyo6U9RcF8Z2Pzdt67SVW+t4FuISc0QQc4DQ2rakw=;
	b=NdCVYLO7Ck1YY2YRFqOsQp0UO8RPej8FsofVBhvl8qSPR9WHUBkSUgQJniEFfb/KFy
	asWWX/zl+/fOuNOF2I3vN7qGWPuQsUbCQoYXxUo1s2Jc21CWioafNXAe92TgciFMyGxa
	mBmzP4cdPwZP/vcrjpfvfb9m/CeHgZc6vW+JgFbyM5nluyPulicfsE2ZUUDOvkfA7Inr
	nWcgzT4eiodsiULUx0iuPzkFBFINbq77hJPXvNZENI3tp1VulZeiMd8JYo6LQcuMo/Ux
	T3dj8YnHhukkV9kb8twE5BY5R/V7N0eNKEk56KLDFk/p2g4zMvV/mc8gJTSJgvpxTgnq
	PnuQ==
Received: by 10.14.97.135 with SMTP id t7mr926345eef.177.1338541485417;
	Fri, 01 Jun 2012 02:04:45 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e45sm4589147eeb.6.2012.06.01.02.04.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jun 2012 02:04:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1338538650.20169.261.camel@ted>
Date: Fri, 1 Jun 2012 11:04:38 +0200
Message-Id: <D2B2A161-3B9C-49F3-B124-DE6CC9B1FFE0@dominion.thruhere.net>
References: <cover.1338434706.git.liezhi.yang@windriver.com>
	<87ca0cf2285b018489bde046b0aa7e17a767c70a.1338434706.git.liezhi.yang@windriver.com>
	<D16CA58F-8D7A-4910-ACCA-84E01CEE6510@dominion.thruhere.net>
	<1338538650.20169.261.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkH0XW6cX3pIwKc3xdSXTScIg9A/JpI0K5EfNv7plktUUxp+hou3C5k/GHvmyIWsH0JC0/0
Subject: Re: [PATCH 1/1] opkg 0.1.8: respect to the arch when choose the alternatives
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
X-List-Received-Date: Fri, 01 Jun 2012 09:15:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jun. 2012, om 10:17 heeft Richard Purdie het volgende geschreven:

> On Thu, 2012-05-31 at 17:01 +0200, Koen Kooi wrote:
>> Op 31 mei 2012, om 16:13 heeft Robert Yang het volgende geschreven:
>>=20
>>> There is a bug if we:
>>> 1) bitbake core-image-sato-sdk MACHINE=3Dqemux86
>>> 2) bitbake core-image-sato with MACHINE=3Dcrownbay
>>>=20
>>> Then several pkgs in deploy/ipk/i586 would be installed to =
crownbay's
>>> image even if there is one in deploy/ipk/core2 and we have set the
>>> core2's priority higher than i586, when the version in =
deploy/ipk/i586 is
>>> higher. This doesn't work for us, for example, what the crownbay =
need is
>>> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
>>=20
>> And this is working exactly as intended. Don't break opkg because =
your
>> hardware driver situation sucks.
>>=20
>> So: NAK on this patch.
>=20
> I think we do have a problem here. For example, the system is ignoring =
a
> PREFERRED_VERSION directive here

A PREFERRED_VERSION set in a machine.conf, which is the wrong place. =
Let's change the above build sequence to this:

1) MACHINE=3Dqemux86 bitbake xserver-xorg
2) MACHINE=3Dothercore2machine bitbake xserver-xorg
3) MACHINE=3Dcrownbay bitbake xserver-xorg

Oh look, I get 1.11.2 on crownbay regardless of this patch.

> by building one thing and then
> installing another. We're also inconsistent between the dpkg/rpm and
> opkg backends. There is therefore definitely some kind of user
> experience issue at stake here since this behaviour is not obvious,
> expected or particularly correct.
>=20
> The fact the example is hardware related is not particularly relevant,
> its the bigger picture I worry about

I also worry about the bigger picture, especially about what Martin said =
about this breaking feeds.=


