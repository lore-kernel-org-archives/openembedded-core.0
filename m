Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TjV4b-0005Y8-I0
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 14:13:14 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2012 04:58:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,280,1355126400"; d="scan'208";a="257406619"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 14 Dec 2012 04:58:10 -0800
Message-ID: <50CB2261.5030700@intel.com>
Date: Fri, 14 Dec 2012 14:58:09 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1355451303-1014-1-git-send-email-andrei.gherzan@windriver.com>
	<50CAD9C9.4040502@linux.intel.com>
In-Reply-To: <50CAD9C9.4040502@linux.intel.com>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] chrpath.bbclass: Normalize rpath only of it doesn't contain ORIGIN variable
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
X-List-Received-Date: Fri, 14 Dec 2012 13:13:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Saul,

I just did a fresh meta-toolchain-gmae build and the RPATH for the file
you mentioned looks fine...

$ chrpath -l tmp/sysroots/x86_64-linux/usr/lib/apt/methods/file
tmp/sysroots/x86_64-linux/usr/lib/apt/methods/file:
RPATH=$ORIGIN/../../../../usr/lib:$ORIGIN/../../../../lib

The latest commit on master, when I did the build, was this:
1b0c0f290290ff62fa7773379eb3898442d539c4

Does this problem happen only for apt-native package?

Thanks,
Laurentiu

