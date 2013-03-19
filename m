Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UHuRU-0004KF-Hg
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 12:11:00 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Mar 2013 03:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,870,1355126400"; d="scan'208";a="308708412"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga002.fm.intel.com with ESMTP; 19 Mar 2013 03:54:05 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Tue, 19 Mar 2013 10:52:07 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.185]) with mapi id
	14.01.0355.002; Tue, 19 Mar 2013 10:52:07 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/2] connman-conf: Move the setup script into
	/usr/lib/connman
Thread-Index: AQHOI+KPJpixoSJamUudJuNmgI2udJirg9aAgAFTQmA=
Date: Tue, 19 Mar 2013 10:52:06 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB162180A9@IRSMSX102.ger.corp.intel.com>
References: <1363613908-20116-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1363613908-20116-2-git-send-email-jukka.rissanen@linux.intel.com>
	<1363615788.16482.28.camel@ted> <51472623.3080805@linux.intel.com>
In-Reply-To: <51472623.3080805@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] connman-conf: Move the setup script into /usr/lib/connman
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 11:11:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Jukka,

Please check connman recipe.=20
Inside it, check connman/connman

for wired-setup support..

Please add a patch for that also.

Regards,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Jukka Rissanen
Sent: Monday, March 18, 2013 4:35 PM
To: Richard Purdie
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] connman-conf: Move the setup script into=
 /usr/lib/connman

Hi Richard,

On 18.03.2013 16:09, Richard Purdie wrote:
> On Mon, 2013-03-18 at 15:38 +0200, Jukka Rissanen wrote:
>> The /etc/connman is not suitable for the setup script.
>> There are other connman related scripts in /usr/lib/connman so moving=20
>> the wired setup script there.
>>
>> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
>> ---
>>   meta/recipes-connectivity/connman/connman-conf.bb | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb=20
>> b/meta/recipes-connectivity/connman/connman-conf.bb
>> index 7b99953..6ecfbfb 100644
>> --- a/meta/recipes-connectivity/connman/connman-conf.bb
>> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
>> @@ -6,16 +6,18 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/co=
mmon-licenses/GPL-2.0;md5=3D80
>>   SRC_URI_append_qemuall =3D "file://wired.config \
>>                             file://wired-setup \
>>                            "
>> -PR =3D "r1"
>> +PR =3D "r2"
>>
>>   PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>
>> +FILES_${PN} =3D "${localstatedir}/* ${libdir}/*"
>> +
>>   do_install() {
>>       #Configure Wired network interface in case of qemu* machines
>>       if test -e ${WORKDIR}/wired.config && test -e ${WORKDIR}/wired-set=
up; then
>>           install -d ${D}${localstatedir}/lib/connman
>>           install -m 0644 ${WORKDIR}/wired.config ${D}${localstatedir}/l=
ib/connman
>> -        install -d ${D}${sysconfdir}/connman
>> -        install -m 0755 ${WORKDIR}/wired-setup ${D}${sysconfdir}/connma=
n
>> +        install -d ${D}${libdir}/connman
>> +        install -m 0755 ${WORKDIR}/wired-setup ${D}${libdir}/connman
>>       fi
>>   }
>
> You've moved the files, fine, but what uses them and do we need to=20
> update the caller?

I sent a separate patch "[PATCH] connman-conf: Initial systemd support"=20
for systemd support. I did not found any file that would have init.d suppor=
t (I might have missed that one :)

Really? So wired-setup was just placed there, without anybody using it?? :-=
P :-)


Cheers,
Jukka


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


