Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D988177E09
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 21:10:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v79LAuwp013970
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Aug 2017 14:10:56 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 9 Aug 2017 14:10:55 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1502107769-16160-1-git-send-email-jussi.kukkonen@intel.com>
	<41176f6a-807d-f488-7f55-38ee82cc48bf@linux.intel.com>
	<1502110800.18633.220.camel@linuxfoundation.org>
	<d6c76558-21f5-c41d-9f47-2677644e4087@linux.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <b8ccbfdc-cb51-69e2-7516-5f95e949e170@windriver.com>
Date: Wed, 9 Aug 2017 17:10:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <d6c76558-21f5-c41d-9f47-2677644e4087@linux.intel.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: Meson support in oe-core
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
X-List-Received-Date: Wed, 09 Aug 2017 21:10:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-08-07 09:47 AM, Alexander Kanavin wrote:
> On 08/07/2017 04:00 PM, Richard Purdie wrote:
> 
>> Thanks for looking at this. Whilst some project still have some support
>> for both, could we get timings of do_{configure|compile|install} for
>> autotools vs. meson?
> 
> So far there's just one recipe that I can test, json-glib, which is 
> fairly small, and so there's not a lot of difference between 
> compile+install steps. configure however is vastly faster:
> 
> autotools with gtk-doc
> 
> configure 16.53
> compile 12.56
> install 1.94
> total 31.03
> 
> meson with gtk-doc
> 
> configure 2.04
> compile 4.87
> install 9.16
> total 16.07
> 
> autotools without gtk-doc
> configure 16.26
> compile 5.49
> install 1.59
> total 23.34
> 
> meson without gtk-doc
> configure 1.95
> compile 5.04
> install 2.26
> total 9.25

Yep, total time for 'without gtk-doc' is *more* than cut in half!

The drop in configure time is certainly expected but the compilation
stage should be dominated by the compiler rather than make or ninja.
The 'without gtk-doc' compile difference mostly confirms that
but the 9% drop is odd. A couple of sources I've found assert that
for large projects and parallel builds a full build time is essentially
the same with ninja:
    http://david.rothlis.net/ninja-benchmark/
That work was done on a MacBook (!!) so it would be interesting to
see what the results are on a 24+ core Linux system. I might
give that a try tonight if there's nothing good on NetFlix.

By the way, systemd-234 has meson support and you (Alex) have sent
a patch update to 242 to the oe-core list but without switching to meson
as is reasonable. Anyway, 232 takes 51 seconds on my 16+16 core machine
so it would be a useful benchmark as well. Want to take a stab at that?

../Randy



> 
> 
> Alex


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

