Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1TYh49-0006Pq-RP
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 18:47:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAEHWF1e023104
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Nov 2012 09:32:15 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 14 Nov 2012 09:32:15 -0800
Message-ID: <50A3D59D.7050901@windriver.com>
Date: Wed, 14 Nov 2012 12:32:13 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
	<93224a342aad308f6d239566534b21b24c694c1c.1352840087.git.bruce.ashfield@windriver.com>
	<50A3C7E9.2000603@linux.intel.com> <50A3CDB2.20408@windriver.com>
	<50A3D067.2060208@linux.intel.com>
In-Reply-To: <50A3D067.2060208@linux.intel.com>
Cc: linux-yocto@yoctoproject.org, Rahul.Saxena@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/8] kern-tools: flexibility and usability enhancements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 17:47:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-11-14 12:09 PM, Darren Hart wrote:
>
>
> On 11/14/2012 08:58 AM, Bruce Ashfield wrote:
>> On 12-11-14 11:33 AM, Darren Hart wrote:
>>>
>>>
>>> On 11/14/2012 07:03 AM, Bruce Ashfield wrote:
>>>> Updating the SRCREV to import the following changes.
>>>>
>>>>    [updateme: find the board description with the highest score]
>>>>
>>>>      This removes the requirement that a custom linux-yocto .scc file have
>>>>      define KTYPE <foo>, where <foo> is typically "standard". The tools can
>>>>      now match on a .scc file that only matches the board, but will still
>>>>      chose one that matches the board and kernel type, if available.
>>>
>>> Should the documentation then state that KTYPE is only necessary to
>>> define if it is not "standard" ? Does this also apply to
>>
>> Nope. That isn't the intention. If you are using kernel types at all,
>> you should define one. Whether it be standard or not.
>>
>>> linux-yocto-custom recipes/kernels where the repository could very well
>>> not define any ktype at all?
>>
>> Same as the above. If you are create kernel .scc files to work with
>> linux-yocto custom, you are now free to use kernel types, or not, your
>> choice.
>
> And what happens if they don't? It will just match on KMACHINE? Making
> it so you can define one defconfig per machine and be done with it?
> (if that's what you really wanted to do).

Correct. It matches the .scc file that scores the best. If you don't
have a kernel type and a .scc file matches the KMACHINE that's the
one it'll use. If you want more separation, then you can start using
KTYPE without modifying the existing .scc files, since one with
a matching KMACHINE/KTYPE will score higher than the KMACHINE only
.scc file.

>
>
>>
>>>
>>>>
>>>>    [updateme: allow for tabs or spaces in defines]
>>>>
>>>>      define KMACHINE<tab>$MACHINE was missed by the regex.
>>>>
>>>>    [scc/kgit-meta: detect and avoid duplicating patching]
>>>>
>>>>      To allow feature description to be included multiple times, they were
>>>>      previously split into -enable and 'patch' descriptions. With this change
>>>>      the patches will be detected as already included, and skipped
>>>>      automatically. Removing the need to do this split. It also cleans up
>>>>      the ability to warn about multiple includes.
>>>>
>>>>    [kconf_check: add "verify" configuration fragment type]
>>>>
>>>>      This adds the ability for a BSP to have a kernel configuration
>>>>      fragment that lists options that must be present. If they are not
>>>>      present it is a hard error. "required" is a similar fragment, but
>>>>      it adds them to the build, and audits them at the end, but does
>>>>      not abort the build if they are present. This is a minor distinction,
>>>>      but one that is useful when creating flexible, shared kernel config
>>>>      structures.
>>>
>>>
>>> IIRC we discussed this verify thing at ELCE and how it broke some of the
>>> semantics.... trying to remember now, let's see:
>>>
>>> kconf hardware foo.cfg
>>> kconf verify hardware bar.cfg
>>> kconf non-hardware foobar.cfg
>>> kconf verify non-hardware barfoo.cfg
>>>
>>> Is that how this is to be used? The configuration space just doubled
>>> from a documentation point of view, and that is without even considering
>>> the "required" keyword you described.
>>
>> I'll continue to work on this for 1.4, but I didn't want to pend the
>> series on anything that we discussed in Barcelona .. these have been
>> around for some time and I wanted to push them out before doing any 1.4
>> tweaks.
>>
>> But to answer your question. You could have multiple 'verify' fragments,
>> but I'd only suggest one. It's a final check that critical options are
>> in the final .config and will throw a hard error. required is an
>> alias for 'hardware' and still only throws a warning if they are missing.
>>
>> There few current users of 'verify', so I can still follow up with
>> syntax tweaks that we discussed (do you have notes on that ?). I recall
>> simply making 'verify' a modifier of the existing kconf types would be
>> better than the current new type. I'll keep all the variants around, since
>> the plumbing is the same and that will again give time for migration.
>>
>> We could argue that required should also be a hard error, but we can't
>> do that quite yet, since there are some existing use cases and trees
>> that will start to error out, and I'd like to migrate them first.
>
>
> I don't seem to have any notes on this for some reason. I'm wondering if
> instead of modifiers, these should just be kconf types:
>
> non-hardware
> hardware
> required
> verify
>
> As you said, required is an alias to hardware, so it isn't really a
> modifier. And verify is less of a modifier and more of a verification
> step, so it doesn't matter if it's hardware or non-hardware.
>
> This would reduce the config space from 6 to 4, not a huge savings,
> but it would be much simpler to document.

Agreed, I'll put this into bugzilla and document what we'll do for
1.4 as the final syntax.

>
> I'm going to omit these from the docs for now though.
>

Sounds good. We'll nail them down first and then document it :)

Cheers,

Bruce

>>
>>>
>>> Can you use required with verify? Can you use both of them with both
>>> hardware and non-hardware?
>>
>> Any combination at all should work.
>>
>> Cheers,
>>
>> Bruce
>>
>>>
>>>
>>>>
>>>>    [kconf_check: improve kernel audit report formatting]
>>>>    [kconf_check: perform validity checks on non-hardware options]
>>>>    [kconf_check: cleanups and verbose flag]
>>>>
>>>>      The existing output was verbose and not always useful to the reader.
>>>>      This change makes the output more compact, audits non-hardware options
>>>>      and gives information
>>>>
>>>>        [invalid (54)]: meta/cfg/preempt-rt/common-pc/invalid.cfg
>>>>           This BSP sets config options that are not offered anywhere within this kernel
>>>>
>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>> ---
>>>>    meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>>>> index ce94885..f2cd39f 100644
>>>> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>>>> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>>>> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
>>>>
>>>>    DEPENDS = "git-native guilt-native"
>>>>
>>>> -SRCREV = "a802ee9c8d9334c0f7932dfd40d45599addb7c90"
>>>> +SRCREV = "6f68c9473b43c3e39755a72aef8733cbd0bf1a59"
>>>>    PR = "r12"
>>>>    PV = "0.1+git${SRCPV}"
>>>>
>>>>
>>>
>>
>



