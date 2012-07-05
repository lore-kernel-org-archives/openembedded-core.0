Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SmpmV-00031i-8R
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:23:55 +0200
Received: from mail139-co1-R.bigfish.com (10.243.78.238) by
	CO1EHSOBE010.bigfish.com (10.243.66.73) with Microsoft SMTP Server id
	14.1.225.23; Thu, 5 Jul 2012 16:40:29 +0000
Received: from mail139-co1 (localhost [127.0.0.1])	by
	mail139-co1-R.bigfish.com (Postfix) with ESMTP id C739248014B;
	Thu,  5 Jul 2012 16:40:28 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zzbb2dI98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail139-co1 (localhost.localdomain [127.0.0.1]) by mail139-co1
	(MessageSwitch) id 1341506426777911_4772;
	Thu,  5 Jul 2012 16:40:26 +0000 (UTC)
Received: from CO1EHSMHS001.bigfish.com (unknown [10.243.78.226])	by
	mail139-co1.bigfish.com (Postfix) with ESMTP id BA32DDC004A;
	Thu,  5 Jul 2012 16:40:26 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS001.bigfish.com
	(10.243.66.11) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 5 Jul 2012 16:40:26 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.163]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Thu, 5 Jul 2012 11:42:24 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] libxml-parser-perl_2.41.bb: fix MakeMaker
	issues with using wrong CC/LD/etc
Thread-Index: AQHNWaGJa+6b4u2Dkk670Vzm6fQU6pcbOsMA
Date: Thu, 5 Jul 2012 16:42:23 +0000
Message-ID: <CAEsOVNdwetQiOQrXMEbp=X+6f2_++dJCnvTJd=3xa3P_8Utg7g@mail.gmail.com>
References: <1341343267-32355-1-git-send-email-msm@freescale.com>
	<4FF3CD3E.8030101@linux.intel.com>
