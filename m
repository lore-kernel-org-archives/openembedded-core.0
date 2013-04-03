Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UND4p-0004m6-Vl
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 04:05:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r331mEjE029474
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Apr 2013 18:48:14 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 2 Apr 2013 18:48:14 -0700
Message-ID: <515B8ACC.4060303@windriver.com>
Date: Wed, 3 Apr 2013 09:50:04 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1364279968.git.kai.kang@windriver.com>
	<245c80ed5b2af21acfc2ee3cb910f26292db3909.1364279968.git.kai.kang@windriver.com>
	<515B4774.6000200@linux.intel.com>
In-Reply-To: <515B4774.6000200@linux.intel.com>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r331mEjE029474
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] opkg: create run-scripts file conditionally
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
X-List-Received-Date: Wed, 03 Apr 2013 02:05:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013=E5=B9=B404=E6=9C=8803=E6=97=A5 05:02, Saul Wold wrote:
> On 03/25/2013 11:43 PM, Kang Kai wrote:
>> This bug occurs on rpm-based sdk image.
>>
>> update-alternatives-cworth is default installed into sato image. And f=
or
>> sato-sdk image, it installs every related dev packages.
>> update-alternatives-cworth is from opkg, so opkg-dev is installed and =
it
>> requires opkg, then opkg is installed into sato-sdk image.
>>
>> This causes the script file run-postinsts installed by rpm will be
>> overwrited by opkg on rpm-based sdk image.
>>
>> Judge the image package type and don't create run-scripts file when
>> package type is not ipk.
>>
>> [YOCTO #3223]
>>
>> Signed-off-by: Kang Kai <kai.kang@windriver.com>
>> ---
>> meta/recipes-devtools/opkg/opkg.inc | 6 ++++++
>> 1 files changed, 6 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/opkg/opkg.inc=20
>> b/meta/recipes-devtools/opkg/opkg.inc
>> index f9c1202..bc80cb0 100644
>> --- a/meta/recipes-devtools/opkg/opkg.inc
>> +++ b/meta/recipes-devtools/opkg/opkg.inc
>> @@ -59,10 +59,16 @@ do_install_append_class-native() {
>>
>> POSTLOG ?=3D "/var/log/postinstall.log"
>> REDIRECT_CMD =3D "${@base_contains('IMAGE_FEATURES', 'debug-tweaks',=20
>> '>${POSTLOG} 2>&1', '', d)}"
>> +PKGTYPE =3D "${@d.getVar('IMAGE_PKGTYPE', True)}"
>>
>> pkg_postinst_${PN} () {
>> #!/bin/sh
>> if [ "x$D" !=3D "x" ]; then
>> + # if installed to a rpm/deb based image, don't create run-postinsts=20
>> file
>> + if [ "x${PKGTYPE}" !=3D "xipk" ]; then
>> + exit 0
>> + fi
>> +
> I understand what you are trying to do here, I think Richard was=20
> questioning if this is the right implementation of the change. I think=20
> if you look at how RPM does it and then make the *run-postinsts script=20
> an update-alternatives so each package system does it consistently,=20
> this will also require a change to dpkg.
>
> Then there might have to be some setting of the PRIORITY for when each=20
> package system is installed.
Thanks. I'll re-implement it.

Regards,
Kai


>
> Sau!
>
>> install -d $D${sysconfdir}/rcS.d
>> # this happens at S98 where our good 'ole packages script used to run
>> echo "#!/bin/sh
>>
>



