Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED1F60698
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 09:05:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7G95NCO015403
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Aug 2013 02:05:23 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 16 Aug 2013 02:05:21 -0700
Message-ID: <520DEB58.5050905@windriver.com>
Date: Fri, 16 Aug 2013 17:05:28 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Rongqing Li <rongqing.li@windriver.com>
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
	<520A82BA.2070706@linux.intel.com>
	<520B1595.3060909@windriver.com> <20130814065609.GQ17945@jama>
	<1376477217.22952.5.camel@ted> <20130814105915.GU17945@jama>
	<520CA4AF.4040403@windriver.com>
	<1376560519.17787.16.camel@phil-desktop.brightsign>
	<1376583837.22952.72.camel@ted> <520D0174.7030901@windriver.com>
	<1376607841.22952.103.camel@ted> <520DE1DE.10608@windriver.com>
In-Reply-To: <520DE1DE.10608@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: fix parallel building issue
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
X-List-Received-Date: Fri, 16 Aug 2013 09:05:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/16/2013 04:25 PM, Rongqing Li wrote:
>>> Do we need some kind of a read/write lock on accessing those files.
>>> (Is this
>>> even something that we can do easily though the existing mechanisms?)
>>
>> It would kill performance for no good reason, been there, looked at
>> it...
>>
>> Cheers,
>>
>> Richard
>>
>
> I think reverting the below optimization maybe better than using lock
>
> commit 8c5544c2311b080bb212efb7f6b804db63e125f5
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Thu Oct 11 13:36:53 2012 +0100
>
>      scripts/cp-noerror: Try and use hardlinks if possible
>
>      Since we generally have lots of copies of the directories created
> using this tool, use
>      hardlinks where possible. This should save a little disk space and
> improve performance
>      slightly.
>
>      (From OE-Core rev: bfa11c028c2da093f7b4e6b7b1d611da90ae052f)
>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>
> -Roy
>
>

I think the upper commit saves lots of space, but the saved time maybe 
be ignored.

On my general building image.

1. aclocal size and numbers of files
         bitbake_build/tmp/sysroots/x86_64-linux/usr/share$ du -sh aclocal
         768K    aclocal

         bitbake_build/tmp/sysroots/x86_64-linux/usr/share$ ls aclocal|wc
              54      54     621
2. do hardlink copy 1000 times
         bitbake_build/tmp/sysroots/x86_64-linux/usr/share$ cat ./aa
         #! /bin/bash

         n=0

         while [ $n -le 1000 ] ; do
             n=`expr "$n" + 1`
             cp -alf aclocal ./tmp/
             rm -rf ./tmp/aclocal
         done
         /bitbake_build/tmp/sysroots/x86_64-linux/usr/share$ time ./aa

         real    0m4.416s
         user    0m0.084s
         sys     0m0.256s

2. do copy 1000 times
         bitbake_build/tmp/sysroots/x86_64-linux/usr/share$ cat ./aa
         #! /bin/bash

         n=0

         while [ $n -le 1000 ] ; do
             n=`expr "$n" + 1`
             cp -rf aclocal ./tmp/
             rm -rf ./tmp/aclocal
         done

         bitbake_build/tmp/sysroots/x86_64-linux/usr/share$ time ./aa

         real    0m8.707s
         user    0m0.104s
         sys     0m0.324s


Since we need several hours to compile a image, several seconds 
improvement...


-- 
Best Reagrds,
Roy | RongQing Li

