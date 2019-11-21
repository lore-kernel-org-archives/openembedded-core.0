Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 068857F931
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 19:14:17 +0000 (UTC)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id xALJEEO8002877
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Thu, 21 Nov 2019 13:14:15 -0600
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Adrian Bunk <bunk@stusta.de>
References: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
	<20191121150207.3657-3-richard.purdie@linuxfoundation.org>
	<20191121155018.GB28013@localhost>
	<ec0c2ab6397acc54c64cc4f8927eed97e82a9509.camel@linuxfoundation.org>
	<20191121170948.GC28013@localhost>
	<0f2a46118e8847a3a785a2ab50999ecc22ec205f.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <38e95272-cef4-e80a-456d-eb365a81e393@kernel.crashing.org>
Date: Thu, 21 Nov 2019 13:14:13 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <0f2a46118e8847a3a785a2ab50999ecc22ec205f.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] sanity: Add check for tar older than 1.28
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
X-List-Received-Date: Thu, 21 Nov 2019 19:14:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/21/19 12:09 PM, Richard Purdie wrote:
> On Thu, 2019-11-21 at 19:09 +0200, Adrian Bunk wrote:
>> On Thu, Nov 21, 2019 at 04:54:12PM +0000, Richard Purdie wrote:
>>> On Thu, 2019-11-21 at 17:50 +0200, Adrian Bunk wrote:
>>>> On Thu, Nov 21, 2019 at 03:02:07PM +0000, Richard Purdie wrote:
>>>>> Older versions break opkg-build when reproducible builds are
>>>>> enabled.
>>>>> Rather than trying to be selective based on which features are
>>>>> enabled,
>>>>> lets just make this a minimum version.
>>>>> ...
>>>>> +    if LooseVersion(version) < LooseVersion("1.28"):
>>>>> +        return "Your version of tar is older than 1.28 and
>>>>> does
>>>>> not have the support needed to enable reproducible builds.
>>>>> Please
>>>>> install a newer version of tar.\n"
>>>>> ...
>>>>
>>>> How does "Please install a newer version of tar" work in practice
>>>> on a supported host distribution like CentOS 7 ?
>>>>
>>>> As user I would expect such things to just work when using
>>>> a distribution that is documented as supported.
>>>
>>> We're going to have to solve this issue on our autobuilder. Centos7
>>> already causes problems and there is documetation in the manual
>>> about
>>> it:
>>>
>>> https://www.yoctoproject.org/docs/3.0/ref-manual/ref-manual.html#centos-packages
>>>
>>> (and the need to use EPEL)
>>>
>>> Unfortunately a newer tar isn't in EPEL.
>>
>> EPEL does not contain more recent versions of packages already
>> in RHEL/CentOS.
> 
> Sorry, I had thought Centos7 had python3 already and we needed EPEL to
> obtain python 3.6.
> 
>>
>>> I don't have a solution yet, I do know that silently creating empty
>>> packages is much worst than telling a user something won't work
>>> though.
>>>
>>> Any suggestions on how we fix it?
>>
>> My preferred solution would be to replace CentOS 7 with CentOS 8
>> as supported distribution, which would also allow to drop hacks
>> for two major releases of gcc in various places.
> 
> We are working towards that, equally the older version support is
> useful to a significant portion of our userbase so its a balancing act.

RHEL 7 is still heavily used.  But if we can provide a buildtools-tarball that
includes a new enough tar, that should be able to workaround the issue.

>> If all other supported distribution already ship 1.28 this would
>> solve your problem.
> 
> I believe that is now the case, yes.
> 
>>> (We could make opkg-utils-native depend on tar-native but for most
>>> people that isn't necessary so it seems a shame).
>>
>> Building tar-native is not something that would strike me as 
>> problematic.
> 
> Its an extra build dependency and extra build time, just complicates
> things. "tar-native" is in ASSUME_PROVIDED and gives bootstrap issues
> although we have the "tar-replacement-native" mechanism to account for
> this already. So possible but not entirely straightforward.

Requiring a newer version, and suggesting to the user to use a
buildtools-tarball (SDK) I think is a reasonable compromise.

> Cheers,
> 
> Richard
> 

