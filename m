Return-Path: <drew.moseley@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <f01236ab-4fa1-94b7-e44d-fc43cfeb0fe5@gmail.com>
Date: Fri, 12 Aug 2022 11:20:37 -0400
MIME-Version: 1.0
Reply-To: drew@moseleynet.net
Subject: Re: [OE-core][PATCH v2] rng-tools: Replace obsolete "wants systemd-udev-settle"
References: <CAMKF1soSmZCBvJHYM4GPSUUjg9SY+ZuRuVC7phro1YryVadd4w@mail.gmail.com>
 <20220804150952.2831520-1-drew@moseleynet.net>
 <7ed692f7-cc83-9cf9-a278-e780be697c62@windriver.com>
From: "Drew Moseley" <drew.moseley@gmail.com>
In-Reply-To: <7ed692f7-cc83-9cf9-a278-e780be697c62@windriver.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org, raj.khem@gmail.com, ch@denx.de
Cc: Dragos-Marian Panait <dragos.panait@windriver.com>

Well dang. Any other suggestions on how to resolve the original issue 
without breaking others things?


Drew

On 8/12/22 8:59 AM, Dragos-Marian Panait wrote:
> It seems that this change introduced a boot delay for qemux86-64 + 
> systemd build.
>
> Steps:
>
> git clone git://git.yoctoproject.org/poky
> . poky/oe-init-build-env
>
> add to conf/local.conf:
>
> DISTRO_FEATURES:remove = " sysvinit"
> DISTRO_FEATURES:append = " systemd"
> VIRTUAL-RUNTIME_init_manager = "systemd"
> DISTRO_FEATURES_BACKFILL_CONSIDERED = ""
>
> bitbake core-image-full-cmdline
>
> Cause of boot delay:
> [ TIME ] Timed out waiting for device /dev/hwrng.
> [DEPEND] Dependency failed for Hard…e RNG Entropy Gatherer Daemon.
>
> Regards,
> Dragos
>
> On 04.08.2022 18:09, Drew Moseley wrote:
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> From: Drew Moseley <drew@moseleynet.net>
>>
>> The systemd-udev-settle service is listed as obsolete and does in
>> some cases result in a significant boot time.  Replace that with a
>> specific wait for the random source hardware device to be loaded.
>>
>> Before this change:
>>
>>     Startup finished in 4.025s (kernel) + 2min 13.236s (userspace) = 
>> 2min 17.262s
>>     multi-user.target reached after 2min 8.153s in userspace
>>
>> After this change:
>>
>>     Startup finished in 3.956s (kernel) + 13.294s (userspace) = 17.250s
>>     multi-user.target reached after 9.522s in userspace
>>
>> Signed-off-by: Drew Moseley <drew@moseleynet.net>
>> ---
>>   meta/recipes-support/rng-tools/rng-tools/rngd.service | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service 
>> b/meta/recipes-support/rng-tools/rng-tools/rngd.service
>> index 568686e80e..0f50890dcb 100644
>> --- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
>> +++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
>> @@ -3,7 +3,8 @@ Description=Hardware RNG Entropy Gatherer Daemon
>>   DefaultDependencies=no
>>   After=systemd-udev-settle.service
>>   Before=sysinit.target shutdown.target
>> -Wants=systemd-udev-settle.service
>> +Requires=dev-hwrng.device
>> +After=dev-hwrng.device
>>   Conflicts=shutdown.target
>>
>>   [Service]
>> -- 
>> 2.37.1
>>
>>
>> 
>>
-- 
mailto:drew@moseleynet.net

