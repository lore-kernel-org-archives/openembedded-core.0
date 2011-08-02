Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QoJkv-0001L2-9j
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 20:31:53 +0200
Received: by pzk1 with SMTP id 1so68983pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2011 11:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+fI5Pb7LD+jcxS9njWiozscKkYzsF7mMOR+ngKuZ1/4=;
	b=UZP3e/uVQsQEv8Pyx2uPot7E9H2NtYHZ8j0QZW+YUmiWVa3xLsygmOXbI0HdBZd45X
	XC+RGh9U4IuhbmlWIo3OX2/35bBinz0oAyydeVu5zL0CsHzm/bsfv7iklhkDzICm6L9g
	RUe1iAQcXjM1jrLPpZycSs+BG8Ggj1Y2W2pak=
Received: by 10.68.31.199 with SMTP id c7mr4056136pbi.231.1312309650107;
	Tue, 02 Aug 2011 11:27:30 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d1sm72047pbj.88.2011.08.02.11.27.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 11:27:27 -0700 (PDT)
Date: Tue, 2 Aug 2011 11:28:44 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110802182844.GA10977@sakrah.homelinux.org>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
	<fe78c19406d856cb9473e062f1c2905dfe063c2a.1311776363.git.richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <fe78c19406d856cb9473e062f1c2905dfe063c2a.1311776363.git.richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/4] gcc: Drop part of the 64bithack patch which is no longer used
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
X-List-Received-Date: Tue, 02 Aug 2011 18:31:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (27/07/11 15:29), Richard Purdie wrote:
> Since we now handle GLIBC_DYNAMIC_LINKER in gcc-configure-common.inc:
> 
> 's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 SYSTEMLIBS_DIR\2#'
> 
> we can drop the patch which changes a hardcoded value for this.
> 
> No PR bump since there is no code change resulting from this, its just
> a cleanup.
> 
> There is still a valid question over the remainder of this patch and its
> interaction with multilib configurations.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../recipes-devtools/gcc/gcc-4.5.1/64bithack.patch |   13 -------------
>  meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch  |   13 -------------
>  2 files changed, 0 insertions(+), 26 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch
> index 890cc2f..05eafe3 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch
> +++ b/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch
> @@ -20,16 +20,3 @@ Index: gcc-4.5.0/gcc/config/i386/t-linux64
>   
>   LIBGCC = stmp-multilib
>   INSTALL_LIBGCC = install-multilib
> -Index: gcc-4.5.0/gcc/config/i386/linux64.h
> -===================================================================
> ---- gcc-4.5.0.orig/gcc/config/i386/linux64.h	2010-08-10 15:49:06.000000000 +0100
> -+++ gcc-4.5.0/gcc/config/i386/linux64.h	2010-08-10 15:49:16.000000000 +0100
> -@@ -59,7 +59,7 @@
> -    done.  */
> - 
> - #define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> --#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
> -+#define GLIBC_DYNAMIC_LINKER64 "/lib/ld-linux-x86-64.so.2"

This change while I like it that we are moving to use default will now
emit /lib64/ld-linux-x86-64.so.2 into INTERP section but I dont see
a corresponding patch to fix root file systems where the defualt libdir
for x86-64 is changed to be lib64

So this will end up in userspace not booting at all since init wont
find the dynamic linker to start with.

Thanks

-Khem




