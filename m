Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1AAD86BD6B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 01:24:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7U1OeXN020772
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Aug 2013 18:24:40 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 29 Aug 2013 18:24:40 -0700
Message-ID: <521FF438.5040702@windriver.com>
Date: Fri, 30 Aug 2013 09:24:08 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1377781793.git.liezhi.yang@windriver.com>
	<454944e7bd4c831bea934852393d8e16abe1d5ff.1377781793.git.liezhi.yang@windriver.com>
	<1377795605.1059.20.camel@ted>
In-Reply-To: <1377795605.1059.20.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: check before open the manifest
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
X-List-Received-Date: Fri, 30 Aug 2013 01:24:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/30/2013 01:00 AM, Richard Purdie wrote:
> On Thu, 2013-08-29 at 09:13 -0400, Robert Yang wrote:
>> The python stack trace would be printed if we:
>>
>> $ bitbake make (the make-3.82 will be built)
>> // Edit make.inc
>> $ bitbake make-3.81
>
> This is at best hiding the real problem. Why is bitbake building
> make-3.82 when you asked for make-3.81?
>
> I tried this here and also see the warning:
>
> ERROR: Multiple .bb files are due to be built which each provide make
> (/media/build1/poky/meta/recipes-devtools/make/make_3.81.bb /media/build1/poky/meta/recipes-devtools/make/make_3.82.bb).
>   This usually means one provides something the other doesn't and should.
>
> so bitbake is basically telling you there is a problem already. So there
> are two issues:
>

What I thought was that let the user know the normal error, but we can do
more to fix it as you pointed out.

> a) Why is make 3.82 being built?

Ah, yes, that's problem, I will do more investigation.

> b) If multiple identical PNs are being built we probably should hard
> error out since its not supported in the slightest. The sstate race you
> mention is the least of the problems :(.
>

OK, I will try to fix such a case:

bitbake make-3.81 make-3.82

// Robert

> Cheers,
>
> Richard
>
>
>

