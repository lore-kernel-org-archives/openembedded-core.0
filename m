Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B89D860670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 21:53:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0LLrOQP018276
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 21 Jan 2015 13:53:24 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Wed, 21 Jan 2015 13:53:24 -0800
Message-ID: <54C01FD3.3060506@windriver.com>
Date: Wed, 21 Jan 2015 15:53:23 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: akuster808 <akuster808@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1421860276.git.paul.eggleton@linux.intel.com>	<c452114d4c6cb205336bc729d3fc2f57fd821bab.1421860276.git.paul.eggleton@linux.intel.com>
	<54C010BD.30904@gmail.com>
In-Reply-To: <54C010BD.30904@gmail.com>
Subject: Re: [PATCH 1/1] gcc: ensure target gcc headers can be included
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
X-List-Received-Date: Wed, 21 Jan 2015 21:53:28 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 1/21/15 2:49 PM, akuster808 wrote:
> Is this needed for dizzy ?

Yes, please.

Also the patches listed in bug 7143.

--Mark

> - Armin
> 
> On 01/21/2015 09:14 AM, Paul Eggleton wrote:
>> There are a few headers installed as part of gcc-runtime (omp.h,
>> ssp/*.h). Being installed from a recipe built for the target
>> architecture, these are within the target sysroot and not
>> cross/nativesdk; thus they weren't able to be found by gcc with the
>> existing search paths. Add support for picking up these headers
>> under the sysroot supplied on the gcc command line in order to
>> resolve this.
>>
>> Thanks to Richard Purdie for giving me a number of pointers during
>> fixing this issue.
>>
>> Fixes [YOCTO #7141].
>>
>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
>>   .../gcc/gcc-4.9/target-gcc-includedir.patch        | 81 ++++++++++++++++++++++
>>   2 files changed, 82 insertions(+)
>>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
>> index 2568e99..0f407b7 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
>> @@ -74,6 +74,7 @@ SRC_URI = "\
>>       file://0057-aarch64-config.patch \
>>       file://0058-gcc-r212171.patch \
>>       file://0059-gcc-PR-rtl-optimization-63348.patch \
>> +    file://target-gcc-includedir.patch \
>>   "
>>   SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
>>   SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch b/meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch
>> new file mode 100644
>> index 0000000..f48c66d
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch
>> @@ -0,0 +1,81 @@
>> +Ensure target gcc headers can be included
>> +
>> +There are a few headers installed as part of the OpenEmbedded
>> +gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
>> +built for the target architecture, these are within the target
>> +sysroot and not cross/nativesdk; thus they weren't able to be
>> +found by gcc with the existing search paths. Add support for
>> +picking up these headers under the sysroot supplied on the gcc
>> +command line in order to resolve this.
>> +
>> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> +
>> +Upstream-Status: Pending
>> +
>> +--- a/gcc/Makefile.in	2014-12-23 11:57:33.327873331 +0000
>> ++++ b/gcc/Makefile.in	2015-01-21 11:32:35.447305394 +0000
>> +@@ -587,6 +587,7 @@
>> +
>> + # Directory in which the compiler finds libraries etc.
>> + libsubdir = $(libdir)/gcc/$(target_noncanonical)/$(version)
>> ++libsubdir_target = gcc/$(target_noncanonical)/$(version)
>> + # Directory in which the compiler finds executables
>> + libexecsubdir = $(libexecdir)/gcc/$(target_noncanonical)/$(version)
>> + # Directory in which all plugin resources are installed
>> +@@ -2534,6 +2535,7 @@
>> +
>> + PREPROCESSOR_DEFINES = \
>> +   -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
>> ++  -DGCC_INCLUDE_SUBDIR_TARGET=\"$(libsubdir_target)/include\" \
>> +   -DFIXED_INCLUDE_DIR=\"$(libsubdir)/include-fixed\" \
>> +   -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
>> +   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
>> +--- a/gcc/cppdefault.c	2015-01-13 17:40:26.131012725 +0000
>> ++++ b/gcc/cppdefault.c	2015-01-21 11:30:08.928426492 +0000
>> +@@ -59,6 +59,10 @@
>> +     /* This is the dir for gcc's private headers.  */
>> +     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
>> + #endif
>> ++#ifdef GCC_INCLUDE_SUBDIR_TARGET
>> ++    /* This is the dir for gcc's private headers under the specified sysroot.  */
>> ++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0 },
>> ++#endif
>> + #ifdef LOCAL_INCLUDE_DIR
>> +     /* /usr/local/include comes before the fixincluded header files.  */
>> +     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
>> +diff --git a/gcc/defaults.h b/gcc/defaults.h
>> +index f94ae17..d98b40b 100644
>> +--- a/gcc/defaults.h
>> ++++ b/gcc/defaults.h
>> +@@ -1390,4 +1390,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
>> +
>> + #endif /* GCC_INSN_FLAGS_H  */
>> +
>> ++/* Default prefixes to attach to command names.  */
>> ++
>> ++#ifndef STANDARD_STARTFILE_PREFIX_1
>> ++#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
>> ++#endif
>> ++#ifndef STANDARD_STARTFILE_PREFIX_2
>> ++#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
>> ++#endif
>> ++
>> + #endif  /* ! GCC_DEFAULTS_H */
>> +diff --git a/gcc/gcc.c b/gcc/gcc.c
>> +index 9f0b781..174fca8 100644
>> +--- a/gcc/gcc.c
>> ++++ b/gcc/gcc.c
>> +@@ -1189,13 +1189,6 @@ static const char *gcc_libexec_prefix;
>> +
>> + /* Default prefixes to attach to command names.  */
>> +
>> +-#ifndef STANDARD_STARTFILE_PREFIX_1
>> +-#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
>> +-#endif
>> +-#ifndef STANDARD_STARTFILE_PREFIX_2
>> +-#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
>> +-#endif
>> +-
>> + #ifdef CROSS_DIRECTORY_STRUCTURE  /* Don't use these prefixes for a cross compiler.  */
>> + #undef MD_EXEC_PREFIX
>> + #undef MD_STARTFILE_PREFIX
>>


