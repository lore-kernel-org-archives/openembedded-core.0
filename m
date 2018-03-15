Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DF508788F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 20:03:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2FK3wZ0006266
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Mar 2018 13:03:59 -0700
Received: from soho-mhatle-m.local (147.11.116.133) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 15 Mar 2018 13:03:58 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180315164509.171474-1-mark.hatle@windriver.com>
	<CAMKF1sqWs_YEmaM35VOKFr4umjQq94GUG=15zvQs8tdYjzE2Fg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <cfc9ae78-271f-4f97-5b27-dcfd27f176cc@windriver.com>
Date: Thu, 15 Mar 2018 13:03:58 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqWs_YEmaM35VOKFr4umjQq94GUG=15zvQs8tdYjzE2Fg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: backport patch to fix ICE in MIPS64 target in G++
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
X-List-Received-Date: Thu, 15 Mar 2018 20:03:59 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/15/18 11:36 AM, Khem Raj wrote:
> On Thu, Mar 15, 2018 at 9:45 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> Backport a patch to fix an ICE when compiling for MIPS64.
>>
> 
> has it been tested with gcc tests and submitting upstream for a potential
> backport into gcc-7-branch ?

Yes, it resolves some issues with gcc tests.

I found a reference when I submitted this last time (a month or so ago) that it
has been suggested for a backport and nothing happened.. but I don't remember
where it was.

--Mark

