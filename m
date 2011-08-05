Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpNGR-0005Qi-Vv for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 18:28:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75GON6g014065
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:24:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13855-03 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 17:24:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75GOGR9014059
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:24:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9542395.hQ4Nzho55F@perseus>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<1312544374.14274.98.camel@rex> <1312554884.6733.17.camel@phil-desktop>
	<9542395.hQ4Nzho55F@perseus>
Date: Fri, 05 Aug 2011 17:23:53 +0100
Message-ID: <1312561433.14274.134.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 22/22] feature-arm-thumb: Take ARM_INSTRUCTION_SET into account to decide thumb mode
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Aug 2011 16:28:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 08:23 -0700, Khem Raj wrote:
> On Friday, August 05, 2011 03:34:43 PM Phil Blundell wrote:
> > On Fri, 2011-08-05 at 12:39 +0100, Richard Purdie wrote:
> > > ARM_THUMB_M_OPT = "${@['-mno-thumb',
> > > '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
> > > TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb",
> > > "${ARM_THUMB_M_OPT}", "${ARM_THUMB_M_OPT}", d)}"
> > > Master has the above. This means it can set -mthumb for machines that 
> don't have the thumb feature which seems wrong to me. I suspect it should be:
> > Agreed, it does seem as though any bb.utils.contains() where the "true"
> > and "false" arms are identical must be wrong.
> > 
> > > TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb",
> > > "${ARM_THUMB_M_OPT}", "-mno-thumb", d)}"
> > > 
> > > or if gcc can't cope with that,
> > > 
> > > TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb",
> > > "${ARM_THUMB_M_OPT}", "", d)}"
> > I think either of those should be fine.
> > 
> 
> I prefer the latter since it will have one option less in gcc commandline
> saving a minute bit of time spent in parsing cmdline.

Since nobody sent me a patch I've just merged a patch to do the latter.

Cheers,

Richard



