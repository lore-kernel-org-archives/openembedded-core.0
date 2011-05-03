Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QHESZ-0006GF-RD
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 14:12:11 +0200
Received: by bwz5 with SMTP id 5so41517bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2011 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:x-pgp-key:user-agent;
	bh=tNg5dr2qKRq9oR9ybBzWO6yCgzwOLaW7WVCOQmjWxmg=;
	b=IsnVUpD/v2LnRtr7h8wL4sOHuW+Qgs/lN8eNb0EyRD3Dy4+6tQl+7PjrCqVNiKR1kN
	tTutWdsEmRZHqlCohEb2tOshCBvSyD4pZ/5PRe5cnoi6j8uGep+yjRfCDAGlPYleQKSj
	LFbzHCZKC7KQYfwJ0UZcBkrpJUd2QV/zEedUE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to:x-pgp-key
	:user-agent;
	b=NR1ZHO5bWN8gKEqN6UTy0RP2hV/ZNTQDctQS/obXdCOc4mBkhVqQher7rAf9Acwl/C
	ToHA59Js9SUvFDCLUFUgqo3DHGybiABi68l7aZRousd2C8s83U3vjdG9vXDlHhZL8vpI
	DP96uG1OudJrysYljJzKanFK1tttSf9WjbV0I=
Received: by 10.204.154.215 with SMTP id p23mr1849590bkw.113.1304424574273;
	Tue, 03 May 2011 05:09:34 -0700 (PDT)
Received: from becca.researchstudio.at ([62.218.44.194])
	by mx.google.com with ESMTPS id q24sm15572bks.9.2011.05.03.05.09.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 May 2011 05:09:33 -0700 (PDT)
Date: Tue, 3 May 2011 14:09:32 +0200
From: Michael Lippautz <michael.lippautz@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110503120931.GA21145@becca.researchstudio.at>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1304073898-12204-1-git-send-email-michael.lippautz@gmail.com>
	<1304419850.21461.102.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1304419850.21461.102.camel@rex>
X-PGP-Key: http://cs.uni-salzburg.at/~mlippautz/pub.asc
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH]] python: Unbreak Python third-party extensions
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
X-List-Received-Date: Tue, 03 May 2011 12:12:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2011 at 11:50:50AM +0100, Richard Purdie wrote:
> On Fri, 2011-04-29 at 12:44 +0200, Michael Lippautz wrote:
> > This fixes compilation/linking of Python 3rd party extensions.
> > 
> > ${STAGING_LIBDIR}/python<pyver>/config/Makefile needs the correct
> > INCDIR and LIBDIR settings to be used in cross compilation for the
> > target. 3rd party module use distutils.sysconfig which uses this
> > Makefile to create compiler/linker flags.
> > 
> > Workflow:
> > 1) compile needs the staged/sysroot Makefile since it is needed
> >    for compilation/linking
> > 2) install needs the unmodified Makefile to install files (i.e.
> >    headers) into the right directores. (otherwise they would be
> >    installed in ${D}/${STAGING_...}
> > 3) staging needs modified Makefile again
> > 4) packaging needs unmodified to make compilation on the target
> >    possible
> > 
> > Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> > ---
> >  meta/recipes-devtools/python/python_2.6.6.bb |   25 +++++++++++++++++++------
> >  1 files changed, 19 insertions(+), 6 deletions(-)
> 
> I'm ok with this patch but I am a little worried looking at the python
> recipe that it won't interact well with sstate. I'd therefore like to
> fix this whilst we have someone who understands this code around.
> 
> The problem is that do_compile_prepend() is poking files directly into
> staging. Instead, do_install should be manipulating things in ${D}
> instead and then PACKAGE_PREPROCESS_FUNCS and SYSROOT_PREPROCESS_FUNCS
> should be taking care of any fixups for the target/sysroot cases.
> 
> Can we add the code in the do_compile_prepend() to the start of the
> do_install() ?
> 

As far as I know (I am no expert though) is that we can't do this. Python
cross-compilation is rather complex, because it basically utilizes the same
approach described above to compile its own Python/C extensions.

When you look at the do_compile section of the recipe you notice that
libpython<pyver> is compiled and staged before the actual Python compilation
takes place. This is needed since Python itself uses distutils.sysconfig to link
iits Python/C extensions against -lpython<pyver>.

[Please correct me if I am wrong, but I have tried a few things with this recipe
by now, and couldn't come up with anything better.]

> Cheers,
> 
> Richard
> 

Regards,
Michael


