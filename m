Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECC406098F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 03:18:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5H3IQf9006837
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Jun 2013 20:18:26 -0700 (PDT)
Received: from [128.224.162.189] (128.224.162.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 16 Jun 2013 20:18:24 -0700
Message-ID: <51BE7FFF.90204@windriver.com>
Date: Mon, 17 Jun 2013 11:18:23 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1371196454-10206-1-git-send-email-jackie.huang@windriver.com>
	<51BB50AB.40304@linux.intel.com>
In-Reply-To: <51BB50AB.40304@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] consolekit: move libck-connector to base_libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jun 2013 03:18:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 6/15/2013 1:19 AM, Saul Wold wrote:
> On 06/14/2013 12:54 AM, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> move libck-connector.so.* to base_libdir to kill two warnings:
>>
>>      WARNING: QA Issue: consolekit: /lib64/security/pam_ck_connector.so,
>>      installed in the base_prefix, requires a shared library under
>>      exec_prefix (/usr): libck-connector.so.0 => /usr/lib64/
>>      libck-connector.so.0 (0x00000000dead300
>>
>>      WARNING: QA Issue: lib32-consolekit: Found a reference to /usr/ in
>>       /buildarea1/jhuang0/t_multilib/p_x64_0217/bitbake_build/tmp/work/
>>      x86-wrsmllib32-linux/lib32-consolekit-0.4.5-r10/packages-split/i
>>      lib32-consolekit/lib/security/pam_ck_connector.la
>>      WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir
>>      should not reference anything in exec_prefix
>>
>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   .../recipes-support/consolekit/consolekit_0.4.5.bb |   11 ++++++++++-
>>   1 files changed, 10 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
>> b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
>> index 7d66b39..3d976d4 100644
>> --- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
>> +++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
>> @@ -2,7 +2,7 @@ DESCRIPTION = "ConsoleKit is a framework for defining
>> and tracking users, login
>>   HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
>>
>> BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
>>
>>
>> -PR = "r10"
>> +PR = "r11"
>>
>>   LICENSE = "GPLv2+"
>>   LIC_FILES_CHKSUM =
>> "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>> @@ -41,4 +41,13 @@ RDEPENDS_pam-plugin-ck-connector += "${PN}"
>>   do_install_append() {
>>       # Remove /var/run from package as console-kit-daemon will
>> populate it on startup
>>       rm -fr "${D}${localstatedir}/run"
>> +    # Moving libck-connector to base_libdir
>> +    if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
>> +            mkdir -p ${D}/${base_libdir}/
>> +            mv -f ${D}${libdir}/libck-connector.so.0*
>> ${D}${base_libdir}/
>> +            mv -f ${D}${base_libdir}/security/pam_ck_connector.la
>> ${D}${libdir}/
>> +            rel_lib_prefix=`echo ${libdir} | sed
>> 's,\(^/\|\)[^/][^/]*,..,g'`
>> +            ln -sf
>> ${rel_lib_prefix}${base_libdir}/libck-connector.so.0.0.0
>> ${D}${libdir}/libck-connector.so
>> +    fi
>> +
>
> Something did not work out right here.

It was a bbappend fix in our layer and it worked, I should have tested 
it in poky, sorry about that. I will check it out.

Thanks,
Jackie

>
>> | make[1]: Leaving directory
>> `/srv/ssd/sgw/builds/world/tmp/work/x86_64-poky-linux/consolekit/0.4.5-r11/build'
>>
>> | mv: cannot stat
>> `/srv/ssd/sgw/builds/world/tmp/work/x86_64-poky-linux/consolekit/0.4.5-r11/image/lib/security/pam_ck_connector.la':
>> No such file or directory
>
>
> Sau!
>
>>   }
>> --
>> 1.7.4.1
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

