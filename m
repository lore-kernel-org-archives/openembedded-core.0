Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBWo8-0005Xf-2X
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 22:11:40 +0200
Received: by pbcwy7 with SMTP id wy7so1192350pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=qbiBP2p1ZFDIhJCRzPEEe7XRFMYbFXX8TJnbD03PlG8=;
	b=w2vyid06JgYBkouhyItZzyqnRjvXtFhmW+r6lrdVuXFTdh0FS5Hx15ZZQ/PtS2f3RB
	AnUg+1rbe9oWDsVdGdMyY7YnhOdusmdBs6uJ1yOOCOj7NHkWQPhChxxIT7V87WSK6c2m
	wkIFyPjO3kathZl3kNMrqLU0boIQ2Lhq0a70O0NTDFneauVOBJjgHRitumxd5lGNOTPJ
	9dk9dkwW/nCVN4DH+r8yIZon7Zbw8ZGydwrkOpBkgS6PLA6g/dvo7l458SRfkTdGe8O0
	MFWKlgvd/+OoH8mliL+M8zrA9Y0053dV/qLfg/Q/pCp6KEJlzhMJzJRbZuSCJ99pQmbn
	7BbA==
Received: by 10.66.79.38 with SMTP id g6mr28047288pax.40.1347393547940;
	Tue, 11 Sep 2012 12:59:07 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id uu6sm10222104pbc.70.2012.09.11.12.59.05
	(version=SSLv3 cipher=OTHER); Tue, 11 Sep 2012 12:59:06 -0700 (PDT)
Date: Tue, 11 Sep 2012 12:58:59 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120911195857.GA9240@sakrah.homelinux.org>
Mail-Followup-To: Phil Blundell <philb@gnu.org>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
References: <20120911130155.GC14077@jama.jama.net>
	<20120911134814.GF14077@jama.jama.net>
	<504F5E0C.7040502@windriver.com>
	<A6372E3C-A8A4-4987-9C2B-D65FFBBCEF5C@dominion.thruhere.net>
	<CAMKF1spX7cpvrb=zLOxi+qFaYhW2fpccOdFQ1-=-LVgv1gETKg@mail.gmail.com>
	<1347389582.29443.52.camel@x121e.pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1347389582.29443.52.camel@x121e.pbcl.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: ARM-tuning -- was qemuarm: should it really have TUNE_ARCH armv5te?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 20:11:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/09/12 19:53), Phil Blundell wrote:
> On Tue, 2012-09-11 at 11:40 -0700, Khem Raj wrote:
> > On Tue, Sep 11, 2012 at 9:13 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > > From a gcc point of view both are the same ISA, but using xscale will take in account the absurdly long pipeline on that SoC.
> > 
> > Not really, when you tune for XScale it will use ldrd/strd and pld if possible
> 
> Are you sure?  As far as I remember, the only effects of -mtune=xscale
> are to alter some minor pipeline-related tradeoffs in code generation.
> In particular, LDM is especially slow on xscale so it is usually best
> avoided unless loading very large numbers of registers.

yes that seems to be right looking at trunk and it does not prefer LDRD/STRD/PLD too.
so all my claims are not valid anymore.

const struct tune_params arm_xscale_tune =
{
  arm_xscale_rtx_costs,
  xscale_sched_adjust_cost,
  2,                                            /* Constant limit.  */
  3,                                            /* Max cond insns.  */
  ARM_PREFETCH_NOT_BENEFICIAL,
  true,                                         /* Prefer constant pool.  */
  arm_default_branch_cost,
  false                                         /* Prefer LDRD/STRD.  */
};



> 
> I can't think of any reason why pld would be any more beneficial on
> xscale than generic v5TE, and I don't think gcc does anything special
> with it in that regard.
> 
> p.
> 
> 

-- 
-Khem


