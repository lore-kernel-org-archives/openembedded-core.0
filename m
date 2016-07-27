Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 970B1607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 08:06:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R86MwG016811
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Jul 2016 01:06:22 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 01:06:21 -0700
To: "Sergey 'Jin' Bostandzhyan" <jin@mediatomb.cc>
References: <573C0726.3040402@windriver.com>
	<CA+chaQdJPWncYizZAKZ8MHOCqYRn+oKGcDuPhKVoepQhKh+LwQ@mail.gmail.com>
	<573C21EE.8040104@windriver.com> <20160518092029.GA2579@jama>
	<573C365D.3070407@windriver.com>
	<20160518122751.GD11766@deadlock.dhs.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57986B7B.1000107@windriver.com>
Date: Wed, 27 Jul 2016 16:06:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160518122751.GD11766@deadlock.dhs.org>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: PRServer's problem
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
X-List-Received-Date: Wed, 27 Jul 2016 08:06:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sergey,

On 05/18/2016 08:27 PM, Sergey 'Jin' Bostandzhyan wrote:
> Hi,
>
> just wanted to say that we are facing the same issue with PRServer and
> live updates, looking forward to a possible solution.

You can try packagefeed-stability.bbclass on master branch now, and please
feel free to let me know if you find any bugs.

Usage:

INHERIT += "packagefeed-stability"

// Robert

>
> Kind regards,
> Sergey
>
> On Wed, May 18, 2016 at 05:31:09PM +0800, Robert Yang wrote:
>>
>>
>> On 05/18/2016 05:20 PM, Martin Jansa wrote:
>>> On Wed, May 18, 2016 at 04:03:58PM +0800, Robert Yang wrote:
>>>> Hi Martin,
>>>>
>>>> On 05/18/2016 03:39 PM, Martin Jansa wrote:
>>>>> See:
>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5970
>>>>>
>>>>> Just using recipe checksum wont work, because the main reason for PR bumps is to
>>>>> automatically upgrade the packages when one of the dependencies changes .so
>>>>> version, which you won't detect from recipe checksum of the app which is just
>>>>> using the library.
>>>>
>>>> For the development branch like master, yes, that would happen. But for
>>>> the stable release like jethro and krogoth, it is unlikely that would
>>>> happen, and if if does, the user can manually bump the impacted recipe's
>>>> PR to fix the problem. The current problem is that when *all* recipes'
>>>> PR are bumped, there is no way to fix the problem.
>>>
>>> You can still stop using PR service and start doing manual PR bumps, but
>>
>> We can't stop PR service and start doing manual PR bumps since we need keep
>> update to date with upstream, the changes from upstream don't do the manual
>> PR, and I don't think that we have to if they can be done automatically.
>>
>>> it's quite annoying if you need to bump a lot of recipes you don't
>>> control :).
>>
>> What's your opinion about only consider RDEPENDS for PR service's checksum,
>> please ?
>>
>> // Robert
>>
>>>
>>>>> On Wed, May 18, 2016 at 8:09 AM, Robert Yang <liezhi.yang@windriver.com
>>>>> <mailto:liezhi.yang@windriver.com>> wrote:
>>>>>
>>>>>      The PRServer bumps PR according to do_package's task hash, that
>>>>>      causes it bumps *all* packages' PR when recipes like pseudo-native
>>>>>      and rpm-native is changed. It is a very bad user experience when we
>>>>>      run "smart/opkg upgrade" on running target, for example, when we apply
>>>>>      a CVE patch to pseudo-native or rpm-native, or do some slight changes
>>>>>      in their do_compile, "smart/opkg upgrade" will download/install *all*
>>>>>      the packages since all of the packages' PR are bumped.
>>>>>
>>>>>      Here are some rough suggestions to fix this problem, and please feel
>>>>>      free to give your suggestions.
>>>>>      1) Do not use do_package's task for bumping PR, the easiest way
>>>>>          is simulate manually bump PR -- only bump PR when the recipe
>>>>>          itself's checksum is changed.
>>>>>
>>>>>      2) Add a new task for PRServer, redefine its task hash for bumping
>>>>>          PR, for example, this task hash only considers RDEPENDS (no
>>>>>          DEPENDS), and drop any native dependencies.
>>>>>
>>>>>      I prefer the first way, and an alternative way maybe add a var so that
>>>>>      the user can configure it:
>>>>>      PR_CHECKSUM = "${BB_TASKHASH}" (current way)
>>>>>      Or
>>>>>      PR_CHECKSUM = "<recipe checksum>"
>>>>>
>>>>>      --
>>>>>      Thanks
>>>>>
>>>>>      Robert
>>>>>      --
>>>>>      _______________________________________________
>>>>>      Openembedded-core mailing list
>>>>>      Openembedded-core@lists.openembedded.org
>>>>>      <mailto:Openembedded-core@lists.openembedded.org>
>>>>>      http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>
>>>>>
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

