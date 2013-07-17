Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 160CA6AF13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 08:13:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6H8DYQ8020943
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Jul 2013 01:13:34 -0700 (PDT)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 17 Jul 2013 01:13:34 -0700
Message-ID: <51E6522A.1060208@windriver.com>
Date: Wed, 17 Jul 2013 16:13:30 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1374037784-7904-1-git-send-email-ming.liu@windriver.com>
	<51E63ED9.2000600@linux.intel.com>
In-Reply-To: <51E63ED9.2000600@linux.intel.com>
X-Originating-IP: [128.224.162.145]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: replace += with _append to EXTRA_OECONF_virtclass-native
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
X-List-Received-Date: Wed, 17 Jul 2013 08:13:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2013 02:51 PM, Saul Wold wrote:
> On 07/16/2013 10:09 PM, Ming Liu wrote:
>> The native/nativesdk overrides of EXTRA_OECONF should take effect before
>> append operator, otherwise, it will cause EXTRA_OECONF be overridden 
>> instead
>> of be appended at native/nativesdk build time.
>>
>
> I am not sure I understand this one.  If what you are saying then all 
> the overrides in recipes need to be changed, that does not seem 
> correct to me.
>
> Please confirm the overrides using += is correct.

Run 'bitbake -e util-linux-native' to the original, check out the 
EXTRA_OECONF, we got:
#
# $EXTRA_OECONF [11 operations]
#   set conf/bitbake.conf:475
#     ""
#   _append /buildarea2/mliu3/poky/meta/classes/gettext.bbclass:21
#     " ${@gettext_oeconf(d)}"
#   set 
/buildarea2/mliu3/poky/meta/recipes-core/util-linux/util-linux.inc:47
#     "--libdir=${base_libdir} --disable-use-tty-group                 
--disable-makeinstall-chown --enable-elvtune 
--enable-init                 --enable-kill --enable-last --enable-mesg 
--enable-partx
#   append 
/buildarea2/mliu3/poky/meta/recipes-core/util-linux/util-linux.inc:50
#     "${@base_contains('DISTRO_FEATURES', 'systemd', 
'--enable-socket-activation', '--disable-socket-activation', d)}"
#   append 
/buildarea2/mliu3/poky/meta/recipes-core/util-linux/util-linux.inc:51
#     "${@base_contains('DISTRO_FEATURES', 'systemd', 
'--with-systemdsystemunitdir=${systemd_unitdir}/system/', 
'--without-systemdsystemunitdir', d)}"
#   _append[class-native] 
/buildarea2/mliu3/poky/meta/recipes-core/util-linux/util-linux.inc:53
#     " --disable-login --disable-su"
#   finalize ast.py:331 [finalize]
#     "was: --libdir=${base_libdir} 
--disable-use-tty-group                 --disable-makeinstall-chown 
--enable-elvtune --enable-init                 --enable-kill 
--enable-last --enable-mesg --enable-partx
#   override[class-native]:append 
/buildarea2/mliu3/poky/meta/recipes-core/util-linux/util-linux_2.22.2.bb:17
#     "--disable-fallocate --disable-use-tty-group"
#   finalize override[class-native]:
#     " --disable-fallocate --disable-use-tty-group"
#   set data_smart.py:414 [finalize]
#     " --disable-fallocate --disable-use-tty-group ${@gettext_oeconf(d)}"
#   set data_smart.py:414 [finalize]
#     " --disable-fallocate --disable-use-tty-group 
${@gettext_oeconf(d)} --disable-login --disable-su"
# computed:
#   " --disable-fallocate --disable-use-tty-group ${@gettext_oeconf(d)} 
--disable-login --disable-su"
EXTRA_OECONF="--disable-fallocate --disable-use-tty-group --disable-nls 
--disable-login --disable-su"

See EXTRA_OECONF is overridden but not appended with 
"--disable-fallocate --disable-use-tty-group" at 
util-linux_2.22.2.bb:17, which is not what it's expected.

