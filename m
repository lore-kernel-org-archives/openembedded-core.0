Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 89E466B9DD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 11:20:38 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0IBKO5f017058; Sat, 18 Jan 2014 11:20:24 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jOnl_MM3kyxY; Sat, 18 Jan 2014 11:20:24 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0IBKDh2017051
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sat, 18 Jan 2014 11:20:16 GMT
Message-ID: <1390044007.14987.151.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
Date: Sat, 18 Jan 2014 11:20:07 +0000
In-Reply-To: <55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<1389366908.19102.223.camel@ted> <52D3DDFB.8080803@gmail.com>
	<1389616915.14987.4.camel@ted> <52D53A6C.30808@gmail.com>
	<55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "cross-canadian: Handle powerpc linux verses linux-gnuspe"
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
X-List-Received-Date: Sat, 18 Jan 2014 11:20:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-01-17 at 14:43 +0000, alexandru.sardan@freescale.com wrote:
> e500v1/v2 uses SPE to handle floating point operations
> using general purpose regs.
> So using the non-SPE compiler with SPE libraries won't work.
> However the soft-fp libraries are compatible with the e500 
> ABI (with a considerable performance penalty).
> 
> From what I can see, eglibc is built with SPE. So GCC should 
> be built also for SPE (target powerpc-poky-linux-gnuspe).

The key question is this:

Can one gcc binary generate code for both non-SPE and SPE targets,
assuming its pointed at an appropriate sysroot containing appropriate
libraries?

If we can have one such binary, how do we configure it? If we can't, we
need to redo the way gcc-cross-canadian is working on powerpc.

The change there was to have one gcc for each different target
architecture rather than each "tune" since that was horribly
inefficient.

Cheers,

Richard




