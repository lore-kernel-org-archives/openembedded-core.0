Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 040E2601DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 11:19:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.87,865,1363132800"; d="scan'208";a="18493933"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 14 Jun 2013 12:19:22 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1UnS2M-0004ZZ-Sp; Fri, 14 Jun 2013 12:19:22 +0100
Date: Fri, 14 Jun 2013 12:19:22 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130614111922.GA16884@mcrowe.com>
References: <20130613111601.GA27137@mcrowe.com> <1371158507.20823.64.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1371158507.20823.64.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: populate-sysroot files in sstate cache overwritten by "empty" ones
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
X-List-Received-Date: Fri, 14 Jun 2013 11:19:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 13, 2013 at 10:21:47PM +0100, Richard Purdie wrote:
> On Thu, 2013-06-13 at 12:16 +0100, Mike Crowe wrote:
> > The problem seems to be caused by having an ancillary task in recipe1 that
> > depends on do_configure and the same ancillary task in recipe2 that depends
> > on recipe1:populate-sysroot. The result is that recipe1:do_configure runs
> > followed by recipe1:do_populate_sysroot without the intervening important
> > tasks such as do_install.
> 
> Hmm, interesting.
> 
> There is some code in staging.bbclass:
> 
> BB_SETSCENE_VERIFY_FUNCTION = "sysroot_checkhashes"
> 
> where sysroot_checkhashes() is meant to notice that do_configure reruns
> and hence forces do_populate_sysroot to rerun. It appears to do this
> successfully, however its missing out the dependencies of
> do_populate_sysroot (compile, install) which is why the package ends up
> broken.
> 
> I think this is a collision of two sets of data, there are some tasks
> being skipped which shouldn't be. So I'd guess that the values from
> BB_SETSCENE_VERIFY_FUNCTION aren't being processed with respect to
> removing things from the setscene covered list.

Thanks for analysing this.

What is the correct thing to happen in this situation?

Should do_configure be run but not do_populate_sysroot?

Or, should the fact that do_configure needs to be run stop the sstate
solution from being considered valid altogether and force recipe1 to be
compiled, installed and populate_sysroot'ed in the traditional manner?

Thanks.

Mike.

