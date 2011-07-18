Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qin9G-0000uz-Jy
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 14:42:10 +0200
Received: by wyg30 with SMTP id 30so2259599wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 05:38:06 -0700 (PDT)
Received: by 10.216.205.160 with SMTP id j32mr5403715weo.36.1310992686636;
	Mon, 18 Jul 2011 05:38:06 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z83sm2327786weq.20.2011.07.18.05.38.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 05:38:05 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <281DBDA2-688D-4559-8191-276A44DEDF70@dominion.thruhere.net>
Date: Mon, 18 Jul 2011 14:37:59 +0200
Message-Id: <CC7FB00A-4985-40DF-AA73-CE366F46C698@dominion.thruhere.net>
References: <cover.1310969462.git.dongxiao.xu@intel.com>
	<c4ca6242b49eddc218fa3c0f58d172efc1601c84.1310969462.git.dongxiao.xu@intel.com>
	<FE823AAC-2695-4FB2-9E90-BCD2ED38771B@dominion.thruhere.net>
	<281DBDA2-688D-4559-8191-276A44DEDF70@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 3/4] udev: Change hard coded /usr/lib to support multilib
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
X-List-Received-Date: Mon, 18 Jul 2011 12:42:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 jul 2011, om 14:32 heeft Koen Kooi het volgende geschreven:

>=20
> Op 18 jul 2011, om 09:08 heeft Koen Kooi het volgende geschreven:
>=20
>>=20
>> Op 18 jul 2011, om 08:13 heeft Dongxiao Xu het volgende geschreven:
>>=20
>>> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
>>> ---
>>> meta/recipes-core/udev/udev-164/makefile.patch |   16 =
++++++++++++++++
>>> meta/recipes-core/udev/udev-new.inc            |    1 +
>>> meta/recipes-core/udev/udev_164.bb             |    2 +-
>>> 3 files changed, 18 insertions(+), 1 deletions(-)
>>> create mode 100644 meta/recipes-core/udev/udev-164/makefile.patch
>>>=20
>>> diff --git a/meta/recipes-core/udev/udev-164/makefile.patch =
b/meta/recipes-core/udev/udev-164/makefile.patch
>>> new file mode 100644
>>> index 0000000..c46ff4b
>>> --- /dev/null
>>> +++ b/meta/recipes-core/udev/udev-164/makefile.patch
>>> @@ -0,0 +1,16 @@
>>> +Upstream-Status: Inappropriate [configuration]
>>=20
>> Could you explain why it's inappropriate for upstream but why we do =
need it here?
>=20
> I asked the udev maintainer:
>=20
> 14:25 < koen> kay: the udev Makefile.am has 'ln -sf =
$(libexecdir)/udev-acl =
$(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d/udev-acl.ck', any reason =
for not using ${libdir} over ${prefix}/lib ?
> 14:29 < kay> koen: libdir is /usr/lib64 here, can't use that
>=20
> So upstream is aware of multilib, but wants to put these scripts in a =
non-multilib dir. Since I don't have any experience with the =
fedora/opensuse way of multilib nor the new oe-core one, could you =
please explain why oe-core needs this patch, but fedora/opensuse don't?


Some more:

14:33 < kay> koen: yeah, libdir can never be used for any "app private =
dir"
14:34 < kay> koen: /lib/<pkgname>/ /usr/lib/<pkgname>/ is app-priv-dir =
and never libdir
14:34 < kay> koen: but you should not use udev-acl anyway, i guess :)
14:34 < koen> that's another thing :)
14:34 < kay> koen: i disabled it by default now
14:34 < kay> all in sysyemd
14:34 < koen> the patch was for 164, I'm at 172 now without acl
14:35 < koen> we're adding multilib support to our buildsystem and we're =
having trouble judging when to use ${libdir} or ${prefix}/lib in some =
cases
14:35 < koen> I expected udev to be fairly sane by now, hence the =
question
14:35 < kay> koen: libdir only for .so, never anything else



