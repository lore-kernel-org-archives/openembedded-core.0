Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHv7o-0004y8-Ie
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 12:50:08 +0200
Received: by wgbdr12 with SMTP id dr12so608213wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 03:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=xo+JmhQZ3Ofbg0v5opw/P5eRJU7UNiGKS0Zvg4fgXuQ=;
	b=WyiIAUnlFhnxoCTDnxduRlCbuKEpauY467F2l9F03+Rk5gOBn9CKG18T3lUyYCYOZH
	2odR3CbMK6em/7rTdXsO818NuzfgCW1prx9E/vNdIcm9cozmJAWRfXw79SG1ud9vgsxW
	gFGH0CJ4YChqsg+a+l/KHvKmPc1tUQYUFKvl1n+AJHoO3r4+rEsm4ZatIPzLX0PcaIwg
	xI72ysbqkgyl5O8ch975YZUsSS9FbVtzeKbWE2iWwl7hMIZ0F5NdGNx/NfRWeAFX/Qf3
	XPr6wal9oUWfnDHBdaBh0A2OxjwtfoRGUO//2qUWXaLdhHPiBl5QLgsjvdYOs4fGtRaJ
	vpjA==
Received: by 10.180.97.4 with SMTP id dw4mr5300766wib.18.1334140849794;
	Wed, 11 Apr 2012 03:40:49 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e6sm44046857wix.8.2012.04.11.03.40.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 03:40:48 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334139378.10826.140.camel@ted>
Date: Wed, 11 Apr 2012 12:40:44 +0200
Message-Id: <341D01DC-1752-407E-85E7-5DEB343AA7AB@dominion.thruhere.net>
References: <1333402513-26781-1-git-send-email-andrea.adami@gmail.com>
	<CAAQYJAtN+NYBvDCmxKnPkx3zo+ZZNCzJ+fSox-PJMGuB2h6Qrg@mail.gmail.com>
	<1334139378.10826.140.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQl8dDhQii/8/AnCkiI+K3C2PTTUVWq6PZYTffWD1DjPqlg/xZ6babeBzFtjGb2u2S/R0beh
Subject: Re: [PATCH] udev: generalize the check in touchscreen rule
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
X-List-Received-Date: Wed, 11 Apr 2012 10:50:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 apr. 2012, om 12:16 heeft Richard Purdie het volgende geschreven:

> On Wed, 2012-04-11 at 10:59 +0200, Andrea Adami wrote:
>> On Mon, Apr 2, 2012 at 11:35 PM, Andrea Adami =
<andrea.adami@gmail.com> wrote:
>>> * The actual rule only works for devices reporting ts pressure
>>> * and ignores the other touchscreens (happens e.g. on ipaq h1940).
>>> * a0,1,*18   a =3D absolute axes (ABS_X 0x00 ABS_Y 0x01 ABS_PRESSURE =
0x18)
>>> * (see include/linux/input.h)
>>> *
>>> * Guidelines for touchscreen seem suggesting only ABS_X and ABS_Y =
are mandatory
>>> * (http://kernel.org/doc/Documentation/input/event-codes.txt)
>>> *
>>> * Bump PR
>>>=20
>>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ---
>>> meta/recipes-core/udev/udev/local.rules |    3 +--
>>> meta/recipes-core/udev/udev_164.bb      |    2 +-
>>> 2 files changed, 2 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-core/udev/udev/local.rules =
b/meta/recipes-core/udev/udev/local.rules
>>> index 625e49a..49e8d28 100644
>>> --- a/meta/recipes-core/udev/udev/local.rules
>>> +++ b/meta/recipes-core/udev/udev/local.rules
>>> @@ -31,5 +31,4 @@ KERNEL=3D=3D"rtc0", SYMLINK+=3D"rtc"
>>> ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*",=
 RUN+=3D"/sbin/modprobe $env{MODALIAS}"
>>>=20
>>> # Create a symlink to any touchscreen input device
>>> -SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", =
ATTRS{modalias}=3D=3D"input:*-e0*,3,*a0,1,*18,*", =
SYMLINK+=3D"input/touchscreen0"
>>> -
>>> +SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", =
ATTRS{modalias}=3D=3D"input:*-e0*,3,*a0,1,*", =
SYMLINK+=3D"input/touchscreen0"
>>> diff --git a/meta/recipes-core/udev/udev_164.bb =
b/meta/recipes-core/udev/udev_164.bb
>>> index c5813ec..0462ff2 100644
>>> --- a/meta/recipes-core/udev/udev_164.bb
>>> +++ b/meta/recipes-core/udev/udev_164.bb
>>> @@ -1,6 +1,6 @@
>>> include udev.inc
>>>=20
>>> -PR =3D "r13"
>>> +PR =3D "r14"
>>>=20
>>> SRC_URI +=3D "file://udev-166-v4l1-1.patch"
>>>=20
>>> --
>>> 1.7.3.4
>>>=20
>>=20
>> Bump
>>=20
>> I'm not linux-input specialist but this fix looks rather harmless.
>=20
> I'm not 100% convinced about that. There needs to be some mechanism to
> signal to the system when there is pressure applied to the screen and
> when pressure was released. I think there are two ways you can do =
this,
> BTN_TOUCH and ABS_PRESSURE. Regardless of what the input events codes
> say, I'm really more interested in what tslib accepts.
>=20
> This code has been like this for a long time and I'm surprised that if
> there were issues it wasn't patched long before now. I'm therefore =
left
> wondering if the touchscreen driver you're using is doing the right
> things.

FWIW, we had a similar patch to udev in the TI overlay, but the kernel =
team fixed the ts driver in the kernel a few weeks later.  Qt and X11 =
can use evdev natively nowadays, so tslib usage is on its way out.

regards,

Koen=


