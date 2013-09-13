Return-Path: <hans.beckerus@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3006260FD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 17:58:03 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id y6so2321281lbh.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 10:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=KkJiXP8FWLXtiaOoaHiF+0o1svcIRUjSFP9u3b6E1HQ=;
	b=SVDtSRxnot/ClkaaNLI51n7DgGWnSyAyT7kUYmkqFY5xNWcjWFJAZiP8WDkuX8qgxC
	jmLjybFCdKODcN/I9tdsF5aFj1nNHAphubHXEEBdjSKSuWFPKPCbu99v9Vv27k9d8ocU
	tQMrZMCyWVZHvX/pFtChm35Zk8tPHKBf7oBWYi+FG1QAtTsOwJzSQa2gzhB6MGt/aUBk
	k/c5MZ+mn4udMeiBya2RU1pyGZV9iKP7bAtScPPoYe4DJi+jDItZ1+lM84xZh1ft+x/D
	rHgth6YL/ECrLrwUcr/kJ1aCzKdGd+TKO8ck3IG94ey+VSd4mA6HmW+53Yd4YJEHI4z9
	k+eA==
X-Received: by 10.112.14.102 with SMTP id o6mr12706596lbc.28.1379095084087;
	Fri, 13 Sep 2013 10:58:04 -0700 (PDT)
Received: from [192.168.0.10] (h135n8-rny-a12.ias.bredband.telia.com.
	[217.209.54.135])
	by mx.google.com with ESMTPSA id vs11sm4930993lac.3.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Sep 2013 10:58:03 -0700 (PDT)
Message-ID: <52335229.6020406@gmail.com>
Date: Fri, 13 Sep 2013 19:58:01 +0200
From: Hans Beckerus <hans.beckerus@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <20130913075635.GA3573@ad.chargestorm.se>
	<CAP9ODKqcm79GME3fKMDQqWvE-h2cB++mFOC9vcr3JjE3B+ywYw@mail.gmail.com>
In-Reply-To: <CAP9ODKqcm79GME3fKMDQqWvE-h2cB++mFOC9vcr3JjE3B+ywYw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 13 Sep 2013 17:58:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-09-13 7:32, Otavio Salvador wrote:
> On Fri, Sep 13, 2013 at 4:56 AM, Anders Darander <anders@chargestorm.se> wrote:
>> As I've started to bring our internal distro and machines up to the
>> lates oe-core, I've got some issues with the u-boot-fw-utils to
>> u-boot-fw-utils-cross transition.
> Right.
>
>> In my old branch, I used u-boot-fw-utils_2011.06. This used to compile
>> and package fw_printenv(setenv) just fine.
>>
>> In the new, u-boot-fw-utils-cross_2013.07.bb, fw_printenv is now built
>> using HOSTCC instead of the cross-compiler. The old recipe used to
>> include:
>> EXTRA_OEMAKE = 'HOSTCC="${CC}"'
>> as u-boot defaults to build everything under tools/ using HOSTC.
> Yes; this is intended to be used in the host. I can add support for
> use in target as well (or help you to do it).
Honestly I do not understand this change at all? fw_printenv typically 
*always* executes on the target since it dumps the contents of the 
U-boot environment from a shell. Why would you want to build it for the 
host? That does not make sense. Unless host is the same as your target 
which I doubt could be considered the normal case, or?

Thanks.
Hans

>> What's the reason for this change? Currently fw_printenv is being built
>> for my host system, and not the target...
> Yes; the way to proper package it for target is from u-boot itself,
> not on this recipe.
>
>> Further more, fw_printenv does not get packaged. I can see that
>> fw_printenv is installed in ${WORKDIR}/image, but never moved to
>> ${WORKDIR}/package. I guess that this is caused by inheriting
>> cross.bbclass?
>>
>> Am I missing something in my distro config, or have I overlooked
>> something else? fw_printenv doesn't really make sense for me to run on
>> the host, and is (in my case) rather essential on the target.
>>
>> I guess that I'm doing something wrong; can anyone give me some hint on
>> where to look? Or do we have an issue with the u-boot-fw-utils-cross
>> recipe?
> No, you are right. I can help you to solve it (or solve it and send
> you the solution) if you want.
>


