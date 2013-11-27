Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B868A6C73C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 07:04:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAR74cFk005939
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Nov 2013 23:04:38 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 26 Nov 2013 23:04:37 -0800
Message-ID: <52959982.2000808@windriver.com>
Date: Wed, 27 Nov 2013 15:04:34 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1383374625.git.hongxu.jia@windriver.com>	
	<6e13abdbda165f1e5d7c15b6db6ea11277cde521.1383374625.git.hongxu.jia@windriver.com>
	<1385468343.11246.2.camel@ted>
In-Reply-To: <1385468343.11246.2.camel@ted>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] qemu: add PACKAGECONFIG for vnc, libcurl, nss, uuid, curses, gtk+, libcap-ng
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
X-List-Received-Date: Wed, 27 Nov 2013 07:04:41 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/2013 08:19 PM, Richard Purdie wrote:
> On Sat, 2013-11-02 at 14:52 +0800, Hongxu Jia wrote:
>> Use PACKAGECONFIG to explicitly address vnc, libcurl, nss, uuid, curses, gtk+,
>> libcap-ng dependencies rather than tested by configure.
>>
>> It avoided potential errors while multiple builds shared a common state_cache.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-devtools/qemu/qemu.inc | 19 ++++++++++++++++---
>>   1 file changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>> index 1b861d7..be0495a 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -28,10 +28,9 @@ SRC_URI_append_class-native = "\
>>       file://fix-libcap-header-issue-on-some-distro.patch \
>>       "
>>   
>> -EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman --extra-cflags='${CFLAGS}'"
>> +EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --audio-drv-list=oss,alsa --disable-bluez --with-system-pixman --extra-cflags='${CFLAGS}'"
>>   
>> -EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
>> -				--disable-curl \
>> +EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
>>   				"
>>   export LIBTOOL="${HOST_SYS}-libtool"
>>   
>> @@ -80,9 +79,23 @@ do_install_append() {
>>   }
>>   # END of qemu-mips workaround
>>   
>> +# Disable the following PACKAGECONFIG varflag by default. Such as graphics is
>> +# disabled for qemu-native, if you need to enable some of them for qemu-native,
>> +# set PACKAGECONFIG_pn-qemu-native += "varflag1 varflag2" in local.conf
>>   PACKAGECONFIG ??= ""
>>   PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
>>   PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
>> +PACKAGECONFIG[vnc-tls] = "--enable-vnc --enable-vnc-tls,--disable-vnc-tls, gnutls,"
>> +PACKAGECONFIG[vnc-ws] = "--enable-vnc --enable-vnc-ws,--disable-vnc-ws, gnutls,"
>> +PACKAGECONFIG[vnc-sasl] = "--enable-vnc --enable-vnc-sasl,--disable-vnc-sasl,cyrus-sasl,"
>> +PACKAGECONFIG[vnc-jpeg] = "--enable-vnc --enable-vnc-jpeg,--disable-vnc-jpeg,jpeg,"
>> +PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng,"
>> +PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
>> +PACKAGECONFIG[nss] = "--enable-smartcard-nss,--disable-smartcard-nss,nss,"
>> +PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
>> +PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
>> +PACKAGECONFIG[gtk+] = "--enable-gtk,--disable-gtk,gtk+ libvte,"
>> +PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
>>   
>>   # Qemu target will not build in world build for ARM or Mips
>>   BROKEN_qemuarm = "1"
> I merged this however I notice there are "yet more" floating
> dependencies since sdl is floating (at least).
>
> For sdl, can we add the PACKAGECONFIG option however also add an entry
> to local.conf.sample which documents how to enable sdl for qemu-native?

Got it, I will work on it.

//Hongxu


> I suspect that is the option most people are using to make runqemu
> useful. We may also want to have the option of assuming libsdl-native is
> provided since otherwise we end up in the tangled world of GL support
> and we don't want to build our own libsdl-native in most cases.
>
> Cheers,
>
> Richard
>
>
>
>


