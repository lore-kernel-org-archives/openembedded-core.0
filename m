Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4A61784E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 19:03:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7IJ3raC027029
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 18 Aug 2017 12:03:54 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 18 Aug 2017 12:03:53 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Martin Jansa
	<martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
	<1502969638.13978.209.camel@linuxfoundation.org>
	<CA+chaQcZKA=x1_O88h=Akjh=Cr2Rtt_8GqgRrm61fuLnT_myRw@mail.gmail.com>
	<d2851cd0-1a15-f5aa-1e9b-dda654978178@linux.intel.com>
	<CAMKF1sryybJQXYvkQVbSEciBhYY1s7Xc-k+qhFJSRbbRxi1DJQ@mail.gmail.com>
	<fe1575c3-4e74-1a5d-b48e-86c6908b2e63@linux.intel.com>
	<CAMKF1soQw0VVy0RKe4w-qsCwPh_OTgatYLrx6mPpapBGooy-Ew@mail.gmail.com>
	<CA+chaQcQNkYbnSpVzA5xceo=CTpWDnKd8n3WaZM6zbUOe5m_XA@mail.gmail.com>
	<de4a91fe-0dc0-208e-1b2e-3e0e897fdd12@windriver.com>
	<3082288d-055f-50a4-c81e-6483d324d706@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <7f932500-ae59-3507-2725-c8b0775d76cc@windriver.com>
Date: Fri, 18 Aug 2017 14:03:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <3082288d-055f-50a4-c81e-6483d324d706@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: openssl10 unusable for many components
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
X-List-Received-Date: Fri, 18 Aug 2017 19:03:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/18/17 1:41 PM, Alexander Kanavin wrote:
> On 08/18/2017 08:56 PM, Mark Hatle wrote:
>>> Even with that patch to rename openssl10 back to openssl we still need to solve
>>> the openssl-native which wasn't reverted back to 1.0.
>>>
>>> Upstream nodejs isn't going to be openssl-1.1 for a bit longer as explained:
>>> https://github.com/nodejs/node/pull/14761
>>
>> I wanted to pull out a specific comment from the above link that shows one of
>> the reasons why OpenSSL 1.1 support is delayed by many:
>>
>> 7 days ago: shigeki commented:
>>> We're also waiting for FIPS support of 1.1.x. They are now working on it as https://www.openssl.org/blog/blog/2017/07/25/fips/.> ...
>>
>> Until the OpenSSL 1.1.x FIPS work is further along, a lot of projects (and major
>> distributions) are going to wait to deploy it.
> 
> What I don't understand is why node even cares about FIPS? FIPS 
> compliance is needed to win software supplier contracts with one certain 
> government; I haven't seen any other reasons.

Many governments and private company require this certification.  FIPS-140-2 is
the US NIST name for this work, but the same work resolves ISO requirements in
Europe and other countries.

Medical devices often requires FIPS certification in order to conform the
privacy requirements (or to be sold into US Government funded hospitals.)  FIPS
is really a big deal for many industries.

> Another point is that getting FIPS done will take a very long time, 
> possibly two years or more, and this work is just starting now with no 
> clear funding or completion date (see the openssl blog link). Meanwhile, 
> all major desktop linux distros have 1.1 by default already; seems to me 
> that they don't care.

Yes it will.  It will likely take 6 months to a year of development and likely
another 6 months to a year of certification lab work.

This is part of the reason the 1.0.2 EOL was set to end of 2019, to help force
the move to 1.1.  However, if you look at the 1.0.2 FIPS module, it has January
2022 EOL.  (Note, that EOL has a slightly different meaning then the 2019 1.0.2
one.... but the reality is that there will be organizations that will continue
to publish security fixes for OpenSSL 1.0.2 through the FIPS module EOL...
simply our of necessity.)

One of the key thing with this is that work can accelerate (likely not less then
a year) if additional people step up and assist in the funding.  I'm aware of a
few commercial companies that are discussing doing this, but unfortunately
nothing more concrete then the blog referenced above.)

> Alex
> 


