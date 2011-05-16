Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QM0oZ-0002rV-J1 for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 18:38:39 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QM0Me-00045x-5v
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 18:09:48 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Organization: Phil Blundell Consulting Ltd
Date: Mon, 16 May 2011 17:35:48 +0100
Message-ID: <1305563748.2429.76.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: uclibc?
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
X-List-Received-Date: Mon, 16 May 2011 16:38:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've just been trying to build a uclibc-based system from the current
head of oe-core but this doesn't seem to be something that works
entirely smoothly at the moment.  Does anybody have a patchset to fix
the uclibc recipes, or is anybody working on such a thing?

Issues I've encountered thus far are:

- fatal errors from insane.bbclass due to missing LIC_FILES_CHKSUM in
uclibc recipes

- a bunch of slightly-bogus-looking bits in tclibc-uclibc.inc causing
"-uclibc" to get appended to ${STAGING_DIR_HOST} (seemingly twice!),
which was apparently breaking perl-native in some slightly obscure
fashion.

- uclibc-initial looks for gcc-initial in the wrong place.  I copied the
${STAGINGCC} bits from eglibc-initial to fix this.

- uclibc-initial installs itself into the wrong place.  I copied the
setting of do_populate_sysroot[sstate-outputdirs] from eglibc to fix
this.

- uclibc compile now fails at:

| /home/pb/oe/build-meta-uclibc/tmp/sysroots/x86_64-linux/libexec/i586-linux-uclibc.gcc-cross-intermediate/gcc/i586-linux-uclibc/4.5.1/ld: cannot find -lgcc_s
| collect2: ld returned 1 exit status

p.




