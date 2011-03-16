Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1PzkaQ-000627-Vt
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 07:52:03 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2011 23:50:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,193,1299484800"; d="scan'208";a="897741636"
Received: from unknown (HELO [10.255.12.146]) ([10.255.12.146])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2011 23:50:17 -0700
Message-ID: <4D805D99.5020508@linux.intel.com>
Date: Tue, 15 Mar 2011 23:50:01 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <161e1f47c2460d5b2463300e31bf5eebb46b8698.1300172958.git.dvhart@linux.intel.com>	<ACE0CCC0-8D25-4FC2-93B2-73C60636721A@beagleboard.org>	<4D7F9CC2.2030002@linux.intel.com>
	<01E6B9D2-7458-4A26-A34A-75FD106E054B@beagleboard.org>
In-Reply-To: <01E6B9D2-7458-4A26-A34A-75FD106E054B@beagleboard.org>
Cc: Koen Kooi <koen@beagleboard.org>
Subject: Re: [PATCH] [RFC] kernel: rework kernel and module	classes to allow for building out-of-tree modules
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
X-List-Received-Date: Wed, 16 Mar 2011 06:52:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 03/15/2011 10:25 AM, Koen Kooi wrote:
>
> Op 15 mrt 2011, om 18:07 heeft Darren Hart het volgende geschreven:
>
>>
>>
>> On 03/15/2011 01:31 AM, Koen Kooi wrote:
>>>
>>> Op 15 mrt 2011, om 08:25 heeft Darren Hart het volgende geschreven:
>>>
>>>> NOT FOR INCLUSION
>>>>
>>>> Before we include something like this, it needs review from folks
>>>> like Koen and Gary to confirm it works in their environment as
>>>> well.
>>>>
>>>> The existing infrastructure uses an external build tree which
>>>> references the kernel source in the work dir. If run with rm work,
>>>> building external modules will fail.
>>>>
>>>> This patch places a configured source tree in sysroots. Striking a
>>>> balance between minimal size and minimal maintenance is difficult.
>>>> This version leans on the side of caution and removes only the
>>>> obviously unecessary parts of the source tree to conserve space.
>>>>
>>>> Care is also taken to clean the hostprogs in scripts, and the
>>>> modules are responsible for building them as needed.
>>>
>>> I get this:
>>>
>>> | cp: cannot open
>>> `./.pc/0001-PSP-3.0.1.6-kernel-source-patched-with-OCF-Linux.patch/crypto/ocf/ixp4xx/ixp4xx.c'
>>> for reading: Permission denied
>>>
>>> After adding 'do_make_scripts' in my module do_compile and applying
>>> your patch. So it seems to be tripping on the quilt directory :(
>>
>> What are the ownership and perms on those?
>
> drwxr-xr-x 126 koen koen   16384 2011-03-10 15:42 .pc/
>
> and
>
> drwxr-xr-x   5 koen koen  4096 2011-03-10 15:42 0001-Added-Crane-Board-support.patch/
> drwxr-xr-x   3 koen koen  4096 2011-03-10 15:42 0001-BeagleBoard-Adjust-USER-button-pin-for-xM.patch/
> drwxr-xr-x   4 koen koen  4096 2011-03-10 15:42 0001-mt9t111-first-stab-at-merging-sensor-driver-based-on.patch/
>
> etc.
>
> and finally:
>
> ---------- 1 koen koen 0 2011-03-10 15:42 git/.pc/0001-PSP-3.0.1.6-kernel-source-patched-with-OCF-Linux.patch/crypto/ocf/ixp4xx/ixp4xx.c


Interesting, I just did a test patch with quilt to change the Makefile 
(outside the build system) and don't see that kind of wanton abuse of 
permissions:

dvhart@rage:linux$ ls -la .pc
total 28
drwxrwxr-x  3 dvhart dvhart 4096 2011-03-15 23:32 .
drwxrwxr-x 27 dvhart dvhart 4096 2011-03-15 23:33 ..
-rw-rw-r--  1 dvhart dvhart    8 2011-03-15 23:32 .quilt_patches
-rw-rw-r--  1 dvhart dvhart    7 2011-03-15 23:32 .quilt_series
-rw-rw-r--  1 dvhart dvhart    2 2011-03-15 23:32 .version
-rw-rw-r--  1 dvhart dvhart   17 2011-03-15 23:32 applied-patches
drwxrwxr-x  2 dvhart dvhart 4096 2011-03-15 23:33 quilt-test.patch

dvhart@rage:linux$ ls -la .pc/quilt-test.patch/
total 60
drwxrwxr-x 2 dvhart dvhart  4096 2011-03-15 23:33 .
drwxrwxr-x 3 dvhart dvhart  4096 2011-03-15 23:32 ..
-rw-rw-r-- 1 dvhart dvhart     0 2011-03-15 23:33 .timestamp
-rw-rw-r-- 1 dvhart dvhart 52198 2011-03-15 23:32 Makefile
dvhart@rage:linux$

Unfortunately, some versions/scenarios do, so I'll work around it.

>
>> I suppose we could avoid the .pc directory - but it's going to require something more than cp or some additional scripting. Something like tar's exclude functionality might be needed - but I hate to add the intermediate step as the kernel recipes are already so slow.
>
> It's that or forbidding people to apply patches to the kernel :)

Hrm.... interesting notion... do you think people would mind? ;-)

Fix is under test, hope to post yet tonight.

--
Darren

>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


