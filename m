Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id DB2866D586
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 18:28:04 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1ViTYM-0005Jb-2n; Mon, 18 Nov 2013 19:28:06 +0100
Message-ID: <1384799284.23724.60.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Mon, 18 Nov 2013 18:28:04 +0000
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FD505D5@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FD50595@post.tritech.se>
	,<1384780059.23724.26.camel@phil-desktop.brightsign>
	<ED3E0BCACD909541BA94A34C4A164D4C4FD505BB@post.tritech.se>
	,<1384780550.23724.29.camel@phil-desktop.brightsign>
	<ED3E0BCACD909541BA94A34C4A164D4C4FD505D5@post.tritech.se>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software, running on the system "hetzner.pbcl.net", has
 identified this incoming email as possible spam.  The original message
 has been attached to this so you can view it (if it isn't spam) or label
 similar future email.  If you have any questions, see
 @@CONTACT_ADDRESS@@ for details.
 
 Content preview:  On Mon, 2013-11-18 at 13:28 +0000, Mats Kärrman wrote: >
   On Monday, November 18, 2013 2:15 PM, Phil Blundell wrote: > >> Subject: Re:
    [OE-core] RPROVIDES not package specific with native and added package >
   >> > >> Oh, right, I see. Does it help if you use "PACKAGES =+ .." rather
   than > >> "PACKAGES_prepend = "? > > Yes it does!! > > Could you tell me why?
    > Er... better could you tell me where's the best place to read so I don't
    have to make these mistakes again? [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RPROVIDES not package specific with native and added package
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
X-List-Received-Date: Mon, 18 Nov 2013 18:28:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2013-11-18 at 13:28 +0000, Mats Kärrman wrote:
> On Monday, November 18, 2013 2:15 PM, Phil Blundell wrote:
> >> Subject: Re: [OE-core] RPROVIDES not package specific with native and added package
> >> 
> >> Oh, right, I see.  Does it help if you use "PACKAGES =+ .." rather than
> >> "PACKAGES_prepend = "?
> 
> Yes it does!!
> 
> Could you tell me why?
> Er... better could you tell me where's the best place to read so I don't have to make these mistakes again?

The code in insane.bbclass will give you a diagnostic if ${RPROVIDES} is
set and PACKAGES isn't blank.  (The actual check that it uses for
PACKAGES is slightly obscure and involves split(), but the net effect
seems to be that it's testing for the variable being set to something
other than "".)

native.bbclass sets PACKAGES="" and RPROVIDES="${PN}".  This violates
insane.bbclass's usual idea of what RPROVIDES should be, but since
PACKAGES is blank the check is inhibited and you don't get an error.

However, your recipe is defeating this by prepending to PACKAGES and
causing it to end up not blank.  This turns the insane.bbclass check
back on and the error reappears.

p.



