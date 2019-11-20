Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1B7F07F847
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 19:09:37 +0000 (UTC)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id xAKJ9aiM028477
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Wed, 20 Nov 2019 13:09:37 -0600
To: Ryan Harkin <ryan.harkin@linaro.org>
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<5c9cb09a-e0b3-f43b-36cd-bc9a7df2dd6c@kernel.crashing.org>
	<CAD0U-hLzTxYw3F-tPbj5m1+iqW+2PZcU5n4bE1sxL9KxGmuVUw@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <31b224ae-8e1a-943c-0554-684557ef33bc@kernel.crashing.org>
Date: Wed, 20 Nov 2019 13:09:35 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAD0U-hLzTxYw3F-tPbj5m1+iqW+2PZcU5n4bE1sxL9KxGmuVUw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to backport openssl to Sumo
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
X-List-Received-Date: Wed, 20 Nov 2019 19:09:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/20/19 1:06 PM, Ryan Harkin wrote:
> 
> 
> On Wed, 20 Nov 2019 at 18:36, Mark Hatle <mark.hatle@kernel.crashing.org
> <mailto:mark.hatle@kernel.crashing.org>> wrote:
> 
> 
> 
>     On 11/20/19 12:18 PM, Ryan Harkin wrote:
>     > Hi all,
>     >
>     > I'm struggling with backporting OpenSSL to my Sumo build [1], so wondered if
>     > anyone else had done something similar with success.
>     >
>     > I copied "meta/recipes-connectivity/openssl" from Poky master branch [2]
>     into my
>     > own layer [3]. It didn't pick up, so I discovered I needed to add
>     > a PREFERRED_VERSION, eg:
>     >
>     > +PREFERRED_VERSION_openssl ?= "1.1.%"
>     > +PREFERRED_VERSION_openssl-native ?= "1.1.%"
>     > +PREFERRED_VERSION_nativesdk-openssl ?= "1.1.%"
>     >
>     > Now it builds fine. However, I no longer have /usr/bin/openssl in my disk
>     image.
>     >
>     > It doesn't appear in FILES_${PN}, and adding it to the recipes doesn't seem to
>     > make any difference.
>     >
>     > What am I missing?
>     >
>     > Thanks,
>     > Ryan.
>     >
>     > [1] I'm looking for CVE fixes, 1.0.2p has a lot of CVEs.
> 
>     You know that 1.0.2 and 1.1 APIs are not compatible?  So you will need to update
>     everything that needs OpenSSL to understand the new API.
> 
> 
> So far, we're only using it in a shell script to sign an image and later verify
> the image, so I've assumed, perhaps naively, that the API changes won't matter...

Correct, but there may be other components of the system that could be using the
API that you are unaware of.  On a system as old as Sumo, you will need to take
precautions to ensure that ONLY the 1.1x version is being used.  (There may be
an openssl10 for compatibility that will need to be blacklisted.)

> 
>     For CVE fixes, typically you would patch 1.0.2p, or update to the latest
>     (1.0.2t) as you go.  (If you have an OSV, this should be part of the services
>     that they offer you.) 
> 
> 
>     In my opinion, 1.0.2 will be around for at least another 4-5 years due to the
>     number of people actively using it in the world.  Until 1.1/3.0 (won't be a 2.0
>     from what I read) exists and has a FIPS-140-2 support available -- people will
>     continue to use 1.0.2 and maintain it as necessary for security.
> 
>     As an FYI:  http://git.yoctoproject.org/cgit/cgit.cgi/meta-openssl102/
> 
>     This version is for thud, warrior, zeus and master.  It is intended to be
>     maintained until either 1.0.2 is no longer maintainable -- or the FIPS-140-2
>     needs have been met by OpenSSL.
> 
> 
> Great, that looks like a better option anyway, assuming it has the latest fixes
> I need, and doesn't give me the same build problem.  Thanks for pointing it out.
> I'll give it a go.

It's better to work with the Sumo version for your needs.  I just posted that as
an example of openssl 1.0.2 being needed still by others, even as oe-core/Yocto
Project have changed their defaults.

--Mark

> Thanks,
> Ryan.
>  
> 
> 
>     --Mark
> 
>     > [2] http://git.yoctoproject.org/git/poky
>     > I'm at SHA a616ffebdc, so I copied openssl_1.1.1d.bb
>     <http://openssl_1.1.1d.bb> <http://openssl_1.1.1d.bb>
>     > and all the other files in the directory.
>     >
>     > [3] I have a clone of Linaro's meta-backports. I'm trying to generate a
>     patch to
>     > submit for review there.
>     > https://git.linaro.org/openembedded/meta-backports.git
>     >
> 

