Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TSql0-0005z5-1k
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 15:56:02 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TSqXu-0000mn-18
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 15:42:30 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2012 14:42:28 +0000
X-Mailer: Evolution 3.0.2- 
Message-ID: <1351521750.13864.12.camel@phil-desktop>
Mime-Version: 1.0
Subject: race between aclocal and unstaging of .m4 files
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
X-List-Received-Date: Mon, 29 Oct 2012 14:56:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If do_configure() from one recipe runs in parallel with
sysroot_cleansstate() from another then aclocal may fail because it
doesn't react very well to .m4 files disappearing underneath it.  This
manifests as slightly obscure failures such as:

| aclocal: error: aclocal: file '.../tmp-eglibc/sysroots/x86_64-linux/share/aclocal/alsa.m4' does not exist

where the .m4 file in question is not one that the recipe being built
would actually want to use.  (The alsa.m4 error above actually occurred
during a build of attr.)

There seem to be two obvious ways of fixing this:

a) Add more locking so that these things can't happen in parallel

b) Patch aclocal to make this situation non-fatal

My inclination would be to do (b) since it's less intrusive.  Any
objections or better suggestions?

p.




