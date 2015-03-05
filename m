Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6F26365C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 06:53:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t256rDnm015403
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Mar 2015 22:53:13 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 22:53:12 -0800
Message-ID: <54F7FD57.6000601@windriver.com>
Date: Thu, 5 Mar 2015 14:53:11 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1424759999-25846-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1424759999-25846-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] glibc: Help compile with -Os
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
X-List-Received-Date: Thu, 05 Mar 2015 06:53:15 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

I get errors when:
MACHINE = "qemux86"
DEBUG_BUILD = "1"

$ bitbake glibc

../include/inline-hashtab.h: In function '_dl_make_tlsdesc_dynamic':
./tlsdeschtab.h:28:1: error: inlining failed in call to 'hash_tlsdesc': indirect 
function call with a yet undetermined callee [-Werror=inline]
  hash_tlsdesc (void *p)
  ^
In file included from ./tlsdeschtab.h:25:0,
                  from ../sysdeps/i386/tlsdesc.c:25:
../include/inline-hashtab.h:154:3: error: called from here [-Werror=inline]
   *find_empty_slot_for_expand (htab, hash_fn (*p))
    ^
In file included from ../sysdeps/i386/tlsdesc.c:25:0:
./tlsdeschtab.h:28:1: error: inlining failed in call to 'hash_tlsdesc': indirect 
function call with a yet undetermined callee [-Werror=inline]
  hash_tlsdesc (void *p)
  ^
In file included from ./tlsdeschtab.h:25:0,
                  from ../sysdeps/i386/tlsdesc.c:25:
../include/inline-hashtab.h:201:8: error: called from here [-Werror=inline]
    hash = hash_fn (ptr);
         ^
In file included from ../sysdeps/i386/tlsdesc.c:25:0:
./tlsdeschtab.h:38:1: error: inlining failed in call to 'eq_tlsdesc': indirect 
function call with a yet undetermined callee [-Werror=inline]
  eq_tlsdesc (void *p, void *q)
  ^
In file included from ./tlsdeschtab.h:25:0,
                  from ../sysdeps/i386/tlsdesc.c:25:
../include/inline-hashtab.h:209:12: error: called from here [-Werror=inline]
    else if (eq_fn (*entry, ptr))
             ^
In file included from ../sysdeps/i386/tlsdesc.c:25:0:
./tlsdeschtab.h:38:1: error: inlining failed in call to 'eq_tlsdesc': indirect 
function call with a yet undetermined callee [-Werror=inline]
  eq_tlsdesc (void *p, void *q)
  ^
In file included from ./tlsdeschtab.h:25:0,
                  from ../sysdeps/i386/tlsdesc.c:25:
../include/inline-hashtab.h:222:16: error: called from here [-Werror=inline]
        else if (eq_fn (*entry, ptr))

// Robert

