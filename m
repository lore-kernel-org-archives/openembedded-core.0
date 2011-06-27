Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbDtv-0000ER-Du
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 17:39:03 +0200
Received: by wyg30 with SMTP id 30so1365002wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 08:35:10 -0700 (PDT)
Received: by 10.227.13.147 with SMTP id c19mr5691645wba.87.1309188910198;
	Mon, 27 Jun 2011 08:35:10 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fe4sm3373596wbb.45.2011.06.27.08.35.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 08:35:09 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309170035.21613.289.camel@phil-desktop>
Date: Mon, 27 Jun 2011 17:35:07 +0200
Message-Id: <7291E005-7DE1-4834-A4E4-5055D2FDA3A3@dominion.thruhere.net>
References: <CFB391EB-D84F-4616-887D-DAFAB036EA42@dominion.thruhere.net>
	<4E0699D1.9090308@gmail.com> <4E074ABB.80405@gmail.com>
	<48356C52-61A1-42BE-92AA-704FB136D8A3@dominion.thruhere.net>
	<1309167774.21613.264.camel@phil-desktop>
	<8815E10D-6790-48AD-811D-5BE977A17380@dominion.thruhere.net>
	<1309170035.21613.289.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: gcc-cross-kernel problems
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
X-List-Received-Date: Mon, 27 Jun 2011 15:39:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jun 2011, om 12:20 heeft Phil Blundell het volgende geschreven:

> On Mon, 2011-06-27 at 12:07 +0200, Koen Kooi wrote:
>> In the first one only cc1 and collect are present. What would be the =
best way to fix this?
>=20
> It seems that gcc-package-cross.inc is doing this by steam for the
> regular cross compiler.  See this code from do_install():
>=20
> 	# Insert symlinks into libexec so when tools without a prefix =
are searched for, the correct ones are
> 	# found. These need to be relative paths so they work in =
different locations.
> 	dest=3D${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
> 	install -d $dest
> 	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp =
gfortran; do
> 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
> 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t =
${dest}${TARGET_PREFIX}$t
> 	done
>=20
> So I guess you could copy that into gcc-cross-kernel or arrange for =
the
> two recipes to share more stuff.  Really, the only difference between
> gcc-cross-kernel and regular gcc-cross should be that the former =
doesn't
> install itself as ${TARGET_SYS}-gcc in the sysroot bindir.

That, combined with PATH_prepend =3D =
"${STAGING_BINDIR_TOOLCHAIN}.gcc-cross-kernel-4.2.1:" in the recipe =
makes it work, thanks! I"ll send an updated patch for =
gcc-cross-kernel.inc soon.=


