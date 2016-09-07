Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 380CD776A7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 11:56:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u87BuuAA017440
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Sep 2016 04:56:56 -0700 (PDT)
Received: from server.local (147.11.117.229) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Sep 2016 04:56:55 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1473240442.20226.111.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <86d45370-2472-5be2-d1c9-b0e44bd53291@windriver.com>
Date: Wed, 7 Sep 2016 07:56:55 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473240442.20226.111.camel@linuxfoundation.org>
Cc: "markus.Lehtonen" <markus.Lehtonen@intel.com>
Subject: Re: Speed regression in the 4.8 kernel?
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
X-List-Received-Date: Wed, 07 Sep 2016 11:57:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-09-07 5:27 AM, Richard Purdie wrote:
> Hi Bruce,
>
> I deliberately spaced out the merges of various things so we could get
> performance measurements of the system as it happened. Unfortunately
> the 4.8 kernel appears to regress the kernel build time quite
> significantly:
>
> The raw data:
>
> ypperf02,master:9428b19a7dd1d265d9f3211004391abe33ea0224,uninative-1.3-414-g9428b19,1:01:32,4:21.16,1:00:32,2:10.86,0:16.19,0:11.21,0:01.20,5:34.73,26701616,6445160,1477762,5446116
> ypperf02,master:9428b19a7dd1d265d9f3211004391abe33ea0224,uninative-1.3-414-g9428b19,1:04:14,4:23.82,1:00:40,2:13.70,0:16.18,0:11.28,0:01.22,5:45.48,26697516,6445724,1478048,5446490
> ypperf02,master:b9d90ace005597ba35b59adcd8106a1c52e40c1a,uninative-1.3-438-gb9d90ac,1:03:16,7:22.13,1:02:46,2:16.60,0:16.32,0:11.04,0:01.21,5:42.11,30852876,10550952,1707255,5912282
> ypperf02,master:f7ca989ddc6d470429b547647d3fbaad83a982d9,uninative-1.3-446-gf7ca989,1:04:42,7:29.05,1:03:04,2:19.71,0:16.21,0:11.05,0:01.24,5:52.83,30845748,10551316,1707615,5912122
>
> which shows the time for "bitbake virtual/kernel -c cleansstate; time
> bitbake virtual/kernel" goes from 4:20 to 7:22. The disk footprint of
> the build went from 26GB to 30GB. The build with rm_work size went from
> 6.4GB to 10.5GB. The overall build time went up 2-3 minutes which looks
> like the increased kernel build time. The increased time may well be
> from the increased data being generated/processed.

Is it the actual compile itself ? What's the trick to actually get
individual task

For the disk footprint, I can check the refs in the tree and purge
anything that may be dangling. That being said, I can't do that to
the repository on the git server, so we may need someone that can
issue a git gc directly on the repository.

>
> We can't ship M3 with this much of a performance degradation and
> increased space usage :(. Any idea what changed?

Nope. I can only focus on one thing at a time. I was worried about
a functionally correct kernel (which I still am) and haven't looked
at anything in the peripheral yet.

If I can get individual task timings, I can look at it more.

I'm seeing significantly faster meta data phases, etc, so I'm interested
to know if this is purely in the build steps.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>


