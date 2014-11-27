Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C95F272379
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 16:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sARGLJ1x018286; Thu, 27 Nov 2014 16:21:19 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id icD_MdZqEeDS; Thu, 27 Nov 2014 16:21:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sARGL7vp018212
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 27 Nov 2014 16:21:18 GMT
Message-ID: <1417105303.15614.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Thu, 27 Nov 2014 16:21:43 +0000
In-Reply-To: <547740A7.7000005@topic.nl>
References: <5476E26B.80003@topic.nl> <547712F1.9090209@mlbassoc.com>
	<1417094262.15614.6.camel@linuxfoundation.org>
	<547733B2.2010501@topic.nl>
	<1417099280.15614.11.camel@linuxfoundation.org>
	<547740A7.7000005@topic.nl>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org, "Hart,
	Darren" <darren.hart@intel.com>
Subject: Re: Deployment for machine X will remove its results from machine Y's deploy dir
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
X-List-Received-Date: Thu, 27 Nov 2014 16:22:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-11-27 at 16:17 +0100, Mike Looijmans wrote:
> If I understand correctly, having two "MACHINE" share the same 
> MACHINE_ARCH (which is the case for several intel boards too), is not 
> actually allowed?
> 
> Because you get the same kernel/bootloader for different machines then. 
> That's what I wanted, and that triggered me finding this issue.

Its a very good question. As things stand today, there is a one to one
mapping between MACHINE_ARCH and MACHINE, the difference being the
removal of invalid characters for the package namespace. That implies
that no, its not allowed.

The intel boards you mention do something a little different, they
inject a new "arch" into the hierarchy and then several machines share
that common "arch".

I suspect the intel boards you mention do suffer from the issue you
mention in a related way and the fix may be to s/MACHINE/PACKAGE_ARCH/
in DEPLOY_DIR_IMAGE as previously mentioned. The difference is I suspect
they deploy for the first machine built and then not for any other.
Nitin/Darren may be interested in checking into that.

> Please realize that the example is just an example. The actual problem 
> I'm experiencing is with the kernel and bootloader!

Right, the allarch behaviour is an illustration but not the underlying
problem you need to resolve (although its related).

Cheers,

Richard


