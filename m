Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1ShK7i-0004it-It
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 14:35:02 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1ShJxL-0006zE-Su
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 14:24:20 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jun 2012 13:24:13 +0100
In-Reply-To: <alpine.DEB.2.02.1206200807090.4904@oneiric>
References: <alpine.DEB.2.02.1206200807090.4904@oneiric>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1340195059.14857.198.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: oddities related to "_append" and "_prepend" in oe-core
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
X-List-Received-Date: Wed, 20 Jun 2012 12:35:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-06-20 at 08:14 -0400, Robert P. J. Day wrote:
> inspired by richard purdie's correction of my original patch, i did
> a quick grep to see if i could find any oddities related, first, to
> uses of "_append"; specifically, where the string being appended did
> *not* start with a blank.  there are certainly proper examples of
> that, say when one is appending to a path, or appending to a filename,
> and so on where a blank would be *wrong*.
> 
>   but there also appear to be "errors", so here's the grep command and
> its output:
> 
> $ grep -r "_append = \"[^ ]" *
> meta/conf/bitbake.conf:DISTRO_FEATURES_append = "${@oe.utils.distro_features_backfill(d)}"

That one is probably ok.

> meta/recipes-devtools/gdb/gdb-cross-canadian.inc:EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"

That one is actually ok, since the old value of EXTRA_OECONF ends with
whitespace.  But it does look confusing, and there is no obvious reason
it couldn't be += instead.

> meta/recipes-devtools/prelink/prelink_git.bb:OVERRIDES_append = ":${TARGET_OS_ORIG}"

That is ok.  OVERRIDES is not space separated.

> meta/recipes-devtools/gcc/gcc-cross-intermediate.inc:CROSS_TARGET_SYS_DIR_append = ".${PN}"
> meta/recipes-devtools/gcc/gcc-cross-initial.inc:CROSS_TARGET_SYS_DIR_append = ".${PN}"

Those are ok.  They could perhaps be ".=" which might be more readable.

> meta/recipes-core/uclibc/uclibc.inc:FILES_${PN}-dev_append = "\

That is ok since the appended string does start with whitespace (on the
next line).

> meta/recipes-core/base-files/base-files_3.0.14.bb:docdir_append = "/${P}"

That is ok since it is a path.  It could probably be .= instead.

> meta/recipes-core/eglibc/eglibc_2.15.bb:PR_append = "+svnr${SRCPV}"
> meta/recipes-core/eglibc/eglibc_2.13.bb:PR_append = "+svnr${SRCPV}"

Those are ok but, again, could probably be .=.

> meta/classes/autotools.bbclass:# EXTRA_OECONF_append = "${@autotools_set_crosscompiling(d)}"

That one is a comment and can probably be deleted.

> meta/classes/useradd.bbclass:DEPENDS_append = "${USERADDDEPENDS}"

That one is probably ok, it depends what's in ${USERADDDEPENDS}.

> meta/classes/multilib.bbclass:PACKAGEFUNCS_append = "do_package_qa_multilib"

That one is a bit weird.  It looks broken but, presumably, it must work
otherwise someone would have noticed.  I don't know offhand what is
making it work.

> meta/classes/libc-package.bbclass:OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"

That is ok, same as the other OVERRIDES above.

> meta/classes/rootfs_rpm.bbclass:IMAGE_ROOTFS_EXTRA_SPACE_append = "${@base_contains("PACKAGE_INSTALL", "zypper", " + 51200", "" ,d)}"

That is ok.

> meta/classes/cross-canadian.bbclass:PATH_append = ":${TMPDIR}/sysroots/${HOST_ARCH}/${bindir_cross}"

That is ok.

p.




