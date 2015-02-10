Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A473D65CF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 19:59:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1AJxF3S026887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 11:59:16 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 10 Feb 2015 11:59:15 -0800
Message-ID: <54DA6312.5090304@windriver.com>
Date: Tue, 10 Feb 2015 13:59:14 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1423595946-25011-1-git-send-email-paul.gortmaker@windriver.com>
	<1423595946-25011-3-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <1423595946-25011-3-git-send-email-paul.gortmaker@windriver.com>
Subject: Re: [PATCH 2/3] coreutils: import prebuilt manpages from Gentoo
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
X-List-Received-Date: Tue, 10 Feb 2015 19:59:20 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 2/10/15 1:19 PM, Paul Gortmaker wrote:
> As can be seen here:
> 
> http://lists.gnu.org/archive/html/coreutils/2014-11/msg00001.html
> 
> other people have run into the headache of trying to cross compile
> coreutils, with the "help2man" problem (assumes host can run the
> target binaries with "--help" arg to collect data for manpage.)
> 
> And since "current wisdom is this is working as intended" we are
> largely left with no choice but to use the same solution and
> abandon trying to generate the man pages at build time.  So here
> we import prebuilt manpages.
> 
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  meta/recipes-core/coreutils/coreutils_8.23.bb | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/coreutils/coreutils_8.23.bb b/meta/recipes-core/coreutils/coreutils_8.23.bb
> index be68a310311a..5454a43527cc 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.23.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.23.bb
> @@ -12,14 +12,17 @@ DEPENDS_class-native = ""
>  
>  inherit autotools gettext texinfo
>  
> -SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
> +SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
> +           http://distfiles.gentoo.org/distfiles/${BP}-man.tar.xz;name=manpages \
>             file://man-decouple-manpages-from-build.patch \
>             file://remove-usr-local-lib-from-m4.patch \
>             file://fix-selinux-flask.patch \
>            "
>  
> -SRC_URI[md5sum] = "abed135279f87ad6762ce57ff6d89c41"
> -SRC_URI[sha256sum] = "ec43ca5bcfc62242accb46b7f121f6b684ee21ecd7d075059bf650ff9e37b82d"
> +SRC_URI[tarball.md5sum] = "abed135279f87ad6762ce57ff6d89c41"
> +SRC_URI[tarball.sha256sum] = "ec43ca5bcfc62242accb46b7f121f6b684ee21ecd7d075059bf650ff9e37b82d"
> +SRC_URI[manpages.md5sum] = "ce49bc8360e16afe67581d136606efc7"
> +SRC_URI[manpages.sha256sum] = "d1b16e74b3dba4f313aeebae2c69da205f7d2e6e1c2aa8d39026c860d314ecca"
>  
>  EXTRA_OECONF_class-native = "--without-gmp"
>  EXTRA_OECONF_class-target = "--enable-install-program=arch --libexecdir=${libdir}"
> @@ -53,6 +56,8 @@ sbindir_progs= "chroot"
>  # directory.
>  acpaths = "-I ./m4"
>  
> +FILES_${PN}-doc += "${mandir}"
> +
>  # Deal with a separate builddir failure if src doesn't exist when creating version.c/version.h
>  do_compile_prepend () {
>  	mkdir -p ${B}/src
> @@ -71,6 +76,10 @@ do_install_append() {
>  	# in update-alternatives to fail, therefore use lbracket - the name used
>  	# for the actual source file.
>  	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${BPN}
> +
> +	# prebuilt man pages
> +	install -d ${D}/${mandir}/man1
> +	install -t ${D}/${mandir}/man1 ${S}/man/*.1
>  }

One suggestion, in order for the man pages to match the "alternative names", and
also avoid conflicts with other potential suppliers.. I'd suggest enablign the
update-alternatives approach for the man pages as well.  Also rename the '[.1'
to 'lbracket.1.${BPN}' as part of that.

But the approach is correct, and I'm fine with this as-is if the community isn't
worried about man page clashes..

--Mark

>  do_install_append_class-native(){
> 


