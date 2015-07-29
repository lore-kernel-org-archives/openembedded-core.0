Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE8F7601F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 01:52:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T1qGkv029563
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Jul 2015 18:52:16 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 28 Jul 2015 18:51:59 -0700
Message-ID: <55B831CE.9090802@windriver.com>
Date: Wed, 29 Jul 2015 09:52:14 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
References: <cover.1438074266.git.liezhi.yang@windriver.com>
	<d2fde8961c75893e53e9cacdbadcfedf69bcca3b.1438074266.git.liezhi.yang@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB44B6C087@irsmsx105.ger.corp.intel.com>
	<20150728141603.GC2465@jama>
	<969F26A8BAB325438E7EB80D3C3134FB44B6C0FD@irsmsx105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB44B6C0FD@irsmsx105.ger.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] qemu_git.bb: remove it
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
X-List-Received-Date: Wed, 29 Jul 2015 01:52:18 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 07/28/2015 10:33 PM, Iorga, Cristian wrote:
> I am not in the habit of talking without knowing. Usually.
> There might be exceptions. This is not one.
> That being said, I was able to switch to qemu git recipe (instead of the tarball releases) and make it work for a git head just before 2.4.0RC0 in under 20 minutes.
> The patch was not submitted for inclusion into master however.
> I am not sure why the git recipe bothers everyone that much in this specific case, when I just explained that it was quite useful for me (and by extension, to the project).

Hi Cristian,

The problem is that it is broken, we need try to avoid shipping
broken recipes to confuse the end user, you can fix it to make it
work, but qemu 1.3 and 2.4 have different configure options,
you will get warnings about unknown configure options, so you need
move a few PACKAGECONFIGs from qemu.inc to qemu_2.4.bb to fix
the warnings, that seems not worth, so I removed it, if you do
like qemu_git.bb recipes, I think that you can upgrade it to
2.4.0-rc2 and replace qemu_2.4.0-rc2.bb.

// Robert


> Thanks,
> Cristian
>
> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Tuesday, July 28, 2015 5:16 PM
> To: Iorga, Cristian
> Cc: Yang, Liezhi (Wind River); openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 3/3] qemu_git.bb: remove it
>
> On Tue, Jul 28, 2015 at 02:04:28PM +0000, Iorga, Cristian wrote:
>> Hi Robert,
>>
>> Hmm,
>> Qemu git recipe is useful, and is close to being up to date, why to remove it??
>
> Close to being up to date? Aren't you talking about ./meta/recipes-devtools/qemu/qemu_2.4.0-rc2.bb?
>
> bitbake@jama:/OE/webos/ow/oe-core$ find . -name qemu\*bb -exec grep PV.*= {} \; REALPV = "2.4.0-rc2"
> PV = "2.3.99+${REALPV}"
> PV = "1.3.0+git${SRCPV}"
>
> As Robert said, 1.3 version is old and current qemu_git recipe broken, because 04024dea2674861fcf13582a77b58130c67fccd8 isn't in master branch anymore after it was moved to stable-1.3 branch:
>
> bitbake@jama:/OE/projects/qemu$ git branch -a --contains 04024dea2674861fcf13582a77b58130c67fccd8
>    remotes/origin/stable-1.3
>
>> Qemu brakes quite often, as seen recently on autobuilders, building
>> from git allowed us to move forward (although it is true that the git upgrade was not integrated into master.) I vote against this patch.
>
> Regards,
>>
>> Thanks,
>> Cristian
>>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Robert Yang
>> Sent: Tuesday, July 28, 2015 12:05 PM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 3/3] qemu_git.bb: remove it
>>
>> Remove it since we have 2.4.0, the git version is 1.3 can't be built
>> by
>> deafult:
>> ERROR: Fetcher failure: Unable to find revision
>> 04024dea2674861fcf13582a77b58130c67fccd8 in branch master even from
>> upstream
>>
>> We can fix it, but seems that no one uses it any more.
>>
>> And move patches from "files" dir to "qemu" dir.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   ...-Arm-versatilepb-Add-memory-size-checking.patch |    0
>>   .../exclude-some-arm-EABI-obsolete-syscalls.patch  |    0
>>   .../qemu-enlarge-env-entry-size.patch              |    0
>>   meta/recipes-devtools/qemu/qemu_git.bb             |   15 ---------------
>>   4 files changed, 15 deletions(-)
>>   rename meta/recipes-devtools/qemu/{files =>
>> qemu}/Qemu-Arm-versatilepb-Add-memory-size-checking.patch (100%)
>> rename meta/recipes-devtools/qemu/{files =>
>> qemu}/exclude-some-arm-EABI-obsolete-syscalls.patch (100%)  rename
>> meta/recipes-devtools/qemu/{files =>
>> qemu}/qemu-enlarge-env-entry-size.patch (100%)  delete mode 100644
>> meta/recipes-devtools/qemu/qemu_git.bb
>>
>> diff --git
>> a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-siz
>> e-checking.patch
>> b/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-size
>> -checking.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-
>> checking.patch rename to
>> meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-size-c
>> hecking.patch diff --git
>> a/meta/recipes-devtools/qemu/files/exclude-some-arm-EABI-obsolete-sysc
>> alls.patch
>> b/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-sysca
>> lls.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/qemu/files/exclude-some-arm-EABI-obsolete-syscal
>> ls.patch rename to
>> meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscall
>> s.patch diff --git
>> a/meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size.patch
>> b/meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size.patch
>> rename to
>> meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch
>> diff --git a/meta/recipes-devtools/qemu/qemu_git.bb
>> b/meta/recipes-devtools/qemu/qemu_git.bb
>> deleted file mode 100644
>> index a30932a..0000000
>> --- a/meta/recipes-devtools/qemu/qemu_git.bb
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -require qemu.inc
>> -
>> -SRCREV = "04024dea2674861fcf13582a77b58130c67fccd8"
>> -
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>> -                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
>> -
>> -PV = "1.3.0+git${SRCPV}"
>> -
>> -SRC_URI_prepend = "git://git.qemu.org/qemu.git"
>> -S = "${WORKDIR}/git"
>> -
>> -DEFAULT_PREFERENCE = "-1"
>> -
>> -COMPATIBLE_HOST_class-target_mips64 = "null"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>

