Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcZmA-0004ky-Li
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 11:12:38 +0200
Received: by wyg30 with SMTP id 30so2335468wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 02:08:54 -0700 (PDT)
Received: by 10.216.239.73 with SMTP id b51mr2579450wer.63.1309511333902;
	Fri, 01 Jul 2011 02:08:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g2sm1513660wes.34.2011.07.01.02.08.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 02:08:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309507826.20015.509.camel@rex>
Date: Fri, 1 Jul 2011 11:08:47 +0200
Message-Id: <D2DB54E8-BE7A-4036-9F5A-587D90844875@dominion.thruhere.net>
References: <cover.1309243115.git.liezhi.yang@windriver.com>
	<4E0D062C.5060302@linux.intel.com>
	<2B6421C4-E7C5-42FB-B46F-AAFAE85DB7F2@dominion.thruhere.net>
	<1309507826.20015.509.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: It's broken, please revert. Re: [PATCH 0/4 V4] Share gcc work directories
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
X-List-Received-Date: Fri, 01 Jul 2011 09:12:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jul 2011, om 10:10 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-07-01 at 09:15 +0200, Koen Kooi wrote:
>> Op 1 jul 2011, om 01:26 heeft Saul Wold het volgende geschreven:
>>=20
>>> On 06/28/2011 02:05 AM, Robert Yang wrote:
>>>> Changes of V4:
>>>>=20
>>>> * Change the definition of GLIBC_DYNAMIC_LINKER as Richard =
suggested.
>>>>=20
>>>>  e.g., the entries in the files that look like:
>>>>  #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
>>>>=20
>>>>  become
>>>>=20
>>>>  #define GLIBC_DYNAMIC_LINKER64 =
SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"
>>>>=20
>>>>  and we define SYSTEMLIBS_DIR in defaults.h.
>>>>=20
>>>>  NOTE, the round brackets:
>>>>  #define GLIBC_DYNAMIC_LINKER64 (SYSTEMLIBS_DIR =
"/ld-linux-x86-64.so.2")
>>>>=20
>>>>  doesn't work in in the following define:
>>>>=20
>>>>  #define LINUX_DYNAMIC_LINKER \
>>>>          CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, =
UCLIBC_DYNAMIC_LINKER)
>>>>=20
>>>>  so use:
>>>>  #define GLIBC_DYNAMIC_LINKER64 =
SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"
>>>>=20
>>>> * Compare to V3, reduce two patches which are for gcc-crosssdk.inc =
and
>>>>  gcc-cross-canadian which are not needed any more.
>>>>=20
>>>> * Fix the conflicts(gcc-4.6.0 ->  gcc-4.6, and the ${BRANCH})
>>>>=20
>>>> * Both tested 4.5.1 and 4.6:
>>>>  $ bitbake meta-toolchain core-image-sato
>>>>  $ runqemu qemurm
>>>>=20
>>>>  Also unpack the sdk to /opt and test to make sure the toolchain =
works well.
>>>>=20
>>>>=20
>>>> The following changes since commit =
a1f79a7896b6411669b3ccada6204d2695e80fc5:
>>>>=20
>>>>  runqueue.py: Add umask task control (2011-06-24 12:23:12 +0100)
>>>>=20
>>>> are available in the git repository at:
>>>>  git://git.pokylinux.org/poky-contrib robert/share_gcc
>>>>  =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Drobert/share_gcc
>>>>=20
>>>> Robert Yang (4):
>>>>  bitbake: share source directory
>>>>  Share gcc work directories
>>>>  gcc-4.5.1: share work directories
>>>>  gcc-4.6: share work directories
>>>>=20
>>>> bitbake/lib/bb/build.py                            |    4 +-
>>>> bitbake/lib/bb/cache.py                            |    3 +
>>>> bitbake/lib/bb/runqueue.py                         |   10 +++
>>>> meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    1 +
>>>> .../gcc-4.5.1/use-defaults.h-and-t-oe-in-B.patch   |   57 =
++++++++++++++
>>>> meta/recipes-devtools/gcc/gcc-4.6.inc              |    5 +-
>>>> .../gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch |   80 =
++++++++++++++++++++
>>>> meta/recipes-devtools/gcc/gcc-common.inc           |   32 +++++++-
>>>> meta/recipes-devtools/gcc/gcc-configure-common.inc |   48 =
+++++++-----
>>>> meta/recipes-devtools/gcc/gcc-configure-cross.inc  |    4 +-
>>>> meta/recipes-devtools/gcc/gcc-crosssdk.inc         |    6 --
>>>> 11 files changed, 218 insertions(+), 32 deletions(-)
>>>> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.5.1/use-defaults.h-and-t-oe-in-B.patch
>>>> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch
>>>>=20
>>>>=20
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>>=20
>>>=20
>>> Merged into OE-Core
>>=20
>> incremental build with rm_work turned on:
>>=20
>> ERROR: Function 'do_configure' failed (see =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092 =
for further information)
>> ERROR: Logfile of failure stored in: =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092
>> Log data follows:
>> | + cd =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4.5/build.x86_64-linux.a=
rm-angstrom-linux-gnueabi
>> | + do_configure
>> | + sed -i =
'/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-=
gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4_5-branch/gcc/config/*=
/linux*.h' -e 's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 =
SYSTEMLIBS_DIR\2#'
>> | sed: can't read =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4_5-branch/gcc/config/*/=
linux*.h: No such file or directory
>> | ERROR: Function 'do_configure' failed (see =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092 =
for further information)
>> NOTE: package gcc-cross-initial-4.5-r37.0+svnr175127: task =
do_configure: Failed
>> ERROR: Task 764 =
(/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-c=
ross-initial_4.5.bb, do_configure) failed with exit code '1'
>>=20
>> Can this patchset get reverted please and reapplied when it actually =
has been tested to work?
>=20
> Testing patches is not the sole responsibility of myself and Saul. =
This
> gcc patchset was on the mailing list for a considerable time and has
> been tested in a variety of ways. Various breakage was identified =
found
> and those breakages were fixed. The fact there looks to be some
> incremental build issue with rm_work is unfortunate and likely easy to
> fix so I think this request is a little out of proportion.
>=20
> If someone had reported the problem before it merged it would have
> waited until it was fixed before merging.

"They will therefore merge and I'm happy with them but it will be a few
more days before that happens. "

I was under the impression that I still had a few more days to test them =
now that the eglibc problems have been solved. I don't think you can =
blame people for not testing gcc when eglibc was still blowing up in =
their faces.

> I find it ironic you're one of the people asking to turn the =
autobuilder
> red, make warnings fatal and break things for everyone as 'its the =
only
> way to get people to look at and fix them; but on the other hand =
you're
> unhappy if testing of patches doesn't happen on every single =
combination
> of usages and something does break :/.

I was actually planning to test them today, now that eglibc works again.=


