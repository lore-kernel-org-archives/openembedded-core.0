Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TA7r2-0008JZ-QO
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 01:20:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q87N8No8012709
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Sep 2012 16:08:23 -0700 (PDT)
Received: from msp-dhcp24.wrs.com (172.25.34.24) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 7 Sep 2012 16:08:23 -0700
Message-ID: <504A7E66.1040208@windriver.com>
Date: Fri, 7 Sep 2012 18:08:22 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1347054694-21086-1-git-send-email-mark.hatle@windriver.com>
	<1347058278.9270.4.camel@ted>
In-Reply-To: <1347058278.9270.4.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3] base-files: provide a mechanism to skip creation of the hostname file
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
X-List-Received-Date: Fri, 07 Sep 2012 23:20:53 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/12 5:51 PM, Richard Purdie wrote:
> On Fri, 2012-09-07 at 16:51 -0500, Mark Hatle wrote:
>> From: Mark Asselstine <mark.asselstine@windriver.com>
>>
>> The existence of a /etc/hostname file causes any hostname provided on
>> the kernel command line or via dhcp to be overwritten by the
>> initscripts 'init.d/hostname.sh'. This change allows you to set a
>> value of "" for 'hostname' which will skip the creation of the
>> /etc/hostname file by the base-files package.
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta/recipes-core/base-files/base-files_3.0.14.bb |   12 +++++++-----
>>   1 files changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> index 6bab040..cda13f4 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> @@ -107,10 +107,12 @@ do_install () {
>>   }
>>
>>   do_install_basefilesissue () {
>> -	if [ -n "${MACHINE}" -a "${hostname}" = "openembedded" ]; then
>> -		echo ${MACHINE} > ${D}${sysconfdir}/hostname
>> -	else
>> -		echo ${hostname} > ${D}${sysconfdir}/hostname
>> +	if [ "${hostname}" != "" ]; then
>> +		if [ -n "${MACHINE}" -a "${hostname}" = "openembedded" ]; then
>> +			echo ${MACHINE} > ${D}${sysconfdir}/hostname
>> +		else
>> +			echo ${hostname} > ${D}${sysconfdir}/hostname
>> +		fi
>>   	fi
>
>
> Is this missing a hostname ??= "openembedded" perhaps?

There is already a hostname = "openembedded" in the package.  Nothing in that 
part was changed by this patch.  The normal override process is to define 
hostname_override = "newhostname".

I verified this is working properly.

--Mark

> Cheers,
>
> Richard
>
>>   	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
>> @@ -144,5 +146,5 @@ FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
>>
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>
>> -CONFFILES_${PN} = "${sysconfdir}/fstab ${sysconfdir}/hostname"
>> +CONFFILES_${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname'][(d.getVar('hostname', True) != '')]}"
>>
>
>