>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-7.3.inc              |   1 +
>>  .../gcc-7.3/0001-PR-rtl-optimization-83030.patch   | 272 +++++++++++++++++++++
>>  2 files changed, 273 insertions(+)
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-PR-rtl-optimization-83030.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
>> index d56d2c5..b0cba27 100644
>> --- a/meta/recipes-devtools/gcc/gcc-7.3.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
>> @@ -78,6 +78,7 @@ SRC_URI = "\
>>  "
>>  BACKPORTS = "\
>>             file://0001-Fix-internal-compiler-error-in-testcase.patch \
>> +           file://0001-PR-rtl-optimization-83030.patch \
>>  "
>>
>>  SRC_URI[md5sum] = "be2da21680f27624f3a87055c4ba5af2"
>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-rtl-optimization-83030.patch b/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-rtl-optimization-83030.patch
>> new file mode 100644
>> index 0000000..71f7988
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-rtl-optimization-83030.patch
>> @@ -0,0 +1,272 @@
>> +From f5c4a9440f15ccf6775659910a2014a5494ee86e Mon Sep 17 00:00:00 2001
>> +From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
>> +Date: Wed, 22 Nov 2017 21:43:22 +0000
>> +Subject: [PATCH]       PR rtl-optimization/83030       * doc/rtl.texi (Flags
>> + in an RTL Expression): Alphabetize, add entry         for CROSSING_JUMP_P and
>> + mention usage of 'jump' for JUMP_INSNs.       (Insns): Delete entry for
>> + REG_CROSSING_JUMP in register notes.  * bb-reorder.c
>> + (update_crossing_jump_flags): Do not test whether the         CROSSING_JUMP_P flag
>> + is already set before setting it.     * cfgrtl.c (fixup_partition_crossing):
>> + Likewise.     * reorg.c (relax_delay_slots): Do not consider a
>> + CROSSING_JUMP_P insn  as useless.
>> +
>> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@255083 138bc75d-0d04-0410-961f-82ee72b054a4
>> +
>> +Upstream-Status: Backport
>> +
>> +This patch removes changes to Changelog from the original upstream patch.
>> +This will help us avoid conflicts.
>> +
>> +Original backport to GCC 7.x by Amruta Pawar <Amruta.Pawar@kpit.com>
>> +
>> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> +
>> +---
>> + gcc/bb-reorder.c |   5 +--
>> + gcc/cfgrtl.c     |   3 +-
>> + gcc/doc/rtl.texi | 129 ++++++++++++++++++++++++++++---------------------------
>> + gcc/reorg.c      |   7 +--
>> + 5 files changed, 84 insertions(+), 72 deletions(-)
>> +
>> +diff --git a/gcc/bb-reorder.c b/gcc/bb-reorder.c
>> +index 55e6dc6..794283c 100644
>> +--- a/gcc/bb-reorder.c
>> ++++ b/gcc/bb-reorder.c
>> +@@ -2236,10 +2236,7 @@ update_crossing_jump_flags (void)
>> +     FOR_EACH_EDGE (e, ei, bb->succs)
>> +       if (e->flags & EDGE_CROSSING)
>> +       {
>> +-        if (JUMP_P (BB_END (bb))
>> +-            /* Some flags were added during fix_up_fall_thru_edges, via
>> +-               force_nonfallthru_and_redirect.  */
>> +-            && !CROSSING_JUMP_P (BB_END (bb)))
>> ++        if (JUMP_P (BB_END (bb)))
>> +           CROSSING_JUMP_P (BB_END (bb)) = 1;
>> +         break;
>> +       }
>> +diff --git a/gcc/cfgrtl.c b/gcc/cfgrtl.c
>> +index d6e5ac0..a2ad075 100644
>> +--- a/gcc/cfgrtl.c
>> ++++ b/gcc/cfgrtl.c
>> +@@ -1334,8 +1334,7 @@ fixup_partition_crossing (edge e)
>> +   if (BB_PARTITION (e->src) != BB_PARTITION (e->dest))
>> +     {
>> +       e->flags |= EDGE_CROSSING;
>> +-      if (JUMP_P (BB_END (e->src))
>> +-        && !CROSSING_JUMP_P (BB_END (e->src)))
>> ++      if (JUMP_P (BB_END (e->src)))
>> +       CROSSING_JUMP_P (BB_END (e->src)) = 1;
>> +     }
>> +   else if (BB_PARTITION (e->src) == BB_PARTITION (e->dest))
>> +diff --git a/gcc/doc/rtl.texi b/gcc/doc/rtl.texi
>> +index 21524f5..a58eedc 100644
>> +--- a/gcc/doc/rtl.texi
>> ++++ b/gcc/doc/rtl.texi
>> +@@ -565,6 +565,16 @@ that are used in certain types of expression.  Most often they
>> + are accessed with the following macros, which expand into lvalues.
>> +
>> + @table @code
>> ++@findex CROSSING_JUMP_P
>> ++@cindex @code{jump_insn} and @samp{/j}
>> ++@item CROSSING_JUMP_P (@var{x})
>> ++Nonzero in a @code{jump_insn} if it crosses between hot and cold sections,
>> ++which could potentially be very far apart in the executable.  The presence
>> ++of this flag indicates to other optimizations that this branching instruction
>> ++should not be ``collapsed'' into a simpler branching construct.  It is used
>> ++when the optimization to partition basic blocks into hot and cold sections
>> ++is turned on.
>> ++
>> + @findex CONSTANT_POOL_ADDRESS_P
>> + @cindex @code{symbol_ref} and @samp{/u}
>> + @cindex @code{unchanging}, in @code{symbol_ref}
>> +@@ -577,37 +587,6 @@ In either case GCC assumes these addresses can be addressed directly,
>> + perhaps with the help of base registers.
>> + Stored in the @code{unchanging} field and printed as @samp{/u}.
>> +
>> +-@findex RTL_CONST_CALL_P
>> +-@cindex @code{call_insn} and @samp{/u}
>> +-@cindex @code{unchanging}, in @code{call_insn}
>> +-@item RTL_CONST_CALL_P (@var{x})
>> +-In a @code{call_insn} indicates that the insn represents a call to a
>> +-const function.  Stored in the @code{unchanging} field and printed as
>> +-@samp{/u}.
>> +-
>> +-@findex RTL_PURE_CALL_P
>> +-@cindex @code{call_insn} and @samp{/i}
>> +-@cindex @code{return_val}, in @code{call_insn}
>> +-@item RTL_PURE_CALL_P (@var{x})
>> +-In a @code{call_insn} indicates that the insn represents a call to a
>> +-pure function.  Stored in the @code{return_val} field and printed as
>> +-@samp{/i}.
>> +-
>> +-@findex RTL_CONST_OR_PURE_CALL_P
>> +-@cindex @code{call_insn} and @samp{/u} or @samp{/i}
>> +-@item RTL_CONST_OR_PURE_CALL_P (@var{x})
>> +-In a @code{call_insn}, true if @code{RTL_CONST_CALL_P} or
>> +-@code{RTL_PURE_CALL_P} is true.
>> +-
>> +-@findex RTL_LOOPING_CONST_OR_PURE_CALL_P
>> +-@cindex @code{call_insn} and @samp{/c}
>> +-@cindex @code{call}, in @code{call_insn}
>> +-@item RTL_LOOPING_CONST_OR_PURE_CALL_P (@var{x})
>> +-In a @code{call_insn} indicates that the insn represents a possibly
>> +-infinite looping call to a const or pure function.  Stored in the
>> +-@code{call} field and printed as @samp{/c}.  Only true if one of
>> +-@code{RTL_CONST_CALL_P} or @code{RTL_PURE_CALL_P} is true.
>> +-
>> + @findex INSN_ANNULLED_BRANCH_P
>> + @cindex @code{jump_insn} and @samp{/u}
>> + @cindex @code{call_insn} and @samp{/u}
>> +@@ -702,6 +681,29 @@ Stored in the @code{call} field and printed as @samp{/c}.
>> + Nonzero in a @code{mem} if the memory reference holds a pointer.
>> + Stored in the @code{frame_related} field and printed as @samp{/f}.
>> +
>> ++@findex MEM_READONLY_P
>> ++@cindex @code{mem} and @samp{/u}
>> ++@cindex @code{unchanging}, in @code{mem}
>> ++@item MEM_READONLY_P (@var{x})
>> ++Nonzero in a @code{mem}, if the memory is statically allocated and read-only.
>> ++
>> ++Read-only in this context means never modified during the lifetime of the
>> ++program, not necessarily in ROM or in write-disabled pages.  A common
>> ++example of the later is a shared library's global offset table.  This
>> ++table is initialized by the runtime loader, so the memory is technically
>> ++writable, but after control is transferred from the runtime loader to the
>> ++application, this memory will never be subsequently modified.
>> ++
>> ++Stored in the @code{unchanging} field and printed as @samp{/u}.
>> ++
>> ++@findex PREFETCH_SCHEDULE_BARRIER_P
>> ++@cindex @code{prefetch} and @samp{/v}
>> ++@cindex @code{volatile}, in @code{prefetch}
>> ++@item PREFETCH_SCHEDULE_BARRIER_P (@var{x})
>> ++In a @code{prefetch}, indicates that the prefetch is a scheduling barrier.
>> ++No other INSNs will be moved over it.
>> ++Stored in the @code{volatil} field and printed as @samp{/v}.
>> ++
>> + @findex REG_FUNCTION_VALUE_P
>> + @cindex @code{reg} and @samp{/i}
>> + @cindex @code{return_val}, in @code{reg}
>> +@@ -731,6 +733,37 @@ The same hard register may be used also for collecting the values of
>> + functions called by this one, but @code{REG_FUNCTION_VALUE_P} is zero
>> + in this kind of use.
>> +
>> ++@findex RTL_CONST_CALL_P
>> ++@cindex @code{call_insn} and @samp{/u}
>> ++@cindex @code{unchanging}, in @code{call_insn}
>> ++@item RTL_CONST_CALL_P (@var{x})
>> ++In a @code{call_insn} indicates that the insn represents a call to a
>> ++const function.  Stored in the @code{unchanging} field and printed as
>> ++@samp{/u}.
>> ++
>> ++@findex RTL_PURE_CALL_P
>> ++@cindex @code{call_insn} and @samp{/i}
>> ++@cindex @code{return_val}, in @code{call_insn}
>> ++@item RTL_PURE_CALL_P (@var{x})
>> ++In a @code{call_insn} indicates that the insn represents a call to a
>> ++pure function.  Stored in the @code{return_val} field and printed as
>> ++@samp{/i}.
>> ++
>> ++@findex RTL_CONST_OR_PURE_CALL_P
>> ++@cindex @code{call_insn} and @samp{/u} or @samp{/i}
>> ++@item RTL_CONST_OR_PURE_CALL_P (@var{x})
>> ++In a @code{call_insn}, true if @code{RTL_CONST_CALL_P} or
>> ++@code{RTL_PURE_CALL_P} is true.
>> ++
>> ++@findex RTL_LOOPING_CONST_OR_PURE_CALL_P
>> ++@cindex @code{call_insn} and @samp{/c}
>> ++@cindex @code{call}, in @code{call_insn}
>> ++@item RTL_LOOPING_CONST_OR_PURE_CALL_P (@var{x})
>> ++In a @code{call_insn} indicates that the insn represents a possibly
>> ++infinite looping call to a const or pure function.  Stored in the
>> ++@code{call} field and printed as @samp{/c}.  Only true if one of
>> ++@code{RTL_CONST_CALL_P} or @code{RTL_PURE_CALL_P} is true.
>> ++
>> + @findex RTX_FRAME_RELATED_P
>> + @cindex @code{insn} and @samp{/f}
>> + @cindex @code{call_insn} and @samp{/f}
>> +@@ -765,21 +798,6 @@ computation performed by this instruction, i.e., one that
>> + This flag is required for exception handling support on targets with RTL
>> + prologues.
>> +
>> +-@findex MEM_READONLY_P
>> +-@cindex @code{mem} and @samp{/u}
>> +-@cindex @code{unchanging}, in @code{mem}
>> +-@item MEM_READONLY_P (@var{x})
>> +-Nonzero in a @code{mem}, if the memory is statically allocated and read-only.
>> +-
>> +-Read-only in this context means never modified during the lifetime of the
>> +-program, not necessarily in ROM or in write-disabled pages.  A common
>> +-example of the later is a shared library's global offset table.  This
>> +-table is initialized by the runtime loader, so the memory is technically
>> +-writable, but after control is transferred from the runtime loader to the
>> +-application, this memory will never be subsequently modified.
>> +-
>> +-Stored in the @code{unchanging} field and printed as @samp{/u}.
>> +-
>> + @findex SCHED_GROUP_P
>> + @cindex @code{insn} and @samp{/s}
>> + @cindex @code{call_insn} and @samp{/s}
>> +@@ -879,14 +897,6 @@ Stored in the @code{volatil} field and printed as @samp{/v}.
>> + Most uses of @code{SYMBOL_REF_FLAG} are historic and may be subsumed
>> + by @code{SYMBOL_REF_FLAGS}.  Certainly use of @code{SYMBOL_REF_FLAGS}
>> + is mandatory if the target requires more than one bit of storage.
>> +-
>> +-@findex PREFETCH_SCHEDULE_BARRIER_P
>> +-@cindex @code{prefetch} and @samp{/v}
>> +-@cindex @code{volatile}, in @code{prefetch}
>> +-@item PREFETCH_SCHEDULE_BARRIER_P (@var{x})
>> +-In a @code{prefetch}, indicates that the prefetch is a scheduling barrier.
>> +-No other INSNs will be moved over it.
>> +-Stored in the @code{volatil} field and printed as @samp{/v}.
>> + @end table
>> +
>> + These are the fields to which the above macros refer:
>> +@@ -974,6 +985,8 @@ In a @code{set}, 1 means it is for a return.
>> +
>> + In a @code{call_insn}, 1 means it is a sibling call.
>> +
>> ++In a @code{jump_insn}, 1 means it is a crossing jump.
>> ++
>> + In an RTL dump, this flag is represented as @samp{/j}.
>> +
>> + @findex unchanging
>> +@@ -3887,16 +3900,6 @@ multiple targets; the last label in the insn (in the highest numbered
>> + insn-field) goes into the @code{JUMP_LABEL} field and does not have a
>> + @code{REG_LABEL_TARGET} note.  @xref{Insns, JUMP_LABEL}.
>> +
>> +-@findex REG_CROSSING_JUMP
>> +-@item REG_CROSSING_JUMP
>> +-This insn is a branching instruction (either an unconditional jump or
>> +-an indirect jump) which crosses between hot and cold sections, which
>> +-could potentially be very far apart in the executable.  The presence
>> +-of this note indicates to other optimizations that this branching
>> +-instruction should not be ``collapsed'' into a simpler branching
>> +-construct.  It is used when the optimization to partition basic blocks
>> +-into hot and cold sections is turned on.
>> +-
>> + @findex REG_SETJMP
>> + @item REG_SETJMP
>> + Appears attached to each @code{CALL_INSN} to @code{setjmp} or a
>> +diff --git a/gcc/reorg.c b/gcc/reorg.c
>> +index 5914af6..77f3fe7 100644
>> +--- a/gcc/reorg.c
>> ++++ b/gcc/reorg.c
>> +@@ -3360,10 +3360,11 @@ relax_delay_slots (rtx_insn *first)
>> +       }
>> +
>> +       /* See if we have a simple (conditional) jump that is useless.  */
>> +-      if (! INSN_ANNULLED_BRANCH_P (delay_jump_insn)
>> +-        && ! condjump_in_parallel_p (delay_jump_insn)
>> ++      if (!CROSSING_JUMP_P (delay_jump_insn)
>> ++        && !INSN_ANNULLED_BRANCH_P (delay_jump_insn)
>> ++        && !condjump_in_parallel_p (delay_jump_insn)
>> +         && prev_active_insn (as_a<rtx_insn *> (target_label)) == insn
>> +-        && ! BARRIER_P (prev_nonnote_insn (as_a<rtx_insn *> (target_label)))
>> ++        && !BARRIER_P (prev_nonnote_insn (as_a<rtx_insn *> (target_label)))
>> +         /* If the last insn in the delay slot sets CC0 for some insn,
>> +            various code assumes that it is in a delay slot.  We could
>> +            put it back where it belonged and delete the register notes,
>> +--
>> +1.8.5.6
>> +
>> --
>> 1.8.3.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


