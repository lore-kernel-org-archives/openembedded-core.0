Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.5244.1629840071628480208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 14:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OSPncvyd;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1629840072;
  x=1661376072;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=KXgeaKAWdSrNoPENVJN9BMprAFeVegR74KT37TjGCGw=;
  b=OSPncvydK2ezPXyC3c1EEie3TlDPCWiNmPNJ5XL/qokaqDfLSpEU7h2s
   fUJ9OyKr5leHBp3pBlCj75d6g+4qz4QErCIVu7qpGFc/4rEWgyqryoMHz
   YtzoOoPBHdRy/Txm7vmAIJCC9qWYYoM6I27h322HVe7BfSL14cvj1lW1e
   8FoPOw8tBuIn+96AfuWhPs5RB11wpcK1717CNP0YaQVrKxXPEe72ioGig
   Tr20QA82+h9luTceVfjBezEUEFnvj/CnOt1CGQqMrpl6AJ7uahRwg5hbw
   aFWBWEvbw9el8eH/RNFKi/ifU+r6t3Ejt5jBv/NrR6EwRn4hqSru90VPi
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "zboszor@pr.hu" <zboszor@pr.hu>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] usermod in EXTRA_USERS_PARAMS is broken in master
Thread-Topic: [OE-core] usermod in EXTRA_USERS_PARAMS is broken in master
Thread-Index: AQHXmPNjJykhogyhIEqG79yHZwb/yquDJngw
Date: Tue, 24 Aug 2021 21:21:08 +0000
Message-ID: <4143bf5010d947b2b5f896b27cf7e0dd@axis.com>
References: <eb9225bc-cc13-aca4-b44f-f38c2f83556b@pr.hu>
In-Reply-To: <eb9225bc-cc13-aca4-b44f-f38c2f83556b@pr.hu>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Zoltan Boszormenyi via
> lists.openembedded.org
> Sent: den 24 augusti 2021 16:22
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] usermod in EXTRA_USERS_PARAMS is broken in master
>=20
> Hi,
>=20
> I tried to port my distro layer to Honister and
> attempted to build an OS image.
>=20
> I have this in the image recipe:
>=20
> EXTRA_USERS_PARAMS +=3D "usermod -P mypassword root; usermod -P mypasswor=
d2 myuser;"

The 0002-Allow-for-setting-password-in-clear-text.patch patch has been drop=
ped=20
from shadow with the update to 4.9 (see commit 759df739). It previously ren=
amed=20
the -P option to -A and added an insecure -P <cleartext password> option.

Replace the use of the -P <cleartext password> option with -p <encrypted pa=
ssword>=20
and you should be good to go, also with Hardknott.

>=20
> and the error I got was:
>=20
> NOTE: my-test-image: Performing usermod with [-R
> /data/yocto/tmp-sicom-glibc/work/genericx86_64-oe-linux/my-test-image/1.0=
-
> r0/rootfs -P
> mypassword root]
> usermod: prefix must be an absolute path
> ERROR: my-test-image: usermod command did not succeed.
> WARNING:
> /data/yocto/tmp-sicom-glibc/work/genericx86_64-oe-linux/my-test-image/1.0=
-
> r0/temp/run.set_user_group.2583229:260
> exit 1 from 'exit 1'
>=20
> EXTRA_USERS_PARAMS has userdel and useradd commands
> before the last two usermod, all of which succeed.
>=20
> I got the same error on both Fedora 33 and Fedora 34 hosts.
>=20
> It works with Hardknott.
>=20
> Best regards,
> Zolt=E1n B=F6sz=F6rm=E9nyi

//Peter

