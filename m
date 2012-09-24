Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGAw9-0006Mt-Qy
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 17:51:09 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TGAjn-0004X2-Oe
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 17:38:24 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 16:38:22 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348501103.31293.51.camel@phil-desktop>
Mime-Version: 1.0
Subject: work-shared not being correctly shared
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
X-List-Received-Date: Mon, 24 Sep 2012 15:51:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since updating to the latest versions of bitbake and oe-core I'm
experiencing some sort of conflict to do with the gcc sources in
tmp/work-shared.

What seems to be happening is that all the different recipes which share
that source directory are using different stamp values for do_unpack.
So, for example, I can do:

$ bitbake -f -c unpack gcc-cross
[ source unpacks ]
$ ls -l tmp-eglibc/stamps/work-shared/gcc-4.7.2-r13.do_unpack*
-rw-rw-r-- 1 pb pb 0 2012-09-24 15:37
tmp-eglibc/stamps/work-shared/gcc-4.7.2-r13.do_unpack.ea6dd89ddae3dcc205848b41ce0251cd
$ bitbake -f -c unpack gcc-cross
[ nothing happens ]
$ bitbake -f -c unpack gcc-cross
[ still nothing happens ]
$ bitbake -f -c unpack gcc-runtime
[ source unpacks again ]
$ ls -l tmp-eglibc/stamps/work-shared/gcc-4.7.2-r13.do_unpack*
-rw-rw-r-- 1 pb pb 0 2012-09-24 15:42
tmp-eglibc/stamps/work-shared/gcc-4.7.2-r13.do_unpack.e677db6d46e8c0c6109b02302aa477d0
$ bitbake -f -c unpack gcc-runtime
[ nothing happens ]

Worse, if I set BB_NUMBER_THREADS to some high number, I seem to end up
with multiple competing tasks all trying to unpack in parallel and the
build never makes any real forward progress.

Does anybody have any insight into what is going wrong here and how I
should debug it?

thanks

p.




