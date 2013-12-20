Return-Path: <valentin.popa@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2435360C24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 10:25:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 20 Dec 2013 02:25:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,519,1384329600"; d="scan'208";a="447524421"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.47])
	([10.237.105.47])
	by fmsmga001.fm.intel.com with ESMTP; 20 Dec 2013 02:25:01 -0800
Message-ID: <52B41B29.7080805@intel.com>
Date: Fri, 20 Dec 2013 12:25:45 +0200
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <1387462812-23194-1-git-send-email-valentin.popa@intel.com>
	<52B39115.2080008@linux.intel.com>
In-Reply-To: <52B39115.2080008@linux.intel.com>
Subject: Re: [PATCH] weston: for fbdev enabled distro feature, change WESTON_NATIVE_BACKEND
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
X-List-Received-Date: Fri, 20 Dec 2013 10:25:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/2013 02:36 AM, Saul Wold wrote:
> On 12/19/2013 06:20 AM, Valentin Popa wrote:
>> For builds with fbdev (no drm/kms), set
>> WESTON_NATIVE_BACKEND to "fbdev-backend.so"; doing this,
>> weston-launch will be able to know what backend to use.
>>
>> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
>> ---
>>   meta/recipes-graphics/wayland/weston_1.3.1.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/wayland/weston_1.3.1.bb 
>> b/meta/recipes-graphics/wayland/weston_1.3.1.bb
>> index d97f6af..4ab2776 100644
>> --- a/meta/recipes-graphics/wayland/weston_1.3.1.bb
>> +++ b/meta/recipes-graphics/wayland/weston_1.3.1.bb
>> @@ -45,7 +45,7 @@ PACKAGECONFIG[x11] = 
>> "--enable-x11-compositor,--disable-x11-compositor,virtual/l
>>   # Headless Weston
>>   PACKAGECONFIG[headless] = 
>> "--enable-headless-compositor,--disable-headless-compositor"
>>   # Weston on framebuffer
>> -PACKAGECONFIG[fbdev] = 
>> "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
>> +PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor 
>> WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev 
>> mtdev"
>
> Is this a more general way to do this as suggested by Koen back in May?
>
> +# Needed for weston-launch
> +WESTONBACKEND ??= "fbdev-backend.so"
> +
> +export WESTON_NATIVE_BACKEND = "${WESTONBACKEND}"
>
> See http://patches.openembedded.org/patch/50871/
>
> Sau!
Not sure of the context of that patch, but with this patch we have fbdev 
backend -only- if the user builds with fbdev distro feature.
I've tried to build with both kms and fbdev and failed at compile time 
(bug or feature).
>
>
>>   # weston-launch
>>   PACKAGECONFIG[launch] = 
>> "--enable-weston-launch,--disable-weston-launch,libpam"
>>   # VA-API desktop recorder
>>


