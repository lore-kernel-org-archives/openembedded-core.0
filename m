Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D00D6C455
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 07:53:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBS7qoOY010539
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Dec 2018 23:53:00 -0800
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 27 Dec 2018 23:52:39 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1545901142.git.liezhi.yang@windriver.com>
	<7b35228f2a7f688f6c1a6ecdbcefd6dd436c4b25.1545901142.git.liezhi.yang@windriver.com>
	<e2a93209edc2390de536dd34fdd405ea9ab5b8ab.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <0158f93e-f6f7-f1cf-dccf-b3eb4a328b15@windriver.com>
Date: Fri, 28 Dec 2018 15:57:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <e2a93209edc2390de536dd34fdd405ea9ab5b8ab.camel@linuxfoundation.org>
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
X-List-Received-Date: Fri, 28 Dec 2018 07:53:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/27/18 7:37 PM, Richard Purdie wrote:
> On Thu, 2018-12-27 at 00:59 -0800, Robert Yang wrote:
>> There are failures when multiple users run oe-selftest on the same
>> host:
>>
>> PermissionError: [Errno 13] Permission denied: '/tmp/oe-saved-
>> tests/201812250324_qemu'
>>
>> This is because /tmp/oe-saved-tests was created by user A, while user
>> B tries
>> to write data in it, then the error will happen. This patch can fix
>> the problem.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/testimage.bbclass   | 2 +-
>>   meta/lib/oeqa/runtime/context.py | 7 +++----
>>   meta/lib/oeqa/utils/dump.py      | 5 ++++-
>>   3 files changed, 8 insertions(+), 6 deletions(-)
> 
> Putting this into /tmp isn't good. Why don't we move this to
> LOG_DIR/runtime-hostdump/?

I'm afraid that we can't do this, the problem is that we need call get_bb_vars()
to get LOG_DIR (d.getVar('LOG_DIR') doesn't work), but get_bb_vars() runs
"bitbake -e" which doesn't work when "bitbake <image> -ctestimage" since there
is a bitbake server running. We can only get BUILDDIR if we don't call
get_bb_vars(), so I think that we have the following 2 solutions:

1) Save it to /tmp/runtime-hostdump

Or:

2) Save it to BUILDDIR/runtime-hostdump

What's your opinion, please ?

// Robert

> 
> Cheers,
> 
> Richard
> 
> 

