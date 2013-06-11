Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DC7736AA62
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 23:16:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 11 Jun 2013 16:16:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,847,1363158000"; d="scan'208";a="348416162"
Received: from unknown (HELO [10.255.12.247]) ([10.255.12.247])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jun 2013 16:17:09 -0700
Message-ID: <51B7AFD8.7060604@linux.intel.com>
Date: Tue, 11 Jun 2013 16:16:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1370987869-19041-1-git-send-email-raj.khem@gmail.com>
	<1370989876-20531-1-git-send-email-Martin.Jansa@gmail.com>
	<20130611223524.GM3233@jama>
	<D18769ED-F695-463A-83D4-D20A1EB3AC2F@gmail.com>
	<20130611230025.GN3233@jama>
In-Reply-To: <20130611230025.GN3233@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] gcc-4.8: Backport fix for ICE triggered in pixman
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
X-List-Received-Date: Tue, 11 Jun 2013 23:16:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2013 04:00 PM, Martin Jansa wrote:
> On Tue, Jun 11, 2013 at 03:39:35PM -0700, Khem Raj wrote:
>>
>> On Jun 11, 2013, at 3:35 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>>> On Wed, Jun 12, 2013 at 12:31:16AM +0200, Martin Jansa wrote:
>>>> * http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57329
>>>
>>> Only RFC, because world build is still running to confirm that it
>>> doesn't introduce new issues and that it indeed fixes pixman build for
>>> xscalete.
>>
>> can you also test it with rebased on top of gcc 4.8.1 upgrade patch I sent earlier today
>
> It is, that's why I've sent it as reply-to <your-patch>.
>
> And jenkins is indeed testing your 4.8.1 + this one.
>
I will throw this all against the AB later today, it's busy with 1.4.1 
currently.  I will start some local worlds here also.

Sau!
>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>> ---
>>>> meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
>>>> .../gcc/gcc-4.8/0036-PR-target-56102.patch         | 83 ++++++++++++++++++++++
>>>> 2 files changed, 84 insertions(+)
>>>> create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch
>>>>
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
>>>> index 6664f1c..bfdb766 100644
>>>> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
>>>> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
>>>> @@ -65,6 +65,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>> 	   file://0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
>>>> 	   file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
>>>> 	   file://0035-wcast-qual-PR-55383.patch \
>>>> +	   file://0036-PR-target-56102.patch \
>>>> 	   file://gcc-4.8-PR56797.patch \
>>>> 	   file://gcc-4.8-build-args.patch \
>>>> 	  "
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch b/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch
>>>> new file mode 100644
>>>> index 0000000..a9498fc
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch
>>>> @@ -0,0 +1,83 @@
>>>> +From fa049b3584a1cc36c250205e3d5841e6a40ff677 Mon Sep 17 00:00:00 2001
>>>> +From: amker <amker@138bc75d-0d04-0410-961f-82ee72b054a4>
>>>> +Date: Wed, 27 Mar 2013 08:16:54 +0000
>>>> +Subject: [PATCH] PR target/56102
>>>> +
>>>> +* config/arm/arm.c (thumb1_rtx_costs, thumb1_size_rtx_costs): Fix rtx costs for SET/ASHIFT/ASHIFTRT/LSHIFTRT/ROTATERT patterns with mult-word mode.
>>>> +
>>>> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@197155 138bc75d-0d04-0410-961f-82ee72b054a4
>>>> +
>>>> +Upstream-Status: Backport
>>>> +http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57329
>>>> +
>>>> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>> +---
>>>> + gcc/config/arm/arm.c | 17 ++++++++++++++---
>>>> + 1 file changed, 14 insertions(+), 3 deletions(-)
>>>> +
>>>> +diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
>>>> +index 460d333..edf850d 100644
>>>> +--- a/gcc/config/arm/arm.c
>>>> ++++ b/gcc/config/arm/arm.c
>>>> +@@ -7094,7 +7094,7 @@ static inline int
>>>> + thumb1_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
>>>> + {
>>>> +   enum machine_mode mode = GET_MODE (x);
>>>> +-  int total;
>>>> ++  int total, words;
>>>> +
>>>> +   switch (code)
>>>> +     {
>>>> +@@ -7102,6 +7102,8 @@ thumb1_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
>>>> +     case ASHIFTRT:
>>>> +     case LSHIFTRT:
>>>> +     case ROTATERT:
>>>> ++      return (mode == SImode) ? COSTS_N_INSNS (1) : COSTS_N_INSNS (2);
>>>> ++
>>>> +     case PLUS:
>>>> +     case MINUS:
>>>> +     case COMPARE:
>>>> +@@ -7125,7 +7127,10 @@ thumb1_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
>>>> +       return COSTS_N_INSNS (1) + 16;
>>>> +
>>>> +     case SET:
>>>> +-      return (COSTS_N_INSNS (1)
>>>> ++      /* A SET doesn't have a mode, so let's look at the SET_DEST to get
>>>> ++	 the mode.  */
>>>> ++      words = ARM_NUM_INTS (GET_MODE_SIZE (GET_MODE (SET_DEST (x))));
>>>> ++      return (COSTS_N_INSNS (words)
>>>> + 	      + 4 * ((MEM_P (SET_SRC (x)))
>>>> + 		     + MEM_P (SET_DEST (x))));
>>>> +
>>>> +@@ -7822,6 +7827,7 @@ static inline int
>>>> + thumb1_size_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
>>>> + {
>>>> +   enum machine_mode mode = GET_MODE (x);
>>>> ++  int words;
>>>> +
>>>> +   switch (code)
>>>> +     {
>>>> +@@ -7829,6 +7835,8 @@ thumb1_size_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
>>>> +     case ASHIFTRT:
>>>> +     case LSHIFTRT:
>>>> +     case ROTATERT:
>>>> ++      return (mode == SImode) ? COSTS_N_INSNS (1) : COSTS_N_INSNS (2);
>>>> ++
>>>> +     case PLUS:
>>>> +     case MINUS:
>>>> +     case COMPARE:
>>>> +@@ -7847,7 +7855,10 @@ thumb1_size_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
>>>> +       return COSTS_N_INSNS (1);
>>>> +
>>>> +     case SET:
>>>> +-      return (COSTS_N_INSNS (1)
>>>> ++      /* A SET doesn't have a mode, so let's look at the SET_DEST to get
>>>> ++	 the mode.  */
>>>> ++      words = ARM_NUM_INTS (GET_MODE_SIZE (GET_MODE (SET_DEST (x))));
>>>> ++      return (COSTS_N_INSNS (words)
>>>> +               + 4 * ((MEM_P (SET_SRC (x)))
>>>> +                      + MEM_P (SET_DEST (x))));
>>>> +
>>>> +--
>>>> +1.8.2.1
>>>> +
>>>> --
>>>> 1.8.2.1
>>>>
>>>
>>> --
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

