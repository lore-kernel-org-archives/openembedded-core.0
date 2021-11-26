Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <12fc899c-fa56-ae7b-bc6a-759c748a1f02@gmail.com>
Date: Fri, 26 Nov 2021 10:20:40 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [docs] [PATCH] dev-manual: how to purge duplicate sstate cache files
References: <16B8C24F834E3318.24748@lists.openembedded.org>
 <16B8FE3872AB92F9.32206@lists.yoctoproject.org>
 <1731b51b-da96-50b2-923b-3ae95b8911d6@bootlin.com>
 <9f19c2c7-0852-013a-4568-e8af7cf60910@gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
In-Reply-To: <9f19c2c7-0852-013a-4568-e8af7cf60910@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, Michael Opdenacker <michael.opdenacker@bootlin.com>, docs@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>

Hi Michael,

On 11/26/21 10:13, Vyacheslav Yurkov wrote:
> Hi Michael
> 
> On 23.11.2021 10:14, Michael Opdenacker wrote:
>> Greetings,
>>
>> On 11/19/21 5:06 PM, Michael Opdenacker wrote:
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> ---
>>>   documentation/dev-manual/common-tasks.rst | 25 ++++++++++++++++++++++-
>>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/documentation/dev-manual/common-tasks.rst
>>> b/documentation/dev-manual/common-tasks.rst
>>> index 3eead147a3..37612c84b7 100644
>>> --- a/documentation/dev-manual/common-tasks.rst
>>> +++ b/documentation/dev-manual/common-tasks.rst
>>> @@ -6242,8 +6242,11 @@ Changing the listed common targets is as easy
>>> as editing your version of
>>>   ``conf-notes.txt`` in your custom template configuration directory and
>>>   making sure you have ``TEMPLATECONF`` set to your directory.
>>>   +Conserving Disk Space
>>> +=====================
>>> +
>>>   Conserving Disk Space During Builds
>>> -===================================
>>> +-----------------------------------
>>>     To help conserve disk space during builds, you can add the following
>>>   statement to your project's ``local.conf`` configuration file found in
>>> @@ -6257,6 +6260,26 @@ building a recipe once the recipe is built.
>>> For more information on
>>>   :ref:`rm_work <ref-classes-rm-work>` class in the
>>>   Yocto Project Reference Manual.
>>>   +Purging Duplicate Shared State Cache Files
>>> +-------------------------------------------
>>> +
>>> +After multiple build iterations, the Shared State (sstate) cache can
>>> contain
>>> +duplicate cache files for a given package, while only the most
>>> recent one
>>> +is likely to be reusable. The following command purges all but the
>>> +newest sstate cache file for each package::
>>> +
>>> +   sstate-cache-management.sh --remove-duplicated
>>> --cache-dir=build/sstate-cache
>>> +
>>> +This command will ask you to confirm the deletions it identifies.
>>> +
>>> +Note::
>>> +
>>> +   The duplicated sstate cache files of one package must have the same
>>> +   architecture, which means that sstate cache files with multiple
>>> +   architectures are not considered as duplicate.
>>> +
>>> +Run ``sstate-cache-management.sh`` for more details about this script.
>>> +
>>>   Working with Packages
>>>   =====================
>>>   
>> Did anyone have time to have a look at what I wrote ? There may be
>> better ways to purge the sstate cache files.
>> Thanks in advance
>> Michael.
> 
> The description looks good to me. By other ways you mean other usage
> scenarios of sstate-cache-management.sh script or by means of something
> else?
> 

I also use the --stamps-dir method since that removes additional files.
You just gotta remember to do a build of everything you want to keep first.

/Jacob
