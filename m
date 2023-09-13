Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBA7CA553C
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 16:28:31 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.1301.1694622508787938719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 09:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 38DGSRbG025864
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 11:28:27 -0500
Message-ID: <17f052c2-5604-4df5-bb95-bf18a34ea871@kernel.crashing.org>
Date: Wed, 13 Sep 2023 11:28:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [OE-core] [Openembedded-architecture] Security processes: YP
 needs
To: openembedded-core@lists.openembedded.org
References: <CAApg2=SqAzD9zCnAGB+mtZoTnMCzcnocarpTSCQ0weH15j8KhQ@mail.gmail.com>
 <a7bd9391-7800-4de8-82c7-62ae708a5f0c@ni.com>
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <a7bd9391-7800-4de8-82c7-62ae708a5f0c@ni.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 16:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187611



On 9/13/23 11:00 AM, Alex Stewart wrote:
> Thanks for driving this Marta. Internally and externally, it feels like
> we're just on the cusp of everyone *suddenly caring* about our security
> response strategy. So it's good to see that we're making moves in that
> direction.
> 
> In general, this list looks complete to me. I'm primarily interested in
> the response coordination, triage, and tracking usecases. Those are the
> biggest pain points for my team, at the moment. And that is primarily
> driven by a lack of tooling.
> 
> More responses inline.
> 
> On 9/13/23 07:52, Marta Rybczynska via lists.openembedded.org wrote:
>> [You don't often get email from rybczynska=gmail.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Hello,
>> I've been working recently on collecting what works and what doesn't
>> in YP security processes. The goal is to go forward and define an
>> actionable strategy!
>>
>> Today, I'd like to share with you the summary of what I have heard as
>> needs from several people (those in Cc:).
>>
>> I want the community to comment and tell us what you find important
>> and what you'd like to see added or changed from this list.
>>
>> * CVEs: Visibility if YP is vulnerable or not
>>
>> People want to be able to check/look up a specific CVE; it might be a
>> CVE unrelated to YP
>> (eg. package not included, Windows issue). The cve-checker result is a
>> part of the solution, but people also want to know which CVEs do not
>> apply.
> 
> I'm not sure I understand this usecase. Is there a reason those people
> can't/won't just lookup the CVE on the NIST site?

Management goes to an engineer and says "Customer XYZ says we need a statement 
if CVE-2024-12345 affects us.  Can you please comment?"

Engineer goes to the Yocto Project "list", and looks the number up and doesn't 
find it.  Does this mean we're affects?  We're not affected?  We were affected, 
but it's been fixed (if so when?), etc?

So then they have to go to NIST, look at the CVE, find the information and do 
the evaluation if Yocto Project is affected.

Instead what (I have observed) is that people who like to go to a single list 
(for Yocto Project) information, look up a CVE and get a clear statement of: 
This affects us, this does not affect us, we did not evaluate it or it was fixed 
by commit XYZ in branch....

Then if the item is "not evaluated", they can THEN got to NIST for their own 
evaluation.  This saves a huge amount of time for people who are regularly 
requested to respond to these messages.

>> * CVEs: synchronization of the work on fixes
>>
>> Currently, there is no synchronization; multiple parties might be
>> working on the same fix while nobody is working on another. There
>> might be duplication of work.
>> Ross has https://wiki.yoctoproject.org/wiki/CVE_Status
> 
> Has there been any discussion of adopting the OpenVEX document standard
> that the Chainguard guys are putting together? [1] It seems like the VEX
> use-cases align well with our needs around tracking and coordinating CVE
> response between YP member and individual developers.
> 
> I've been considering it for my internal use for a while. And also
> considering replacing the existing cve_check output JSON with OpenVEX,
> once it has stabilized.
> 
> [1] https://github.com/openvex/spec
> 
>> * Triaging of security issues
>>
>> Related to CVE fixes and includes issues reported directly to the YP.
>> Some issues are more likely to be serious for embedded products
>> (attack by network), so not all has the same priority.
> 
> I'll note here that some of us are sinners and do actually support
> network-attached (and internet-attached) embedded devices. :)
> 
> But the greater point of OS vendors being able to triage and assign
> vendor-specific severities to incoming issues is absolutely important to
> my use-cases.
> 
>> * Private security communication
>>
>> A way to send a notification of a non-public security issue. For
>> researchers, other projects etc.
>> The security alias exists, but only some people know about its existence.
>>
>> * Visibility of the security work of the YP
>>
>> There is much work on security in the YP, but it lacks visibility.
> 
> Is there a common nexus for this work? eg. do most of the folks who are
> doing security work tend to congregate on the security sublist?

