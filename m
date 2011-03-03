Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Pv7Kq-0007nc-Gx for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 13:08:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23C7D5R008329
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 12:07:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07723-08 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2011 12:07:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23C76IW008323
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 12:07:07 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1299135167-18330-7-git-send-email-raj.khem@gmail.com>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-7-git-send-email-raj.khem@gmail.com>
Date: Thu, 03 Mar 2011 12:07:01 +0000
Message-ID: <1299154021.26736.12912.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv3 6/6] rpm: Fix linking error encountered in rpm-native
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
X-List-Received-Date: Thu, 03 Mar 2011 12:08:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Khem,

On Wed, 2011-03-02 at 22:52 -0800, Khem Raj wrote:
> * This patch passes the correct LDFLAGS to account for
>   additional dependencies of librpmio on libbeecrypt and libsyck
>   and hence fixes the build error.

This change is fine in itself but I'm going to be a little critical here
since we're just getting going and I want to start as we mean to go on.

Could you add a description of the problem and why the fix is needed to
the patch header please, also adding your name and a date.

The reason why is so in six months time, someone looking at this can
work out a) why the patch is needed, b) Who wrote it so they have some
idea where it came from and who to talk to if they have a question and
c) How long the issue has been around for.

I appreciate some of this info can be got through the SCM but I've yet
to see a good reason for not including it directly in the patch header.

Cheers,

Richard

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |   13 +++++++++++++
>  meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 ++-
>  2 files changed, 15 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
> 
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
> new file mode 100644
> index 0000000..347d976
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
> @@ -0,0 +1,13 @@
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




