Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rj2Pq-000582-G8
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 06:32:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 21:25:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92972029"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by azsmga001.ch.intel.com with ESMTP; 05 Jan 2012 21:25:08 -0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 6 Jan 2012 13:23:57 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.199]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.223]) with mapi id
	14.01.0355.002; Fri, 6 Jan 2012 13:23:55 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 06/14] hdparm: upgrade to 9.37
Thread-Index: AQHMyXR1tFvLrQt3y0OzHbur3WgcQpX+0Y9A
Date: Fri, 6 Jan 2012 05:23:55 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC0183FB@SHSMSX102.ccr.corp.intel.com>
References: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
	<2216646a20081554bc1a4f8ab9e6bf7575b1b146.1325252646.git.shane.wang@intel.com>
	<4F01EA18.4050108@linux.intel.com>
In-Reply-To: <4F01EA18.4050108@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 06/14] hdparm: upgrade to 9.37
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
X-List-Received-Date: Fri, 06 Jan 2012 05:32:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote on=A02012-01-03:

> On 12/30/2011 06:33 AM, Shane Wang wrote:
>> Because hdparm depends on stat, stat is brought into Yocto.
>>=20
> Is this a new dependency witht he update version?
>
Yes, it is.

>=20
>> Part of this patch comes from oe
>> http://git.openembedded.org/openembedded/tree/recipes/hdparm, and
>> http://git.openembedded.org/openembedded/tree/recipes/stat.
>> But, changes include:
>>   - upgrade to the latest version 9.37 from 9.35.
>>   - added license checksum for both recipes.
>>   - for hdparm, the license for wiper which is in hdparm is GPLv2. So,
> hdparm license in its bb file is changed accordingly.
>>=20
>> Signed-off-by: Shane Wang<shane.wang@intel.com>
>> ---
>>   .../recipes-extended/hdparm/hdparm-6.3/bswap.patch |   37
>>   -------------------- .../hdparm/hdparm-6.3/uclibc.patch             =20
>>     |   34 ------------------
>>   meta/recipes-extended/hdparm/hdparm_6.3.bb         |   18 ---------
>>   meta/recipes-extended/hdparm/hdparm_9.37.bb        |   35
>>   ++++++++++++++++++ meta/recipes-extended/stat/stat_3.3.bb           =20
>>   |   27 ++++++++++++++ 5 files changed, 62 insertions(+), 89
>>   deletions(-) delete mode 100644
>>   meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch delete mode
>>   100644 meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch delete
>>   mode 100644 meta/recipes-extended/hdparm/hdparm_6.3.bb create mode
>>   100644 meta/recipes-extended/hdparm/hdparm_9.37.bb create mode 100644
>>   meta/recipes-extended/stat/stat_3.3.bb
>> diff --git a/meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch
>> b/meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch deleted file mode
>> 100644 index 715886a..0000000 ---
>> a/meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch +++ /dev/null @@
>> -1,37 +0,0 @@ -Upstream-Status: Backport - -# -# Patch managed by
>> http://www.holgerschurig.de/patcher.html -# - ----
>> hdparm-5.8/hdparm.c~bswap -+++ hdparm-5.8/hdparm.c -@@ -20,7 +20,9 @@ -
>> #include<linux/types.h> - #include<linux/hdreg.h> -
>> #include<linux/major.h> --#include<asm/byteorder.h>
>> -+#include<byteswap.h> -+ -+#define le16_to_cpus(x) bswap_16(htons(x))
>> - - #include "hdparm.h" - -@@ -1160,7 +1162,7 @@ - 			} - 		} else { -
>> 			for(i =3D 0; i<  0x100; ++i) { --				__le16_to_cpus(&id[i]);
>> -+				le16_to_cpus(&id[i]); - 			} - 			identify((void *)id, NULL); -
>> 		} -@@ -1380,7 +1382,7 @@ - 	} - 	for (i =3D 0; count>=3D 4; ++i) { -
>> 		sbuf[i] =3D (fromhex(b[0])<<  12) | (fromhex(b[1])<<  8) |
>> (fromhex(b[2])<<  4) | fromhex(b[3]); --		__le16_to_cpus((__u16
>> *)(&sbuf[i])); -+		le16_to_cpus((__u16 *)(&sbuf[i])); - 		b +=3D 5; -
>> 		count -=3D 5; - 	} diff --git
>> a/meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch
>> b/meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch deleted file
>> mode 100644 index d5f9298..0000000 ---
>> a/meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch +++ /dev/null @@
>> -1,34 +0,0 @@ -Upstream-Status: Inappropriate [embedded specific] -
>> ---- hdparm-5.8/hdparm.c.ark	2005-05-22 19:48:34.000000000 +0000 -+++
>> hdparm-5.8/hdparm.c	2005-05-22 19:52:18.000000000 +0000 -@@ -17,7 +17,9
>> @@ - #include<sys/times.h> - #include<sys/types.h> -
>> #include<sys/mount.h> -+#ifndef __UCLIBC__ - #include<linux/types.h>
>> -+#endif - #include<linux/hdreg.h> - #include<linux/major.h> -
>> #include<byteswap.h> ---- hdparm-5.8/hdparm.h.ark	2005-05-22
>> 19:51:49.000000000 +0000 -+++ hdparm-5.8/hdparm.h	2005-05-22
>> 19:54:54.000000000 +0000 -@@ -1,6 +1,6 @@ - /* Some prototypes for
>> extern functions. */ - --#include<linux/types.h>	/* for __u16 */
>> -+#include<stdint.h> - - #if !defined(__GNUC__)&&=20
>> !defined(__attribute__) - #define __attribute__(x)	/* if not using GCC,
>> turn off the __attribute__ -@@ -11,7 +11,7 @@ -    others, though, were
>> declared in hdparm.c with global scope; since other -    functions in
>> that file have static (file) scope, I assume the difference is -  =20
>> intentional. */ --extern void identify (__u16 *id_supplied, const char
>> *devname); -+extern void identify (uint16_t *id_supplied, const char
>> *devname); - - extern void usage_error(int out)  =20
>> __attribute__((noreturn)); - extern int main(int argc, char **argv)
>> __attribute__((noreturn)); - diff --git
>> a/meta/recipes-extended/hdparm/hdparm_6.3.bb
>> b/meta/recipes-extended/hdparm/hdparm_6.3.bb deleted file mode 100644
>> index 62ae4c0..0000000 --- a/meta/recipes-extended/hdparm/hdparm_6.3.bb
>> +++ /dev/null @@ -1,18 +0,0 @@ -SUMMARY =3D "Utility for displaying and
>> setting hard disk parameters" -DESCRIPTION =3D "hdparm is a system
>> utility for viewing \ -and manipulating various IDE drive and driver
>> parameters." -SECTION =3D "console/utils" -LICENSE =3D "BSD"
>> -LIC_FILES_CHKSUM =3D
>> "file://LICENSE.TXT;md5=3D910a8a42c962d238619c75fdb78bdb24" - -SRC_URI =
=3D
>> "${SOURCEFORGE_MIRROR}/hdparm/hdparm-${PV}.tar.gz \ -	 =20
>> file://bswap.patch \ -	   file://uclibc.patch" - -SRC_URI[md5sum] =3D
>> "0c12672f3a09c14ad0b0882f15fc9389" -SRC_URI[sha256sum] =3D
> "08688a6a46ba495494bf838f8f26103e797584c1888eca94e43a171e1b3724
> 6d"
>> - -do_install () { -	install -d ${D}/${sbindir} ${D}/${mandir}/man8
>> -	oe_runmake 'DESTDIR=3D${D}' install -} diff --git
>> a/meta/recipes-extended/hdparm/hdparm_9.37.bb
>> b/meta/recipes-extended/hdparm/hdparm_9.37.bb new file mode 100644
>> index 0000000..fdda67f --- /dev/null +++
>> b/meta/recipes-extended/hdparm/hdparm_9.37.bb @@ -0,0 +1,35 @@
>> +DESCRIPTION =3D "hdparm is a Linux shell utility for viewing \ +and
>> manipulating various IDE drive and driver parameters." +SECTION =3D
>> "console/utils" +PRIORITY =3D "optional" +LICENSE =3D "BSD&  GPLv2"
>=20
> Spacing needs to be between the BSD and &
Strange. The space is there between BSD and &, after I checked the email an=
d the patch.
Strange.

