Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlR0g-0001Y5-JV
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 21:12:31 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jan 2012 12:04:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="95844206"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by orsmga001.jf.intel.com with ESMTP; 12 Jan 2012 12:04:55 -0800
Message-ID: <4F0F3CE6.3020707@linux.intel.com>
Date: Thu, 12 Jan 2012 12:04:54 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326003199.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1326003199.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/2] Add function to package source codes tree to source rpm and tar packages
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
X-List-Received-Date: Thu, 12 Jan 2012 20:12:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 01/07/2012 11:11 PM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Add file "tar_archive.bbclass" and modify file "package_rpm.bbclass" for packaging source codes tree to source rpm and tar packages.
> After adding srpm function in file "package_rpm.bbclass", user can get source rpm packages beside rpm package.
> User also get tar packages of source codes tree according to the requirement from bug 1655. The final result is as follow:
> Take qemux86 for an example:
> Get source rpm pakcages
> 1 Inherit tar_archive.bbclass in package_rpm.bbclass.
> 2 Select the type of packaging source code tree in conf/local.conf(ARCHIVE_TYPE ?= "SRPM")
> 3 Run the following command
>    $ bitbake core-image-sato -c copysources
> 4 Get source rpm packages:
>    $ tree build/tmp/deploy/sources
>    build/tmp/deploy/sources/
>    └── qemux86
>      ├── all-poky-linux
>      │� �  ├── encodings-1.0.4-r2.1.src.rpm
>          ......
>      ├── i586-poky-linux
>      │� �  ├── acl-2.2.51-r2.src.rpm
>          ......
>      └── qemux86-poky-linux
>          ├── base-files-3.0.14-r70.src.rpm
>          ......
> Get tar packages:
> 1 Inherit tar_archive.bbclass in an suitable position (for example, package_rpm.bbclass).
> 2 Select the type of packaging source code tree in conf/local.conf(ARCHIVE_TYPE ?= "TARGZ")
> 3 Run the following command
>    $ bitbake core-image-sato -c copysources
> 4 Get tar packages:
>    $ tree build/tmp/deploy/sources
>    buildx86/tmp/deploy/sources
>    └── qemux86
>      ├── all-poky-linux
>      │� �  ├── encodings-1_1.0.4-r2.1
>      │� �  │� �  ├── encodings-1_1.0.4-r2.1.tar.gz
>      │� �  │� �  └── log.tar.gz
>              ......
>      ├── i586-poky-linux
>      │� �  ├── acl-2.2.51-r2
>      │� �  │� �  ├── acl-2.2.51-r2.tar.gz
>              └── log.tar.gz
>              ......
>      └── qemux86-poky-linux
>          ├── core-image-sato-1.0-r0
>          ├── libzypp-0.0-git1+15b6c52260bbc52b3d8e585e271b67e10cc7c433-r17
>          │� �  ├── libzypp-0.0-git1+15b6c52260bbc52b3d8e585e271b67e10cc7c433-r17.tar.gz
>          │� �  └── log.tar.gz
>              ......
>
> if inheriting tar_archive.bbclass in one bb file, then only package source codes tree of this file.
> Take zlib for an example:
> Get source rpm pakcage of zlib
> 1 Inherit tar_archive.bbclass in zlib_1.2.5.bb.
> 2 Select the type of packaging source code tree in conf/local.conf(ARCHIVE_TYPE ?= "SRPM")
> 3 Run the following command
>    $ bitbake zlib
> 4 Get source rpm package:
>    $ ls build/tmp/work/i586-poky-linux/zlib-1.2.5-r3/deploy-srpm/i586/
>      zlib-1.2.5-r3.src.rpm
>
>
> Get tar package of zlib
> 1 Inherit tar_archive.bbclass in zlib_1.2.5.bb.
> 2 Select the type of packaging source code tree in conf/local.conf(ARCHIVE_TYPE ?= "TARGZ")
> 3 Run the following command
>    $ bitbake zlib
> 4 Get tar package:
>    $ ls build/tmp/work/i586-poky-linux/zlib-1.2.5-r3/
>      zlib-1.2.5-r3.tar.gz log.tar.gz ......
>
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: xiaofeng/1655
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/1655
>
> Thanks,
>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>
>
> Xiaofeng Yan (2):
>    package_rpm.bbclass: add srpm function in spec file
>    tar_archive.bbclass: Package source codes and log files to tar
>      package
>
>   meta/classes/package_rpm.bbclass |   65 ++++++++++--
>   meta/classes/tar_archive.bbclass |  216 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 271 insertions(+), 10 deletions(-)
>   create mode 100644 meta/classes/tar_archive.bbclass
>
>
Xiaofeng, Wenzong:

We are going to put a hold on both this patchset and Wenzong's patch 
set, due to the similarity of what is trying to be done. Both of these 
patches are creating tar archives of source and temp directories. While 
it is being done differently, we need to consolidate these changes.

The SRPM work can use the consolidated version.  As I mentioned in a 
prior email to Wenzong, there are also other classes such as 
copyleft_complaince.bbclass and src_distrbute.bbclass that we should 
look at and determine if they can be modified or extended.

Wenzong pointed out that copyleft does license checking, it can work for 
all sources depending on the settings of the INCLUDE/EXCLUDE variables, 
so it can be reused, it creates a source + patchset directory.

The sourcepgk.bbclass seems to be doing something different in creating 
a diff file (among other) of a given package between the unpack and 
post-patch, including the python functions and environmnet variables.

I (with Mark's help) will craft and updated document to address what we 
are want to accomplish, which is simplifing what we currently have with 
the goal to meet the commercial vendor's needs of supplying the source 
either patched or with a patchset that can be applied along with the 
configuration and build scripts for various license compliance.

Thanks for your initial work in this area, but we need to find a better 
overall approach without duplicating code/effort.

Sau!


>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


