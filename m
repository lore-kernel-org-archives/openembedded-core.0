Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SFzvd-0007VJ-1P
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 05:33:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Apr 2012 20:24:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127735109"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 05 Apr 2012 20:24:23 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 5 Apr 2012 20:24:22 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.125]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Fri, 6 Apr 2012 11:24:18 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] connman: Fixed multilib support.
Thread-Index: AQHNEyLe9klGfbT9d0+lqBk1GYaSDZaMml2AgACGrLA=
Date: Fri, 6 Apr 2012 03:24:17 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FD2EFD9@SHSMSX102.ccr.corp.intel.com>
References: <0e25605bf5ef290a098abc577c99607a99493df5.1333626413.git.lianhao.lu@intel.com>
	<f00fe78b88d2be6d6f02ecfb8a619b84d4ea35a0.1333626413.git.lianhao.lu@intel.com>
	<4F7E5F93.7020207@linux.intel.com>
In-Reply-To: <4F7E5F93.7020207@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] connman: Fixed multilib support.
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
X-List-Received-Date: Fri, 06 Apr 2012 03:33:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote on 2012-04-06:
> On 04/05/2012 04:49 AM, Lianhao Lu wrote:
>> 1. Added static depends to ofono.
>> 2. Corrected the package content of connman-test.
>>=20
>> This is part of the bug fixing [YOCTO #2216].
>>=20
>> Signed-off-by: Lianhao Lu<lianhao.lu@intel.com>
>> ---
>>   meta/recipes-connectivity/connman/connman.inc     |    3 ++-
>>   meta/recipes-connectivity/connman/connman_0.79.bb |    1 +
>>   2 files changed, 3 insertions(+), 1 deletions(-)
>> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipe=
s-connectivity/connman/connman.inc
>> index d9d663c..bfe6620 100644
>> --- a/meta/recipes-connectivity/connman/connman.inc
>> +++ b/meta/recipes-connectivity/connman/connman.inc
>> @@ -17,6 +17,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1=
ff87c09e5b7ccc2c4ca7e \
>>   DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
>>               ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4',
>>               '', d)} \ ${@base_contains('DISTRO_FEATURES',
>>               'wifi','wpa-supplicant', '', d)} \ +            ofono \ "
> Why is this needed here?

connman-plugin-ofono is RDEPENDS on ofono.=20
I put ofono here just like the bluez4 depends to make sure ofono package is=
 generated. Maybe I should use
do_package[depends] =3D "ofono:do_package" instead of putting it in the mis=
leading DEPENDS.

-Lianhao

>>   EXTRA_OECONF +=3D "\
>> @@ -90,7 +91,7 @@ PACKAGES =3D+ "${PN}-tools ${PN}-tests"
>>=20
>>   FILES_${PN}-tools =3D "${bindir}/wispr"
>> -FILES_${PN}-tests =3D "${bindir}/*-test ${libdir}/${PN}/test/*"
>> +FILES_${PN}-tests =3D "${bindir}/*-test ${libdir}/${BPN}/test/*"
>>   RDEPENDS_${PN}-tests =3D "python-dbus"
> I tweaked your patch to just take this multilib bits.
>=20
> Sau!
>=20
>=20
>>   FILES_${PN} =3D "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/li=
b*.so.* \
>> diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/re=
cipes-connectivity/connman/connman_0.79.bb
>> index 0c3a6fe..f87c4dd 100644
>> --- a/meta/recipes-connectivity/connman/connman_0.79.bb
>> +++ b/meta/recipes-connectivity/connman/connman_0.79.bb
>> @@ -8,3 +8,4 @@ SRC_URI  =3D "git://git.kernel.org/pub/scm/network/connm=
an/connman.git \
>>               file://disable_alg-test.patch \
>>               file://connman"
>>   S =3D "${WORKDIR}/git"
>> +PR =3D "r1"




