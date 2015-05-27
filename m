Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9024070331
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 02:28:01 +0000 (UTC)
Received: by obbgf1 with SMTP id gf1so48006850obb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 19:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=yd81cTyBhdXVtKYwMwH6h7C/88aoMqyqniA0jMlUDhw=;
	b=rqpUJwMMXZbwJEN3rFq5EdZM0oBfLhjnu/immfbASyx04r5g9/1h776vWh5ht6ZJB9
	0KoAoZXkVFwmr/pQ5B1mC9mODD5b7iw/pKoVU+0NVjTzlUrBBza4phgC2UDcGGOzX0FD
	HF3IwDtV3TL9wLFPWQtt3OG79MBgZ+gLBhaZEs5yxkx9EsToZhCeRefCWfGAUGVI8uOi
	ppB2NWVtVTdssYfS4y+nOkbzxfhmQUTjSONRlwjFi9zOdF2cFgbT1l3+nhvrTJ5ONPVm
	xvJvn7N10CHdE6gZDrXNU6wZbh+MUIH4QploZreO8BTIax3A3T3TOlBPAT1HrtamLkRR
	OxPg==
MIME-Version: 1.0
X-Received: by 10.182.210.230 with SMTP id mx6mr24447418obc.64.1432693682432; 
	Tue, 26 May 2015 19:28:02 -0700 (PDT)
Received: by 10.202.44.23 with HTTP; Tue, 26 May 2015 19:28:02 -0700 (PDT)
In-Reply-To: <55636AA6.5030800@linux.intel.com>
References: <1432253466-9933-1-git-send-email-armccurdy@gmail.com>
	<55636AA6.5030800@linux.intel.com>
Date: Tue, 26 May 2015 19:28:02 -0700
Message-ID: <CAJ86T=VJpjNd6so51mM=CmS17O-AWtppX8sK=_4+eEotfxrZhA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gnutls: remove --with-libz-prefix configure option
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
X-List-Received-Date: Wed, 27 May 2015 02:28:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2015 at 11:32 AM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> Hi Andre,

Hi An=C3=ADbal,

> This patch broke gnutls build on multilib,
>
> ERROR: QA Issue: gnutls: The compile log indicates that host include and/=
or
> library paths were used.
>          Please check the log
> '/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-lin=
ux/gnutls/3.3.14-r0/temp/log.do_compile'
> for more information. [compile-host-path]
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in:
> /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/temp/log.do_package_qa.25738
> ERROR: Task 2411
> (/home/alimon/repos/poky/meta/recipes-support/gnutls/gnutls_3.3.14.bb,
> do_package_qa) failed with exit code '1

I'm not able to reproduce your error, but based on some googling it
seems that issues cross compiling gnutls are not uncommon. Buildroot
added the --with-libz-prefix configure option specifically to fix
issues with configure finding the host's libz [1]. Chromium has a more
complete fix, which patches configure.ac to find libz using
PKG_CHECK_MODULES instead of AC_LIB_HAVE_LINKFLAGS [2].

Since the original issue (absolute paths in gnutls.pc Libs.private) is
fairly benign, I think the best solution right now is to revert back
to using the --with-libz-prefix configure option in OE.

 [1] http://lists.busybox.net/pipermail/buildroot/2014-February/088307.html
 [2] https://chromium-review.googlesource.com/#/c/271661/2/net-libs/gnutls/=
files/gnutls-2.12.23-cross-compile.patch


> Kind regards,
>     alimon
>
>
> On 21/05/15 19:11, Andre McCurdy wrote:
>>
>> The default search path in sysroot is sufficient to find zlib, so the
>> --with-libz-prefix configure option seems to be unnecessary.
>>
>> For target builds, relying on sysroot also prevents an absolute path
>> from being hardcoded in the gnutls.pc pkg-config file.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>   meta/recipes-support/gnutls/gnutls.inc | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/gnutls/gnutls.inc
>> b/meta/recipes-support/gnutls/gnutls.inc
>> index 45fb529..87f275a 100644
>> --- a/meta/recipes-support/gnutls/gnutls.inc
>> +++ b/meta/recipes-support/gnutls/gnutls.inc
>> @@ -23,7 +23,6 @@ EXTRA_OECONF=3D"--disable-rpath \
>>                 --with-included-libtasn1 \
>>                 --enable-local-libopts \
>>                 --with-libpthread-prefix=3D${STAGING_DIR_HOST}${prefix} =
\
>> -              --with-libz-prefix=3D${STAGING_DIR_HOST}${prefix} \
>>                 --disable-guile \
>>                 --disable-crywrap \
>>                 --without-p11-kit \
>
>

