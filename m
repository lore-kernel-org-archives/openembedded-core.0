Return-Path: <valentin.popa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C6834610CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 13:37:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Mar 2014 06:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,751,1389772800"; d="scan'208";a="508995537"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.76])
	([10.237.105.76])
	by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2014 06:37:19 -0700
Message-ID: <53357AFD.9080902@intel.com>
Date: Fri, 28 Mar 2014 15:37:01 +0200
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1395868053-27393-1-git-send-email-otavio@ossystems.com.br>	<533419E9.3080509@intel.com>	<CAP9ODKrUyfcP1vzEgYupPM-rg2jeE1VgPsP++Nh=fDeBuTjc7A@mail.gmail.com>	<533569B6.9090103@intel.com>	<CAP9ODKqwkv4yvcKPqMeHSuwKQ3UUzZCWLK6==o46G6wsqDkc_A@mail.gmail.com>	<53357916.3090108@intel.com>
	<CAP9ODKo6LmdrbUoXKjpwbVb4jcL5M4a4_tUAv1GdbwDSR-Cs6Q@mail.gmail.com>
In-Reply-To: <CAP9ODKo6LmdrbUoXKjpwbVb4jcL5M4a4_tUAv1GdbwDSR-Cs6Q@mail.gmail.com>
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston : refactor to identify EGL, cairoglesv2 support
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
X-List-Received-Date: Fri, 28 Mar 2014 13:37:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/28/2014 03:35 PM, Otavio Salvador wrote:
> On Fri, Mar 28, 2014 at 10:28 AM, Valentin Popa <valentin.popa@intel.com> wrote:
>> On 03/28/2014 02:53 PM, Otavio Salvador wrote:
>>> On Fri, Mar 28, 2014 at 9:23 AM, Valentin Popa <valentin.popa@intel.com>
>>> wrote:
>>>> On 03/27/2014 08:09 PM, Otavio Salvador wrote:
>>>>> On Thu, Mar 27, 2014 at 9:30 AM, Valentin Popa <valentin.popa@intel.com>
>>>>> wrote:
>>>>>> On 03/26/2014 11:07 PM, Otavio Salvador wrote:
>>>>>>> From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>>>>>>>
>>>>>>> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>>>>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>>>>>> ---
>>>>>>>      meta/recipes-graphics/wayland/weston_1.4.0.bb | 7 +++++--
>>>>>>>      1 file changed, 5 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>>>>>> b/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>>>>>> index e0c354d..a41b5cd 100644
>>>>>>> --- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>>>>>> +++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>>>>>> @@ -23,7 +23,6 @@ EXTRA_OECONF = "--enable-setuid-install \
>>>>>>>                      --enable-simple-clients \
>>>>>>>                      --enable-clients \
>>>>>>>                      --enable-demo-clients-install \
>>>>>>> -                --disable-simple-egl-clients \
>>>>>>>                      --disable-libunwind \
>>>>>>>                      --disable-rpi-compositor \
>>>>>>>                      --disable-rdp-compositor"
>>>>>>> @@ -39,7 +38,7 @@ PACKAGECONFIG ??=
>>>>>>> "${@base_contains('DISTRO_FEATURES',
>>>>>>> 'wayland', 'kms fbdev way
>>>>>>>      # Weston on KMS
>>>>>>>      PACKAGECONFIG[kms] =
>>>>>>> "--enable-drm-compositor,--disable-drm-compositor,drm udev
>>>>>>> virtual/mesa
>>>>>>> mtdev"
>>>>>>>      # Weston on Wayland (nested Weston)
>>>>>>> -PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-egl
>>>>>>> --disable-wayland-compositor,virtual/mesa"
>>>>>>
>>>>>> We need --disable-egl if wayland is not in DISTRO_FEATURES. See bug:
>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5867
>>>>> As egl is not part of PACKAGECONFIG it will do the right thing, no?
>>>>>
>>>> Yes, it will. My concerns are about --enable-drm-compositor (kms) without
>>>> egl; I know that the user can pass at runtime the --use-pixman flag,  but
>>>> I
>>>> think it's more important to keep egl enabled by default in weston (this
>>>> is
>>>> probably the main "usecase" of wayland/weston). So if you enable egl, the
>>>> bug will reproduce.
>>> The PACKAGECONFIG is for flexibility and so we are using it here as it
>>> is designed. I understand we still don't have a way to map config
>>> dependencies but this is no excuse to say the patch is wrong or
>>> inappropriate.
>>>
>>> We are using this in the upcoming i.MX6 Wayland support we sent to
>>> meta-fsl-arm and the only blocker is this patch be accepted.
>>>
>> The patch is not wrong, but disables egl. Looks good to me and if merged
>> I'll submit a patch to add egl in PACKAGECONFIG.
> If you want, I can add the egl there, and send v2. That's easy.
>

That would be great. And don't forget to --disable-egl in case wayland 
is not in PACKAGECONFIG.
Thanks!

