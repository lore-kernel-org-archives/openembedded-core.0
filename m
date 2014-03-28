Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E2C9D60E07
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 15:45:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Mar 2014 08:45:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,751,1389772800"; d="scan'208";a="509069939"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.76])
	([10.237.105.76])
	by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2014 08:45:05 -0700
Message-ID: <533598EF.2000701@intel.com>
Date: Fri, 28 Mar 2014 17:44:47 +0200
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1396015357-27637-1-git-send-email-otavio@ossystems.com.br>	<5335960D.7080600@intel.com>
	<CAP9ODKp3Lfya7a6vDjJb-3pxQ8U7dUX7U643uMGRQmEGTeQtpw@mail.gmail.com>
In-Reply-To: <CAP9ODKp3Lfya7a6vDjJb-3pxQ8U7dUX7U643uMGRQmEGTeQtpw@mail.gmail.com>
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] weston : refactor to identify EGL, cairoglesv2 support
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
X-List-Received-Date: Fri, 28 Mar 2014 15:45:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/28/2014 05:37 PM, Otavio Salvador wrote:
> On Fri, Mar 28, 2014 at 12:32 PM, Valentin Popa <valentin.popa@intel.com> wrote:
>> On 03/28/2014 04:02 PM, Otavio Salvador wrote:
>>> From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>>>
>>> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>> ---
>>>    meta/recipes-graphics/wayland/weston_1.4.0.bb | 9 ++++++---
>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>> b/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>> index e0c354d..5213166 100644
>>> --- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>> +++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>> @@ -23,13 +23,12 @@ EXTRA_OECONF = "--enable-setuid-install \
>>>                    --enable-simple-clients \
>>>                    --enable-clients \
>>>                    --enable-demo-clients-install \
>>> -                --disable-simple-egl-clients \
>>>                    --disable-libunwind \
>>>                    --disable-rpi-compositor \
>>>                    --disable-rdp-compositor"
>>>      -PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland',
>>> 'kms fbdev wayland', '', d)} \
>>> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms
>>> fbdev wayland egl', '', d)} \
>>>                       ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '',
>>> d)} \
>>>                       ${@base_contains('DISTRO_FEATURES', 'pam', 'launch',
>>> '', d)} \
>>>                      "
>>> @@ -39,7 +38,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES',
>>> 'wayland', 'kms fbdev way
>>>    # Weston on KMS
>>>    PACKAGECONFIG[kms] =
>>> "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa
>>> mtdev"
>>>    # Weston on Wayland (nested Weston)
>>> -PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-egl
>>> --disable-wayland-compositor,virtual/mesa"
>>> +PACKAGECONFIG[wayland] =
>>> "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
>>>    # Weston on X11
>>>    PACKAGECONFIG[x11] =
>>> "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb
>>> libxcb libxcursor cairo"
>>>    # Headless Weston
>>> @@ -50,6 +49,10 @@ PACKAGECONFIG[fbdev] =
>>> "--enable-fbdev-compositor,--disable-fbdev-compositor,ude
>>>    PACKAGECONFIG[launch] =
>>> "--enable-weston-launch,--disable-weston-launch,libpam drm"
>>>    # VA-API desktop recorder
>>>    PACKAGECONFIG[vaapi] =
>>> "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
>>> +# Weston with EGL support
>>> +PACKAGECONFIG[egl] = "--enable-egl
>>> --enable-simple-egl-clients,--disable-egl
>>> --disable-simple-egl-clients,virtual/egl"
>>> +# Weston with cairo glesv2 support
>>> +PACKAGECONFIG[cairo-glesv2] =
>>> "--with-cairo-glesv2,--with-cairo=image,cairo"
>>>      do_install_append() {
>>>          # Weston doesn't need the .la files to load modules, so wipe them
>>
>> Looks good to me.
>> Sorry Otavio for the delay introduced by the discussions. Hope it will be
>> merged quickly and get your issue solved :)
> No problem; it was for the better and ensures we have a full
> understanding of it :-) Please 'ack' it if you can.
>
Acked-by: valentin.popa@intel.com.


