Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-10.prod.phx3.secureserver.net
	(p3plsmtpa09-10.prod.phx3.secureserver.net [173.201.193.239])
	by mail.openembedded.org (Postfix) with ESMTP id 88E4B6AC44
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 13:44:56 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa09-10.prod.phx3.secureserver.net with 
	id 91kt1p00f0BVjqb011kvfa; Wed, 29 Oct 2014 06:44:56 -0700
Message-ID: <5450EF4B.8070705@pabigot.com>
Date: Wed, 29 Oct 2014 08:44:43 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1414550044-1427-1-git-send-email-jackie.huang@windriver.com>	<CAMKF1sqH9mGSoXaZkbSBy0rpFoDDHp2UhaFW-G53ogx3VueHEg@mail.gmail.com>	<5450C8AA.9070305@pabigot.com>	<5450E88E.5090105@windriver.com>
	<5450EC54.4000708@windriver.com>
In-Reply-To: <5450EC54.4000708@windriver.com>
Subject: Re: [PATCH] gcc: fix ICE in dwarf2out_var_location
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
X-List-Received-Date: Wed, 29 Oct 2014 13:45:04 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/2014 08:32 AM, Mark Hatle wrote:
> On 10/29/14, 8:15 AM, Mark Hatle wrote:
>> On 10/29/14, 5:59 AM, Peter A. Bigot wrote:
>>> On 10/28/2014 10:41 PM, Khem Raj wrote:
>>>> On Tue, Oct 28, 2014 at 7:34 PM, <jackie.huang@windriver.com> wrote:
>>>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>>>
>>>>> Fixed the ICE:
>>>>> internal compiler error: in dwarf2out_var_location, at 
>>>>> dwarf2out.c:21261
>>>>>
>>>> this looks ok. but we need the test case too. and a nit more 
>>>> documentation
>>>
>>> Agreed.  We're getting a lot of Wind River patches these days that are
>>> pretty sparse on context and justification.
>>>
>>> For backport patches to GCC and most other projects, I'd really love to
>>> see them provided by cloning the upstream repository and using
>>> format-patch on the upstream commit that's being backported. This
>>> practice of discarding all that relevant information in favor of a 
>>> terse
>>
>> I just want to be clear the information isn't being discarded or 
>> "removed".  The
>> original work is being done by taking the latest tree, and diffing 
>> sections of
>> the code to find a relevant fix -- or looking in the mailing list for
>> discussions on similar problems.
>>
>> Also as far as I know the upstream gcc repository is still SVN, so the
>> "format-patch" git methods don't work.  Yes, I know there are people 
>> who have
>> converted the GCC SVN to git, but these are not canonical sources -- 
>> so I'm not
>> sure that is really an acceptable place to work.
>>
>> See: https://gcc.gnu.org
>> "Our sources are readily and freely available via SVN and weekly 
>> snapshots."
>
> Just to follow up, there is an apparently undocumented git mirror of 
> the SVN on the GNU site.  I still don't know if it's a canonical 
> source, but since it's on the GNU website, I'd have to assume it is.
>
> git://gcc.gnu.org/git/gcc.git

Yes, that's the one I was referring to.  It's the source of the gcc 
backport patches I've added to OE.

Using it, the specific fix referenced has apparently not been backported 
to gcc-4_9-branch.

Nor does it appear in trunk.

Trunk has 5e9c670f06b9eaa52db639b888e0b0d15ba864c1 which may or may not 
be fixing the same bug, but is definitely not this patch.

So I'd have to say that, if the submitted patch is a backport, then all 
the upstream context required to understand it has indeed been removed, 
and this patch to OE should be retracted.

>
> (I really wish GNU would get away from SVN...)

Ditto, but it's unlikely to happen.  Too big an impact to too many 
people.  That mirror is what I've used for gcc work for a couple years now.

Peter

