Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QXbgT-00031R-TV
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 18:14:13 +0200
Received: by wye20 with SMTP id 20so2141509wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 09:10:44 -0700 (PDT)
Received: by 10.216.134.67 with SMTP id r45mr2312486wei.44.1308327044727;
	Fri, 17 Jun 2011 09:10:44 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 74sm1487335wem.41.2011.06.17.09.10.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2011 09:10:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DFB76E3.5090606@windriver.com>
Date: Fri, 17 Jun 2011 18:10:41 +0200
Message-Id: <7CB00F6A-70DA-4F49-978A-69BF61348C71@dominion.thruhere.net>
References: <4DF0A70C.7080501@windriver.com> <4DF0E4A8.1000608@windriver.com>
	<4DFB26CE.7070807@windriver.com> <4DFB76E3.5090606@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Question about apply eglibc configurability to create minimal image
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
X-List-Received-Date: Fri, 17 Jun 2011 16:14:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Op 17 jun 2011, om 17:46 heeft Mark Hatle het volgende geschreven:

> On 6/17/11 5:05 AM, Kang Kai wrote:
>> On 2011=E5=B9=B406=E6=9C=8809=E6=97=A5 23:20, Mark Hatle wrote:
>>> On 6/9/11 5:57 AM, Kang Kai wrote:
>>>> Hi Mark,
>>>>=20
>>>> I am focus on eglibc itself compilation with disabling all the=20
>>>> configurable options, right now eglibc can be compiled with disable =
all=20
>>>> the configurable options.
>>>>=20
>>>> But when I build core-image-minimal in a clear new directory, some=20=

>>>> packages build failed and they need eglibc supports, such as
>>> core-image-minimal is simply to large of an image to see some of the =
advantages
>>> of the eglibc configuration.  Realistically the advantages come on =
single
>>> application or small (busybox + single application) systems.
>>>=20
>>>> gcc-runtime    depends on     libc-libm
>>> The above looks like a bug to me and should be investigated.. (a bug =
in gcc that
>>> is..)
>>>=20
>>>> ncurse            depends on    libc-posix-wchar-io =
libc-posix-clang-wchar
>>> ncurses can be configured WITHOUT wide character support, the needs =
to be done
>>> with any of the wchar options disabled in eglibc.
>>>=20
>>>> openssl           depends on    libc-inet libc-nsswitch
>>> I'm not sure why openssl needs either inet or nsswitch.  inet =
perhaps if it
>>> tries to make certain socket calls, but libc-nsswitch should never =
be required
>>> outside of eglibc.  This is likely a configuration issue in openssl =
-- or a bug
>>> in eglibc.
>>>=20
>>>> gettext            depends on    libc-spawn libc-locale-code=20
>>>> libc-getlogin libc-utmp
>>>> ...
>>> Once we introduce gettext (beyond simply it's m4 macros) we're no =
longer in
>>> "small" system territory.  gettext and many others really want some =
of the
>>> larger system capabilities as they are designed for multilingual =
systems.
>>>=20
>>>> After enable those options, the image size only decrease from 9.6M  =
to=20
>>>> 9.4M(qemux86). And the dependencies on eglibc is hard to break,=20
>>>> something like  libcrypt getlogin(function) can't be breaken.
>>>> Could you give me some directions what should I do with eglibc=20
>>>> configurability?
>>> My suggest is to start with a new custom configuration.  (ignore the =
gcc-runtime
>>> for right now and enable libm.)  The goal of this configuration is a =
small,
>>> local system -- without network connectivity.
>>>=20
>>> Walk through the core-image-minimal, and you'll see:
>>> IMAGE_INSTALL =3D "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}"
>>>=20
>>> Looking at task-core-boot:
>>>=20
>>> RDEPENDS_task-core-boot =3D "\
>>>  base-files \
>>>  base-passwd \
>>>  busybox \
>>>  initscripts \
>>>  ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} =
\
>>>  modutils-initscripts \
>>>  netbase \
>>>  sysvinit \
>>>  tinylogin \
>>>  udev \
>>>  ${VIRTUAL-RUNTIME_update-alternatives} \
>>>  ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
>>>=20
>>> RRECOMMENDS_task-core-boot =3D "\
>>>  ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"
>>>=20
>>> =46rom the above, I'm pretty sure that "netbase" will require a lot =
of networking
>>> components, specifically adding things like libc-inet.  So avoid =
netbase.
>>>=20
>>> It's possible that keyboard/keymaps may cause additional stuff to =
come in due to
>>> locale requirements.. so I'd dump those as well..
>>>=20
>>> sysvinit may also introduce some additional items -- so if it causes =
problems,
>>> remove it and switch to the init located within busybox.
>>>=20
>>> update-alternatives is what included gettext -- so this might need =
some
>>> enhancement to avoid gettext as a requirement.  So I'd suggest =
skipping it.
>>> (Note without it, it's likely busybox, tinylogin may not get setup =
properly...)
>>>=20
>>> udev is quite complex and drags in a number of components -- so drop =
that..
>>>=20
>>> Leaving:
>>>=20
>>>  base-files \
>>>  base-passwd \
>>>  busybox \
>>>  initscripts \
>>>  modutils-initscripts \
>>>  sysvinit \
>>>  tinylogin
>>=20
>> Hi Mark,
>>=20
>> According this list, expand with their run time depency(show in the =
attachment
>> minimal-image-runtime-dependies.png) , and the list is:
>>=20
>>  base-files \
>>  base-passwd \
>>  busybox \
>>  busybox-syslog \
>>  busybox-udhcpc \
>>  initscripts \
>>  makedevs \
>>  modutils-initscripts \
>>  sysvinit \
>>  sysvinit-pidof \
>>  sysvinit-inittab \
>>  tinylogin
>>=20
>>=20
>> When only enable eglibc libm, busybox, sysvinit and tinylogin can't =
be compiled.
>>=20
>> busybox depends on
>>=20
>>  * libc-crypt
>>  * libc-getlogin
>>  * libc-inet
>>  * libc-posix-regexp
>>=20
>> I wonder that maybe libc-crypt can NOT be disabled?  Other 3 options =
can be
>> disabled by closing some busybox feature and builtin commands.
>=20
> I would guess that there are options within busybox that are enabled =
that make
> use of each of these.  Do you get a failure in compilation, =
configuration, or?
> You will likely have to shrink busybox down to a shell and a few =
simple
> commands, instead of the normal config.

THat should be straightforward now that we have this one: =
http://cgit.openembedded.org/cgit.cgi/openembedded-core/commit/?id=3D383d9=
4222e8cfc85d0885f60c88c064091866296

and please don't cross-post between poky and oe-core lists...=


