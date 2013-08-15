Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C71AA62176
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 16:27:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7FGRXZ2004292
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 09:27:33 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 15 Aug 2013 09:27:31 -0700
Message-ID: <520D0174.7030901@windriver.com>
Date: Thu, 15 Aug 2013 11:27:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
	<520A82BA.2070706@linux.intel.com>
	<520B1595.3060909@windriver.com> <20130814065609.GQ17945@jama>
	<1376477217.22952.5.camel@ted> <20130814105915.GU17945@jama>
	<520CA4AF.4040403@windriver.com>
	<1376560519.17787.16.camel@phil-desktop.brightsign>
	<1376583837.22952.72.camel@ted>
In-Reply-To: <1376583837.22952.72.camel@ted>
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
X-List-Received-Date: Thu, 15 Aug 2013 16:27:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/13 11:23 AM, Richard Purdie wrote:
> On Thu, 2013-08-15 at 10:55 +0100, Phil Blundell wrote:
>> On Thu, 2013-08-15 at 17:51 +0800, Rongqing Li wrote:
>>> OK, But your issue is not related to me.
>>>
>>> I can reproduce my issue by two simple script.
>>
>> If tar is deciding that the file has "changed" just because the link
>> count on the dentry has increased, that sounds like it is probably a bug
>> in tar and ought to be fixed there.
>>
>> That said, I can't immediately think why autotools_copy_aclocal couldn't
>> use a symlink rather than a hard link which would avoid this whole
>> problem.  If the file is in the sysroot then there should be no risk of
>> it going away underneath its user.
>
> Sadly this doesn't work. We block copy a set of .m4 files from the
> sysroot. We can be running do_configure of package A whilst package B is
> de-installed from the sysroot and this leads to files disappearing
> whilst they're being accessed. Its turned out to be a really awkward
> problem to fix.

Do we need some kind of a read/write lock on accessing those files.  (Is this 
even something that we can do easily though the existing mechanisms?)

--Mark

> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


