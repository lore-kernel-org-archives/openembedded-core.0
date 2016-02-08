Return-Path: <mac@mcrowe.com>
Received: from avasout03.plus.net (avasout03.plus.net [84.93.230.244])
	by mail.openembedded.org (Postfix) with ESMTP id 0099D731A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 14:04:02 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout03 with smtp
	id Fq401s0090BmcFC01q41Sx; Mon, 08 Feb 2016 14:04:02 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=X8+vUzne c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=jFJIQSaiL_oA:10 a=-An2I_7KAAAA:8 a=J1hoAsCXweni6kKPIqkA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>)
	id 1aSmQ4-0005N1-OA; Mon, 08 Feb 2016 14:04:00 +0000
Date: Mon, 8 Feb 2016 14:04:00 +0000
From: Mike Crowe <mac@mcrowe.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160208140400.GA20434@mcrowe.com>
References: <1454695470-8205-1-git-send-email-mac@mcrowe.com>
	<CAJTo0LbrD3JrzKM--emSMxDyERK4qstMVsMQ4VXisMpc6AvqqA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbrD3JrzKM--emSMxDyERK4qstMVsMQ4VXisMpc6AvqqA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] Prepare for EXTRA_OEMAKE = "" in bitbake.conf
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
X-List-Received-Date: Mon, 08 Feb 2016 14:04:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 08 February 2016 at 11:49:15 +0000, Burton, Ross wrote:
> On 5 February 2016 at 18:04, Mike Crowe <mac@mcrowe.com> wrote:
> 
> > This series (sent only to openembedded-core) fixes various recipes
> > that rely on the current default value of
> > EXTRA_OEMAKE = "-e MAKEFLAGS=" to explicitly set that value in the
> > hope that bitbake.conf can set EXTRA_OEMAKE = "" in the future.
> >
> 
> We need to also vet all instances of EXTRA_OEMAKE in recipes.  I did a
> build with the EXTRA_OEMAKE change in bitbake.conf and hdparm failed to
> pass QA because the binary was already stripped, as the recipe does
> EXTRA_OEMAKE += "STRIP=echo".  That assignment isn't getting through to the
> makefiles without -e.

It seems that such QA checks are warnings so I hadn't noticed them before.
I can see this one in a build that I'm currently doing. I'd better search
through my cooker logs looking for warnings.

But, as Olof says, I don't really see how changing the default value of
EXTRA_OEMAKE would have the effect you describe. (It could have the
opposite effect if submakes are involved; without "-e MAKEFLAGS=",
STRIP=echo will make it into submakes whereas previously it would not have
done.)

It seems possible that some other variable from the environment was
previously disabling strip. I'll investigate further.

Thanks for testing.

Mike.

