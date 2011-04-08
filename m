Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Q8F7u-0004dP-Fd
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 19:05:43 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 2335716606BC; Fri,  8 Apr 2011 11:03:33 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 31E001660505;
	Fri,  8 Apr 2011 11:03:32 -0600 (MDT)
Message-ID: <4D9F3FE4.60400@mlbassoc.com>
Date: Fri, 08 Apr 2011 11:03:32 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4D9F0B82.9080803@mlbassoc.com>	<8B7010C5-9902-4372-BF78-252D85C4BF46@dominion.thruhere.net>	<1302270609.22904.128.camel@rex>	<4D9F1540.6020902@mlbassoc.com>	<4D9F169D.9020502@mlbassoc.com>,
	<4D9F1909.1060403@mlbassoc.com>
	<3598D5EC-C050-461B-B540-5B20CB79B936@windriver.com>
In-Reply-To: <3598D5EC-C050-461B-B540-5B20CB79B936@windriver.com>
Cc: Poky Project <poky@yoctoproject.org>
Subject: Re: [poky] Early image startup
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
X-List-Received-Date: Fri, 08 Apr 2011 17:05:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2011 10:40 AM, Hatle, Mark wrote:
> As for the rpm ordering this was preserved from an earlier version.  If there is a more appropriate place to run the late configuration scripts, let's move it.  I think that it's likely a good place to move it to soon after the filesystem has been mounted RW.  Do any of the scripts normally require networking or other system resources?

Hard to say what's perfect, but I certainly don't believe that they need
to be put off to the very last.   In any case, I think the best thing is
to make it easily adjustable, per my patch.

Can we please keep this discussion on the Poky list where it started?
It seems that OE (and maybe OE-core) handle this differently - I've not
looked in depth - and I'm mostly interested in getting my Poky builds
healthy.

> On Apr 8, 2011, at 7:18 AM, "Gary Thomas"<gary@mlbassoc.com>  wrote:
>
>> On 04/08/2011 08:07 AM, Gary Thomas wrote:
>>> On 04/08/2011 08:01 AM, Gary Thomas wrote:
>>>> On 04/08/2011 07:50 AM, Richard Purdie wrote:
>>>>> On Fri, 2011-04-08 at 15:30 +0200, Koen Kooi wrote:
>>>>>> Op 8 apr 2011, om 15:20 heeft Gary Thomas het volgende geschreven:
>>>>>>
>>>>>>> I have a Poky image which uses a number of kernel modules. For
>>>>>>> whatever reason, the raw image has not had the modules configured
>>>>>>> (no /lib/modules/.../modules.dep) This file is created by 'update-modules'
>>>>>>> but that is run too late in the boot process. The problem is that
>>>>>>> other code, e.g. I'm using iptables via modules, requires the modules
>>>>>>> be configured early and this fails. If I reboot (after 'update-modules'
>>>>>>> has run), everything is fine.
>>>>>>
>>>>>> Sound like you need http://patches.openembedded.org/patch/1917/
>>>>>
>>>>> To be honest that sounds like a more fundamental problem as if the user
>>>>> cares which rtc should be rtc0, there are other ordering constraints
>>>>> being imposed such as a symlink to the "best" rtc device...
>>>>
>>>> Indeed, this patch did not help my situation at all.
>>>>
>>>> I think my problem is that of post-install package scripts (hence
>>>> 'Configuring ...') not being run until quite late.
>>>
>>> Looking at the pre-run image, I see that there is /etc/rcS.d/S98configure
>>> which runs these scripts. Is there any reason I can't move it earlier?
>>
>> Found it:
>>   ipk systems - meta/recipes-devtools/opkg/opkg_0.1.8.bb
>>   rpm systems - meta/classes/rootfs_rpm.bbclass
>>
>> Note: the ipk version is quasi-configurable, the rpm version hardwired at 98.
>> Since these are package install scripts, which presumable could have been run
>> at image creation time but needed to run on the target hardware, why put it
>> off to so late?  I would think that this should be done _first_, not _last_
>>
>> --
>> ------------------------------------------------------------
>> Gary Thomas                 |  Consulting for the
>> MLB Associates              |    Embedded world
>> ------------------------------------------------------------
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


