Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 378C66E89C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 09:35:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1P9ZDqp029314
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Feb 2014 01:35:13 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 25 Feb 2014 01:35:13 -0800
Message-ID: <530C63CF.6090404@windriver.com>
Date: Tue, 25 Feb 2014 17:35:11 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Valentin Popa <valentin.popa@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1393233958.git.liezhi.yang@windriver.com>	<641185084afb8d76865faa13879547f8e546e553.1393233958.git.liezhi.yang@windriver.com>
	<530B5AD0.5010708@intel.com> <530B6566.3090804@intel.com>
In-Reply-To: <530B6566.3090804@intel.com>
Subject: Re: [PATCH 1/1] weston: disable-egl when no wayland
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
X-List-Received-Date: Tue, 25 Feb 2014 09:35:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/24/2014 11:29 PM, Valentin Popa wrote:
> On 02/24/2014 04:44 PM, Valentin Popa wrote:
>> On 02/24/2014 11:26 AM, Robert Yang wrote:
>>> There was a configure error when build weston without wayland:
>>>
>>> configure: error: Package requirements (egl >= 7.10 glesv2 wayland-client
>>> wayland-egl) were not met:
>>>
>>> No package 'wayland-egl' found
>>>
>>> [YOCTO #5867]
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   meta/recipes-graphics/wayland/weston_1.4.0.bb |    2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>> b/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>> index 5c389a0..e0c354d 100644
>>> --- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>> +++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>> @@ -39,7 +39,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES',
>>> 'wayland', 'kms fbdev way
>>>   # Weston on KMS
>>>   PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm
>>> udev virtual/mesa mtdev"
>>>   # Weston on Wayland (nested Weston)
>>> -PACKAGECONFIG[wayland] =
>>> "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
>>> +PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-egl
>>> --disable-wayland-compositor,virtual/mesa"
>>>   # Weston on X11
>>>   PACKAGECONFIG[x11] =
>>> "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb
>>> libxcb libxcursor cairo"
>>>   # Headless Weston
>> How did you build weston without wayland?
>> Have you built wayland without libwayland-egl and then tried to build weston?
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> I got it, so you are building with :
> DISTRO_FEATURES_remove="wayland"
> DISTRO_FEATURES_append = " x11"
>
> and mesa doesn't build libwayland-egl, but weston checks for EGL.
>
> Looks good to me, but the subject/message is not so clear. Can you please modify
> it and resend?
>

Thanks, I updated the subject to:

weston: fix build without wayland in distro_features

And also updated the repo:

git://git.pokylinux.org/poky-contrib rbt/weston


// Robert

> Thanks!
>
>
>
>

