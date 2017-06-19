Return-Path: <philip@balister.org>
X-Greylist: delayed 401 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 19 Jun 2017 13:27:20 UTC
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id D191C77A63
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 13:27:20 +0000 (UTC)
Received: (qmail 22437 invoked by uid 1003); 19 Jun 2017 13:20:40 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.117.63)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	19 Jun 2017 13:20:40 -0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1497868738.24449.41.camel@linuxfoundation.org>
From: Philip Balister <philip@balister.org>
Message-ID: <cbc4d73d-be96-309d-a749-0ad344572a22@balister.org>
Date: Mon, 19 Jun 2017 09:20:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1497868738.24449.41.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] OE-Core/Yocto Project's first CVE (CVE-2017-9731)
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
X-List-Received-Date: Mon, 19 Jun 2017 13:27:21 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 06/19/2017 06:38 AM, Richard Purdie wrote:
> I suspect this has been missed by some people so I want to spell it
> out. We have our first CVE in OE-Core itself.
> 
> The issue is limited to binary ipks potentially exposing sensitive
> information through the "Source:" field which contained the full
> SRC_URI. Those urls could potentially contain sensitive information
> about servers and credentials.

So the issue is leaking credentials, not build system paths? I mention
this because we do leak build system paths into images in other places.

Philip


> 
> After discussion, I ended up changing the field to contain the recipe
> filename (no path). There was talk of filtering the urls however if you
> try, it becomes clear that sensitive elements can remain and no
> solution is likely 100% effective. The other package backends don't do
> this at all so this brings ipk more into line with them. Simply
> clearing the field doesn't work with the current opkg-utils. It can be
> changed but the change becomes more invasive.
> 
> This fix has been merged to master.
> 
> I also did take the decision to backport this change back to
> pyro/morty/krogoth too. I appreciate this can cause some disruption to
> people who rely on SRC_URI being in the Source: field however I
> couldn't see any other realistic way forward.
> 
> Cheers,
> 
> Richard
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
> 

