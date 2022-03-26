Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679F6C433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Mar 2022 05:21:40 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.571.1648272098443808310
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 22:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=bgG/awMv;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648272098;
  x=1679808098;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Jx9nfEwG/GtlrE1vfDp+jANLTNMerWh5DJu2MpNX+bQ=;
  b=bgG/awMv/TtOx0KYu8YP4Ctz8yBl2rH/8QR48UealWe9hAbkkJji3cSr
   /57MiTcafjkKiSmepLFEKYiB4D5xHq91kId/s6g+W+Gmw9Z+i6QbRamAW
   6Pi56Cx8ZbtoIPY7rBjDFYOk2lvxtyTUbPn1PZer0rFqRJo4LOueFQLlb
   CR+Y73pIme/K66auFIj7pkYftkenQv8+9cPS4itlEhThSudhC5GwD8pX7
   chTGjKHY+MqYa+vQ/rnQGO5Ev/b+A2oPa9+Vita4q20f5eoNp0fvptO5N
   cEft2zXiroX6LcqpIZ+Z8xj82FRDLWQEPdgIsvWDpsZEuiBqrXhHZZBJU
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [RFC][PATCH] server/process: Avoid hanging if a parser
 process is terminated
Thread-Topic: [OE-core] [RFC][PATCH] server/process: Avoid hanging if a parser
 process is terminated
Thread-Index: AQHYQND6ULTmR+tmAEaiy9w9mQh96KzRIKJg
Date: Sat, 26 Mar 2022 05:21:35 +0000
Message-ID: <f29db89b9ba94d0da406e96f500aa8b7@axis.com>
References: <16DFD694295BAB69.4324@lists.openembedded.org>
In-Reply-To: <16DFD694295BAB69.4324@lists.openembedded.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Mar 2022 05:21:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163658

Bah, this was of course intended for the bitbake list.

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 26 mars 2022 06:19
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [RFC][PATCH] server/process: Avoid hanging if a parser
> process is terminated
>=20
> If a parser process is terminated while holding a write lock, then it
> will lead to a deadlock (see
> https://docs.python.org/3/library/multiprocessing.html#multiprocessing.Pr=
ocess.terminate).
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>=20
> After the discussion on IRC about the hanging parsing processes, I
> just had to understand the code and what happens. This is a solution to
> the problem, though I am not sure it is THE solution. It may also be
> that the rlock in ConnectionReader should be handled the same way.
> Anyway, even if this is not accepted as a solution to the problem, I now
> at least know a lot more about how the parsing processes in bitbake
> work... :)
>=20
>  bitbake/lib/bb/server/process.py | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/bitbake/lib/bb/server/process.py
> b/bitbake/lib/bb/server/process.py
> index 1636616660..544b00f2cd 100644
> --- a/bitbake/lib/bb/server/process.py
> +++ b/bitbake/lib/bb/server/process.py
> @@ -20,6 +20,7 @@ import os
>  import sys
>  import time
>  import select
> +import signal
>  import socket
>  import subprocess
>  import errno
> @@ -728,6 +729,10 @@ class ConnectionReader(object):
>      def close(self):
>          return self.reader.close()
>=20
> +terminated =3D False
> +def catch_sigterm(signum, frame):
> +    global terminated
> +    terminated =3D True
>=20
>  class ConnectionWriter(object):
>=20
> @@ -739,8 +744,12 @@ class ConnectionWriter(object):
>=20
>      def send(self, obj):
>          obj =3D multiprocessing.reduction.ForkingPickler.dumps(obj)
> +        oldsig =3D signal.signal(signal.SIGTERM, catch_sigterm)
>          with self.wlock:
>              self.writer.send_bytes(obj)
> +        signal.signal(signal.SIGTERM, oldsig)
> +        if terminated:
> +            os.kill(os.getpid(), signal.SIGTERM)
>=20
>      def fileno(self):
>          return self.writer.fileno()