On 12/14/2012 09:48 AM, Saul Wold wrote:
> On 12/13/2012 06:15 PM, Andrei Gherzan wrote:
>> If we normalize a rpath which contains ORIGIN variable, the binary will end
>> up without those rpaths at all. So check first if rpath contains ORIGIN variable
>> and if not, move on and normalize it.
>>
>> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
>> ---
>>   meta/classes/chrpath.bbclass |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
>> index 82329d1..0c7ab77 100644
>> --- a/meta/classes/chrpath.bbclass
>> +++ b/meta/classes/chrpath.bbclass
>> @@ -49,10 +49,10 @@ def process_dir (directory, d):
>>               new_rpaths = []
>>               for rpath in rpaths:
>>                   # If rpath is already dynamic copy it to new_rpath and continue
>> -                rpath =  os.path.normpath(rpath)
>>                   if rpath.find("$ORIGIN") != -1:
>>                       new_rpaths.append(rpath.strip())
>>                       continue
>> +                rpath =  os.path.normpath(rpath)
>>                   # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
>>                   # base_prefix shared root
>>                   if rpath.find(basedir) != -1:
>>
> I found this to be the same fix, but I am still seeing some kind of failure.
> 
> I can build apt-native with populate-sysroot and it looks correct and 
> then try to build the meta-toolchain-game and it fails.
>> sgw@yujin:/intel/builds/deb$ bitbake apt-native -f -c populate_sysrootLoading cache: 100% |#####################################################| ETA:  00:00:00
>> Loaded 1130 entries from dependency cache.
>>
>> Build Configuration:
>> BB_VERSION        = "1.17.0"
>> BUILD_SYS         = "x86_64-linux"
>> NATIVELSBSTRING   = "Ubuntu-12.04"
>> TARGET_SYS        = "mips-poky-linux"
>> MACHINE           = "qemumips"
>> DISTRO            = "poky"
>> DISTRO_VERSION    = "1.3+snapshot-20121214"
>> TUNE_FEATURES     = "o32 bigendian fpu-hard mips32"
>> TARGET_FPU        = ""
>> meta
>> meta-yocto
>> meta-yocto-bsp    = "mut:5c8feac210a9de9fd705e9774b76514d3ffa7121"
>>
>> NOTE: Resolving any missing task queue dependencies
>> NOTE: Preparing runqueue
>> NOTE: Tainting hash to force rebuild of task /intel/distro/meta/recipes-devtools/apt/apt-native_0.7.14.bb, do_populate_sysroot
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> NOTE: Tasks Summary: Attempted 253 tasks of which 252 didn't need to be rerun and all succeeded.
>> sgw@yujin:/intel/builds/deb$ chrpath -l /intel/builds/deb/tmp/sysroots/x86_64-linux/usr/lib/apt/methods/file
>> /intel/builds/deb/tmp/sysroots/x86_64-linux/usr/lib/apt/methods/file: RPATH=$ORIGIN/../../../../usr/lib:$ORIGIN/../../../../lib
> 
> This succeeds correctly and has the correct RPATH in the 
> apt/methods/file binary.
> 
>> sgw@yujin:/intel/builds/deb$ bitbake meta-toolchain-gmaeLoading cache: 100% |#####################################################| ETA:  00:00:00
>> Loaded 1130 entries from dependency cache.
>>
>> Build Configuration:
>> BB_VERSION        = "1.17.0"
>> BUILD_SYS         = "x86_64-linux"
>> NATIVELSBSTRING   = "Ubuntu-12.04"
>> TARGET_SYS        = "mips-poky-linux"
>> MACHINE           = "qemumips"
>> DISTRO            = "poky"
>> DISTRO_VERSION    = "1.3+snapshot-20121214"
>> TUNE_FEATURES     = "o32 bigendian fpu-hard mips32"
>> TARGET_FPU        = ""
>> meta
>> meta-yocto
>> meta-yocto-bsp    = "mut:5c8feac210a9de9fd705e9774b76514d3ffa7121"
>>
>> NOTE: Resolving any missing task queue dependencies
>> NOTE: Preparing runqueue
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> ERROR: Function failed: populate_sdk_image (see /intel/builds/deb/tmp/work/mips32-poky-linux/meta-toolchain-gmae/1.0-r7/temp/log.do_populate_sdk.11912 for further information)
>> ERROR: Logfile of failure stored in: /intel/builds/deb/tmp/work/mips32-poky-linux/meta-toolchain-gmae/1.0-r7/temp/log.do_populate_sdk.11912
>> Log data follows:
>> | DEBUG: Executing python function do_populate_sdk
>> | DEBUG: Executing shell function populate_sdk_image
>> | dpkg-scanpackages.real: info: Wrote 18 entries to output Packages file.
>> | dpkg-scanpackages.real: info: Wrote 3565 entries to output Packages file.
>> | dpkg-scanpackages.real: info: Wrote 6 entries to output Packages file.
>> | dpkg-scanpackages.real: info: Wrote 18 entries to output Packages file.
>> | dpkg-scanpackages.real: info: Wrote 1047 entries to output Packages file.
>> | Installing TARGET packages
>> | /intel/builds/deb/tmp/sysroots/x86_64-linux/usr/lib/apt/methods/file: error while loading shared libraries: libapt-pkg-libc6.3.so.4.6: cannot open shared object file: No such file or directory
>> | /intel/builds/deb/tmp/sysroots/x86_64-linux/usr/lib/apt/methods/file: error while loading shared libraries: libapt-pkg-libc6.3.so.4.6: cannot open shared object file: No such file or directory
>> | E: Method file has died unexpectedly!
>> | E: Method /intel/builds/deb/tmp/sysroots/x86_64-linux/usr/lib/apt/methods/file did not start correctly
>> | E: Method file has died unexpectedly!
>> | E: Method /intel/builds/deb/tmp/sysroots/x86_64-linux/usr/lib/apt/methods/file did not start correctly
>> | DEBUG: Python function do_populate_sdk finished
>> | ERROR: Function failed: populate_sdk_image (see /intel/builds/deb/tmp/work/mips32-poky-linux/meta-toolchain-gmae/1.0-r7/temp/log.do_populate_sdk.11912 for further information)
>> ERROR: Task 7 (/intel/distro/meta/recipes-core/meta/meta-toolchain-gmae.bb, do_populate_sdk) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 4056 tasks of which 4055 didn't need to be rerun and 1 failed.
>> No currently running tasks (4055 of 4057)
>>
>> Summary: 1 task failed:
>>   /intel/distro/meta/recipes-core/meta/meta-toolchain-gmae.bb, do_populate_sdk
>> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>> sgw@yujin:/intel/builds/deb$ chrpath -l /intel/builds/deb/tmp/sysroots/x86_64-linux/usr/lib/apt/methods/file
>> /intel/builds/deb/tmp/sysroots/x86_64-linux/usr/lib/apt/methods/file: RPATH=../../../usr/lib:../../../lib
> This fails and has the wrong RPATH, something is still tweaking the 
> RPATH, it should not change, but it is.
> 
> Very Frustrating!
> 
> Sau!
> 
> 
> 


