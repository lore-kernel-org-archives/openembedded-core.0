Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tv2hg-0003dZ-Kx
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 10:21:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Jan 2013 01:05:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,473,1355126400"; d="scan'208";a="243993472"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 15 Jan 2013 01:05:45 -0800
Message-ID: <50F51BE9.6080302@intel.com>
Date: Tue, 15 Jan 2013 11:05:45 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1358181569-30628-1-git-send-email-laurentiu.palcu@intel.com>
	<20130114164905.GF2992@jama>
In-Reply-To: <20130114164905.GF2992@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox.inc: have the busybox-syslog postinstall run on host
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
X-List-Received-Date: Tue, 15 Jan 2013 09:21:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/14/2013 06:49 PM, Martin Jansa wrote:
> On Mon, Jan 14, 2013 at 06:39:29PM +0200, Laurentiu Palcu wrote:
>> update-rc.d fails when executing the postinstall on host. That's because
>> 'syslog' is renamed to 'syslog.busybox' and a 'syslog' link to it is made
>> instead. However, on host, the link is not valid and update-rc.d will
>> complain that the file does not exist. On target, this does not happen.
>>
>> So, this patch will have update-rc.d create the necessary links to
>> syslog.busybox instead. Technically, the behavior is unchanged and
>> syslogd will be started as usual. The only change will be the links in
>> rcX.d directories:
>>
>> Instead of: S20syslog -> ../init.d/syslog
>> we will have: S20syslog.busybox -> ../init.d/syslog.busybox
>>
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> ---
>>  meta/recipes-core/busybox/busybox.inc |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
>> index 972e7d0..c70ba62 100644
>> --- a/meta/recipes-core/busybox/busybox.inc
>> +++ b/meta/recipes-core/busybox/busybox.inc
>> @@ -25,7 +25,7 @@ FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
>>  INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
>>  
>>  INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
>> -INITSCRIPT_NAME_${PN}-syslog = "syslog"
>> +INITSCRIPT_NAME_${PN}-syslog = "syslog.${BPN}"
> 
> What if syslog-ng is installed? won't it run both syslog implementations?
This is a valid concern. It would certainly start them both or, at
least, try. But, is it normal for one to have two different syslog
implementations installed? Is this a valid use case?

Thanks,
Laurentiu

> 
>>  INITSCRIPT_NAME_${PN}-mdev = "mdev"
>>  INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
>>  INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."
>> -- 
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


