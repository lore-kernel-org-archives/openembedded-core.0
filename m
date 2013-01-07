Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1TsGRy-0002Xl-63
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 18:25:26 +0100
Received: by mail-la0-f43.google.com with SMTP id eg20so16568181lab.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 09:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:reply-to:organization:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=HLlfNDguHGKnhmht4enRYb5Msml2AC9pyt/9fYbRA0U=;
	b=YIpT7K7wuOqJREUnuoHUbum5vtbHDeT6yjA4WbJjzeyERbk/HTo+WVvDMcjNHNjYSj
	CvN1z/Zd/27rS57FBSIvyCKO2T+PEfaFKslUYp+4G4RucEuyOfH97ZifSgI1YIBpbYMe
	G4Sw9i2WeffCMIPdH/iADHVnJY12UDncVy1JdZjWCtBB3xRwsgvMiCUaKc4fhYz0Vfze
	LTFBulQy9oyorjzzXb0itQpByaAjfdqRRrF9sVgWAuaWfFoXifPHoyGGUopC8jEXuc4h
	f/RK1Myzc90azGdNoaUEsUziG7Y/jPAOco6k4xwCHYpOvxpuU/tYcJ51X4itd+N1hjqH
	vRfw==
X-Received: by 10.152.45.174 with SMTP id o14mr48309907lam.12.1357578616693;
	Mon, 07 Jan 2013 09:10:16 -0800 (PST)
Received: from [192.168.0.5]
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPS id if8sm23477469lab.1.2013.01.07.09.10.12
	(version=SSLv3 cipher=OTHER); Mon, 07 Jan 2013 09:10:15 -0800 (PST)
Message-ID: <50EB0172.7010806@gmail.com>
Date: Mon, 07 Jan 2013 18:10:10 +0100
From: Marco <koansoftware@gmail.com>
Organization: MC
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1357565963-21367-1-git-send-email-m.cavallini@koansoftware.com>
	<50EAF39C.20202@linux.intel.com>
In-Reply-To: <50EAF39C.20202@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe][meta-oe][PATCH] kernel.bbclass: kernel_do_install fails with 2.6 kernel recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: koansoftware@gmail.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 17:25:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 07/01/2013 17:11, Darren Hart ha scritto:
> Hi Marco,
>
> On 01/07/2013 05:39 AM, Marco Cavallini wrote:
>>   * old 2.6.x kernels don't have $kerneldir/tools directory
>>   * so we got this error:
>>   * sed: can't read ...SNIP...linux/2.6.30-r0/image/usr/src/kernel/tools/perf/Makefile: No such file or directory
>>   * ERROR: Function failed: do_install
>>
>> Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
>> ---
>>   meta/classes/kernel.bbclass | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index aee8a77..06b23e0 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -204,8 +204,10 @@ kernel_do_install() {
>>   		rm -f $kerneldir/$entry
>>   	done
>>
>> -	# Fix SLANG_INC for slang.h
>> -	sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
>
> Please include a comment here describing why this was needed. Something
> like:
>
> 	# Linux 2.6.x kernels don't have a tools directory
>
> (Replace .x with the appropriate version of course)
>
> Otherwise, looks good to me. Thanks!
>
>> +	if [ -f $kerneldir/tools/perf/Makefile ]; then
>> +		# Fix SLANG_INC for slang.h
>> +		sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
>> +	fi
>>   }
>>
>>   sysroot_stage_all_append() {
>>
>


Hi Darren,
the comment describing why this was needed was in the patch header, is 
in these four lines:

  * old 2.6.x kernels don't have $kerneldir/tools directory
  * so we got this error:
  * sed: can't read 
...SNIP...linux/2.6.30-r0/image/usr/src/kernel/tools/perf/Makefile: No 
such file or directory
  * ERROR: Function failed: do_install

I haven't specified the 2.6 version because I thought that all 2.6 
version don't have a 'tools' directory.
BTW I patched it because with 2.6.28 and 2.6.30 it failed.


Cordiali Saluti / Kindest Regards / Mit freundlichen Grüßen
-- 
Marco Cavallini | KOAN sas | Bergamo - Italia
  embedded and real-time software engineering
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
       http://www.KoanSoftware.com


