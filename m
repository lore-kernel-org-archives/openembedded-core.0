Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SpOln-0000LV-TT
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 21:09:47 +0200
Received: by wgbdq10 with SMTP id dq10so2168154wgb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 11:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=L2vZ3nnvsSstRWurYwFWsyJt5qqQO3alTrttHUtf9Wg=;
	b=ZIlzXkG97iUZJRHgoT+U2UY72yleaq7O6v+Psr3TzU0Ayl7g7gkL1BxsxUyBtkIUJA
	cYbo1gH9e972wZ2S682OxiNws4g8+PDPTMoee+USiGLv+T5ojrNG97+4Ao0jEZ9Oqc4C
	eByHrQJw6phZ0AbwSa1v9Dku2ffBxbtDyrX4xHiVrArEFO6SNKsKTDfndIvWD6WR6VMj
	lg8mLeCu23e1KqtQ7jnca39s2yQrPW6i62VEpr4XhC0ZqPg/JaR1pmM7xVqk1XtU6kp6
	MzRSwh93vbRWkNZOixtZsHzHrp+1OIl8E9Yx42ty5A+x9ZQMk8b2a0usqrR4IXpw4cw8
	LByg==
Received: by 10.180.79.69 with SMTP id h5mr44077487wix.6.1342119514516;
	Thu, 12 Jul 2012 11:58:34 -0700 (PDT)
Received: from [192.168.2.8] ([188.207.89.201])
	by mx.google.com with ESMTPS id t7sm423928wix.6.2012.07.12.11.58.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 11:58:33 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1342116650.git.andrei@gherzan.ro>
Date: Thu, 12 Jul 2012 20:58:37 +0200
Message-Id: <8586287A-0F78-4778-8491-B8E1C70644B1@dominion.thruhere.net>
References: <cover.1342116650.git.andrei@gherzan.ro>
To: openembedded oe-core layer <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQl/3COuUYp51GsnaIDLZW+7JU0iF19kihT09Vl8qL7/U60NtZHvZtN5Cl618O4I7QNflbK+
Subject: Re: [PATCH 0/3] Fix xz compression command and optimize compression time
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
X-List-Received-Date: Thu, 12 Jul 2012 19:09:48 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Any volunteers to test this on a system with >4 real cores?=20

Op 12 jul. 2012, om 20:13 heeft Andrei Gherzan het volgende geschreven:

> Koen suggested to add -T to xz commands. We have this option =
implemented in our current version .1alpha.=20
>=20
> -T threads, --threads=3Dthreads
>              Specify the number of worker threads to use.  Setting =
threads to
>              a special value 0 makes xz use as many threads as there =
are  CPU
>              cores  on  the system.  The actual number of threads can =
be less
>              than threads if the input file is not big enough  for  =
threading
>              with  the  given  settings or if using more threads would =
exceed
>              the memory usage limit.
>=20
> -------------------
>=20
> Memory: 7.8 GiB
> Processor:: Intel=AE Core=99 i5-2540M CPU @ 2.60GHz =D7 4
>=20
> File to compress: 1.9G
>=20
> xz -f -k -e -9 --check=3Dcrc32 (current configuration)
> Memory: 673Mb
> real    6m37.170s
> user    6m35.389s
> sys     0m0.884s
> Compressed file size: 3.4Mb
>=20
> xz -f -k -e -9 -T 4 --check=3Dcrc32
> Memory: Cannot allocate memory
>=20
> xz -f -k -e -8 -T 4 --check=3Dcrc32
> Memory: 1.8G
> real    3m24.462s
> user    12m8.502s
> sys     0m2.180s
> Compressed file size: 3.4Mb
>=20
> xz -f -k -T 4 --check=3Dcrc32 (-e defaults to -6)
> Memory: 471Mb
> real    1m9.265s
> user    4m8.972s
> sys     0m0.944s
> Compressed file size: 3.4Mb
>=20
> So my conclusion would be to use the default -e -6 with -T 0.
>=20
> The following changes since commit =
90ad663909c0c8a405b22a510c9f957007d02669:
>=20
>  upstream_tracking: update boost (2012-07-09 17:21:38 +0100)
>=20
> are available in the git repository at:
>=20
>  git://git.yoctoproject.org/poky-contrib ag/xz
>  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dag/xz
>=20
> Andrei Gherzan (3):
>  image_types.bbclass: Fix COMPRESS_CMD for xz to redirect compressed
>    data to file
>  image_types.bbclass: Add XZ variable to set number of threads to be
>    used while compressing
>  image_types.bbclass: Default XZ_COMPRESSION_LEVEL to -e -6
>=20
> meta/classes/image_types.bbclass |    5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> --=20
> 1.7.9.5
>=20



