Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2D31D6065F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 08:25:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7G8P7ft015098
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Aug 2013 01:25:07 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 16 Aug 2013 01:25:05 -0700
Message-ID: <520DE1DE.10608@windriver.com>
Date: Fri, 16 Aug 2013 16:25:02 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
	<520A82BA.2070706@linux.intel.com>
	<520B1595.3060909@windriver.com> <20130814065609.GQ17945@jama>
	<1376477217.22952.5.camel@ted> <20130814105915.GU17945@jama>
	<520CA4AF.4040403@windriver.com>
	<1376560519.17787.16.camel@phil-desktop.brightsign>
	<1376583837.22952.72.camel@ted> <520D0174.7030901@windriver.com>
	<1376607841.22952.103.camel@ted>
In-Reply-To: <1376607841.22952.103.camel@ted>
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
X-List-Received-Date: Fri, 16 Aug 2013 08:25:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/16/2013 07:04 AM, Richard Purdie wrote:
> On Thu, 2013-08-15 at 11:27 -0500, Mark Hatle wrote:
>> On 8/15/13 11:23 AM, Richard Purdie wrote:
>>> On Thu, 2013-08-15 at 10:55 +0100, Phil Blundell wrote:
>>>> On Thu, 2013-08-15 at 17:51 +0800, Rongqing Li wrote:
>>>>> OK, But your issue is not related to me.
>>>>>
>>>>> I can reproduce my issue by two simple script.
>>>>
>>>> If tar is deciding that the file has "changed" just because the link
>>>> count on the dentry has increased, that sounds like it is probably a bug
>>>> in tar and ought to be fixed there.
>>>>
>>>> That said, I can't immediately think why autotools_copy_aclocal couldn't
>>>> use a symlink rather than a hard link which would avoid this whole
>>>> problem.  If the file is in the sysroot then there should be no risk of
>>>> it going away underneath its user.
>>>
>>> Sadly this doesn't work. We block copy a set of .m4 files from the
>>> sysroot. We can be running do_configure of package A whilst package B is
>>> de-installed from the sysroot and this leads to files disappearing
>>> whilst they're being accessed. Its turned out to be a really awkward
>>> problem to fix.
>>
>> Do we need some kind of a read/write lock on accessing those files.  (Is this
>> even something that we can do easily though the existing mechanisms?)
>
> It would kill performance for no good reason, been there, looked at
> it...
>
> Cheers,
>
> Richard
>

I think reverting the below optimization maybe better than using lock

commit 8c5544c2311b080bb212efb7f6b804db63e125f5
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Thu Oct 11 13:36:53 2012 +0100

     scripts/cp-noerror: Try and use hardlinks if possible

     Since we generally have lots of copies of the directories created 
using this tool, use
     hardlinks where possible. This should save a little disk space and 
improve performance
     slightly.

     (From OE-Core rev: bfa11c028c2da093f7b4e6b7b1d611da90ae052f)

     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


-Roy



> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

-- 
Best Reagrds,
Roy | RongQing Li

