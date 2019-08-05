Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F2F717F338
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 07:18:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x757I5cQ015812
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Aug 2019 00:18:05 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 5 Aug 2019 00:18:04 -0700
To: OE-core <openembedded-core@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <2194f82b-9dae-7941-9ba9-4492a3ca0d2d@windriver.com>
Date: Mon, 5 Aug 2019 15:18:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
X-Originating-IP: [128.224.162.186]
Subject: populate_sdk failed when multilib enabled
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
X-List-Received-Date: Mon, 05 Aug 2019 07:18:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi, All

bitbake core-image-minimal -c populate_sdk failed with below 
configuration in local.conf:

IMAGE_INSTALL_append = " bash"

require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

I did some research, but no clue how to fix,  so I want to get some help 
from community.

Error info:

core-image-minimal-1.0-r0 do_populate_sdk: Could not invoke dnf. Command 
'/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/dnf 
-v --rpmverbosity=info -y -c 
/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/sdk/image/opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux/etc/dnf/dnf.conf 
--setopt=reposdir=/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/sdk/image/opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux/etc/yum.repos.d 
--installroot=/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/sdk/image/opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux 
--setopt=logdir=/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp 
--repofrompath=oe-repo,/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/oe-sdk-repo 
--nogpgcheck install lib32-packagegroup-core-standalone-sdk-target 
run-postinsts bash packagegroup-core-standalone-sdk-target 
packagegroup-core-boot target-sdk-provides-dummy' returned 1:

Error:
  Problem: package 
target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts 
with /bin/sh provided by bash-5.0-r0.core2_64
   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
conflicts with bash provided by bash-5.0-r0.core2_64
   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
conflicts with /bin/bash provided by bash-5.0-r0.core2_64
   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
obsoletes bash provided by bash-5.0-r0.core2_64
   - cannot install the best candidate for the job
   - conflicting requests
(try to add '--allowerasing' to command line to replace conflicting 
packages or '--skip-broken' to skip uninstallable packages or '--nobest' 
to use not only best candidate packages)

Some other info:

1. package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
and bash-5.0-r0.core2_64 both provides /bin/sh and /bin/bash,  but if 
removed above multilib related 3lines in local.conf, populate_sdk will 
success.

I don't understand why it failed with multilib enabled, since no matter 
if multilib is enabled, package target-sdk-provides-dummy and bash will 
both provides /bin/sh and /bin/bash, but error only occurred when 
multilib enabled.

2.with multilib enabled,  in bitbake core-image-minimal -c devshell,  run:

/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/dnf 
-v --rpmverbosity=info -y -c 
/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/sdk/image/opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux/etc/dnf/dnf.conf 
--setopt=reposdir=/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/sdk/image/opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux/etc/yum.repos.d 
--installroot=/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/sdk/image/opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux 
--setopt=logdir=/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp 
--repofrompath=oe-repo,/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/oe-sdk-repo 
--nogpgcheck provides /bin/bash
DNF version: 4.2.2
cachedir: 
/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/sdk/image/opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux/var/cache/dnf
Added oe-repo repo from 
/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/oe-sdk-repo
repo: using cache for: oe-repo
not found other for:
not found modules for:
not found deltainfo for:
not found updateinfo for:
oe-repo: using metadata from Mon 05 Aug 2019 04:00:20 AM UTC.
Last metadata expiration check: 1:30:06 ago on Mon 05 Aug 2019 04:00:23 
AM UTC.
No module defaults found
Searching Packages:
bash-5.0-r0.core2_64 : An sh-compatible command language interpreter
Repo        : oe-repo
Matched from:
Provide    : /bin/bash

target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target : Dummy 
packages which handle excluding packages from the sdk, e.g. ensuring 
perl is excluded from buildtools
Repo        : oe-repo
Matched from:
Provide    : /bin/bash

BUT,  if multilib is disabled, the cmd will return no matches.

3.  here is  configs under 
/yocto/builds/sysV/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/sdk/image/opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux/etc/dnf/

  tree
.
├── dnf.conf
└── vars
     ├── arch
     └── releasever

$ cat dnf.conf

$ cat vars/arch
core2_64:x86_64:sdk_provides_dummy_target:qemux86_64:x86

$ cat vars/releasever
master




-- 
BRs

Sandy(Li Changqing)


