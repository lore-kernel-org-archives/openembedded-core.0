Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 045936CB7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 17:43:53 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0LHhduU027135; Tue, 21 Jan 2014 17:43:40 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NFIFg7PVeQsZ; Tue, 21 Jan 2014 17:43:39 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0LHhWvo027130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 21 Jan 2014 17:43:34 GMT
Message-ID: <1390326205.874.95.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
Date: Tue, 21 Jan 2014 17:43:25 +0000
In-Reply-To: <3ea5b5ff002e4f98b60997229cc31300@DM2PR03MB368.namprd03.prod.outlook.com>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<1389366908.19102.223.camel@ted> <52D3DDFB.8080803@gmail.com>
	<1389616915.14987.4.camel@ted> <52D53A6C.30808@gmail.com>
	<55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390044007.14987.151.camel@ted>
	<3ea5b5ff002e4f98b60997229cc31300@DM2PR03MB368.namprd03.prod.outlook.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "catalin.udma@freescale.com" <catalin.udma@freescale.com>,
	"openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Tue, 21 Jan 2014 17:43:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-21 at 17:39 +0000, alexandru.sardan@freescale.com wrote:
> Yes, the gcc configured for SPE (--target=powerpc-fsl_networking-linux-gnuspe)
> can generate both SPE and non-SPE code provided that software 
> floating point is used.
> 
> There are a couple of parameters (-mabi=no-spe -mno-spe) that will turn
> off SPE vector instructions generation. If the code contains floating
> point arithmethic -msoft-float needs to be used as well. This means that
> the GCC multilib setup has to be configured to include soft float and
> build coresponding version of libgcc and target fragments.
> But why would we want to generate code without SPE for e500v1/v2? 
> Soft-float comes with a major performance penalty.
> 
> Maybe I didn't understand correctly what kind of toolchain you want to
> be built in the end. Do you want to have a single GCC that builds all
> powerpc targets (e500v2, e5500, e6500 etc) and a separate sysroot for each 
> target? 

Yes, this is exactly what is wanted. This is how the SDK is intended to
operate. The alternative and what we had before was a separate compiler
for each target which is rather wasteful.

> This may be problematic since, for example, the compiler that can generate 
> SPE (for e500v2) can't generate altivec instructions (for e6500).

Is there no way to configure gcc so it can generate for the different
targets assuming you pass in the right runtime target options?

Cheers,

Richard


