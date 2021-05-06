Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.web09.9337.1620308640197408006
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 06:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=CNoN3RSi;
 spf=pass (domain: bmw.de, ip: 207.54.68.121, mailfrom: prvs=7537dae32=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1620308640; x=1651844640;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9gJo0zZezHB9XsvcUioDIWEpjFCKjFrSqR+U80LL5Uk=;
  b=CNoN3RSi4qhZnOMQAYdymRYUWmRJBDQMpNEjqX9fx1xqkbx9u5fVL8Nv
   EEG+ZBWiu7/QoEya+8IYDL7MTHwRnQ6wiLs1DUPbqjo+LenYiwcprXf3c
   YM7pNzSU0xV7nMjwynkh17Swx9rt+t+M0bzHwuyHXR+VzqvOiVE5wdrnj
   o=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa3.hc324-48.eu.iphmx.com with ESMTP/TLS; 06 May 2021 15:43:58 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw3.muc with ESMTP/TLS;
 06 May 2021 15:43:55 +0200
Received: from smucm33m.bmwgroup.net (HELO smucm33m.europe.bmw.corp) ([160.46.167.69])
 by esabb6.muc with ESMTP/TLS; 06 May 2021 15:43:55 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33m.europe.bmw.corp
 (160.46.167.69) with Microsoft SMTP Server (TLS;
 Thu, 6 May 2021 15:43:54 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.015; Thu,
 6 May 2021 15:43:54 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <JPEWhacker@gmail.com>
CC: <openembedded-core@lists.openembedded.org>, <anuj.mittal@intel.com>,
	<steve@sakoman.com>
Subject: Re: [OE-core][PATCH] classes/image: Use xargs to set file timestamps
Thread-Topic: [OE-core][PATCH] classes/image: Use xargs to set file timestamps
Thread-Index: AQHXQfdGxnqd2DoQs0mG0mRqbiUvc6rWVQGAgAABPYA=
Date: Thu, 6 May 2021 13:43:54 +0000
Message-ID: <YJPymaMrLiAtwq/O@korppu>
References: <20210505214006.10382-1-JPEWhacker@gmail.com>
 <5ae0a2df-0ea1-a23f-6932-8088739fee29@gmail.com>
In-Reply-To: <5ae0a2df-0ea1-a23f-6932-8088739fee29@gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6B328FCE476CB64488B6A3ACF80201C5@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 08:39:27AM -0500, Joshua Watt wrote:
> Can we backport this to hardknott and dunfell (and gatesgarth if it's st=
ill
> active)?

Yes indeed, please to dunfell!

-Mikko, who also marked the patch but didn't have time to put it to test o=
n dunfell..

> On 5/5/21 4:40 PM, Joshua Watt wrote:
> > Instead of having find directly invoke touch for each file in the root
> > file system, pass a list to xargs for batching. This significantly
> > reduces the number of times the touch program is invoked and speeds up
> > the do_image task time:
> >=20
> >      PKG           TASK      ABSDIFF  RELDIFF  CPUTIME1 -> CPUTIME2
> >      my-image      do_image   -45.3s   -94.2%     48.1s -> 2.8s
> >=20
> >      Cumulative cputime:
> >        -44.3s    -92.3%    00:48.1 (48.1s) -> 00:03.7 (3.7s)
> >=20
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >   meta/classes/image.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index 013455f492..353cc67175 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -657,7 +657,7 @@ reproducible_final_image_task () {
> >           fi
> >           # Set mtime of all files to a reproducible value
> >           bbnote "reproducible_final_image_task: mtime set to $REPRODU=
CIBLE_TIMESTAMP_ROOTFS"
> > -        find  ${IMAGE_ROOTFS} -exec touch -h  --date=3D@$REPRODUCIBLE=
_TIMESTAMP_ROOTFS {} \;
> > +        find  ${IMAGE_ROOTFS} -print0 | xargs -0 touch -h  --date=3D@=
$REPRODUCIBLE_TIMESTAMP_ROOTFS
> >       fi
> >   }

>=20
>=20
>=20
