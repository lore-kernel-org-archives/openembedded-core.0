Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49F1C71A0F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 08:24:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w778OuxG009603
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Aug 2018 01:24:56 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.161) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 7 Aug 2018 01:24:56 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@windriver.com>
References: <20180717201021.1640-1-raj.khem@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <cca1b343-50cd-b445-b838-897063d6b8b8@windriver.com>
Date: Tue, 7 Aug 2018 16:28:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180717201021.1640-1-raj.khem@gmail.com>
Subject: Re: [PATCH] binutils: Upgrade to 2.31 release branch
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
X-List-Received-Date: Tue, 07 Aug 2018 08:24:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Khem,

The new binutils may cause build failures with kernel 4.18 (linux-yocto-dev),

arch/x86/Makefile:184: *** Compiler lacks asm-goto support..  Stop.

The line for checking asm goto is in kernel's top Makefile:

# check for 'asm goto'
ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) 
$(KBUILD_CFLAGS)), y)
   CC_HAVE_ASM_GOTO := 1
   KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
   KBUILD_AFLAGS += -DCC_HAVE_ASM_GOTO
endif

And in gcc-goto.sh:
cat << "END" | $@ -x c - -c -o /dev/null >/dev/null 2>&1 && echo "y"
int main(void)
{
#if defined(__arm__) || defined(__aarch64__)
     /*
      * Not related to asm goto, but used by jump label
      * and broken on some ARM GCC versions (see GCC Bug 48637).
      */
     static struct { int dummy; int state; } tp;
     asm (".long %c0" :: "i" (&tp.state));
#endif

entry:
     asm goto ("" :::: entry);
     return 0;
}
END

This script reports:

Assembler messages:
Fatal error: The input and output files must be distinct

And it is introduced by binutils' commit:

commit 67f846b59b32f3d704c601669409c2584383fea9
Author: John Darrington <john@darrington.wattle.id.au>
Date:   Thu Apr 12 15:07:02 2018 +0100

     Stop the assembler from overwriting its output file.

[snip]
+             if (sib.st_ino == sob.st_ino)
+               {
+                 /* Don't let as_fatal remove the output file!  */
+                 out_file_name = NULL;
+                 as_fatal (_("The input and output files must be distinct"));
[snip]


I can't reproduce this problem locally, but it can be reproduced in our daily
build. Yocto doesn't have this problem atm since it use linux-yocto (not -dev).

Do you have any suggestions, please ?

// Robert

On 07/18/2018 04:10 AM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/conf/distro/include/tcmode-default.inc   |    2 +-
>   .../{binutils-2.30.inc => binutils-2.31.inc}  |    2 +-
>   ....30.bb => binutils-cross-canadian_2.31.bb} |    0
>   ...s-cross_2.30.bb => binutils-cross_2.31.bb} |    0
>   ...ssdk_2.30.bb => binutils-crosssdk_2.31.bb} |    0
>   ...s-crosssdk-Generate-relocatable-SDKs.patch |   12 +-
>   ...o-not-generate-linker-script-directo.patch |   22 +-
>   ...iden-the-regexp-for-SH-architectures.patch |   12 +-
>   ...004-Point-scripts-location-to-libdir.patch |   10 +-
>   ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   10 +-
>   .../binutils/0006-Use-libtool-2.4.patch       | 2296 +++++++++--------
>   ...-the-armv5e-architecture-to-binutils.patch |    8 +-
>   ...stro-compiler-point-to-the-wrong-ins.patch |    4 +-
>   ...-system-directories-when-cross-linki.patch |   50 +-
>   ...h-in-libtool-when-sysroot-is-enabled.patch |    4 +-
>   ...e-default-emulation-for-mips64-linux.patch |   12 +-
>   .../0012-Add-support-for-Netlogic-XLP.patch   |   80 +-
>   ...ect-assembling-for-ppc-wait-mnemonic.patch |   10 +-
>   .../0014-Detect-64-bit-MIPS-targets.patch     |    4 +-
>   .../0015-sync-with-OE-libtool-changes.patch   |    4 +-
>   .../{binutils_2.30.bb => binutils_2.31.bb}    |    0
>   21 files changed, 1327 insertions(+), 1215 deletions(-)
>   rename meta/recipes-devtools/binutils/{binutils-2.30.inc => binutils-2.31.inc} (97%)
>   rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.30.bb => binutils-cross-canadian_2.31.bb} (100%)
>   rename meta/recipes-devtools/binutils/{binutils-cross_2.30.bb => binutils-cross_2.31.bb} (100%)
>   rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.30.bb => binutils-crosssdk_2.31.bb} (100%)
>   rename meta/recipes-devtools/binutils/{binutils_2.30.bb => binutils_2.31.bb} (100%)
>  

