Return-Path: <heinold@inf.fu-berlin.de>
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
	[130.133.4.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB246A960
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 10:12:07 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1V2f0H-002jRT-B1>; Fri, 26 Jul 2013 12:12:05 +0200
Received: from g225004217.adsl.alicedsl.de ([92.225.4.217]
	helo=mail.zedat.fu-berlin.de)
	by inpost2.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-core@lists.openembedded.org with esmtpsa
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1V2f0G-000x6v-Vc>; Fri, 26 Jul 2013 12:12:05 +0200
Date: Fri, 26 Jul 2013 12:11:59 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130726101159.GA19029@mail.zedat.fu-berlin.de>
References: <1374788144-1380-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1374788144-1380-1-git-send-email-sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: 92.225.4.217
Subject: Re: [PATCH] external-sourcery: add missing providers
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
X-List-Received-Date: Fri, 26 Jul 2013 10:12:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 25, 2013 at 02:35:44PM -0700, Saul Wold wrote:
> Addess the issue with multiple .bb providers
> 
> ERROR: Multiple .bb files are due to be built which each provide virtual/libc (/srv/hdd/releases/dylan/meta/recipes-core/eglibc/eglibc_2.17.bb /srv/hdd/releases/dylan/meta/recipes-core/meta/external-sourcery-toolchain.bb).
>  This usually means one provides something the other doesn't and should.
> ERROR: Multiple .bb files are due to be built which each provide virtual/arm-none-linux-gnueabi-libc-for-gcc (/srv/hdd/releases/dylan/meta/recipes-core/eglibc/eglibc_2.17.bb /srv/hdd/releases/dylan/meta/recipes-core/meta/external-sourcery-toolchain.bb).
>  This usually means one provides something the other doesn't and should.
> ERROR: Multiple .bb files are due to be built which each provide virtual/libiconv (/srv/hdd/releases/dylan/meta/recipes-core/eglibc/eglibc_2.17.bb /srv/hdd/releases/dylan/meta/recipes-core/meta/external-sourcery-toolchain.bb).
>  This usually means one provides something the other doesn't and should.
> 
> Thanks to Kergoth (Chris Larson) and Lpapp (Lazslo)
> 
> [YOCTO #4908]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/conf/distro/include/tcmode-external-sourcery.inc | 3 +++
>  meta/recipes-core/meta/external-sourcery-toolchain.bb | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/meta/conf/distro/include/tcmode-external-sourcery.inc b/meta/conf/distro/include/tcmode-external-sourcery.inc
> index 53e6653..d6cac74 100644
> --- a/meta/conf/distro/include/tcmode-external-sourcery.inc
> +++ b/meta/conf/distro/include/tcmode-external-sourcery.inc
> @@ -27,13 +27,16 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-sourcery
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-sourcery-toolchain"
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-sourcery-toolchain"
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external-sourcery-toolchain"
> +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "external-sourcery-toolchain"
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "external-sourcery-toolchain"
>  PREFERRED_PROVIDER_libgcc = "external-sourcery-toolchain"
> +PREFERRED_PROVIDER_eglibc = "external-sourcery-toolchain"
>  PREFERRED_PROVIDER_virtual/libc = "external-sourcery-toolchain"
>  PREFERRED_PROVIDER_virtual/libintl = "external-sourcery-toolchain"
>  PREFERRED_PROVIDER_virtual/libiconv = "external-sourcery-toolchain"
>  PREFERRED_PROVIDER_glibc-thread-db = "external-sourcery-toolchain"
>  PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-sourcery-toolchain"
> +PREFERRED_PROVIDER_virtual/linux-libc-headers-dev = "external-sourcery-toolchain"
>  PREFERRED_PROVIDER_gdbserver ??= "external-sourcery-toolchain"
>  
>  # No need to re-compile the locale files
> diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb b/meta/recipes-core/meta/external-sourcery-toolchain.bb
> index 5fed30a..41d86d6 100644
> --- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
> +++ b/meta/recipes-core/meta/external-sourcery-toolchain.bb
> @@ -16,12 +16,14 @@ PROVIDES += "\
>  	virtual/${TARGET_PREFIX}gcc-intermediate \
>  	virtual/${TARGET_PREFIX}binutils \
>  	virtual/${TARGET_PREFIX}libc-for-gcc \
> +	virtual/${TARGET_PREFIX}libc-initial \
>  	virtual/${TARGET_PREFIX}compilerlibs \
>  	virtual/libc \
>  	virtual/libintl \
>  	virtual/libiconv \
>  	glibc-thread-db \
>  	libgcc \
> +	eglibc \
>  	virtual/linux-libc-headers \
>  "
>  PV = "${CSL_VER_MAIN}"
> -- 
> 1.8.1.4

Hi Saul,

shouldn't we add uclibc too or will you wait until someone comes up
with an uclibc based external toolchain?

Bye Henning

