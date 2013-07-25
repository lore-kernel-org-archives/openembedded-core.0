Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C29786AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 10:11:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6PAB6tR026845
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Jul 2013 03:11:06 -0700 (PDT)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 25 Jul 2013 03:11:05 -0700
Message-ID: <51F0F9B5.3040304@windriver.com>
Date: Thu, 25 Jul 2013 18:11:01 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1374112474-13597-1-git-send-email-ming.liu@windriver.com>
	<51ECAB78.5070002@linux.intel.com>
In-Reply-To: <51ECAB78.5070002@linux.intel.com>
X-Originating-IP: [128.224.162.145]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3] util-linux: replace += with _append to EXTRA_OECONF_class-native
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
X-List-Received-Date: Thu, 25 Jul 2013 10:11:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/22/2013 11:48 AM, Saul Wold wrote:
> On 07/17/2013 06:54 PM, Ming Liu wrote:
>> The native/nativesdk overrides of EXTRA_OECONF should take effect before
>> append operator, otherwise, it will cause EXTRA_OECONF be overridden 
>> instead
>> of be appended at native/nativesdk build time.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/recipes-core/util-linux/util-linux_2.23.1.bb |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux_2.23.1.bb 
>> b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
>> index 12f5021..3040476 100644
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
>> +EXTRA_OECONF_append_class-native = " --disable-fallocate 
>> --disable-use-tty-group"
>> +EXTRA_OECONF_append_class-nativesdk = " --disable-fallocate 
>> --disable-use-tty-group"
>>
>
> While this seems correct, it is causing some down stream issues with 
> e2fsprogs-native and not finding the uuid library
Hi, Saul:

I did some investigations about this issue, it should be a regression 
introduced by commit 91c0f9e3: util-linux: move libraries to 
base_libdir. It tried to transfer "--libdir=${base_libdir}" to 
EXTRA_OECONF at configure status, which conflicted with following code 
in configure.ac:
.........
case $libdir in
  ${exec_prefix}/* | ${prefix}/* | /usr/*)
     usrlib_execdir=$libdir ;;
  *)
     usrlib_execdir='${exec_prefix}'$libdir ;;
esac
AC_SUBST([usrlib_execdir])
........

It resulted a invalid usrlib_execdir, and therefore caused libuuid.so 
link unreachable. This would make packages relies on uuid fail to 
compile, like e2fsprogs.

Anyway, it could be fixed by appending "--prefix=${base_prefix} 
--exec_prefix=${base_prefix}" to EXTRA_OECONF and we don't need to worry 
it, however, things go to more complicated after applied 91c0f9e3 that 
it also breaks pkgconfig, because all *.pc go to ${base_libdir} instead 
of  ${libdir} though pkg-config looks for files in explicitly fixed 
directories set by PKG_CONFIG_PATH, which in this case is: 
${STAGING_DATADIR}/pkgconfig${EXTRA_NATIVE_PKGCONFIG_PATH}, that finally 
causes other packages fail to detect libuuid by pkg-config.

Two approaches to fix this pkg-config failure, first, we could move *.pc 
to ${libdir} at do_intall stage, and the other, modify PKG_CONFIG_PATH, 
adding ${libdir}/pkgconfig into it. Which one do you prefer? Or we could 
just revert commit 91c0f9e3?

the best,
thank you
>
>>  Enabling testio debugging by default
>> | checking for x86_64-linux-pkg-config... no
>> | checking for pkg-config... 
>> /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
>> | checking pkg-config is at least version 0.9.0... yes
>> | checking for uuid_generate in -luuid... no
>> | configure: error: external uuid library not found
>> | Configure failed. The contents of all config.log files follows to 
>> aid debugging
>> | ERROR: oe_runconf failed
>
> Can you please research this further.
>
> Thanks
>     Sau!
>
>
>
>


