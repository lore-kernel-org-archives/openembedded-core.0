Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id E9E0660777
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 10:12:23 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:f44a:248b:5b4:d695] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1bs5f5-0003bq-4E; Thu, 06 Oct 2016 12:12:23 +0200
Message-ID: <1475748742.16008.29.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>, Andreas Oberritter
	<obi@opendreambox.org>, openembedded-core@lists.openembedded.org
Date: Thu, 06 Oct 2016 11:12:22 +0100
In-Reply-To: <1475743775.13655.55.camel@linux.intel.com>
References: <1475676667-24280-1-git-send-email-markus.lehtonen@linux.intel.com>
	<b32b7b2f-68cc-31d6-d687-2eeb12aa196a@opendreambox.org>
	<1475743775.13655.55.camel@linux.intel.com>
X-Mailer: Evolution 3.18.3-1 
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
X-List-Received-Date: Thu, 06 Oct 2016 10:12:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-10-06 at 11:49 +0300, Markus Lehtonen wrote:
> On Wed, 2016-10-05 at 16:51 +0200, Andreas Oberritter wrote:
> > Hello Markus,
> > 
> > On 05.10.2016 16:11, Markus Lehtonen wrote:
> > > Check that the init script that is going to be called in the
> > > prerm()
> > > script really exists. There might be a packaging bug or the
> > > script
> > > might've been removed already earlier in prerm().
> > 
> > isn't it called prerm in the first place because it's not supposed
> > to
> > remove any packaged files?
> 
> In the case of this bug it does not remove any packaged files. Update
> -alternatives removes a symlink (created by itself)

That arguably is a bug in u-a, which probably ought to be removing the
symlink in postrm not prerm.  If it removes the symlink too early and
prevents u-rc.d from running "stop" on it then you may end up with
dangling daemon processes still running after the package has been
uninstalled.  But...

> I think that the pre post etc scripts should basically never fail.

... this is essentially true, and having u-rc.d's own prerm fail
because of a bug in u-a definitely isn't going to improve the
situation.  So I think your patch is a good one.

p.

> 

