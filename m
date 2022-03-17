Return-Path: <arnout.vandecappelle@essensium.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <8e007c61-84cf-4075-f248-2235bcbcf52a@essensium.com>
Date: Thu, 17 Mar 2022 10:49:17 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] Patches sent to mailing lists: "From" attribute modified
References: <16DCF6055FEB6DC7.29979@lists.openembedded.org>
 <d54721ab-03a8-9c80-0445-17c7d76d6570@bootlin.com>
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout.vandecappelle@essensium.com>
In-Reply-To: <d54721ab-03a8-9c80-0445-17c7d76d6570@bootlin.com>
Content-Language: en-GB
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: michael.opdenacker@bootlin.com, OE-core <openembedded-core@lists.openembedded.org>


On 17/03/2022 10:35, Michael Opdenacker via lists.openembedded.org wrote:
> On 3/16/22 21:21, Michael Opdenacker via lists.openembedded.org wrote:
>> Greetings,
>>
>> My patches sent to the mailing lists are causing trouble for Richard.
>>
>> The reason is the "From" field is modified by the mailing list server. It's
>> From: "Michael Opdenacker via lists.yoctoproject.org"
>> <michael.opdenacker=bootlin.com@lists.yoctoproject.org>
>> instead of
>>  From : Michael Opdenacker <michael.opdenacker@bootlin.com"
>> in my original patch.
>>
>> And then when you try to apply the patch with "git am", you get a
>> modified committer name. This makes it harder for Richard to apply
>> patches, otherwise you get commits such as:
>> https://git.yoctoproject.org/poky/log/?qt=author&q=via
>>
>> If I understood correctly, the problem happens because we had to enable
>> DMARC on our domain (bootlin.com), because of a storm of spam messages
>> claiming to come from our domain. Otherwise our legitimate e-mails were
>> getting blocked by Google Mail.
>>
>> Richard recalls that someone once found a workaround for this issue. Did
>> any of you ever face this?
>
> The problem seems to originate from the behavior of "git am"... As its
> manual says (https://git-scm.com/docs/git-am):
>
> "The commit author name is taken from the "From: " line of the message"
>
> ... and there seems to be no way to override this behavior.

  Patchwork solves this issue by re-rewriting the From header. Cfr. [1] - if you 
look at the headers, it has

  From: Christian Stewart via buildroot <buildroot@buildroot.org>

but if you open the mbox version (which is what you get with pwclient git-am), 
you get

  X-Patchwork-Original-From: Christian Stewart via buildroot
    <buildroot@buildroot.org>
  From: Christian Stewart <christian@paral.in>

If you want to reproduce that outside of patchwork, you can look at its sources.


  Regards,
  Arnout


[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20220311041821.3078930-1-christian@paral.in/

(I would have taken a patch from someone at bootlin, but the accents are 
annoying :-)

