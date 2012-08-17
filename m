Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2JbH-0000Wl-8s
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 12:16:19 +0200
Received: from localhost ([127.0.0.1]:36805 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2JPg-0004W0-L8
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 10:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=QEliViJf7QIT+pODt7TFbbEe8lQ=; b=NYpgXM+4qUoE4XDDYoarI9AKif/G
	04OleXfKtzmrPiu1vZh5fPIe776C3M95HdkA8knc51VNf8FtsBkQroY4HMdPN9st
	6HZAdS5ZEf4R8u/lSLDr7b2EqNzb+BfaeeNc9+vA4KYHUqKNpUYjkgVtufVdO9gm
	cyEn/Ay85JfA89o=
Received: from [195.171.99.130] (port=47106 helo=[192.168.0.47])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2JPg-0004Vx-Ha
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 10:04:20 +0000
Message-ID: <502E1777.6020006@communistcode.co.uk>
Date: Fri, 17 Aug 2012 11:05:43 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1345049073-27898-1-git-send-email-paul.eggleton@linux.intel.com>
	<1566766.76zJMGCy1b@helios> <1345197209.26132.2.camel@ted>
In-Reply-To: <1345197209.26132.2.camel@ted>
Subject: Re: [PATCH] classes/chrpath: trigger an error if chrpath fails
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 17 Aug 2012 10:16:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 17/08/12 10:53, Richard Purdie wrote:
> On Thu, 2012-08-16 at 18:13 +0100, Paul Eggleton wrote:
>> On Wednesday 15 August 2012 17:44:33 Paul Eggleton wrote:
>>> If chrpath failed here we were just silently ignoring it.
>>>
>>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>> ---
>>>   meta/classes/chrpath.bbclass |    4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
>>> index 10b5ca0..ad61fe0 100644
>>> --- a/meta/classes/chrpath.bbclass
>>> +++ b/meta/classes/chrpath.bbclass
>>> @@ -74,7 +74,9 @@ def process_dir (directory, d):
>>>               if len(new_rpaths):
>>>                   args = ":".join(new_rpaths)
>>>                   #bb.note("Setting rpath for %s to %s" %(fpath, args))
>>> -                sub.call([cmd, '-r', args, fpath])
>>> +                ret = sub.call([cmd, '-r', args, fpath])
>>> +                if ret != 0:
>>> +                    bb.error("chrpath command failed with exit code %d" %
>>> ret)
>>>
>>>               if perms:
>>>                   os.chmod(fpath, perms)
>>
>> I missed that this does not actually report the output from chrpath when it
>> fails because the task log is suppressed by virtue of calling bb.error. I will
>> send a follow-up patch to address this.
>>
>> Incidentally a couple of users are reporting that they are now seeing failures
>> where the rpath size is reported to be too small to contain the path we are
>> applying. I haven't seen this myself - is there some way we can increase the
>> space allowed for storing the path or is there some other issue at work here?
>> I tried to search for some information on how storage of the rpath works but
>> did not really find anything conclusive.
>
> Unfortunately we can't increase the size available without relinking the
> binary which isn't feasible at this point. The only way to increase the
> size is to run the build in a "deeper" path so that there is more room
> in the field. I did some calculations when we originally implemented
> this and concluded you'd have to build somewhere like /tmp to have a
> short enough path where this would be a problem.
>
> I thought we'd added a sanity test for it too but it sounds like either
> we didn't or if we did, it isn't functioning properly. Its good that at
> least we're catching the errors now and I'd appreciate more information
> about the failing cases.
>
> Cheers,
>
> Richard
>

I have had a few chrpath errors today, however I have no way of telling 
where they appeared. Here is the build output of where I found them.

[jack@archHP build]$ bitbake core-image-minimal
Pseudo is not present but is required, building this first before the 
main build
Parsing recipes: 100% 
|###############################################################################| 
ETA:  00:00:00
Parsing of 824 .bb files complete (0 cached, 824 parsed). 1122 targets, 
36 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.15.3"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "qemuarm"
DISTRO_VERSION    = "oe-core.0"
TUNE_FEATURES     = "armv5 dsp thumb arm926ejs"
TARGET_FPU        = "soft"
meta              = 
"kraj/toolchain-rework:126a0363d03c1f5ff7a6b8ae0939d1a9ff8336f0"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 63 tasks of which 0 didn't need to be 
rerun and all succeeded.
Loading cache: 100% 
|#################################################################################| 
ETA:  00:00:00
Loaded 1123 entries from dependency cache.

Build Configuration:
BB_VERSION        = "1.15.3"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "qemuarm"
DISTRO_VERSION    = "oe-core.0"
TUNE_FEATURES     = "armv5 dsp thumb arm926ejs"
TARGET_FPU        = "soft"
meta              = 
"kraj/toolchain-rework:126a0363d03c1f5ff7a6b8ae0939d1a9ff8336f0"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL 
http://kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.22.tar.bz2, 
attempting MIRRORS if available
WARNING: Failed to fetch URL 
http://www.apache.org/dist/subversion/subversion-1.7.2.tar.bz2, 
attempting MIRRORS if available
WARNING: Failed to fetch URL 
ftp://ftp.ossp.org/pkg/lib/uuid/uuid-1.6.2.tar.gz, attempting MIRRORS if 
available
WARNING: unifdef-native: No generic license file exists for: GPL in any 
provider
WARNING: Failed to fetch URL 
http://kernel.org/pub/linux/kernel/people/jsipek/guilt/guilt-0.33.tar.gz, attempting 
MIRRORS if available
*ERROR: chrpath command failed with exit code 7
ERROR: chrpath command failed with exit code 7*
WARNING: ossp-uuid-native: No generic license file exists for: ossp_uuid 
in any provider
WARNING: Failed to fetch URL 
ftp://ftp.debian.org/debian/pool/main/b/base-passwd/base-passwd_3.5.24.tar.gz, 
attempting MIRRORS if available
WARNING: Failed to fetch URL 
http://kernel.org/pub/linux/utils/kernel/hotplug/udev-164.tar.gz, 
attempting MIRRORS if available
NOTE: validating kernel configuration

Currently 5 running tasks (1374 of 1513):
0: db-5.3.15-r8 do_install (pid 30360)
1: 
linux-yocto-3.4.6+git1+7ff48aa47c50b6455d60ca93bc81260ce8fe1a1b_1+b57548a29e44655e27cfbdf3a0642d682401b835-r4.0 
do_package (pid 24811)
2: 
linux-yocto-3.4.6+git1+7ff48aa47c50b6455d60ca93bc81260ce8fe1a1b_1+b57548a29e44655e27cfbdf3a0642d682401b835-r4.0 
do_populate_sysroot (pid 24812)
3: ncurses-5.9-r10.1 do_package (pid 29454)
4: ncurses-5.9-r10.1 do_populate_sysroot (pid 29453)

Should there be some further error reporting put in with the new 
'display' system, for example pre-pending the Error/Warning messages 
with the package name?

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



