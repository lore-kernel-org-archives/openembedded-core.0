Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7E2724DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Apr 2015 13:18:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t32DIWeR009530
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Apr 2015 06:18:33 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Thu, 2 Apr 2015 06:18:32 -0700
Message-ID: <551D41A7.1050409@windriver.com>
Date: Thu, 2 Apr 2015 08:18:31 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Cliff Brake <cbrake@bec-systems.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
References: <CAOd_LFx8=tqK64c=Xyq3Yqk+LX2aGeZfpGOmpgpk-hvkb_2Cww@mail.gmail.com>
In-Reply-To: <CAOd_LFx8=tqK64c=Xyq3Yqk+LX2aGeZfpGOmpgpk-hvkb_2Cww@mail.gmail.com>
Subject: Re: failure in gcc-crosssdk-initial was populate_sdk error
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
X-List-Received-Date: Thu, 02 Apr 2015 13:18:44 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 4/1/15 5:17 PM, Cliff Brake wrote:
> Hi,
> 
> I'm getting the following when running populate_sdk with a dizzy build.
> 
> Angstrom distro
> workstation OS is debian wheezy
> gcc (Debian 4.7.2-5) 4.7.2
> 
> Any thoughts what I'm doing wrong?
> 
> Thanks,
> Cliff
> 
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_configure (log file is located at
> /scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work/x86_64-angstromsdk-linux/gcc-crosssdk-initial-x86_64/4.9.1-r0/temp/log.do_configure.23863)
> ERROR: Logfile of failure stored in:
> /scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work/x86_64-angstromsdk-linux/gcc-crosssdk-initial-x86_64/4.9.1-r0/temp/log.do_configure.23863
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> 'bit-64', 'x86_64-linux', 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_copy_aclocals
> | DEBUG: Python function autotools_copy_aclocals finished
> | DEBUG: Executing python function gcc_multilib_setup
> | DEBUG: Python function gcc_multilib_setup finished
> | DEBUG: Executing shell function do_configure
> | cat: /scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work-shared/gcc-4.9.1-r0/gcc-4.9.1/gcc/defaults.h:
> No such file or directory
> | WARNING: /scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work/x86_64-angstromsdk-linux/gcc-crosssdk-initial-x86_64/4.9.1-r0/temp/run.do_configure.23863:1
> exit 1 from
> |   grep -v "\#endif.*GCC_DEFAULTS_H" >
> /scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work/x86_64-angstromsdk-linux/gcc-crosssdk-initial-x86_64/4.9.1-r0/gcc-4.9.1/build.x86_64-linux.x86_64-angstromsdk-linux/gcc/defaults.h.new
> | ERROR: Function failed: do_configure (log file is located at

The above lines are the actual failure.  The failure was in configuring the
recipe 'gcc-cross-initial-x86_64'.

I do not know the caue of the failure, but the issue is obvious enough, it was
trying to load the 'defaults.h' file and modify a few settings in it.

The code in question is in 'meta/recipes-devtools/gcc/gcc-configure-common.inc':

do_configure_prepend () {
        # teach gcc to find correct target includedir when checking libc ssp support
        mkdir -p ${B}/gcc
        echo "NATIVE_SYSTEM_HEADER_DIR = ${SYSTEMHEADERS}" > ${B}/gcc/t-oe
        cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_DEFAULTS_H" >
${B}/gcc/defaults.h.new
        cat >>${B}/gcc/defaults.h.new <<_EOF
...

In the extracted source code for gcc, should have a been a 'gcc/defaults.h'.
Since the failure was that that file was not found, it appears to me that
something failured in the extraction of the source code.  You'll likely have to
instrument your build, or run through various pieces bits and figure out what
went wrong.  (The code in question has been around since 2011 and as far as I
can tell with quick inspect has not changed in a while.)

--Mark

> /scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work/x86_64-angstromsdk-linux/gcc-crosssdk-initial-x86_64/4.9.1-r0/temp/log.do_configure.23863)
> ERROR: Task 2167
> (/scratch/fmc-accuload/oe-build-bbb/sources/openembedded-core/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.9.bb,
> do_configure) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1406 tasks of which 1218 didn't need to
> be rerun and 1 failed.
> NOTE: Writing buildhistory
> Waiting for 0 running tasks to finish:
> 
> Summary: 1 task failed:
>   /scratch/fmc-accuload/oe-build-bbb/sources/openembedded-core/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.9.bb,
> do_configure
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> 


