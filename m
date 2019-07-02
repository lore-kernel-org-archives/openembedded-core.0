Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id EA28D7C85D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 00:43:07 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id EC4501C0688;
	Tue,  2 Jul 2019 12:43:06 +1200 (NZST)
To: Joshua Watt <jpewhacker@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <ba3936e9-0582-4187-89d7-0a8f1dd4c550@gmail.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <f01d7add-70c1-dfe7-597c-75c414dbe643@taitradio.com>
Date: Tue, 2 Jul 2019 12:43:06 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <ba3936e9-0582-4187-89d7-0a8f1dd4c550@gmail.com>
Subject: Re: The state of reproducible Builds
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
X-List-Received-Date: Tue, 02 Jul 2019 00:43:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

On 2/07/19 3:58 AM, Joshua Watt wrote:

> 1. Testing RPM and IPK package formats. I think RPMs will be pretty 
> easy; IPKs might be more challenging since AFAIK the tools that make 
> them don't generate reproducible output to begin with.


This has not been my experience. I have been building reproducible ipks, 
indeed, it is the hashsums of the ipks that I've been examining. In most 
cases, the correct SOURCE_DATE_EPOCH is enough, but there have been 
cases where I've had to correct upstream projects to cope with the 
SOURCE_DATE_EPOCH or avoid the effect of differing uname settings.


> 1. HOSTTOOLS differences. There are a lot of tools listed in 
> HOSTTOOLS, and unfortunately some of them have version dependent 
> output and are used for target builds (the one I've currently stumbled 
> upon is pod2man, but I'm sure there are others). Unfortunately, one 
> could probably argue that HOSTTOOLS is somewhat antithetical to the 
> above statement, at least in regard to target builds. Any host tool 
> output that "leaks" into the target build output can result in a 
> non-reproducible build across hosts, and possibly should be avoided; 
> the alternative is to use (or mandate) the corresponding -native 
> recipe that provides that tool as a DEPENDS so that the controlled 
> internally built version is used instead. Note that this only really 
> applies target builds, not -native (or nativesdk right now). -native 
> recipes would obviously need more HOSTTOOLS to help bootstrap the 
> system. I suspect this would require reworking how HOSTOOLS works so 
> that they can be split into two categories somehow; the tools that 
> have "ubiquitous and stable" interfaces and are fine for all recipes 
> (e.g. cat, sed, true, rm, etc.) and those that are variable and should 
> only be used for -native builds (e.g. pod2man, rpcgen(?), chrpath(?), 
> tar(?)... others?). Anyone have thoughts on this?


Perhaps reproducibility is the decision-point for adding a tool to the 
HOSTTOOLS: If the precise version of the tool has no impact on 
reproducibility (eg. cat, sed, and even gawk), it is a good candidate 
for the HOSTTOOLS. pod2man shouldn't be in the HOSTTOOLS, because we 
need to control the version.


