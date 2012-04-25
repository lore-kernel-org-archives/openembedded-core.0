Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SMrSx-000822-AX
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 03:56:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 5E3C9315B730;
	Wed, 25 Apr 2012 03:46:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id WW+AwXZkIPnz; Wed, 25 Apr 2012 03:46:42 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c5560.pool.mediaWays.net [89.12.85.96])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id D0ACE315B72F;
	Wed, 25 Apr 2012 03:46:41 +0200 (CEST)
Message-ID: <4F975780.8080207@opendreambox.org>
Date: Wed, 25 Apr 2012 03:46:40 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1335217712-10154-1-git-send-email-obi@opendreambox.org>
	<4F974557.1000006@linux.intel.com>
	<4F974863.8000808@opendreambox.org>
	<4F974FE9.5030402@linux.intel.com>
In-Reply-To: <4F974FE9.5030402@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] {kernel, module}.bbclass: don't run depmod for module packages during do_rootfs
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
X-List-Received-Date: Wed, 25 Apr 2012 01:56:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 25.04.2012 03:14, Darren Hart wrote:
> 
> 
> On 04/24/2012 05:42 PM, Andreas Oberritter wrote:
>> On 25.04.2012 02:29, Darren Hart wrote:
>>>
>>>
>>> On 04/23/2012 02:48 PM, Andreas Oberritter wrote:
>>>> * depmod already gets executed by pkg_postinst_kernel-image.
>>>>
>>>> * If you build a module using module.bbclass,
>>>>   pkg_postinst returns 1 in do_rootfs, causing
>>>>   pkg_postinst to run again on first boot. To
>>>>   improve this situation, I copied pkg_postinst
>>>>   from kernel.bbclass to module.bbclass. This was
>>>>   rejected by Koen, because he doesn't like the
>>>>   code from kernel.bblcass, which uses
>>>>   ${STAGING_DIR_KERNEL}. Richard then suggested
>>>>   that calling depmod during do_rootfs wasn't
>>>>   necessary at all, because it already gets done by
>>>>   kernel-image.
>>>>
>>>
>>> Thanks for adding that in. I'm fine not addressing the reliance on the
>>> existence of $D for now (no worse than it was).
>>
>> Can you explain what could be improved?'
> 
> I did in the previous thread:
> 
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-April/021419.html

Sorry, I must have missed the inline comments when I replied to that mail.

From the manpage of test(1):

       -d FILE
              FILE exists and is a directory

       -z STRING
              the length of STRING is zero

I'm not sure what using -d should accomplish. (Virtually?) all postinst
scripts in OE test for $D's emptiness to decide whether they are called
offline (during do_rootfs) or online (on the target), so if a package
manager sets $D, it should rather stop doing that, instead of relying on
$D not being a directory by chance.

Regards,
Andreas


