Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D8AC56A962
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 04:58:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6P4wHA8015931
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Jul 2013 21:58:17 -0700 (PDT)
Received: from [128.224.20.100] (128.224.20.100) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 24 Jul 2013 21:58:16 -0700
Message-ID: <51F0B066.6000503@windriver.com>
Date: Thu, 25 Jul 2013 00:58:14 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1374479372.git.kai.kang@windriver.com>
	<3185bfa72aaa8acd02d32f67ee51de79a24c7c19.1374479372.git.kai.kang@windriver.com>
	<1374481350.6719.83.camel@bril0118.bri.st.com>
	<51EF39C7.2060703@windriver.com>
	<CAJTo0LYcYUVxJ0pyMDKTSA_=ezGnn++nSh-MuFsFC40LBwydWw@mail.gmail.com>
	<CANyK_8difMKU96M-DeL2XHrdR+RV9TFEXvgJDeVey6zktjXprQ@mail.gmail.com>
	<1374659271.6324.95.camel@phil-desktop.brightsign>
In-Reply-To: <1374659271.6324.95.camel@phil-desktop.brightsign>
X-Originating-IP: [128.224.20.100]
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkit-gtk: fix 'Memory exhausted' error
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
X-List-Received-Date: Thu, 25 Jul 2013 04:58:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-07-24 05:47 AM, Phil Blundell wrote:
> On Wed, 2013-07-24 at 09:31 +0100, Paul Barker wrote:
>> Would variables like LDFLAGS_webkit-gtk and PARALLEL_MAKE_gnuradio be
>> applied to the appropriate recipes if they were set in local.conf or a
>> globally inherited bbclass, or am I misunderstanding how bitbake
>> parses variables?
>
> LDFLAGS_pn-webkit-gtk and PARALLEL_MAKE_pn-gnuradio, yes.  Any of that
> stuff can go in site.conf and/or local.conf, and this is where this sort
> of build-environment-specific customisation belongs.

I disagree.

The default behaviour should be that the system builds as long
as the hosts has some minimum RAM.  If this means that we pay
a < ~5% build time penalty, we should not flinch. I'm not sure
how much extra time I'm willing to accept but for a given package
even a factor of two could be acceptable as long as the overall
build did not take twice as long.

Kai, when you have a chance to test this, can you tell us
what sort of build time differences we are talking about for
the full package as well as just for the link phase if that's easy
to extract? You could use /usr/bin/time to get the cpu and memory
usage.

Are we really expecting all system builders to track all
these limitations and put them in place on low-end machines?
I realize that we need, and most of us have, a beefy box for builds
but a few people are still trying to build using 32 bit, 4 GB systems
and many people likely expect that 8 GB of RAM is plenty, in fact
the system where this problem occurred had 8 GB and was running
with:
   BB_NUMBER_THREADS ?= "2"
   PARALLEL_MAKE ?= "-j 4"
so there shouldn't have been much memory pressure.

Do we have minimum build system specs?

Regardless of what default behaviour we pick, switching a build to be
tuned for a high/low end machine should be easy to do at
set-up time as Paul suggested. Embedding such limitations in
individual recipes and activating them by setting a single
variable in local.conf is appealing.

// Randy


> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

