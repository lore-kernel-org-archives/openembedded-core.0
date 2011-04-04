Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6j5d-0004iH-As for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 14:41:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34Cd2cM016002
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:39:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15963-02 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 13:38:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34CcrR1015996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:38:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1c63eb92fdf8892406a03e88705e8f08b24b40a7.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<1c63eb92fdf8892406a03e88705e8f08b24b40a7.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 13:38:50 +0100
Message-ID: <1301920730.24596.354.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 29/46] attr: Fix compilation on uclibc
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
X-List-Received-Date: Mon, 04 Apr 2011 12:41:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 21:29 -0700, Khem Raj wrote:
> It needs -lintl added to LDFLAGS for uclibc
> 
> inherit gettext class instead of adding gettext to DEPENDS directly
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/attr/attr.inc   |    8 ++++++++
>  meta/recipes-support/attr/ea-acl.inc |    4 +---
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
> index c110340..3f64ade 100644
> --- a/meta/recipes-support/attr/attr.inc
> +++ b/meta/recipes-support/attr/attr.inc
> @@ -20,3 +20,11 @@ do_install_append() {
>  	sed -i ${D}${libdir}/libattr.la -e \
>  	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
>  }
> +do_configure_append() {
> +        # gettext hack
> +        echo "#define _(str) str" >> ${S}/include/config.h
> +}

No details in the commit log about what this does? It looks likely to
break (e)glibc systems? Perhaps make it libc specific to make it clear
who is using it...

> +# Only append ldflags for target recipe
> +LDFLAGS_libc-uclibc += "${@['', '-lintl']['${PN}' == '${BPN}']}"
> +
> diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
> index bc93107..a09c31c 100644
> --- a/meta/recipes-support/attr/ea-acl.inc
> +++ b/meta/recipes-support/attr/ea-acl.inc
> @@ -1,11 +1,9 @@
>  # this build system is mostly shared by attr and acl
>  
> -DEPENDS =+ "gettext"
> -
>  SRC_URI += "file://relative-libdir.patch;striplevel=0 \
>              file://no-fixed-prog-path.patch"
>  
> -inherit autotools
> +inherit autotools gettext
>  
>  # the package comes with a custom config.h.in, it cannot be
>  # overwritten by autoheader




