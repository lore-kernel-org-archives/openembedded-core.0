Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2975465CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 16:20:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7PGKfQD022543
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Aug 2015 09:20:42 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 25 Aug 2015 09:20:41 -0700
Message-ID: <55DC95D8.4000002@windriver.com>
Date: Tue, 25 Aug 2015 12:20:40 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <cover.1439991144.git.paul.eggleton@linux.intel.com>	<d1dcc85512f0c7b9b93f2780048bb9fad8c9da2d.1439991144.git.paul.eggleton@linux.intel.com>	<1440153906.12105.233.camel@linuxfoundation.org>
	<3261262.kYkpH9KIeH@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <3261262.kYkpH9KIeH@peggleto-mobl.ger.corp.intel.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [RFC PATCH 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Tue, 25 Aug 2015 16:20:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-08-24 07:02 AM, Paul Eggleton wrote:
> On Friday 21 August 2015 11:45:06 Richard Purdie wrote:
>> On Wed, 2015-08-19 at 14:34 +0100, Paul Eggleton wrote:
>>> Allow restricting recipes brought from a layer to a specified list. This
>>> is similar in operation to blacklist.bbclass, but instead specifies a
>>> per-layer whitelist of recipes (matched by BPN) that are able to be
>>> built from the layer - anything else is skipped. This is potentially
>>> useful where you want to bring in a select set of recipes from a larger
>>> layer e.g. meta-oe.
>>>
>>> Implements [YOCTO #8150].
>>>
>>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>> ---
>>>
>>>   meta/classes/whitelist.bbclass | 28 ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>   create mode 100644 meta/classes/whitelist.bbclass
>>
>> I should go on record as having some pretty strong reservations about
>> this from a philosophical standpoint.
>>
>> Why? I think its going to encourage behaviours which will result in a
>> decrease in layer quality, particularly for meta-oe.
>>
>> Taking a simple example, today if someone breaks parsing in meta-oe, its
>> quickly known about and multiple people can see and resolve the issue.
>> Once people start using this class, many users will simply never
>> see/care about parsing breakage in less maintained parts of the layer.
>>
>> I appreciate Martin will likely notice, however this shouldn't Martin's
>> sole responsibility.
>>
>> Since people's focus will be on to narrow parts of the layer, we'll
>> start to see islands which are well maintained/used and islands which
>> are not. Worse, just looking at the layer, we won't be able to tell
>> which is which.
>>
>> I'm nervous about anything which pushes responsibility onto already
>> overloaded maintainers and encourages behaviour which is a net loss on
>> "quality".
>>
>> I've talked to several significant users and they all "love" the idea of
>> this class and plan to adopt it ASAP over existing tools like
>> combo-layer. I therefore can't see much advantage of not merging the
>> class as people are going to use it regardless.
>
> I appreciate the concern, but I have to be honest, I don't see this as being a
> problem with this class per se, for a couple of reasons:
>
> 1) People already feel the need to be selective in some way about the recipes
> they pull from larger layers such as meta-oe - whether they do it by using
> combo-layer, this class, git-filter-branch or simply by copying the recipes
> they want into their own layers. Using the whitelist class has one advantage
> over all the rest for the simple filtering case - you are always using the
> recipes from upstream. (OK, with combo-layer you probably are, but here it's
> direct.) Besides, even if people aren't doing any active filtering on the
> layer, they almost certainly aren't building the entire thing in any case - so
> can we really say they are testing it now?
>
> 2) Responsibility - it's great when people do report issues they find, but we
> shouldn't need to rely on people randomly coming across an issue in order to
> find it, we should be testing it ourselves. The job of maintaining the quality
> of layers rests with us - i.e. the people who are involved in maintaining the
> layers and developing the tools needed to do so. Martin does regular builds
> with a variety of layers as do others. If it's simply parse checking that we
> feel we are losing, it would be trivial to add extra regular checks; if
> nothing else, the layer index is parsing every recipe in almost every public
> layer every three hours; with a little extra work we could log and expose the
> results of that through the interface. (Am I volunteering to do this? Sure, as
> it'll probably be on my own time I can't promise to do it soon, but I will get
> to it if nobody else does first.)


Makes sense to me. I don't see the whitelist.bbclass in master-next yet.
Are you just waiting for the linux-4.1 and gcc-5.2 to go in?

../Randy

>
> Cheers,
> Paul
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

