Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1086C73A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 16:59:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s14Gx2AG019435
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Feb 2014 08:59:02 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 4 Feb 2014 08:59:02 -0800
Message-ID: <52F11C55.10108@windriver.com>
Date: Tue, 4 Feb 2014 10:59:01 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1390833588.17424.254.camel@ted>	<BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>
	<lyfvny500u.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyfvny500u.fsf@ensc-virt.intern.sigma-chemnitz.de>
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Tue, 04 Feb 2014 16:59:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/4/14, 10:13 AM, Enrico Scholz wrote:
> Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>
> writes:
>
>>> +# Default to setting automatically based on cpu count
>>> +BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
>>
>> I've noticed that after 4 threads IO becomes a big bottleneck when you
>> have things like webkit, qt, asio etc in the buildqueue. Combine that
>> with issues like every make -j thread taking >2GB ram with asio and
>> webkit this default seems a bit high. I'd use 0.5*numcpu with a lower
>> bound of 2.
>
> limitting the load mitigates this (high i/o increases it); e.g.
>
> PARALLEL_MAKE = "\
>    ...
>    -l ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 150/100} \
> "

FYI, I think this points out the variability in system performance, between CPU, 
RAM and I/o.

As it stands the patch gives my machine the best performance.  So I like it as 
it is.  But my machine (dual 8-core w/ HT, 64 GB of RAM, and hardware raid). 
But on hardware with less RAM, slower disk, it may not perform optimally.

So the catch is what is the proper optimal setting?  As I see it, assuming that 
the system has enough ram and I/O to fill the CPUs is the best approach (what 
was implemented.)  And then in the comments document that this may not be the 
best setting for all systems, and the user should adjust it as necessary.  Even 
suggesting some of the alternative systems such as the 150/100 above.

No setting is going to make everyone happy, but something has to be better then 
defaulting to '1'.

--Mark

> Enrico
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


