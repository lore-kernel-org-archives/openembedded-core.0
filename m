Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 276DB7807C;
	Mon, 19 Jun 2017 14:05:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5JE5xUx002565
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Jun 2017 07:05:59 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Jun 2017 07:05:58 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1497868738.24449.41.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <84e28d41-e2b9-0ba5-2bf3-49ee408da465@windriver.com>
Date: Mon, 19 Jun 2017 09:06:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.0
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
X-List-Received-Date: Mon, 19 Jun 2017 14:06:00 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/19/17 5:38 AM, Richard Purdie wrote:
> I suspect this has been missed by some people so I want to spell it
> out. We have our first CVE in OE-Core itself.
> 
> The issue is limited to binary ipks potentially exposing sensitive
> information through the "Source:" field which contained the full
> SRC_URI. Those urls could potentially contain sensitive information
> about servers and credentials.

Does any of the 'archiver' output include copies/versions of the full SRC_URI?
Same with the license management parts... (I don't think either do) but these
would be the places I'd think the SRC_URI might also be.

--Mark

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


