Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UKJfQ-0007X4-8n
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 03:31:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2Q2EDMt008257
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Mar 2013 19:14:13 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 25 Mar 2013 19:14:12 -0700
Message-ID: <515104E0.5010703@windriver.com>
Date: Tue, 26 Mar 2013 10:16:00 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1364196012.git.kai.kang@windriver.com>
	<47ae8648840c30e4a9f5dab2b9cb09db905747be.1364196012.git.kai.kang@windriver.com>
	<1364221942.3097.52.camel@ted>
In-Reply-To: <1364221942.3097.52.camel@ted>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r2Q2EDMt008257
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
X-List-Received-Date: Tue, 26 Mar 2013 02:31:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013=E5=B9=B403=E6=9C=8825=E6=97=A5 22:32, Richard Purdie wrote:
> On Mon, 2013-03-25 at 15:22 +0800, Kang Kai wrote:
>> When build sato sdk image, opkg will be installed to image even the
>> image package type is set to RPM. This causes the script file
>> run-postinsts installed by rpm will be overwrited by opkg.
>>
>> Judge the image package type and don't create run-scripts file when
>> package type is not ipk.
>>
>> [YOCTO #3223]
>>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> ---
>>   meta/recipes-devtools/opkg/opkg.inc |    6 ++++++
>>   1 files changed, 6 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtoo=
ls/opkg/opkg.inc
>> index f9c1202..bc80cb0 100644
>> --- a/meta/recipes-devtools/opkg/opkg.inc
>> +++ b/meta/recipes-devtools/opkg/opkg.inc
>> @@ -59,10 +59,16 @@ do_install_append_class-native() {
>>
>>   POSTLOG ?=3D "/var/log/postinstall.log"
>>   REDIRECT_CMD =3D "${@base_contains('IMAGE_FEATURES', 'debug-tweaks',=
 '>${POSTLOG} 2>&1', '', d)}"
>> +PKGTYPE =3D "${@d.getVar('IMAGE_PKGTYPE', True)}"
>>
>>   pkg_postinst_${PN} () {
>>   #!/bin/sh
>>   if [ "x$D" !=3D "x" ]; then
>> +	# if installed to a rpm/deb based image, don't create run-postinsts =
file
>> +	if [ "x${PKGTYPE}" !=3D "xipk" ]; then
>> +		exit 0
>> +	fi
>> +
>>   	install -d $D${sysconfdir}/rcS.d
>>   	# this happens at S98 where our good 'ole packages script used to r=
un
>>   	echo "#!/bin/sh
> Why are you trying to install opkg into an non-opkg rootfs in the first
> place? This looks like it will create subtle package differences
> depending on configuration and I'm wary of this...

This just happens on sdk image.

update-alternatives-cworth is default installed into sato image. And for=20
sato-sdk image, it installs every related -dev package. =20
update-alternatives-cworth is from opkg,
so opkg-dev is installed then it requires opkg, then opkg is installed=20
into sato-sdk image.

This patch is try to fix this issue. I'll send V2 to update commit commen=
ts.

Regards,
Kai

>
> Cheers,
>
> Richard
>
>
>
>



