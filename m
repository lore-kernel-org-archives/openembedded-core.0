Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F05C078F72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 01:51:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00M1o81C011281
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 21 Jan 2020 17:50:18 -0800
Received: from [128.224.162.144] (128.224.162.144) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 21 Jan 2020 17:49:57 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20200121071906.1102-1-mingli.yu@windriver.com>
	<CAMKF1sr6vSk8U5pVhgnwFW8HTsA7VGKc0trS=2t7XLuoJZXcaQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5E27AAA5.6070004@windriver.com>
Date: Wed, 22 Jan 2020 09:51:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr6vSk8U5pVhgnwFW8HTsA7VGKc0trS=2t7XLuoJZXcaQ@mail.gmail.com>
X-Originating-IP: [128.224.162.144]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-common.inc: disable orc on mips
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
X-List-Received-Date: Wed, 22 Jan 2020 01:51:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/22/20 02:36, Khem Raj wrote:
> On Mon, Jan 20, 2020 at 11:19 PM <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> After transiton to meson build for gstreamer series,
>> for gstreamer1.0-plugins-base, with below two commits
>> introduced:
>> 238080ed89 gstreamer: Remove unused common files and patches
>> 20614408dc gstreamer1.0-plugins-base: Transition to meson based builds
>>
>> With below config in local.conf
>> MACHINE ??= "qemumips64"
>> require conf/multilib.conf
>> MULTILIB_GLOBAL_VARIANTS_append = " libn32"
>> MULTILIBS ?= "multilib:lib32 multilib:libn32"
>> DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
>> DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
>>
>> there comes below failure:
>> $ bitbake lib32-gstreamer1.0-plugins-base
>> [snip]
>> mips-pokymllib32-linux-gcc -meb -mabi=32 -mhard-float -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-base/1.16.1-r0/lib32-recipe-sysroot -Itests/check/7d01337@@orc_video@exe -Itests/check -I../gst-plugins-base-1.16.1/tests/check -I/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-base/1.16.1-r0/lib32-recipe-sysroot/usr/include/orc-0.4 -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -fvisibility=hidden -fno-strict-aliasing -DG_DISABLE_CAST_CHECKS -Wmissing-declarations -Wredundant-decls -Wundef -Wwrite-strings -Wformat -Wformat-nonliteral -Wformat-security -Winit-self -Wmissing-include-dirs -Waddress -Wno-multichar -Wvla -Wpointer-arith -Wmissing-prototypes -Wdeclaration-after-statement -O2 -g -feliminate-unused-debug-types -fmacro-prefix-map=/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-base/1.16.1-r!
 0=/u
>>   sr/src/debug/lib32-gstreamer1.0-plugins-base/1.16.1-r0 -fdebug-prefix-map=/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-base/1.16.1-r0=/usr/src/debug/lib32-gstreamer1.0-plugins-base/1.16.1-r0 -fdebug-prefix-map=/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-base/1.16.1-r0/lib32-recipe-sysroot= -fdebug-prefix-map=/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-base/1.16.1-r0/recipe-sysroot-native= -MD -MQ 'tests/check/7d01337@@orc_video@exe/meson-generated_.._orc_video.c.o' -MF 'tests/check/7d01337@@orc_video@exe/meson-generated_.._orc_video.c.o.d' -o 'tests/check/7d01337@@orc_video@exe/meson-generated_.._orc_video.c.o' -c tests/check/orc_video.c
>> FAILED: tests/check/7d01337@@orc_video@exe/meson-generated_.._orc_video.c.o
>> {standard input}: Assembler messages:
>> {standard input}:46587: Error: branch out of range
>> {standard input}:46613: Error: branch out of range
>> [snip]
>>
>> BTW, gstreamer1.0-plugins-good also occurs
>> the same build failure as above.
>
> I think there is some difference in behavior that meson migration has
> brought. It will be good to see compiler cmdline for same file on zeus
> e.g. perhaps we missed some flags

Hi Khem,

Thanks your respond!

Yes, it should be some different behavior I guess after migration to 
meson. Have compared basically for the flags before I sent the patch 
actually and didn't find the apparent difference. I prefer disable the 
orc first on mips.

Hi Carlos,

Any suggestion?

>
>>
>> Disable orc as workaround to fix the above issue
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../findutils/{findutils_4.6.0.bb => findutils_4.7.0.bb}     | 0
>>   .../gstreamer/gstreamer1.0-plugins-common.inc                | 5 ++++-
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>   rename meta/recipes-extended/findutils/{findutils_4.6.0.bb => findutils_4.7.0.bb} (100%)
>>
>> diff --git a/meta/recipes-extended/findutils/findutils_4.6.0.bb b/meta/recipes-extended/findutils/findutils_4.7.0.bb
>> similarity index 100%
>> rename from meta/recipes-extended/findutils/findutils_4.6.0.bb
>> rename to meta/recipes-extended/findutils/findutils_4.7.0.bb
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
>> index ccf55500a9..3896424b2d 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
>> @@ -18,7 +18,10 @@ require gstreamer1.0-plugins-packaging.inc
>>   # This value is used in the PACKAGECONFIG values for each plugin set recipe.
>>   # By modifying it, Orc can be enabled/disabled in all of these recipes at once.
>>   GSTREAMER_ORC ?= "orc"
>> -
>> +# workaround to disable orc on mips to fix the build failure
>> +# {standard input}: Assembler messages:
>> +# {standard input}:46587: Error: branch out of range
>> +GSTREAMER_ORC_remove_mips = "orc"
>
> No need to remove set it
> GSTREAMER_ORC_mips = ""

Okay, will sent v3 to include the change.

Thanks,

>
>>   PACKAGECONFIG[orc] = "-Dorc=enabled,-Dorc=disabled,orc orc-native"
>>
>>   # TODO: put this in a gettext.bbclass patch (with variables to allow for
>> --
>> 2.23.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

