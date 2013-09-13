Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB01.domain01.net (STOEXHUB01.domain01.net
	[83.145.59.142])
	by mail.openembedded.org (Postfix) with ESMTP id 7C47B60135
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 18:55:31 +0000 (UTC)
Received: from [192.168.0.247] (83.252.255.124) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Fri, 13 Sep 2013 20:55:29 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAP9ODKqcm79GME3fKMDQqWvE-h2cB++mFOC9vcr3JjE3B+ywYw@mail.gmail.com>
References: <20130913075635.GA3573@ad.chargestorm.se>
	<CAP9ODKqcm79GME3fKMDQqWvE-h2cB++mFOC9vcr3JjE3B+ywYw@mail.gmail.com>
MIME-Version: 1.0
From: Anders Darander <anders@chargestorm.se>
Date: Fri, 13 Sep 2013 20:55:23 +0200
To: Otavio Salvador <otavio@ossystems.com.br>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Message-ID: <923730d4-0ca2-411a-97e8-17cbe043ea43@email.android.com>
Subject: Re: u-boot-fw-utils -> u-boot-fw-utils-cross
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
X-List-Received-Date: Fri, 13 Sep 2013 18:55:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit



Otavio Salvador <otavio@ossystems.com.br> wrote:
>On Fri, Sep 13, 2013 at 4:56 AM, Anders Darander
><anders@chargestorm.se> wrote:
>> As I've started to bring our internal distro and machines up to the
>> lates oe-core, I've got some issues with the u-boot-fw-utils to
>> u-boot-fw-utils-cross transition.
>
>Right.
>
>> In my old branch, I used u-boot-fw-utils_2011.06. This used to
>compile
>> and package fw_printenv(setenv) just fine.
>>
>> In the new, u-boot-fw-utils-cross_2013.07.bb, fw_printenv is now
>built
>> using HOSTCC instead of the cross-compiler. The old recipe used to
>> include:
>> EXTRA_OEMAKE = 'HOSTCC="${CC}"'
>> as u-boot defaults to build everything under tools/ using HOSTC.
>
>Yes; this is intended to be used in the host. I can add support for
>use in target as well (or help you to do it).

Sorry that I didn't see this during the review of your patch that made this change. If u-boot-fw-utils-cross of intended to be used on the host, why did you then replace the old u-boot-fw-utils with this recipe? 

The old u-boot-fw-utils were to create fw_printenv to be used on the _target_ not on the host. Unfortunately, I don't think this was ever mentioned during the patch review... 

>> What's the reason for this change? Currently fw_printenv is being
>built
>> for my host system, and not the target...
>
>Yes; the way to proper package it for target is from u-boot itself,
>not on this recipe.

Yep, so the commit log that makes the transition from u-boot-fw-utils to u-boot-fw-utils-cross should have mentioned that the purpose of those two packages are completely different. 

>> Further more, fw_printenv does not get packaged. I can see that
>> fw_printenv is installed in ${WORKDIR}/image, but never moved to
>> ${WORKDIR}/package. I guess that this is caused by inheriting
>> cross.bbclass?
>>
>> Am I missing something in my distro config, or have I overlooked
>> something else? fw_printenv doesn't really make sense for me to run
>on
>> the host, and is (in my case) rather essential on the target.
>>
>> I guess that I'm doing something wrong; can anyone give me some hint
>on
>> where to look? Or do we have an issue with the u-boot-fw-utils-cross
>> recipe?
>
>No, you are right. I can help you to solve it (or solve it and send
>you the solution) if you want.

I've got a working u-boot-fw-utils recipe that I can submit. I'll look into this on Monday morning, to ensure that it's of enough quality to publish. 

Just curious, what use case do you have for fw_* the build host? 

Cheers, 
Anders 

-- 
ChargeStorm AB / eStorm 

