Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SApsq-0008Hj-HC
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 22:49:24 +0100
Received: by obqv19 with SMTP id v19so1938182obq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 14:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=hRC/7WHJnlHtSE+M16kbXLBom6FMpNkxzVobOtp46f8=;
	b=SVN00VWQbsS8ZlKK1d9VUOPxEiMAvo6T0VKBIB7rJBANMcwEpHCxGwWoPL0ETm14Cb
	FP4clNT3wd4zUPL5+L9UiW4rpMSDtubfmvhAHccioOW2RGmlH5oVZGq1ts05MZ56fmjQ
	7pT6iURgIGMtF3hZ98WNkIDW5Pr8bgy1RFLgMI4/Xu7m1iAKl6SiHHUMIYZtlRGAGilH
	NO6BYaQRaSMgvS6k5USLPDCg2b0LvSctEhuTBZ69RE4z5Ig9Z3Sa7Vhx7rUsQQPIqoxG
	GJ9AGvA8dmWt8RID2zQIGM9AXNNeHvMCl5nBF8b2EFIEtJtJDjoiFv5VJ3kP2zO9O2WK
	Dw2Q==
Received: by 10.182.1.2 with SMTP id 2mr11737931obi.58.1332452428615;
	Thu, 22 Mar 2012 14:40:28 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id o9sm5091877obd.21.2012.03.22.14.40.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 14:40:27 -0700 (PDT)
Date: Thu, 22 Mar 2012 14:40:28 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120322214028.GD28378@bill-the-cat>
References: <CA+M6bXkMdv_bg9bDOYCS=Ng0sSB+2Yu6xRN4V0tKDV9RCJMy+A@mail.gmail.com>
	<04FC93EF-7089-4EAD-8C1D-14824C8CBB02@dominion.thruhere.net>
	<20120312202524.GB9300@denix.org>
MIME-Version: 1.0
In-Reply-To: <20120312202524.GB9300@denix.org>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Consistency and use cases for IMAGE_FSTYPES
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
X-List-Received-Date: Thu, 22 Mar 2012 21:49:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 12, 2012 at 04:25:24PM -0400, Denys Dmytriyenko wrote:
> On Sat, Mar 10, 2012 at 07:29:20AM +0100, Koen Kooi wrote:
> > 
> > Op 9 mrt. 2012, om 22:39 heeft Tom Rini het volgende geschreven:
> > 
> > > Hey all,
> > > 
> > > Over in meta-ti I kicked off a discussion
> > > (https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000779.html)
> > > about if we should be using '?=' or '+=' with IMAGE_FSTYPES in the
> > > machine conf files.  This has been discussed a little bit before
> > > (http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/2060/focus=2061).
> > > The problem is we have the following and I believe ultimately
> > > conflicting use cases:
> > > - The machine needs to say 'I need or support the following formats'
> > > - The distro needs to say 'I always want format X'
> > > - The user needs to say 'I know best, give me only format X'
> > > - The user needs to say 'I know best, give me what you support + X'
> > > 
> > > We achieve this today, but not very nicely.  For the last one you need
> > > to start playing order of operations games and that's just not nice.
> > > My suggestion is that we need to change what the machine.conf sets to
> > > another variable (SOMETHING_IMAGE_FSTYPES), and a default
> > > IMAGE_FSTYPES becomes ?= ${SOMETHING_IMAGE_FSTYPES}.  Distros, and
> > > users can then work more easily with their use cases.  Comments?
> > 
> > EXTRA_IMAGE_FSTYPES!
> 
> +1
> 
> MACHINE_IMAGE_FSTYPES + DISTRO_IMAGE_FSTYPES? jk :)

Having gotten no other feedback (*cough*) I'll post a patch for
SOMETHING_IMAGE_FSTYPES (I'm leaning MACHINE_IMAGE_FSTYPES, sorry Koen :))
sometime tomorrow I think.

-- 
Tom


