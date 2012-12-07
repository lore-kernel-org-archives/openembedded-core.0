Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Tgruv-0004eS-El
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 08:00:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB76jjPR000296
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Dec 2012 22:45:45 -0800 (PST)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Thu, 6 Dec 2012 22:45:44 -0800
Message-ID: <50C190CC.3030502@windriver.com>
Date: Fri, 7 Dec 2012 14:46:36 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1354781375.git.kai.kang@windriver.com>
	<4b453b852e6dbd3c91d1ffd469cdfc5480c1ec79.1354781375.git.kai.kang@windriver.com>
	<50C13C5E.3010300@linux.intel.com>
In-Reply-To: <50C13C5E.3010300@linux.intel.com>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	qB76jjPR000296
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libuser: enable python support
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
X-List-Received-Date: Fri, 07 Dec 2012 07:00:14 -0000
X-List-Received-Date: Fri, 07 Dec 2012 07:00:14 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B412=E6=9C=8807=E6=97=A5 08:46, Saul Wold wrote:
> On 12/06/2012 12:16 AM, Kang Kai wrote:
>> Compile libuser with python support.
>>
>> Signed-off-by: Kang Kai <kai.kang@windriver.com>
>> ---
>> meta/recipes-extended/libuser/libuser_0.57.1.bb | 12 +++++++++---
>> 1 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-extended/libuser/libuser_0.57.1.bb=20
>> b/meta/recipes-extended/libuser/libuser_0.57.1.bb
>> index 99b661b..3a29695 100644
>> --- a/meta/recipes-extended/libuser/libuser_0.57.1.bb
>> +++ b/meta/recipes-extended/libuser/libuser_0.57.1.bb
>> @@ -15,10 +15,16 @@ SRC_URI =3D=20
>> "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz"
>>
>> SRC_URI[md5sum] =3D "be82c6941264d0b4bd04f95fb342ec7d"
>> SRC_URI[sha256sum] =3D=20
>> "a61289867581fa715354a3fafe09c3e481173ce0a2dcb33b04588b6ac13cead5"
>> -PR =3D "r2"
>> +PR =3D "r3"
>>
>> DEPENDS =3D "popt libpam glib-2.0 xz-native docbook-utils-native=20
>> linuxdoc-tools-native"
>>
>> -EXTRA_OECONF +=3D "--without-python"
>> +inherit autotools gettext pythonnative python-dir
>> +
>> +EXTRA_OEMAKE =3D "PYTHON_CPPFLAGS=3D-I${STAGING_INCDIR}/${PYTHON_DIR}=
"
>> +
> This change seems to have a problem with the non-gplv3, possibly some=20
> library or newer api is needed by the python code.
>
> Please review, you might need a wrapper with INCOMPATIBLE_LICENSE=20
> check for enabling or disabling the python.

Sorry for missing test on non-gplv3, I will update and send V2 after=20
test on non-gplv3 image.

Regards,
Kai

>
> Thanks
> Sau!
>
>> +PACKAGES +=3D "${PN}-python "
>> +
>> +FILES_${PN}-dbg +=3D "${PYTHON_SITEPACKAGES_DIR}/.debug"
>> +FILES_${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}"
>>
>> -inherit autotools gettext
>>
>



