Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C39456AC36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 21:08:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t2UL8jIG026958
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 14:08:45 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Mon, 30 Mar 2015 14:08:45 -0700
Message-ID: <5519BB5C.2060808@windriver.com>
Date: Mon, 30 Mar 2015 16:08:44 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1426283873-11784-1-git-send-email-jslater@windriver.com>	<4010D2ED-6067-4B6B-9C27-B2C5FC465DC9@gmail.com>	<1426627208.23698.39.camel@linuxfoundation.org>
	<007BD92917A2324FA403BCF9A464CF847769E93E@ALA-MBA.corp.ad.wrs.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF847769E93E@ALA-MBA.corp.ad.wrs.com>
Subject: [PATCH] gcc-cross-canadian: Add inhibit of split as well was Re: [PATCH 1/1] package.bbclass: decouple splitting	and stripping
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
X-List-Received-Date: Mon, 30 Mar 2015 21:08:44 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/18/15 12:44 PM, Slater, Joseph wrote:
> I just found out that this patch will break qa for ltp packaging.  The ltp recipe
> inhibits stripping which used to inhibit splitting.  If splitting is enabled,
> there are several .debug directories in places packages.bbclass doesn't look, so
> they wind up in ltp, not ltp-dbg.
> 
> It's tempting just to inhibit splitting since that was never really done before, anyhow,
> but I suppose that's not the right way to fix it.

In addition to ltp, I recently found this breaks gcc-cross-canadian, below is a
patch that should probably be applied even if this one does not make it in.


gcc-cross-canadian: Add inhibit of split as well

With the recent change to allow strip and split of packages to be controlled
seperately, gcc-cross-canadian will sometimes fail to build properly.  So in
addition to the existing inhibit strip, we also want to inhibit split.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 195b465..ad4b08f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -64,6 +64,7 @@ do_compile () {
 }

 INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

 # Having anything auto depending on gcc-cross-sdk is a really bad idea...
 EXCLUDE_FROM_SHLIBS = "1"


> Joe
> 
> 
>> -----Original Message-----
>> From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
>> Sent: Tuesday, March 17, 2015 2:20 PM
>> To: Bernhard Reutner-Fischer
>> Cc: Slater, Joseph; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [oe-core][PATCH 1/1] package.bbclass: decouple splitting and
>> stripping
>>
>> On Fri, 2015-03-13 at 23:50 +0100, Bernhard Reutner-Fischer wrote:
>>> On March 13, 2015 10:57:53 PM GMT+01:00, Joe Slater <jslater@windriver.com> wrote:
>>>> Fix logic in split_and_strip_files() to allow splitting or
>>>> stripping independently.  We also return quickly from this
>>>> function if we have nothing to do.  We seek the following behavior:
>>>>
>>>> Strip / Split     Behavior
>>>> yes   / yes       binaries stripped; debug info and source in -dbg
>>>> no    / yes       debug info and source in -dbg
>>>> yes   / no        binaries stripped; -dbg packages empty
>>>> no    / no        -dbg packages empty (not a very useful case)
>>>>
>>>> Currently, no/yes does not work and is the same as no/no.
>>>>
>>>> Signed-off-by: Joe Slater <jslater@windriver.com>
>>>> ---
>>>> meta/classes/package.bbclass |  108
>>>> ++++++++++++++++++++++--------------------
>>>> 1 file changed, 57 insertions(+), 51 deletions(-)
>>>>
>>>> diff --git a/meta/classes/package.bbclass
>>>> b/meta/classes/package.bbclass
>>>> index 9f64ed7..ad8771f 100644
>>>> --- a/meta/classes/package.bbclass
>>>> +++ b/meta/classes/package.bbclass
>>>> @@ -812,6 +812,12 @@ python fixup_perms () {
>>>> }
>>>>
>>>> python split_and_strip_files () {
>>>
>>>> +    for root, dirs, files in cpath.walk(dvar):
>>>> +        for f in files:
>>>> +            file = os.path.join(root, f)
>>>> +            if file.endswith(".ko") and file.find("/lib/modules/") !=
>>>> -1:
>>>> +                kernmods.append(file)
>>>> +                continue
>>>>
>>>> +            # Skip debug files
>>>> +            if debugappend and file.endswith(debugappend):
>>>> +                continue
>>>> +            if debugdir and debugdir in
>>>> os.path.dirname(file[len(dvar):]):
>>>> +                continue
>>>> +
>>>
>>> It's a pity to first construct the files just to throw them away right afterwards.
>>> Maybe there are other cpath.walk spots that would benefit from file_not_endswith and dir
>> filters?
>>
>> FWIW cpath is actually a caching wrapper around os.path so there is some
>> amount of caching going on here behind the scenes. The current code has
>> been profiled and the worst hot spots worked around with the cache...
>>
>> Its not perfect and I don't doubt more could be done but these pieces do
>> seem to help a lot. The best thing we did is avoid a lot of syscall
>> overhead.
>>
>> Cheers,
>>
>> Richard
> 


