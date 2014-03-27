Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC126F8C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 18:09:31 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id b6so3966442yha.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 11:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=FCX1L9Q3t/dt1SdqiuSQlk/Ey3qxqLdejhnOHUz689s=;
	b=mUddzeyAbqPLMuVbE7ce47+GE9HgJzkY96W84eWqRYJ3mX2RttypCJZv63QAoYW/5M
	63UP1R50uqMgaZ485QItndOI/L1GA0lJHW3hAlmjAC2h7J+/mN13qrcQZUfL6Ln+Ypxm
	wmt7TnKoJ7WY36y4wH8lD0HyxGW4dp3rESSZycTRarg1QvQd9H1KhdOvSNm5yrB1BHMP
	aSVqLfe9mVT4XH0OfKlMf9oUmzbY4Ufoi/VzLZjmpZC8OHeiNimmcgOL3gIbzuZahlrh
	I+7tdWXnDAFyvvsPlGc5FknHdTLr8Is+uYUtLwreFlWrlBEZmXnLqa9O+7Eh892vTCZi
	6ktw==
MIME-Version: 1.0
X-Received: by 10.236.40.12 with SMTP id e12mr2593887yhb.155.1395943772674;
	Thu, 27 Mar 2014 11:09:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Thu, 27 Mar 2014 11:09:32 -0700 (PDT)
In-Reply-To: <533419E9.3080509@intel.com>
References: <1395868053-27393-1-git-send-email-otavio@ossystems.com.br>
	<533419E9.3080509@intel.com>
Date: Thu, 27 Mar 2014 15:09:32 -0300
X-Google-Sender-Auth: tmd37outXi139thzt28WWdBbMY0
Message-ID: <CAP9ODKrUyfcP1vzEgYupPM-rg2jeE1VgPsP++Nh=fDeBuTjc7A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Valentin Popa <valentin.popa@intel.com>
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
X-List-Received-Date: Thu, 27 Mar 2014 18:09:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 27, 2014 at 9:30 AM, Valentin Popa <valentin.popa@intel.com> wrote:
> On 03/26/2014 11:07 PM, Otavio Salvador wrote:
>>
>> From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>>
>> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>   meta/recipes-graphics/wayland/weston_1.4.0.bb | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb
>> b/meta/recipes-graphics/wayland/weston_1.4.0.bb
>> index e0c354d..a41b5cd 100644
>> --- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
>> +++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
>> @@ -23,7 +23,6 @@ EXTRA_OECONF = "--enable-setuid-install \
>>                   --enable-simple-clients \
>>                   --enable-clients \
>>                   --enable-demo-clients-install \
>> -                --disable-simple-egl-clients \
>>                   --disable-libunwind \
>>                   --disable-rpi-compositor \
>>                   --disable-rdp-compositor"
>> @@ -39,7 +38,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES',
>> 'wayland', 'kms fbdev way
>>   # Weston on KMS
>>   PACKAGECONFIG[kms] =
>> "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa
>> mtdev"
>>   # Weston on Wayland (nested Weston)
>> -PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-egl
>> --disable-wayland-compositor,virtual/mesa"
>
>
> We need --disable-egl if wayland is not in DISTRO_FEATURES. See bug:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5867

As egl is not part of PACKAGECONFIG it will do the right thing, no?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