In-Reply-To: <4FF3CD3E.8030101@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] libxml-parser-perl_2.41.bb: fix MakeMaker issues with using wrong CC/LD/etc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 05 Jul 2012 17:23:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2559DE86164EFF499AE7630361B0D9DA@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 3, 2012 at 11:57 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/03/2012 12:21 PM, Matthew McClintock wrote:
>>
>> MakeMaker has a bug where it does not propagate CC/LD/etc information
>> down to subproject it generates Makefiles for... this recipe has has an
>> Expat subproject which has issues building if we are using sstate-cache
>> and it will reference the old sysroots and be unable to build properly.
>> There is an upstream MakeMaker bug for this issue but we can work around
>> it by fixing up the Makefiles for now
>>
>> See:
>> https://rt.cpan.org/Public/Bug/Display.html?id=3D28632
>>
>> Signed-off-by: Matthew McClintock<msm@freescale.com>
>> ---
>>   meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb |   11 +++++++++=
--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
>> b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
>> index be41578..fff29ac 100644
>> --- a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
>> +++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
>> "file://README;beginline=3D2;endline=3D6;md5=3Dc8767d7516229f07b26e
>>
>>   DEPENDS +=3D "expat expat-native"
>>
>> -PR =3D "r2"
>> +PR =3D "r3"
>>
>>   SRC_URI =3D
>> "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
>>   SRC_URI[md5sum] =3D "c320d2ffa459e6cdc6f9f59c1185855e"
>> @@ -13,10 +13,17 @@ SRC_URI[sha256sum] =3D
>> "b48197cd2265a26c5f016489f11a7b450d8833cb8b3d6a46ee15975740
>>
>>   S =3D "${WORKDIR}/XML-Parser-${PV}"
>>
>> -EXTRA_CPANFLAGS =3D "EXPATLIBPATH=3D${STAGING_LIBDIR}
>> EXPATINCPATH=3D${STAGING_INCDIR}"
>> +EXTRA_CPANFLAGS =3D "EXPATLIBPATH=3D${STAGING_LIBDIR}
>> EXPATINCPATH=3D${STAGING_INCDIR} CC=3D${CC} LD=3D${LD} FULL_AR=3D${AR}"
>>
>>   inherit cpan
>>
>> +# fix up sub MakeMaker project as arguments don't get propagated though
>> +# see https://rt.cpan.org/Public/Bug/Display.html?id=3D28632
>> +do_configure_append() {
>> +       sed 's/--sysroot=3D.*\(\s\|$\)/--sysroot=3D${STAGING_DIR_TARGET}=
 /g'
>> -i Makefile Expat/Makefile
>> +       sed 's/^FULL_AR =3D .*/FULL_AR =3D ${AR}/g' Expat/Makefile
>> +}
>> +
>
> This seems to have caused the following error:
>>
>> ERROR: Function failed: do_configure (see
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/work/i586-poky-linux/libxml-parser-perl-2.41-r3/temp/log.do_configure.7=
7756
>> for further information)
>> NOTE: Running task 6659 of 10967 (ID: 4264,
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/meta/r=
ecipes-graphics/xorg-lib/libxfontcache_1.0.5.bb,
>> do_configure)
>> ERROR: Logfile of failure stored in:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/work/i586-poky-linux/libxml-parser-perl-2.41-r3/temp/log.do_configure.7=
7756
>> Log data follows:
>> | DEBUG: Executing python function sysroot_cleansstate
>> | DEBUG: Python function sysroot_cleansstate finished
>> | DEBUG: Executing shell function do_configure
>> | *** Module name IN:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/qemux86/usr/lib/perl/5.14.2/Cwd.pm
>> | *** p1:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/qemux86/usr/lib/
>> p3: perl/5.14.2/  p5: Cwd.pm
>> | *** Module name OUT:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/Cwd.pm
>> | *** Module name IN:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/qemux86/usr/lib/perl/5.14.2/Fcntl.pm
>> | *** p1:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/qemux86/usr/lib/
>> p3: perl/5.14.2/  p5: Fcntl.pm
>> | *** Module name OUT:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/Fcntl.pm
>> | *** Module name IN:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/qemux86/usr/lib/perl/5.14.2/IO.pm
>> | *** p1:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/qemux86/usr/lib/
>> p3: perl/5.14.2/  p5: IO.pm
>> | *** Module name OUT:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/IO.pm
>> | *** Module name IN:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/qemux86/usr/lib/perl/5.14.2/List/Util.pm
>> | *** p1:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/qemux86/usr/lib/
>> p3: perl/5.14.2/  p5: List/Util.pm
>> | *** Module name OUT:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/List/Util.pm
>> | Warning: prerequisite LWP 0 not found.
>> | Checking if your kit is complete...
>> | Looks good
>> | '--SYSROOT' is not a known MakeMaker parameter name.
>> | '-MARCH' is not a known MakeMaker parameter name.
>> | *** Module name IN:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/Tie/Hash/NamedCap=
ture.pm
>> | *** p1:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/x86_64-linux/usr/lib/
>> p3:   p5: perl-native/perl/5.14.2/Tie/Hash/NamedCapture.pm
>> | *** Module name OUT:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/perl-native/perl/=
5.14.2/Tie/Hash/NamedCapture.pm
>> | Writing Makefile for XML::Parser::Expat
>> | Writing MYMETA.yml
>> | Writing Makefile for XML::Parser
>> | Writing MYMETA.yml
>> | *** Module name IN:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/qemux86/usr/lib/perl/5.14.2/POSIX.pm
>> | *** p1:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/qemux86/usr/lib/
>> p3: perl/5.14.2/  p5: POSIX.pm
>> | *** Module name OUT:
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/POSIX.pm
>> | sed: -e expression #1, char 36: unknown option to `s'
>> | ERROR: Function failed: do_configure (see
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/=
tmp/work/i586-poky-linux/libxml-parser-perl-2.41-r3/temp/log.do_configure.7=
7756
>> for further information)
>> NOTE: package libxml-parser-perl-2.41-r3: task do_configure: Failed
>
>
>
> Please review this patch.

Saul,

What version of sed was used on this machine? That's my only guess why
this failed for you and not me. Some weirdness of the regex.

-M


>
> Thanks
>         Sau!
>
>
>
>
>>   do_compile() {
>>         export LIBC=3D"$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -nam=
e
>> 'libc-*.so')"
>>         cpan_do_compile
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



