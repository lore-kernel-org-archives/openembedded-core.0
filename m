Return-Path: <dbaryshkov@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id B1338770A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 13:28:25 +0000 (UTC)
Received: by ioll68 with SMTP id l68so91456606iol.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 06:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7UzBCHgrq+aWxip8bKVsmvX/AzPzhIzBNkYJgxymCJM=;
	b=UW4LDHemfTAcL0OUAVNxb/sgzWiO/HSBH3SldIFw5r+v67LWpZXFXgj2qCeTkHJyXc
	gPaSuEb9iIauVTbRhG9nUlk6avnGEguaR8VGTAmVJm6EF92BbKWkiTivnd2SM7wsxVMK
	8mDmnta2OP2E6MWs56+CwdiNXCSihPxMX2KFi5xfx7KuS1o6+jLloquFt818hZoK/o43
	QtHdHJBOrf75z4/VRXSn5MSvNrLVfWnoUqN4VTZQabiy+tfXlZrlWQ/IIgZ/U/U8Hg/a
	T2D1BWu8cWdV4i6okVhcRfF8l0B66DMsHry4q692S0na3fMUXoawZlF1AwTdntA2E4SC
	N1GQ==
MIME-Version: 1.0
X-Received: by 10.107.160.67 with SMTP id j64mr15145675ioe.128.1445520505254; 
	Thu, 22 Oct 2015 06:28:25 -0700 (PDT)
Received: by 10.64.21.232 with HTTP; Thu, 22 Oct 2015 06:28:25 -0700 (PDT)
In-Reply-To: <562501BF.6010202@windriver.com>
References: <1445264230-1126-1-git-send-email-dbaryshkov@gmail.com>
	<562501BF.6010202@windriver.com>
Date: Thu, 22 Oct 2015 16:28:25 +0300
Message-ID: <CALT56yP_6HL4vgFGkTMrqpzSnJmOXEv-=vP1Dz2YLJ7321jM4Q@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libsdl: support native compilation
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
X-List-Received-Date: Thu, 22 Oct 2015 13:28:27 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

2015-10-19 17:44 GMT+03:00 Mark Hatle <mark.hatle@windriver.com>:
> On 10/19/15 9:17 AM, Dmitry Eremin-Solenikov wrote:
>> qemu-native can use SDL backend for graphical output. Currently it is
>> expected to use libsdl provided by the host. However this can lead to
>> library incompatibilities between host and target. Make libsdl recipe
>> support native compilation.
>
> I don't object to the patch.. but we did have multiple problems in the past
> where libsdl (native) did not work with the host systems X11 or what-ever.
>
> Various failure conditions about not linking, linking to the wrong libsdl, or
> execution failing are what made us prefer the host system's libsdl -- or simply
> disabling libsdl altogether.

The issue that get me to this patch was an issue with linking of qemu.
Debian provides versioned symbols in libdbus, OE does not. Libdbus
from sysroot overrode system one. So system libsdl which used system-wide
libpulse* (which expected libdbus with versioned symbols) could not be linked
to the qemu.

Richard: this was tested on my system only. If you don't want to break things
before release, what about merging them after next Yocto/OE-Core release?

>
> --Mark
>
>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> ---
>>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
>> index c0d5c6a..c9f3e00 100644
>> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
>> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
>> @@ -17,6 +17,7 @@ DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d
>>             ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
>>             ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'libglu', '', d)} \
>>             tslib"
>> +DEPENDS_class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11-native libxrandr-native libxrender-native libxext-native', '', d)}"
>>  DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
>>
>>  PR = "r3"
>> @@ -65,4 +66,4 @@ do_configure_prepend() {
>>          export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
>>  }
>>
>> -BBCLASSEXTEND = "nativesdk"
>> +BBCLASSEXTEND = "native nativesdk"
>>
>



-- 
With best wishes
Dmitry

