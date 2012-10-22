Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TQM4i-0004ni-H1
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 19:46:04 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TQLrk-0000wy-L9; Mon, 22 Oct 2012 19:32:41 +0200
From: Phil Blundell <philb@gnu.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Oct 2012 18:32:39 +0100
In-Reply-To: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1350927160.3259.343.camel@phil-desktop>
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] OpenGL packaging/staging policy
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
X-List-Received-Date: Mon, 22 Oct 2012 17:46:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-22 at 17:35 +0100, Burton, Ross wrote:
> Rule 3. Only Mesa stages, nothing else
> 
> Whilst there are multiple GL implementations that offer various
> subsets of GL, they are all effectively interchangeable.  It's not a
> massive concern what exact GL is present when building because they've
> all got the same API.

This is an attractive idea but I'm not sure that the underlying
assumption is entirely correct.

Different GL libraries will have different vendor extensions and Mesa's
headers won't necessarily know about them.  If the vendor ships the
extension bits in a custom header (rather than jamming them into a
modified glext.h) then this could be worked around by staging the
headers separately, but you're still left with the problem that Mesa's
libGL.so might now be missing symbols that are required during
linking.  

Also, even if the APIs were the same, I am slightly nervous about
relying on all vendor GLs having an identical ABI to Mesa.  I can't
immediately think of any reason why they shouldn't but, equally, vendors
have been known to do peculiar things in the past and I wouldn't be
totally shocked to find that there is some binary libGL out there which
manages to be ABI-incompatible with Mesa in some or other creative
fashion.

p.




