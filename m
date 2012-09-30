Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TIMWQ-000572-3Z
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 18:37:38 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TIMJv-00047Q-TJ; Sun, 30 Sep 2012 18:24:44 +0200
Message-ID: <1349022136.4422.57.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun, 30 Sep 2012 17:22:16 +0100
In-Reply-To: <1348668311.8662.110.camel@ted>
References: <1348577690.31293.70.camel@phil-desktop>
	<1348610357.2853.5.camel@lenny>
	<1348610431.1335.11.camel@x121e.pbcl.net>
	<1348611089.2853.7.camel@lenny> <1348649372.8662.90.camel@ted>
	<1348651706.31293.89.camel@phil-desktop>
	<1348668311.8662.110.camel@ted>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Remove static libraries from -dev packages
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
X-List-Received-Date: Sun, 30 Sep 2012 16:37:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-26 at 15:05 +0100, Richard Purdie wrote:
> Yes, admittedly I probably did test that in a highly parallel
> environment and was focusing on the critical path timings as a result.

Since one of the machines at the office had nothing better to do on a
Sunday I thought I'd rerun a test with and without static libs on a
smaller system than yours.  I used:

disable_static = "--disable-static"
disable_static_pn-sqlite3-native = ""
disable_static_pn-openssl = ""
disable_static_pn-openssl-native = ""
disable_static_pn-qemu-native = ""
EXTRA_OECONF_append = " ${disable_static}"
BB_NUMBER_THREADS = "4"
PARALLEL_MAKE = "-j4"

and I had to hack the openjade recipe to remove "-a" from a couple of
oe_libinstalls, but apart from that I used an unmodified tree with the
default local.conf from oe-init-build-env.

The timings for "bitbake core-minimal-native" with and without static
libraries were:

13988.74user 2043.25system 1:48:41elapsed 245%CPU (0avgtext+0avgdata
1789392maxresident)k
vs
12876.66user 1931.70system 1:42:43elapsed 240%CPU (0avgtext+0avgdata
1800288maxresident)k

which equates to about an 8% saving in user cycles and about 5.5% in
wall time.  So, not vast, but not totally insignificant either.  You
also get about a 5% saving in TMPDIR size (equivalent to ~ 850MB in this
test).

Obviously, there are some packages which don't use autotools (or
deliberately disregard --disable-static) and hence didn't get their
static libraries disabled by this simplistic configuration.
Specifically, I still have:

tmp-eglibc/deploy/ipk/i586/bison-staticdev_2.5.1-r0_i586.ipk
tmp-eglibc/deploy/ipk/i586/e2fsprogs-staticdev_1.42.1-r3_i586.ipk
tmp-eglibc/deploy/ipk/i586/eglibc-staticdev_2.16-r14+svnr20393_i586.ipk
tmp-eglibc/deploy/ipk/i586/elfutils-staticdev_0.148-r9_i586.ipk
tmp-eglibc/deploy/ipk/i586/flex-staticdev_2.5.35-r3_i586.ipk
tmp-eglibc/deploy/ipk/i586/libacl-staticdev_2.2.51-r3_i586.ipk
tmp-eglibc/deploy/ipk/i586/libattr-staticdev_2.4.46-r4_i586.ipk
tmp-eglibc/deploy/ipk/i586/libcap-staticdev_2.22-r5_i586.ipk
tmp-eglibc/deploy/ipk/i586/libstdc++-staticdev_4.7.2-r13_i586.ipk
tmp-eglibc/deploy/ipk/i586/libwrap-staticdev_7.6-r9_i586.ipk
tmp-eglibc/deploy/ipk/i586/libz-staticdev_1.2.7-r0_i586.ipk
tmp-eglibc/deploy/ipk/i586/lighttpd-module-staticfile_1.4.31-r0_i586.ipk
tmp-eglibc/deploy/ipk/i586/ncurses-staticdev_5.9-r10.1_i586.ipk
tmp-eglibc/deploy/ipk/i586/ocf-linux-staticdev_20100325-r3.0_i586.ipk
tmp-eglibc/deploy/ipk/i586/openssl-staticdev_1.0.0j-r15.3_i586.ipk
tmp-eglibc/deploy/ipk/i586/psmisc-staticdev_22.19-r0_i586.ipk
tmp-eglibc/deploy/ipk/i586/python-distutils-staticdev_2.7.3-r0.2_i586.ipk

p.