After apply the patch, the output as following:
#
# $EXTRA_OECONF [10 operations]
#   set conf/bitbake.conf:475
#     ""
#   _append /buildarea2/mliu3/poky/meta/classes/gettext.bbclass:21
#     " ${@gettext_oeconf(d)}"
#   set 
/buildarea2/mliu3/poky/meta/recipes-core/util-linux/util-linux.inc:47
#     "--libdir=${base_libdir} --disable-use-tty-group                 
--disable-makeinstall-chown --enable-elvtune 
--enable-init                 --enable-kill --enable-last --enable-mesg 
--enable-partx
#   append 
/buildarea2/mliu3/poky/meta/recipes-core/util-linux/util-linux.inc:50
#     "${@base_contains('DISTRO_FEATURES', 'systemd', 
'--enable-socket-activation', '--disable-socket-activation', d)}"
#   append 
/buildarea2/mliu3/poky/meta/recipes-core/util-linux/util-linux.inc:51
#     "${@base_contains('DISTRO_FEATURES', 'systemd', 
'--with-systemdsystemunitdir=${systemd_unitdir}/system/', 
'--without-systemdsystemunitdir', d)}"
#   _append[class-native] 
/buildarea2/mliu3/poky/meta/recipes-core/util-linux/util-linux.inc:53
#     " --disable-login --disable-su"
#   _append[class-native] 
/buildarea2/mliu3/poky/meta/recipes-core/util-linux/util-linux_2.22.2.bb:17
#     " --disable-fallocate --disable-use-tty-group"
#   set data_smart.py:414 [finalize]
#     "--libdir=${base_libdir} --disable-use-tty-group                 
--disable-makeinstall-chown --enable-elvtune 
--enable-init                 --enable-kill --enable-last --enable-mesg 
--enable-partx
#   set data_smart.py:414 [finalize]
#     "--libdir=${base_libdir} --disable-use-tty-group                 
--disable-makeinstall-chown --enable-elvtune 
--enable-init                 --enable-kill --enable-last --enable-mesg 
--enable-partx
#   set data_smart.py:414 [finalize]
#     "--libdir=${base_libdir} --disable-use-tty-group                 
--disable-makeinstall-chown --enable-elvtune 
--enable-init                 --enable-kill --enable-last --enable-mesg 
--enable-partx
# computed:
#   "--libdir=${base_libdir} --disable-use-tty-group 
--disable-makeinstall-chown --enable-elvtune 
--enable-init                 --enable-kill --enable-last --enable-mesg 
--enable-partx
EXTRA_OECONF="--libdir=/buildarea2/mliu3/poky/build/tmp/sysroots/x86_64-linux/lib 
--disable-use-tty-group                 --disable-makeinstall-chown 
--enable-elvtune --enable-init                 --enable-kill 
--enable-last --enable-mesg --enable-partx --enable-raw --enable-rdev 
--enable-reset --disable-login                 --disable-vipw 
--disable-newgrp --disable-chfn-chsh --disable-su                 
--enable-write --enable-arch --enable-mount --with-fsprobe=builtin 
--enable-libuuid --enable-libblkid --enable-fsck --without-udev 
usrsbin_execdir='/buildarea2/mliu3/poky/build/tmp/sysroots/x86_64-linux/usr/sbin' 
--disable-socket-activation --without-systemdsystemunitdir --disable-nls 
--disable-login --disable-su --disable-fallocate --disable-use-tty-group"

There is often confusion about which order overrides and the various 
append operators take effect.


But in this patch, the modified need to be changed to:
+EXTRA_OECONF_append_class-native = "--disable-fallocate 
--disable-use-tty-group"
+EXTRA_OECONF_append_class-nativesdk = "--disable-fallocate 
--disable-use-tty-group"

replaced "virtclass" with "class" in it, I will send the V1.

the best,
thank you.



>
> Thanks
>     Sau!
>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/recipes-core/util-linux/util-linux_2.23.1.bb |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux_2.23.1.bb 
>> b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
>> index 12f5021..e597c41 100644
>> --- a/meta/recipes-core/util-linux/util-linux_2.23.1.bb
>> +++ b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
>> @@ -18,5 +18,5 @@ SRC_URI[md5sum] = "6741eeaff93ff5a6bacdd3816bdd87c4"
>>   SRC_URI[sha256sum] = 
>> "ad4a7831d7b27d0172996fd343e809716c2403b32a94e15194d8ea797223c4af"
>>
>>   CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
>> -EXTRA_OECONF_class-native += "--disable-fallocate 
>> --disable-use-tty-group"
>> -EXTRA_OECONF_class-nativesdk += "--disable-fallocate 
>> --disable-use-tty-group"
>> +EXTRA_OECONF_append_virtclass-native = "--disable-fallocate 
>> --disable-use-tty-group"
>> +EXTRA_OECONF_append_virtclass-nativesdk = "--disable-fallocate 
>> --disable-use-tty-group"
>>
>
>


