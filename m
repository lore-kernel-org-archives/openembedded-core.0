Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SgSK0-0002DW-HF
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 05:08:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5I2vPgv015900
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2012 19:57:25 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 17 Jun 2012 19:57:25 -0700
Message-ID: <4FDE9912.60406@windriver.com>
Date: Mon, 18 Jun 2012 10:57:22 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1339751573.git.xiaofeng.yan@windriver.com>
	<cf3611bc2fea78d0aa3d042e000edb0e86534297.1339751573.git.xiaofeng.yan@windriver.com>
	<1339772393.7261.6.camel@ted>
In-Reply-To: <1339772393.7261.6.camel@ted>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q5I2vPgv015900
Subject: Re: [PATCH 2/3] lsbinitscripts: Remove original /etc/init.d/functions when building an lsb image
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
X-List-Received-Date: Mon, 18 Jun 2012 03:08:08 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B406=E6=9C=8815=E6=97=A5 22:59, Richard Purdie wrote:
> On Fri, 2012-06-15 at 17:30 +0800, xiaofeng.yan@windriver.com wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> The linking will fail when an original functions exist. So remove the
>> original functions when building an lsb image and make functions linki=
ng to
>> functions.lsbinitscripts successfully.
>>
>> [YOCTO #2133]
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>>   meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |    8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/r=
ecipes-extended/lsb/lsbinitscripts_9.03.bb
>> index dd92a92..73bea2f 100644
>> --- a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
>> +++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "SysV init scripts which only is used =
in an LSB image"
>>   SECTION =3D "base"
>>   LICENSE =3D "GPLv2"
>>   DEPENDS =3D "popt"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Debf4e8b49780ab187d51bd26a=
aa022c6"
>>
>> @@ -25,3 +25,9 @@ do_install(){
>>   	install -d ${D}/etc/init.d/
>>   	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/function=
s
>>   }
>> +
>> +pkg_postinst_${PN} () {
>> +	if [ -f "/etc/init.d/functions" ]; then
>> +		rm -f /etc/init.d/functions
>> +	fi
>> +}
> This looks highly suspicious to me. Shouldn't the other provider of thi=
s
> be put under control for update-alternatives too or something?
Thanks for your comments.
the other provider of this is from initscripts_1.0.bb, installing all of=20
init-scripts in the stage of installing without using=20
update-alternatives. So the functions is a file instead of linking mode.=20
An error appear when lsbinicscritps replace initscripts if not removing=20
file functions. So I remove the original functions for making the latter=20
linking successfully. What is the purpose is for avoiding to modify the=20
other non-lsb bb files. The changes of this will be only in lsb image.
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



