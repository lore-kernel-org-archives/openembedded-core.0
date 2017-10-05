Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 7028C77FF6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 17:12:35 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id HtCa1w0050BmcFC01tCc7e; Thu, 05 Oct 2017 18:12:36 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=GetnpUfL c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=02M-m0pO-4AA:10 a=9LmApvZq9kMnY7HXiksA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1e09hK-0007S8-QZ; Thu, 05 Oct 2017 18:12:34 +0100
Date: Thu, 5 Oct 2017 18:12:34 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20171005171234.tzklu5dxxcpxpcjk@mcrowe.com>
References: <20170907111347.u4bixwf2q7mabuy3@mcrowe.com>
	<1504786869.726.13.camel@linuxfoundation.org>
	<20170907170007.ixl53bwhjmk7iwob@mcrowe.com>
	<1504819736.726.26.camel@linuxfoundation.org>
	<20170908060403.otjgmahfsdfozosn@mcrowe.com>
	<1504853621.726.32.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1504853621.726.32.camel@linuxfoundation.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Building and using a second toolchain
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
X-List-Received-Date: Thu, 05 Oct 2017 17:12:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Recap: I have a bootloader recipe that uses both the primary AArch64
cross-toolchain and an AArch32 cross-toolchain. I arrange for those
toolchains to be available by setting MULTILIBS for the machine and adding
the multilib compiler to DEPENDS for the recipe. However, this means that
the AArch32 sysroot for the recipe is not cleaned up correctly by do_clean
since it is outside WORKDIR.

On Friday 08 September 2017 at 07:53:41 +0100, Richard Purdie wrote:
> Option 3 may be to have the core staging.bbclass clean code iterate
> over the sysroots, it sounds like its creating them, just not cleaning
> them up, which is kind of a bug. "clean" is a slow path so even a tiny
> performance hit there for this likely isn't an issue...

Sorry for the delay, but I'm finally looking at this again.

I've read through staging.bbclass and I'm not sure what the best way to
implement what you suggest is.

The simplest way would be to build up a deduplicated list of sysroots from
the destsysroot assignments in extend_recipe_sysroot. If this list differs
from RECIPE_SYSROOT then stick the result in a variable and add a function
to CLEANFUNCS to perform the cleanup. Unfortunately, this adds code to the
normal build path which, based on your comment above, is probably not
acceptable.

The alternative would be to always add a function to CLEANFUNCS which runs
the same loop as extend_recipe_sysroot to identify the sysroots and remove
them (the primary ones should have already been deleted by do_clean at that
point.) This should have no effect on the normal build path, but the code
will probably not be updated if extend_recipe_sysroot changes in the
future.

Or, something else.

Do you have any further advice?

Thanks.

Mike.

