Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SsAIq-0003dK-PB
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 12:19:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2012 03:07:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="168865673"
Received: from unknown (HELO helios.localnet) ([10.252.121.25])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2012 03:07:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Jul 2012 11:07:54 +0100
Message-ID: <3319777.TyI30YKFDu@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <500906A1.8000600@linux.intel.com>
References: <1342762570-29343-1-git-send-email-raj.khem@gmail.com>
	<500906A1.8000600@linux.intel.com>
MIME-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: fix external module building
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
X-List-Received-Date: Fri, 20 Jul 2012 10:19:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 20 July 2012 00:20:01 Darren Hart wrote:
> On 07/19/2012 10:36 PM, Khem Raj wrote:
> > From: Denis Carikli <GNUtoo@no-log.org>
> > 
> > Without that fix we have the following while compiling compat-wireless.
> > 
> >   include/linux/mmzone.h:18:30: fatal error: generated/bounds.h: No such
> >   file or directory> 
> > Note that the compat-wireless recipe will be added in another commit.
> > 
> > Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> > 
> >  meta/classes/kernel.bbclass |    3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 08b5e61..ce4d7de 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -187,6 +187,9 @@ kernel_do_install() {
> > 
> >  		cp arch/powerpc/lib/crtsavres.o 
$kerneldir/arch/powerpc/lib/crtsavres.o
> >  	
> >  	fi
> > 
> > +	# Necessary for building modules like compat-wireless.
> > +	cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
> > +
> 
> Hrm... I'm not clear on why this is necessary. I understand why you need
> bounds.h... but I don't see why it isn't there already.
> 
> A few lines up we do:
> 
> cp -fR * $kerneldir
> 
> Which should cover include/generated/bounds.h...
> 
> Perhaps "make -C $kerneldir _mrproper_scripts" clears that out... Ah,
> yes, that seems to be the case. Grumble.
> 
> OK,
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>

Having established why this is needed, could the commit message and/or comment 
clearly state the reason so that there's something to refer to in future?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


