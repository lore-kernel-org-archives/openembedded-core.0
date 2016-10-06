Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF7560766
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 13:49:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 06 Oct 2016 06:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,454,1473145200"; d="scan'208";a="769558969"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Oct 2016 06:49:05 -0700
Message-ID: <1475761616.13655.59.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>, Andreas Oberritter <obi@opendreambox.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 06 Oct 2016 16:46:56 +0300
In-Reply-To: <1475748742.16008.29.camel@pbcl.net>
References: <1475676667-24280-1-git-send-email-markus.lehtonen@linux.intel.com>
	<b32b7b2f-68cc-31d6-d687-2eeb12aa196a@opendreambox.org>
	<1475743775.13655.55.camel@linux.intel.com>
	<1475748742.16008.29.camel@pbcl.net>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: [PATCH] update-rc.d.bbclass: check that init script exists before running it
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
X-List-Received-Date: Thu, 06 Oct 2016 13:49:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-10-06 at 11:12 +0100, Phil Blundell wrote:
> On Thu, 2016-10-06 at 11:49 +0300, Markus Lehtonen wrote:
> > On Wed, 2016-10-05 at 16:51 +0200, Andreas Oberritter wrote:
> > > Hello Markus,
> > > 
> > > On 05.10.2016 16:11, Markus Lehtonen wrote:
> > > > Check that the init script that is going to be called in the
> > > > prerm()
> > > > script really exists. There might be a packaging bug or the
> > > > script
> > > > might've been removed already earlier in prerm().
> > > 
> > > isn't it called prerm in the first place because it's not supposed
> > > to
> > > remove any packaged files?
> > 
> > In the case of this bug it does not remove any packaged files. Update
> > -alternatives removes a symlink (created by itself)
> 
> That arguably is a bug in u-a, which probably ought to be removing the
> symlink in postrm not prerm.  

It was moved to prerm earlier to fix some other problems:
http://git.openembedded.org/openembedded-core/commit/meta/classes/update-al
ternatives.bbclass?id=2a5484a90513b58c829a916bfe5268a0fde3512a

So I think moving it back and forth between prerm and postrm doesn't get us
anywhere :)


Thanks,
  Markus



> If it removes the symlink too early and
> prevents u-rc.d from running "stop" on it then you may end up with
> dangling daemon processes still running after the package has been
> uninstalled.  But...
> 
> > I think that the pre post etc scripts should basically never fail.
> 
> ... this is essentially true, and having u-rc.d's own prerm fail
> because of a bug in u-a definitely isn't going to improve the
> situation.  So I think your patch is a good one.
> 
> p.
> 
> > 


