Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id BA08A62252
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 12:31:39 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WUxqs-0004S7-Tw; Tue, 01 Apr 2014 14:31:39 +0200
Message-ID: <1396355498.5879.31.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 01 Apr 2014 13:31:38 +0100
In-Reply-To: <CANyK_8cr88xbYcQTjf4hppA+nh-+3LNkwpPm7ynF+USLKo64ng@mail.gmail.com>
References: <cover.1395816581.git.liezhi.yang@windriver.com>
	<7bb935ada71d07f3496a2ff8d2d73fe003e09a4f.1395816581.git.liezhi.yang@windriver.com>
	<CANyK_8dNLRkz68AzGTQhOCx_rX=rzJhAjiRfKbyzHjkA28=UQA@mail.gmail.com>
	<533A17B0.5080108@windriver.com>
	<CANyK_8cr88xbYcQTjf4hppA+nh-+3LNkwpPm7ynF+USLKo64ng@mail.gmail.com>
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Tue, 2014-04-01 at 12:41 +0100,
	Paul Barker wrote: > The
	more I look at it the more I don't like this patch. It's probably > a
	very
	rarely used code path but it could blow up if it's called. C > provides
	no
	guarantees that calling a 3-argument function with only 2 > arguments
	will
	work. Depending on calling convention it could easily > result in stack
	corruption
	on some platforms. > > I'd suggest we try reverting the relevant bits
	of the upstream change > from qsort to > qsort_r:
	http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=c69bbca9c1f6645097bd20fe3a21f5a99a2a0698
	> > I think it should just be the first 3 patch hunks in that commit.
	[...] Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] util-linux-native: fix qsort_r for CentOS 5.10
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
X-List-Received-Date: Tue, 01 Apr 2014 12:31:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-01 at 12:41 +0100, Paul Barker wrote:
> The more I look at it the more I don't like this patch. It's probably
> a very rarely used code path but it could blow up if it's called. C
> provides no guarantees that calling a 3-argument function with only 2
> arguments will work. Depending on calling convention it could easily
> result in stack corruption on some platforms.
> 
> I'd suggest we try reverting the relevant bits of the upstream change
> from qsort to
> qsort_r: http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=c69bbca9c1f6645097bd20fe3a21f5a99a2a0698
> 
> I think it should just be the first 3 patch hunks in that commit.

It seems vanishingly unlikely that anybody is seriously going to try to
use fdisk from util-linux-native to manipulate Sun partition tables and,
that being the case, it's presumably going to be quite hard to test any
such change.  Maybe we should just turn off support for these fringe
partition table types altogether.

p.



