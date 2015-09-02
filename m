Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 18D3C77043
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 21:29:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 02 Sep 2015 14:26:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,456,1437462000"; d="scan'208";a="781471484"
Received: from afshjern.zpn.intel.com (HELO [10.219.128.48]) ([10.219.128.48])
	by fmsmga001.fm.intel.com with ESMTP; 02 Sep 2015 14:26:42 -0700
To: Martin Jansa <martin.jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1441211805-17543-1-git-send-email-alejandro.franco@linux.intel.com>
	<1441216283.24871.78.camel@linuxfoundation.org>
	<20150902182548.GG2470@jama>
From: Alex Franco <alejandro.franco@linux.intel.com>
Message-ID: <55E769B4.4050800@linux.intel.com>
Date: Wed, 2 Sep 2015 16:27:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20150902182548.GG2470@jama>
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Fix recursive mode -st on BUILDDIR setup
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
X-List-Received-Date: Wed, 02 Sep 2015 21:29:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Checking may be the better approach, as warning here would do little 
more than what the current failure does (informing that chmod failed)

Alex Franco

On 09/02/2015 01:25 PM, Martin Jansa wrote:
> On Wed, Sep 02, 2015 at 06:51:23PM +0100, Richard Purdie wrote:
>> On Wed, 2015-09-02 at 11:36 -0500, Alex Franco wrote:
>>> Removing recursive option from chmod -st on BUILDDIR as it would
>>> take very long on existing build directories
>>>
>>> [YOCTO 7669]
>>>
>>> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
>>> ---
>>>   scripts/oe-setup-builddir | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
>>> index f5b7e4e..44c7dcc 100755
>>> --- a/scripts/oe-setup-builddir
>>> +++ b/scripts/oe-setup-builddir
>>> @@ -24,7 +24,7 @@ if [ -z "$BUILDDIR" ]; then
>>>   fi
>>>   
>>>   mkdir -p "$BUILDDIR/conf"
>>> -chmod -R -st "$BUILDDIR"
>>> +chmod -st "$BUILDDIR"
>> I think you did this so that conf/ gets the right permissions too.
>> Perhaps the best approach is:
>>
>> +chmod -st "$BUILDDIR" $BUILDDIR/conf"
> Can we add "|| bbwarn foo"
>
> for cases when it doesn't work for whatever reason or check the
> permissions of these 2 dirs before calling chmod?
>
>> ?
>>
>> Cheers,
>>
>> Richard
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


