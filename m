Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1SbtzI-0007cv-Sq
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 15:39:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2012 06:29:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="151820510"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2012 06:29:29 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.198]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.48]) with mapi id
	14.01.0355.002; Tue, 5 Jun 2012 14:29:21 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] ltp: Add patch to correct failing build
Thread-Index: AQHNQOExUyXFcDQBGEay/C2ZN65di5bqzzqAgACIlOCAAGQc0A==
Date: Tue, 5 Jun 2012 13:29:20 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1614F67B@IRSMSX102.ger.corp.intel.com>
References: <1338537158-19917-1-git-send-email-cristian.iorga@intel.com>
	<CAPhnLPAUewTddwVFXa77deAUomq7_T17MAYCsr_t+6rmT0OLxw@mail.gmail.com>
	<4FCD5093.3070606@linux.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB1614F04C@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1614F04C@IRSMSX102.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH] ltp: Add patch to correct failing build
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
X-List-Received-Date: Tue, 05 Jun 2012 13:39:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

&> does not work correctly in dash, working to correct the issue.
I have tested it by making the target (bitbake ltp), but it is safe to assu=
me that make Version is not issued during normal build.
Will propose a new patch.

Thanks,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Iorga, Cristian
Sent: Tuesday, June 05, 2012 10:31 AM
To: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH] ltp: Add patch to correct failing build

Hello all,

@Saul: Of course I have tested the final patch, I will re-test and get back=
 to you.
	It worked for me.

Thanks,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Saul Wold
Sent: Tuesday, June 05, 2012 3:20 AM
To: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH] ltp: Add patch to correct failing build

On 06/02/2012 09:59 AM, Flanagan, Elizabeth wrote:
> On Fri, Jun 1, 2012 at 12:52 AM, Cristian Iorga=20
> <cristian.iorga@intel.com>  wrote:
>> ltp makefile does not interpret correctly the result of git describe=20
>> command and assumes that it is working with a git repo, while in fact=20
>> working with a source code archive.
>> Added a patch to corect makefile system.
>>
>> Signed-off-by: Cristian Iorga<cristian.iorga@intel.com>
>> ---
>>   .../ltp/ltp/fix_building_fom_archive.patch         |   23 ++++++++++++=
++++++++
>>   meta/recipes-extended/ltp/ltp_20120401.bb          |    4 ++--
>>   2 files changed, 25 insertions(+), 2 deletions(-)
>>   create mode 100644
>> meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
>>
>> diff --git
>> a/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
>> b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
>> new file mode 100644
>> index 0000000..c0ecc86
>> --- /dev/null
>> +++ b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
>> @@ -0,0 +1,23 @@
>> +ltp package build system is broken if building from archive
>> +
>> +ltp makefile does not interpret correctly the result of git describe=20
>> +command and assumes that it is working with a git repo, while in=20
>> +fact working with a source code archive.
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Cristian Iorga<cristian.iorga@intel.com>
>> +
>> +Index: ltp-20120401/Makefile
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- ltp-20120401.orig/Makefile
>> ++++ ltp-20120401/Makefile
>> +@@ -173,7 +173,8 @@ SRCDIR_INSTALL_TARGETS     :=3D $(SRCDIR_INSTA
>> + #
>> + .PHONY: Version
>> + Version:
>> +-      if git describe&>  /dev/null; then \
>> ++      git describe&>  /dev/null
>> ++      if [ $? -eq 0 ]; then \
>> +               git describe>  "$@"; \
>> +       else \
>> +               cp VERSION "$@"; \
>> diff --git a/meta/recipes-extended/ltp/ltp_20120401.bb
>> b/meta/recipes-extended/ltp/ltp_20120401.bb
>> index 912d6d9..563bd58 100644
>> --- a/meta/recipes-extended/ltp/ltp_20120401.bb
>> +++ b/meta/recipes-extended/ltp/ltp_20120401.bb
>> @@ -21,10 +21,10 @@ LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
>>
>>   DEPENDS =3D "attr"
>>
>> -PR =3D "r3"
>> +PR =3D "r4"
>>
>>   SRC_URI =3D "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
>> -          "
>> +           file://fix_building_fom_archive.patch"
>>
>>   SRC_URI[md5sum] =3D "e1d0acf1a6b6da0cb30dc1b0dcf5f26d"
>>   SRC_URI[sha256sum] =3D "f0f5845f9666f61332fdf0b7e396fc647f9372db0902a8=
29af2cf9402b807bd1"
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> This patch seems to be causing build failures:
>
> | ERROR: Function failed: do_compile (see
> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/bu
> ild/tmp/work/ppc603e-poky-linux/ltp-20120401-r4/temp/log.do_compile.69
> 5
> for further information)
> | NOTE: make -j 16
> | make -C "lib" \
> | 	-f "/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/buil=
d/build/tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120401/lib/Makefi=
le"
> all
> | git describe&>  /dev/null
> | make: *** [Version] Error 128
> | make: *** Waiting for unfinished jobs....
> | make[1]: Entering directory
> `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/buil=
d/tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120401/lib'
> | make[1]: Nothing to be done for `all'.
> | make[1]: Leaving directory
> `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/buil=
d/tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120401/lib'
> | ERROR: oe_runmake failed
>
>
You might want to use "-git describe&>  /dev/null", as this will ignore err=
ors, I thought you tested the final patch?

 From the make manual pages:

To ignore errors in a recipe line, write a '-' at the beginning of the line=
's text (after the initial tab). The '-' is discarded before the line is pa=
ssed to the shell for execution.

For example,

      clean:
              -rm -f *.o

This causes make to continue even if rm is unable to remove a file.

>
> -b
>

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


