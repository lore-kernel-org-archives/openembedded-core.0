Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SNyRz-0005wH-DP
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 05:35:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Apr 2012 20:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="136378959"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2012 20:26:19 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 27 Apr 2012 20:26:19 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.226]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.243]) with mapi id
	14.01.0355.002; Sat, 28 Apr 2012 11:26:17 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: baselib_dir for udev in multilib cases
Thread-Index: Ac0k7qsDFkap3MNwQxmCuVrGYNuFSA==
Date: Sat, 28 Apr 2012 03:26:16 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FD9594A@SHSMSX102.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: baselib_dir for udev in multilib cases
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
X-List-Received-Date: Sat, 28 Apr 2012 03:35:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Koen Kooi wrote on 2012-04-27:
>=20
> Op 27 apr. 2012, om 12:47 heeft Richard Purdie het volgende geschreven:
>=20
>> On Fri, 2012-04-27 at 13:04 +0800, Lianhao Lu wrote:
>>> Use the base_libdir to set the udev rules directory.
>>>=20
>>> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
>>> ---
>>> meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb |    6 ++++--
>>> 1 files changed, 4 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb b/meta/r=
ecipes-multimedia/alsa/alsa-utils_1.0.25.bb
>>> index 597e8b6..c39cd11 100644
>>> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
>>> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
>>> @@ -21,7 +21,9 @@ SRC_URI[sha256sum] =3D "2e676a2f634bbfe279b260e10a96f=
617cb72ee63c5bbf6c5f96bb61570
>>> -EXTRA_OECONF =3D "--disable-xmlto"
>>> +EXTRA_OECONF =3D "--disable-xmlto \
>>> +		--with-udev-rules-dir=3D${base_libdir}/udev/rules.d \
>>> +		"
>>> EXTRA_OECONF_append_libc-uclibc =3D " --disable-nls"
>>>=20
>>> inherit autotools gettext
>>=20
>> The udev configuration files are probably one case where using /lib
>> makes a lot of sense since we should only have one set of these. I
>> therefore think this should be added as an exception to the sanity
>> test...
>=20
> And keep in mind it's more '/lib' than '${base_libdir}' since it isn't su=
pposed to adhere to multilib naming. So even on /lib64 machines the
> rules are in /lib.
>=20

I changed the subject because I think we need more discussion about how to =
handle udev in multilib cases.

I might put the description under the wrong context. These patches were ori=
ginally designed to fix the udev-rules not get packaged when the user have =
a baselib_dir other than '/lib', because the udev userspace daemon(udevd) e=
xpect the rules to be either in '${sysconfdir}/udev/rules.d' or '${baselib_=
dir}/udev/rules.d'. These not packaged issues were found during multilib te=
st because including the multilib.conf changes the baselib_dir.

If we plan to have all the udev rules from multilib packages installed into=
 the same place, there are 2 options:
1. install them into '${sysconfdir}/udev/rules.d'
2. patch the udev to use '/lib' instead of '${baselib_dir}/' for rules.

Besides this, some packages not only provide udev rules, but also programs =
to be executed by udevd. These programs normally installed under '${baselib=
_dir}/udev'. How to handle these programs? Should they follow the udev rule=
s, i.e. to be installed into the same place in multilib case?

Best Regards,
Lianhao



