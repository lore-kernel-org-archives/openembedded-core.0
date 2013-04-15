Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1URiXV-0006Dm-I4
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 14:29:46 +0200
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 7448B20A0A;
	Mon, 15 Apr 2013 08:12:14 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 15 Apr 2013 08:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version; s=smtpout; bh=PCICnz
	ph0v9AX14Q0jOJ9G70shk=; b=W2ded+xayvajIM+1S9IjX90OjimbIiUaku9ixW
	NXtmtCQlEeKs9NZxCJELpQvYGwaLxVDGnKGbNX482wQIn8RlXpYhXJAoT9xSOhZx
	CMin1YSCAM8WERoJ41hZuurHSvBLTS8z25bCMDngwR0Xv1zh/uQAKpyKIMjTiXYP
	Qs6bQ=
X-Sasl-enc: YXA/D0SghxtstF4jscqpj/T9zanvQC9sVGF5CE+DS9Xd 1366027934
Received: from [10.0.0.87] (unknown [46.65.197.129])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8FFFDC80005;
	Mon, 15 Apr 2013 08:12:13 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1366025504.8670.30.camel@ted>
References: <1365848719.16702.74.camel@ted>
	<1365944532.5651.12.camel@localhost>  <1365953596.8670.9.camel@ted>
	<1366020508.2896.16.camel@localhost>  <1366025504.8670.30.camel@ted>
Date: Mon, 15 Apr 2013 08:12:12 -0400
Message-ID: <1366027932.32176.4.camel@localhost>
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
X-List-Received-Date: Mon, 15 Apr 2013 12:29:50 -0000
X-Groupsio-MsgNum: 37938
Content-Type: multipart/mixed; boundary="=-COyJxeLSl0ox1FCIqNVg"

--=-COyJxeLSl0ox1FCIqNVg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-15 at 12:31 +0100, Richard Purdie wrote:

> It will make our builds work again for now until the next time someone
> upgrades libpng and and then it will potentially silently start using an
> old version in some builds :(.

So something like the attached on top of the previous patch?

If this looks good I'll push both to master.


--=-COyJxeLSl0ox1FCIqNVg
Content-Disposition: attachment; filename="0001-build-drop-libpng-from-detected-list.patch"
Content-Type: text/x-patch; name="0001-build-drop-libpng-from-detected-list.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 91074d01a0e2b4508f7f253f1e0a7669363cb128 Mon Sep 17 00:00:00 2001
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 15 Apr 2013 08:06:45 -0400
Subject: [PATCH] build: drop "libpng" from detected list

This gives us an arbitrary version depending on the build root, and we
may not be upwards compatible with future versions.  Or it's possible
that the ancient (but LSB mandated) 1.2 claims the "libpng.pc" name.

Signed-off-by: Colin Walters <walters@verbum.org>
---
 configure.ac |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configure.ac b/configure.ac
index 106fab1..5efc1b6 100644
--- a/configure.ac
+++ b/configure.ac
@@ -586,7 +586,7 @@ fi
 
 dnl Test for libpng
   if test x$with_libpng != xno && test -z "$LIBPNG"; then
-    for l in libpng16 libpng15 libpng14 libpng12 libpng13 libpng10 libpng; do
+    for l in libpng16 libpng15 libpng14 libpng12 libpng13 libpng10; do
       AC_MSG_CHECKING(for $l)
       if $PKG_CONFIG --exists $l ; then
         AC_MSG_RESULT(yes)
-- 
1.7.1


--=-COyJxeLSl0ox1FCIqNVg--
