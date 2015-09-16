Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 709427404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 16:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8GGi3UA000913; Wed, 16 Sep 2015 17:44:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZXdVPzHMV0A3; Wed, 16 Sep 2015 17:44:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8GGhlPK000887
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 16 Sep 2015 17:43:58 +0100
Message-ID: <1442421827.26666.142.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Reshetova, Elena" <elena.reshetova@intel.com>
Date: Wed, 16 Sep 2015 17:43:47 +0100
In-Reply-To: <2236FBA76BA1254E88B949DDB74E612B41976CB1@IRSMSX102.ger.corp.intel.com>
References: <2236FBA76BA1254E88B949DDB74E612B41976CB1@IRSMSX102.ger.corp.intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to put a correct dependency with regards to gcc?
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
X-List-Received-Date: Wed, 16 Sep 2015 16:44:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2015-09-04 at 17:03 +0000, Reshetova, Elena wrote:
> I have a simple problem but not able to come with simple and elegant
> solution for it, so would be very thankful for the suggestions. 
>  
> I have a task that is specified to run after do_fetch. The task needs
> the source to be *actually* fetched, since it operates on archives. It
> works well for everything apart gcc. 
>
> For example in fido branch, my task run for libgcc will fail, because
> do_fetch task for libgcc actually *does not* not fetch the gcc sources
> (only puts a nice lock file in the download folder).
>  
> When I noticed this, I tried to put the dependency on
> gcc-source:do_fetch for my task (because that actually fetches the gcc
> sources) and it works in fido, but in master after changes to gcc
> nothing provides gcc-source and it wants to specify the version, which
> I don’t want to do (ideally I don’t want to put any dependencies to
> gcc, since I don’t really depend on it!). In master a run for
> libgcc-initial fails for the same reasons: gcc tar ball is not there. 
>  
> Is there a way to make it work correctly? 

We could change gcc-shared-work.inc to add:

do_fetch[depends] += "gcc-source-${PV}:do_fetch"

which I think might fix the issues you're seeing. The good news is that
gcc is pretty unique in this regard so you shouldn't see the issue
anywhere else.

I'm also wondering whether we simply should set SRC_URI to be empty
here. The source is fetched, unpacked and patched as part of the
gcc-source recipe. Your code should only really analyse the copy in
gcc-source, its the same source used by all the different gcc variants.

Cheers,

Richard



