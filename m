Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 48BE773197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 22:27:48 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l126so14828668wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 14:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4SfFd8gGMbjnXsYYK2PwMPECP5e1tZT+28JmagomeD8=;
	b=b6plyTp0eknfHEAbv0rdokF7ILsIkVjOHnt/fcY5aSDgCxDzAIBjnKME3uu847zBdp
	cqzjUkCg+GtgVsuJNK2Tik7fbAGGDchOKBjlTfQPc0+9PuhXa6HM13OHiL8ArFWiDe5B
	6n55cQMnhV6z7+dFNmqKCcUSgRptmN+RV4C7IIgD/scmmO7JbIfLbuU/sG8/F6OOF2Vi
	7SDmGf6AHbyUfJ7mUcAjMzSBztXu+aLaURppk8Cyo4rqr7kclN3aCifHKrwp4wFxEYcp
	dG4dqcBmtPH9/5KwpfKYYsHrxapwstPNANdgebNIkCLIJ0I77ochfDNGG5c511E/0Epd
	kZDQ==
MIME-Version: 1.0
X-Received: by 10.194.200.134 with SMTP id js6mr54345775wjc.114.1450218468656; 
	Tue, 15 Dec 2015 14:27:48 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Tue, 15 Dec 2015 14:27:48 -0800 (PST)
In-Reply-To: <775EDF49-40CC-432D-861A-0A67CA0630CD@gmail.com>
References: <1450191753-13537-1-git-send-email-alexander.kanavin@linux.intel.com>
	<2403291.KqQCZxqk2K@peggleto-mobl.ger.corp.intel.com>
	<CAJ86T=XkgyYditMnijXxWbQxqFMT-XR_-EZUOyLL17i=DcuGJg@mail.gmail.com>
	<4098937.xBsQpXnxS0@peggleto-mobl.ger.corp.intel.com>
	<775EDF49-40CC-432D-861A-0A67CA0630CD@gmail.com>
Date: Tue, 15 Dec 2015 14:27:48 -0800
Message-ID: <CAJ86T=VS6YFtG_aoC-4UXsqdaEJV=iAoSSgcXU-8CMthj=XErg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: update to 3.11.0
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
X-List-Received-Date: Tue, 15 Dec 2015 22:27:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 15, 2015 at 12:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Dec 15, 2015, at 12:16 PM, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>>
>> On Tue, 15 Dec 2015 12:07:48 Andre McCurdy wrote:
>>> On Tue, Dec 15, 2015 at 9:26 AM, Paul Eggleton
>>>
>>> <paul.eggleton@linux.intel.com> wrote:
>>>> On Tue, 15 Dec 2015 17:28:59 Alexander Kanavin wrote:
>>>>> On 12/15/2015 05:25 PM, Martin Jansa wrote:
>>>>>>> +COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
>>>>>>> +COMPATIBLE_HOST_armv7a = 'arm.*-linux'
>>>>>>
>>>>>> Can you add armv7ve as well?
>>>>>
>>>>> Armv7ve support is not yet in master, so you'll have to add it later I'm
>>>>> afraid.
>>>>
>>>> I think by policy we don't have any restrictions on architecture-specific
>>>> flags in OE-Core (at least, assuming they're reasonable).
>>>
>>> If we're going to duplicate all _armv7a over-rides for _armv7ve then
>>> I'd vote to do so in a single patch series which fixes up the whole of
>>> oe-core rather than adding the over-rides one at a time amongst
>>> version updates etc.
>>
>> Makes sense, but before doing that would it make sense to have a grouping
>> override for all of them that can be used instead (where appropriate)?
>>
>
> stepping back a step. What so different about armv7ve that it needs to be a separate arch
> its just virtual extensions on top of armv7a, so any override pertaining to armv7a should
> be valid for it well. Can you work towards making it so ?

Trying to create a common over-ride for both might end up causing more
trouble in the long run. Perhaps it would instead make sense just to
try to remove some the _armv7a over-rides currently used in oe-core
(and meta-oe)? There aren't that many and some of them look a little
dubious or at least out of date and in need of a review.

For example for valgrind, we could blacklist armv4, armv5 and armv6
rather than whitelisting armv7a. The pixman recipe is assuming armv7a
is a reliable way to determine NEON support, which it isn't. The libav
recipes are using _armv7a to force some dubious looking optimisations.
Forcing the bfd linker in DirectFB doesn't need to be architecture
specific, etc. The only genuinely valid looking usage of the armv7a
over-ride seems to be gcc-configure-common.

>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

