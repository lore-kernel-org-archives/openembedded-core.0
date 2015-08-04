Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4C45759C7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 15:01:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t74F1KQo000780
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Aug 2015 08:01:20 -0700 (PDT)
Received: from [128.224.56.57] (128.224.56.57) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 4 Aug 2015 08:01:19 -0700
Message-ID: <55C0D3BF.6080205@windriver.com>
Date: Tue, 4 Aug 2015 11:01:19 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1438696733-234279-1-git-send-email-paul.gortmaker@windriver.com>
	<1438699944.30526.5.camel@linuxfoundation.org>
In-Reply-To: <1438699944.30526.5.camel@linuxfoundation.org>
X-Originating-IP: [128.224.56.57]
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-libc-headers: exclude drm headers from sysroot
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
X-List-Received-Date: Tue, 04 Aug 2015 15:01:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2015-08-04 10:52 AM, Richard Purdie wrote:
> On Tue, 2015-08-04 at 09:58 -0400, Paul Gortmaker wrote:
>> While diagnosing a problem with xf86-video-intel I noticed we had two
>> copies of drm headers in the sysroot; one from here and one from
>> the libdrm package.   The xf86-video-intel turned out to be another
>> thing, but that doesn't mean we want two copies in the sysroot with
>> different content and luck of include path indicating which one we
>> get.
>>
>> This one landed in usr/include/drm and the libdrm one put its files
>> at usr/include/libdrm, so there was no obvious over-write conflict.
>>
>> The obvious risk here would be unearthing implicit dependencies on
>> the libdrm; things trying to build before it has populated the sysroot
>> but two full highly parallel builds containing a full desktop graphics
>> suite did not show any issues.
>>
>> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> Is this something which should get addressed in the upstream kernel?

I don't think so ; my (fun!) investigation into libdrm and the commits
there seem to indicate they tend to treat the kernel as the master
repository for header content and fold changes from the uapi dir in
the kernel back into libdrm content/repository.

That said, since we (yocto) advocate people to not get all twitchy about
having the latest and greatest kernel headers, for wider compatibility,
it seemed most sensible to clobber the kernel ones and ensure the ones
we used matched the functionality of the libdrm that we are building and
actually installing.

Maybe there are arguments for going the other way, but say if we were
using the 3.19 headers still, then we'd definitely be out of sync with
the libdrm binaries we generate and deploy.

Paul.
--

> 
> I agree we likely don't want two sets of those.
> 
> Cheers,
> 
> Richard
> 
> 

