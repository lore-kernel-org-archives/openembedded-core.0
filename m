Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SAJaG-00010D-3N
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 12:20:04 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SAJRg-0002ay-Mo
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 12:11:12 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 11:11:11 +0000
In-Reply-To: <alpine.DEB.2.02.1203210625530.16813@oneiric>
References: <alpine.DEB.2.02.1203210615100.21394@oneiric>
	<alpine.DEB.2.02.1203210625530.16813@oneiric>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1332328272.14363.983.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: what is meaning of "SRC_URI_append_whatever +=" ??
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
X-List-Received-Date: Wed, 21 Mar 2012 11:20:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-21 at 06:28 -0400, Robert P. J. Day wrote:
>   of course, if all of the above is perfectly valid, i'm going to be
> embarrassed.

All the constructs you mentioned are syntactically valid, though it
isn't clear that all of them are very useful.

There is a subtle difference between SRC_URI_append = "..." and
SRC_URI_append += "..." in that the latter will insert a space whereas
the former will not.  But I don't think there is any situation where
this distinction serves any useful purpose.  As far as I know, with
current bitbake at least,

SRC_URI = "a"
SRC_URI_append = "b"
SRC_URI_append += "c"

and

SRC_URI = "a"
SRC_URI_append = "b"
SRC_URI_append = " c"

will both produce exactly the same effect, viz. SRC_URI = "ab c".  I
think it might have been the case with some older bitbakes that the
middle line would have no effect in this situation but that doesn't
appear to be true now.

>  SRC_URI_append = "..."                (why not just SRC_URI +=?)

There are two differences in behaviour between these two.  First,
trivially, _append doesn't add a space (i.e. it's closer to ".=" than
"+=").  Secondly, and more significantly, the effect of _append is
delayed whereas the effect of +=/.= is immediate.  So, given:

SRC_URI_append = "b"
SRC_URI = "a"

you will get the result SRC_URI = "ab".  Whereas if you had written:

SRC_URI += "b"
SRC_URI = "a"

you would get SRC_URI = "a".  There are places in the metadata that rely
on these semantics, though in many ways this is unwholesome behaviour
and it would be nice to eliminate the places where it is used.

p.




