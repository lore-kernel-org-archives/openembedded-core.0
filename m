Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 076697F76B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 16:28:22 +0000 (UTC)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id xAOGSMu5021194
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 10:28:23 -0600
To: openembedded-core@lists.openembedded.org
References: <559334b39f154c70d868dce6067984298976d841.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <8979891c-3858-169f-e2d1-d43d2ed4ed8a@kernel.crashing.org>
Date: Sun, 24 Nov 2019 10:28:22 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <559334b39f154c70d868dce6067984298976d841.camel@linuxfoundation.org>
Subject: Re: Hash Equiv rehash problems
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
X-List-Received-Date: Sun, 24 Nov 2019 16:28:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/24/19 9:58 AM, Richard Purdie wrote:
> There may be two possible fixes:
> 
> a) We force setscene tasks which have already run to rerun if this kind
> of rehash happens. We did previously do this but runqueue *really*
> doesn't like rerunning setscene tasks.
> b) We report these 'additional' equivalences to the server
> 
> We are seeing other symptoms of this "rehashing" in builds where
> "bitbake X; bitbake X" will suddenly rebuild a load of stuff in the
> second build as it didn't build it originally due to the "ignoring
> rehash" messages. This is very counter-intuitive and effectively a
> different representation of the same bug. Its less problematic since we
> just rebuild things (eSDK can't).
> 
> If we decide b) is correct, it also raises an interesting scope
> question. Should we:
> 
> a) only report things we've run into in real builds
> b) report all hashes (there'd be loads)
> c) report all hashes which are present in sstate

With some of the things I've been thinking of, specifically a combination PR,
sstate-cache server and hash equivalency server, (C) is what I was thinking of.

I've already talked to you about this, but for others who might not know why.

PR Service and sstate-cache files need to be in sync otherwise the packages that
are produced (new builds) and re-used together otherwise image installs can and
will fail.

With the new hash equivalency, determining which of the hashes to use for any
particular part of the system, all three really need to be in sync.

This is also useful for a binary distribution -> eSDK (DevTool) -> full Yocto
Project supported system.  You need all three sets of artifacts collected
together to make a transition from one to another in order to change the
configuration or add more stuff.

(Additionally you could actually validate the contents of the sstate-cache and
hash/hash-equivalency.  Multiple builds can feed into it, and the system can
validate the artifacts are actually the same or blacklist certain hashes as
non-deterministic.)

-Mark

> ?
> 
> I think I need to sit and think about this for a while. Ccing Joshua in
> case he has any insights into this...
> 
> We can't enable hashequiv by default until we get this fixed somehow.
> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 

