Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QyaR0-0002fP-4a
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 04:21:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7V2GpIC009990
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 19:16:51 -0700 (PDT)
Received: from [128.224.162.178] (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 30 Aug 2011 19:16:51 -0700
Message-ID: <4E5D98BE.7040401@windriver.com>
Date: Wed, 31 Aug 2011 10:13:18 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1314604566.git.xiaofeng.yan@windriver.com>	<87a9dca42042f94b9de19efa514b2938cc11e486.1314604566.git.xiaofeng.yan@windriver.com>
	<1314622451.5939.285.camel@rex>
In-Reply-To: <1314622451.5939.285.camel@rex>
X-Originating-IP: [128.224.162.178]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p7V2GpIC009990
Subject: Re: [PATCH 1/1] dropbear: Change the path to find configuration file and add a configuration file for dropbear
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
X-List-Received-Date: Wed, 31 Aug 2011 02:21:46 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B408=E6=9C=8829=E6=97=A5 20:54, Richard Purdie wrote:
> On Mon, 2011-08-29 at 18:48 +0800, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> dropbear will check "/etc/pam.d/sshd" which comes from package "openss=
h" \
>> When enabling pam supporting. But if we only install dropbear \
>> package without package "openssh", then "dropbear" will not \
>> find a configuration file. The changes are as follow for fixing this b=
ug:
>>
>> - Change the path to find configuration file (/etc/pam.d/sshd -->  /et=
c/pam.d/dropbear)
>> - Add a configuration file "/etc/pam.d/dropbear"
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>>   meta/recipes-core/dropbear/dropbear.inc            |    6 +++++-
>>   meta/recipes-core/dropbear/dropbear/dropbear       |    4 ++++
>>   .../dropbear/dropbear-configuration-file.patch     |   18 ++++++++++=
++++++++
>>   3 files changed, 27 insertions(+), 1 deletions(-)
>>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear
>>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-conf=
iguration-file.patch
>>
>> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-co=
re/dropbear/dropbear.inc
>> index 5af9ebd..577b288 100644
>> --- a/meta/recipes-core/dropbear/dropbear.inc
>> +++ b/meta/recipes-core/dropbear/dropbear.inc
>> @@ -19,7 +19,9 @@ SRC_URI =3D "http://matt.ucc.asn.au/dropbear/release=
s/dropbear-${PV}.tar.gz \
>>   	         file://init \
>>                    ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_S=
RC_URI}', '', d)} "
>>
>> -PAM_SRC_URI =3D "file://dropbear-enable-pam.patch"
>> +PAM_SRC_URI =3D "file://dropbear-enable-pam.patch \
>> +               file://dropbear-configuration-file.patch \
>> +               file://dropbear"
>>
>>   inherit autotools update-rc.d
>>
>> @@ -51,6 +53,7 @@ do_install() {
>>   		   ${D}${sysconfdir}/init.d \
>>   		   ${D}${sysconfdir}/default \
>>   		   ${D}${sysconfdir}/dropbear \
>> +		   ${D}${sysconfdir}/pam.d \
>>                      ${D}${bindir} \
>>   		   ${D}${sbindir} \
>>   		   ${D}${localstatedir}
>> @@ -68,6 +71,7 @@ do_install() {
>>   				  -e 's,/usr/bin,${bindir},g' \
>>   				  -e 's,/usr,${prefix},g'>  ${D}${sysconfdir}/init.d/dropbear
>>   	chmod 755 ${D}${sysconfdir}/init.d/dropbear
>> +	install -m 0644 ${WORKDIR}/dropbear  ${D}${sysconfdir}/pam.d/
> I suspect this won't build in the DISTRO_FEATURES not containing pam
> case due to the above file not existing. Please put a check in there to
> see if it exists.
>
Sorry for my fault. you are a really careful man. I will modify my fault.

Thanks
Yan
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



