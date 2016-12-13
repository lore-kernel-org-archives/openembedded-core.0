Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B8C7760111
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:31:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBD8VIsP013432
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Dec 2016 00:31:18 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Dec 2016 00:31:17 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<7884104.xbYfD5GGaH@peggleto-mobl.ger.corp.intel.com>
	<d0d8f45f-774f-0965-2a60-6acd17aca09a@windriver.com>
	<1611902.KszYoSQub8@peggleto-mobl.ger.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <1dbd51fd-cbe1-6b54-b321-cdc05c0dd633@windriver.com>
Date: Tue, 13 Dec 2016 16:31:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1611902.KszYoSQub8@peggleto-mobl.ger.corp.intel.com>
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>, "Limon,
	Anibal" <anibal.limon@intel.com>, "Lopez,
	Mariano" <mariano.lopez@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] oeqa/sdkext/devtool.py: remove workspace/sources before running test cases
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
X-List-Received-Date: Tue, 13 Dec 2016 08:31:17 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/13/2016 04:21 PM, Paul Eggleton wrote:
> On Tue, 13 Dec 2016 14:47:10 Robert Yang wrote:
>> On 12/13/2016 02:29 PM, Paul Eggleton wrote:
>>> On Tue, 13 Dec 2016 13:56:05 Robert Yang wrote:
>>>> On 12/13/2016 12:45 PM, Paul Eggleton wrote:
>>>>> It seems to me that's what's missing here is a proper teardown process
>>>>> like we have for oe-selftest, so that tests clean up after themselves
>>>>> whether they succeed or fail. I'm unsure as to whether that is part of
>>>>> the plan for the new QA refactoring though.
>>>>
>>>> There is already a 'devtool reset' which can do the cleanup, but it
>>>> can't remove sources as I said in the commit log.
>>>
>>> devtool reset not deleting the source tree is intentional - I don't want
>>
>> Add an option like "devtool reset --force" ? When I met the error, the first
>> I did was check "devtool reset", but there is no way to remove resources,
>> so I have to remove it here to allow multilib test cases runs.
>
> I've considered this and decided against it - it just seems to me that at
> least one person will use it every time until one day when they wipe out their
> source with their changes in it. I'd really rather not be enabling that.
> Besides, in everyday use repeated runs of devtool add / modify on the same
> recipe should be at a minimum, if that's not the case then we have other
> issues to look at.
>
> You say there's no way to remove these, but there is - just delete the files
> explicitly.
>
>> Or maybe fix "devtool add" to check the git repo correclty ? For example,
>> when there is already a repo, just update it rather than clone it again.
>
> Right, that has been suggested - and it's all fine if the source tree is
> unmodified and just a straight update to get from where it is currently to
> match the upstream. However, what if it's not fast-forward, or a different
> repo entirely? What if there are local modifications?
>
>> The multilib + testsdkext would fail without this fix.
>
> Yes, that's why I ultimately said we haven't much choice but to apply this
> patch. We must acknowledge however that the problem exists because the tests

Got it, thanks.

// Robert

> aren't cleaning up after themselves, which should be their responsibility.
>
> Cheers,
> Paul
>

