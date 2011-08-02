Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QoGpK-0004wC-MQ
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 17:24:14 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QoGl9-0002UN-Jq
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 17:19:55 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 02 Aug 2011 16:19:54 +0100
In-Reply-To: <1312272881-15695-1-git-send-email-galak@kernel.crashing.org>
References: <1312272881-15695-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312298395.4325.53.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] automake: Fix issue with tar configure failing with large UID/GIDs
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
X-List-Received-Date: Tue, 02 Aug 2011 15:24:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-02 at 03:14 -0500, Kumar Gala wrote:
> +-_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'
> ++_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) cpio pax none'

Have you discussed that with upstream?  If not, are you confident that
preferring cpio will not simply mean that we are swapping one deficiency
for another?

> +Index: automake-1.11.1/Makefile.in
> +===================================================================
> +--- automake-1.11.1.orig/Makefile.in
> ++++ automake-1.11.1/Makefile.in
> +@@ -44,7 +44,7 @@ am__aclocal_m4_deps = $(top_srcdir)/m4/a
> + 	$(top_srcdir)/m4/missing.m4 $(top_srcdir)/m4/mkdirp.m4 \
> + 	$(top_srcdir)/m4/options.m4 $(top_srcdir)/m4/runlog.m4 \
> + 	$(top_srcdir)/m4/sanity.m4 $(top_srcdir)/m4/strip.m4 \
> +-	$(top_srcdir)/m4/substnot.m4 $(top_srcdir)/m4/tar.m4 \
> ++	$(top_srcdir)/m4/substnot.m4 \
> + 	$(top_srcdir)/configure.ac
> + am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
> + 	$(ACLOCAL_M4)

Can you explain why this hunk is necessary?

> +do_configure () {
> +	touch ${S}/Makefile.in
> +	autotools_do_configure
> +}

... and this one?

Also, your patch is missing a Signed-off-by line.  See:

http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines#Patch_Headers_and_Commit_Messages

p.



