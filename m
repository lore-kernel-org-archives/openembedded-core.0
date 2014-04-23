Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8916365D89
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 18:00:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Apr 2014 10:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,913,1389772800"; d="scan'208";a="498258094"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2014 11:00:17 -0700
Message-ID: <5357FFB1.50207@linux.intel.com>
Date: Wed, 23 Apr 2014 11:00:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Christian Charreyre <christian.charreyre@cioinfoindus.fr>, 
	openembedded-core@lists.openembedded.org
References: <1398242491-2373-1-git-send-email-christian.charreyre@cioinfoindus.fr>
In-Reply-To: <1398242491-2373-1-git-send-email-christian.charreyre@cioinfoindus.fr>
Subject: Re: [PATCH] tree: new recipe for version 1.6.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Apr 2014 18:00:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/23/2014 01:41 AM, Christian Charreyre wrote:
> This patch creates the recipe for the command tree, which is a recursive
> directory listing command that produces a depth indented listing of files,
> which is colorized ala dircolors if the LS_COLORS environment variable is
> set and output is to tty
>

Thanks for the submission, a couple of questions and comments below.

Why is this needed in oe-core?  Are there many people interested in it?

Maybe it should start in meta-openemebedded/meta-oe

> Signed-off-by: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
> ---
>   .../tree/tree/0001-adapt-Makefile.patch            |   44 ++++++++++++++++++++
>   meta/recipes-support/tree/tree_1.6.0.bb |   15 +++++++
>   2 files changed, 59 insertions(+)
>   create mode 100644 meta/recipes-support/tree/tree/0001-adapt-Makefile.patch
>   create mode 100644 meta/recipes-support/tree/tree_1.6.0.bb
>
> diff --git a/meta/recipes-support/tree/tree/0001-adapt-Makefile.patch b/meta/recipes-support/tree/tree/0001-adapt-Makefile.patch
> new file mode 100644
> index 0000000..bcc19c9
> --- /dev/null
> +++ b/meta/recipes-support/tree/tree/0001-adapt-Makefile.patch
> @@ -0,0 +1,44 @@
> +Adapt Makefile to cross compilation and tool environment
> +
This 0001-adapt-Makefile.patch should have an Upstream-Status and 
Signed-off-by tags also.

Please see: http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

> +Index: tree-1.6.0/Makefile
> +===================================================================
> +--- tree-1.6.0.orig/Makefile	2011-06-24 16:25:27.000000000 +0200
> ++++ tree-1.6.0/Makefile	2014-04-22 16:53:14.817331834 +0200
> +@@ -16,23 +16,23 @@
> + # along with this program; if not, write to the Free Software
> + # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> +
> +-prefix = /usr
> ++prefix = ${DESTDIR}/usr
> +
> +-CC=gcc
> ++CC ?= gcc
> +
> + VERSION=1.6.0
> + TREE_DEST=tree
> + BINDIR=${prefix}/bin
> + MAN=tree.1
> +-MANDIR=${prefix}/man/man1
> ++MANDIR=${prefix}/share/man/man1
> + OBJS=tree.o unix.o html.o xml.o hash.o color.o
> +
> + # Uncomment options below for your particular OS:
> +
> + # Linux defaults:
> + #CFLAGS=-ggdb -Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> +-CFLAGS=-O4 -Wall  -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> +-LDFLAGS=-s
> ++CFLAGS ?= -O4 -Wall  -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> ++LDFLAGS ?= -s
> +
> + # Uncomment for FreeBSD:
> + #CFLAGS=-O2 -Wall -fomit-frame-pointer
> +@@ -97,7 +97,7 @@
> + 	install -d $(BINDIR)
> + 	install -d $(MANDIR)
> + 	if [ -e $(TREE_DEST) ]; then \
> +-		install -s $(TREE_DEST) $(BINDIR)/$(TREE_DEST); \
> ++		install $(TREE_DEST) $(BINDIR)/$(TREE_DEST); \
> + 	fi
> + 	install doc/$(MAN) $(MANDIR)/$(MAN)
> +
> diff --git a/meta/recipes-support/tree/tree_1.6.0.bb b/meta/recipes-support/tree/tree_1.6.0.bb
> new file mode 100644
> index 0000000..f1ca376
> --- /dev/null
> +++ b/meta/recipes-support/tree/tree_1.6.0.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "a recursive directory listing command."
This is more of a SUMMARY, can you expand of the DESCRIPTIION?

> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
> +
> +SRC_URI = "http://mama.indstate.edu/users/ice/${PN}/src/${PN}-${PV}.tgz \
> +	file://0001-adapt-Makefile.patch \
> +"
> +
> +SRC_URI[md5sum] = "04e967a3f4108d50cde3b4b0e89e970a"
> +SRC_URI[sha256sum] = "4dc470a74880338b01da41701d8db90d0fb178877e526d385931a007d68d7591"
> +
> +inherit autotools
> +
Does it really use autotools?  I think it can just use the standard 
do_compile/do_install and does not require autotools.

> +CFLAGS_append = " -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
>

Thanks again
	Sau!


