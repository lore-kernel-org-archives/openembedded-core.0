Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qb8zL-0005Iu-7f for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 12:24:19 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1Qb8vp-0008JF-HV
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 12:20:41 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <8815E10D-6790-48AD-811D-5BE977A17380@dominion.thruhere.net>
References: <CFB391EB-D84F-4616-887D-DAFAB036EA42@dominion.thruhere.net>
	<4E0699D1.9090308@gmail.com> <4E074ABB.80405@gmail.com>
	<48356C52-61A1-42BE-92AA-704FB136D8A3@dominion.thruhere.net>
	<1309167774.21613.264.camel@phil-desktop>
	<8815E10D-6790-48AD-811D-5BE977A17380@dominion.thruhere.net>
Organization: Phil Blundell Consulting Ltd
Date: Mon, 27 Jun 2011 11:20:35 +0100
Message-ID: <1309170035.21613.289.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: gcc-cross-kernel problems
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
X-List-Received-Date: Mon, 27 Jun 2011 10:24:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-27 at 12:07 +0200, Koen Kooi wrote:
> In the first one only cc1 and collect are present. What would be the best way to fix this?

It seems that gcc-package-cross.inc is doing this by steam for the
regular cross compiler.  See this code from do_install():

	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
	# found. These need to be relative paths so they work in different locations.
	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
	install -d $dest
	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
	done

So I guess you could copy that into gcc-cross-kernel or arrange for the
two recipes to share more stuff.  Really, the only difference between
gcc-cross-kernel and regular gcc-cross should be that the former doesn't
install itself as ${TARGET_SYS}-gcc in the sysroot bindir.

p.




