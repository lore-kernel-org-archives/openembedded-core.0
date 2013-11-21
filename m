Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id A1752612D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 14:26:14 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VjVCU-0001vQ-IR; Thu, 21 Nov 2013 15:26:13 +0100
Message-ID: <1385043945.23724.158.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 21 Nov 2013 14:25:45 +0000
In-Reply-To: <1385019198-24458-2-git-send-email-mark.hatle@windriver.com>
References: <1385019198-24458-1-git-send-email-mark.hatle@windriver.com>
	<1385019198-24458-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: Evolution 3.4.4-4+b1 
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
	Content preview:  On Thu, 2013-11-21 at 01:33 -0600,
	Mark Hatle wrote: > +def
	get_optimization(d): > + selected_optimization =
	d.getVar("SELECTED_OPTIMIZATION", 
	True) > + if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "",
	d) == "x": > + bb.note("eglibc can't be built with -O0,
	-O2 will be used instead.") [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][dora][PATCH 1/2] perf: disallow debug optimization.
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
X-List-Received-Date: Thu, 21 Nov 2013 14:26:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-11-21 at 01:33 -0600, Mark Hatle wrote:
> +def get_optimization(d):
> +    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
> +    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
> +        bb.note("eglibc can't be built with -O0, -O2 will be used instead.")

Although the text of that warning is correct, users might find the
reference to eglibc slightly confusing if it's perf that they're trying
to build.

Also, as I mentioned in a different thread not all that long ago when
someone submitted a similar patch for gcc-runtime, the proliferation of
parse-time python functions to bash SELECTED_OPTIMIZATION around doesn't
seem like all that good a thing: this will cause extra overhead for
everyone, even those who are not using -O0 and have no interest in perf.

And, finally, it remains slightly unclear to me that this is really a
problem that the metadata needs to be solving.  I haven't seen any
particularly convincing explanation of why this can't or shouldn't just
be fixed in the distro configuration.

p.



