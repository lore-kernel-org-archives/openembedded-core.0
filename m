Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id A426E6E947
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 03:10:57 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id y13so9112592pdi.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2014 19:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=a2l0j7j9PRB4vKecs7X9NcUfc99SyiAst9AEbPtQZyw=;
	b=mji+k9j48pV1VFdrMfaM3UjAmzDI+sUhC3wWVm/pMxsLUURjJTXRwA3VEBmVlPI5Jv
	v/mcAQ3wURY4HR6KpzaHyYaUAnsh322ZDfdr7aHjubw1ZrSxBHd4BfnxkYi7tYybGrpA
	vwMjsBsuo+6PC3KuEmc6O3HQy2/aryiLnv5R5xs1QVSDzfN4PktmRV0XSzkj3M9Z27iT
	DSFzhOZJpfkpjhqImdYZVjptQxaNPyPWl/8eIhgFaFmKGsWhUzzgDX19tVWHdqVJPird
	7V+K7sV+ilgIPCGL+T5mkGC5gYyevGTmMpKx6Ytk6mpi5rExnF75e1LjDWxy5ykTS4Qn
	p+PA==
MIME-Version: 1.0
X-Received: by 10.68.98.3 with SMTP id ee3mr48351584pbb.31.1391569858369; Tue,
	04 Feb 2014 19:10:58 -0800 (PST)
Received: by 10.68.158.116 with HTTP; Tue, 4 Feb 2014 19:10:58 -0800 (PST)
In-Reply-To: <CANyK_8c6=q9b+0zmqUOdZsUBVX52FZCr7t5Fh=-xiLR3cdQ8zQ@mail.gmail.com>
References: <cover.1391534980.git.bruce.ashfield@windriver.com>
	<8a4a98cc53998f6bbf08763359e1b560b2da3e54.1391534980.git.bruce.ashfield@windriver.com>
	<1391556415.15248.2.camel@ted>
	<CADkTA4PeY8XL=h7xSsBVYXEBUx56_sTXjhPQ-sV0pjAQHvHrEQ@mail.gmail.com>
	<CANyK_8c6=q9b+0zmqUOdZsUBVX52FZCr7t5Fh=-xiLR3cdQ8zQ@mail.gmail.com>
Date: Tue, 4 Feb 2014 22:10:58 -0500
Message-ID: <CADkTA4OcJ4yp9-Fzatzu9Fv0DjNbCvu-pOpQiASPE_GhDWSUWA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel: stop using -exec rm for deleting files
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
X-List-Received-Date: Wed, 05 Feb 2014 03:10:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 4, 2014 at 8:36 PM, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 5 February 2014 00:35, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>> On Tue, Feb 4, 2014 at 6:26 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Tue, 2014-02-04 at 12:34 -0500, Bruce Ashfield wrote:
>>>> Removing files from the source tree via find, exec and rm is not the
>>>> most efficient operation, due to (among other things) the many forked
>>>> processes.
>>>>
>>>> If we use -delete, it saves a significant amount of time. But -delete
>>>> does not work with -prune (since it forces -depth). To maintain the
>>>> lib, tools and scripts source files, we can hide them temporarily,
>>>> skip their hidden directories and then finally restore them.
>>>>
>>>> Time for install before this change:
>>>>
>>>>  real    2m48.563s
>>>>  user    0m35.220s
>>>>  sys     0m33.036s
>>>>
>>>> Time for install after this change:
>>>>
>>>>  real    1m21.301s
>>>>  user    0m33.160s
>>>>  sys     0m28.388s
>>>>
>>>> We could further speed this up by using inline perl to delete the files,
>>>> but that complexity is avoided for now.
>>>>
>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>> ---
>>>>  meta/classes/kernel.bbclass | 18 +++++++++++++++---
>>>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>>> index 51626b03f824..b76a65699755 100644
>>>> --- a/meta/classes/kernel.bbclass
>>>> +++ b/meta/classes/kernel.bbclass
>>>> @@ -260,9 +260,21 @@ kernel_do_install() {
>>>>       # we clean the scripts dir while leaving the generated config
>>>>       # and include files.
>>>>       #
>>>> -     oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
>>>> -     make -C $kerneldir _mrproper_scripts
>>>> -     find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
>>>
>>> If we wanted to keep the single expression like this, we could do
>>> something like:
>>>
>>> find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -print0 | xargs -0 rm -f
>>>
>>> ?
>>>
>>> I don't have strong feelings about it, I'm just curious if you tried it
>>> really. The xargs should batch things up enough that the fork overhead
>>> is much less.
>>
>> I did try xargs, and a few other things in between. I had a 7 hour plane flight
>> to look into this (and packaging overhead .. that's next) and I tried
>> a few other
>> techniques. As I hinted in my commit message, the fastest is to actually
>> locate the files with perl and calling unlink() directly .. but that's
>> even more of
>> a departure from what we had before :)
>>
>> find, prune and friends get so unreadable, that when I found the faster way, I
>> tossed them in the bin and didn't look back!
>>
>
> How does """find $kerneldir -not -regex
> $kerneldir'/\(lib\|tools\|scripts)/.*' -type f -name "*.[csS]"
> -delete""" stack up?

timewise it is similar, but I could have cooked that up myself .. I just don't
like incantations of find and its arcane options.

Bruce

>
> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

