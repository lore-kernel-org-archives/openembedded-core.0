Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E40C77D2F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 17:02:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v51H2pU9022360
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Jun 2017 10:02:51 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 10:02:51 -0700
To: Cody P Schafer <dev@codyps.com>
References: <20170530211436.16397-1-dev@codyps.com>
	<CAPoQQ-1uznmcUSkXs3iLYyK-Bm8gDaT5de_Bi-jF4Su6+KjKvw@mail.gmail.com>
	<CADkTA4MoY27QPks7oJVP-tfs1+Yr1yY9StmXToNT5Rrs9mYJAA@mail.gmail.com>
	<CAPoQQ-00id+nBQ1_n=b=7RNrixOxPZb_5puOvCFmOspQB=O3rw@mail.gmail.com>
	<7bed8363-bd79-0233-3e91-1a74f26fca37@windriver.com>
	<CAPoQQ-3k3HBh97T855_qY4PtBy8Z2qTVuU_BawnBJsvcBCoe8A@mail.gmail.com>
	<d5baf3fb-75f5-d50c-e59b-07f3688a88d4@windriver.com>
	<CAPoQQ-32FvReq9UQPKVYM0dL4LC=vg__GVvnVf3uSq8YwDQerg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <f3591f2b-14cb-7db8-b697-17db7c2e3cb0@windriver.com>
Date: Thu, 1 Jun 2017 12:02:49 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAPoQQ-32FvReq9UQPKVYM0dL4LC=vg__GVvnVf3uSq8YwDQerg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu-export-rootfs: don't change RPC ports
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
X-List-Received-Date: Thu, 01 Jun 2017 17:02:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/31/17 3:27 PM, Cody P Schafer wrote:
>> RPC Ports are just the bindings into rpcbind.   The tcp/udp ports are the ones
>> that typically conflict and why this was all done to begin with.
> 
> Ok, then it doesn't sound like that is a conflict or a "privileged
> ports" issue, and it is safe to drop the custom rpc program numbers
> ("RPC Ports") from `unfsd`s arguments & the kernel parameters.
> 
> As I've noted, runqemu-export-rootfs does not register with rpcbind
> (we pass the `-p` flag to `unfsd`).

The rpcbind runs on a privileged port (usually).  So either you have to 're-use'
the system wide on or run your own.  On many environments, with a system wide
one, you will clash if someone else is offering the same services.  So you are
forced to run your own and/or register then with a different set of port numbers.

This is absolutely needed in a multi-user or 'locked system' configuration where
the user does not have permission to run these types of things.

--Mark

> Or is there something else system-wide which is keeping a list of rpc
> program numbers?
> 


