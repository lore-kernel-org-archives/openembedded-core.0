Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1ShJyS-0004bb-En
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 14:25:28 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:36890 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1ShJo5-0005zD-1i for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 08:14:45 -0400
Date: Wed, 20 Jun 2012 08:14:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1206200807090.4904@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: oddities related to "_append" and "_prepend" in oe-core
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
X-List-Received-Date: Wed, 20 Jun 2012 12:25:28 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  inspired by richard purdie's correction of my original patch, i did
a quick grep to see if i could find any oddities related, first, to
uses of "_append"; specifically, where the string being appended did
*not* start with a blank.  there are certainly proper examples of
that, say when one is appending to a path, or appending to a filename,
and so on where a blank would be *wrong*.

  but there also appear to be "errors", so here's the grep command and
its output:

$ grep -r "_append = \"[^ ]" *
meta/conf/bitbake.conf:DISTRO_FEATURES_append = "${@oe.utils.distro_features_backfill(d)}"
meta/recipes-devtools/gdb/gdb-cross-canadian.inc:EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
meta/recipes-devtools/prelink/prelink_git.bb:OVERRIDES_append = ":${TARGET_OS_ORIG}"
meta/recipes-devtools/gcc/gcc-cross-intermediate.inc:CROSS_TARGET_SYS_DIR_append = ".${PN}"
meta/recipes-devtools/gcc/gcc-cross-initial.inc:CROSS_TARGET_SYS_DIR_append = ".${PN}"
meta/recipes-core/uclibc/uclibc.inc:FILES_${PN}-dev_append = "\
meta/recipes-core/base-files/base-files_3.0.14.bb:docdir_append = "/${P}"
meta/recipes-core/eglibc/eglibc_2.15.bb:PR_append = "+svnr${SRCPV}"
meta/recipes-core/eglibc/eglibc_2.13.bb:PR_append = "+svnr${SRCPV}"
meta/classes/autotools.bbclass:# EXTRA_OECONF_append = "${@autotools_set_crosscompiling(d)}"
meta/classes/useradd.bbclass:DEPENDS_append = "${USERADDDEPENDS}"
meta/classes/multilib.bbclass:PACKAGEFUNCS_append = "do_package_qa_multilib"
meta/classes/libc-package.bbclass:OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
meta/classes/rootfs_rpm.bbclass:IMAGE_ROOTFS_EXTRA_SPACE_append = "${@base_contains("PACKAGE_INSTALL", "zypper", " + 51200", "" ,d)}"
meta/classes/cross-canadian.bbclass:PATH_append = ":${TMPDIR}/sysroots/${HOST_ARCH}/${bindir_cross}"
$

  at the very least, the second line of output above seems incorrect:

meta/recipes-devtools/gdb/gdb-cross-canadian.inc:EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"

that *definitely* looks like it wants a leading blank, no?

  one can do the same with "_prepend" and missing trailing blanks, but
it's not quite as pleasant and i didn't see anything obviously amiss
there.

  thoughts?  longer post on appends and conditional appends coming
shortly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


