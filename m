Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPFHY-00062H-KK for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 16:41:56 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QPFEZ-0004fw-99
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 16:38:51 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306333690.2491.82.camel@elmorro>
References: <4DDBDE9D.5000709@linux.intel.com>
	<20110524172330.GC18086@sakrah.homelinux.org>
	<6D7346D0-2F4B-44EC-A04B-2F443B33E544@dominion.thruhere.net>
	<1306260430.2491.2.camel@elmorro>  <1306333690.2491.82.camel@elmorro>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 25 May 2011 15:38:50 +0100
Message-ID: <1306334330.2525.236.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: adding meta-intel layers breaks parsing, was Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Wed, 25 May 2011 14:41:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-25 at 09:28 -0500, Tom Zanussi wrote:
> I just finished building all of the above successfully using the latest
> (as of yesterday) poky/master and meta-intel/master.
> 
> Not sure why you're seeing parsing errors, none here...

The way meta-intel is using FILESEXTRAPATHS does look a bit dubious to
me.  Your kernel .bbappend files seem to be doing:

FILESEXTRAPATHS := "${FILESEXTRAPATHS}:${THISDIR}/${PN}"

which seems wrong for two reasons: firstly it will lose if
FILESEXTRAPATHS wasn't previously set (in which case you'll get a
circular reference within the value, since bitbake won't expand that
part of the rvalue during the assignment); and secondly, as far as I can
tell from looking at utils.bbclass, FILESEXTRAPATHS isn't actually
supposed to be colon separated in the first place.

(Also, as a tangential matter, this FILESEXTRAPATHS setting isn't going
to be producing any useful effect since none of the meta-intel layers
actually have any files in their recipes-kernel/linux directory.)

p.




