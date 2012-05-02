Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SPfYx-00074a-2v
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 21:50:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q42JeODC004880
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 May 2012 12:40:25 -0700 (PDT)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 2 May 2012 12:40:24 -0700
Message-ID: <4FA18DA7.6010205@windriver.com>
Date: Wed, 2 May 2012 14:40:23 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4FA17B2A.5060903@palm.com> <4FA17FA7.9030805@windriver.com>
	<4FA187F4.9040003@palm.com>
In-Reply-To: <4FA187F4.9040003@palm.com>
Subject: Re: SetScene tasks hang forever?
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
X-List-Received-Date: Wed, 02 May 2012 19:50:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/12 2:16 PM, Rich Pixley wrote:
> On 5/2/12 11:40 , Mark Hatle wrote:
>> On 5/2/12 1:21 PM, Rich Pixley wrote:
>>> I'm seeing a lot of builds apparently hanging forever, (the ones that
>>> work seem to work within seconds - the ones that hang seem to hang for
>>> at least 10's of minutes), with:
>>>
>>> rich@dolphin>    nice tail -f Log
>>> MACHINE           = "qemux86"
>>> DISTRO            = ""
>>> DISTRO_VERSION    = "oe-core.0"
>>> TUNE_FEATURES     = "m32 i586"
>>> TARGET_FPU        = ""
>>> meta              = "master:35b5fb2dd2131d4c7dc6635c14c6e08ea6926457"
>>>
>>> NOTE: Resolving any missing task queue dependencies
>>> NOTE: Preparing runqueue
>>> NOTE: Executing SetScene Tasks
>>>
>>> If I run top, I see one processor pinned at 98 - 99% utilization running
>>> python, but no other clues.
>>>
>>> Can anyone point me to doc, explain what's going on here, or point me in
>>> the right direction to debug this?
>> The only time I've seen "hang-like" behavior the system actually opened a
>> devshell and was awaiting input.   But based on your log, it doesn't look like
>> that is the case.
>>
>> Run bitbake with -DDD option, you will get considerably more debug information
>> and it might help point out what it thinks it is doing.
> NOTE: Executing SetScene Tasks
> DEBUG: Stamp for underlying task
> 12(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb,
> do_populate_sysroot) is current, so skipping setscene variant
> DEBUG: Stamp for underlying task
> 16(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb,
> do_populate_sysroot) is current, so skipping setscene variant
> DEBUG: Stamp for underlying task
> 20(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb,
> do_populate_sysroot) is current, so skipping setscene variant
> DEBUG: Stamp for underlying task
> 24(/home/rich/projects/webos/openembedded-core/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb,
> do_populate_sysroot) is current, so skipping setscene variant
> DEBUG: Stamp for underlying task
> 32(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb,
> do_populate_sysroot) is current, so skipping setscene variant
> DEBUG: Stamp for underlying task
> 36(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb,
> do_populate_sysroot) is current, so skipping setscene variant
> DEBUG: Stamp for underlying task
> 40(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/qemu/qemu_0.15.1.bb,
> do_populate_sysroot) is current, so skipping setscene variant
> DEBUG: Stamp for underlying task
> 44(/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb,
> do_populate_sysroot) is current, so skipping setscene variant
>
> And then the spinning hang.

Sorry, I don't know how to continue debugging what might be wrong.  The only 
other thing I can suggest is check that your filesystem is "real", not a 
netapp/nfs/network emulated filesystem....

And if you were continuing a previous build, start a new build directory and 
retry it.

--Mark

> --rich
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



