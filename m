Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D667C6AC36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 21:53:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t2ULrBZq004126
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Mar 2015 14:53:11 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Mon, 30 Mar 2015 14:53:10 -0700
Message-ID: <5519C5C5.90608@windriver.com>
Date: Mon, 30 Mar 2015 16:53:09 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1426283873-11784-1-git-send-email-jslater@windriver.com>		<4010D2ED-6067-4B6B-9C27-B2C5FC465DC9@gmail.com>		<1426627208.23698.39.camel@linuxfoundation.org>	
	<007BD92917A2324FA403BCF9A464CF847769E93E@ALA-MBA.corp.ad.wrs.com>	
	<5519BB5C.2060808@windriver.com>
	<1427751911.14020.328.camel@linuxfoundation.org>
In-Reply-To: <1427751911.14020.328.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-cross-canadian: Add inhibit of split as well was Re: [PATCH 1/1] package.bbclass: decouple splitting	and stripping
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
X-List-Received-Date: Mon, 30 Mar 2015 21:53:12 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 3/30/15 4:45 PM, Richard Purdie wrote:
> On Mon, 2015-03-30 at 16:08 -0500, Mark Hatle wrote:
>> On 3/18/15 12:44 PM, Slater, Joseph wrote:
>>> I just found out that this patch will break qa for ltp packaging.  The ltp recipe
>>> inhibits stripping which used to inhibit splitting.  If splitting is enabled,
>>> there are several .debug directories in places packages.bbclass doesn't look, so
>>> they wind up in ltp, not ltp-dbg.
>>>
>>> It's tempting just to inhibit splitting since that was never really done before, anyhow,
>>> but I suppose that's not the right way to fix it.
>>
>> In addition to ltp, I recently found this breaks gcc-cross-canadian, below is a
>> patch that should probably be applied even if this one does not make it in.
>>
>>
>> gcc-cross-canadian: Add inhibit of split as well
>>
>> With the recent change to allow strip and split of packages to be controlled
>> seperately, gcc-cross-canadian will sometimes fail to build properly.  So in
>> addition to the existing inhibit strip, we also want to inhibit split.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> index 195b465..ad4b08f 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> @@ -64,6 +64,7 @@ do_compile () {
>>  }
>>
>>  INHIBIT_PACKAGE_STRIP = "1"
>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>>
>>  # Having anything auto depending on gcc-cross-sdk is a really bad idea...
>>  EXCLUDE_FROM_SHLIBS = "1"
> 
> Not sure which revision of fido or master this against but: 
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=92739edc9da0dea10ccc9d153226cacd6a18ee33
> 
> i.e. we fixed this the other way...

You are right.. I thought I was in a different directory, but I was back on a
pull from Feb 20th.  Sorry for the confusion.

--Mark

> Cheers,
> 
> Richard
> 


