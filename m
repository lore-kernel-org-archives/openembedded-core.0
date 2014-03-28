Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1385360E07
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 15:37:52 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id q9so3748257ykb.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 08:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=I1BMiqpz95RQYDde9OhKxfKuT3wc1H7W4VYYZmDorlQ=;
	b=OYR+xb8TR1hvOksjcsKAMfXzWMR9x1ez2+Bk76tsYEMkBPBXBL2WlFjC+CnDowWcLP
	zt0+JepA0wc/9YP+5yvI5zKEnDXfXHm+oj08eqPVU2Rj5Ju9zsPBrUr/VhJgwG0xhZGG
	lXFJpBK/wGIuv7mnEaBL4uyA8dM9ZSjCwqRCz2WLDgAb9O2gR/KYtPy+wSv4kYa70BP9
	yc5R9/EALsmFuqY1JvdyXOXT6kEJZxA7DR7IZ6uUrs9w/ru6ZwLQL6e54bA3ajxBQmeH
	iLE3/8eoNdBWGVhrGItcLze9mn0Z6ehFhC1DcZ6twz3z6fh9mcay59xXpj8GLcznzryd
	znsQ==
MIME-Version: 1.0
X-Received: by 10.236.40.12 with SMTP id e12mr1971162yhb.155.1396021073166;
	Fri, 28 Mar 2014 08:37:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Fri, 28 Mar 2014 08:37:53 -0700 (PDT)
In-Reply-To: <5335960D.7080600@intel.com>
References: <1396015357-27637-1-git-send-email-otavio@ossystems.com.br>
	<5335960D.7080600@intel.com>
Date: Fri, 28 Mar 2014 12:37:53 -0300
X-Google-Sender-Auth: 9kS2giGVO0CEUcTnieqTTSBxYvY
Message-ID: <CAP9ODKp3Lfya7a6vDjJb-3pxQ8U7dUX7U643uMGRQmEGTeQtpw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Valentin Popa <valentin.popa@intel.com>
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
X-List-Received-Date: Fri, 28 Mar 2014 15:37:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 28, 2014 at 12:32 PM, Valentin Popa <valentin.popa@intel.com> wrote:
> On 03/28/2014 04:02 PM, Otavio Salvador wrote:
>>
>> From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>>
>> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>   meta/recipes-graphics/wayland/weston_1.4.0.bb | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb
>> b/meta/recipes-graphics/wayland/weston_1.4.0.bb
>> index e0c354d..5213166 100644
>> --- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
>> +++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
>> @@ -23,13 +23,12 @@ EXTRA_OECONF = "--enable-setuid-install \
>>                   --enable-simple-clients \
>>                   --enable-clients \
>>                   --enable-demo-clients-install \
>> -                --disable-simple-egl-clients \
>>                   --disable-libunwind \
>>                   --disable-rpi-compositor \
>>                   --disable-rdp-compositor"
>>     -PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland',
>> 'kms fbdev wayland', '', d)} \
>> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms
>> fbdev wayland egl', '', d)} \
>>                      ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '',
>> d)} \
>>                      ${@base_contains('DISTRO_FEATURES', 'pam', 'launch',
>> '', d)} \
>>                     "
>> @@ -39,7 +38,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES',
>> 'wayland', 'kms fbdev way
>>   # Weston on KMS
>>   PACKAGECONFIG[kms] =
>> "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa
>> mtdev"
>>   # Weston on Wayland (nested Weston)
>> -PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-egl
>> --disable-wayland-compositor,virtual/mesa"
>> +PACKAGECONFIG[wayland] =
>> "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
>>   # Weston on X11
>>   PACKAGECONFIG[x11] =
>> "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb
>> libxcb libxcursor cairo"
>>   # Headless Weston
>> @@ -50,6 +49,10 @@ PACKAGECONFIG[fbdev] =
>> "--enable-fbdev-compositor,--disable-fbdev-compositor,ude
>>   PACKAGECONFIG[launch] =
>> "--enable-weston-launch,--disable-weston-launch,libpam drm"
>>   # VA-API desktop recorder
>>   PACKAGECONFIG[vaapi] =
>> "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
>> +# Weston with EGL support
>> +PACKAGECONFIG[egl] = "--enable-egl
>> --enable-simple-egl-clients,--disable-egl
>> --disable-simple-egl-clients,virtual/egl"
>> +# Weston with cairo glesv2 support
>> +PACKAGECONFIG[cairo-glesv2] =
>> "--with-cairo-glesv2,--with-cairo=image,cairo"
>>     do_install_append() {
>>         # Weston doesn't need the .la files to load modules, so wipe them
>
>
> Looks good to me.
> Sorry Otavio for the delay introduced by the discussions. Hope it will be
> merged quickly and get your issue solved :)

No problem; it was for the better and ensures we have a full
understanding of it :-) Please 'ack' it if you can.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

