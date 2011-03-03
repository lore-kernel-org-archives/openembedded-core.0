Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PvECp-0006TN-Al
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 20:28:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p23JRP6W001398
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 11:27:25 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 3 Mar 2011 11:27:24 -0800
Message-ID: <4D6FEB9B.9050708@windriver.com>
Date: Thu, 3 Mar 2011 13:27:23 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.14) Gecko/20110221 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1299168546-20430-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1299168546-20430-1-git-send-email-raj.khem@gmail.com>
X-Originating-IP: [172.25.36.227]
Subject: Re: [PATCHv4 6/6] rpm: Fix linking error encountered in rpm-native
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
X-List-Received-Date: Thu, 03 Mar 2011 19:28:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

This looks good to me.  I'll try to push it back upstream as well.

--Mark

On 3/3/11 10:09 AM, Khem Raj wrote:
> * This patch passes the correct LDFLAGS to account for
>   additional dependencies of librpmio on libbeecrypt and libsyck
>   and hence fixes the build error.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |   24 ++++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
>  2 files changed, 26 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
> 
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
> new file mode 100644
> index 0000000..9e7bba0
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
> @@ -0,0 +1,24 @@
> +Source: None
> +Status: Needs to go Upstream
> +Author: Khem Raj <raj.khem@gmail.com>
> +Date: 2011-03-03
> +Description:
> +This patch fixes build issue found when compiling rpm-natibe on ubuntu
> +11.04-alpha. Problem is that linker does not get correct set of dependent
> +libraries when linking mtree binary which results in undefined symbols
> +in librpmio.so. This patch adds correct flags to mtree_LDADD to account
> +for rpmio deps
> +
> +Index: rpm-5.4.0/tools/Makefile.am
> +===================================================================
> +--- rpm-5.4.0.orig/tools/Makefile.am
> ++++ rpm-5.4.0/tools/Makefile.am
> +@@ -169,7 +169,7 @@ grep_LDADD =		$(RPMIO_LDADD_COMMON)
> + 
> + mtree_SOURCES =		rpmmtree.c
> + mtree_LDFLAGS =		@LDFLAGS_STATIC@ $(LDFLAGS)
> +-mtree_LDADD =		$(RPM_LDADD_COMMON)
> ++mtree_LDADD =		$(RPMIO_LDADD_COMMON)
> + 
> + rpmrepo_SOURCES =	rpmrepo.c
> + rpmrepo_CPPFLAGS =	$(AM_CPPFLAGS) -I$(top_srcdir)/scripts -I$(top_builddir)/scripts $(CPPFLAGS)
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> index 0003f48..3704816 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> @@ -43,7 +43,7 @@ LICENSE = "LGPL 2.1"
>  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>  
>  DEPENDS = "bzip2 zlib python perl db openssl elfutils expat libpcre attr acl popt"
> -PR = "r13"
> +PR = "r14"
>  
>  # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
>  # in order to extract the distribution SRPM into a format we can extract...
> @@ -56,6 +56,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
>  	   file://rpm-showrc.patch \
>  	   file://rpm-nofsync.patch \
>  	   file://rpm-solvedb.patch \
> +	   file://rpm-tools-mtree-LDFLAGS.patch \
>  	  "
>  
>  #           file://hdraddorappend.patch \



