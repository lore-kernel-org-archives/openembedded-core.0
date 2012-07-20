Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ss7Oq-0005yV-Gd
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 09:13:22 +0200
Received: by wgbdr1 with SMTP id dr1so3079862wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 00:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=3FZ9FQh086wM2lmnEOl2luHexPCTORMqq1ugH4eY6YQ=;
	b=F9XzqDwhfvnTWrCrAg4QopH/3Sb4orvNn3cO+1DDvEUvbXgK6y3eI3BuUIUWlx3Suu
	ubpaLqp0plCb/UmtC8EjrqtYrNYr6r9QoZyj03JzbIxeXihcOfjJCZrRwX8RU6qeC4OJ
	LW38k1tkqd8qZ8FKfQMxPYyy5w7lhOuQXd2wb+WQM0KwecZZpOUnRrhi999AvEQfJj/f
	nmGWzeYhda8QZQ9iaTFvfshXfsvd0UNKa8wUll/BAuzyRZUmj5EoV4qf4dqvspmcA2gb
	M3sQRUwx0STJ59mG0M6Ql94zA+fAzpIABe1zHCFO4NNHQim7Q4Ii9Kph9j32L3XfkTei
	BGMw==
Received: by 10.180.76.135 with SMTP id k7mr22965621wiw.7.1342767717750;
	Fri, 20 Jul 2012 00:01:57 -0700 (PDT)
Received: from [172.20.3.200] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k48sm11695747een.10.2012.07.20.00.01.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 00:01:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1342763803-32218-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 20 Jul 2012 09:01:51 +0200
Message-Id: <A91F8513-AC11-4CF6-833B-F26DC5D945C8@dominion.thruhere.net>
References: <1342763803-32218-1-git-send-email-raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkT9VqOPUTTLJMH6s7CFZbSoA6KXqqNx7U5WJlaianblKwrsPgZyWl2dKyZFFLs56SynX1I
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel bbclass: recreate uImage unless KEEPUIMAGE is set
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
X-List-Received-Date: Fri, 20 Jul 2012 07:13:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 jul. 2012, om 07:56 heeft Khem Raj het volgende geschreven:

> From: Koen Kooi <koen@dominion.thruhere.net>
>=20
> The intent of the uImage code in this class includes the following
>=20
> 1) be able to specify custom load addresses without needing to patch =
the kernel
> 2) add better information to the uImage description field
>=20
> The current state is a NOP anyway, the kernel will always build a =
uImage when you tell it to 'make uImage'.
>=20
> weakly Set KEEPUIMAGE in default-distrovars.inc which preserve the
> current OE-Core behavior. Machines which are being ported from oe.dev =
and need to
> regenerate uImage can set this to be empty
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/classes/kernel.bbclass                     |    2 +-
> meta/conf/distro/include/default-distrovars.inc |    1 +
> 2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ce4d7de..efe4a9f 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -507,7 +507,7 @@ KERNEL_IMAGE_SYMLINK_NAME ?=3D =
"${KERNEL_IMAGETYPE}-${MACHINE}"
>=20
> do_uboot_mkimage() {
> 	if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" ; then=20
> -		if test ! -e arch/${ARCH}/boot/uImage ; then
> +		if test "x${KEEPUIMAGE}" =3D "x" ; then
> 			ENTRYPOINT=3D${UBOOT_ENTRYPOINT}
> 			if test -n "${UBOOT_ENTRYSYMBOL}"; then
> 				ENTRYPOINT=3D`${HOST_PREFIX}nm =
${S}/vmlinux | \
> diff --git a/meta/conf/distro/include/default-distrovars.inc =
b/meta/conf/distro/include/default-distrovars.inc
> index f770919..7448415 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -2,6 +2,7 @@ QA_LOGFILE =3D "${TMPDIR}/qa.log"
>=20
> OEINCLUDELOGS ?=3D "yes"
> KERNEL_CONSOLE ?=3D "ttyS0"
> +KEEPUIMAGE ?? =3D "1"

If you're going this way then explicitly test for '1' in the =
kernel.bbclass code, since KEEPUIMAGE =3D 0 won't do what people expect.=


