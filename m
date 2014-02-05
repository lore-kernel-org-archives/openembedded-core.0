Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 251196D762
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 12:09:38 +0000 (UTC)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Wed, 5 Feb 2014
	13:09:05 +0100
Message-ID: <52F229E1.3040204@enea.com>
Date: Wed, 5 Feb 2014 13:09:05 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <cover.1391427313.git.laurentiu.palcu@intel.com>	<cover.1391594312.git.laurentiu.palcu@intel.com>
	<CAAKB1h3PL6oyL0VG70SVXSMEROxrwX0sJDc82WO+0e=QvSKiaw@mail.gmail.com>
In-Reply-To: <CAAKB1h3PL6oyL0VG70SVXSMEROxrwX0sJDc82WO+0e=QvSKiaw@mail.gmail.com>
X-Originating-IP: [172.16.141.133]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 00/50] Rootfs/image generation refactoring (cover letter only)
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
X-List-Received-Date: Wed, 05 Feb 2014 12:09:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-02-05 11:58, David Nystrom wrote:
> On Wed, Feb 5, 2014 at 11:07 AM, Laurentiu Palcu
> <laurentiu.palcu@intel.com>wrote:
>
>> V2:
>>   * fix building from feeds for opkg;
>>   * rebase;
>>
>
> | NOTE: ###### Generate rootfs #######
> | NOTE: Installing the following packages: run-postinsts
> packagegroup-core-boot
> | sed: -e expression #1, char 41: unterminated address regex
> | sed: -e expression #1, char 42: unterminated address regex
> | sed: -e expression #1, char 41: unterminated address regex
> | sed: -e expression #1, char 42: unterminated address regex
>
> [david] Why are these seds failing ?, I've seen this in master aswell
> though.

After testing with the yocto 1.5 repo, the postinstall sed failures 
where not seen anymore. Added Bug:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5789

>
> | NOTE: Installing complementary packages ...
> | NOTE: Installing the following packages:
> | /media/sdb5/bld/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl: the
> ``install'' command requires at least one argument
> | NOTE: Unable to install packages. Command
> /media/sdb5/bld/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl -f
> /media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/opkg.conf
> -o
> /media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/rootfs
> --force_postinstall --prefer-arch-to-version   install  returned 1
> | NOTE: Running intercept scripts:
> | NOTE: Executing write_package_manifest ...
> | DEBUG: Executing python function write_package_manifest
> | NOTE: Building from feeds activated!
> | NOTE: Add all feed with URL
> file:///media/sdb5/oel/build/tmp/deploy/ipk/all
> | NOTE: Add qemuppc feed with URL
> file:///media/sdb5/oel/build/tmp/deploy/ipk/qemuppc
> | NOTE: Add ppc7400 feed with URL
> file:///media/sdb5/oel/build/tmp/deploy/ipk/ppc7400
> | DEBUG: Python function write_package_manifest finished
> | NOTE: Executing license_create_manifest ...
> | DEBUG: Executing shell function license_create_manifest
> | ls: cannot access
> /media/sdb5/bld/tmp/sysroots/qemuppc/pkgdata/runtime-reverse/base-files: No
> such file or directory
> | readlink: missing operand
> | Try 'readlink --help' for more information.
> | basename: missing operand
> | Try 'basename --help' for more information.
> | WARNING: exit code 1 from a shell command.
> | DEBUG: Python function do_rootfs finished
> | ERROR: Function failed: license_create_manifest (log file is located at
> /media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.29007)
> ERROR: Task 6 (/media/sdb5/poky-contrib/meta/recipes-core/images/
> core-image-minimal.bb, do_rootfs) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 504 tasks of which 503 didn't need to be
> rerun and 1 failed.
>
> Summary: 1 task failed:
>    /media/sdb5/poky-contrib/meta/recipes-core/images/core-image-minimal.bb,
> do_rootfs
> Summary: There was 1 ERROR message shown, returning a non-zero exit code
>
> Br,
> David
>

FYI: to easily recreate this testcase:

-Clean build env-

$ grep -C 6 -r FEEDS conf/local.conf
# Default to setting automatically based on cpu count
PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
#
# For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 
4" would
# be appropriate for example.

BUILD_IMAGES_FROM_FEEDS="1"
IPK_FEED_URIS = " \
 
all##http://downloads.yoctoproject.org/releases/yocto/yocto-1.5/ipk/all \
	 
${MACHINE}##http://downloads.yoctoproject.org/releases/yocto/yocto-1.5/ipk/${MACHINE} 
\
 
ppc7400##http://downloads.yoctoproject.org/releases/yocto/yocto-1.5/ipk/ppc7400 
\
	   "

PACKAGE_CLASSES="ipk" MACHINE="qemuppc" bitbake -c rootfs core-image-minimal

Br,
David


