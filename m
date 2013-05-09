Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UaT1O-0006XT-R0
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 17:44:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r49FQbvw014530
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 May 2013 08:26:37 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 9 May 2013 08:26:37 -0700
Message-ID: <518BC02E.8010909@windriver.com>
Date: Thu, 9 May 2013 10:26:38 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
	<A023E370-E7BD-47E2-B779-335B4ADE7819@gmail.com>
In-Reply-To: <A023E370-E7BD-47E2-B779-335B4ADE7819@gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r49FQbvw014530
Subject: Re: [PATCH] eglibc: include libgcc when libpthread is enabled
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
X-List-Received-Date: Thu, 09 May 2013 15:45:02 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 5/9/13 9:32 AM, Khem Raj wrote:
>
> On May 9, 2013, at 5:55 AM, Bogdan Marinescu <bogdan.a.marinescu@intel.=
com> wrote:
>
>> libpthread needs libgcc to function properly. Without libgcc I get
>> the following error:
>>
>> root@qemux86:~# tclsh
>> % exit 0
>> libgcc_s.so.1 must be installed for pthread_cancel to work
>> Aborted
>> root@qemux86:~#
>>
>> This patch fixes the above issue and similar ones by adding a
>> runtime dependency of libgcc to eglibc when threads are enabled.
>>
>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> ---
>> meta/recipes-core/eglibc/eglibc.inc |    2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/e=
glibc/eglibc.inc
>> index 1e04197..24fb05b 100644
>> --- a/meta/recipes-core/eglibc/eglibc.inc
>> +++ b/meta/recipes-core/eglibc/eglibc.inc
>> @@ -35,7 +35,7 @@ siteconfig_do_siteconfig_gencache_prepend =3D " \
>> # nptl needs unwind support in gcc, which can't be built without glibc.
>> DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers vi=
rtual/${TARGET_PREFIX}libc-initial"
>> # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect =
this
>> -#RDEPENDS_${PN} +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
>> +RDEPENDS_${PN} +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
>
> ah too early. I think you should spin out libpthread into separate pack=
age and then RDEPEND_libpthread =3D "=85"
> and don't use nptl we do not have any other option now a days.

This would be my suggestion.  I'd also want to make sure there is a=20
libpthread-dev (which for some reason I think there already is) because t=
he=20
links in there are required for on-target thread debugging...

--Mark

>
>> PROVIDES =3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
>> PROVIDES +=3D "virtual/libintl virtual/libiconv"
>> inherit autotools
>> --
>> 1.7.10.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