Security means different things to different people.  I.e.

1) Secure design
    - Is the system designed to have security services, if so are the defaults 
setup to both be appropriate and also functional?

2) Additional security software
    - i.e. meta-security, what additional software can be available to enhance 
security design/implementation of the system

3) Security (bug) response
    - This is where I see a lack of common nexus for work.  We don't have a good 
place to discuss CVE specific information.  Now the question really is, should 
we have a separate space.  CVEs are just bugs.  Bugs are usually worked on via 
the main mailing list.  So that argument says no, we shouldn't have a special 
list.  BUT the perception is CVEs are "special", so maybe a list specifically to 
discuss the ramifications of a CVE, fix/mitigation strategy or similar would 
make sense -- keeping actual bug fixes to the main mailing list?

>> * Documentation
>>
>> Related to visibility. We need easy-to-find documentation of subjects
>> like submitting a CVE fix,
>> reporting a private issue, and how our processes work... This
>> documentation should address people who are not regular contributors.
> 
> Very important.
> 
>> * Additional tooling
>>
>> We could add additional tooling: a template on how to add cve-check to
>> the CI (possibly
>> a different one than the autobuilder), analyze the result, and extend
>> our tooling to their layers...
>> It is also related to the "Architecture" topic below.
> 
> Can you expand on what you mean here? Is this usecase about extending
> the existing tooling into the generic CI processes that YP members are
> using, or about expanding the tooling in the YP's indigenous CI?
> 
>> * Architecture work
>>
>> Security if more than CVE fixes. We also have what is happening in
>> meta-security: hardening, compiler option,
>> secure package configuration, use of code coverage tools, and so on
>>
>> * SRTool
>>
>> We might decide to use it again. It allows one to do much but requires
>> constant commitment.
> 
> I think I passed over the wiki pages and presentations for SRTool once,
> a while ago. But I didn't pay much attention at the time because it
> wasn't clear *what it did*.
> 
> After reviewing it again, I think it might be the kind of tooling I've
> been searching for to help my team coordinate our CVE response work.
> I'll test it out and see if it is something I can use/contribute towards.

SR Tool requires constant feeding and maintenance from staff, at a minimum to do 
initial triage work.  This means we need a small group of individuals who can 
take the new items (and changes to existing) and comment on a regular (daily) 
basis.  This is the part we've not been terribly successful in the past.  People 
are great at delivering patches, but trying to do the proactive (before 
cve-checker) evaluation of CVEs is an activity that often feels like busy work, 
so it's easy to get behind on and never catch up.

I would love to see the project use SR Tool to manage CVE information, (bugzilla 
is where the bugs need to be managed and processed), as well as cve-checker to 
be able to continue to feed information or what we believe the current state of 
things are.  This combination would give us per-emptive notification of new 
items (SR-Tool), and late validation of items (cve-checker) on the perceived 
state of things.

--Mark

>> * Presence on pre-notification lists and receiving information before
>> the vulnerability gets public
>>
>> YP currently depends on public data. Principal distributions receive
>> the information before
>> a vulnerability becomes public. It requires (in short) private
>> reporting, a security team, and a track
>> of excellent security record.
>>
>> * Becoming a CNA (be able to assign CVEs)
>>
>> Needed if we want to assign CVEs to the software of the YP, like
>> autobuilder, Toaster etc.
> 
> I'm also interested in this, as the maintainer of our opkg fork. So far,
> I haven't had to respond to a CVE against the project, but that won't
> last forever.
> 
>>
>> Kind regards,
>> Marta
>>
>>
>>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187610): https://lists.openembedded.org/g/openembedded-core/message/187610
> Mute This Topic: https://lists.openembedded.org/mt/101340097/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