>=20
> Since you are creating a wiper package below and it is licensed as
> GPLv2, then you also need a LICENSE_wiper =3D "GPLv2"
OK

>=20
>> +LIC_FILES_CHKSUM =3D
>> "file://LICENSE.TXT;md5=3D910a8a42c962d238619c75fdb78bdb24 \ +
>> file://debian/copyright;md5=3Da82d7ba3ade9e8ec902749db98c592f3 \ +
>> file://wiper/GPLv2.txt;md5=3Dfcb02dc552a041dee27e4b85c7396067 \ +
> file://wiper/wiper.sh;beginline=3D7;endline=3D31;md5=3Db7bc642addc152ea30=
750
> 5bf1a296f09"
>> +
>> +PACKAGES +=3D "wiper"
>> +
>> +FILES_wiper =3D "${bindir}/wiper.sh"
>> +FILES_${PN} =3D "${base_sbindir} ${mandir}"
>> +
>> +RDEPENDS_wiper =3D "bash gawk stat"
>> +
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/hdparm/hdparm-${PV}.tar.gz "
>> +SRC_URI[md5sum] =3D "0bb94ddd1bedd5c02b1ca62f1caaf6de"
>> +SRC_URI[sha256sum] =3D
> "87ede0a7cb5b4de500748232e9d251b75acfccce078e1d42c8d125b9e5b4cc
> d3"
>> + +do_install () { +	install -d ${D}/${base_sbindir}
>> ${D}/${mandir}/man8 ${D}/${bindir} +	oe_runmake 'DESTDIR=3D${D}'
>> 'sbindir=3D${base_sbindir}' install +	mv ${D}${base_sbindir}/hdparm
>> ${D}${base_sbindir}/hdparm.${PN} +	cp ${S}/wiper/wiper.sh
>> ${D}/${bindir} +} + +pkg_postinst_${PN} () { +	update-alternatives
>> --install ${base_sbindir}/hdparm hdparm hdparm.${PN} 100 +} +
>> +pkg_prerm_${PN} () { +	update-alternatives --remove hdparm
>> hdparm.${PN} +} diff --git a/meta/recipes-extended/stat/stat_3.3.bb
>> b/meta/recipes-extended/stat/stat_3.3.bb new file mode 100644 index
>> 0000000..dc553ea --- /dev/null +++
>> b/meta/recipes-extended/stat/stat_3.3.bb @@ -0,0 +1,27 @@ +SECTION =3D
>> "console/utils" +DESCRIPTION =3D "Display all information about a file
>> that the stat() call provides and all information a filesystem that
>> statfs() provides." +LICENSE =3D "GPL"
> Which GPL version?
>=20
>> +LIC_FILES_CHKSUM =3D
>> "file://COPYRIGHT;md5=3D39886b077fd072e876e5c4c16310b631 \ +
>> file://GPL;md5=3D94d55d512a9ba36caa9b7df079bae19f" + +BBCLASSEXTEND =3D
>> "native" + +PR =3D "r1" + +SRC_URI =3D
>> "ftp://metalab.unc.edu/pub/Linux/utils/file/stat-3.3.tar.gz"
>> +SRC_URI[md5sum] =3D "37e247e8e400ad9205f1b0500b728fd3"
>> +SRC_URI[sha256sum] =3D
> "7071f0384a423a938dd542c1f08547a02824f6359acd3ef3f944b2c4c2d1ee0
> 9"
>> +
>> +do_install() {
>> +	install -d ${D}${bindir} ${D}${mandir}/man1
>> +	install -m 755 stat ${D}${bindir}
>> +	install -m 644 stat.1 ${D}${mandir}/man1
>> +}
>> +
>> +#do_install_virtclass-native() {
>> +#	install -d ${D}${bindir}
>> +#	install -m 755 stat ${D}${bindir}
>> +#}
>> +
>> +NATIVE_INSTALL_WORKS =3D "1"
>> +




