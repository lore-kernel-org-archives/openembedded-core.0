Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECA6460017
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 02:24:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7U2OKmt024277
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 19:24:20 -0700 (PDT)
Received: from soho-mhatle-m.corp.ad.wrs.com (172.25.34.15) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 29 Aug 2016 19:24:17 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1472510736-3148-1-git-send-email-juro.bystricky@intel.com>
	<1472510736-3148-2-git-send-email-juro.bystricky@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <91bed634-2b94-5920-65bc-d0844bc6f01d@windriver.com>
Date: Tue, 30 Aug 2016 10:24:16 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472510736-3148-2-git-send-email-juro.bystricky@intel.com>
Subject: Re: [PATCH 1/1] gcc-runtime.inc: add CPP support for mips64-n32 tune
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
X-List-Received-Date: Tue, 30 Aug 2016 02:24:22 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 8/30/16 6:45 AM, Juro Bystricky wrote:
> This patch fixes the problem where the CPP compiler cannot find include files.
> The compiler is configured to look for the files in places that do not exist.
> When querying the CPP for search paths, we observe messages such as these:
> 
> multilib configuration:
> 
> MACHINE="qemumips64"
> require conf/multilib.conf
> MULTILIBS = "multilib:lib64 multilib:lib32"
> DEFAULTTUNE = "mips64-n32"
> DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"
> DEFAULTTUNE_virtclass-multilib-lib32 = "mips32r2"
> 
> ignoring nonexistent directory "<path>/sysroots/mips64-n32-poky-linux-gnun32/usr/include/c++/6.2.0/mips64-poky-linux/32
> 
> single lib configuration:
> MACHINE="qemumips64"
> DEFAULTTUNE = "mips64-n32"
> ignoring nonexistent directory "<path>/sysroots/mips64-n32-poky-linux-gnun32/usr/include/c++/6.2.0/mips64-poky-linux/
> 
> To fix this, create a symlink of the name CPP expects and point it to the corresponding "gnun32" directory.
> 
> [YOCTO#10142]
> 
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 526be55..9791e21 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -82,6 +82,16 @@ do_install_append_class-target () {
>  	if [ "${TARGET_OS}" = "linux-gnuspe" ]; then
>  		ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>  	fi
> +
> +	if [ "${TARGET_OS}" = "linux-gnun32" ]; then
> +		if [ "${MULTILIBS}" != "" ]; then
> +			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux
> +			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux/32
> +		else
> +			ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
> +		fi
> +	fi
> +

It would be better if you can query the compiler that was produced for the path
it is expecting.  (Often you can run it and capture the result with a specific
command.  Then use that path as the input.  Simply verify if the expected C++
path and the compiler path are the same, if not setup the link -- they are the
same continue on.)

There may be a more simple solution however then all of this.

In the environment file for the SDK, you can add the CPP_INCLUDE variable and
set it to the right value... this will require a change to the environment setup
and a way to known the right value and the end location.

BTW I believe the problem is the difference between the SDK view and the
host/cross compile view of the multilibs and such.  Something gets out of sync
and needs to be manually fixed.

--Mark

>  	if [ "${TCLIBC}" != "glibc" ]; then
>  		case "${TARGET_OS}" in
>  			"linux-musl" | "linux-uclibc" | "linux-*spe") extra_target_os="linux";;
> 


