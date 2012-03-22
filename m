Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SApkB-0008B5-UQ
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 22:40:28 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 83B32A6264;
	Thu, 22 Mar 2012 22:31:29 +0100 (CET)
Date: Thu, 22 Mar 2012 22:31:27 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20120322223127.136698cf@eb-e6520>
In-Reply-To: <CAMKF1sr=PedPsmpPSGC42Wvof9fHbR26JM2hgEZjA3h621ynxA@mail.gmail.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<CAMKF1sq7hcTKrzFBYgmUOTcdQw6sC1FG4jUhsfKauqeXLQMgsg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BAA8@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
	<20120322131310.1c6455d1@eb-e6520>
	<CAMKF1sqEGjWMpPTQxP3j1bbP6H2FQqAgHZGm399ejC-RyDxboQ@mail.gmail.com>
	<20120322134340.1af3dfda@eb-e6520>
	<CAMKF1srORF53h-V+fKTjJn2jWg=f6nOaMf_eUmYPLnW-ovc7NQ@mail.gmail.com>
	<20120322141455.644058f0@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137BE5C@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srd0KanO6NfQtm0U39GZS_ANsu9KdRR0hirpKQrhMCxzg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BEEB@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sr=PedPsmpPSGC42Wvof9fHbR26JM2hgEZjA3h621ynxA@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Jansa <martin.jansa@gmail.com>, Martin, Patches,
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Thu, 22 Mar 2012 21:40:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Khem, Hi Nitin,

Le Thu, 22 Mar 2012 12:16:44 -0700,
Khem Raj <raj.khem@gmail.com> a =E9crit :
> On Thu, Mar 22, 2012 at 10:38 AM, Kamble, Nitin A
> <nitin.a.kamble@intel.com> wrote:
> > Looks like we need this patch for the python recipe to generate debug m=
odules:
> > http://patch-tracker.debian.org/patch/series/view/python2.7/2.7.2-8/deb=
ug-build.diff
>=20
> yep thats the one. Apply it to python and rebuild python-native and
> stage it then see if that helps. You might have to adjust the FILES
> and PACKAGES to put the new files in right places.

With this patch all the libraries (including libpython2.7) now have a _d
suffix : is that what we really want ?

Once that's hacked in the recipe so that do_compile works - in case
someone has an idea - I get a failure during installation of
python-nativesdk :
build/tmp-eglibc/work/x86_64-nativesdk-oesdk-linux/python-nativesdk-2.7.2-r=
1.9/image/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/pytho=
n2.7/sysconfig.py :
return os.path.join(get_path('platstdlib'), "config" + (sys.pydebug and
"_d" or ""), "Makefile") | AttributeError: 'module' object has no
attribute 'pydebug

I checked on both debian & fedora and they are using this patch only to
generate debug packages, not for the standard package.
Moreover, when I execute gdb on my PC (Fedora 16) it runs fine and I
don't have readline_d.so installed in lib-dynload so it seems possible
to get gdb to work with python without having debug symbols.

Eric


