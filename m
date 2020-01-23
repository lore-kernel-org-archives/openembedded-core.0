Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 41ACA7FD53
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AD6D79C00B9;
	Thu, 23 Jan 2020 09:22:22 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id 4GLkOOMHnp3Z; Thu, 23 Jan 2020 09:22:22 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id EA6809C0293;
	Thu, 23 Jan 2020 09:22:21 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id LCnga2pvg3hy; Thu, 23 Jan 2020 09:22:21 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CA3599C00B9;
	Thu, 23 Jan 2020 09:22:21 -0500 (EST)
Date: Thu, 23 Jan 2020 09:22:21 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <555772143.2167690.1579789341772.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <fc798fd12d4a06537fd235b6247a0193d1df3022.camel@linuxfoundation.org>
References: <670208445.2165783.1579785268358.JavaMail.zimbra@savoirfairelinux.com>
	<fc798fd12d4a06537fd235b6247a0193d1df3022.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC79 (Linux)/8.8.11_GA_3737)
Thread-Topic: Connectivity check uris
Thread-Index: uadAjf298h9GJWpx4vNowVQkufqqZA==
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Connectivity check uris
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
X-List-Received-Date: Thu, 23 Jan 2020 14:22:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Jan 23, 2020, at 2:26 PM, Richard Purdie richard.purdie@linuxfoundation.org wrote:
> On Thu, 2020-01-23 at 08:14 -0500, Jean-Marie LEMETAYER wrote:
>> Hi folks,
>> 
>> I have noticed some hang-ups at the beginning of my builds on the
>> master branch.
>> I have search a little and discovered that the connectivity check
>> made by poky
>> was the root cause. In fact connectivity check use the
>> CONNECTIVITY_CHECK_URIS
>> variable which is by default set to "https://www.example.com/".
>> 
>> So I have made some tests with a little script which gets the URI 100
>> times:
>> 
>> 	$ cat connectivity_check.sh
>> 	#!/bin/sh
>> 	connectivity_check()
>> 	{
>> 		local ok=0
>> 		for i in $(seq 100)
>> 		do
>> 			$@ > /dev/null && ok=$(($ok + 1))
>> 		done
>> 		echo $ok $@
>> 	}
>> 	connectivity_check wget -qO- --timeout=1 --tries=1 $1
>> 	connectivity_check curl -s --connect-timeout 1 $1
>> 
>> Note that in the script, I use wget and curl to see if there are any
>> differences
>> but I don't think that's a thing.
>> 
>> Here are the results:
>> 	$ time ./connectivity_check.sh https://example.com
>> 	45 wget -qO- --timeout=1 --tries=1 https://example.com
>> 	45 curl -s --connect-timeout 1 https://example.com
>> 
>> 	real	2m23.595s
>> 	user	0m3.352s
>> 	sys	0m1.834s
>> 
>> 	$ time ./connectivity_check.sh https://openembedded.org
>> 	100 wget -qO- --timeout=1 --tries=1 https://openembedded.org
>> 	100 curl -s --connect-timeout 1 https://openembedded.org
>> 
>> 	real	4m36.188s
>> 	user	0m3.853s
>> 	sys	0m1.761s
>> 
>> 	$ time ./connectivity_check.sh https://google.com
>> 	100 wget -qO- --timeout=1 --tries=1 https://google.com
>> 	100 curl -s --connect-timeout 1 https://google.com
>> 
>> 	real	0m36.328s
>> 	user	0m4.265s
>> 	sys	0m2.028s
>> 
>> So "example.com" is clearly not a good domain to do connectivity
>> checks.
>> 
>> The "openembedded.org" domain is good but have a slow response time.
>> 
>> And finally "google.com" which have all sort of speedy networking
>> stuff is very
>> efficient.
>> 
>> ---
>> 
>> I think the CONNECTIVITY_CHECK_URIS variable must be updated and not
>> use the
>> "example.com" domain anymore. Using "google.com" may be the best
>> option. But
>> eetting up a custom domain like "connectivitycheck.openembedded.org"
>> could be
>> another idea.
>> 
>> Any ideas
> 
> I think if you look at the history we did use google.com however that
> caused problems for people in geos where that is blocked (e.g. PRC).
> 
> We may want to move the default back given the performance isse, not
> sure...

I understand the issue with blocked domains this is why I suggest the
custom domain "connectivitycheck.openembedded.org".

But I dont know if it could be an option. Can OE have a sub-domain like
that? maybe using some cdn to handle the load?

Another option will be to provide multiple URIs:
    CONNECTIVITY_CHECK_URIS ?= " \
        https://google.com \
        https://www.bing.com \
        https://www.baidu.com \
    "

Best regards,
Jean-Marie

