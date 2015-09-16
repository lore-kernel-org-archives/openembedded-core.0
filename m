Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3251B73D13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 02:08:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G28r5c029580
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 19:08:53 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 19:08:52 -0700
Message-ID: <55F8CF33.5050303@windriver.com>
Date: Wed, 16 Sep 2015 10:08:51 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1442311946.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1442311946.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/6] Fixes for mutilib SDK
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
X-List-Received-Date: Wed, 16 Sep 2015 02:08:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/16/2015 10:04 AM, Robert Yang wrote:
> * This fixed:
>    MACHINE = "qemux86-64"
>    require conf/multilib.conf
>    MULTILIBS = "multilib:lib32"
>    DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>
>    $ bitbake core-image-minimal -cpopulate_sdk
>    Install poky-glibc-x86_64-core-image-minimal-core2-64-toolchain-1.8+snapshot.sh,
>    then source environment-setup-core2-64-pokymllib32-linux or
>    environment-setup-core2-64-poky-linux, both of them will compile hello.c
>    well. (The 32bit was broken in the past)
>
>    $ bitbake lib32-core-image-minimal -cpopulate_sdk
>    Install poky-glibc-x86_64-lib32-core-image-minimal-core2-64-toolchain-1.8+snapshot.sh,
>    then source environment-setup-core2-64-poky-linux or
>    environment-setup-core2-64-pokymllib32-linux, both of them will compile
>    hello.c well (neither of them worked in the past)
>
>    This also fixed the problem that not all dependencies mutilib packages
>    are installed, please see:
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=4408

And also fixed this one:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=7610

Add IMAGE_INSTALL_append = " bash" to local.conf
$ bitbake lib32-core-image-minimal

32bit bash will be installed, but not 64bit.

Now 64 bit will be installed.

// Robert

>
> Tested:
> $ bitbake core-image-minimal core-image-sato -cpopulate_sdk && bitbake core-image-sato-sdk world core-image-minimal core-image-sato
>
> // Robert
>
> The following changes since commit f0189829498e30231d826c9f55aad73e622d076e:
>
>    qemu: Update to upstream patches (2015-09-14 11:22:02 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/sdk
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/sdk
>
> Robert Yang (6):
>    toolchain-shar-extract.sh: remove checkbashism
>    oe-pkgdata-util: avoid returning skipped packages
>    package_manager.py: make rpm install mutilib pkgs corectly
>    multilib.bbclass: install all bits toochains when populate mlprefix
>      SDK
>    populate_sdk_base.bbclass: fix SDKTARGETSYSROOT when populate
>      mlprefix SDK
>    meta-environment.bb: fix environment-setup* when populate mlprefix
>      SDK
>
>   meta/classes/multilib.bbclass              |   15 +++++
>   meta/classes/populate_sdk_base.bbclass     |    6 +-
>   meta/files/toolchain-shar-extract.sh       |    4 +-
>   meta/lib/oe/package_manager.py             |   83 +++++++++++++++++++++++++++-
>   meta/recipes-core/meta/meta-environment.bb |    4 ++
>   scripts/oe-pkgdata-util                    |    5 +-
>   6 files changed, 111 insertions(+), 6 deletions(-)
>

