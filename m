Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C896E60155;
	Tue, 21 Jan 2014 07:21:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0L7LpqC014356
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Jan 2014 23:21:51 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 20 Jan 2014 23:21:51 -0800
Message-ID: <52DE200D.9020906@windriver.com>
Date: Tue, 21 Jan 2014 15:21:49 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Darren Hart
	<dvhart@linux.intel.com>
References: <20140106112936.C3F0C50472@opal> <20140109144245.GF3709@jama>	
	<1389763343.3092.17.camel@dvhart-mobl4.amr.corp.intel.com>	
	<52D62433.8020402@windriver.com> <20140115103059.GH3717@jama>	
	<CANR6C55w4BGDQadD5+Udv=2ae6nBUZiO8UdfVnFdSDkHGb2L9w@mail.gmail.com>	
	<1390242540.3441.36.camel@dvhart-mobl4.amr.corp.intel.com>
	<1390262187.874.76.camel@ted>
In-Reply-To: <1390262187.874.76.camel@ted>
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : autogen-native: upgrade to 5.18.2
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
X-List-Received-Date: Tue, 21 Jan 2014 07:21:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/21/2014 07:56 AM, Richard Purdie wrote:
> On Mon, 2014-01-20 at 10:29 -0800, Darren Hart wrote:
>> Reverting the patch allows me to move forward, but yes, I'm surprised we
>> aren't seeing more build failures.... I wonder what makes us special?
>
> For some reason I still don't have the email I can see you sent from the
> list archives. What is interesting is that:
>
> a) you have gcc 4.6, I have gcc 4.8
> b) the error appears to come from error.h in SCM_NORETURN definitions
> c) the config log for autogen shows different results for
>     "checking for working stdnoreturn.h", yes in my case, no in yours.
>
> The definition of SCM_NORETURN is from __scm.h:
>
> #define SCM_NORETURN __attribute__ ((noreturn))
>
> and the dummy stdnoreturn.h that autogen would generate does:
>
> #define noreturn _Noreturn
>
> and then _Noreturn.h defines:
>
> #  define _Noreturn __attribute__ ((__noreturn__))
>
> so I think what is happening is there is double macro overlap with
>
> #define SCM_NORETURN __attribute__ ((noreturn))
>
> becoming
>
> #define SCM_NORETURN __attribute__ ((__attribute__ ((__noreturn__))))
>

Yes, indeeded, I removed the stdnoreturn.h from my host, then I can reproduce
the error, and the upstream has a patch to fix it:

http://git.savannah.gnu.org/gitweb/?p=guile.git;a=patch;h=36c40440078c005cd5e239cca487d29f6f60007d

I will send the PR sooner.

// Robert


> How we fix it I have no idea. We should check and see if someone fixed
> this upstream to start with. Robert, now we know what to look for, can
> you help?
>
> Cheers,
>
> Richard
>
>
>

