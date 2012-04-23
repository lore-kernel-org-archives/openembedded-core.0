Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SMLlB-00079l-8b
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 18:05:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 081AB315B294;
	Mon, 23 Apr 2012 17:55:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id TH33mrgA9GF7; Mon, 23 Apr 2012 17:55:23 +0200 (CEST)
Received: from [172.22.22.61] (drms-4d014628.pool.mediaWays.net [77.1.70.40])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id F00B6315A313;
	Mon, 23 Apr 2012 17:55:22 +0200 (CEST)
Message-ID: <4F957B6A.7050108@opendreambox.org>
Date: Mon, 23 Apr 2012 17:55:22 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1334667923-13908-1-git-send-email-obi@opendreambox.org>
	<1334667923-13908-2-git-send-email-obi@opendreambox.org>
	<4F9575B9.7030601@linux.intel.com>
In-Reply-To: <4F9575B9.7030601@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] {kernel, module}.bbclass: don't run depmod for module packages during do_rootfs
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
X-List-Received-Date: Mon, 23 Apr 2012 16:05:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 23.04.2012 17:31, Darren Hart wrote:
> 
> On 04/17/2012 06:05 AM, Andreas Oberritter wrote:
>> * depmod already gets executed by pkg_postinst_kernel-image.
> 
> What if you install a module package after the initial system
> installation? Don't you want the module install to run depmod?

If you look at the patch, you see that only the calls to cross-depmod
get removed (which get called during do_rootfs). The behaviour of
modules installed after the initial installation hasn't changed. What
has changed in addition is that modules.bbclass' pkg_postinst doesn't
return an error during do_rootfs, but instead behaves like
pkg_postinst_modules from kernel.bbclass.

Regards,
Andreas

> 
> --
> Darren
> 
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  meta/classes/kernel.bbclass |    4 +---
>>  meta/classes/module.bbclass |    7 +++----
>>  2 files changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 3519e7c..c21ab96 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -276,9 +276,7 @@ fi
>>  }
>>  
>>  pkg_postinst_modules () {
>> -if [ -n "$D" ]; then
>> -	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
>> -else
>> +if [ -z "$D" ]; then
>>  	depmod -a
>>  	update-modules || true
>>  fi
>> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
>> index 53c16b7..91628e4 100644
>> --- a/meta/classes/module.bbclass
>> +++ b/meta/classes/module.bbclass
>> @@ -37,15 +37,14 @@ module_do_install() {
>>  }
>>  
>>  pkg_postinst_append () {
>> -	if [ -n "$D" ]; then
>> -		exit 1
>> -	fi
>> +if [ -z "$D" ]; then
>>  	depmod -a
>>  	update-modules || true
>> +fi
>>  }
>>  
>>  pkg_postrm_append () {
>> -	update-modules || true
>> +update-modules || true
>>  }
>>  
>>  EXPORT_FUNCTIONS do_compile do_install
> 



