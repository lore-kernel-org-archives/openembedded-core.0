Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UHsUP-0000Tv-OT
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 10:05:49 +0100
Received: by mail-ee0-f45.google.com with SMTP id b57so99998eek.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 01:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Eeungcupy/hx+QkbF+D2BNFvcJvO9sACQNs7RT0L0io=;
	b=l0nn3YiaYTcooM9t1HCGe02SNSGUA1B+9RZJvCjbudw3TrQgPYKViVXCJuUvfzvASs
	lYKe1EX3ToXd2hiWGTjrxWfzUtIB7yBCDY1ep5Ye92wWOu7Y/HCrgWIOX/L2cRrj052K
	Vkm7IAOv9MM65qKg0OjG8q1ZxlUR9+nVwURuydCn0Ub6kpjqyjj4lXxLzWAqyIVPCPrh
	MHX+Zx+9Nkp29fGRSo1QTfRB9dkXZEjNCdNlDq6pp4SlTHYH9QyzruP4mUHIg99JSrlR
	7zwuU6TghuMaPhlBT0tpZlNQJyymMHofohOzuOzVkpv8F/4NHbf0SeYfkjgRlzwSXgCa
	EHlQ==
X-Received: by 10.15.43.132 with SMTP id x4mr58315146eev.31.1363682940526;
	Tue, 19 Mar 2013 01:49:00 -0700 (PDT)
Received: from ?IPv6:2001:610:612::916b:654:97f0:7de0?
	([2001:610:612:0:916b:654:97f0:7de0])
	by mx.google.com with ESMTPS id q42sm31681133eem.14.2013.03.19.01.48.58
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Mar 2013 01:48:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1363681473-26243-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 19 Mar 2013 09:48:57 +0100
Message-Id: <D0BF3B16-AC94-429C-9BA9-A852E582301E@dominion.thruhere.net>
References: <1363681473-26243-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQm71zrmCI+Yz/6i6HC3ClT4+oO86Abrfd52cGV12ChLjbDS06B7LrV7E9BsUoYplv0g7pFO
Subject: Re: [PATCH] python: fix on-target use of distutils/setuptools by removing references to buildpaths
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
X-List-Received-Date: Tue, 19 Mar 2013 09:05:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 mrt. 2013, om 09:24 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

> Running 'python setup.py build' would fail due to the python Makefile =
having
>=20
> CC=3D             i586-angstrom-linux-gcc  -m32    -march=3Dcore2 =
-msse3 -mtune=3Dgeneric -mfpmath=3Dsse =
--sysroot=3D/home/koen/v2012.12/build/tmp-angstrom_v2012_12-eglibc/sysroot=
s/fri2
> CXX=3D            i586-angstrom-linux-g++  -m32    -march=3Dcore2 =
-msse3 -mtune=3Dgeneric -mfpmath=3Dsse =
--sysroot=3D/home/koen/v2012.12/build/tmp-angstrom_v2012_12-eglibc/sysroot=
s/fri2
> =
'--with-libtool-sysroot=3D/home/koen/v2012.12/build/tmp-angstrom_v2012_12-=
eglibc/sysroots/fri2'
>=20
> And more
>=20
> Multiple users have reported this problem:
>=20
> http://hipstercircuits.com/?p=3D499
> =
http://www.gigamegablog.com/2012/09/09/beaglebone-coding-101-spi-output/
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-devtools/python/python_2.7.3.bb | 6 ++++++
> 1 file changed, 6 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/python/python_2.7.3.bb =
b/meta/recipes-devtools/python/python_2.7.3.bb
> index c181933..6b127a0 100644
> --- a/meta/recipes-devtools/python/python_2.7.3.bb
> +++ b/meta/recipes-devtools/python/python_2.7.3.bb
> @@ -109,11 +109,17 @@ do_install() {
>=20
> 	install -m 0644 Makefile.sysroot =
${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
>=20
> +	# Remove references to buildmachine paths in target Makefile
> +	sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' \
> +	       -e 's:${STAGING_DIR_TARGET}::g'\
> +	       ${D}${libdir}/python${PYTHON_MAJMIN}/config/Makefile

Ignore this one, the sed is a bit too greedy and prevents the =
sstate-fixup from functioning properly. V2 will follow after more =
testing.




