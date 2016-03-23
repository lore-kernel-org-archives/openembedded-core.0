Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70CFF607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 01:11:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2N1Brup010301
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Mar 2016 18:11:54 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 22 Mar 2016 18:11:53 -0700
To: Mark Hatle <mark.hatle@windriver.com>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>, <raj.khem@gmail.com>
References: <cover.1458638728.git.hongxu.jia@windriver.com>
	<106023d3fcea3a639f3ef6d68265739359f22252.1458638728.git.hongxu.jia@windriver.com>
	<56F17A74.1050006@windriver.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56F1ED56.7010805@windriver.com>
Date: Wed, 23 Mar 2016 09:11:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56F17A74.1050006@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/16] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Wed, 23 Mar 2016 01:11:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/23/2016 01:01 AM, Mark Hatle wrote:
> On 3/22/16 7:12 AM, Hongxu Jia wrote:
>> Tweak DEBUG_FLAGS to use "/usr/src/debug" as source target path
>> in DWARF. While use gdb to debug binary, it could work with
>> sources in dbg package.
>>
>> While -fdebug-prefix-map is used for compiling, we do not need
>> invoking debugedit to edit DWARF at do_package time, but list
>> where sources files are.
>>
>> The copydebugsources uses the list to copy sources to dbg package.
>> It works whether -fdebug-prefix-map used or not.
>>
>> [YOCTO #9305]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes/package.bbclass | 31 +++++++++++++++++++++++++------
>>   meta/conf/bitbake.conf       |  3 +--
>>   2 files changed, 26 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index ef80e50..478a1d9 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -300,6 +300,15 @@ def get_conffiles(pkg, d):
>>       os.chdir(cwd)
>>       return conf_list
>>   
>> +def checkbuildpath(file, d):
>> +    tmpdir = d.getVar('TMPDIR', True)
>> +    with open(file) as f:
>> +        file_content = f.read()
>> +        if tmpdir in file_content:
>> +            return True
>> +
>> +    return False
>> +
>>   def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
>>       # Function to split a single file into two components, one is the stripped
>>       # target system binary, the other contains any debugging information. The
>> @@ -313,7 +322,6 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
>>       objcopy = d.getVar("OBJCOPY", True)
>>       debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
>>       workdir = d.getVar("WORKDIR", True)
>> -    workparentdir = d.getVar("DEBUGSRC_OVERRIDE_PATH", True) or os.path.dirname(os.path.dirname(workdir))
>>   
>>       # We ignore kernel modules, we don't generate debug info files.
>>       if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
>> @@ -327,7 +335,7 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
>>   
>>       # We need to extract the debug src information here...
>>       if debugsrcdir:
>> -        cmd = "'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (debugedit, workparentdir, debugsrcdir, sourcefile, file)
>> +        cmd = "'%s' -i -l '%s' '%s'" % (debugedit, sourcefile, file)
>>           (retval, output) = oe.utils.getstatusoutput(cmd)
>>           if retval:
>>               bb.fatal("debugedit failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
>> @@ -363,8 +371,14 @@ def copydebugsources(debugsrcdir, d):
>>           objcopy = d.getVar("OBJCOPY", True)
>>           debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
>>           workdir = d.getVar("WORKDIR", True)
>> -        workparentdir = os.path.dirname(os.path.dirname(workdir))
>> -        workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
>> +
>> +        # If build path exists in sourcefile, it means toolchain did not use
>> +        # -fdebug-prefix-map to compile
>> +        if checkbuildpath(sourcefile, d):
>> +            localsrc_word = workdir
>> +        else:
>> +            localsrc_word = "/usr/src/debug"
>> +        localsrc_prefix = localsrc_word + '/'
>>   
>>           nosuchdir = []
>>           basepath = dvar
>> @@ -379,17 +393,22 @@ def copydebugsources(debugsrcdir, d):
>>           # We need to ignore files that are not actually ours
>>           # we do this by only paying attention to items from this package
>>           processdebugsrc += "fgrep -zw '%s' | "
>> +        # Remove prefix in the source paths
>> +        processdebugsrc += "sed 's#%s##g' | "
>> +
>>           processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
>>   
>> -        cmd = processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir)
>> +        cmd = processdebugsrc % (sourcefile, localsrc_word, localsrc_prefix, workdir, dvar, debugsrcdir)
>>           (retval, output) = oe.utils.getstatusoutput(cmd)
>> +
>>           # Can "fail" if internal headers/transient sources are attempted
>>           #if retval:
>>           #    bb.fatal("debug source copy failed with exit code %s (cmd was %s)" % (retval, cmd))
>>   
>>           # cpio seems to have a bug with -lL together and symbolic links are just copied, not dereferenced.
>>           # Work around this by manually finding and copying any symbolic links that made it through.
>> -        cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s' 2>/dev/null)" % (dvar, debugsrcdir, dvar, debugsrcdir, workparentdir, dvar, debugsrcdir)
>> +        cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s' 2>/dev/null)" % (dvar, debugsrcdir, dvar, debugsrcdir, workdir, dvar, debugsrcdir)
>> +
>>           (retval, output) = oe.utils.getstatusoutput(cmd)
>>           if retval:
>>               bb.fatal("debugsrc symlink fixup failed with exit code %s (cmd was %s)" % (retval, cmd))
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 7ed5ffb..838ee81 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -550,8 +550,7 @@ EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
>>   # Optimization flags.
>>   ##################################################################
>>   DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types \
>> -                -fdebug-prefix-map=${B}=/usr/src/${BPN} \
>> -                -fdebug-prefix-map=${S}=/usr/src/${BPN} \
>> +                -fdebug-prefix-map=${WORKDIR}=/usr/src/debug \
> The above is incorrect.
>
> Replacing WORKDIR w/ /usr/src/debug will lead to file collisions.  Since a lot
> of 'workdir' directories have a 'build' directory.  Any temporary files created
> in the build will now end up in a shared build directory.  In addition if there
> are differences between different 'arch' source dirs, the same issue can occur
> causing file conflicts.
>
> In the past the /usr/src/debug location would have been:
>
> /usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}
>
> That ensures that all recipes, even multiple recipes of different versions have
> a uniquely named directory structure.  (PN is important vs BPN, as it has the
> remapped 'lib32-' or similar extension to prevent collision.)

Yes, you are right, I thought you should point it out (but not sure).

So I pulled this V1 for discussing, and I will change it as you 
suggested in V2.

//Hongxu


> --Mark
>
>>                   -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
>>                   -fdebug-prefix-map=${STAGING_DIR_HOST}= \
>>   "
>>


