Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1URgbl-0001Au-LA
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:26:02 +0200
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 0555E20B13;
	Mon, 15 Apr 2013 06:08:31 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute5.internal (MEProxy); Mon, 15 Apr 2013 06:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version; s=smtpout; bh=byFODz
	2l6jITJrMbWYnr+jNarSE=; b=Q0DXjY3eEdtUltLahoJ4a9hKwuvfgPN7mozg2o
	IJltK6nSe+Xs7OtYe0UbGeArahTnp86+sHnZA0AsSH7dzB/m7tQG4tvscERzylJM
	vSJAwRZ9oM+KpX8jWJLOpFX8rrtW6m69xZ4KCVNoQ4yJjdOKGBtG5ajRf9YBlCm/
	v9lOU=
X-Sasl-enc: h4AH84PD8RLzIhAma6eUBtQLhoOJVCmi/HJs+9h50EZi 1366020510
Received: from [10.0.0.87] (unknown [46.65.197.81])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1B622C80005;
	Mon, 15 Apr 2013 06:08:30 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1365953596.8670.9.camel@ted>
References: <1365848719.16702.74.camel@ted>
	<1365944532.5651.12.camel@localhost>  <1365953596.8670.9.camel@ted>
Date: Mon, 15 Apr 2013 06:08:28 -0400
Message-ID: <1366020508.2896.16.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-30.el6) 
Cc: mclasen@redhat.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 15 Apr 2013 10:26:15 -0000
X-Groupsio-MsgNum: 37898
Content-Type: multipart/mixed; boundary="=-itZjtzzUMHnVZ/JP7/AI"

--=-itZjtzzUMHnVZ/JP7/AI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-04-14 at 16:33 +0100, Richard Purdie wrote:
> On Sun, 2013-04-14 at 09:02 -0400, Colin Walters wrote:
> The more interesting change is:
> 
> https://git.gnome.org/browse/gdk-pixbuf/commit/configure.ac?id=d430bc4df3314a88cd538474d26ff7764d1f408c
> 
> and following that to the bugzilla 'For this to make sense, I changed
> the order so that a version specific dep, such as libpng15 or
> libpng12,
> is found before just "libpng".'
> 
> I'm not sure I entirely follow that logic.

I added Matthias to CC as he touched this last then.

> I think the intent of the symlink is to provide the system with a
> default libpng to use in the absence of a specific version requirement.
> As the code stands today, each time a new libpng comes out, gdk-pixbuf
> will need changes before it will be able to use it. 

Right, we need configure.ac changes, but the rationale behind that is
that we'd also need *code* changes for each new major version of libpng.
But it sounds like what you're saying is that gdk-pixbuf compiles and
operates correctly with 1.6?  If that's the case, then the least
invasive change here is to simply add 1.6.

Blah, I tried changing the gnome-ostree build to fetch libpng's v1.6.1
git tag to test, but it hard requires Automake 1.13.

Anyways, if it works (looks like the latest oe-core has it), then
what about the attached?

> In the meantime, it
> will potentially link against something old, e.g. 1.2, since 1.2 is in
> the LSB 4.X spec so most LSB like systems would have 1.6 and 1.2.
> 
> If we can justify changing this upstream, that would be great :). It may
> be worth adding libpng16 into the list too so everything is covered too.

At this point I'm hoping the parade of libpng versions will
settle down, so hopefully no further tweaking of the configure script or
code will be required...



--=-itZjtzzUMHnVZ/JP7/AI
Content-Disposition: attachment; filename="0001-build-We-also-support-libpng16.patch"
Content-Type: text/x-patch; name="0001-build-We-also-support-libpng16.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 829379cfa2b48e966125df2d070d2af40cb3f990 Mon Sep 17 00:00:00 2001
From: Colin Walters <walters@verbum.org>
Date: Mon, 15 Apr 2013 05:59:09 -0400
Subject: [PATCH] build: We also support libpng16

See http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/038321.html
---
 configure.ac |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configure.ac b/configure.ac
index 8ec8b1f..106fab1 100644
--- a/configure.ac
+++ b/configure.ac
@@ -586,7 +586,7 @@ fi
 
 dnl Test for libpng
   if test x$with_libpng != xno && test -z "$LIBPNG"; then
-    for l in libpng15 libpng14 libpng12 libpng13 libpng10 libpng ; do
+    for l in libpng16 libpng15 libpng14 libpng12 libpng13 libpng10 libpng; do
       AC_MSG_CHECKING(for $l)
       if $PKG_CONFIG --exists $l ; then
         AC_MSG_RESULT(yes)
-- 
1.7.1


--=-itZjtzzUMHnVZ/JP7/AI--
