Return-Path: <openembedded@mindchasers.com>
X-Greylist: delayed 496 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Aug 2014 17:28:19 UTC
Received: from qmta09.westchester.pa.mail.comcast.net
	(qmta09.westchester.pa.mail.comcast.net [76.96.62.96])
	by mail.openembedded.org (Postfix) with ESMTP id E7A356FE3B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 17:28:19 +0000 (UTC)
Received: from omta08.westchester.pa.mail.comcast.net ([76.96.62.12])
	by qmta09.westchester.pa.mail.comcast.net with comcast
	id jrj01o0070Fqzac59tL40B; Wed, 27 Aug 2014 17:20:04 +0000
Received: from [192.168.1.10] ([68.38.40.177])
	by omta08.westchester.pa.mail.comcast.net with comcast
	id jtL41o0093pLAh83UtL4AY; Wed, 27 Aug 2014 17:20:04 +0000
Message-ID: <53FE1343.4060601@mindchasers.com>
Date: Wed, 27 Aug 2014 13:20:03 -0400
From: Bob Cochran <openembedded@mindchasers.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1408451752.1669.52.camel@ted>
In-Reply-To: <1408451752.1669.52.camel@ted>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1409160004;
	bh=L7bsWRaa6RPTOoNhc066Oj2tPreZ1ik8A5JNoY8tOo0=;
	h=Received:Received:Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type;
	b=aSPNGJfijHaJyr61kgJ6x6T0npe1OVUiD8W/lOMnQwGJVC+g2UhYrwMQbm4fIgSb8
	v/Bjs/FgHYLxpYxFmSVk+mM1JYtkTd2iAW/Q5ITh7/QDzU6Rsca/ZQbAymtTqQqwnj
	agpiCF5iNvqhUfwFDBOZ2B16LsnPvxCHO6wZWvGYe6r5+b/3mCplGLKxtZ7vTnaNM6
	te4/sD34SO4KdLQyN7IP5wV6ixT9T+7Yx+k3CU3dBU1xNwo3kUS4R3I75DfAQel6os
	qY+ggeg3HGO5cWdWB/U2BrEE1PSeX7EerJdf7bb9QhEyc9vocpPBdwQ9BUO6NCyGD+
	Q/3OUENKj0oEw==
Subject: Re: [PATCH] allarch: Add warning about packagegroup
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
X-List-Received-Date: Wed, 27 Aug 2014 17:28:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2014 08:35 AM, Richard Purdie wrote:
> Since we want to start including this class conditionally, detect cases
> where packagegroup files use the old ordering and inform the user they
> need to update this.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> index c953e7c..4bc9927 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -37,5 +37,7 @@ python () {
>           d.setVar("EXCLUDE_FROM_SHLIBS", "1")
>           d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
>           d.setVar("INHIBIT_PACKAGE_STRIP", "1")
> +    elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
> +        bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE", True))


I'm reviewing my recipes today to make sure everything conforms with 
this methodology.

This is minor, but I'm curious about something with this patch regarding 
warnings & errors:

Should I care that this commit says 'add warning' but the implementation 
calls bb.error()?

It looks like neither warning nor error throws an exception, so are they 
interchangeable, both really warnings?

Although my build this morning produced an image, I had a couple of 
these errors, or were they just warnings?

Thanks

Bob





>   }
>
>
>


