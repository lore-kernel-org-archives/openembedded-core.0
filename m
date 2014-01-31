Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 88BE66E987
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 18:07:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0VI6lmS004518; Fri, 31 Jan 2014 18:07:26 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KIYRQBm9fQc1; Fri, 31 Jan 2014 18:07:26 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0VI7GHP004539
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 31 Jan 2014 18:07:22 GMT
Message-ID: <1391191631.28575.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
Date: Fri, 31 Jan 2014 18:07:11 +0000
In-Reply-To: <da5289aa6e744c99ac4cb134483cdec9@DM2PR03MB368.namprd03.prod.outlook.com>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<1389366908.19102.223.camel@ted> <52D3DDFB.8080803@gmail.com>
	<1389616915.14987.4.camel@ted> <52D53A6C.30808@gmail.com>
	<55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390044007.14987.151.camel@ted>
	<3ea5b5ff002e4f98b60997229cc31300@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390326205.874.95.camel@ted>
	<c5873e086bd941e68daa26cbcdca573e@BLUPR03MB357.namprd03.prod.outlook.com>
	<1390596961.24755.21.camel@e130.pbcl.net>
	<1390995512.24655.62.camel@ted>
	<da5289aa6e744c99ac4cb134483cdec9@DM2PR03MB368.namprd03.prod.outlook.com>
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
X-List-Received-Date: Fri, 31 Jan 2014 18:07:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-01-31 at 17:53 +0000, alexandru.sardan@freescale.com wrote:
> Hi Richard,
> 
> I've tested your patch for both altivec and spe and it works fine.

Would you be able to put together a proper patch with the explanation
and so on so we can get it merged and resolve this issue?

Cheers,

Richard

> Regards,
> Alex
> 
> > -----Original Message-----
> > From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > Sent: Wednesday, January 29, 2014 1:39 PM
> > To: Phil Blundell
> > Cc: Sardan Alexandru Cezar-B41700; Udma Catalin-Dan-B32721; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc
> > linux verses linux-gnuspe"
> > 
> > On Fri, 2014-01-24 at 20:56 +0000, Phil Blundell wrote:
> > > On Thu, 2014-01-23 at 18:22 +0000, alexandru.sardan@freescale.com
> > wrote:
> > > > [Alex Sardan] No. The more generic target powerpc-none-linux will not
> > > > generate SPE code and the powerpc-none-linux-gnuspe target that
> > generates
> > > > SPE will not be able to generate Altivec.
> > >
> > > Why not?  As far as I can tell from the gcc configury, the target
> > string
> > > only affects the defaults (i.e. powerpc-*-linux gets -mno-spe
> > > -mno-altivec, powerpc-*-linuxaltivec gets -maltivec -mno-spec, and
> > > powerpc-*-linuxspe gets -mno-altivec -mspe).  There doesn't seem to be
> > > any real impact beyond this that would make the compiler binary
> > > fundamentally incapable of generating either type of instruction if you
> > > pass the appropriate options on the command line.
> > 
> > I had a closer look at this. The config.gcc case statements for powerpc
> > only appear to let you include rs6000/linuxaltivec.h or
> > rs6000/linuxspe.h, there doesn't appear to be a target you can pass in
> > to get both.
> > 
> > Looking at the code in those files, I don't see any reason why you can't
> > actually include support for both however. As such, I just hacked a
> > build with:
> > 
> > tm_file="${tm_file} rs6000/linuxaltivec.h"
> > tm_file="${tm_file} rs6000/linuxspe.h rs6000/e500.h"
> > 
> > and it certainly seems to build ok and compile things (this was just for
> > qemuppc). I didn't try building altivec or spe specific things but
> > looking at the code, I can't see any reason it wouldn't work at least in
> > theory.
> > 
> > I'd suggest the easiest way to resolve this may be to patch gcc to
> > include support for all the modes.
> > 
> > Cheers,
> > 
> > Richard
> > 
> > 
> 
> 



