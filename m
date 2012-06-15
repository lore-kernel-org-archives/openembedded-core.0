Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SfW2Y-0001My-IL for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 14:54:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5FChbCb013498
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 13:43:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13116-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 13:43:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5FChUov013491
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 13:43:31 +0100
Message-ID: <1339764210.24333.114.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jun 2012 13:43:30 +0100
In-Reply-To: <1f0884d8428c923c1b18670877c85cb3dc09cfda.1339740433.git.raj.khem@gmail.com>
References: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
	<1f0884d8428c923c1b18670877c85cb3dc09cfda.1339740433.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/9] rpm: Use link time check for libssp
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
X-List-Received-Date: Fri, 15 Jun 2012 12:54:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-14 at 23:12 -0700, Khem Raj wrote:
> -fstack-protector needs libssp to link with
> so when checking for this option support we
> need to find if libssp is staged in root file
> system
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../rpm/rpm/fstack-protector-configure-check.patch |   13 +++++++++++++
>  meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 +
>  2 files changed, 14 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
> 
> diff --git a/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch b/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
> new file mode 100644
> index 0000000..84d0430
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch


This is a rather subtle patch with no header information (author,
explaination, upstream status).

Cheers,

Richard

> @@ -0,0 +1,13 @@
> +Index: rpm-5.4.0/configure.ac
> +===================================================================
> +--- rpm-5.4.0.orig/configure.ac	2012-06-01 11:41:19.741480143 -0700
> ++++ rpm-5.4.0/configure.ac	2012-06-01 11:41:51.773481676 -0700
> +@@ -193,7 +193,7 @@
> +  my_save_cflags="$CFLAGS"
> +  CFLAGS=$c
> +  AC_MSG_CHECKING([whether GCC supports $c])
> +- AC_COMPILE_IFELSE([AC_LANG_PROGRAM([])],
> ++ AC_LINK_IFELSE([AC_LANG_PROGRAM([])],
> +     [AC_MSG_RESULT([yes])]
> +     [my_cflags=$c],
> +     [AC_MSG_RESULT([no])]
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> index 404916a..ccf015a 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -74,6 +74,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
>  	   file://rpm-pkgconfigdeps.patch \
>  	   file://uclibc-support.patch \
>  	   file://rpmatch.patch \
> +	   file://fstack-protector-configure-check.patch \
>  	  "
>  
>  SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"




