Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 91F6F706AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Aug 2014 00:52:09 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id pv20so4391567lab.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 17:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XjggLwM0KKpw4D1x0fOk2iR3l9voQXPvgbHdatKCges=;
	b=F6u989CdpHr0BssJq7rkw9LrImJJ9dCQZpqspsVy0xpVB1bOPToc1kD4DX7yfvdICc
	rZN/x5GOWAtZM/yzveyUSc1Ed8Vfp5VdXMyd/+2GNot4G1OPWeqxmKBzeFB8YIShRlez
	VOcqpvpFB12LhgiAUNPyD/ngMgXagXOvu9Finzu14Kotk7DNoKE1kRKQB8uZVKbZ1b2n
	q+K6rm6c1xaWf+REVsdSIzvjQ7BAug573f2zMzD/SM0lzaS1YY1H+shG3oKA0yJVyxDs
	zVeMpd3DHnpQK4k/j+wCtvYjbB0h5FXfnLp7Cs/WCFXsDfjV8/f1RWMYekK2bTkHcx0Q
	sBQw==
MIME-Version: 1.0
X-Received: by 10.152.25.136 with SMTP id c8mr20203717lag.64.1409446330512;
	Sat, 30 Aug 2014 17:52:10 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Sat, 30 Aug 2014 17:52:10 -0700 (PDT)
In-Reply-To: <1409406941.29296.216.camel@ted>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
	<efcd26d4f457c8f5f658a1a3ab9e5c2aa03a6a65.1409345003.git.bruce.ashfield@windriver.com>
	<1409406941.29296.216.camel@ted>
Date: Sat, 30 Aug 2014 20:52:10 -0400
Message-ID: <CADkTA4O1z_cBZhu=oBvXcKMbYhkCN5t0Jja=C3NJGRgcv_-cJA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/18] kernel-yocto: move SRCREV validation to patching phase
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
X-List-Received-Date: Sun, 31 Aug 2014 00:52:12 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 30, 2014 at 9:55 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2014-08-30 at 00:38 -0400, Bruce Ashfield wrote:
>> Rather than attempting to condition the entire tree to machine SRCREV (since
>> we don't know what branch will be built), we can instead wait until patching
>> has completed and then confirm that we are indeed building a decendant of the
>> specified SRCREV. The result is a much simpler check, and no mangling of the
>> tree.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>  meta/classes/kernel-yocto.bbclass | 39 +++++++++++++++++++++++----------------
>>  1 file changed, 23 insertions(+), 16 deletions(-)
>
> Looks like some versions of git on the AB cluster don't support this. Do
> we need to bump the minimum git version and install buildtools-tarball
> on the affected machines? Or can we use some other construct here?

Ah crap. After I sent the series, I meant to follow up and say just this .. that
if I use the ancestor construct .. it may cause problems.

I have a fallback strategy and will send an incremental patch on the end of the
series.

Bruce

>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/builds/24/steps/BuildImages/logs/stdio
>
> Cheers,
>
> Richard
>
>
>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
>> index 38c886b21b09..4938712c7cff 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -71,6 +71,7 @@ do_patch() {
>>       fi
>>
>>       machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
>> +     machine_srcrev="${SRCREV_machine}"
>>
>>       # if we have a defined/set meta branch we should not be generating
>>       # any meta data. The passed branch has what we need.
>> @@ -122,6 +123,17 @@ do_patch() {
>>               exit 1
>>       fi
>>
>> +     # see if the branch we are about to patch has been properly reset to the defined
>> +     # SRCREV .. if not, we reset it.
>> +     branch_head=`git rev-parse HEAD`
>> +     if [ "${machine_srcrev}" != "AUTOINC" ]; then
>> +             if [ "${machine_srcrev}" != "${branch_head}" ]; then
>> +                     current_branch=`git rev-parse --abbrev-ref HEAD`
>> +                     git branch "$current_branch-orig"
>> +                     git reset --hard ${machine_srcrev}
>> +             fi
>> +     fi
>> +
>>       # executes and modifies the source tree as required
>>       patchme ${KMACHINE}
>>       if [ $? -ne 0 ]; then
>> @@ -130,6 +142,17 @@ do_patch() {
>>               exit 1
>>       fi
>>
>> +     # check to see if the specified SRCREV is reachable from the final branch.
>> +     # if it wasn't something wrong has happened, and we should error.
>> +     if [ "${machine_srcrev}" != "AUTOINC" ]; then
>> +             git merge-base --is-ancestor ${machine_srcrev} HEAD
>> +             if [ $? -ne 0 ]; then
>> +                     bbnote "ERROR: SRCREV ${machine_srcrev} was specified, but is not reachable"
>> +                     bbnote "       Check the BSP description for incorrect branch selection, or other errors."
>> +                     exit 1
>> +             fi
>> +     fi
>> +
>>       # Perform a final check. If something other than the default kernel
>>       # branch was requested, and that's not where we ended up, then we
>>       # should thrown an error, since we aren't building what was expected
>> @@ -335,22 +358,6 @@ do_validate_branches() {
>>               exit 1
>>       fi
>>
>> -     # force the SRCREV in each branch that contains the specified
>> -     # SRCREV (if it isn't the current HEAD of that branch)
>> -     git checkout -q master
>> -     for b in $containing_branches; do
>> -             branch_head=`git show-ref -s --heads ${b}`
>> -             if [ "$branch_head" != "$machine_srcrev" ]; then
>> -                     echo "[INFO] Setting branch $b to ${machine_srcrev}"
>> -                     if [ "$b" = "master" ]; then
>> -                             git reset --hard $machine_srcrev > /dev/null
>> -                     else
>> -                             git branch -D $b > /dev/null
>> -                             git branch $b $machine_srcrev > /dev/null
>> -                     fi
>> -             fi
>> -     done
>> -
>>       ## KMETA branch validation.
>>       ## We do validation if the meta branch exists, and AUTOREV hasn't been set
>>       meta_head=`git show-ref -s --heads ${KMETA}`
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

