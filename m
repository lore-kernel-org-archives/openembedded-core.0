Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F25C7903E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 03:44:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7L3iBHn006689
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 20:44:11 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 20 Aug 2018 20:44:10 -0700
To: Hongxu Jia <hongxu.jia@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1534728196-29017-1-git-send-email-hongxu.jia@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <3d233f00-ece7-a451-7818-535c16977cc6@windriver.com>
Date: Tue, 21 Aug 2018 11:48:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1534728196-29017-1-git-send-email-hongxu.jia@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH V2] nasm: fix CVE-2018-8883 & CVE-2018-8882 & CVE-2018-10016 & CVE-2018-10316
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
X-List-Received-Date: Tue, 21 Aug 2018 03:44:10 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Caused ovmf do_compile failure.
https://autobuilder.yocto.io/builders/nightly-musl/builds/1254/steps/BuildImages/logs/stdio 


Best Regards,
Chen Qi

On 08/20/2018 09:23 AM, Hongxu Jia wrote:
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...t-we-are-not-reading-past-end-of-a-buffer.patch | 65 ++++++++++++++++++++++
>   ...001-asm-eval.c-Avoid-possible-divide-by-0.patch | 40 +++++++++++++
>   .../0001-assemble-Check-global-line-limit.patch    | 50 +++++++++++++++++
>   .../nasm/nasm/0001-fix-CVE-2018-8882.patch         | 30 ++++++++++
>   meta/recipes-devtools/nasm/nasm_2.13.03.bb         |  4 ++
>   5 files changed, 189 insertions(+)
>   create mode 100644 meta/recipes-devtools/nasm/nasm/0001-Verify-that-we-are-not-reading-past-end-of-a-buffer.patch
>   create mode 100644 meta/recipes-devtools/nasm/nasm/0001-asm-eval.c-Avoid-possible-divide-by-0.patch
>   create mode 100644 meta/recipes-devtools/nasm/nasm/0001-assemble-Check-global-line-limit.patch
>   create mode 100644 meta/recipes-devtools/nasm/nasm/0001-fix-CVE-2018-8882.patch
>
> diff --git a/meta/recipes-devtools/nasm/nasm/0001-Verify-that-we-are-not-reading-past-end-of-a-buffer.patch b/meta/recipes-devtools/nasm/nasm/0001-Verify-that-we-are-not-reading-past-end-of-a-buffer.patch
> new file mode 100644
> index 0000000..a56a08b
> --- /dev/null
> +++ b/meta/recipes-devtools/nasm/nasm/0001-Verify-that-we-are-not-reading-past-end-of-a-buffer.patch
> @@ -0,0 +1,65 @@
> +From c5785fdf1d660eaefb9711284414262d0cfe8843 Mon Sep 17 00:00:00 2001
> +From: Adam Majer <amajer@suse.de>
> +Date: Fri, 17 Aug 2018 14:48:17 +0800
> +Subject: [PATCH] Verify that we are not reading past end of a buffer
> +
> +Simple reproducer is just,
> +
> +    ret &d:ep
> +
> +which triggers a buffer overread due to parsing of an invalid
> +segment override.
> +
> +Signed-off-by: Adam Majer <amajer@suse.de>
> +
> +Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392447]
> +CVE: CVE-2018-8883
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + include/opflags.h | 2 +-
> + include/tables.h  | 1 +
> + x86/regs.pl       | 3 ++-
> + 3 files changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/include/opflags.h b/include/opflags.h
> +index ef2838c1..8d4b6b1e 100644
> +--- a/include/opflags.h
> ++++ b/include/opflags.h
> +@@ -166,7 +166,7 @@
> + #define REG_CLASS_BND           GEN_REG_CLASS(9)
> +
> + #define is_class(class, op)         (!((opflags_t)(class) & ~(opflags_t)(op)))
> +-#define is_reg_class(class, reg)    is_class((class), nasm_reg_flags[(reg)])
> ++#define is_reg_class(class, reg)    is_class((class), ((reg) < nasm_reg_flags_size ? nasm_reg_flags[(reg)] : 0))
> +
> + #define IS_SREG(reg)                is_reg_class(REG_SREG, (reg))
> + #define IS_FSGS(reg)                is_reg_class(REG_FSGS, (reg))
> +diff --git a/include/tables.h b/include/tables.h
> +index 24a665e2..458752ce 100644
> +--- a/include/tables.h
> ++++ b/include/tables.h
> +@@ -64,6 +64,7 @@ extern const char * const nasm_reg_names[];
> + typedef uint64_t opflags_t;
> + typedef uint16_t  decoflags_t;
> + extern const opflags_t nasm_reg_flags[];
> ++extern const size_t nasm_reg_flags_size;
> + /* regvals.c */
> + extern const int nasm_regvals[];
> +
> +diff --git a/x86/regs.pl b/x86/regs.pl
> +index 3a1b56f5..cb5cea68 100755
> +--- a/x86/regs.pl
> ++++ b/x86/regs.pl
> +@@ -158,7 +158,8 @@ if ( $fmt eq 'h' ) {
> + 	printf "    %-15s /* %-5s */\n",
> + 		$regs{$reg}.',', $reg;
> +     }
> +-    print "};\n";
> ++    print "};\n\n";
> ++    print "const size_t nasm_reg_flags_size = sizeof(nasm_reg_flags) / sizeof(opflags_t);\n";
> + } elsif ( $fmt eq 'vc' ) {
> +     # Output regvals.c
> +     print "/* automatically generated from $file - do not edit */\n\n";
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/nasm/nasm/0001-asm-eval.c-Avoid-possible-divide-by-0.patch b/meta/recipes-devtools/nasm/nasm/0001-asm-eval.c-Avoid-possible-divide-by-0.patch
> new file mode 100644
> index 0000000..6ceeca0
> --- /dev/null
> +++ b/meta/recipes-devtools/nasm/nasm/0001-asm-eval.c-Avoid-possible-divide-by-0.patch
> @@ -0,0 +1,40 @@
> +From 8ad049cf9ccda2a5133a97506011862bcfc4a0c0 Mon Sep 17 00:00:00 2001
> +From: Adam Majer <amajer@suse.de>
> +Date: Fri, 17 Aug 2018 14:15:35 +0800
> +Subject: [PATCH] asm/eval.c: Avoid possible divide by 0
> +
> +During a divide operation, we already tested that the
> +divisor has is_simple, but then when testing it for 0,
> +we again verify that it does not contain any unknown parts.
> +This extra check prevents detection of cases when
> +reloc_value returns 0.
> +
> +Use reloc_value instead in detection of 0 divisor.
> +
> +https://bugzilla.nasm.us/show_bug.cgi?id=3392473
> +
> +Signed-off-by: Adam Majer <amajer@suse.de>
> +
> +Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392473]
> +CVE: CVE-2018-10016
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + asm/eval.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/asm/eval.c b/asm/eval.c
> +index 816983b9..57c598c5 100644
> +--- a/asm/eval.c
> ++++ b/asm/eval.c
> +@@ -585,7 +585,7 @@ static expr *expr5(int critical)
> +                   " scalar values");
> +             return NULL;
> +         }
> +-        if (j != '*' && !is_unknown(f) && reloc_value(f) == 0) {
> ++        if (j != '*' && reloc_value(f) == 0) {
> +             nasm_error(ERR_NONFATAL, "division by zero");
> +             return NULL;
> +         }
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/nasm/nasm/0001-assemble-Check-global-line-limit.patch b/meta/recipes-devtools/nasm/nasm/0001-assemble-Check-global-line-limit.patch
> new file mode 100644
> index 0000000..682d4c7
> --- /dev/null
> +++ b/meta/recipes-devtools/nasm/nasm/0001-assemble-Check-global-line-limit.patch
> @@ -0,0 +1,50 @@
> +From 7a46d6b9e3a1d8a0ab0d816ef1bf194ad285e082 Mon Sep 17 00:00:00 2001
> +From: "Chang S. Bae" <chang.seok.bae@intel.com>
> +Date: Fri, 17 Aug 2018 14:26:03 +0800
> +Subject: [PATCH] assemble: Check global line limit
> +
> +Without the limit, the while loop opens to semi-infinite
> +that will exhaustively consume the heap space. Also, the
> +index value gets into the garbage.
> +
> +https://bugzilla.nasm.us/show_bug.cgi?id=3392474
> +
> +Reported-by : Dongliang Mu <mudongliangabcd@gmail.com>
> +Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> +Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
> +
> +Upstream-Status: Backport from upstream [http://repo.or.cz/nasm.git]
> +CVE: CVE-2018-10316
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + asm/nasm.c | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/asm/nasm.c b/asm/nasm.c
> +index 8497ec9..81f6cee 100644
> +--- a/asm/nasm.c
> ++++ b/asm/nasm.c
> +@@ -99,6 +99,8 @@ static char outname[FILENAME_MAX];
> + static char listname[FILENAME_MAX];
> + static char errname[FILENAME_MAX];
> + static int globallineno;        /* for forward-reference tracking */
> ++#define GLOBALLINENO_MAX    INT32_MAX
> ++
> + /* static int pass = 0; */
> + const struct ofmt *ofmt = &OF_DEFAULT;
> + const struct ofmt_alias *ofmt_alias = NULL;
> +@@ -1360,7 +1362,10 @@ static void assemble_file(char *fname, StrList **depend_ptr)
> +         location.offset = offs = get_curr_offs();
> +
> +         while ((line = preproc->getline())) {
> +-            globallineno++;
> ++            if (globallineno++ == GLOBALLINENO_MAX)
> ++                nasm_error(ERR_FATAL,
> ++                    "overall line number reaches the maximum %d\n",
> ++                    GLOBALLINENO_MAX);
> +
> +             /*
> +              * Here we parse our directives; this is not handled by the
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/nasm/nasm/0001-fix-CVE-2018-8882.patch b/meta/recipes-devtools/nasm/nasm/0001-fix-CVE-2018-8882.patch
> new file mode 100644
> index 0000000..bc706c3
> --- /dev/null
> +++ b/meta/recipes-devtools/nasm/nasm/0001-fix-CVE-2018-8882.patch
> @@ -0,0 +1,30 @@
> +From 33438037e00ec750bff020578b1a5b6f75f60555 Mon Sep 17 00:00:00 2001
> +From: Adam Majer <amajer@suse.de>
> +Date: Fri, 17 Aug 2018 14:41:02 +0800
> +Subject: [PATCH] fix CVE-2018-8882
> +
> +https://bugzilla.nasm.us/show_bug.cgi?id=3392445
> +
> +Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392445]
> +CVE: CVE-2018-8882
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + asm/float.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/asm/float.c b/asm/float.c
> +index dcf69fea..2965d3db 100644
> +--- a/asm/float.c
> ++++ b/asm/float.c
> +@@ -608,6 +608,8 @@ static void ieee_shr(fp_limb *mant, int i)
> +         if (offs)
> +             for (j = MANT_LIMBS-1; j >= offs; j--)
> +                 mant[j] = mant[j-offs];
> ++    } else if (MANT_LIMBS-1-offs < 0) {
> ++        j = MANT_LIMBS-1;
> +     } else {
> +         n = mant[MANT_LIMBS-1-offs] >> sr;
> +         for (j = MANT_LIMBS-1; j > offs; j--) {
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/nasm/nasm_2.13.03.bb b/meta/recipes-devtools/nasm/nasm_2.13.03.bb
> index 236d7e5..ae2ad7f 100644
> --- a/meta/recipes-devtools/nasm/nasm_2.13.03.bb
> +++ b/meta/recipes-devtools/nasm/nasm_2.13.03.bb
> @@ -5,6 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
>   
>   SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
>              file://0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch \
> +           file://0001-asm-eval.c-Avoid-possible-divide-by-0.patch \
> +           file://0001-assemble-Check-global-line-limit.patch \
> +           file://0001-fix-CVE-2018-8882.patch \
> +           file://0001-Verify-that-we-are-not-reading-past-end-of-a-buffer.patch \
>              "
>   
>   SRC_URI[md5sum] = "0c581d482f39d5111879ca9601938f74"



