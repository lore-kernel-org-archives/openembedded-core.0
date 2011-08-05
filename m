Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QpLYI-0007Pt-N6
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 16:39:06 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QpLU4-0005fK-3t
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 16:34:44 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 05 Aug 2011 15:34:43 +0100
In-Reply-To: <1312544374.14274.98.camel@rex>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<d383462fb2d94c991d3d67ab07f444b0d6ac2c3a.1312182844.git.sgw@linux.intel.com>
	<1312204479.2344.442.camel@rex> <1312541976.6733.12.camel@phil-desktop>
	<1312544374.14274.98.camel@rex>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312554884.6733.17.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 05 Aug 2011 14:39:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 12:39 +0100, Richard Purdie wrote:
> ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
> TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "${ARM_THUMB_M_OPT}", d)}"
> 
> Master has the above. This means it can set -mthumb for machines that don't have the thumb feature which seems wrong to me. I suspect it should be:

Agreed, it does seem as though any bb.utils.contains() where the "true"
and "false" arms are identical must be wrong.

> TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "-mno-thumb", d)}"
> 
> or if gcc can't cope with that,
> 
> TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}"

I think either of those should be fine.

p.




