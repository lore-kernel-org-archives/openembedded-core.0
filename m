Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 536E660E82
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 15:18:12 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VXBob-0003KP-F1; Fri, 18 Oct 2013 17:18:13 +0200
Message-ID: <1382109492.529.12.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 18 Oct 2013 16:18:12 +0100
In-Reply-To: <52614FD4.1030006@windriver.com>
References: <1382094700-17805-1-git-send-email-ming.liu@windriver.com>
	<1382094700-17805-3-git-send-email-ming.liu@windriver.com>
	<1382108376.529.6.camel@phil-desktop.brightsign>
	<52614FD4.1030006@windriver.com>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 3/3] bash: add pkg_postrm to remove the entry in /etc/shells
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
X-List-Received-Date: Fri, 18 Oct 2013 15:18:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-10-18 at 10:12 -0500, Mark Hatle wrote:
> On 10/18/13 9:59 AM, Phil Blundell wrote:
> > On Fri, 2013-10-18 at 19:11 +0800, Ming Liu wrote:
> >>   pkg_postinst_${PN} () {
> >> -	touch $D${sysconfdir}/shells
> >> -	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
> >> -	grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
> >> +	if [ ! -f $D${sysconfdir}/shells ]; then
> 
> One note with the above check.  Whichever package is responsible for providing 
> the 'shells' file needs to be installed -first-.  So anything that manipulates 
> the 'shells' file will need an RDEPENDS on that package.

Isn't the whole point of the check above that it now creates /etc/shells
if it didn't exist already?

That said, though, I'm still not entirely convinced that having
semi-random packages create a file that isn't mentioned in either FILES
or CONFFILES is a very good thing.  I'm also not totally clear on what
exactly the problem is that this set of patches is trying to solve: the
original commit message says that having nonexistent files named
in /etc/shells is "unreasonable" but doesn't provide any supporting
evidence for that assertion.

p.



