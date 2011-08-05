Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QpMJr-0000Rx-Tb
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:28:16 +0200
Received: by ywe9 with SMTP id 9so1788766ywe.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2011 08:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=EWCdk4A/eI78qsOMAFtQhN9RzdpHwFsS2VPq9UVFMzs=;
	b=uAAgHXVAlKNg4L1eblBHCa14wG96X79ZVrsPbSKhXzA7yZZ+q75VdRNNEAyLjKFYQ7
	0SkpG5R7/IqpLZEZvY/fPqPNnLMaUHMBzIbw0l1rheArxeVVk5Pi3D+ZUBcVcwSUDlhN
	AOamz6qPprMUsWD1ESH/tkgDhX6piw8uiBJOA=
Received: by 10.43.51.136 with SMTP id vi8mr2121486icb.44.1312557830707;
	Fri, 05 Aug 2011 08:23:50 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t14sm2094830ibi.6.2011.08.05.08.23.49
	(version=SSLv3 cipher=OTHER); Fri, 05 Aug 2011 08:23:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 05 Aug 2011 08:23:45 -0700
Message-ID: <9542395.hQ4Nzho55F@perseus>
Organization: Sakrah Inc.
User-Agent: KMail/4.7.0  (Linux/3.0.0-7-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <1312554884.6733.17.camel@phil-desktop>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<1312544374.14274.98.camel@rex>
	<1312554884.6733.17.camel@phil-desktop>
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 05 Aug 2011 15:28:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, August 05, 2011 03:34:43 PM Phil Blundell wrote:
> On Fri, 2011-08-05 at 12:39 +0100, Richard Purdie wrote:
> > ARM_THUMB_M_OPT = "${@['-mno-thumb',
> > '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
> > TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb",
> > "${ARM_THUMB_M_OPT}", "${ARM_THUMB_M_OPT}", d)}"
> > Master has the above. This means it can set -mthumb for machines that 
don't have the thumb feature which seems wrong to me. I suspect it should be:
> Agreed, it does seem as though any bb.utils.contains() where the "true"
> and "false" arms are identical must be wrong.
> 
> > TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb",
> > "${ARM_THUMB_M_OPT}", "-mno-thumb", d)}"
> > 
> > or if gcc can't cope with that,
> > 
> > TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb",
> > "${ARM_THUMB_M_OPT}", "", d)}"
> I think either of those should be fine.
> 

I prefer the latter since it will have one option less in gcc commandline
saving a minute bit of time spent in parsing cmdline.
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


