Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 057A67F309
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 14:59:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x76ExIgg006023
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Aug 2019 07:59:18 -0700 (PDT)
Received: from [192.168.10.15] (172.25.59.219) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 6 Aug 2019 07:59:17 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20190805163237.106405-1-jason.wessel@windriver.com>
	<aeeadff58eb8c60f7cf433f22e67b309a9a0d4ca.camel@linuxfoundation.org>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <d7376620-d008-a887-d117-9a1afbd52e94@windriver.com>
Date: Tue, 6 Aug 2019 09:59:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <aeeadff58eb8c60f7cf433f22e67b309a9a0d4ca.camel@linuxfoundation.org>
Subject: Re: [PATCH v3] pseudo: Fix openat() with a symlink pointing to a directory
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
X-List-Received-Date: Tue, 06 Aug 2019 14:59:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/6/19 9:20 AM, Richard Purdie wrote:
> On Mon, 2019-08-05 at 09:32 -0700, Jason Wessel wrote:
>> While working with ostree disk generation in conjunction with wic, I
>> found a problem with pseudo where it tried to resolve a symlink when
>> it shouldn't, based on openat() flags. A C program has been
>> constructed to test pseudo to show that it is working properly with
>> the correct behavior around openat().
>>
> [...]
>>
>> Many thanks to Peter Seebach for fixing the problem in the pseudo
>> code
>> to use the same logic which was already there for the
>> AT_SYMLINK_NOFOLLOW.
>>
>> Also updated is the license MD5 checksum since the master branch of
>> pseudo has had the SPDX data updated.
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>>   meta/recipes-devtools/pseudo/pseudo.inc    | 2 +-
>>   meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> pseudo-native didn't build on fedora28 or centos7:
> 
> http://errors.yoctoproject.org/Errors/Latest/?filter=9382629d4bbcd26196c36d31ffdf097b30023150&type=commit&limit=150
> 
> (see the pseudo-native failures).
> 
> It looks like an issue on hosts which don't have zlib-devel installed,

> at a very approximate guess -  I've not been able to look in detail.
> 

I'll try and setup a test, since I can easily run fedora28.   I wonder if we can just use zlib-native to solve it, or if it is a a chicken-egg problem with the early boot strap.

Jason.



