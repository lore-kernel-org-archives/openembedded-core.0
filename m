Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 14A1A6D887
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 10:10:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rADAArpJ009269
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 02:10:53 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 13 Nov 2013 02:10:53 -0800
Message-ID: <5283501D.7010709@windriver.com>
Date: Wed, 13 Nov 2013 18:10:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <Chong.Lu@windriver.com>
References: <1384330318-14702-1-git-send-email-Chong.Lu@windriver.com>
	<1384333844.6460.79.camel@ted>
In-Reply-To: <1384333844.6460.79.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Fix QA warnings about ALTERNATIVES
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
X-List-Received-Date: Wed, 13 Nov 2013 10:10:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/13/2013 05:10 PM, Richard Purdie wrote:
> On Wed, 2013-11-13 at 16:11 +0800, Chong.Lu@windriver.com wrote:
>> From: Lu Chong <Chong.Lu@windriver.com>
>>
>> Previously, EXTRA_OECONF would be overwritten by EXTRA_OECONF_class-native
>> and EXTRA_OECONF_class-nativesdk when we executed `make export-sdk' command.
>
> We don't have an export-sdk command do we?
>

Hi RP,

Sorry, "make export-sdk" is a wrlinux command, which is equivlant to
do_populate_sdk, Chong is a new guy, sorry for the confusion:-)

// Robert

>> As a result, some applications such as `last', `mesg' and `reset' didn't get
>> compiled.
>>
>> The patch rewrote EXTRA_OECONF_class-native and EXTRA_OECONF_class-nativesdk
>> variables to fix QA warnings.
>>
>> usr/share/man/man1/last.1.util-linux does not exist
>> usr/share/man/man1/mesg.1.util-linux does not exist
>> usr/bin/last.util-linux does not exist
>> usr/bin/mesg.util-linux does not exist
>> bin/reset does not exist
>>
>> Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
>> ---
>>   meta/recipes-core/util-linux/util-linux_2.23.2.bb |   22 +++++++++++++++++++--
>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux_2.23.2.bb b/meta/recipes-core/util-linux/util-linux_2.23.2.bb
>> index b5c221b..b9cdc61 100644
>> --- a/meta/recipes-core/util-linux/util-linux_2.23.2.bb
>> +++ b/meta/recipes-core/util-linux/util-linux_2.23.2.bb
>> @@ -18,5 +18,23 @@ SRC_URI[md5sum] = "39a02ad0b3b37824c394f40930b7aa38"
>>   SRC_URI[sha256sum] = "6c5be3f7beec91b4893de14bbd722886fa2521be5bfa0fc079b749d0018633b1"
>>
>>   CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
>> -EXTRA_OECONF_class-native += "--disable-fallocate --disable-use-tty-group"
>> -EXTRA_OECONF_class-nativesdk += "--disable-fallocate --disable-use-tty-group"
>> +EXTRA_OECONF_class-native = "--disable-use-tty-group \
>> +                             --disable-makeinstall-chown --enable-elvtune --enable-init \
>> +                             --enable-kill --enable-last --enable-mesg --enable-partx \
>> +                             --enable-raw --enable-rdev --enable-reset --disable-login \
>> +                             --disable-vipw --disable-newgrp --disable-chfn-chsh \
>> +                             --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
>> +                             --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
>> +                             usrsbin_execdir='${sbindir}' \
>> +                             --disable-fallocate --disable-use-tty-group \
>> +"
>> +EXTRA_OECONF_class-nativesdk = "--disable-use-tty-group \
>> +                                --disable-makeinstall-chown --enable-elvtune --enable-init \
>> +                                --enable-kill --enable-last --enable-mesg --enable-partx \
>> +                                --enable-raw --enable-rdev --enable-reset --disable-login \
>> +                                --disable-vipw --disable-newgrp --disable-chfn-chsh \
>> +                                --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
>> +                                --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
>> +                                usrsbin_execdir='${sbindir}' \
>> +                                --disable-fallocate --disable-use-tty-group \
>> +"
>
> We are not duplicating EXTRA_OECONF like that, its horrible. How about
> something like:
>
> EXTRA_OECONF = "xxxx ${SOMEVAR}"
> SOMEVAR = "z"
> SOMEVAR_class-native = "x"
> SOMEVAR_class-nativesdk = "y"
>
> ? I'm having to guess at what your real problem is though as the commit
> message doesn't contain the right information.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

