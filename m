Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1StUax-0005ab-Ha
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 04:11:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6O1xv7m023638
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Jul 2012 18:59:57 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 23 Jul 2012 18:59:57 -0700
Message-ID: <500E019C.3030607@windriver.com>
Date: Tue, 24 Jul 2012 09:59:56 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <cover.1342939738.git.jackie.huang@windriver.com>
	<9c2d0c1746a945290b6c64551fc6ca2e5e043028.1342939738.git.jackie.huang@windriver.com>
	<1343038142.21788.88.camel@ted>
In-Reply-To: <1343038142.21788.88.camel@ted>
Subject: Re: [PATCH 1/1] useradd.bbclass: use locking of bb.utils to avoid lock race issue of useradd/groupadd
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
X-List-Received-Date: Tue, 24 Jul 2012 02:11:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 7/23/2012 6:09 PM, Richard Purdie wrote:
> On Sun, 2012-07-22 at 14:53 +0800, jackie.huang@windriver.com wrote:
>> From: Jackie Huang<jackie.huang@windriver.com>
>>
>> A race condition can occur when adding users and groups to the
>> passwd and group files, in [YOCTO #1794], 10 times retry added
>> but it is not fixed completely.
>>
>> This fix re-writes the useradd_preinst and useradd_sysroot with
>> python and use locking of bb.utils to lock the passwd and group
>> files before executing useradd/groupadd commands to avoid the
>> lock race themselves.
>>
>> [YOCTO #2779]
>>
>> Signed-off-by: Jackie Huang<jackie.huang@windriver.com>
>> ---
>>   meta/classes/useradd.bbclass |  284 ++++++++++++++++++------------------------
>>   1 files changed, 124 insertions(+), 160 deletions(-)
>>
>> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
>> index bb8f42b..ed5ed69 100644
>> --- a/meta/classes/useradd.bbclass
>> +++ b/meta/classes/useradd.bbclass
>> @@ -14,126 +14,90 @@ USERADDDEPENDS_virtclass-nativesdk = ""
>>   # c) As the preinst script in the target package at do_rootfs time
>>   # d) As the preinst script in the target package on device as a package upgrade
>>   #
>> -useradd_preinst () {
>> -OPT=""
>> -SYSROOT=""
>> -
>> -if test "x$D" != "x"; then
>
> [...]
>
>> -	done
>> -fi
>> +def useradd_preinst(d):
>> +	import re
>> +
>
> [...]
>
>
>> -    # Add the user/group preinstall scripts and RDEPENDS requirements
>> -    # to packages specified by USERADD_PACKAGES
>> -    if not bb.data.inherits_class('nativesdk', d):
>> -        useradd_packages = d.getVar('USERADD_PACKAGES', True) or ""
>> -        for pkg in useradd_packages.split():
>> -            update_useradd_package(pkg)
>> +	def update_useradd_package(pkg):
>> +		bb.debug(1, 'adding user/group calls to preinst for %s' % pkg)
>> +
>> +		"""
>> +		useradd preinst is appended here because pkg_preinst may be
>> +		required to execute on the target. Not doing so may cause
>> +		useradd preinst to be invoked twice, causing unwanted warnings.
>> +		"""
>> +		preinst = d.getVar('pkg_preinst_%s' % pkg, True) or d.getVar('pkg_preinst', True)
>> +		if not preinst:
>> +			preinst = '#!/bin/sh\n'
>> +		preinst += d.getVar('useradd_preinst', True)
>
>
> This looks like we're adding the contents of the useradd_preinst
> function (changed from shell to python) to a script headed with
> "#!/bin/sh"? Python script with a /bin/sh header isn't a good idea.

Hi Richard,

This patch you replied is the first one I sent with whitespace issues, I 
didn't change the function update_useradd_package.

>
> We can't really depend on python being on the target device to add users
> in the postinstall script either.
>
> So in summary, this patch needs a lot more thought and hasn't been well
> tested.

You're right, I didn't think about that it will be script running on the 
target device and I just tested for tow different contexts:
1) Before do_install
2) At do_populate_sysroot_setscene when installing from sstate packages

>
> python functions should also be 4 space indented.
>

I will change with 4 space indent.

Thanks,
Jackie


> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745


