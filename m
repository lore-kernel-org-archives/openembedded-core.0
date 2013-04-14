Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1URMy9-0006Jn-CM
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 15:27:53 +0200
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 2B8FF203FF;
	Sun, 14 Apr 2013 09:02:14 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute6.internal (MEProxy); Sun, 14 Apr 2013 09:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=gmMLt4KbmMREpgq0FSOxl4
	Ap2JU=; b=cQUGAwhvYeHZ9Af37mKdXGvaEPw740oq+tHvY/mreWKVa7CYSvu3+H
	aNnaZClWR3eUL2zwexL5UA2sqKbxIXh61AAJH+RILqxzkbW6TBQATN1JIl3cA9Ek
	Lo5shHbOCv8q4O25Foj4Sc6OCYDrDrnrsYeBs2LESmBY4N0AChWLs=
X-Sasl-enc: vFDaVJEmMkyFNiEvMRG2Q9LUrcW1RAbJGEde7rduXzPW 1365944533
Received: from [10.0.1.61] (unknown [46.65.197.81])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4F3A82001BB;
	Sun, 14 Apr 2013 09:02:13 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1365848719.16702.74.camel@ted>
References: <1365848719.16702.74.camel@ted>
Date: Sun, 14 Apr 2013 09:02:12 -0400
Message-ID: <1365944532.5651.12.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-30.el6) 
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: Fix libpng determinism issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Apr 2013 13:27:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Is "libpng" the new canonical name for 1.6?  I assume there was a reason
it was listed last.  It looks like the current logic came from:

https://git.gnome.org/browse/gdk-pixbuf/commit/?id=ddedf5a2c2c63bfe8d6f04376cf2bba215a5eb19

Which is a not very enlightening commit message.  It looks like the
Fedora 18 "libpng" package provides both libpng.pc and libpng15.pc.
RHEL6 has the same except it's libpng12.pc too.  My Ubuntu 12.10 VM has
libpng12 with just libpng12.pc, no libpng.pc.

My main concern with this patch was ensuring that people aren't getting
a suddenly ancient and deprecated libpng, but that seems unlikely, so
unless there are other comments I can take care of turning this into
"git format-patch" style and pushing upstream.

On Sat, 2013-04-13 at 11:25 +0100, Richard Purdie wrote:
> We now have libpng 1.6. If we build libpng12 as well as libpng 1.6, the 1.2
> version gets preferred which is not desirable and does not give deterministic builds.
> 
> We really do want to use libpng since the item in DEPENDS will provide this so
> manipulate the search list so the one we DEPEND on gets chosen. This was the cause of a
> recent autobuilder failure.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
> new file mode 100644
> index 0000000..81a3d06
> --- /dev/null
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
> @@ -0,0 +1,23 @@
> +We now have libpng 1.6. If we build libpng12 as well as libpng 1.6, the 1.2 version gets 
> +preferred which is not desirable and does not give deterministic builds.
> +
> +We really do want to use libpng since the item in DEPENDS will provide this so
> +manipulate the search list so the one we DEPEND on gets chosen.
> +
> +RP 2013/4/13
> +
> +Upstream-Status: Pending [worth discussing at least]
> +
> +Index: gdk-pixbuf-2.26.5/configure.ac
> +===================================================================
> +--- gdk-pixbuf-2.26.5.orig/configure.ac	2013-03-26 15:45:16.594820303 +0000
> ++++ gdk-pixbuf-2.26.5/configure.ac	2013-04-13 10:15:19.241433789 +0000
> +@@ -588,7 +588,7 @@
> + 
> + dnl Test for libpng
> +   if test x$with_libpng != xno && test -z "$LIBPNG"; then
> +-    for l in libpng15 libpng14 libpng12 libpng13 libpng10 libpng ; do
> ++    for l in libpng libpng15 libpng14 libpng12 libpng13 libpng10 ; do
> +       AC_MSG_CHECKING(for $l)
> +       if $PKG_CONFIG --exists $l ; then
> +         AC_MSG_RESULT(yes)
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
> index cc2ea50..b35f7c6 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
> @@ -15,6 +15,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.26/gdk-pixbuf-${
>             file://hardcoded_libtool.patch \
>             file://configure_fix.patch \
>             file://extending-libinstall-dependencies.patch \
> +           file://pngversion.patch \
>             "
>  
>  SRC_URI[md5sum] = "339329e6d619ee3e1cb93979111b04c0"
> 
> 




