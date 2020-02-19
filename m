Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id A4D9B6021D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 22:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=1557; q=dns/txt; s=axis-central1;
	t=1582151173; x=1613687173;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=CwmAwJZrjPDpMBbU1gMetlK2RykMRiTqo3xZQMdFiEk=;
	b=ey+scMKFnQx5U7b0SFBc4Hl2/VanQXRGGJpNG7NvRw3D5cClwwnPdY6h
	v4NW7WyW33EEpW06WWVaUXGiEr1LqGNJLG02AOtrU+gVWtQHIv+w83rpn
	7Ljlnc1rGXZzjt48t72xZo+nlgPTJaSUO8+cuO/DssTzBN3cyMGKoNQke
	IbnajyQ40nTKNwl/plCTyW4TcW2KLgl5L5LQgXqEIODMkzHaEHcW5Vibj
	hqGAXLuCu70bVBylENVaLkGrhQdxu33KVEnD2NR8qIszLUQqcwVXb8phK
	H8oJ6LT0+eeCWJh5Y7AXNKFZFuA9FIZzsw+c+D2jpImWa6Oq1wpRrTqKw g==;
IronPort-SDR: I/Jq8G+bi35hnN2ujYp6CB8HKHUOK5svvfbybbQO6nbGlbzyFG7sN7KgRnVedOmaDVp7WKfT9q
	hXPaOQbubphGef3rmzzoYXTJtu1/CjubTG3INScybcCM5HmUsKVlTPaHSMf3+VLR7yBkukcW3Z
	/zizjK+cjRLgi8jhBYDpAn7nzdERztT/saNfBwGOCdk+8PAOV8Ga76vU2hnUE+bfE9PxnhF3nY
	IHg/Q5K8FUrK6M4PskxSe+Sk/MRPESy+Q9bREjETlRDKhrIXZGpyXDYwKzYBjnHJXn8dgpEwIA
	BW8=
X-IronPort-AV: E=Sophos;i="5.70,462,1574118000"; 
   d="scan'208";a="5615715"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/3] oeqa/selftest: Drop 'backup' code and
	SIGTERM	handler
Thread-Index: AQHV51PM8SnuqXq6UUSdXM6QGcy2zagjF4zg
Date: Wed, 19 Feb 2020 22:26:11 +0000
Message-ID: <d19c8ec2557b4e008b2965247c7c6225@XBOX03.axis.com>
References: <20200219183817.130495-1-richard.purdie@linuxfoundation.org>
	<20200219183817.130495-3-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200219183817.130495-3-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] oeqa/selftest: Drop 'backup' code and SIGTERM	handler
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
X-List-Received-Date: Wed, 19 Feb 2020 22:26:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 19 februari 2020 19:38
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 3/3] oeqa/selftest: Drop 'backup' code and SIGT=
ERM handler
>=20
> Now selftest is using its own copied build directory, we can stop worryin=
g about
> copying files around as backup, and drop the SIGTERM handler to try and r=
estore
> them, simplifying the code.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/case.py    | 30 +-------------------
>  meta/lib/oeqa/selftest/context.py | 47 ++-----------------------------
>  2 files changed, 4 insertions(+), 73 deletions(-)

[cut]

> @@ -329,18 +311,9 @@ class
> OESelftestTestContextExecutor(OETestContextExecutor):
>=20
>          return rc
>=20
> -    def _signal_clean_handler(self, signum, frame):
> -        if self.ourpid =3D=3D os.getpid():
> -            sys.exit(1)
> -
>      def run(self, logger, args):
>          self._process_args(logger, args)
>=20
> -        # Setup a SIGTERM handler to allow restoration of files like loc=
al.conf and bblayers.conf
> -        # but don't interfer with other processes
> -        self.ourpid =3D os.getpid()
> -        signal.signal(signal.SIGTERM, self._signal_clean_handler)
> -

What's the point of the first patch in this series, when you just=20
remove it all again here in the third patch?

>          rc =3D None
>          try:
>              if args.machine:

//Peter