On 02/24/2015 02:39 PM, Khem Raj wrote:
> When we modify to use -Os
> -Werror doesnt go well with it, glibc needs to be
> cleaned up for that but until then lets disable -Werror
> when using -Os
>
> Change-Id: I5495255fce67953f15c07e423e3e0eef41d4ce5e
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-core/glibc/glibc.inc                  |  3 ++
>   .../glibc/glibc/eglibc-use-option-groups.patch     | 47 ++++++++++++++++++----
>   2 files changed, 43 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index 99a4753..4d5e98b 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -15,6 +15,9 @@ def get_optimization(d):
>       if bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
>           bb.note("glibc can't be built with -O0, -O2 will be used instead.")
>           return selected_optimization.replace("-O0", "-O2")
> +    elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
> +        bb.note("glibc can't be built with -Os, -Os -Wno-error will be used instead.")
> +        return selected_optimization.replace("-Os", "-Os -Wno-error")
>       return selected_optimization
>
>   SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
> diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> index 0fcaff9..439b4a9 100644
> --- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> +++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> @@ -2294,11 +2294,37 @@ Index: git/locale/programs/locfile.h
>    /* Change the output to be big-endian if BIG_ENDIAN is true and
>       little-endian otherwise.  */
>    static inline void
> -@@ -276,4 +278,49 @@ extern void identification_output (struc
> +@@ -89,7 +91,8 @@ maybe_swap_uint32 (uint32_t value)
> + }
> +
> + /* Likewise, but munge an array of N uint32_ts starting at ARRAY.  */
> +-static inline void
> ++static void
> ++__attribute__ ((unused))
> + maybe_swap_uint32_array (uint32_t *array, size_t n)
> + {
> +   if (swap_endianness_p)
> +@@ -99,7 +102,8 @@ maybe_swap_uint32_array (uint32_t *array
> +
> + /* Like maybe_swap_uint32_array, but the array of N elements is at
> +    the end of OBSTACK's current object.  */
> +-static inline void
> ++static void
> ++__attribute__ ((unused))
> + maybe_swap_uint32_obstack (struct obstack *obstack, size_t n)
> + {
> +   maybe_swap_uint32_array ((uint32_t *) obstack_next_free (obstack) - n, n);
> +@@ -276,4 +280,55 @@ extern void identification_output (struc
>    				   const struct charmap_t *charmap,
>    				   const char *output_path);
>
> -+static inline size_t
> ++static size_t wcslen_uint32 (const uint32_t *str) __attribute__ ((unused));
> ++static uint32_t * wmemcpy_uint32 (uint32_t *s1, const uint32_t *s2, size_t n) __attribute__ ((unused));
> ++static uint32_t * wcschr_uint32 (const uint32_t *s, uint32_t ch) __attribute__ ((unused));
> ++static int wcscmp_uint32 (const uint32_t *s1, const uint32_t *s2) __attribute__ ((unused));
> ++static int wmemcmp_uint32 (const uint32_t *s1, const uint32_t *s2, size_t n) __attribute__ ((unused));
> ++
> ++static size_t
>   +wcslen_uint32 (const uint32_t *str)
>   +{
>   +  size_t len = 0;
> @@ -2307,7 +2333,7 @@ Index: git/locale/programs/locfile.h
>   +  return len;
>   +}
>   +
> -+static inline int
> ++static  int
>   +wmemcmp_uint32 (const uint32_t *s1, const uint32_t *s2, size_t n)
>   +{
>   +  while (n-- != 0)
> @@ -2319,7 +2345,7 @@ Index: git/locale/programs/locfile.h
>   +  return 0;
>   +}
>   +
> -+static inline int
> ++static int
>   +wcscmp_uint32 (const uint32_t *s1, const uint32_t *s2)
>   +{
>   +  while (*s1 != 0 && *s1 == *s2)
> @@ -2327,13 +2353,13 @@ Index: git/locale/programs/locfile.h
>   +  return *s1 - *s2;
>   +}
>   +
> -+static inline uint32_t *
> ++static uint32_t *
>   +wmemcpy_uint32 (uint32_t *s1, const uint32_t *s2, size_t n)
>   +{
>   +  return memcpy (s1, s2, n * sizeof (uint32_t));
>   +}
>   +
> -+static inline uint32_t *
> ++static uint32_t *
>   +wcschr_uint32 (const uint32_t *s, uint32_t ch)
>   +{
>   +  do
> @@ -5627,7 +5653,7 @@ Index: git/posix/regexec.c
>          /* match with character_class?  */
>          for (i = 0; i < cset->nchar_classes; ++i)
>    	{
> -@@ -3863,8 +3843,16 @@ check_node_accept_bytes (const re_dfa_t
> +@@ -3863,14 +3843,22 @@ check_node_accept_bytes (const re_dfa_t
>    	      goto check_node_accept_bytes_match;
>    	    }
>    	}
> @@ -5645,6 +5671,13 @@ Index: git/posix/regexec.c
>          nrules = _NL_CURRENT_WORD (LC_COLLATE, _NL_COLLATE_NRULES);
>          if (nrules != 0)
>    	{
> + 	  unsigned int in_collseq = 0;
> + 	  const int32_t *table, *indirect;
> +-	  const unsigned char *weights, *extra;
> ++	  const unsigned char *weights, *extra = NULL;
> + 	  const char *collseqwc;
> +
> + 	  /* match with collating_symbol?  */
>   @@ -3955,8 +3943,12 @@ check_node_accept_bytes (const re_dfa_t
>    	    }
>    	}
>

