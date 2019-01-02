Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5F3336010D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 02:04:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0224N90011620
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Jan 2019 18:04:23 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 1 Jan 2019 18:04:16 -0800
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1545901142.git.liezhi.yang@windriver.com>
	<7b35228f2a7f688f6c1a6ecdbcefd6dd436c4b25.1545901142.git.liezhi.yang@windriver.com>
	<e2a93209edc2390de536dd34fdd405ea9ab5b8ab.camel@linuxfoundation.org>
	<0158f93e-f6f7-f1cf-dccf-b3eb4a328b15@windriver.com>
	<5d6426bdf5c63bbce39ef01e26144798bb663f53.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <631b37b1-f9ad-9d7c-fce5-7e11b1345025@windriver.com>
Date: Wed, 2 Jan 2019 10:09:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <5d6426bdf5c63bbce39ef01e26144798bb663f53.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/3] oeqa: make it work for multiple users
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
X-List-Received-Date: Wed, 02 Jan 2019 02:04:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/29/18 7:09 AM, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2018-12-28 at 15:57 +0800, Robert Yang wrote:
>>
>> On 12/27/18 7:37 PM, Richard Purdie wrote:
>>> On Thu, 2018-12-27 at 00:59 -0800, Robert Yang wrote:
>>>> There are failures when multiple users run oe-selftest on the
>>>> same
>>>> host:
>>>>
>>>> PermissionError: [Errno 13] Permission denied: '/tmp/oe-saved-
>>>> tests/201812250324_qemu'
>>>>
>>>> This is because /tmp/oe-saved-tests was created by user A, while
>>>> user
>>>> B tries
>>>> to write data in it, then the error will happen. This patch can
>>>> fix
>>>> the problem.
>>>>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>    meta/classes/testimage.bbclass   | 2 +-
>>>>    meta/lib/oeqa/runtime/context.py | 7 +++----
>>>>    meta/lib/oeqa/utils/dump.py      | 5 ++++-
>>>>    3 files changed, 8 insertions(+), 6 deletions(-)
>>>
>>> Putting this into /tmp isn't good. Why don't we move this to
>>> LOG_DIR/runtime-hostdump/?
>>
>> I'm afraid that we can't do this, the problem is that we need call
>> get_bb_vars()
>> to get LOG_DIR (d.getVar('LOG_DIR') doesn't work), but get_bb_vars()
>> runs
>> "bitbake -e" which doesn't work when "bitbake <image> -ctestimage"
>> since there
>> is a bitbake server running. We can only get BUILDDIR if we don't
>> call
>> get_bb_vars(), so I think that we have the following 2 solutions:
>>
>> 1) Save it to /tmp/runtime-hostdump
>>
>> Or:
>>
>> 2) Save it to BUILDDIR/runtime-hostdump
>>
>> What's your opinion, please ?
> 
> I think it should be possible to use LOG_DIR for most of the usecases.
> It won't work for the "on target" mode but it should be possible
> elsewhere even if we have to tweak the code a bit to ensure the right
> variables are passed around?

Yes, I agree with that, I will try it.

// Robert

> 
> Cheers,
> 
> Richard
> 
> 

