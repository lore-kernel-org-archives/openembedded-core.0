Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4961C6AA47;
	Wed, 12 Jun 2013 16:17:16 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id lf11so4207570pab.24
	for <multiple recipients>; Wed, 12 Jun 2013 09:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=E4hlQJg/FECQoJEf7ElDR+bC+8aiNW3noJHeOXabX/0=;
	b=vHJFUGLUD1h8CUOrUAmtWaJOMONTz5mb8WmZhgJmRFdBsJz+ct2R4vWXGOWUIkFiV7
	puzzCth/r3ZHNOTlQL4HNrE17oYrraAcCTHwmXQ0L35zJJInAN5KMTD2rOjifpwDP4rN
	+ytIu2WtbJyuI2lXz6ypriOhASZB0C5nR7mGAMG2UmOqU0lIFQ9in02KZ1SdwO0kkWLo
	qp55ABpWroFf6hAq8GwaSnCd/r9vmG7KWxPpyWE0j/C7y3rB/3D3JMY1jUk5oxyQvB9E
	OnWQEEKbBELFKtNx/hYJosjcAfqAuvj3hGnMhP9FL689VQIYkRbUJ+8CvdOe5/JmUK/s
	ft/w==
X-Received: by 10.68.160.226 with SMTP id xn2mr20417567pbb.174.1371053837498; 
	Wed, 12 Jun 2013 09:17:17 -0700 (PDT)
Received: from sa-nc-common3-188.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	qi1sm25355695pac.21.2013.06.12.09.17.15 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 09:17:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130612161355.GG17357@timesys.com>
Date: Wed, 12 Jun 2013 09:17:16 -0700
Message-Id: <E23EBE4D-D1AF-4187-969D-327151AE6DBE@gmail.com>
References: <20130607154357.606025038F@opal> <20130608091020.GO22710@jama>
	<20130608091556.GP22710@jama> <20130610155044.GS17357@timesys.com>
	<CAMKF1spvVOLu5uKFWXC=yqzHV73N61sOqUwj=gg1ZUVK=uN7OQ@mail.gmail.com>
	<20130611134543.GZ17357@timesys.com>
	<CAMKF1srJ1-dzfa3AhrEAJRiNG3krvBoJy78sLbc+me8YExK16A@mail.gmail.com>
	<20130612161355.GG17357@timesys.com>
To: Andy Voltz <andy.voltz@timesys.com>
X-Mailer: Apple Mail (2.1508)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Andy Voltz : tune-cortexa.inc: create a common include for cortex-a armv7a tuning
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
X-List-Received-Date: Wed, 12 Jun 2013 16:17:16 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Jun 12, 2013, at 9:13 AM, Andy Voltz <andy.voltz@timesys.com> wrote:

> Hi Khem,
>=20
>> On Tue, Jun 11, 2013 at 6:45 AM, Andy Voltz <andy.voltz@timesys.com> =
wrote:
>>> I understand that. I sent an updated patch which reverts to mtune, =
but I'm getting
>>=20
>> mtune/march is small issue with this patch. I would recommend to send
>> a revert of the patches
>> since all arm architectures are broken as of now in OE-Core
>=20
> I see the issue now. It seems that overriding the tunes with a =
variable
> reference does not work for all the tunings. With the tune test =
script, I'm
> seeing that these tunes are broken:
> log.fake-cortexa9.cortexa9*
> log.fake-cortexa8.cortexa8*
>=20
> I see that variables can be assigned with a reference based on stuff =
like=20
> FILES_${QT_BASE_NAME}-fonts =3D =85
>=20
> (=46rom recipes-qt/qt4/qt4-embedded.inc)
>=20
> I'm not sure why it works there and not in the tunings, or how to fix.
>=20


its a different thing. Its constructing a variable name and not =
override. You were trying to create a override on the fly
that won't work.

> For now I have a revert patch which removes tune-cortexa.inc and =
restores the
> previous contents of the a7,a8,a9,15 tuning files.=20
>=20
> It also adds the tune-cortexa5.inc file I had sent on the list =
originally
> which led to this code-reduction experiment. That thread is here for =
reference:
>=20
> =
http://lists.openembedded.org/pipermail/openembedded-core/2013-June/079452=
.html
>=20
> Thanks for pointing out this issue. Patch is on the way.
>=20

np


> Regards
> --=20
> Andy Voltz
> Timesys Corporation


