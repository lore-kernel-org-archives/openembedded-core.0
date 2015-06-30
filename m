Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DBA0375CC0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 17:45:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 30 Jun 2015 10:44:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,379,1432623600"; d="scan'208";a="597597811"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.4.44])
	([10.219.4.44])
	by orsmga003.jf.intel.com with ESMTP; 30 Jun 2015 10:44:43 -0700
Message-ID: <5592D5AB.1090405@linux.intel.com>
Date: Tue, 30 Jun 2015 12:45:15 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Andre McCurdy <armccurdy@gmail.com>
References: <1435240007-1878-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJ86T=XJNHC1+eQKdYZ_US8EmjkmWCRLaK9LKe3A1EKiDXp_rg@mail.gmail.com>
In-Reply-To: <CAJ86T=XJNHC1+eQKdYZ_US8EmjkmWCRLaK9LKe3A1EKiDXp_rg@mail.gmail.com>
Cc: swg@linux.intel.com,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory.bbclass: Create a files-in-<pkg>.txt containg recipe's pkg files
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
X-List-Received-Date: Tue, 30 Jun 2015 17:46:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andre

On 06/29/2015 08:57 PM, Andre McCurdy wrote:
> Hi Leonardo,
>
> On Thu, Jun 25, 2015 at 6:46 AM,
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> A file similar (in format) to files-in-image.txt is created for each
>> recipe's build package. This would allow to easily see what the
>> recipe's package may install when including it into an image.
>>
>> These files reside on the specific buildhistory recipe package (i.e.
>> buildhistory/packages/i586-poky-linux/busybox/busybox-dev/files-in-busybox-dev.txt
>> for busybox-dev package)
>>
>> [YOCTO #5870]
>>
>> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> I'm seeing build errors since this patch got merged to oe-core master:
>

I will send another version of the first patch, this time, a check is 
included which verifies that the output folder is present. In your case, 
looks to me that this folder ;

/work/build-7401/buildhistory/packages/core2-32-rdk-linux/cairo/cairo-dbg/

is not present, so the find > /work/...../cairo-dgb/files-in-*.txt 
command is failing. What it is strange to me is that this tasks 
(buildhistory_list_pkg_files) does not in theory needs this check 
because it is done after all the previous buildhistory/packages/* 
folders/files are created.

Anyway, please remove this patch and try with the one I will send today.

> ...
> NOTE: recipe cairo-1.14.2-r0: task do_packagedata: Started
> ERROR: Function failed: buildhistory_list_pkg_files (log file is
> located at /work/build-7401/tmp/work/core2-32-rdk-linux/cairo/1.14.2-r0/temp/log.do_packagedata.41874)
> ERROR: Logfile of failure stored in:
> /work/build-7401/tmp/work/core2-32-rdk-linux/cairo/1.14.2-r0/temp/log.do_packagedata.41874
> Log data follows:
> | DEBUG: Executing python function sstate_task_prefunc
> | DEBUG: Python function sstate_task_prefunc finished
> | DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common',
> 'common-linux', 'common-glibc', 'i686-linux', 'common']
> | DEBUG: Executing shell function do_packagedata
> | DEBUG: Shell function do_packagedata finished
> | DEBUG: Executing python function sstate_task_postfunc
> | DEBUG: Staging files from
> /work/build-7401/tmp/work/core2-32-rdk-linux/cairo/1.14.2-r0/pkgdata
> to /work/build-7401/tmp/sysroots/7401/pkgdata
> | DEBUG: Executing python function buildhistory_emit_pkghistory
> | DEBUG: Writing recipe history
> | DEBUG: Writing package history for package cairo-gobject
> | DEBUG: Writing package history for package cairo-dev
> | DEBUG: Writing package history for package cairo
> | DEBUG: Executing shell function buildhistory_list_pkg_files
> | /work/build-7401/tmp/work/core2-32-rdk-linux/cairo/1.14.2-r0/temp/run.buildhistory_list_pkg_files.41874:
> line 124: /work/build-7401/buildhistory/packages/core2-32-rdk-linux/cairo/cairo-dbg/files-in-cairo-dbg.txt:
> No such file or directory
> | WARNING: /work/build-7401/tmp/work/core2-32-rdk-linux/cairo/1.14.2-r0/temp/run.buildhistory_list_pkg_files.41874:1
> exit 1 from
> |   buildhistory_list_files ${pkgdir} ${outfile}
> | DEBUG: Python function buildhistory_emit_pkghistory finished
> | DEBUG: Python function sstate_task_postfunc finished
> | ERROR: Function failed: buildhistory_list_pkg_files (log file is
> located at /work/build-7401/tmp/work/core2-32-rdk-linux/cairo/1.14.2-r0/temp/log.do_packagedata.41874)
> NOTE: recipe cairo-1.14.2-r0: task do_packagedata: Failed
> ERROR: Task 2397
> (/work/openembedded-core/meta/recipes-graphics/cairo/cairo_1.14.2.bb,
> do_packagedata) failed with exit code '1'
>
>
>>   meta/classes/buildhistory.bbclass | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
>> index 777aabc..8fc8a3a 100644
>> --- a/meta/classes/buildhistory.bbclass
>> +++ b/meta/classes/buildhistory.bbclass
>> @@ -242,6 +242,9 @@ python buildhistory_emit_pkghistory() {
>>           pkginfo.size = int(pkgdata['PKGSIZE'])
>>
>>           write_pkghistory(pkginfo, d)
>> +
>> +    # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
>> +    bb.build.exec_func("buildhistory_list_pkg_files", d)
>>   }
>>
>>
>> @@ -435,6 +438,16 @@ buildhistory_list_files() {
>>          ( cd $1 && find . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
>>   }
>>
>> +buildhistory_list_pkg_files() {
>> +        file_prefix="files-in-"
>> +
>> +        # Create individual files-in-package for each recipe's package
>> +        for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
>> +                pkgname=$(basename ${pkgdir})
>> +                outfile="${BUILDHISTORY_DIR_PACKAGE}/${pkgname}/${file_prefix}${pkgname}.txt"
>> +                buildhistory_list_files ${pkgdir} ${outfile}
>> +        done
>> +}
>>
>>   buildhistory_get_imageinfo() {
>>          if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'image', '1', '0', d)}" = "0" ] ; then
>> --
>> 1.8.4.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

