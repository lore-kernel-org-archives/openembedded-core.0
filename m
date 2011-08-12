Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QrkbS-0007j6-QD
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 07:48:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7C5hjod021200
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 22:43:45 -0700 (PDT)
Received: from [128.224.162.178] (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 11 Aug 2011 22:43:45 -0700
Message-ID: <4E44BD95.6040307@windriver.com>
Date: Fri, 12 Aug 2011 13:43:49 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1312878559.git.xiaofeng.yan@windriver.com>	<b58224cc88baa6cfea83da19e0315d1f4307df5b.1312878559.git.xiaofeng.yan@windriver.com>
	<1312979436.14274.365.camel@rex>
In-Reply-To: <1312979436.14274.365.camel@rex>
X-Originating-IP: [128.224.162.178]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p7C5hjod021200
Subject: Re: [PATCH 1/1] qt3: Solve the failure to compile qt3 on platform arm
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
X-List-Received-Date: Fri, 12 Aug 2011 05:48:20 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B408=E6=9C=8810=E6=97=A5 20:30, Richard Purdie wrote:
> On Tue, 2011-08-09 at 16:50 +0800, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> [YOCTO #1348]
>> The variable "TARGET_OS" has different value when building qt-x11-free=
-native and \
>> qt-x11-free.
>> The different cause failure to compile qt3.
>> $ bitbake qt-x11-free-native -e | grep ^TARGET_OS
>> TARGET_OS=3D"linux"
>> $ bitbake qt-x11-free -e | grep ^TARGET_OS
>> TARGET_OS=3D"linux-gnueabi"
>>
>> Use "TARGETOS =3D linux${LIBCEXTENSION}${ABIEXTENSION}" in place of TA=
RGET_OS \
>> for solving this bug.
> This doesn't look right.
>
> -native packages shouldn't have *any* target system dependencies, they
> should build once and be suitable for all targets.
>
> This sounds like we're encoding target specific information into native
> recipes which we can't do.
>
> It sounds like we need to look for linux-oe-g++ even in the qemuarm cas=
e
> so its the target recipe which needs fixing to always use "linux"
> instead of "linux-gnueabi" in the arm case.
>
> Cheers,
>
> Richard
>
I have understood what you mean and will modify my fault.
thanks very much.

Cheers,

Yan
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>>   recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb |    7 ++++---
>>   1 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb b/recipes-qt3=
/qt3/qt-x11-free-native_3.3.5.bb
>> index e64256f..fe04a4a 100644
>> --- a/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb
>> +++ b/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb
>> @@ -4,10 +4,11 @@ PRIORITY =3D "optional"
>>   LICENSE =3D "GPL | QPL"
>>   DEPENDS =3D "xmu-native"
>>   HOMEPAGE =3D "http://www.trolltech.com"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>>   PROVIDES +=3D "qt-x11-free-native"
>>   FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/qt-x11=
-free"
>> +TARGETOS =3D linux${LIBCEXTENSION}${ABIEXTENSION}
>>
>>   LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D629178675a7d49c9fa19d=
fe9f43ea256 \
>>                       file://LICENSE.QPL;md5=3Dfff372435cb41647bc0b3cb=
940ea5c51"
>> @@ -26,7 +27,7 @@ export QTDIR =3D "${S}"
>>   export SYSCONF_CXX =3D "${CCACHE} g++"
>>   export SYSCONF_CC  =3D "${CCACHE} gcc"
>>   export SYSCONF_LINK  =3D "${CCACHE} g++"
>> -THIS_QMAKESPEC =3D "${STAGING_DATADIR}/qmake/${TARGET_OS}-oe-g++"
>> +THIS_QMAKESPEC =3D "${STAGING_DATADIR}/qmake/${TARGETOS}-oe-g++"
>>   export QMAKESPEC =3D ""
>>   ARCH_i686 =3D "x86"
>>
>> @@ -57,7 +58,7 @@ do_install() {
>>
>>       install -d ${D}${datadir}/qt3/
>>       cp -PfR mkspecs ${D}${datadir}/qt3/
>> -    ln -sf linux-g++ ${D}${datadir}/qt3/mkspecs/${TARGET_OS}-oe-g++
>> +    ln -sf linux-g++ ${D}${datadir}/qt3/mkspecs/${TARGETOS}-oe-g++
>>       ln -s ${D}${datadir}/qt3/mkspecs/ ${D}${datadir}/qmake
>>       install -d ${D}${libdir}/
>>       oe_soinstall lib/libqt-mt.so.${PV} ${D}${libdir}/
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