>
> --Mark
>
>>> submitter-defined description makes it difficult to keep the OE patch
>>> set current on upstream updates and trust in the appropriateness of the
>>> patch.  Add only your sign-off and the Upstream-Status with a reference
>>> to the upstream bugreport.
>>
>> As for the other component critiques, I agree.. the message needs more
>> information, and if possible more information on what the backport 
>> actually
>> originated from is needed as well.  This example is terse at best and 
>> generally
>> not acceptable.
>>
>> --Mark
>>
>>> You might look at gcc-4.9's OE patch
>>> 0055-PR-rtl-optimization-61801.patch for an example.
>>>
>>> Peter
>>>
>>>>
>>>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>>>> ---
>>>>>     meta/recipes-devtools/gcc/gcc-4.9.inc              | 1 +
>>>>>     .../0058-gcc-ice-dwarf2out_var_location.patch      | 31 
>>>>> ++++++++++++++++++++++
>>>>>     2 files changed, 32 insertions(+)
>>>>>     create mode 100644 
>>>>> meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_location.patch
>>>>>
>>>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc 
>>>>> b/meta/recipes-devtools/gcc/gcc-4.9.inc
>>>>> index 9a66cd2..89c405a 100644
>>>>> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
>>>>> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
>>>>> @@ -71,6 +71,7 @@ SRC_URI = "\
>>>>> file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
>>>>>         file://0055-PR-rtl-optimization-61801.patch \
>>>>>         file://0056-top-level-reorder_gcc-bug-61144.patch \
>>>>> +    file://0058-gcc-ice-dwarf2out_var_location.patch \
>>>>>     "
>>>>>     SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
>>>>>     SRC_URI[sha256sum] = 
>>>>> "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
>>>>> diff --git 
>>>>> a/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_location.patch 
>>>>> b/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_location.patch 
>>>>>
>>>>> new file mode 100644
>>>>> index 0000000..28e7756
>>>>> --- /dev/null
>>>>> +++ 
>>>>> b/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_location.patch
>>>>> @@ -0,0 +1,31 @@
>>>>> +From d358f8ba2e530850795adce19bd00b57139d9397 Mon Sep 17 00:00:00 
>>>>> 2001
>>>>> +From: Baoshan Pang <baoshan.pang@windriver.com>
>>>>> +Date: Tue, 16 Sep 2014 13:32:13 -0700
>>>>> +Subject: [PATCH] Fix ICE in dwarf2out_var_location
>>>>> +
>>>>> +Upstream-Status: Backport
>>>>> +
>>>>> +Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
>>>>> +---
>>>>> + gcc/dwarf2out.c |    5 +++++
>>>>> + 1 file changed, 5 insertions(+)
>>>>> +
>>>>> +diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
>>>>> +index 1df565b..0e1557d 100644
>>>>> +--- a/gcc/dwarf2out.c
>>>>> ++++ b/gcc/dwarf2out.c
>>>>> +@@ -21255,6 +21255,11 @@ dwarf2out_var_location (rtx loc_note)
>>>>> +       ca_loc->call_arg_loc_note = loc_note;
>>>>> +       ca_loc->next = NULL;
>>>>> +       ca_loc->label = last_label;
>>>>> ++      while(prev && !CALL_P(prev) && !(GET_CODE (PATTERN (prev)) 
>>>>> == SEQUENCE
>>>>> ++                                     && CALL_P (XVECEXP (PATTERN 
>>>>> (prev), 0, 0)))){
>>>>> ++      gcc_assert(NONJUMP_INSN_P (prev));
>>>>> ++      prev = prev_real_insn (prev);
>>>>> ++      }
>>>>> +       gcc_assert (prev
>>>>> +                 && (CALL_P (prev)
>>>>> +                     || (NONJUMP_INSN_P (prev)
>>>>> +--
>>>>> +1.7.9.5
>>>>> +
>>>>> -- 
>>>>> 2.0.0
>>>>>
>>>>> -- 
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>


