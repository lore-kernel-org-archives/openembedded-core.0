Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QS814-0007bT-Sb
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 15:32:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p52DTb3v010758
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 06:29:37 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 2 Jun 2011 06:29:37 -0700
Message-ID: <4DE79040.4020709@windriver.com>
Date: Thu, 2 Jun 2011 08:29:36 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1307008107.2529.175.camel@phil-desktop>
In-Reply-To: <1307008107.2529.175.camel@phil-desktop>
Subject: Re: [PATCH] rpm: avoid dependency on perl and python for -native build
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
X-List-Received-Date: Thu, 02 Jun 2011 13:32:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/2/11 4:48 AM, Phil Blundell wrote:
> Update override naming (_native -> _virtclass-native) to disable perl
> and python bindings when building native rpm, and adjust the DEPENDS to
> match.
> 
> Perl bindings were, in fact, already disabled for both native and target
> builds so it's only the python ones that have really changed.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>

Acked-by: Mark Hatle <mark.hatle@windriver.com>

> ---
>  meta/recipes-devtools/rpm/rpm_5.4.0.bb |   10 ++++++----
>  1 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> index d3f85f2..5c30f1c 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> @@ -42,8 +42,10 @@ HOMEPAGE = "http://rpm5.org/"
>  LICENSE = "LGPL 2.1"
>  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>  
> -DEPENDS = "bzip2 zlib python perl db openssl elfutils expat libpcre attr acl popt"
> -PR = "r16"
> +rpmdeps = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt"
> +DEPENDS = "${rpmdeps} python perl"
> +DEPENDS_virtclass-native = "${rpmdeps}"
> +PR = "r17"
>  
>  # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
>  # in order to extract the distribution SRPM into a format we can extract...
> @@ -92,7 +94,7 @@ WITH_PYTHON = "	--with-python=${PYTHON_BASEVERSION} \
>  		--without-pythonembed \
>  	      "
>  
> -WITH_PYTHON_native = " --without-python"
> +WITH_PYTHON_virtclass-native = " --without-python"
>  
>  # Perl modules are not built, but they could be enabled fairly easily
>  # the perl module creation and installation would need to be patched.
> @@ -100,7 +102,7 @@ WITH_PYTHON_native = " --without-python"
>  #WITH_PERL = "	--with-perl --without-perlembed"
>  WITH_PERL = "	--without-perl"
>  
> -WITH_PERL_native = " --without-perl"
> +WITH_PERL_virtclass-native = " --without-perl"
>  
>  WITH_DB = "--with-db --with-dbsql --without-db-tools-integrated --without-sqlite"
>  



